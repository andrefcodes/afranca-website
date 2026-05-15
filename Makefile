SHELL := /bin/bash

.PHONY: post page rss-post commit build deploy

CLI_TITLE := $(strip $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS)))
SITE_URL := $(shell awk -F '=' '/^[[:space:]]*baseURL[[:space:]]*=/ {gsub(/^[[:space:]]+|[[:space:]]+$$/, "", $$2); gsub(/^"|"$$/, "", $$2); print $$2; exit}' hugo.toml)

slugify = $$(echo "$(1)" | tr '[:upper:]' '[:lower:]' | sed -E "s/'//g" | sed -E 's/[^a-z0-9]+/-/g' | sed -E 's/^-+|-+$$//g')

open_in_editor = \
	zed "$(1)" >/dev/null 2>&1 || true

post:
	@if [ -n "$(CLI_TITLE)" ]; then title="$(CLI_TITLE)"; else read -r -p "Title: " title; fi; \
	slug=$(call slugify,$$title); \
	year=$$(date +%Y); \
	file="content/posts/$$year/$$slug.md"; \
	hugo new "$$file"; \
	if [ -f "$$file" ]; then \
	  tmp=$$(mktemp); \
	  awk -v t="$$title" 'BEGIN{done=0} /^title:[[:space:]]*/ && !done {print "title: \"" t "\""; done=1; next} {print}' "$$file" > "$$tmp" && mv "$$tmp" "$$file"; \
	fi; \
	$(call open_in_editor,$$file)

page:
	@if [ -n "$(CLI_TITLE)" ]; then title="$(CLI_TITLE)"; else read -r -p "Title: " title; fi; \
	slug=$(call slugify,$$title); \
	file="content/pages/$$slug.md"; \
	hugo new "$$file"; \
	if [ -f "$$file" ]; then \
	  tmp=$$(mktemp); \
	  awk -v t="$$title" 'BEGIN{done=0} /^title:[[:space:]]*/ && !done {print "title: \"" t "\""; done=1; next} {print}' "$$file" > "$$tmp" && mv "$$tmp" "$$file"; \
	fi; \
	$(call open_in_editor,$$file)

rss-post:
	@if [ -n "$(CLI_TITLE)" ]; then title="$(CLI_TITLE)"; else read -r -p "Title: " title; fi; \
	slug=$(call slugify,$$title); \
	year=$$(date +%Y); \
	file="content/rss-only/$$year/$$slug.md"; \
	hugo new "$$file"; \
	if [ -f "$$file" ]; then \
	  tmp=$$(mktemp); \
	  awk -v t="$$title" 'BEGIN{done=0} /^title:[[:space:]]*/ && !done {print "title: \"" t "\""; done=1; next} {print}' "$$file" > "$$tmp" && mv "$$tmp" "$$file"; \
	fi; \
	$(call open_in_editor,$$file)

build:
	@echo "Building site..."; \
	[ -d public ] && rm -rf public || true; \
	[ -d resources ] && rm -rf resources || true; \
	hugo --minify --cleanDestinationDir && echo "✓ Site was built and is ready to be deployed." || (echo "✗ Build failed."; exit 1)

commit:
	@tracked=$$(git diff --name-only -- content/posts content/pages content/rss-only); \
	untracked=$$(git ls-files --others --exclude-standard -- content/posts content/pages content/rss-only); \
	files=$$(printf "%s\n%s\n" "$$tracked" "$$untracked" | sed '/^$$/d' | sort -u); \
	if [ -z "$$files" ]; then \
	  echo "No changed files in content/posts, content/pages, or content/rss-only."; \
	  exit 0; \
	fi; \
	for f in $$files; do \
	  [ -f "$$f" ] || continue; \
	  kind="post"; \
	  case "$$f" in \
	    content/pages/*) kind="page" ;; \
	    content/rss-only/*) kind="rss-only post" ;; \
	  esac; \
	  title=$$(awk -F': ' 'tolower($$1)=="title" {print $$2; exit}' "$$f" | sed -E "s/^['\"]?(.*?)['\"]?$$/\1/"); \
	  if [ -z "$$title" ]; then \
	    title=$$(basename "$$f" .md); \
	  fi; \
	  git add "$$f"; \
	  git commit -m "add new $$kind $$title." || exit 1; \
	done; \
	git push

deploy:
	@echo "Deploying with Wrangler (npx wrangler deploy)..."; \
	if [ -z "$(SITE_URL)" ]; then baseurl="(unknown)"; else baseurl="$(SITE_URL)"; fi; \
	current_hugo=$$(hugo version | sed -nE 's/.*v([0-9]+\.[0-9]+\.[0-9]+).*/\1/p' | head -n1); \
	configured_hugo=$$(awk -F '"' '/^[[:space:]]*HUGO_VERSION[[:space:]]*=/{print $$2; exit}' wrangler.toml); \
	if [ -z "$$current_hugo" ]; then \
	  echo "✗ Could not determine local Hugo version."; exit 1; \
	fi; \
	if [ -z "$$configured_hugo" ]; then \
	  echo "✗ Could not find HUGO_VERSION in wrangler.toml."; exit 1; \
	fi; \
	latest_hugo=$$(printf "%s\n%s\n" "$$configured_hugo" "$$current_hugo" | sort -V | tail -n1); \
	if [ "$$latest_hugo" = "$$current_hugo" ] && [ "$$current_hugo" != "$$configured_hugo" ]; then \
	  echo "Updating wrangler.toml HUGO_VERSION from $$configured_hugo to $$current_hugo..."; \
	  tmp=$$(mktemp); \
	  awk -v v="$$current_hugo" 'BEGIN{updated=0} /^[[:space:]]*HUGO_VERSION[[:space:]]*=/{print "HUGO_VERSION = \"" v "\""; updated=1; next} {print} END{if(!updated) exit 1}' wrangler.toml > "$$tmp" && mv "$$tmp" wrangler.toml || { rm -f "$$tmp"; echo "✗ Failed to update wrangler.toml."; exit 1; }; \
	fi; \
	npx wrangler deploy; \
	if [ $$? -eq 0 ]; then \
	  echo "✓ Site was deployed and can be accessed at $$baseurl."; \
	else \
	  echo "✗ Deploy failed."; exit 1; \
	fi

%:
	@:
