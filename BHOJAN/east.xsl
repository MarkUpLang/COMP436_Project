<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
  <h1> East Indian Food </h1>
  <table border="1" style="width:1030px;">
    <tr bgcolor="#9acd32">
      <th>Title</th>
      <th>Duration</th>
      <th>Ingredients</th>
      <th>Seasoning</th>
      <th>Description</th>
   </tr>
<xsl:for-each select="cookbook/recipe[type='East']">

    <tr>
      <td style="width:8%;"><xsl:value-of select="title"/></td>
      <td style="width:1%;"><xsl:value-of select="preptime"/></td>
      <td style="width:230px;">
          <ul>
              <xsl:for-each select="ingredient/li">
              <li>
                  <xsl:value-of select="."/>
              </li>
              </xsl:for-each>
          </ul>
      </td>

       <td style="width:240px;">
          <ul>
              <xsl:for-each select="seasoning/li">
              <li>
                  <xsl:value-of select="."/>
              </li>
              </xsl:for-each>
          </ul>
      </td>

       <td >
          <ul>
              <xsl:for-each select="description/li">
              <li>
                  <xsl:value-of select="."/>
              </li>
              </xsl:for-each>
          </ul>
      </td>

      <!-- <xsl:element name="img">
            <xsl:attribute name="id">
                <xsl:value-of select="imgid" />
            </xsl:attribute>
            <xsl:attribute name="src">
                <xsl:value-of select="name" />
            </xsl:attribute>
        </xsl:element> -->

    

    </tr>

  </xsl:for-each>
  </table>
</xsl:template>
</xsl:stylesheet>

