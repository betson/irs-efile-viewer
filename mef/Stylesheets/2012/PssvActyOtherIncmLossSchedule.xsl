<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
    
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>  
  
  <xsl:param name="OIPASData" select="$RtnDoc/PssvActyOtherIncmLossSchedule" />
  <!-- Schema location: common-PssvActyOtherIncmLossSchedule-->
  <!-- Template to display Passive Activity Other Income (Loss) Schedule -->
  
  <xsl:template name="ShowOIPAS">
    <!-- Itemized  Schedule Data -->
    <table id="OIPASTbl" class="styDepTbl">
      <thead class="styTableThead">
      <tr class="styDepTblHdr">         
         <th class="styDepTblCell" style="text-align:center;width:65mm;">Name of trade/business</th>
         <th class="styDepTblCell" style="text-align:center;width:85mm;">Description</th>  
          <th class="styDepTblCell" style="text-align:center;width:36mm;">Amount</th>      
      </tr>
      </thead>
        <tfoot></tfoot>
       <tbody>
      <xsl:for-each select="$OIPASData/PssvActyOtherIncomeLoss">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
          <td class="styDepTblCell" style="text-align:left;width:65mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="NameOfTradeOrBusiness/BusinessNameLine1"/>
            </xsl:call-template>
            <xsl:if test="NameOfTradeOrBusiness/BusinessNameLine2 != ''">
              <br />
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="NameOfTradeOrBusiness/BusinessNameLine2"/>
              </xsl:call-template>
            </xsl:if>          
          </td>
          <td class="styDepTblCell" style="text-align:left;width:85mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="Description"/>
            </xsl:call-template>
          </td>  
          <td class="styDepTblCell" style="vertical-align:bottom;text-align:right;width:36mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="Amount"/>
            </xsl:call-template>
          </td>          
        </tr>
      </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
  
  
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$OIPASData" /></xsl:call-template>  
  </xsl:param>
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
         <meta name="Author" content="Ravi Venigalla" />
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
      <body class="styBodyClass" >
        <xsl:call-template name="DocumentHeaderDependency"></xsl:call-template>    
        <div class="styDepTitleLine">
          <span class="styDepTitle" style="width:126mm">
            <xsl:value-of select="$depDocTitle" />        
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$OIPASData" /></xsl:call-template>        
              
        <xsl:call-template name="ShowOIPAS" />          
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







