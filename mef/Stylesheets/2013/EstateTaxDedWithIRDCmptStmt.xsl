<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="DependencyData" select="$RtnDoc/EstateTaxDedWithIRDCmptStmt" />
  <!--Display name is Estate Tax Deduction with IRD Computation -->
  
<xsl:template name="EstateTaxDedWithIRDCmptStmtTmp">

   <table id="EstateTaxTbl" class="styDepTbl">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" colspan="2" style="width:187mm;">Estate Tax That Qualifies for Deduction Computation</th>
				</tr>
			</thead>			
				<tr>
					<td class="styDepTblCell" style="width:150mm;text-align:right;">
						
					</td>
					<td class="styDepTblCell" style="width: 36mm; padding-left:10mm;text-align:left;">Amount
					</td>
				</tr>
				<tr>
					<td class="styDepTblCell" style="width:150mm;text-align:left;">Total IRD						
					</td>
					<td class="styDepTblCell" style="width: 36mm; text-align:right;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/TotalIRDAmt"/>
						</xsl:call-template>
					</td>
				</tr>	
				<tr>
					<td class="styDepTblCell" style="width:150mm;text-align:left;">Total Expenses for IRD						
					</td>
					<td class="styDepTblCell" style="width: 36mm; text-align:right;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/TotalIRDExpensesAmt"/>
						</xsl:call-template>
					</td>
				</tr>	
				<tr>
					<td class="styDepTblCell" style="width:150mm;text-align:left;">Net Value of Items Included as IRD						
					</td>
					<td class="styDepTblCell" style="width: 36mm; text-align:right;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/NetValueAmt"/>
						</xsl:call-template>
					</td>
				</tr>	
				<tr>
					<td class="styDepTblCell" style="width:150mm;text-align:left;">Estate Tax After Credits						
					</td>
					<td class="styDepTblCell" style="width: 36mm; text-align:right;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/EstateTaxAfterCreditsAmt"/>
						</xsl:call-template>
					</td>
				</tr>	
				<tr>
					<td class="styDepTblCell" style="width:150mm;text-align:left;">Estate Tax Without Net Value After Credits						
					</td>
					<td class="styDepTblCell" style="width: 36mm; text-align:right;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/EstateTaxWithoutNetValueAmt"/>
						</xsl:call-template>
					</td>
				</tr>	
				<tr>
					<td class="styDepTblCell" style="width:150mm;text-align:left;">Qualifying Estate Tax Deduction						
					</td>
					<td class="styDepTblCell" style="width: 36mm; text-align:right;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/QualifyingEstateTaxDedAmt"/>
						</xsl:call-template>
					</td>
				</tr>			
		</table>
   <br />
   <table id="RecipientsDeductibleTbl" class="styDepTbl">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" colspan="2" style="width:187mm;">Recipient’s Deductible Portion Computation</th>
				</tr>
			</thead>			
				<tr>
					<td class="styDepTblCell" style="width:150mm;text-align:right;">
						
					</td>
					<td class="styDepTblCell" style="width: 36mm; padding-left:10mm;text-align:left;">Amount
					</td>
				</tr>
				<tr>
					<td class="styDepTblCell" style="width:150mm;text-align:left;">IRD included in Recipient’s Income						
					</td>
					<td class="styDepTblCell" style="width: 36mm; text-align:right;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/IRDIncludedInRecipientIncmAmt"/>
						</xsl:call-template>
					</td>
				</tr>	
				<tr>
					<td class="styDepTblCell" style="width:150mm;text-align:left;">Total IRD						
					</td>
					<td class="styDepTblCell" style="width: 36mm; text-align:right;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/TotalIRDAmt"/>
						</xsl:call-template>
					</td>
				</tr>	
				<tr>
					<td class="styDepTblCell" style="width:150mm;text-align:left;">Estate Tax Qualifying For Deduction						
					</td>
					<td class="styDepTblCell" style="width: 36mm; text-align:right;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/QualifyingEstateTaxDedAmt"/>
						</xsl:call-template>
					</td>
				</tr>	
				<tr>
					<td class="styDepTblCell" style="width:150mm;text-align:left;">Estate Tax Deduction						
					</td>
					<td class="styDepTblCell" style="width: 36mm; text-align:right;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/EstateTaxDeductionAmt"/>
						</xsl:call-template>
					</td>
				</tr>			
		</table>
       <br />
        <xsl:variable name="IncCount" select="count($DependencyData/IRDTypeAndAmt)" />
        <xsl:variable name="ExpCount" select="count($DependencyData/IRDExpensesTypeAndAmt)" />
       <xsl:variable name="IncExpCount">
		   <xsl:choose>
				<xsl:when test="$IncCount &gt; $ExpCount">
					 <xsl:value-of select="$IncCount" />
				</xsl:when>
				<xsl:when test="$ExpCount &gt; $IncCount">
					 <xsl:value-of select="$ExpCount" />
				</xsl:when>
				<xsl:when test="$ExpCount = $IncCount">
					 <xsl:value-of select="$ExpCount" />
				</xsl:when>
			</xsl:choose>       
       </xsl:variable>
        
        <table id="TaxableIncomeGrpTbl" class="styDepTbl">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="width:52.6mm;">Type of Income in Respect of a Decedent (IRD)</th>
					<th class="styDepTblCell" scope="col" style="width:40mm;">IRD Amount</th>
					<th class="styDepTblCell" scope="col" style="width:52.5mm;">Expenses for Income in Respect of a Decedent (IRD)</th>
					<th class="styDepTblCell" scope="col" style="width:40mm;">Expenses for IRD amount</th>
				</tr>
			</thead>
			<xsl:call-template name="IncExpLoop">
					<xsl:with-param name="incexpcount" select="$IncExpCount"/>
					<xsl:with-param name="inciterations" select="'1'"/>
			</xsl:call-template>
		</table>
                
		<div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Explanation:</span></div>
          <div style="width:400px;float:left;clear:none;">
          
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/AdditionalExplanationTxt"/>
            </xsl:call-template>
          </div>
        </div>
        
	</xsl:template>
	
	<xsl:template name="IncExpLoop">
			<xsl:param name="inciterations"/>
			<xsl:param name="incexpcount"/>			
			<xsl:if test="$inciterations &lt; $incexpcount or $inciterations = $incexpcount">
				<tr>
					<xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="$inciterations mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
					<td class="styDepTblCell" style="width:52.6mm;text-align:left;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="($DependencyData/IRDTypeAndAmt/Description)[$inciterations]"/>
						</xsl:call-template>
					</td>
					<td class="styDepTblCell" style="width: 40mm; text-align:right;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="($DependencyData/IRDTypeAndAmt/Amount)[$inciterations]"/>
						</xsl:call-template>
					</td>
					<td class="styDepTblCell" style="width: 52.5mm; text-align:left;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="($DependencyData/IRDExpensesTypeAndAmt/Description)[$inciterations]"/>
						</xsl:call-template>
					</td>
					<td class="styDepTblCell" style="width: 40mm; text-align:right;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="($DependencyData/IRDExpensesTypeAndAmt/Amount)[$inciterations]"/>
						</xsl:call-template>
					</td>
				</tr>
				<xsl:call-template name="IncExpLoop">
					<xsl:with-param name="inciterations" select="$inciterations + 1"/>
					<xsl:with-param name="incexpcount" select="$incexpcount"/>
				</xsl:call-template>
			</xsl:if>
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
        
	 <xsl:call-template name="EstateTaxDedWithIRDCmptStmtTmp"/>
	
        <br />      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







