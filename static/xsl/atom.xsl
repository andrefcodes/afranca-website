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
            max-width: 48rem;
            margin: 0 auto;
            padding: 2rem 1rem;
            color: var(--main-text-color);
            background: var(--main-background-color);
            line-height: 1.6;
          }
          h1 {
            margin: 0;
            text-transform: uppercase;
            letter-spacing: .08em;
            font-family: var(--font-mono);
            font-size: 1.5rem;
            color: var(--accent-text-color);
          }
          h1::after {
            display: inline-block;
            content: "";
            width: .35em;
            height: .35em;
            margin-left: .15em;
            background: var(--link-color);
            border-radius: 1px;
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
        <h1><xsl:value-of select="atom:feed/atom:title"/></h1>
        <p class="meta">
          <xsl:text>Human-friendly view of this Atom feed. Subscribe using: </xsl:text>
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
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
