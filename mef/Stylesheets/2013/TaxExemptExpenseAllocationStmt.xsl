<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="DependencyData" select="$RtnDoc/TaxExemptExpenseAllocationStmt" />
  <!--Display name is Tax Exempt Expense Allocation Statement  -->
  
<xsl:template name="ExpenseAllocationGrpTmp"> 

	 <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Total Expenses Allocated to Tax Exempt Income: </span></div>
          <div style="float:left;clear:none;"> <br />
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/TotExpnsAllocToTxExemptIncmAmt"/>
            </xsl:call-template>
          </div>
        </div>        
         <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Total Expenses Allocated to Taxable Income: </span></div>
          <div style="float:left;clear:none;"> <br />
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/TotExpnsAllocToTaxableIncmAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <br />
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Additional Explanation: </span></div>
          <div style="width:440px;float:left;clear:none;">  
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/AdditionalExplanationTxt"/>
            </xsl:call-template>
          </div>
        </div>
		<br />
		<table id="ExpenseAllocationTbl" class="styDepTbl">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="width:35mm;">Expense</th>
					<th class="styDepTblCell" scope="col" style="width:35mm;">Total Expenses</th>
					<th class="styDepTblCell" scope="col" style="width:35mm;"><b>Amount Allocated to Tax Exempt Income</b></th>
					<th class="styDepTblCell" scope="col" style="width:35mm;"><b>Amount Allocated to Taxable Income</b></th>
					<th class="styDepTblCell" scope="col" style="width:47mm;"><b>Explanation</b></th>
				</tr>
			</thead>
			<xsl:for-each select="$DependencyData/ExpenseAllocationGrp">
				<tr style="font-size: 6pt;">
					<xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
					<td class="styDepTblCell" style="width:38mm;text-align:left;">
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="ExpenseTypeAndTotalAmt/Description"/>
						</xsl:call-template>								
					</td>
					<td class="styDepTblCell" style="width:36mm;text-align:right;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="ExpenseTypeAndTotalAmt/Amount"/>
						</xsl:call-template>								
					</td>
					<td class="styDepTblCell" style="width:36mm;text-align:right;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="AllocatedToTaxExemptIncomeAmt"/>
						</xsl:call-template>								
					</td>
					<td class="styDepTblCell" style="width:36mm;text-align:right;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="AllocatedToTaxableIncomeAmt"/>
						</xsl:call-template>									
					</td>
					<td class="styDepTblCell" style="width:41mm;text-align:left;">
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="LineExplanationTxt"/>
						</xsl:call-template>								
					</td>
				</tr>
			</xsl:for-each>
		</table>	
		        
	</xsl:template>
  
  
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
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
                  </style>
        <style type="text/css">
  <xsl:if test="not($Print) or $Print=''">
    <xsl:call-template name="AddOnStyle"></xsl:call-template>    
  </xsl:if>
</style>
      <xsl:call-template name="GlobalStylesDep"/>
</head>    
      <body class="styBodyClass">
  
        <xsl:call-template name="DocumentHeaderDependency"  />  
        <div class="styDepTitleLine">
          <span class="styDepTitle" style="width:120mm;">
            <span><xsl:value-of select="$depDocTitle" /></span>
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover">
        	<xsl:with-param name="TargetNode" select="$DependencyData"/>
        </xsl:call-template>
        
	 <xsl:call-template name="ExpenseAllocationGrpTmp"/>
	
        <br />      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







