<?xml version="1.0" encoding="UTF-8"?>
<!--UWR123023 IE11 Upgrade Fixes 5/22/15 by Robert L Jones-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="DependencyData" select="$RtnDoc/LoansToFromOfficersSchedule"/>
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
  </xsl:param>

  <xsl:template name="DependencyTemplate">    
    <xsl:for-each select="$DependencyData/LoansToFromOfficerDetail">
    <table id="LTOSTbl" class="styDepTbl" style="font-size:8pt;">
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="width:40%;text-align:right;">Item No.                
        </th>
        <td class="styDepTblCell" style="text-align:center;"><xsl:value-of select="position()"/></td>
      </tr>      
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Borrower or Lender Name    
        </th>
        <td class="styDepTblCell" style="text-align:left;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="BorrowerOrLenderPersonNm"/>                              </xsl:call-template>
        </td>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Borrower or Lender Title    
        </th>
        <td class="styDepTblCell" style="text-align:left;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="BorrowerOrLenderTitleTxt"/>                              </xsl:call-template>
        </td>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Original Amount of Loan  
        </th>
        <td class="styDepTblCell" style="text-align:left;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="LoanOriginalAmt"/>                              </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Balance Due
        </th>
        <td class="styDepTblCell" style="text-align:left;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="BalanceDueAmt"/>                                  </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Date of Note        
        </th>
        <td class="styDepTblCell" style="text-align:left;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="NoteDt"/>                        </xsl:call-template>
        </td>
      </tr>
      
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Maturity Date        
        </th>
        <td class="styDepTblCell" style="text-align:left;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="LoanMaturityDt"/>                        </xsl:call-template>
        </td>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Repayment Terms        
        </th>
        <td class="styDepTblCell" style="text-align:left;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="RepaymentTermsTxt"/>                      </xsl:call-template>
        </td>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
            Interest Rate        
        </th>
        <td class="styDepTblCell" style="text-align:left;">
          <span style="width:48mm;text-align:right;">
            <xsl:call-template name="PopulatePercent">
              <xsl:with-param name="TargetNode" select="InterestRt"/>                                  </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Security Provided by Borrower        
        </th>
        <td class="styDepTblCell" style="text-align:left;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="SecurityProvidedBorrowerTxt"/>                    </xsl:call-template>
        </td>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Purpose of Loan        
        </th>
        <td class="styDepTblCell" style="text-align:left;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="LoanPurposeTxt"/>                        </xsl:call-template>
        </td>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Description of Lender Consideration        
        </th>
        <td class="styDepTblCell" style="text-align:left;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="LenderConsiderationDesc"/>                        </xsl:call-template>
        </td>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Consideration FMV      
        </th>
        <td class="styDepTblCell" style="text-align:left;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="ConsiderationFMVAmt"/>                                </xsl:call-template>
          </span>
        </td>
      </tr>
      
      
    </table>
    <br/>
    </xsl:for-each>    
  </xsl:template>
  
      <xsl:template name="GetClass">
    <xsl:attribute name="class">
      <xsl:choose>
         <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
         <xsl:otherwise>styDepTblRow2</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
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
         <meta name="Description" content="{$depDocTitle}"/>
         <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"/>
        <xsl:call-template name="InitJS"/>

        
        <style type="text/css">
        </style>
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
            <xsl:value-of select="$depDocTitle"/></span>        
         
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
        <span style="height:5px;"/>
        <xsl:call-template name="DependencyTemplate">
        </xsl:call-template>  
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>