---
title: "I Don't Care About SEO"
date: 2024-01-30T10:58:00+00:00
lastmod: 2025-12-08T12:13:39+00:00
slug: "i-dont-care-about-seo"
description: "Refusing search engine indexing, I explore alternative ways to share content amid AI, scraping, and intellectual property concerns. "
image: "https://images.unsplash.com/photo-1674027326254-88c960d8e561?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wxMTc3M3wwfDF8c2VhcmNofDh8fFNFT3xlbnwwfHx8fDE3NjQ3MDQ1Nzl8MA&ixlib=rb-4.1.0&q=80&w=2000"
tags: ["OpenWeb", "Blogging"]
draft: false
featured: false
---

I remember that when I first set up this site with Jekyll, I made sure to configure the site's metadata to make it easier for search engines to index it.
<!--more-->

As much as I had reservations about this, I've always believed that scraping is an important way of disseminating knowledge. However, with this AI boom everywhere, and with a series of questions being raised about intellectual property, language model training, biases, and how some search engines scrape our content to provide answers for the user (often without giving credit or providing the source link), I see no reason to have my content indexed, leaving me to resort to other ways of disseminating content, such as my mastodon account, webring, blogrolls, etc.

I changed the `robots.txt` file on the website to

```
User-agent: *
Disallow: /
```

and changed the following meta tag on the page's `<head>` to

```
<meta name='robots' content="noindex, nofollow, noimageindex, nosnippet">
```

I know, bots can ignore that, and technically there's nothing we can really do about it.

At the end of the day, I feel like this is more of a philosophical question than anything else. I mean, in the sense of how much we want tools like AI and "bad" algorithms to be an integral part of our lives.

The answers we give to questions like these dictate how much companies will want to keep developing or integrating these AI tools everywhere. In the search engine example, I just want a search engine, not an assistant who does everything for me (sometimes at the expense of other people's work).

Okay, maybe I went a little off topic or too far into it, but I think you get my idea.
