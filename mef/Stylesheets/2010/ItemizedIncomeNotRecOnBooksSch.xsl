<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>

  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />

  <xsl:param name="DependencyData" select="$RtnDoc/ItemizedIncomeNotRecOnBooksSch" />

  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" />
    </xsl:call-template>  
  </xsl:param>  
  
  <xsl:template name="ItemizedIncomeNotRecOnBooksSchTemp">
    <table id="ItemizedIncomeNotRecOnBooksSchTbl" class="styDepTbl">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell" scope="col">Corporation Name</th>
           <th class="styDepTblCell" scope="col">Corporation EIN</th>
           <th class="styDepTblCell"  scope="col">Description</th>
           <th class="styDepTblCell"  scope="col">Amount</th>
        </tr>
      </thead>
      <xsl:for-each select="$DependencyData/ItemizedIncomeNotRecOnBooks">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
        <td class="styDepTblCell" style="text-align:left;width:50mm;font-family:verdana;font-size:6pt" >
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine1" />
          </xsl:call-template>
          <br/>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine2" />
          </xsl:call-template>          
        </td>
        <td class="styDepTblCell" style="text-align:center;width:23mm" >
           <xsl:choose>
            <xsl:when test="CorporationEIN">
                       <xsl:call-template name="PopulateEIN">
                          <xsl:with-param name="TargetNode" select="CorporationEIN" />
                      </xsl:call-template>
             </xsl:when>
             <xsl:otherwise>
                    <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="MissingEINReason" />
                    </xsl:call-template>
                    </xsl:otherwise>
               </xsl:choose>
         </td>
        <td class="styDepTblCell" style="text-align:left;width:80mm" >
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="Description" />
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="text-align:right;width:34mm" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="Amount" />
          </xsl:call-template>
        </td>
        </tr>
      </xsl:for-each>
      <tr class="styDepTblHdr">
        <td class="styDepTblCell" colspan="3" style="text-align:left; font-weight: bold">Total</td>
        <td class="styDepTblCell" style="text-align:right;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="WhiteFont">true</xsl:with-param>
            <xsl:with-param name="TargetNode" select="$DependencyData/Total" />
          </xsl:call-template>             
        </td>
      </tr>
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
         <meta name="Author" content="Beju Ekperigin :: beju@us.ibm.com" />
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
              <span style="width:68mm;">
                <xsl:value-of select="$depDocTitle" />
              </span>
            </span>
          </div>        
          <xsl:call-template name="PopulateDepCommonLeftover">
            <xsl:with-param name="TargetNode" select="$DependencyData" />
          </xsl:call-template>          
          <xsl:call-template name="ItemizedIncomeNotRecOnBooksSchTemp" />
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
