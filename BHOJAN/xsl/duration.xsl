<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:param name="size" select="8"/>
<xsl:param name="duration"/>


<xsl:template match="cookbook">
      <xsl:for-each select="recipe[totaltime=$duration][position() mod $size = 1]">
         <xsl:if test="totaltime=$duration">
            <div id="page{position()}" class="page">
                <xsl:apply-templates select="self::*|following-sibling::*[position() &lt; $size]"/>
            </div>
        </xsl:if>
     </xsl:for-each>
</xsl:template>


 
<xsl:template match="recipe"> 
     <xsl:if test="totaltime=$duration">
   <div class="item  col-xs-3 col-lg-3 col">
            <div class="thumbnail" style="border:none;">
                <a  href="#Recipes" data-toggle="modal">
                    <xsl:attribute name="data-target">
                        <xsl:value-of select="concat('#myModal',generate-id())"/>
                    </xsl:attribute>
                    <img class="img-circle" alt="" >
                        <xsl:attribute name="src">
                            <xsl:value-of select="imageurl" />
                        </xsl:attribute>
                    </img>
                </a>
                <div>
                    <h4 class="group inner list-group-item-heading">
                        <xsl:value-of select="title"/>
                    </h4>
                </div>
            </div>
    </div>


     <div class="modal fade" role="dialog">
            <xsl:attribute name="id">
                <xsl:value-of select="concat('myModal',generate-id())"/>
            </xsl:attribute>
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&#120;</button>
                        <h3 class="modal-title"><xsl:value-of select="title"/></h3>
                    </div>

                    <div class="modal-body">
                        <p><span><b>Preparation Time: </b> <xsl:value-of select="preptime"/></span></p>
                        <p><span><b>Cook Time: </b> <xsl:value-of select="cooktime"/></span></p>
                        <p><span><b>Servings: </b> <xsl:value-of select="quantity"/></span></p>
                        <p><span><b>Spice Level: </b> <xsl:value-of select="spicelevel"/></span></p>
                        <p><b>Ingredients:</b>
                            <ul>
                                <xsl:for-each select="ingredient/li">
                                    <li>
                                        <xsl:value-of select="."/>
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </p>
                        <p><b>Steps:</b>
                            <ol type="1">
                                <xsl:for-each select="preparation/li">
                                    <li>
                                        <xsl:value-of select="."/>
                                    </li>
                                </xsl:for-each>
                            </ol>
                        </p>
                        <p><b>Reference: </b>
                        <a>
                                <xsl:attribute name="href">
                                    <xsl:value-of select="source"/>
                                </xsl:attribute>
                                <xsl:value-of select="source"/>
                            </a>
                        </p>
                        <p>
                            <iframe width="420" height="345" frameborder="0" gesture="media" allow="encrypted-media">
                                 <xsl:attribute name="src">
                                     <xsl:value-of select="videourl" />
                                </xsl:attribute>
                            </iframe>
                        </p>
                    </div>
                </div>
            </div>
        </div>
</xsl:if>
</xsl:template>

<!-- <xsl:template match="cookbook">
      <xsl:for-each select="recipe">
         <xsl:if test="contains(taste,$taste)">
           <div class="item col-xs-3 col-lg-3">
            <div class="thumbnail" style="border:none;">
               <a  href="#Recipes" data-toggle="modal">
                    <xsl:attribute name="data-target">
                        <xsl:value-of select="concat('#myModal',generate-id())"/>
                    </xsl:attribute>
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


     <div class="modal fade" role="dialog">
            <xsl:attribute name="id">
                <xsl:value-of select="concat('myModal',generate-id())"/>
            </xsl:attribute>
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&#120;</button>
                        <h3 class="modal-title"><xsl:value-of select="title"/></h3>
                    </div>

                    <div class="modal-body">
                        <p><span><b>Preparation Time: </b> <xsl:value-of select="preptime"/></span></p>
                        <p><b>Ingredients:</b>
                            <ul>
                                <xsl:for-each select="seasoning/li">
                                    <li>
                                        <xsl:value-of select="."/>
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </p>
                        <p><b>Steps:</b>
                            <ol type="1">
                                <xsl:for-each select="description/li">
                                    <li>
                                        <xsl:value-of select="."/>
                                    </li>
                                </xsl:for-each>
                            </ol>
                        </p>
                        <p><b>Reference: </b><xsl:value-of select="reference"/></p>
                    </div>
                </div>
            </div>
        </div>
     </xsl:if>
      </xsl:for-each>
    </xsl:template> -->

<!-- <xsl:template match="cookbook">
      <xsl:for-each select="recipe">
         <xsl:if test="taste='Sweet'">
            <div id="page{position()}" class="page">
                <xsl:apply-templates select="self::*|following-sibling::*[position() &lt; $size]"/>
         </div>
     </xsl:if>
      </xsl:for-each>
</xsl:template>


 
<xsl:template match="recipe"> 
     <xsl:if test="taste='Sweet'">
   <div class="item  col-xs-3 col-lg-3">
            <div class="thumbnail" style="border:none;">
                <a id="modalOpen" href="#Recipes" class="singleRecep">
                    <xsl:attribute name="data-id">
                        <xsl:value-of select="concat('myModal',generate-id())"/>
                    </xsl:attribute>
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
</xsl:if>
</xsl:template> -->
</xsl:stylesheet>
