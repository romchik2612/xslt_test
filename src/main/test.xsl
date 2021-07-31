<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:redirect="org.apache.xalan.xslt.extensions.Redirect"
                extension-element-prefixes="redirect"
                >
    <xsl:output method="html"/>


    <xsl:template match="/">
<html>
    <head>
<title>
    <xsl:value-of select="article/title"/>
</title>
    </head>
    <body>
        <h3>
            <xsl:value-of select="article/title"/>
        </h3>
        <ul>
            <xsl:for-each select="article/section">
            <li>
                <a href="{concat('section', position(), '.html')}">
                    <xsl:value-of select="title"/>
                </a>
            </li>
            </xsl:for-each>
        </ul>
        <xsl:for-each select="article/section">
            <xsl:result-document method="html"
                                 include-content-type="no"
                                 href="{concat('section', position(), '.html')}"
                                 omit-xml-declaration="yes">
                <xsl:apply-templates select="." mode="create-html-file"/>

            </xsl:result-document>
        </xsl:for-each>
    </body>
</html>
</xsl:template>
    <xsl:template match="title">
        <h2>
            <xsl:value-of select="."/>
        </h2>
    </xsl:template>
    <xsl:template match="section" mode="create-html-file">
        <html>
            <head>
                <title><xsl:value-of select="title"/></title>
            </head>
            <body style="font-family: sans-serif;">
                <xsl:apply-templates select="."/>
                <form>
                    <xsl:for-each select="/article/section">
                        <button formaction="{concat('section', position(), '.html')}">

                                    <xsl:value-of select="title"/>
                        </button>
                    </xsl:for-each>
                    <button formaction="index.html">
                        Return to TOC
                    </button>
                </form>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="section">
        <div>
        <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="/article/title"/>

    <xsl:template match="para">
        <p>
        <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="code">
        <i style="font-weight: bold;">
            <xsl:value-of select="."/>
        </i>
    </xsl:template>
    <xsl:template match="emphasis">
        <em>
            <xsl:value-of select="."/>
        </em>
    </xsl:template>
    <xsl:template match="link">
        <a href="">
            <xsl:attribute name="href">
                <xsl:text>#</xsl:text>
                <xsl:value-of select="@linkend"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </a>
    </xsl:template>
    <xsl:template match="ulink">
        <a href="">
            <xsl:attribute name="href">
                <xsl:value-of select="@url"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </a>
    </xsl:template>
    <xsl:template match="orderedlist">
        <ol type="1">
            <xsl:apply-templates/>
        </ol>
    </xsl:template>
    <xsl:template match="listitem">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    <xsl:template match="keycap">
        <b style="background-color:powderblue;">
            <xsl:value-of select="."/>
        </b>
    </xsl:template>

    <xsl:template match="itemizedlist">
        <ul type="circle">
            <xsl:apply-templates/>
        </ul>
    </xsl:template>

</xsl:stylesheet>
