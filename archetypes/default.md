---
title: "{{ replace .File.ContentBaseName "-" " " | title }}"
date: {{ .Date | time.Format "2006-01-02T15:04:05-07:00" }}
lastmod: {{ .Date | time.Format "2006-01-02T15:04:05-07:00" }}
slug: "{{ .File.ContentBaseName }}"
description: ""
image: ""
draft: true
tags: [""]
---
