<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
    <body>
      <h3>Historical places in India</h3>
      <table border="1">
        <xsl:apply-templates select="historical_places/place">
          <xsl:sort select="location" order="ascending" data-type="string" />
        </xsl:apply-templates>
      </table>
    </body>
  </html>
</xsl:template>

<xsl:template match="place">
  <tr>
    <xsl:apply-templates select="name[@language='english']"/>
    <xsl:apply-templates select="history"/>
  </tr>
</xsl:template>

<xsl:template match="name[@language='english']">
  <td>
    <xsl:value-of select="."/>
  </td>
</xsl:template>

<xsl:template match="history">
  <td>
    <xsl:value-of select="period"/>
    <xsl:text>, 16th century (</xsl:text>
    <xsl:value-of select="period/@era"/>
    <xsl:text>)</xsl:text>
  </td>
  <td>
    <xsl:value-of select="./dynasty"/>
    <xsl:text> dynasty</xsl:text>
  </td>
</xsl:template>

</xsl:stylesheet>