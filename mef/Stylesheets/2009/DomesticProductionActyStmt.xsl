<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
    
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>  
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="DependencyData" select="$RtnDoc/DomesticProductionActyStmt" />
  <!-- Display Name is Domestic Production Activities Statement 2-->
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$DependencyData" />
    </xsl:call-template>  
  </xsl:param>
      
  <xsl:template name="DependencyTemplate"> 
    <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Total:</span></div>
          <div style="float:left;clear:none;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/Total"/>
            </xsl:call-template>
          </div>
        </div>
 <!-- Table begin -->     
    <table class="styDepTbl" style="margin-top:4mm;">
      <thead class="styTableThead">        
        <tr class="styDepTblHdr">           
           <th class="styDepTblCell" scope="col">
             Code
          </th>
           <th class="styDepTblCell" scope="col">
             Description
          </th>
          <th class="styDepTblCell" scope="col">       
            Amount
          </th>                
        </tr>
      </thead>  
      <tfoot></tfoot>
      <tbody>    
      <xsl:for-each select="$DependencyData/DomesticProductionActivity">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>                          
          <td class="styDepTblCell" align="left">
         	 <span style="width:35mm">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="Code" />
            </xsl:call-template>
            </span>
          </td>  
          <td class="styDepTblCell" align="left">
            <span style="width:117mm">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="Description" />
              </xsl:call-template>    
            </span>
          </td>
          <td class="styDepTblCell" align="right">   
            <span style="width:35mm">         
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="Amount" />
              </xsl:call-template>     
            </span>                             
          </td>  
        </tr>
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
         <meta name="Description" content="{$depDocTitle}" />        
        
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
        <span  style="width:110mm;">
                <xsl:value-of select="$depDocTitle" />
                </span>
            <span style="width:2mm;"/>  
          </span>
        </div>        
        
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>                    
        <xsl:call-template name="DependencyTemplate" />            

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







