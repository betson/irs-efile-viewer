<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]><!-- Last Modified by Eugenia McDonald on 11/20/2014 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8958Style.xsl"/>
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />  
	<xsl:param name="FormData" select="$RtnDoc/IRS8958" />  
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache" />
				<meta http-equiv="Cache-Control" content="no-cache" />
				<meta http-equiv="Expires" content="0" />
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private" />
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
				<meta name="Description" content="IRS Form 8958" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''"> 
						<xsl:call-template name="IRS8958Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if> 
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="IRS8958">
					<xsl:call-template name="DocumentHeader"/>
					<!-- header -->
					<div class="styTBB" style="width:187mm;">
						<div class="styFNBox" style="width:30mm;height:20mm;">
							<div style="width:29mm;height:13mm;">
								Form <span class="styFormNumber">8958</span><br/>
								<span class="styAgency">(November 2014)</span>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData"/>
								</xsl:call-template>
							</div>
							<span class="styAgency">Department of the Treasury<br/>
							Internal Revenue Service (99)</span>
						</div>
						<div class="styFTBox" style="width:126.8mm;">
							<span class="styMainTitle" style="font-size:9pt;">Allocation of Tax Amounts Between Married Filing Separate Spouses, Same-Sex<br/>
							Spouses, or Registered Domestic Partners With Community Property Rights</span><br/>
							<div class="styFBT">
								<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
								Information about Form 8958 and its instructions is at <i>www.irs.gov/form8958</i>.<br/>
								<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
								Attach to Form 1040.
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;">
							<div class="styOMB" style="width:100%;height:10mm;padding-top:3mm;">OMB No. 1545-0074</div>
							<div class="stySequence" style="width:100%;height:10mm;padding-left:3mm;padding-top:1mm;">
								Attachment<br/>Sequence No. <span style="font-weight:bold;font-size:10pt;">63</span>
							</div>
						</div>
					</div>
					<!-- Primary Taxpayer -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:84.8mm;height:8mm;">
							Your first name and initial<br/>
							<span style="font-size:7pt;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">Name</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div class="styNameBox" style="width:64.6mm;height:8mm;padding-left:2px;">
							Your last name
						</div>
						<div class="styEINBox" style="width:35.4mm;height:8mm;padding-left:2px;">
							Your social security number<br/><br/>
							<span style="width:100%;text-align:center;font-size:7pt;font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Spouse -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:84.8mm;height:9mm;">
							Spouse's or partner's first name and initial<br/>
							<span style="font-size:7pt;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/SpouseOrPartnerFirstNm"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styNameBox" style="width:64.6mm;height:9mm;padding-left:2px;">
							Spouse's or partner's last name<br/>
							<span style="font-size:7pt;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/SpouseOrPartnerLastNm"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styEINBox" style="width:37.4mm;height:9mm;padding-left:2px;">
							Spouse's or partner's social security number<br/>
							<span style="width:100%;text-align:center;font-size:7pt;font-weight:normal;">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$FormData/SpouseOrPartnerSSN"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Header row -->
					<div style="width:187mm;float:none;clear:both;">
						<table class="sty8958Table">
							<tbody>
								<tr valign="top">
									<td class="sty8958LCell" style="height:16mm;width:84.8mm;">&nbsp;</td>
									<td class="sty8958RCell" style="height:16mm;width:32.5mm;text-align:center;">
										A<br/>Total Amount
									</td>
									<td class="sty8958RCell" style="height:16mm;width:32.2mm;text-align:center;">
										B<br/>Allocated to<br/>Spouse or RDP<br/>SSN 
										<span style="width:18mm;border-bottom:solid black 1px;">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
											</xsl:call-template>
										</span>
									</td>
									<td class="sty8958RCell" style="height:16mm;border-right-width:0px;width:33.5mm;text-align:center;">
										C<br/>Allocated to<br/>Spouse or RDP<br/>SSN 
										<span style="width:18mm;border-bottom:solid black 1px">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="$FormData/SpouseOrPartnerSSN"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- Line 1 table -->
					<xsl:call-template name="LineTableGroup">
						<xsl:with-param name="target" select="$FormData/WagesAllocnGrp"/>
						<xsl:with-param name="number" select="1"/>
						<xsl:with-param name="description">Wages (each employer)</xsl:with-param>
						<xsl:with-param name="lines" select="4"/>
					</xsl:call-template>
					<!-- Line 2 table -->
					<xsl:call-template name="LineTableGroup">
						<xsl:with-param name="target" select="$FormData/TaxableInterestAllocnGrp"/>
						<xsl:with-param name="number" select="2"/>
						<xsl:with-param name="description">Interest Income (each payer)</xsl:with-param>
						<xsl:with-param name="lines" select="3"/>
					</xsl:call-template>
					<!-- Line 3 table -->
					<xsl:call-template name="LineTableGroup">
						<xsl:with-param name="target" select="$FormData/OrdinaryDividendsAllocnGrp"/>
						<xsl:with-param name="number" select="3"/>
						<xsl:with-param name="description">Dividends (each payer)</xsl:with-param>
						<xsl:with-param name="lines" select="2"/>
					</xsl:call-template>
					<!-- Line 4 table -->
					<xsl:call-template name="LineTableGroup">
						<xsl:with-param name="target" select="$FormData/StLocalIncomeTxRefundAllocnGrp"/>
						<xsl:with-param name="number" select="4"/>
						<xsl:with-param name="description">State Income Tax Refund</xsl:with-param>
						<xsl:with-param name="lines" select="1"/>
					</xsl:call-template>
					<!-- Line 5 table -->
					<xsl:call-template name="LineTableGroup">
						<xsl:with-param name="target" select="$FormData/SelfEmploymentIncomeAllocnGrp"/>
						<xsl:with-param name="number" select="5"/>
						<xsl:with-param name="description">Self-Employment Income (See instructions)</xsl:with-param>
						<xsl:with-param name="lines" select="3"/>
					</xsl:call-template>
					<!-- Line 6 table -->
					<xsl:call-template name="LineTableGroup">
						<xsl:with-param name="target" select="$FormData/CapitalGainLossAllocnGrp"/>
						<xsl:with-param name="number" select="6"/>
						<xsl:with-param name="description">Capital Gains and Losses</xsl:with-param>
						<xsl:with-param name="lines" select="2"/>
					</xsl:call-template>
					<!-- Line 7 table -->
					<xsl:call-template name="LineTableGroup">
						<xsl:with-param name="target" select="$FormData/TaxablePensionsAllocnGrp"/>
						<xsl:with-param name="number" select="7"/>
						<xsl:with-param name="description">Pension Income</xsl:with-param>
						<xsl:with-param name="lines" select="2"/>
					</xsl:call-template>
					<!-- Line 8 table -->
					<xsl:call-template name="LineTableGroup">
						<xsl:with-param name="target" select="$FormData/RentalRealEstateAllocnGrp"/>
						<xsl:with-param name="number" select="8"/>
						<xsl:with-param name="description">Rents, Royalties, Partnerships, Estates, Trusts</xsl:with-param>
						<xsl:with-param name="lines" select="2"/>
					</xsl:call-template>
					<!-- Footer Page 1 -->
					<div class="pageEnd" style="width:187mm;float:none;clear:both;">
						<span style="float:left;clear:none;font-weight:bold;">For Paperwork Reduction Act Notice, see your tax return instructions.</span>
						<span style="float:left;clear:none;margin-left:20mm;">Cat. No. 37779G</span>
						<span style="float:right;clear:none;">Form <span style="font-weight:bold;font-size:9pt;">8958</span> (11-2014)</span>
					</div>
					<div style="width:187mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
						<span style="float:left;clear:none;">Form 8958 (11-2014)</span>
						<span style="float:right;clear:none;">Page <span style="font-weight:bold;font-size:9pt;">2</span></span>
					</div>
					<!-- Header line 2 -->
					<div style="width:187mm;float:none;clear:both;">
						<table class="sty8958Table">
							<tbody>
								<tr valign="top">
									<td class="sty8958LCell" style="height:16mm;width:84.8mm;">&nbsp;</td>
									<td class="sty8958RCell" style="height:16mm;width:32.5mm;text-align:center;">
										A<br/>Total Amount
									</td>
									<td class="sty8958RCell" style="height:16mm;width:32.2mm;text-align:center;">
										B<br/>Allocated to<br/>Spouse or RDP<br/>SSN 
										<span style="width:18mm;border-bottom:solid black 1px">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
											</xsl:call-template>
										</span>
									</td>
									<td class="sty8958RCell" style="height:16mm;border-right-width:0px;width:33.5mm;text-align:center;">
										C<br/>Allocated to<br/>Spouse or RDP<br/>SSN 
										<span style="width:18mm;border-bottom:solid black 1px">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="$FormData/SpouseOrPartnerSSN"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- Line 9 table -->
					<xsl:call-template name="LineTableGroup">
						<xsl:with-param name="target" select="$FormData/DedSelfEmploymentTaxAllocnGrp"/>
						<xsl:with-param name="number" select="9"/>
						<xsl:with-param name="description">Deductible part of Self-Employment Tax (See instructions)</xsl:with-param>						
						<xsl:with-param name="lines" select="3"/>
					</xsl:call-template>
					<!-- Line 10 table -->
					<xsl:call-template name="LineTableGroup">
						<xsl:with-param name="target" select="$FormData/SelfEmploymentTaxAllocnGrp"/>
						<xsl:with-param name="number" select="10"/>
						<xsl:with-param name="description">Self-Employment Tax (See instructions)</xsl:with-param>
						<xsl:with-param name="lines" select="3"/>
					</xsl:call-template>
					<!-- Line 11 table -->
					<xsl:call-template name="LineTableGroup">
						<xsl:with-param name="target" select="$FormData/WithholdingTaxAllocnGrp"/>
						<xsl:with-param name="number" select="11"/>
						<xsl:with-param name="description">Taxes Withheld</xsl:with-param>
						<xsl:with-param name="lines" select="3"/>
					</xsl:call-template>
					<!-- Line 12 table -->
					<xsl:call-template name="LineTableGroup">
						<xsl:with-param name="target" select="$FormData/OtherItemAllocnGrp"/>
						<xsl:with-param name="number" select="12"/>
						<xsl:with-param name="description">Other items such as: Social Security Benefits, Unemployment Compensation, 
						Mortgage Interest Deduction, etc.</xsl:with-param>						
						<xsl:with-param name="lines" select="14"/>
					</xsl:call-template>
					
					<!-- Footer Page 2 -->
				<div class="pageEnd" style="width:187mm;float:none;clear:both;">
						<span style="float:right;clear:none;">Form <span style="font-weight:bold;font-size:9pt;">8958</span> (11-2014)</span>
				</div> 
					
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div> 
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>  
					<xsl:if test="$Print = $Separated">
						<!-- Separated Data for Line 1 -->
						<xsl:if test="count($FormData/WagesAllocnGrp) &gt; 5">
							<xsl:call-template name="SeparatedTableGroup">
								<xsl:with-param name="target" select="$FormData/WagesAllocnGrp"/>
								<xsl:with-param name="number" select="1"/>
								<xsl:with-param name="description">Wages (each employer)</xsl:with-param>
							</xsl:call-template>
						</xsl:if>
						<!-- Separated Data for Line 2 -->
						<xsl:if test="count($FormData/TaxableInterestAllocnGrp) &gt; 3">
							<xsl:call-template name="SeparatedTableGroup">
								<xsl:with-param name="target" select="$FormData/TaxableInterestAllocnGrp"/>
								<xsl:with-param name="number" select="2"/>
								<xsl:with-param name="description">Interest Income (each payer)</xsl:with-param>
							</xsl:call-template>
						</xsl:if>
						<!-- Separated Data for Line 3 -->
						<xsl:if test="count($FormData/OrdinaryDividendsAllocnGrp) &gt; 3">
							<xsl:call-template name="SeparatedTableGroup">
								<xsl:with-param name="target" select="$FormData/OrdinaryDividendsAllocnGrp"/>
								<xsl:with-param name="number" select="3"/>
								<xsl:with-param name="description">Dividends (each payer)</xsl:with-param>
							</xsl:call-template>
						</xsl:if>
						<!-- Separated Data for Line 4 -->
						<xsl:if test="count($FormData/StLocalIncomeTxRefundAllocnGrp) &gt; 1">
							<xsl:call-template name="SeparatedTableGroup">
								<xsl:with-param name="target" select="$FormData/StLocalIncomeTxRefundAllocnGrp"/>
								<xsl:with-param name="number" select="4"/>
								<xsl:with-param name="description">State Income Tax Refund</xsl:with-param>
							</xsl:call-template>
						</xsl:if>
						<!-- Separated Data for Line 5 -->
						<xsl:if test="count($FormData/SelfEmploymentIncomeAllocnGrp) &gt; 3">
							<xsl:call-template name="SeparatedTableGroup">
								<xsl:with-param name="target" select="$FormData/SelfEmploymentIncomeAllocnGrp"/>
								<xsl:with-param name="number" select="5"/>
								<xsl:with-param name="description">Self-Employment Income (See instructions)</xsl:with-param>
							</xsl:call-template>
						</xsl:if>
						<!-- Separated Data for Line 6 -->
						<xsl:if test="count($FormData/CapitalGainLossAllocnGrp) &gt; 2">
							<xsl:call-template name="SeparatedTableGroup">
								<xsl:with-param name="target" select="$FormData/CapitalGainLossAllocnGrp"/>
								<xsl:with-param name="number" select="6"/>
								<xsl:with-param name="description">Capital Gains and Losses</xsl:with-param>
							</xsl:call-template>
						</xsl:if>
						<!-- Separated Data for Line 7 -->
						<xsl:if test="count($FormData/TaxablePensionsAllocnGrp) &gt; 2">
							<xsl:call-template name="SeparatedTableGroup">
								<xsl:with-param name="target" select="$FormData/TaxablePensionsAllocnGrp"/>
								<xsl:with-param name="number" select="7"/>
								<xsl:with-param name="description">Pension Income</xsl:with-param>
							</xsl:call-template>
						</xsl:if>
						<!-- Separated Data for Line 8 -->
						<xsl:if test="count($FormData/RentalRealEstateAllocnGrp) &gt; 3">
							<xsl:call-template name="SeparatedTableGroup">
								<xsl:with-param name="target" select="$FormData/RentalRealEstateAllocnGrp"/>
								<xsl:with-param name="number" select="8"/>
								<xsl:with-param name="description">Rents, Royalties, Partnerships, Estates, Trusts</xsl:with-param>
							</xsl:call-template>
						</xsl:if>
						<!-- Separated Data for Line 9 -->
						<xsl:if test="count($FormData/DedSelfEmploymentTaxAllocnGrp) &gt; 3">
							<xsl:call-template name="SeparatedTableGroup">
								<xsl:with-param name="target" select="$FormData/DedSelfEmploymentTaxAllocnGrp"/>
								<xsl:with-param name="number" select="9"/>
								<xsl:with-param name="description">Deductible part of Self-Employment Tax (See instructions)</xsl:with-param>
							</xsl:call-template>
						</xsl:if>
						<!-- Separated Data for Line 10 -->
						<xsl:if test="count($FormData/SelfEmploymentTaxAllocnGrp) &gt; 3">
							<xsl:call-template name="SeparatedTableGroup">
								<xsl:with-param name="target" select="$FormData/SelfEmploymentTaxAllocnGrp"/>
								<xsl:with-param name="number" select="10"/>
								<xsl:with-param name="description">Self-Employment Tax (See instructions)</xsl:with-param>
							</xsl:call-template>
						</xsl:if>
						<!-- Separated Data for Line 11 -->
						<xsl:if test="count($FormData/WithholdingTaxAllocnGrp) &gt; 4">
							<xsl:call-template name="SeparatedTableGroup">
								<xsl:with-param name="target" select="$FormData/WithholdingTaxAllocnGrp"/>
								<xsl:with-param name="number" select="11"/>
								<xsl:with-param name="description">Taxes Withheld</xsl:with-param>
							</xsl:call-template>
						</xsl:if>
						<!-- Separated Data for Line 12 -->
						<xsl:if test="count($FormData/OtherItemAllocnGrp) &gt; 14">
							<xsl:call-template name="SeparatedTableGroup">
								<xsl:with-param name="target" select="$FormData/OtherItemAllocnGrp"/>
								<xsl:with-param name="number" select="12"/>
								<xsl:with-param name="description">Other items such as: Social Security Benefits, Unemployment Compensation, Mortgage Interest Deduction, etc.</xsl:with-param>
							</xsl:call-template>
						</xsl:if>
					</xsl:if>
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="LineTableGroup">
		<xsl:param name="number"/>
		<xsl:param name="description"/>
		<xsl:param name="lines"/>
		<xsl:param name="target"/>
		<xsl:variable name="conID">Line<xsl:value-of select="$number"/>Table</xsl:variable>
		<xsl:variable name="tcount" select="count($target)"/>
		<div class="sty8958TableContainer" style="width:187mm;clear:all;height:auto;" >
			<xsl:attribute name="id"><xsl:value-of select="$conID"/></xsl:attribute>
			<xsl:call-template name="SetInitialState"/>
			<table class="sty8958Table" >
				<tbody>
					<xsl:choose>
						<xsl:when test="(($Print = $Separated) and $tcount &gt; $lines) or ($tcount = 0)">
							<tr>
								<td class="sty8958LCell" style="width:85mm;height:10mm;">
									<div style="width:6mm;font-weight:bold;padding-left:1mm;float:left;"><xsl:value-of select="$number"/></div><div style="float:left;"><xsl:value-of select="$description"/></div>
									<br/>
									<span style="width:75mm;padding-left:6mm;">
										<xsl:call-template name="PopulateAdditionalDataTableMessage">
											<xsl:with-param name="TargetNode" select="$target"/>
										</xsl:call-template>
									</span>
								</td>
								<td class="sty8958RCell" style="width:32mm;height:10mm;">
									<br/>
									&nbsp;
								</td>
								<td class="sty8958RCell" style="width:32.5mm;height:10mm;">
									<br/>
									&nbsp;
								</td>
								<td class="sty8958RCell" style="border-right-width:0px;width:32.2mm;height:10mm;">
									<br/>
									&nbsp;
								</td>
							</tr>
							<xsl:if test="$lines &gt; 1">
								<xsl:call-template name="EmptyTRows">
									<xsl:with-param name="Count" select="$lines - 1"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="$target">
								<tr>															
									<td class="sty8958LCell" style="width:85mm;height:10mm;">
										<xsl:if test="position() = 1">																			
											<div style="width:6mm;font-weight:bold;padding-left:1mm;float:left;"><xsl:value-of select="$number"/></div><div style="float:left;width:77mm;">
											<xsl:value-of select="$description"/></div>											
										</xsl:if>										
										<span style="padding-left:6mm;width:78mm;">
											<xsl:call-template name="PopulateText">											   
												<xsl:with-param name="TargetNode" select="Desc"/>
											</xsl:call-template>
										</span>
									</td>
									<td class="sty8958RCell" style="width:32.2mm;height:10mm;" valign="bottom">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TotalAllocationAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty8958RCell" style="width:32.2mm;height:10mm;" valign="bottom">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="PrimaryTaxpayerAllocationAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty8958RCell" style="border-right-width:0px;width:32.2mm;height:10mm;" valign="bottom">
										<xsl:if test="position() = 1">
											<xsl:call-template name="SetDynamicTableToggleButton">
												<xsl:with-param name="TargetNode" select="$target"/>
												<xsl:with-param name="containerHeight" select="$lines"/>
												<xsl:with-param name="headerHeight" select="0"/>
												<xsl:with-param name="containerID" select="$conID"/>
											</xsl:call-template>
										</xsl:if>
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="SpouseOrPartnerAllocationAmt"/>
										</xsl:call-template>
									</td>								
								</tr>
								
							</xsl:for-each>
							<xsl:if test="$tcount &lt; $lines">
								<xsl:call-template name="EmptyTRows">
									<xsl:with-param name="Count" select="$lines - $tcount"/>
								</xsl:call-template>
							</xsl:if>
							
						</xsl:otherwise>
					</xsl:choose>
				</tbody>
			</table>
		</div>
		
		<xsl:call-template name="SetInitialDynamicTableHeight">
			<xsl:with-param name="TargetNode" select="$target"/>
			<xsl:with-param name="containerHeight" select="$lines"/>
			<xsl:with-param name="headerHeight" select="0"/>
			<xsl:with-param name="containerID" select="$conID"/>
		</xsl:call-template>
	</xsl:template>
	<xsl:template name="SeparatedTableGroup">
		<xsl:param name="number"/>
		<xsl:param name="description"/>
		<xsl:param name="target"/>
		<br/>
		<br/>
		<span class="styRepeatingDataTitle">
			Form 8958, Line <xsl:value-of select="$number"/> - <xsl:value-of select="$description"/>
		</span>
		<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:187mm;">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="width:75mm;">Description</th>
					<th class="styDepTblCell" scope="col" style="width:37mm;">1<br/>Total Income<br/></th>
					<th class="styDepTblCell" scope="col" style="width:37mm;">
						2<br/>Allocated to Spouse or RDP<br/>SSN 
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
						</xsl:call-template>
					</th>
					<th class="styDepTblCell" scope="col" style="width:37mm;">
						3<br/>Allocated to Spouse or RDP<br/>SSN 
						<xsl:call-template name="PopulateSSN">
							<xsl:with-param name="TargetNode" select="$FormData/SpouseOrPartnerSSN"/>
						</xsl:call-template>
					</th>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="$target">
					<tr style="border-color:black;height:6mm;">
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<td class="styTableCellText" style="width:75mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="Desc"/>
							</xsl:call-template>
						</td>
						<td class="styTableCell" style="width:37mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="TotalAllocationAmt"/>
							</xsl:call-template>
						</td>
						<td class="styTableCell" style="width:37mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PrimaryTaxpayerAllocationAmt"/>
							</xsl:call-template>
						</td>
						<td class="styTableCell" style="width:37mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="SpouseOrPartnerAllocationAmt"/>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="EmptyTRows">
		<xsl:param name="Count" select="1"/>
		<xsl:if test="$Count &gt; 1">
			<xsl:call-template name="EmptyTRows">
				<xsl:with-param name="Count" select="$Count - 1"/>
			</xsl:call-template>
		</xsl:if>
		<tr>
			<td class="sty8958LCell" style="width:84.8mm;">
				<br/>
				&nbsp;
			</td>
			<td class="sty8958RCell" style="width:32.2mm;">
				<br/>
				&nbsp;
			</td>
			<td class="sty8958RCell" style="width:32.4mm;">
				<br/>
				&nbsp;
			</td>
			<td class="sty8958RCell" style="border-right-width:0px;width:32mm;">
				<br/>
				&nbsp;
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>
