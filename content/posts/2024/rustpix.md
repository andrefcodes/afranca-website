---
title: "Rustpix"
date: 2024-11-19T06:24:00+00:00
lastmod: 2026-01-18T18:03:27+00:00
slug: "rustpix"
description: "Rustpix: an open-source Rust tool that optimizes images for the web by converting to WebP, and stripping EXIF data."
image: "https://images.unsplash.com/photo-1461749280684-dccba630e2f6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wxMTc3M3wwfDF8c2VhcmNofDN8fHNvZnR3YXJlfGVufDB8fHx8MTc2NDcwNTk4MXww&ixlib=rb-4.1.0&q=80&w=2000"
tags: ["Coding", "Metadata", "OpenSource", "Static Site Generator"]
draft: false
featured: false
---

I 've just published [a new open-source software named Rustpix](https://github.com/andrefcodes/rustpix). As the name suggests, it's a simple program written entirely in Rust.
<!--more-->

Essentially, Rustpix is a lightweight tool that automatically optimizes images for web use.

How it works:

- Takes one or more images in common formats (JPEG, PNG, GIF, etc.) as input.
- Strips EXIF data from the images.
- Converts them to the WebP format with up to 75% quality for lossy compression.
- Renames each file to a random UUID (Universally Unique Identifier) with a .webp extension.
- Overwrites the original files with the optimized versions in the same directory.

The program is still under development, and I plan to add more features in the future.

This isn't meant to reinvent the wheel, as there are already many image optimization tools out there. However, it's a convenient way to streamline my workflow when preparing images for my blog or other online projects.
