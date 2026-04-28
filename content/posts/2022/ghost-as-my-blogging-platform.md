---
title: "Ghost as My Blogging Platform"
date: 2022-09-27T10:20:00+00:00
lastmod: 2025-12-30T01:58:27+00:00
slug: "ghost-as-my-blogging-platform"
description: "Why I migrated to Ghost CMS: better editor UI, custom themes, scheduling posts."
image: "https://images.unsplash.com/photo-1698347108462-9b7611c2afe2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wxMTc3M3wwfDF8c2VhcmNofDI2fHxnaG9zdC5vcmd8ZW58MHx8fHwxNzY0NzI0OTE5fDA&ixlib=rb-4.1.0&q=80&w=2000"
tags: ["blogging", "cms"]
draft: false
featured: false
---

Recently, I posted about how I successfully migrated my Jekyll static blog from GitHub to Codeberg Pages, also explaining my attempt to use WriteFreely as my blogging platform.
<!--more-->

I really want to make writing a habit, but I've been struggling with the lack of a true editor in Jekyll, which makes it a pain to build this habit. Well, I still think that static websites are great for a number of reasons, but not ideal for producing a lot of content.

Here I go again, tinkering with my blog... I took a deep breath, then listed three features that are indispensable to me, before getting started looking around for platforms:

- Minimally easy to manage (content, updates, integrations, etc);
- Allow custom themes;
- Useful editor UI.

Among all the options in my brief research, I liked [Ghost CMS](https://ghost.org/) the most. Problem is, their managed hosting is more than I’d like to pay, so I self-hosted it. As of this writing, their starter plan is $9/mo billed yearly (or $11 billed monthly).

![](/uploads/E1A56524-B127-436C-87D7-5F5395C325F2-1995104443.webp)

**Image from** [**Ghost Website**](https://ghost.org/images/home/posts.png) **/ Ghost CMS Screenshot**

**Pros:**

- Editor UI is pretty clean (so you can focus on writing) and has several features, such as a Markdown and HTML editor;
- You can inject code (styles or scripts, for instance) into some specific page or the entire website;
- The project seems to be well maintained, and the backup/update process is straightforward;
- I can schedule posts.

**Cons:**

- Themes are usually bloated, however we can get around it by creating our own;
- The excess of .js bothers me a bit, and there are some penalties in performance compared to only serving HTML and CSS files (I got an optimal balance in performance with some cache optimizations, as well as setting up a CDN in front of my VPS).

The newsletter/membership thing does not bother me at all, since I was able to disable it completely. I'm actually glad that if I ever want to work on it, there's such a possibility.

## Considerations

Can I guarantee that I will continue using Ghost in the future? No, because I love messing around with what isn't broken.

Regardless of anything, I really liked the platform and I want to be able to keep posting more easily and often. In addition, the possibility of scheduling posts is excellent, since if I have time and manage to write more content, I can publish it in advance.
