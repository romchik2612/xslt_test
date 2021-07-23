<xsl:stylesheet version = '1.0'
                xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>


<xsl:template match="/article">
    <xsl:apply-templates/>
    <head>
<title>
    <xsl:value-of select="title"/>
</title>
    </head>
</xsl:template>

    <xsl:template match="section">
        <b style="font-weight: bold;">
        <xsl:apply-templates/>
        </b>
    </xsl:template>

    <xsl:template match="title">
        <h3 style="color:blue;" id="">
            <xsl:attribute name="id">
                <xsl:value-of select="@id"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </h3>

    </xsl:template>

    <xsl:template match="toc">
        <nav>
            <xsl:apply-templates/>
        </nav>
    </xsl:template>
    <xsl:template match="para">
        <p>
        <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="code">
        <i style="font-weight: normal;">
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
            <b style="font-weight: normal;">
            <xsl:apply-templates/>
            </b>
        </li>
    </xsl:template>
    <xsl:template match="keycap">
        <b style="font-weight:900">
            <xsl:value-of select="."/>
        </b>
    </xsl:template>

    <xsl:template match="itemizedlist">
        <ul type="circle">
            <xsl:apply-templates/>
        </ul>
    </xsl:template>

</xsl:stylesheet>
