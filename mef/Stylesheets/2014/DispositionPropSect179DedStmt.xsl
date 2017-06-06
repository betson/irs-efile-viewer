<?xml version="1.0" encoding="UTF-8"?>
<!--Created by Doug Peterson 6-26-2006--><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="AOVSSData" select="$RtnDoc/DispositionPropSect179DedStmt"/>
    <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$AOVSSData"/>
    </xsl:call-template>  
  </xsl:param>

  <!-- Main template -->
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title>
          <xsl:value-of select="$depDocTitle"/>
        </title>
        <!-- No Browser Caching -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private"/>
        <!-- Define Character Set -->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="Author" content="Chris Sinderson"/>
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
          <span class="styDepTitle" style="width:85mm">          
            <xsl:value-of select="$depDocTitle"/>  
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover">
          <xsl:with-param name="TargetNode" select="$AOVSSData"/>
        </xsl:call-template>      
        
        <xsl:call-template name="ShowAOVSS"/>          
        <br/>                      
      </body>
    </html>
  </xsl:template>
  
  <!-- Template for the Table of Data -->
  <xsl:template name="ShowAOVSS">
    <table id="AOVSSTbl" class="styDepTbl">
      <thead class="styTableThead">
        <!-- Label the Column Headers -->
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col">Description of property</th>        
          <th class="styDepTblCell" scope="col">Date acquired</th>  
          <th class="styDepTblCell" scope="col">Date placed in service</th>        
          <th class="styDepTblCell" scope="col">Date of sale/other disposition</th>
          <th class="styDepTblCell" scope="col">Partner’s share of gross sales/amount realized</th>  
          
        </tr>
      </thead>
      <tfoot/>
      <tbody>    
        <xsl:for-each select="$AOVSSData/DispPropSect179DedStmtItem">  
          <tr>
            <!-- Define background colors to the rows -->
            <xsl:attribute name="class">
              <xsl:choose>
                <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="PropertyDesc"/>
              </xsl:call-template>
            </td>        
             <td class="styDepTblCell" style="text-align:left;width:23mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="AcquiredDt"/>
              </xsl:call-template>
            </td>
             <td class="styDepTblCell" style="text-align:left;width:23mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="PlacedInServiceDt"/>
              </xsl:call-template>
            </td>
             <td class="styDepTblCell" style="text-align:left;width:23mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="SoldOrDisposedDt"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="text-align:right;width:33mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="PartnersShareGrossSalesRlzdAmt"/>
              </xsl:call-template>
            </td>
            
          </tr>      
        </xsl:for-each>
      </tbody>
    </table>
    <br/>
    <br/>
    <table id="AOVSSTbl" class="styDepTbl">
      <thead class="styTableThead">
        <!-- Label the Column Headers -->
        <tr class="styDepTblHdr">
           
          <th class="styDepTblCell" scope="col">Partner’s share of cost</th>  
          <th class="styDepTblCell" scope="col">Partner’s Share of the Depreciation Partner’s Share of Section 179 Deduction</th>  
          <th class="styDepTblCell" scope="col">Deduction</th>  
          <th class="styDepTblCell" scope="col">Disposition due to casualty or theft</th>
          <th class="styDepTblCell" scope="col">Additional information</th>  
        </tr>
      </thead>
      <tfoot/>
      <tbody>    
        <xsl:for-each select="$AOVSSData/DispPropSect179DedStmtItem">  
          <tr>
            <!-- Define background colors to the rows -->
            <xsl:attribute name="class">
              <xsl:choose>
                <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            
            
            <td class="styDepTblCell" style="text-align:right;width:33mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="PartnersShareOfCostAmt"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="text-align:right;width:33mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="PartnersShrDeprecSect179DedAmt"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="text-align:right;width:33mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="DeductionAmt"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="text-align:right;width:33mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="DispositionDueCsltyOrThftAmt"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="AdditionalInformationTxt"/>
              </xsl:call-template>
            </td>
          </tr>      
        </xsl:for-each>
      </tbody>
    </table>

  </xsl:template>
  
</xsl:stylesheet>