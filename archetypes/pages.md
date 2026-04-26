---
title: "{{ replace .File.ContentBaseName "-" " " | title }}"
date: {{ .Date.Format "2006-01-02T15:04:05-03:00" }}
lastmod: {{ .Date.Format "2006-01-02T15:04:05-03:00" }}
slug: "{{ .File.ContentBaseName }}"
description: ""
image: ""
---
