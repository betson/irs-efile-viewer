<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>    
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="DependencyData" select="$RtnDoc/ChangeToCashMethodStatement" />
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
  </xsl:param>
    
  
  <xsl:template name="DependencyTemplate">        
    <xsl:param name="thisNode" />    
    <table class="styDepTbl" style="margin-top:4mm;">
      <thead class="styTableThead">        
        <tr class="styDepTblHdr">           
           <th class="styDepTblCell" scope="col">
             A description of inventory items and materials and supplies used in carrying out the applicant's business
          </th>
          <th class="styDepTblCell" scope="col">
             An explanation as to whether the applicant is required to use the accrual method under any section of the Code or regulations   
          </th>         
        </tr>
      </thead>  
      <tfoot></tfoot>
      <tbody>    
      <xsl:for-each select="$thisNode">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>                
          <td class="styDepTblCell" style="text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="InvntryItemsAndMtrlSupDesc" />
            </xsl:call-template>    
          </td>
          <td class="styDepTblCell" style="text-align:left;">            
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="RqrApplicantUesAccrMethodExpln" />
            </xsl:call-template>                
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
         <title>
           <!--Financial Services Income Statement-->
          <xsl:value-of select="$depDocTitle" />
        </title>
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
          <div class="styDepTitle" style="width:100mm">
            <!--TY 2003 Change to Cash Method Statement-->      
            <xsl:value-of select="$depDocTitle" />        
          </div>
        </div>                
                
        <xsl:call-template name="PopulateDepCommonLeftover">
          <xsl:with-param name="TargetNode" select="$DependencyData"/>
        </xsl:call-template>          
        
        <xsl:call-template name="DependencyTemplate">  
          <xsl:with-param name="thisNode" select="$DependencyData/ChangeToCashMethodInfo"/>                  
        </xsl:call-template>  
        
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







