<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>

<xsl:output method="html" indent="yes"/>
<xsl:strip-space elements="*"/>

<xsl:param name="DependencyData" select="$RtnDoc/SmallBusInvstCompanyStockStmt"/>

<xsl:param name="depDocTitle">
  <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
</xsl:param>

<!-- Template to display ExpndAffltGroupAllocnCalcStmt -->
<xsl:template name="SmallBusInvstCompanyStockStmtTemp">
    <table id="SmallBusInvstCompanyStockStmtTbl" class="styDepTbl">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
<!--          <th class="styTblCell" scope="col">Item No.</th>       -->
           <th class="styDepTblCell" scope="col" style="width:55mm">Name Of Small Business</th>
           <th class="styDepTblCell" scope="col" style="width 55mm">Address Of Small Business</th>
           <th class="styDepTblCell" scope="col" style="width:55mm">Reason The Stock Is Worthless</th>
           <th class="styDepTblCell" scope="col" style="width:22mm">Date Stock Became Worthless</th>           
        </tr>
      </thead>
      <xsl:for-each select="$DependencyData/SmallBusinessInvstCompanyStock">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
<!--          <td class="styDepTblCell" style="text-align:center;" ><xsl:value-of select="position()" /></td>-->
          <td class="styDepTblCell" style="text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="BusinessNameLine1Txt"/>
            </xsl:call-template>
          </td>
                   
            <td class="styDepTblCell" style="text-align:left;width=55mm;">
            	<xsl:choose>
          		<xsl:when test="USAddress">
               		<xsl:call-template name="PopulateUSAddressTemplate">
                    		<xsl:with-param name="TargetNode" select="USAddress"/>
               		</xsl:call-template>
          		</xsl:when>
          		<xsl:otherwise>
              		<xsl:call-template name="PopulateForeignAddressTemplate">
                    		<xsl:with-param name="TargetNode" select="ForeignAddress"/>
               		</xsl:call-template>
          		</xsl:otherwise>
     		</xsl:choose>
 <!--    Corrected problems in code below but replaced anyway with Populate USAddress template 4/04/07- jwong     
          
         <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="AddressOfSmallBusiness/AddressLine1" />
              </xsl:call-template>
              <xsl:if test="AddressOfSmallBusiness/AddressLine2 != ''">
                <br /><xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="AddressOfSmallBusiness/AddressLine2" />   
                     </xsl:call-template>
                  </xsl:if>
              <xsl:if test="AddressOfSmallBusiness/City != ''"><br />
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="AddressOfSmallBusiness/City" />
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="AddressOfSmallBusiness/State != ''">,
              
  *****  note comma use in previous line       
  
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="AddressOfSmallBusiness/State" />
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="AddressOfSmallBusiness/ZIPCode != ''"><span style="width:7px;"></span>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="AddressOfSmallBusiness/ZIPCode" />
                </xsl:call-template>
              </xsl:if>
 --> 
            </td>  
         

         
          <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ReasonTheStockIsWorthlessTxt"/>
              </xsl:call-template>
            </td>
          <td class="styDepTblCell" style="text-align:center;" nowrap="yes">
              <xsl:call-template name="PopulateMonthDayYear">
                <xsl:with-param name="TargetNode" select="StockBecameWorthlessDt"/>
              </xsl:call-template>
          </td>
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>


  
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
       <meta name="Author" content="Ravi venigalla :: raviven@us.ibm.com"/>
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
        <span class="styDepTitle">
          <span style="width:142mm;">        
            <xsl:value-of select="$depDocTitle"/>
          </span>        
        </span>
      </div>
        
      <xsl:call-template name="PopulateDepCommonLeftover">
        <xsl:with-param name="TargetNode" select="$DependencyData"/>
      </xsl:call-template>
        
      <xsl:call-template name="SmallBusInvstCompanyStockStmtTemp"/>
      <br/>                      
    </body>
  </html>
</xsl:template>
</xsl:stylesheet>