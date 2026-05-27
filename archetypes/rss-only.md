---
title: "{{ replace .File.ContentBaseName "-" " " | title }}"
date: {{ dateFormat "2006-01-02T15:04:05-03:00" .Date }}
lastmod: {{ dateFormat "2006-01-02T15:04:05-03:00" .Date }}
slug: "{{ .File.ContentBaseName }}"
description: ""
image: ""
draft: true
featured: false
tags: ["RSS-only"]
build:
  list: local
  render: link
  publishResources: false
---

{{< rss-only-notice >}}



<!--more-->
