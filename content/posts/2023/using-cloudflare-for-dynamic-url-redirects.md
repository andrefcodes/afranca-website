---
title: "Using Cloudflare for Dynamic Url Redirects"
date: 2023-02-01T10:58:00+00:00
lastmod: 2025-12-08T00:52:43+00:00
slug: "using-cloudflare-for-dynamic-url-redirects"
description: "Dynamic Cloudflare Pages setup lets you redirect an old domain to a new one while preserving permalinks using a simple _redirects file. "
image: "https://images.unsplash.com/photo-1635850967683-17df1f33e749?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wxMTc3M3wwfDF8c2VhcmNofDF8fGZvcndhcmR8ZW58MHx8fHwxNzY0NzIyNjI4fDA&ixlib=rb-4.1.0&q=80&w=2000"
tags: ["HowTo", "Technology"]
draft: false
featured: false
---

A couple of days ago, a [domain switch]({{< ref "posts/2023/switching-from-afhub-dev-domain.md" >}}) took place on this website, and I wanted to have a way to dynamically [^1] forward URLs from the old domain to the new one, preserving the current permalink structure.
<!--more-->

Searching the web, I came across the ["Using Netlify for Dynamic URL Redirects"](https://btxx.org/posts/netlify-urls/) article, written by Brad Taunt. The problem is, I didn't want to sign up for Netlify just for that.

My blog is already hosted on Cloudflare, so it made sense to me to use it for the redirects too. I checked their documentation to see if something similar could be achieved. And it is, in fact, really simple and free.

## Steps to reproduce

### Setup content locally

- Create a folder in your computer and add the following files:

```
$ touch _redirects index.html 404.html
```

- Add the following [^2] to your `_redirects` file:

```
/  https://domain.tld  301
/* https://domain.tld/:splat 301
```

Replace **domain.tld** with your domain.

Breaking down the above lines:  
  
~ **First line:** Redirects all connections from the old domain's home page to the new domain one;  
  
~ **Second line:** A splat (asterisk, `*`) will greedily match all characters and use them to dynamically redirect a user to the new location with `:splat`.

- Add the following to both index.html and 404.html files.

```
<!DOCTYPE html>
<html lang="en">
<head>
    <title>403 Forbidden</title>
</head>
<body>
    <h1>403 Forbidden</h1>
</body>
</html>
```

### Create a new Cloudflare Pages project

- Access your [Cloudflare Dashboard](https://dash.cloudflare.com) (create an account if needed) and click Pages on the sidebar.
- Now, **create a new project**.

You have three options to set up your project: connecting to a git repository (usually GitHub or GitLab); uploading a folder; or using the [Wrangler CLI tool](https://developers.cloudflare.com/workers/get-started/guide/). We're uploading our folder in this example.

- Give your project a name, upload the folder you just created, then click deploy.

### Set up a custom domain

- Now, in your new project's page, look for the **custom domains** tab, then add a new domain.
- Type your domain.tld, then follow the instructions given to add the proper `CNAME` record to the assigned project URL. If your DNS is managed by Cloudflare, this will be a 1-click process.

**NOTE**: If you're redirecting from a zone apex, i.e. example.com, instead of a subdomain, Cloudflare will require your old domain name nameservers to match Cloudflare's.

## Conclusion

That's pretty much it!

Cloudflare will be in charge of generating an SSL certificate for you, and by now, you'll have all of your pre-existing URLs forwarded dynamically to your new domain.

**TIP**: A similar approach can be used to have your big URLs shortened to another small domain.tld. Of course, without all the telemetry those URL shortener services provide.


[^1]: Dynamically in this case means preserving the current permalink structure, instead of DNS forwarding setup, which doesn't allow this level of customization.

[^2]: Feel free to add to your `_redirects` file a different set of rules. [All options are well documented here](https://developers.cloudflare.com/pages/platform/redirects).
