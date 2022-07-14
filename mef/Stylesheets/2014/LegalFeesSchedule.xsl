<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
    
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="DependencyData" select="$RtnDoc/LegalFeesSchedule"/>
  
  <!-- Template to display table items -->
  
  <xsl:template name="ShowDependencyData">
  
    <!-- Itemized Other Income Schedule Data -->
    
    <table id="DependencyDataTbl" class="styDepTbl">
      <thead class="styTableThead">
      <tr class="styDepTblHdr">  
           <th class="styDepTblCell" scope="col">Category</th>        
            <th class="styDepTblCell" scope="col">Amount</th>      
            <th class="styDepTblCell" scope="col">Net Investment Income</th>
            <th class="styDepTblCell" scope="col">Adjusted Net Income</th>
            <th class="styDepTblCell" scope="col">Disbursements for Charitable Purposes</th>
      </tr>
      </thead>
        <tfoot/>
               <tbody>
      <xsl:for-each select="$DependencyData/LegalFeesGrp">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
        
              <td class="styDepTblCell" style="text-align:left;font-size:7pt;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="CategoryTxt"/>
                </xsl:call-template>                   
              </td>                    
              <td class="styDepTblCell" style="text-align:right;width: 32mm;font-size:7pt;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="LegalFeesAmt"/>
                </xsl:call-template>
              </td>       
              <td class="styDepTblCell" style="text-align:right;width: 32mm;font-size:7pt;">
                <span style="text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="NetInvestmentIncomeAmt"/>
                  </xsl:call-template>
                </span>
              </td>
              <td class="styDepTblCell" style="text-align:right;width: 32mm;font-size:7pt;">
                <span style="text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="AdjustedNetIncomeAmt"/>
                  </xsl:call-template>
                </span>
              </td>
              <td class="styDepTblCell" style="text-align:right;width: 32mm;font-size:7pt;">
                <span style="text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="DisbursementsCharitablePrpsAmt"/>
                  </xsl:call-template>
                </span>
              </td>
            </tr>
      </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
  
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
  </xsl:param>
  
  <!-- Main template -->
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
          <title><xsl:value-of select="$depDocTitle"/></title>

         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache"/>
         <meta http-equiv="Cache-Control" content="no-cache"/>
         <meta http-equiv="Expires" content="0"/>
         
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private"/>
         
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
         <meta name="Author" content="Jason Iozzo"/>
         <meta name="Description" content="{$depDocTitle}"/> 
                
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
           
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="AddOnStyle"/>    
          </xsl:if>
        </style>
      <xsl:call-template name="GlobalStylesDep"/>
</head>    
      <body class="styBodyClass">
        <xsl:call-template name="DocumentHeaderDependency"/>
          
        <div class="styDepTitleLine">
          <span class="styDepTitle" style="width:68mm;">
            <xsl:value-of select="$depDocTitle"/>        
          </span>
        </div>
        
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>        
                
        <xsl:call-template name="ShowDependencyData"/>          
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>