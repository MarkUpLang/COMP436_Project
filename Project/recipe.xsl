<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html> 
<body>
  <h1>Recipe</h1>
  <div>

  </div>
  <table>
    <xsl:for-each select="cookbook/recipe">
    <h2><caption><xsl:value-of select="title"/></caption></h2>

    <tr>
      <th>Prep Time:</th>
      <td><xsl:value-of select="preptime"/></td>
   </tr>

    <tr>
      <th>Serves:</th>
      <td><xsl:value-of select="serves"/></td>
    </tr>

    <tr>
      <th>Category:</th>
      <td><xsl:value-of select="category"/></td>
    </tr>

    <tr>
      <th>Cuisine:</th>
      <td><xsl:value-of select="cuisine"/></td>
    </tr>

    <tr>
      <th>Ingredients:</th>
      <td><xsl:value-of select="ingredient"/></td>
    </tr>

    <tr>
      <th>Description:</th>
      <td><xsl:value-of select="description"/></td>
    </tr>

  </xsl:for-each>
  </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>

