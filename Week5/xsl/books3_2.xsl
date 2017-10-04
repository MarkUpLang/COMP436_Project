<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html> 
<body>
  <h1>My Library</h1>
  <table border="1">
    <tr>
      <h2>Group E - No BOOKS in 1937</h2>
      <th>Title</th>
      <th>Author</th>
      <th>Price</th>
      <th>Genre</th>
      <th>Year</th>
    </tr>
    <xsl:for-each select="collection/book[year='1937']">
    <tr>
      <td><xsl:value-of select="title"/></td>
      <td><xsl:value-of select="author"/></td>
      <td><xsl:value-of select="price"/></td>
      <td><xsl:value-of select="genre"/></td>
      <td><xsl:value-of select="year"/></td>
    </tr>
  </xsl:for-each>
  </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>

