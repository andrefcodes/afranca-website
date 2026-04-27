---
title: "Migrating from WriteFreely to Ghost CMS"
date: 2025-12-04T03:13:10+00:00
lastmod: 2025-12-07T23:50:07+00:00
slug: "migrating-from-writefreely-to-ghost-cms"
description: "Migration from WriteFreely to Ghost driven by better ActivityPub features, despite unexpected manual work and theme adjustments. "
image: "https://images.unsplash.com/photo-1674027326476-3ea3cbf7b9be?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wxMTc3M3wwfDF8c2VhcmNofDE2NXx8d2Vic2l0ZXxlbnwwfHx8fDE3NjUwNjU3OTJ8MA&ixlib=rb-4.1.0&q=80&w=2000"
tags: ["CMS", "GhostCMS", "Writefreely", "Blogging", "ActivityPub"]
draft: false
featured: false
---

I’m starting to think I’ve become a professional digital nomad, except the "nomad" part is my blog. Last October I proudly announced my escape from Hugo to WriteFreely, bragging about finally finding a platform that let my words breathe.
<!--more-->

Fast forward a month and a half, and here I am, elbow‑deep in another migration, this time to GhostCMS, because apparently my appetite for new features outweighs my tolerance for learning curves. I imagined the transition would be a swift hop, but instead it turned into a marathon of manual copy‑pastes, theme‑tweaking, and a healthy dose of "why did I think this would be easy?".

These migrations have taught me two things: never underestimate the effort of moving digital furniture, and that I’ll probably be back here again next year, swapping platforms like socks!

When I decided to move my blog from WriteFreely to Ghost (version 6), the primary driver was the richer ActivityPub integration. Ghost’s implementation supports:

- **Full federation of posts, comments, and reactions** across the Fediverse.
- **Boosted discovery** through Mastodon and other ActivityPub clients.
- **Customizable actor metadata** (profile picture, bio, preferred languages).
- **Fine‑grained privacy controls** for each post (public, unlisted, or followers‑only).

WriteFreely, on the other hand, suffered two major pain points:

1. **Scheduling bugs** – scheduled posts never got federated, leaving gaps in the timeline.
2. **Feature gaps** compared to the managed Write.as service (e.g., no image upload support or issues with shortcodes).

### What Went Wrong

- **Underestimating migration effort** - I assumed - as I often do - a quick export/import would suffice, but ended up doing a lot of manual copy‑pasting and metadata cleanup.
- **Theme bloat** - Ghost’s default themes are feature‑heavy. While they’re fully customizable, stripping out unnecessary code can take extra time. WriteFreely’s minimal CSS approach made styling simpler, albeit way less flexible.

### What I Like About Ghost

- **Custom email delivery** – Ghost lets me send tailored newsletters directly from the platform, with some control over templates and subscriber segmentation.
- **Optional comments** – Readers can leave comments via its internal system, and native ActivityPub replies.
- **Robust editor** – The built‑in rich‑text/markdown editor offers embeds, code blocks, and real‑time preview, far surpassing WriteFreely’s basic text area.

Overall, the migration demanded more hands‑on work than anticipated, but Ghost's advanced federation and powerful publishing tools now give my blog the flexibility I was missing on WriteFreely.
