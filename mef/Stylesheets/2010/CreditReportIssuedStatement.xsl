<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  
  <xsl:param name="DependencyData" select="$RtnDoc/CreditReportIssuedStatement" />

  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$DependencyData" />
    </xsl:call-template>  
  </xsl:param>  

  <xsl:template name="CreditReportIssuedStatementTemp">
    <table id="CreditReportIssuedStatementTbl" class="styDepTbl" style="font-size: 8pt">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col">Receipient</th>
          <th class="styDepTblCell" scope="col">Date of Issuance</th>
          <th class="styDepTblCell"  scope="col">Inventory Method</th>
        </tr>
      </thead>
      
      <xsl:for-each select="$DependencyData/RecipientUsed">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
            <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
            <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>          
          <td class="styDepTblCell" style="text-align:left;width:45mm" >
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="Recipient/BusinessNameLine1" />
                </xsl:call-template>
                <xsl:if test="Recipient/BusinessNameLine2">             
                  <br/>
                   <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="Recipient/BusinessNameLine2" />
                  </xsl:call-template>
              </xsl:if>
          </td>          
                   
          <td class="styDepTblCell" style="text-align:center;width:35mm" >
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="DateofIssuance" />
            </xsl:call-template>
          </td>
          
          <td class="styDepTblCell" style="text-align:left;width:60mm" >
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="InventoryMethod" />
            </xsl:call-template>
          </td> 
                          
        </tr>
      </xsl:for-each>
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
      <meta name="Author" content="Beju Ekperigin" />
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
          <span style="width:52mm;"><xsl:value-of select="$depDocTitle" /></span>
        </span>
      </div>
      <xsl:call-template name="PopulateDepCommonLeftover">
        <xsl:with-param name="TargetNode" select="$DependencyData" />
      </xsl:call-template>      
      <xsl:call-template name="CreditReportIssuedStatementTemp" />
    </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
