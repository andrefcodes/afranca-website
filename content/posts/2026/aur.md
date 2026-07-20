---
title: "AUR"
date: 2026-07-19T13:56:14-03:00
lastmod: 2026-07-19T13:56:14-03:00
slug: "aur"
description: "Arch Linux AUR Compromise: How to Check If You're Affected and Stay Safe"
image: ""
draft: false
featured: false
tags: ["Technology", "Security", "Linux"]
---

As an Arch Linux user, I've always praised the AUR (Arch User Repository) as one of Arch's greatest strengths. Actually, it's one of the reason why so many people recommend Arch.
<!--more-->
Last month, I found out that over 400 AUR packages were compromised in a massive supply chain attack, leaving me feeling the same frustration many of you probably felt as well.

I spent some time researching, running some checks on my system, and figuring out whether my system was affected.

## What Was Compromised?

As far as I know, the attack exploited the AUR's **orphan-package adoption process**, where attackers took over packages that had no active maintainer. The malicious code included:

- `npm install atomic-lockfile` (malicious npm package v1.4.2)
- `bun install js-digest` (second wave payload)
- Payload stored at: `src/hooks/deps`

## Step 1: Checking If I Had Compromised Packages

### Listing All My AUR Packages

```bash
# Using yay (AUR helper)
yay -Qam > packages_aur.txt
```

### Cross-Referencing Against Compromised Packages

I downloaded a community's list of compromised packages:

```bash
curl https://md.archlinux.org/s/SxbqukK6IA/download > compromised.txt
```

Then checked if any of my packages matched:

```bash
# Check with yay output
grep -wFf compromised.txt packages_aur.txt
```

**If grep returns nothing**, you probably don't have any compromised packages.

## Step 2: I Run Some Additional Checks

### Checked for Malicious Build Scripts

```bash
# Searched for malicious npm/bun patterns in pacman cache
grep -rl "atomic-lockfile" /var/cache/pacman/pkg/ 2>/dev/null
grep -rl "js-digest" /var/cache/pacman/pkg/ 2>/dev/null
grep -rl "lockfile-js" /var/cache/pacman/pkg/ 2>/dev/null

# Searched for the payload path in your home directory
grep -rl "src/hooks/deps" ~/ 2>/dev/null
```

### Checked for eBPF Rootkit

```bash
# If the malicious package ran as root, rootkit maps is supposed to appear here
sudo ls /sys/fs/bpf/
```

### Checked for Suspicious systemd Services

```bash
# Looked for unknown services
ls /etc/systemd/system/ | grep -v "^pacman\|^systemd"
ls ~/.config/systemd/user/
```

Only standard services (printer, bluetooth, network) should appear by default.

## Step 3: Action Plan Based on Results

In my case, I found no matches for any of the above checks, even though I decided to replace most AUR packages with official repo versions or Flatpak equivalents.

### If You're Compromised (Matches Found)

**⚠️ CRITICAL: If any flagged package was installed/updated**, I would as soon as possible:

1. Treat the system as compromised;
2. Reinstall Arch from trusted media;
3. Rotate all credentials immediately:
   - Browser passwords
   - SSH keys
   - GitHub/npm tokens
   - Slack/Discord/Teams sessions
   - Vault tokens
   - Docker/Podman credentials
   - Cloud access keys
   - You name it...
4. If the package ran as root, assume the eBPF rootkit is present and reinstall Arch from trusted media.

## Managing AUR-Only Packages Securely

If the package is AUR-only, I would inspect the build script and verify it's safe before installing.

```bash
# Download package WITHOUT installing
cd /tmp
yay -G <package-name>
cd <package-name>

# REVIEW before building:
cat PKGBUILD
cat .install  # if exists

# Look for suspicious patterns:
# - npm install from obscure URLs
# - bun install from unknown sources
# - obfuscated commands
# - downloads from random GitHub repos
```

**Verify checksums:**
```bash
grep -E "sha256sums|md5sums" PKGBUILD
```

I hope this helps!