---
title: "How to Set Up Fail2ban to Protect Miniflux Against Brute Force Attacks"
date: 2024-11-12T17:16:00+00:00
lastmod: 2025-12-08T12:23:34+00:00
slug: "how-to-set-up-fail2ban-to-protect-miniflux-against-brute-force-attacks"
description: "Guide to securing a publicly exposed Miniflux instance with Fail2Ban, creating a custom filter and jail to block IPs after failed login attempts. "
image: "https://images.unsplash.com/photo-1729860646385-3e71fb29ff04?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wxMTc3M3wwfDF8c2VhcmNofDI4fHxwYXNzd29yZHxlbnwwfHx8fDE3NjQ3MDUzNjh8MA&ixlib=rb-4.1.0&q=80&w=2000"
tags: ["Self-hosting", "Security"]
draft: false
featured: false
---

I f you self-host your own instance of Miniflux (a RSS Feed Reader) and have it exposed publicly to the internet, it is a good idea to protect it against brute force attacks.
<!--more-->

I'm not going into details on how to install it, as it's already well documented on [the official webpage](https://miniflux.app/docs/installation.html).

If you can afford it, an even better alternative, before reading this blog post to the end, is to have it managed for you by the Miniflux team itself. Paying for a subscription of $15/year (as of writing) helps supporting product development, and it skips all the hassle of managing updates, patches, SSL certificates and so on.

There are several ways to [install fail2ban](https://github.com/fail2ban/fail2ban). Since my VPS runs Ubuntu, I used the following command:

```
sudo apt install fail2ban
```

On my VPS, Miniflux outputs its logs to `/var/log/syslog`, which can be accessed with:

```
sudo journalctl -u miniflux
```

I wanted Fail2ban to monitor these logs for failed authentication, and ban any IP address with three consecutive failed attempts for a few hours, so I did the following:

### 1. Created a custom Fail2ban filter to match log lines in `/var/log/syslog` that contain "miniflux" and "authentication\_failed=true".

a. Create a custom filter for Miniflux:

```
sudo nano /etc/fail2ban/filter.d/miniflux.conf
```

b. Add the following filter definition:

```
[Definition]

# Regex to match the relevant log lines
# <HOST> is a Fail2Ban placeholder that will capture the offending IP address from the log line.
failregex = .*miniflux.*authentication_failed=true.*client_ip=<HOST>

# This pattern should not match successful logins or other irrelevant logs
ignoreregex =
```

### 2. Configured Fail2ban Jail to look for three consecutive failed attempts from the same IP address and then ban that IP across all ports for a few hours.

a. Create a new jail for Miniflux:

```
sudo nano /etc/fail2ban/jail.local
```

b. Add the following jail configuration:

```
[miniflux]
enabled = true
port = 0:65535
filter = miniflux
logpath = /var/log/syslog
maxretry = 3
# 72 hours in seconds
bantime = 259200
# Window of time to consider failures (10 minutes in seconds)
findtime = 600
```

Lines explained:

- `enabled = true` activates the jail.
- `port = 0:65535` bans the IP for all ports.
- `filter = miniflux` specifies the custom filter we created.
- `logpath = /var/log/syslog` tells Fail2Ban to scan the syslog file.
- `maxretry = 3` specifies that the IP will be banned after three consecutive failed attempts.
- `bantime = 259200` sets the ban duration
- `findtime = 600` defines the window for detecting failures.

### 3. With everything in place, I tested and restarted Fail2ban.

a. Check your filter syntax for errors:

```
sudo fail2ban-regex /var/log/syslog /etc/fail2ban/filter.d/miniflux.conf
```

b. Restart the Fail2Ban service to apply the new configuration:

```
sudo systemctl restart fail2ban
```

c. Monitor Fail2Ban logs to verify that the jail is working:

```
sudo tail -f /var/log/fail2ban.log
```

you can also check with the command:

```
$ sudo fail2ban-client status miniflux

my-user@my-vps:~$ sudo fail2ban-client status miniflux
Status for the jail: miniflux
|- Filter
|  |- Currently failed: 0
|  |- Total failed:     0
|  `- Journal matches:
`- Actions
   |- Currently banned: 1
   |- Total banned:     1
   `- Banned IP list:   89.115.48.22
```

**Testing**: Be cautious during testing to avoid getting locked out of your VPS. Use a VPN connection or connect via mobile network instead of your home network.
