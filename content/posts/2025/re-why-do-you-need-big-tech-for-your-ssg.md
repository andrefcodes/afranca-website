---
title: "RE: Why Do You Need Big Tech for Your SSG?"
date: 2025-11-20T22:10:00+00:00
lastmod: 2025-12-08T12:38:10+00:00
slug: "re-why-do-you-need-big-tech-for-your-ssg"
description: "Cloudflare’s outage shows centralization risks. Self-hosting gives control; managed platforms give ease. Know the trade-offs. "
image: "https://images.unsplash.com/photo-1737737351943-82e01f866e53?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wxMTc3M3wwfDF8c2VhcmNofDF8fHN0YXRpYyUyMHNpdGV8ZW58MHx8fHwxNzY0Njc0NTE4fDA&ixlib=rb-4.1.0&q=80&w=2000"
tags: ["Blogging", "Self-hosting", "Static Site Generator"]
draft: false
featured: false
---

T he recent Cloudflare outage sparked an interesting talk in the small web community. I wrote about [the fragile architecture we've built](/the-fragile-web-we-built), where a single configuration file brought down half the internet. Kev Quirk responded with a compelling argument: [why rely on big tech at all](https://kevquirk.com/blog/why-do-you-need-big-tech-for-your-ssg/)? Just spin up a VPS, build locally, and rsync your way to independence. Meanwhile, Loren Stephens offered [a more pragmatic perspective](https://ldstephens.net/blog/re-why-do-you-need-big-tech-for-your-ssg-kev-quirk/), pointing out that not everyone wants to become a sysadmin for their personal blog.
<!--more-->

I get both sides because I've lived through both approaches. When I launched the [first version of my blog](/website-version-4-0/#version-1-0), I used GitHub and Vercel - and [Simple.css](https://simplecss.org/) (Thanks Kev, btw). Push to main, watch it deploy, done. It was perfect for someone who just wanted to write without thinking about server configurations.

But Kev's point about control resonates too. There's something oddly satisfying about knowing exactly where your bits live and how they get there. No mysterious build pipelines, no waiting for someone else's infrastructure to wake up. Just you, a bash script, and direct access to your server. For someone technical enough to handle it, the simplicity is also great.

The truth is both approaches have merit depending on who you are and what you value. If you're comfortable with command lines and enjoy tinkering, self-hosting gives you autonomy and eliminates a dependency on platforms that can go offline or change terms overnight. If you're not interested in server maintenance or you're just starting out, platforms like Netlify, Cloudflare, or Vercel remove friction and let you focus on content rather than infrastructure and cost.

What the Cloudflare outage really exposed isn't that one approach is universally better, but that centralization carries hidden costs we only notice when things break. Whether you choose the convenience of managed platforms or the independence of self-hosting, the important thing is making that choice consciously, understanding the tradeoffs you're accepting.
