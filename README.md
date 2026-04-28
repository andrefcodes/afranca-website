# afranca.com.br

Source repository for my personal website, built with [Hugo](https://gohugo.io/).

## Notice

This repository is shared for learning and inspiration.

Please do **not** clone and reuse this website as-is.

If you use ideas from this project, replace all personal information, branding, content, metadata, media, and configuration with your own.

## Overview

This repository contains:

- Site configuration and templates
- Markdown content (posts and pages)
- Custom styles and JavaScript
- Generated static output

The site is focused on a fast, lightweight, and accessible reading experience.

## Tech Stack

- **Static site generator:** Hugo
- **Deployment tooling:** [Wrangler](https://github.com/cloudflare/workers-sdk) (used to build/push changes to Cloudflare)
- **Templates:** custom Hugo layouts/partials created for this website
- **Styling:** custom CSS created for this website (`assets/css/style.css`)
- **JavaScript:** custom site script created for this website (`assets/js/main.js`)
- **Client-side search:** [Lunr.js](https://github.com/olivernn/lunr.js)

## Project Structure

Main directories you will use most often:

- `content/posts/`: published posts
- `content/rss-only/`: feed-only posts that do not generate web pages
- `content/pages/`: static pages (about, contact, blogroll, etc.)
- `content/search/`: search page content
- `layouts/`: custom templates and partials for this website
- `assets/css/style.css`: custom site styling
- `assets/js/main.js`: custom site behavior
- `assets/`: source assets
- `static/`: static files copied as-is

## Hugo Documentation

For installation, setup, and command usage, refer to the official Hugo documentation:

- [https://gohugo.io/documentation/](https://gohugo.io/documentation/)

## Search

Search is implemented with Lunr.js and rendered via site templates:

- Search page content: `content/search/_index.md`
- Search layout: `layouts/search/list.html`
- Search partial: `layouts/partials/search.html`
- Lunr.js repository: [https://github.com/olivernn/lunr.js](https://github.com/olivernn/lunr.js)

## Licenses

- **Code:** GNU Affero General Public License v3.0 or later (see `LICENSE`)
- **All content:** [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/deed)