---
title: "Immich on a Raspberry Pi"
date: 2026-01-04T00:37:38+00:00
lastmod: 2026-01-04T09:59:41+00:00
slug: "immich-on-a-raspberry-pi"
description: "Migrating to Immich worked well, but required a few tweaks and patience."
image: "https://images.unsplash.com/photo-1533158307587-828f0a76ef46?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wxMTc3M3wwfDF8c2VhcmNofDF8fHBob3Rvc3xlbnwwfHx8fDE3NjUyMDQyNjl8MA&ixlib=rb-4.1.0&q=80&w=2000"
tags: ["technology", "apple", "samsung", "photo management"]
draft: false
featured: false
---

This post is not a tutorial, but rather my account of the process of migrating my photos from iCloud to Immich and how my Raspberry Pi has been able to run it without many issues.
<!--more-->

Before you ask why I made the switch: I’ve been using Android since 2024, and the only decent solution that would give me easy access to my photos - despite being a privacy nightmare - was Google Photos. I happened to hear about Immich on a podcast, and the quality of the software immediately caught my attention.

Migrating my photo library to Immich turned out to be a bit more technical than I initially expected. Although the installation was straightforward - [thanks to the Immich team for having well documented the entire process](https://docs.immich.app/overview/quick-start/) - the bigger problem occurred in a different way: how to import my files.

I started with what seemed like the most easier approach: uploading directly from the Immich iOS app. It was a disaster. Even though my library isn’t particularly large, after almost four days of continuous uploading, my iPhone was constantly overheating, battery health was clearly taking a hit, and I wasn’t even halfway through the process. At that point, it was obvious this wasn’t sustainable. I canceled everything and wiped the entire Immich database.

I tried to export my Photos Library from the Photos App on my old macbook and was surprised by multiple errors and missing files along the way. I gave up again.

The next step was to request a full data export from Apple. They made me wait seven days for it. The result was my data, split across 46 files, totaling 343.81 GB. Downloading this archive was painfully slow. For reasons still unclear to me, download speeds were capped at around 130 Mbps, regardless of network conditions. Once everything was finally downloaded and extracted, importing locally into Immich was suuuper fast.

One important thing here: hardware constraints played a big role in shaping the rest of the strategy. I’m running Immich on a Raspberry Pi 400 400 4GB, which is perfectly capable, but obviously limited in CPU, memory, and I/O throughput. Letting Immich process everything automatically could quickly overwhelm the system, so after the importing process began, I paused all background jobs and run them manually, one at a time. I also tuned job concurrency settings, especially for CPU-heavy tasks like video transcoding, thumbnail generation, and machine learning-based search and face recognition. Keeping concurrency low prevented thermal throttling and avoided locking up the system.

After I had my data from Apple, the entire migration process took roughly a week from start to finish, including indexing, metadata extraction, and background processing. Once completed, the system has been running reliably and smoothly. One important optimization I adopted going forward is recording videos exclusively in H.264, which is widely supported and minimizes the need for transcoding. This reduces unnecessary CPU load and keeps the Raspberry Pi focused on serving content rather than constantly reprocessing it.

Immich proved to be a solid self-hosted solution since then. And now I can seamlessly back up my phone directly using the Immich Android app.
