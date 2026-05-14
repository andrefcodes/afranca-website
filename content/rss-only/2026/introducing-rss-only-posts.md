---
title: "Introducing RSS-Only Posts"
date: 2026-04-29T12:00:00-03:00
lastmod: 2026-04-29T12:00:00-03:00
slug: "introducing-rss-only-posts"
description: "A new feature on the blog: RSS-only posts. Content for subscribers exclusively, with a technical breakdown of how it was implemented in Hugo."
image: ""
draft: false
featured: false
tags: ["rss-only"]
build:
  list: local
  render: link
  publishResources: false
---

{{< rss-only-notice >}}

I've just added a new feature to the blog: **RSS-only posts**. These are pieces of content that appear exclusively in your feed reader but are never rendered as public web pages.

<!--more-->

This post itself is an RSS-only post that you're reading it in your feed, not on the website.

## Why did I add this feature?

Because RSS is great, so are you for using it.

I also wanted a way to share quick thoughts, and experimental ideas with RSS subscribers.

## How does it work?

### Summary:

1. Put `rss-only` content under `content/rss-only/` (I use year subfolders like `2026/`).
2. Use an `archetypes/rss-only.md` that sets `build.render: link` so Hugo processes the content but does not emit an HTML file.
3. Update the feed template to include `rss-only` pages.
4. [Optional] Update tag/taxonomy templates to exclude `rss-only` items from public tag counts and listings.

### Archetype

`archetypes/rss-only.md` should include the build directives. Example:

```yaml
---
title: "{{ replace .File.ContentBaseName "-" " " | title }}"
date: {{ dateFormat "2006-01-02T15:04:05-03:00" .Date }}
lastmod: {{ dateFormat "2006-01-02T15:04:05-03:00" .Date }}
slug: "{{ .File.ContentBaseName }}"
description: ""
image: ""
draft: false
featured: false
tags: []
build:
  list: local
  render: link
  publishResources: false
---
```

`build.render: link` is the key: it prevents HTML output while keeping the content available to templates and the feed.

### Feed template

If you want RSS-only posts to appear in your feed alongside regular posts, update your feed template (for example `layouts/index.atom.xml`) to include them explicitly. For example, to include only `posts` and `rss-only`:

```gotemplate
{{/* include posts + rss-only only */}}
{{ $types := slice "posts" "rss-only" }}
{{ range (where .Site.RegularPages "Type" "in" $types) | sort "Date" "desc" }}
  <entry>
    <!-- standard feed entry markup -->
  </entry>
{{ end }}
```

I use `.Site.RegularPages` and filter by `Type` to make sure only the content types I want are included.

## [Optional] Excluding `rss-only` from tag counts and tag pages

Hugo's taxonomies (tags) are built from all content that declares tags. You cannot stop Hugo from creating the taxonomy entries, but you can exclude `rss-only` items when rendering tag lists and tag pages. Below are templates you can drop into your theme to achieve that.

### 1) Terms/Tag index (list of all tags)

If you render a tag cloud or list of tags (commonly `layouts/_default/terms.html` or a partial), compute counts while excluding `rss-only` pages:

```go
{{ range $name, $pages := .Site.Taxonomies.tags }}
  {{ $public := where $pages "Type" "ne" "rss-only" }}
  {{ $count := len $public }}
  {{ if gt $count 0 }}
    <a href="{{ (path.Join "/tags/" $name | urlize) | relURL }}">{{ $name }} ({{ $count }})</a>
  {{ end }}
{{ end }}
```

This shows only tags that have at least one non-`rss-only` page and uses the filtered count.

### 2) Single tag page (list posts for a tag)

On the tag detail page (`layouts/_default/taxonomy.html` or your tag template), filter out `rss-only` pages before rendering the list:

```gotemplate
{{ $pages := where .Pages "Type" "ne" "rss-only" | sort "Date" "desc" }}
{{ if eq (len $pages) 0 }}
  <p>No public posts for this tag.</p>
{{ else }}
  {{ range $pages }}
    <!-- render excerpt/summary -->
  {{ end }}
{{ end }}
```

You can also choose to return a 404 if `len $pages == 0`, depending on how you want empty tag pages to behave.

### 3) Counting tags elsewhere

Anywhere you compute or display tag counts, apply the same `where "Type" "ne" "rss-only"` filter to avoid counting feed-only posts.

## Notes and caveats

- Hugo will still include tags in `.Site.Taxonomies` if any content (including `rss-only`) declares them. The approach above hides those tags from public lists and prevents them from contributing to counts.
- If you want tags never to be built at all, you'd need a preprocessing step (e.g., a short script that removes `tags` from front matter for `rss-only` items before `hugo` runs), but in most cases filtering in templates is cleaner.