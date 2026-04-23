<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:sm="http://www.sitemaps.org/schemas/sitemap/0.9"
  exclude-result-prefixes="sm">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html lang="en">
      <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>
          <xsl:choose>
            <xsl:when test="sm:sitemapindex">Sitemap Index</xsl:when>
            <xsl:otherwise>URL Sitemap</xsl:otherwise>
          </xsl:choose>
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
            max-width: 56rem;
            margin: 0 auto;
            padding: 2rem 1rem;
            color: var(--main-text-color);
            background: var(--main-background-color);
            line-height: 1.55;
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
            margin: .75rem 0 1rem;
            padding: .9rem 1rem;
            border: 1px solid var(--main-text-color);
            background: var(--accent-background-color);
            font-size: .95rem;
          }
          table {
            width: 100%;
            border-collapse: collapse;
            border: 1px solid var(--main-text-color);
          }
          th, td {
            border-bottom: 1px solid var(--main-text-color);
            padding: .55rem .5rem;
            text-align: left;
            vertical-align: top;
            font-size: .95rem;
          }
          th {
            background: var(--accent-background-color);
            color: var(--accent-text-color);
            font-weight: 600;
          }
          td:last-child { white-space: nowrap; }
          a {
            color: var(--main-text-color);
            word-break: break-all;
          }
          a:hover { color: var(--link-color); }
        </style>
      </head>
      <body>
        <xsl:choose>
          <xsl:when test="sm:sitemapindex">
            <h1>Sitemap Index</h1>
            <p class="meta">List of sitemap files for this site.</p>
            <table>
              <thead>
                <tr><th>Sitemap</th></tr>
              </thead>
              <tbody>
                <xsl:for-each select="sm:sitemapindex/sm:sitemap">
                  <tr>
                    <td>
                      <a>
                        <xsl:attribute name="href"><xsl:value-of select="sm:loc"/></xsl:attribute>
                        <xsl:value-of select="sm:loc"/>
                      </a>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:when>
          <xsl:otherwise>
            <h1>URL Sitemap</h1>
            <p class="meta">List of URLs included in this sitemap.</p>
            <table>
              <thead>
                <tr><th>URL</th><th>Last Modified</th></tr>
              </thead>
              <tbody>
                <xsl:for-each select="sm:urlset/sm:url">
                  <tr>
                    <td>
                      <a>
                        <xsl:attribute name="href"><xsl:value-of select="sm:loc"/></xsl:attribute>
                        <xsl:value-of select="sm:loc"/>
                      </a>
                    </td>
                    <td><xsl:value-of select="sm:lastmod"/></td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:otherwise>
        </xsl:choose>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
