<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:atom="http://www.w3.org/2005/Atom"
  exclude-result-prefixes="atom">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html lang="en">
      <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>
          <xsl:text>Feed: </xsl:text>
          <xsl:value-of select="atom:feed/atom:title"/>
        </title>
        <style>
          :root {
            --main-text-color: hsl(0, 0%, 27%);
            --accent-text-color: hsl(0, 0%, 0%);
            --main-background-color: hsl(0, 0%, 100%);
            --accent-background-color: hsl(0, 0%, 92%);
            --link-color: hsl(207, 100%, 50%);
            --font-sans: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, sans-serif;
            --font-mono: ui-monospace, SFMono-Regular, "SF Mono", Menlo, Consolas, monospace;
          }
          @media (prefers-color-scheme: dark) {
            :root {
              --main-text-color: hsl(216, 5%, 82%);
              --accent-text-color: hsl(225, 22%, 96%);
              --main-background-color: hsl(210, 29%, 8%);
              --accent-background-color: hsl(213, 13%, 17%);
              --link-color: hsl(46, 100%, 57%);
            }
          }
          html { color-scheme: light dark; }
          body {
            font-family: var(--font-sans);
            max-width: 40rem;
            margin: 0 auto;
            padding: 2rem 1rem;
            color: var(--main-text-color);
            background: var(--main-background-color);
            line-height: 1.6;
          }
          .hidden {
            position: absolute;
            width: 1px;
            height: 1px;
            padding: 0;
            margin: -1px;
            overflow: hidden;
            clip: rect(0, 0, 0, 0);
            white-space: nowrap;
            border: 0;
          }
          header {
            margin-bottom: 2em;
          }
          .gh-head-brand {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: 3rem;
            margin-bottom: 0;
          }
          .site-title {
            margin: 0;
            text-transform: uppercase;
            letter-spacing: .08em;
            font-family: var(--font-mono);
            font-size: 1.5rem;
            color: var(--accent-text-color);
          }
          .site-title a {
            text-decoration: none;
            color: inherit;
          }
          .gh-head-actions {
            display: flex;
            align-items: center;
            gap: .5rem;
          }
          .nav-rss {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 32px;
            height: 32px;
            color: var(--main-text-color);
            text-decoration: none;
          }
          .nav-rss svg {
            width: 18px;
            height: 18px;
            fill: currentColor;
          }
          .gh-head-menu {
            border-top: 1px solid var(--main-text-color);
            font-weight: 600;
            line-height: 1.5;
            display: flex;
            align-items: center;
            flex-wrap: wrap;
            padding-top: .4rem;
          }
          .gh-head-menu .nav {
            display: flex;
            flex-wrap: wrap;
            list-style: none;
            margin: 0;
            padding: 0;
            gap: 0;
          }
          .gh-head-menu .nav li {
            margin: 0;
            padding: 0;
          }
          .gh-head-menu .nav a {
            padding: .3rem 1rem .3rem 0;
            text-decoration: none;
            color: var(--main-text-color);
          }
          .gh-head-menu .nav a:hover,
          .nav-rss:hover {
            color: var(--link-color);
          }
          .site-title::after {
            display: inline-block;
            content: "";
            width: .35em;
            height: .35em;
            margin-left: .15em;
            background: var(--link-color);
            border-radius: 1px;
          }
          footer {
            border-top: 1px solid var(--main-text-color);
            padding: 2.5rem 0;
            margin-top: 2.5rem;
          }
          .footer-content {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            align-items: center;
            gap: .5rem 1rem;
            font-size: .92rem;
          }
          .copyright {
            margin: 0;
          }
          .footer-nav ul {
            display: flex;
            list-style: none;
            margin: 0;
            padding: 0;
            gap: 1rem;
          }
          .footer-nav a {
            text-decoration: none;
            font-weight: 600;
          }
          .footer-badges {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(95px, 1fr));
            gap: 5px;
            margin-top: 2.5rem;
          }
          .footer-badges > div {
            display: flex;
            justify-content: center;
          }
          .footer-badges img {
            width: 95px;
            height: 35px;
            border-radius: 0;
            border: 1px solid var(--main-text-color);
          }
          .meta {
            margin: .75rem 0 1.5rem;
            padding: .9rem 1rem;
            border: 1px solid var(--main-text-color);
            background: var(--accent-background-color);
            font-size: .95rem;
          }
          .entry {
            border-top: 1px solid var(--main-text-color);
            padding: 1rem 0;
          }
          .entry h2 {
            margin: 0 0 .35rem;
            font-size: 1.15rem;
          }
          a { color: var(--main-text-color); }
          a:hover { color: var(--link-color); }
          .entry .dates { font-size: .92rem; opacity: .85; margin: 0; }
          .preview {
            margin: .55rem 0 0;
            font-size: .95rem;
            line-height: 1.55;
            opacity: .94;
          }
          .cats { margin-top: .55rem; }
          .cat {
            display: inline-block;
            border: 1px solid var(--main-text-color);
            border-radius: 999px;
            padding: .08rem .5rem;
            margin-right: .35rem;
            margin-bottom: .25rem;
            font-size: .78rem;
          }
          code {
            font-family: var(--font-mono);
            background: var(--main-background-color);
            border: 1px solid var(--main-text-color);
            padding: .1rem .3rem;
            border-radius: 3px;
            word-break: break-all;
          }
        </style>
      </head>
      <body>
        <header>
          <div class="gh-head-brand h-card">
            <p class="site-title p-name">
              <a class="u-url u-uid" href="/" rel="me">Andre Franca</a>
            </p>
            <img class="u-photo site-icon hidden" src="/images/avatar/author.png" alt="Andre Franca"/>
            <p class="p-note hidden">I'm Andre, a tech nerd and open source enthusiast.</p>
            <div class="gh-head-actions">
              <a href="/feed.xml" title="RSS Feed" target="_blank" class="nav-rss">
                <svg xmlns="http://www.w3.org/2000/svg" version="1.1" style="vertical-align: text-bottom; width: 1.15em; height: 1.15em;" viewBox="0 0 8 8"><style type="text/css">.button{stroke: none; fill: orange} .symbol{stroke: none; fill: white}</style><rect class="button" width="8" height="8" rx="1.5"></rect><circle class="symbol" cx="2" cy="6" r="1"></circle><path class="symbol" d="m 1,4 a 3,3 0 0 1 3,3 h 1 a 4,4 0 0 0 -4,-4 z"></path><path class="symbol" d="m 1,2 a 5,5 0 0 1 5,5 h 1 a 6,6 0 0 0 -6,-6 z"></path></svg>
              </a>
            </div>
          </div>
          <nav class="gh-head-menu">
            <ul class="nav">
              <li class="nav-about"><a href="/about/">About</a></li>
              <li class="nav-contact"><a href="/contact/">Contact</a></li>
              <li class="nav-blogroll"><a href="/blogroll/">Blogroll</a></li>
              <li class="nav-explore"><a href="/explore/">Explore</a></li>
            </ul>
          </nav>
        </header>
        <p class="meta">
          <xsl:text>This is a human-friendly view of this RSS feed. Subscribe by adding the URL to your feed reader: </xsl:text>
          <code><xsl:value-of select="atom:feed/atom:link[@rel='self']/@href"/></code>
        </p>

        <xsl:for-each select="atom:feed/atom:entry">
          <article class="entry">
            <h2>
              <a>
                <xsl:attribute name="href"><xsl:value-of select="atom:link[@rel='alternate']/@href"/></xsl:attribute>
                <xsl:value-of select="atom:title"/>
              </a>
            </h2>
            <p class="dates">
              <xsl:text>Published: </xsl:text><xsl:value-of select="atom:published"/>
              <xsl:text> | Updated: </xsl:text><xsl:value-of select="atom:updated"/>
            </p>
            <xsl:if test="count(atom:category) &gt; 0">
              <p class="cats">
                <xsl:for-each select="atom:category">
                  <span class="cat"><xsl:value-of select="@term"/></span>
                </xsl:for-each>
              </p>
            </xsl:if>
            <xsl:if test="normalize-space(atom:summary) != ''">
              <p class="preview"><xsl:value-of select="atom:summary"/></p>
            </xsl:if>
          </article>
        </xsl:for-each>

        <footer>
          <div class="footer-content">
            <section class="copyright">
              <a href="/">Andre Franca</a> <xsl:text>© </xsl:text><xsl:value-of select="substring(atom:feed/atom:updated,1,4)"/>
            </section>
            <nav class="footer-nav">
              <ul>
                <li><a href="https://xn--sr8hvo.ws/previous">&lt;&lt;&lt;</a></li>
                <li><a href="https://xn--sr8hvo.ws">IndieWeb Webring 🕸💍</a></li>
                <li><a href="https://xn--sr8hvo.ws/next">&gt;&gt;&gt;</a></li>
              </ul>
            </nav>
          </div>
          <div class="footer-badges">
            <div><a rel="noopener" target="_blank" href="https://gohugo.io/"><img src="/images/badges/hugo.png" alt="Built with Hugo"/></a></div>
            <div><a rel="noopener" target="_blank" href="https://ko-fi.com/s/4662b19f61"><img src="/images/badges/made-by-a-human.png" alt="Human made content badge pack"/></a></div>
            <div><a rel="noopener" target="_blank" href="https://mas.to/@abf"><img src="/images/badges/follow-on-mastodon.png" alt="Follow me on Mastodon"/></a></div>
            <div><a rel="noopener" target="_blank" href="https://fediverse.party/"><img src="/images/badges/join-the-fediverse.png" alt="Join Fediverse"/></a></div>
            <div><a href="/about#privacy-and-terms"><img src="/images/badges/cc-nc-sa.png" alt="Content licensed under CC-BY-NC-SA"/></a></div>
            <div><a rel="noopener" target="_blank" href="https://anybrowser.org/campaign/"><img src="/images/badges/any-browser.png" alt="Viewable With Any Browser"/></a></div>
            <div><a href="/feed.xml" rel="alternate"><img src="/images/badges/valid-atom.png" alt="Site Feed"/></a></div>
            <div><img src="/images/badges/upallnight.gif" alt="Up All Night Gif"/></div>
            <div><a rel="noopener" target="_blank" href="https://indieweb.org/"><img src="/images/badges/indieweb.png" alt="People-focused alternative to the corporate web."/></a></div>
            <div><a rel="noopener" target="_blank" href="https://people.pledge.party/"><img src="/images/badges/people-pledge.png" alt="People Pledge"/></a></div>
            <div><a rel="noopener" target="_blank" href="https://thewebisfucked.kevquirk.com/"><img src="/images/badges/web-is-f.gif" alt="The Web Is Fucked"/></a></div>
            <div><a rel="noopener" target="_blank" href="https://indieweb.org/Webmention"><img src="/images/badges/webmention.png" alt="Webmention is an open web standard"/></a></div>
          </div>
          <link href="https://mas.to/@abf" rel="me"/>
          <link href="https://github.com/andrefcodes" rel="me"/>
          <link href="https://codeberg.org/abf" rel="me"/>
          <link href="https://git.sr.ht/~abf/" rel="me"/>
        </footer>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
