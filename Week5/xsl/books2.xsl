<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html> 
<body>
  <h1>My Library</h1>
  <table border="1">
    <tr>
      <h2>Group E - BOOKS</h2>
      <th>Title</th>
      <th>Author</th>
      <th>Price</th>
      <th>Genre</th>
      <th>Year</th>
    </tr>
    <tr>
      <td><xsl:value-of select="collection/book/title"/></td>
      <td><xsl:value-of select="collection/book/author"/></td>
      <td><xsl:value-of select="collection/book/price"/></td>
      <td><xsl:value-of select="collection/book/genre"/></td>
      <td><xsl:value-of select="collection/book/year"/></td>
    </tr>
  </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>

