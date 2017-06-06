<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
   <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:param name="MPSData" select="$RtnDoc/MultiplePayeesStatement" />
  <!-- Main template -->
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$MPSData" /></xsl:call-template>  
  </xsl:param>
  <!-- Main template -->
  <xsl:template match="/" >
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
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
         <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"></script>
        <xsl:call-template name="InitJS"></xsl:call-template>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="AddOnStyle"></xsl:call-template>    
          </xsl:if>
        </style>
      <xsl:call-template name="GlobalStylesDep"/>
    </head>    
    <body class="styBodyClass" style="width:187mm;">
      <xsl:call-template name="DocumentHeaderDependencyLandscape" />  
      <div class="styDepTitleLineLandscape">
          <span class="styDepTitle">
            <span style="width:78mm;"><xsl:value-of select="$depDocTitle" /></span>        
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape"><xsl:with-param name="TargetNode" select="$MPSData"/></xsl:call-template>
        <span style="height:5px;"></span>
        <xsl:call-template name="ShowMPS" />
      </body>
    </html>
  </xsl:template>
  <!-- Template to display Additional Information for Gross Foreign Distributions Schedule -->
  <xsl:template name="ShowMPS">
    <table id="MPSTbl" class="styDepTblLandscape">
      <thead class="styDepTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell" scope="col" style="width:auto;text-align:center;font-size:6pt;">LTC Insurance Qualified Amount</th>
           <th class="styDepTblCell" scope="col" style="width:auto;text-align:center;font-size:6pt;">Accelerated Death Benefit Received Amount</th>
           <th class="styDepTblCell" scope="col" style="width:auto;text-align:center;font-size:6pt;">Total LTC And Death Benefit Received Amount</th>
           <th class="styDepTblCell" scope="col" style="width:auto;text-align:center;font-size:6pt;">LTC Days Multiply By Per Diem Amount</th>
           <th class="styDepTblCell" scope="col" style="width:auto;text-align:center;font-size:6pt;">LTC Cost Incurred Amount</th>
           <th class="styDepTblCell" scope="col" style="width:auto;text-align:center;font-size:6pt;">Larger Calculation Or Actual LTC Costs Amount</th>
          <th class="styDepTblCell" scope="col" style="width:auto;text-align:center;font-size:6pt;">LTC Reimbursement Amount</th>
          <th class="styDepTblCell" scope="col" style="width:auto;text-align:center;font-size:6pt;">LTC Per Diem Limitation Amount</th>
          <th class="styDepTblCell" scope="col" style="width:auto;text-align:center;font-size:6pt;">LTC Taxable Payments Amount</th>
        </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>
        <xsl:for-each select="$MPSData/MultiplePayeesStmt">
          <tr>
          <!-- Assign alternate rows the different colors -->
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <!-- Column 1 -->
            <td class="styDepTblCell" style="text-align:right;font-size:6pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="LTCInsuranceQualifiedAmt" />
              </xsl:call-template>
            </td>
            <!-- Column 2 -->
            <td class="styDepTblCell" style="text-align:right;font-size:6pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="AcceleratedDeathBenefitRcvdAmt" />
              </xsl:call-template>
            </td>
            <!-- Column 3 -->
            <td class="styDepTblCell" style="text-align:right;font-size:6pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TotalLTCAndDeathBenefitRcvdAmt" />
              </xsl:call-template>
            </td>
            <!-- Column 4 -->
            <td class="styDepTblCell" style="text-align:right;font-size:6pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="LTCDaysMultiplyByPerDiemAmt" />
              </xsl:call-template>
            </td>
            <!-- Column 5 -->
            <td class="styDepTblCell" style="text-align:right;font-size:6pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="LTCCostIncurredAmt" />
              </xsl:call-template>
            </td>
            <!-- Column 6 -->
            <td class="styDepTblCell" style="text-align:right;font-size:6pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="LargerCalcOrActualLTCCostsAmt" />
              </xsl:call-template>
            </td>
            <!-- Column 7 -->
            <td class="styDepTblCell" style="text-align:right;font-size:6pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="LTCReimbursementAmt" />
              </xsl:call-template>
            </td>
            <!-- Column 8 -->
            <td class="styDepTblCell" style="text-align:right;font-size:6pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="LTCPerDiemLimitationAmt" />
              </xsl:call-template>
            </td>
            <!-- Column 9 -->
            <td class="styDepTblCell" style="text-align:right;font-size:6pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="LTCTaxablePaymentsAmt" />
              </xsl:call-template>
            </td>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
</xsl:stylesheet>







