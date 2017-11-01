<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
    <body>
      <h3>Historical Places</h3>
      <xsl:apply-templates select="historical_places/place">
        <xsl:sort select="location" order="ascending" data-type="string" />
      </xsl:apply-templates>
    </body>
  </html>
</xsl:template>

<xsl:template match="place">
  <p><xsl:apply-templates select="name[@language='english']"/></p>
</xsl:template>

<xsl:template match="name[@language='english']">
  <p><xsl:value-of select="."/></p>
</xsl:template>

</xsl:stylesheet>