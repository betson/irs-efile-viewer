<?xml version="1.0" encoding="UTF-8" ?>
<!--Created by Doug Peterson 6-26-2006-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="AOVSSData" select="$RtnDoc/DispositionPropSect179DedStmt" />
    <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$AOVSSData" />
    </xsl:call-template>  
  </xsl:param>

  <!-- Main template -->
  <xsl:template match="/">
    <html>
      <head>
        <title>
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
        <meta name="Author" content="Chris Sinderson" />
        <meta name="Description" content= "{$depDocTitle}" /> 
        
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
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
          <span class="styDepTitle" style="width:85mm">          
            <xsl:value-of select="$depDocTitle" />  
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover">
          <xsl:with-param name="TargetNode" select="$AOVSSData" />
        </xsl:call-template>      
        
        <xsl:call-template name="ShowAOVSS" />          
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
      <tfoot></tfoot>
      <tbody>    
        <xsl:for-each select="$AOVSSData/Item">  
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
                <xsl:with-param name="TargetNode" select="DescriptionOfProperty" />
              </xsl:call-template>
            </td>        
             <td class="styDepTblCell" style="text-align:left;width:23mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="DateAcquired" />
              </xsl:call-template>
            </td>
             <td class="styDepTblCell" style="text-align:left;width:23mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="DatePlacedInService" />
              </xsl:call-template>
            </td>
             <td class="styDepTblCell" style="text-align:left;width:23mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="DateOfSaleOtherDisposition" />
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="text-align:right;width:33mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="PartnersShareGroSalesAmtRlzd" />
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
      <tfoot></tfoot>
      <tbody>    
        <xsl:for-each select="$AOVSSData/Item">  
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
                <xsl:with-param name="TargetNode" select="PartnersShareOfCost" />
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="text-align:right;width:33mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="PartnersShareDeprecSect179Ded" />
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="text-align:right;width:33mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="Deduction" />
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="text-align:right;width:33mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="DispositionDueCasualtyOrTheft" />
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="AdditionalInformation" />
              </xsl:call-template>
            </td>
          </tr>      
        </xsl:for-each>
      </tbody>
    </table>

  </xsl:template>
  
</xsl:stylesheet>
