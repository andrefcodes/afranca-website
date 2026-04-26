---
title: "Website version 4.0"
date: 2023-01-31T10:58:00+00:00
lastmod: 2025-12-30T02:06:56+00:00
slug: "website-version-4-0"
description: "Blog journey back to Jekyll: simpler, faster, fewer plugins, cleaner design, and renewed control after leaving Ghost. "
image: "https://images.unsplash.com/photo-1573867639040-6dd25fa5f597?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wxMTc3M3wwfDF8c2VhcmNofDh8fHdlYnNpdGV8ZW58MHx8fHwxNzY0NzIyODIxfDA&ixlib=rb-4.1.0&q=80&w=2000"
tags: ["Static Site Generator", "Jekyll", "CMS", "GhostCMS"]
draft: false
featured: false
---

I 've been running this blog since April, and for the first time I can say I'm really happy with it in terms of functionality and appearance.
<!--more-->

Back in September, I wrote "[Ghost as my blogging platform](/ghost-as-my-blogging-platform)" explaining the reasons why I was giving a shot at a CMS and leaving Jekyll as my SSG. Two of the reasons were the ability to schedule posts that Ghost provides and how easy it was to manage content.

That choice came with some drawbacks. Like everything in life, when you make a choice, you also choose to leave something behind. In my case, I was struggling with making visual modifications due to the way Ghost is developed, and saw a huge decrease in performance when loading pages, due to excess bloat, JavaScript, etc.

For the fourth time, I decided it was time to go static again. I still don't post frequently, so I can't justify my wish to manage content I don't produce in a more "powerful" way. Also, I found out that I can simply write using any editor I like and push it to the web when I'm at my computer and have time available. And that is okay after all.

Moving back to Jekyll was a bit of a headache because there was no way to export my previous posts in a format that I could easily work with. Jekyll, Ruby, and my macOS were also playing tricks on me. Let me explain myself: On a beautiful day, I ran a `brew update` command and my Jekyll installation broke. I came to find that I wasn't running a properly compatible version of Ruby.

I followed the exact instructions (from Jekyll website) to set up the environment again, installed chruby, and then hit more errors when trying to install Ruby. After hours of troubleshooting1, I realized I had some `CFLAGS` set in my **.zshrc** file that were somehow breaking the build. Once I unset the `CFLAGS`, `LDFLAGS`, and `LDLIBS`, everything went okay. I created a **.ruby-version** file in my working directory to make sure I won't run into update issues again.

In the meantime, while trying to fix ruby, I installed Hugo and 11ty to see whether any of them would fit better than Jekyll.  
  
I didn't have a good time with Hugo, as it turned out to be overcomplicated (compared to Jekyll, in my opinion);  
  
11ty seemed to work well. I liked the idea of being able to use different template languages and the fact that it has more similarities with Jekyll, however, I have zero experience with JavaScript, and customizing its settings wasn't friendly to me.  
  
It meant Jekyll would be the way to go, or to stay with Ghost in case I couldn't fix my Jekyll installation.

It took me some time to fully migrate. I was doing things patiently and trying to improve my Jekyll setup with as few plugins as possible for future-proofing. One good example is that I have a custom `.html` for SEO, a custom RSS and JSON feed file, and a sitemap file, all rendered by Jekyll at build time without an additional plugin.

Differently from using Ghost, I regained control of what's going on under the hood, and now I have a minimal and much faster website2.

## Looking back to the beginning

### Version 1.0

The first version of the blog was built upon Jekyll, using [simple.css](https://simplecss.org/), a CSS framework created by @kev@fosstodon.org.

![](/content/images/2025/12/B7857668-F9A6-47C1-9048-4F66E556679E-287657614.webp)

### Version 2.0

Five months later, I changed things up a bit and launched the second version.

I hate to admit it, but it was horrible. As you can see, the background had a yellow-ish color, and hyperlinks had tones of orange. What I liked was the navigation that I was able to shrink.

![](/content/images/2025/12/C0295DF6-53E1-4225-BF87-1FFED7B53A84-1809084866.webp)

### Version 3.0 (Now using Ghost)

By Sep 22, I switched to Ghost.

I haven't found any Ghost template that I like, even the paid ones. I had to choose something and ended up with [Attila Theme](https://attila.peteramende.de/).

![](/content/images/2025/12/AA7AE463-30E3-455B-B102-9E74B2BF6472-1064595816.webp)![](/content/images/2025/12/7B839340-6B71-4CE2-97BD-B01CE8937DCC-1802060500.webp)

There is a large feature image, and the typography is not well sized (I mean, they don't seem to work well together).

For the first time I had Tags on my website.

## How is it going?

### Version 4.0 (current - back to Jekyll)

This version is somewhat based on [Bradley Taunt's](https://btxx.org/) minimalist website.

Some Features:

![](/content/images/2025/12/3E8688EE-952F-440D-A1C2-48D9029F22A3-217874859.webp)

Simple website title and [sausage links](https://btxx.org/posts/hamburger-menu-alternative/)

![](/content/images/2025/12/4CA0874B-6992-4BAC-8093-16587F9FB2D8-1211198854.webp)

**List of recent posts**

![](/content/images/2025/12/E3E05D60-4985-4EAC-8CBA-6A7C137ADAFE-1084587838.webp)

**Posts metadata. Includes post date, word count, time to read and post tags**

![](/content/images/2025/12/FB162412-7A4D-4A26-87AF-21491FA6C785-704195110.webp)

**Links for previous and next post**

![](/content/images/2025/12/9A6D484B-29D7-471E-A9DC-B7B8C81CC89F-556260798.webp)

[Openring](https://git.sr.ht/~sircmpwn/openring), a tool for generating a webring from RSS feeds

## Final thoughts

I'm happy with the final result, and the 4.0 version really looks pleasant to my eyes.

I tried to organize things in a way that it's easy to find content and read it with minimal distractions, and to reduce bloat and excess of features, yet it has some good ones.

[Chris](https://mastodon.chriswiegman.com/@chris) wrote a few days ago ["Still wishing for a better blogging tool"](https://chriswiegman.com/2023/01/still-wishing-for-a-better-blogging-tool/), and I'd say I feel pretty much like him in this aspect. In his case, his tool of choice is Word Press; mine is the great ol' Jekyll.

---

[1] - I mentioned I had a problem with Jekyll on mastodon and @kev@fosstodon.org said something about having a Jekyll container using docker for situations where an update would break a Jekyll installation.  
  
I found this solution to be a bit overkill, considering that a SSG was supposed to be simple and run lean.

[2] - The loading time was improved significantly by roughly 9x (checked using GTmetrix website), and the total size of the page was reduced by 25x.
