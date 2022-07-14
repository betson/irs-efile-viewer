<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>

<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />

  <xsl:param name="DependencyData" select="$RtnDoc/ItemizedOthCurrLiabilitiesSch" />

  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
  </xsl:param>  

  <xsl:template name="ItemizedOthCurrentLiabilitiesTemp">
    <table id="ItemizedOthCurrentLiabilitiesTbl" class="styDepTbl" style="width:187mm;">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col" style="width:40mm;">Corporation Name</th>
          <th class="styDepTblCell" scope="col" style="width:23mm;">Corporation EIN</th>
          <th class="styDepTblCell" scope="col" style="width:66mm;">Description</th>
          <th class="styDepTblCell" scope="col" style="width:29mm;">Beginning Amount</th>
          <th class="styDepTblCell" scope="col" style="width:29mm;">Ending<br/> Amount</th>
        </tr>
       </thead>
        <tfoot></tfoot>
        <tbody>
        <xsl:for-each select="$DependencyData/ItemizedOtherCurrentLiability">  
          <tr>
            <!-- Set row background color -->
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <td class="styDepTblCell" scope="col"  style="text-align:left;font-size: 7pt;">
              <xsl:attribute name="rowspan">
                <xsl:value-of select="count(OtherCurrLiabilityLineItem)"/>
              </xsl:attribute>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine1" />
              </xsl:call-template>
              <xsl:if test="CorporationName/BusinessNameLine2">
                <br/>
                <xsl:call-template name="PopulateText">          
                  <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine2" />
                </xsl:call-template>
              </xsl:if>
            </td>
              <td class="styDepTblCell" scope="col"  style="text-align:center;font-size: 7pt;">
                <xsl:attribute name="rowspan">
                  <xsl:value-of select="count(OtherCurrLiabilityLineItem)"/>
                </xsl:attribute>
                 <xsl:choose>
                     <xsl:when test="CorporationEIN">
                       <xsl:call-template name="PopulateEIN">
                          <xsl:with-param name="TargetNode" select="CorporationEIN" />
                      </xsl:call-template>
                   </xsl:when>
                  <xsl:when test="MissingEINReason">
                     <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="MissingEINReason" />
                    </xsl:call-template>
                 </xsl:when>
             </xsl:choose>
            </td>
            <xsl:for-each select="OtherCurrLiabilityLineItem">
              <xsl:if test="position() = 1">                            
              <td class="styDepTblRow1Cell" scope="col"  style="text-align:left;font-size: 7pt;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="Description" />
                </xsl:call-template>
              </td>
              <td class="styDepTblRow1Cell" scope="col"  style="text-align:right;font-size: 7pt;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="BeginningAmount" />
                </xsl:call-template>
              </td>
              <td class="styDepTblRow1Cell" scope="col"  style="text-align:right;font-size: 7pt;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="EndingAmount" />
                </xsl:call-template>
              </td>
              </xsl:if>
            </xsl:for-each>                                      
          </tr>
                                          
          <xsl:for-each select="OtherCurrLiabilityLineItem">        
            <xsl:if test="position() &gt; 1">
              <tr>
                <!-- Set row background color -->
                <xsl:attribute name="class">
                  <xsl:choose>
                     <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                     <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                  </xsl:choose>
                </xsl:attribute>
                <td class="styDepTblCell" scope="col"  style="text-align:left;font-size: 7pt;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="Description" />
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" scope="col"  style="text-align:right;font-size: 7pt;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="BeginningAmount" />
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" scope="col"  style="text-align:right;font-size: 7pt;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="EndingAmount" />
                  </xsl:call-template>
                </td>
              </tr>
            </xsl:if>
          </xsl:for-each>
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>  
  
  <!-- Main template -->
  <xsl:template match="/">
    <html>
      <head>
         <title><xsl:value-of select="$depDocTitle" /></title>
         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache" />
         <meta http-equiv="Cache-Control" content="no-cache" />
         <meta http-equiv="Expires" content="0" />
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private" />
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
         <meta name="Author" content="Donna Hoffmeister" />
         <meta name="Description" content= "{$depDocTitle}" />
          
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
        <xsl:call-template name="InitJS"></xsl:call-template>    
        <style type="text/css">
  <xsl:if test="not($Print) or $Print=''">
    <xsl:call-template name="AddOnStyle"></xsl:call-template>    
  </xsl:if>
</style>
  
      <xsl:call-template name="GlobalStylesDep"/>
</head>
    
      <body class="styBodyClass">
        <xsl:call-template name="DocumentHeaderDependency"></xsl:call-template>    
          <div class="styDepTitleLine">
            <span class="styDepTitle">
              <span style="width:115mm;">
                <xsl:value-of select="$depDocTitle" />            
              </span>
            </span>
          </div>                
          <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>
          <xsl:call-template name="ItemizedOthCurrentLiabilitiesTemp" />
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







