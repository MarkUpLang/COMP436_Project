<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:param name="size" select="8"/>


<xsl:template match="cookbook">
      <xsl:for-each select="recipe[type='North'][position() mod $size = 1]">
         <div id="page{position()}" class="page">
            <xsl:apply-templates select="self::*|following-sibling::*[position() &lt; $size]"/>
         </div>
      </xsl:for-each>
</xsl:template>

<xsl:template match="recipe[type='North']">
    <div class="item  col-xs-3 col-lg-3">
            <div class="thumbnail" style="border:none;">
                <a href="#" data-toggle="modal" data-target="#myModal">
                    <img class="img-circle" alt="" >
                        <xsl:attribute name="src">
                            <xsl:value-of select="imageurl" />
                        </xsl:attribute>
                    </img>
                </a>
                <div class="caption">
                    <h4 class="group inner list-group-item-heading">
                        <xsl:value-of select="title"/>
                    </h4>
                </div>
            </div>
        </div>

        <!-- <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Modal Header</h4>
                    </div>

                    <div class="modal-body">
                            jhgjgjkj
                    </div>
            
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div> -->

  </xsl:template>



</xsl:stylesheet>
