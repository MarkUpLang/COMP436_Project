<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:param name="size" select="8"/>


<xsl:template match="cookbook">
      <xsl:for-each select="recipe[type='South'][position() mod $size = 1]">
         <div id="page{position()}">
            <xsl:apply-templates select="self::*|following-sibling::*[position() &lt; $size]"/>
         </div>
      </xsl:for-each>
</xsl:template>


 
<xsl:template match="recipe[type='South']">      
    <div class="item  col-xs-3 col-lg-3">
            <div class="thumbnail">
                <img class="img-circle" src="http://placehold.it/250/250/fff" alt="" >
                    <!-- <xsl:attribute name="src">
                        <xsl:value-of select="http://placehold.it/250/250/fff" />
                    </xsl:attribute> -->
                </img>
                <div class="caption">
                    <h4 class="group inner list-group-item-heading">
                        <xsl:value-of select="title"/>
                    </h4>
                </div>
            </div>
        </div>
   

   <!-- <div class="item  col-xs-3 col-lg-3">
            <div class="thumbnail">
                <img class="img-circle" src="http://placehold.it/250/250/fff" alt="" />
                <div class="caption">
                    <h4 class="group inner list-group-item-heading">
                        <xsl:value-of select="title"/></h4>
                     <p class="group inner list-group-item-text">
                        Intro</p>
                      <div class="row">
                        <div class="col-xs-12 col-md-6">
                            <p class="lead">
                                $21.000</p>
                        </div>
                        <div class="col-xs-12 col-md-6">
                            <a class="btn btn-success" href="http://www.jquery2dotnet.com">Add to cart</a>
                        </div>
                    </div>
                </div> 
            </div>
        </div> -->
  
</xsl:template>
</xsl:stylesheet>

