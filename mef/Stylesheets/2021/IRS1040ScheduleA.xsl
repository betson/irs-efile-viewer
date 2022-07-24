<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Eugenia McDonald 09/30/2021 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1040ScheduleAStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="FormData" select="$RtnDoc/IRS1040ScheduleA"/>
	<xsl:template name="DotLoop">
		<xsl:param name="DotQty"/>
		<xsl:if test="$DotQty &gt; 0">
			<span style="width:10px"/>.
			<xsl:call-template name="DotLoop">
				<xsl:with-param name="DotQty" select="$DotQty - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="Form IRS1040ScheduleA"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!--<xsl:if test="not($Print) or $Print=''">-->
					<xsl:call-template name="IRS1040ScheduleAStyle"/>
					<xsl:call-template name="AddOnStyle"/>
					<!--</xsl:if>-->
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<form name="Form1040ScheduleA">
					<!-- BEGIN WARNING LINE -->
					<xsl:call-template name="DocumentHeader"/>
					<!-- END WARNING LINE -->
					<div class="styTBB" style="width:187mm;height:20mm;">
						<div class="styFNBox" style="width:28mm;height:20mm;">
							<div style="height:8mm;">
								<!-- Ampersand code (&#38;)-->
								<span class="styFormNumber" style="font-size:9pt">SCHEDULE A</span>
								<br/>
								<span class="styFormNumber" style="font-size:9pt">(Form 1040) 
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
								</span>
							</div>
							<br/>
							<br/>
							<div style="height:6mm;padding-top:.1mm;">
								<span class="styAgency">Department of the Treasury</span>
								<span class="styAgency" style="width:28mm;">Internal Revenue Service 
									<span style="padding-left:0.2mm;"> (99)</span>
								</span>
							</div>
						</div>
						<div class="styFTBox" style="width:126.5mm;height:20mm;">
							<div class="styMainTitle">Itemized Deductions</div>
							<div class="styFBT" style="width:126.5mm;font-size:7pt;margin-top:.5mm;font-weight:normal">
								<img src="{$ImagePath}/1040SchA_Bullet.gif" alt="SmallBullet Image"/>
								<b>Go to <a style="text-decoration:none;color:black;" href="www.irs.gov/ScheduleA " title="Link to IRS.gov">
										<i>www.irs.gov/ScheduleA </i>
									</a> for instructions and the latest information.
								</b>
								<br/>
								<span style="padding-top:.5mm;">
									<img src="{$ImagePath}/1040SchA_Bullet.gif" alt="SmallBullet Image"/>
									<b>Attach to Form 1040 or 1040-SR.</b>
								</span>
								<span style="padding-top:.5mm;">
									<b>Caution:</b> If you are claiming a net qualified disaster loss on Form 4684, see the instructions for <br/>line 16.
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width:32mm;height:19.5mm;">
							<br/>
							<div class="styOMB" style="height:2mm;padding-top:0mm;padding-left:3mm;line-height: 0px;">OMB No. 1545-0074</div>
							<div class="styTY" style="height:6mm;font-size:18pt;padding-top:0mm;padding-bottom:0mm;line-height:100%;padding-left:0mm">
								20<span class="styTYColor">21</span>
							</div>
							<div class="styOMB" style="padding-top:1mm;text-align:left;padding-left:5mm;border-bottom-width:0px;line-height:10px">Attachment <br/>
								Sequence No. <span class="styBoldText">07</span>
							</div>
						</div>
					</div>
					<div style="width:187mm;height:8mm;" class="styBB">
						<!--Name shown on Form 1040 or 1040-SR	/-->
						<div style="width:145mm;height:8mm;font-weight:normal;font-size:7pt;" class="styNameBox">Name(s) shown on Form 1040 or 1040-SR<br/>
							<div style="padding-top:1.5mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
									<xsl:with-param name="BackupName">$RtnHdrDataFilerName</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<!--Your social Security number	/-->
						<div style="width:40mm;height:8mm;padding-left:1mm;font-size:7pt;font-weight:bold;" class="styEINBox">Your social security number<br/>
							<span style="width:9.5mm"/>
							<span style="font-weight:normal; padding-top:1mm;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!--Medical and Dental Expenses Section	/-->
					<div class="styBB" style="width:187mm;height:22.6mm;">
						<div class="styIRS1040ScheduleAleftBox" style="width:20mm; height:22.6mm;font-size:8.8pt;border-left-width:0px; padding-top:.5mm;">
							<span class="styBoldText">Medical<br/>and<br/>Dental<br/>Expenses<br/>
							</span>
						</div>
						<!--Caution Do not include -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;"/>
							<div class="styLNDesc" style="width:96mm;height:4.5mm;padding-left:2mm;">
								<span>
									<b>Caution:</b> Do not include expenses reimbursed or paid by others.</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:26mm; border-bottom-width:0px;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:26mm;border-bottom-width:0px;"/>
						</div>
						<!--Line 1 -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:2mm;">1</div>
							<div class="styLNDesc" style="width:96mm;height:4.5mm;padding-left:2mm;">
								<span>Medical and dental expenses (see instructions)</span>
								<span class="styBoldText" style="float:right; padding-right:1mm;">
									<xsl:call-template name="DotLoop">
										<xsl:with-param name="DotQty" select="8"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;">1</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:26mm;padding-right:.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MedicalAndDentalExpensesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:26mm;border-bottom-width:0px;"/>
						</div>
						<!--Line 2 -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:2mm;">2</div>
							<div class="styLNDesc" style="width:63mm;height:4.5mm;padding-left:2mm;">
								<span style="float:left; font-size:6.5pt;">Enter amount from Form 1040 or 1040-SR, line 11</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;">2</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:26mm;padding-right:.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxReturnAGIAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:26mm; border-bottom-width:0px;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:26mm;border-bottom-width:0px;"/>
						</div>
						<!--Line  3-->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:2mm;">3</div>
							<div class="styLNDesc" style="width:96mm;height:4.5mm;padding-left:2mm;">
								<span style="float:left;">Multiply line 2 by 7.5% (0.075)</span>
								<span class="styBoldText" style="float:right;padding-right:1mm;">
									<xsl:call-template name="DotLoop">
										<xsl:with-param name="DotQty" select="12"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;">3</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:26mm; padding-right:.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CalculatedMedicalAllowanceAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:26mm;border-bottom-width:0px;"/>
						</div>
						<!--Line  4-->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:2mm;">4</div>
							<div class="styLNDesc" style="width:129mm;height:4.5mm;padding-left:2mm;">
								<span style="float:left;">Subtract line 3 from line 1. If line 3 is more than line 1, enter -0-</span>
								<span class="styBoldText" style="float:right;padding-right:3.2mm;">
									<xsl:call-template name="DotLoop">
										<xsl:with-param name="DotQty" select="9"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:0px;">4</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:26mm; border-bottom-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalMedicalAndDentalExpnssAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--Taxes You Paid	/-->
					<div class="styBB" style="width:187mm;height:51.5mm;">
						<div class="styIRS1040ScheduleAleftBox" style="width:20mm; height:51.5mm;font-size:8.8pt;border-left-width:0px; padding-top:.5mm;">
							<span class="styBoldText">Taxes You<br/>Paid<br/>
							</span>
						</div>
						<!--Line 5 -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:2mm;">5</div>
							<div class="styLNDesc" style="width:96mm;height:4.5mm;padding-left:2mm;">
								<span style="float:left;">State and local taxes.</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:0px;background-color:lightgray;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:26mm;border-bottom-width:0px;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:26mm;border-bottom-width:0px;"/>
						</div>
						<!--Line 5a -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBoxSD" style="height:4.5mm;width:4mm;padding-left:3.5mm;">a</div>
							<div class="styLNDesc" style="width:96mm;height:14mm;padding-left:2mm;">
								<span style="float:left; fjustify-content: space-between;">State and local income taxes or general sales taxes. You may include</span>
								<br/>
								<span style="float:left;">either income taxes or general sales taxes on line 5a, but not both. If</span>
								<br/>
								<span style="float:left;">you elect to include general sales taxes instead of income taxes,</span>
								<br/>
								check this box
								<span style="width:3px;"/>
								<span class="styBoldText" style="padding-right:1mm;">
									<xsl:call-template name="DotLoop">
										<xsl:with-param name="DotQty" select="14"/>
									</xsl:call-template>
									<span style="width:5px;"/>
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									<input type="Checkbox" alt="StateAndLocalSalesTaxInd" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/StateAndLocalSalesTaxInd"/>
											<xsl:with-param name="BackupName">IRS1040SchAStateAndLocalSalesTaxInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/StateAndLocalSalesTaxInd"/>
											<xsl:with-param name="BackupName">IRS1040SchAStateAndLocalSalesTaxInd</xsl:with-param>
										</xsl:call-template>
									</label>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:14mm;width:7mm;padding-top:0mm;border-bottom-width:0px;">
								<div class="styLNRightNumBox" style="height:9.5mm;width:7mm;border-bottom-width:0px;border-left-width:0px; background-color:lightgray;"/>
								<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:1px;border-left-width:0px;">5a</div>
							</div>
							<div class="styLNAmountBox" style="height:14mm;width:26mm;border-bottom-width:1px; padding-right:.5mm;padding-top:9.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/StateAndLocalTaxAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:14mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:14mm;width:26mm;border-bottom-width:0px;"/>
						</div>
						<!-- Line 5b -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:3.5mm;">b</div>
							<div class="styLNDesc" style="width:96mm;height:4.5mm;padding-left:2mm;">
								<span style="float:left;">State and local real estate taxes (see instructions)</span>
								<span class="styBoldText" style="float:right;padding-right:1mm;">
									<xsl:call-template name="DotLoop">
										<xsl:with-param name="DotQty" select="7"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:1px;">5b</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:26mm;border-bottom-width:1px; padding-right:.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/RealEstateTaxesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:26mm;border-bottom-width:0px;"/>
						</div>
						<!-- Line 5c -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:3.5mm;">c</div>
							<div class="styLNDesc" style="width:96mm;height:4.5mm;padding-left:2mm;">
								<span style="float:left;">State and local personal property taxes</span>
								<span class="styBoldText" style="float:right;padding-right:1mm;">
									<xsl:call-template name="DotLoop">
										<xsl:with-param name="DotQty" select="10"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:1px;">5c</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:26mm;border-bottom-width:1px; padding-right:.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/PersonalPropertyTaxesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:26mm;border-bottom-width:0px;"/>
						</div>
						<!-- Line 5d -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:3.5mm;">d</div>
							<div class="styLNDesc" style="width:96mm;height:4.5mm;padding-left:2mm;">
								<span style="float:left;">Add lines 5a through 5c</span>
								<span class="styBoldText" style="float:right;padding-right:1mm;">
									<xsl:call-template name="DotLoop">
										<xsl:with-param name="DotQty" select="14"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:1px;">5d</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:26mm;border-bottom-width:1px; padding-right:.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalStateAndLocalTaxAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:26mm;border-bottom-width:0px;"/>
						</div>
						<!-- Line 5e -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:3.5mm;">e</div>
							<div class="styLNDesc" style="width:96mm;height:4.5mm;padding-left:2mm;">
								<span style="float:left;">Enter the smaller of line 5d or $10,000 ($5,000 if married filing separately)</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:1px;">5e</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:26mm;border-bottom-width:1px; padding-right:.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/StateAndLocalTaxLimitationAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:26mm;border-bottom-width:0px;"/>
						</div>

						<!--Line 6 -->
						
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:2mm;">6</div>
							<div class="styLNDesc" style="width:96mm;height:9mm;padding-left:2mm;">
								<span style="float:left;">Other taxes. List type and amount
										<span style="width:1.3mm"/>
									<img src="{$ImagePath}/1040SchA_Bullet.gif" alt="SmallBullet Image"/>
									<span style="width:2mm"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/OtherTaxesAmt"/>
									</xsl:call-template>
								</span>
								<span style="width:9px;"/>
								<span style="width:36mm;border-bottom:dotted 1px;text-align:right;"/>
								<br/>
								<span style="width:92mm;border-bottom:dotted 1px;text-align:right;padding-top:3.5mm;"/>
							</div>
							<div class="styLNRightNumBox" style="height:9mm;width:7mm;padding-top:0mm;border-bottom-width:0px;border-left-width:1px">
								<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:0px;border-left-width:0px; background-color:lightgray;"/>
								<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:1px;border-left-width:0px;">6</div>
							</div>
							<div class="styLNAmountBox" style="height:9mm;width:26mm;border-bottom-width:1px; padding-right:.5mm;padding-top:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherTaxesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:9mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:9mm;width:26mm;border-bottom-width:0px;"/>
						</div>

						<!--Line  7-->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBoxSD" style="height:4.5mm;width:4mm;padding-left:2mm;">7</div>
							<div class="styLNDesc" style="width:129mm;height:4.5mm;padding-left:2mm;">
								<span style="float:left;">Add lines 5e and 6</span>
								<span class="styBoldText" style="float:right;padding-right:3.2mm;">
									<xsl:call-template name="DotLoop">
										<xsl:with-param name="DotQty" select="23"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:7mm;border-bottom-width:0px;">7</div>
							<div class="styLNAmountBox" style="height:6mm;width:26mm; border-bottom-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxesPaidAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--Interest You Paid-->
					<div class="styBB" style="width:187mm;height:67mm;">
						<div class="styIRS1040ScheduleAleftBox" style="width:20mm; height:67mm;font-size:8.8pt;border-left-width:0px; border-right-width:0px;padding-top:.5mm;">
							<span class="styBoldText">Interest <br/>You Paid<br/>
							</span>
							<br/>
							<span class="styBoldText" style="font-size:7pt">Caution: </span>
							<span style="width:4px"/>
							<span style="font-size:7pt"> Your </span>
							<div style="font-size:7pt;padding-top:.2mm">mortgage interest <br/>deduction may<br/>be limited (see<br/>instructions).</div>
						</div>
						<!--Line 8 -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBoxSD" style="height:4.5mm;width:4mm;padding-left:2mm;">8</div>
							<div class="styLNDesc" style="width:96mm;height:12mm;padding-left:2mm;">
								<span style="float:left;">Home mortgage interest and points. If you didn't use all of your home</span>
								<br/>
								<span style="float:left;">mortgage loan(s) to buy, build, or improve your home, see </span>
								<br/>
								instructions and check this box
								<span style="width:3px;"/>
								<span class="styBoldText" style="padding-right:1mm;">
									<xsl:call-template name="DotLoop">
										<xsl:with-param name="DotQty" select="10"/>
									</xsl:call-template>
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									<span style="width:5px;"/>
									<input type="Checkbox" alt="HomeMortgNotUsedInd" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/HomeMortgNotUsedInd"/>
											<xsl:with-param name="BackupName">IRS1040SchAHomeMortgNotUsedInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/HomeMortgNotUsedInd"/>
											<xsl:with-param name="BackupName">IRS1040SchAHomeMortgNotUsedInd</xsl:with-param>
										</xsl:call-template>
									</label>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:12mm;width:7mm;border-bottom-width:0px;background-color:lightgray;"/>
							<div class="styLNAmountBox" style="height:12mm;width:26mm;border-bottom-width:0px;"/>
							<div class="styLNRightNumBox" style="height:12mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:12mm;width:26mm;border-bottom-width:0px;"/>
						</div>
						<!-- Line 8a -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:3.5mm;">a</div>
							<div class="styLNDesc" style="width:96mm;height:9mm;padding-left:2mm;">
								<span style="float:left;">Home mortgage interest and points reported to you on Form 1098. </span>
								<br/>
								<span style="float:left;padding-top:1mm;">See instructions if limited
								<span class="styBoldText" style="float:right;padding-right:1mm;">
										<xsl:call-template name="DotLoop">
											<xsl:with-param name="DotQty" select="13"/>
										</xsl:call-template>
									</span>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:9mm;width:7mm;padding-top:0mm;border-bottom-width:0px;">
								<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:0px;border-left-width:0px; background-color:lightgray;"/>
								<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:1px;border-left-width:0px;">8a</div>
							</div>
							<div class="styLNAmountBox" style="height:9mm;width:26mm;border-bottom-width:1px; padding-right:.5mm;padding-top:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/RptHomeMortgIntAndPointsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:9mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:9mm;width:26mm;border-bottom-width:0px;"/>
						</div>
						<!-- Line 8b -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:22mm;width:4mm;padding-left:3.5mm;">b</div>
							<div class="styLNDesc" style="width:96mm;height:22mm;padding-left:2mm;">
								<span style="float:left;">Home mortgage interest not reported to you on Form 1098. See </span>
								<br/>
								<span style="float:left;">instructions if limited. If paid  to the person from whom you bought the </span>
								<br/>
								<span style="float:left;">home, see instructions and show that person's name, identifying no.,</span>
								<br/>
									and address
									<span style="width:3px;"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form1098HomeMortgIntNotRptAmt"/>
								</xsl:call-template>
								<span style="width:1mm;"/>
								<span class="styBoldText" style="float:right;padding-right:1mm;">
									<xsl:call-template name="DotLoop">
										<xsl:with-param name="DotQty" select="16"/>
									</xsl:call-template>
								</span>
								<span style="float:left;">
									<img src="{$ImagePath}/1040SchA_Bullet.gif" alt="SmallBullet Image"/>
									<span style="width:2mm"/>
									<span style="width:86mm;border-bottom:dotted 1px;text-align:right;padding-top:3mm;"/>
									<br/>
									<span style="width:91mm;border-bottom:dotted 1px;text-align:right;padding-top:3.5mm;"/>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:22mm;width:7mm;padding-top:0mm;border-bottom-width:0px;">
								<div class="styLNRightNumBox" style="height:17.5mm;width:7mm;border-bottom-width:0px;border-left-width:0px; background-color:lightgray;"/>
								<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:1px;border-left-width:0px;">8b</div>
							</div>
							<div class="styLNAmountBox" style="height:22mm;width:26mm;border-bottom-width:1px; padding-right:.5mm;padding-top:17.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/Form1098HomeMortgIntNotRptAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:22mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:22mm;width:26mm;border-bottom-width:0px;"/>
						</div>
						<!-- Line 8c -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:3.5mm;">c</div>
							<div class="styLNDesc" style="width:96mm;height:4.5mm;padding-left:2mm;">
								<span style="float:left;">Points not reported to you on Form 1098. See instructions for special rules</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:1px;">8c</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:26mm;border-bottom-width:1px; padding-right:.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/Form1098PointsNotReportedAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:26mm;border-bottom-width:0px;"/>
						</div>
						<!-- Line 8d -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:3.5mm;">d</div>
							<div class="styLNDesc" style="width:96mm;height:4.5mm;padding-left:2mm;">
								<span style="float:left;">Mortgage insurance premiums (see instructions)</span>
								<span class="styBoldText" style="float:right;padding-right:1mm;">
									<xsl:call-template name="DotLoop">
										<xsl:with-param name="DotQty" select="7"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:1px;">8d</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:26mm;border-bottom-width:1px; padding-right:.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MortgageInsurancePremiumsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:26mm;border-bottom-width:0px;"/>
						</div>
						<!-- Line 8e -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:3.5mm;">e</div>
							<div class="styLNDesc" style="width:96mm;height:4.5mm;padding-left:2mm;">
								<span style="float:left;">Add lines 8a through 8d</span>
								<span class="styBoldText" style="float:right;padding-right:1mm;">
									<xsl:call-template name="DotLoop">
										<xsl:with-param name="DotQty" select="14"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:1px;">8e</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:26mm;border-bottom-width:1px; padding-right:.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalHomeMortgIntAndPointsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:26mm;border-bottom-width:0px;"/>
						</div>
						<!--Line 9 -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBoxSD" style="height:4mm;width:4mm;padding-left:2mm;">9</div>
							<div class="styLNDesc" style="width:96mm;height:4mm;padding-left:2mm;">
								<span style="float:left;">Investment interest. Attach Form 4952 if required. See instructions
										<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/InvestmentInterestAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:1px;">9</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:26mm;border-bottom-width:1px; padding-right:.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/InvestmentInterestAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:26mm;border-bottom-width:0px;"/>
						</div>
						<!--Line  10-->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:.3mm;">10</div>
							<div class="styLNDesc" style="width:129mm;height:4.5mm;padding-left:2mm;">
								<span style="float:left;">Add lines 8e and 9</span>
								<span class="styBoldText" style="float:right;padding-right:3.2mm;">
									<xsl:call-template name="DotLoop">
										<xsl:with-param name="DotQty" select="23"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:7mm;border-bottom-width:0px;">10</div>
							<div class="styLNAmountBox" style="height:6mm;width:26mm; border-bottom-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalInterestPaidAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--Gifts to Charity	-->
					<div class="styBB" style="width:187mm;height:28.6mm;">
						<div class="styIRS1040ScheduleAleftBox" style="width:20mm; height:28.6mm;font-size:8.8pt;border-left-width:0px;padding-top:1mm;">
							<span class="styBoldText">Gifts to<br/>Charity<br/>
							</span>
							<br/>
							<span class="styBoldText" style="font-size:6.5pt">Caution: </span>
							<span style="width:4px"/>
							<span style="font-size:6.5pt">If you </span>
							<div style="font-size:6.5pt;padding-top:.2mm">made a gift <br/>and got a<br/>benefit for it<br/>see instructions.</div>
						</div>
						<!--Line 11 -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:9mm;width:4mm;padding-left:.3mm;padding-top:1mm;">11</div>
							<div class="styLNDesc" style="width:96mm;height:9mm;padding-left:2mm;padding-top:1mm;">
								<span style="float:left;">Gifts by cash or check. If you made any gift of $250 or more, see </span>
								instructions
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 11 - Qualified Contributions Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/GiftsByCashOrCheckAmt/@qualifiedContributionsAmt"/>
								</xsl:call-template>  
								<span class="styBoldText" style="float:right;padding-right:1mm;">
									<xsl:call-template name="DotLoop">
										<xsl:with-param name="DotQty" select="17"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:9mm;width:7mm;padding-top:0mm;border-bottom-width:0px;">
								<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:0px;border-left-width:0px; background-color:lightgray;"/>
								<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:1px;border-left-width:0px;">11</div>
							</div>
							<div class="styLNAmountBox" style="height:9mm;width:26mm;border-bottom-width:1px; padding-right:.5mm;padding-top:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/GiftsByCashOrCheckAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:9mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:9mm;width:26mm;border-bottom-width:0px;"/>
						</div>
						<!--Line 12 -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:.3mm;">12</div>
							<div class="styLNDesc" style="width:96mm;height:9mm;padding-left:2mm;">
								<span style="float:left;">Other than by cash or check. If you made any gift of $250 or more,  </span>
								<br/>
								<span style="float:left;padding-top:1mm;">see instructions. You <span style="font-weight:bold;font-size:7.5pt"> must </span> 
								attach Form 8283 if over $500								
								<span style="width:9px"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/OtherThanByCashOrCheckAmt"/>
									</xsl:call-template>
									<span style="width:4px"/>
									<span class="styBoldText" style="float:right;padding-right:1mm;">
										<xsl:call-template name="DotLoop">
											<xsl:with-param name="DotQty" select="2"/>
										</xsl:call-template>
									</span>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:9mm;width:7mm;padding-top:0mm;border-bottom-width:0px;">
								<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:0px;border-left-width:0px; background-color:lightgray;"/>
								<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:1px;border-left-width:0px;">12</div>
							</div>
							<div class="styLNAmountBox" style="height:9mm;width:26mm;border-bottom-width:1px; padding-right:.5mm;padding-top:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherThanByCashOrCheckAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:9mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:9mm;width:26mm;border-bottom-width:0px;"/>
						</div>
						<!--Line 13 -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:.3mm;">13</div>
							<div class="styLNDesc" style="width:96mm;height:4.5mm;padding-left:2mm;">
								<span style="float:left;">Carryover from prior year</span>
								<span class="styBoldText" style="float:right;padding-right:1mm;">
									<xsl:call-template name="DotLoop">
										<xsl:with-param name="DotQty" select="13"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:1px;">13</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:26mm;border-bottom-width:1px; padding-right:.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CarryoverFromPriorYearAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:26mm;border-bottom-width:0px;"/>
						</div>
						<!--Line  14-->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:.3mm;padding-top:1mm;">14</div>
							<div class="styLNDesc" style="width:129mm;height:4.5mm;padding-left:2mm;padding-top:1mm;">
								<span style="float:left;">Add lines 11 through 13</span>
								<span class="styBoldText" style="float:right;padding-right:3.2mm;">
									<xsl:call-template name="DotLoop">
										<xsl:with-param name="DotQty" select="21"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:7mm;border-bottom-width:0px;padding-top:1mm;">14</div>
							<div class="styLNAmountBox" style="height:6mm;width:26mm; border-bottom-width:0px;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalCharitableContriAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--Casualty and Theft Losses-->
					<div class="styBB" style="width:187mm;height:10mm;">
						<div class="styIRS1040ScheduleAleftBox" style="width:20mm; height:10mm;font-size:7.7pt;border-left-width:0px; padding-top:.5mm;">
							<span class="styBoldText">Casualty and<br/>Theft Losses</span>
						</div>
						<!--Line 15 -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:10mm;width:4mm;padding-left:.3mm;">15</div>
							<div class="styLNDesc" style="width:129mm;height:10mm;padding-left:2mm;">
								<span style="float:left;">Casualty and theft loss(es) from a federally declared disaster (other than
								net qualified disaster losses). Attach Form 4684 and enter the amount from line 18 of that form. See instructions
								<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/CalcAdjGroIncmMnsTotNetLossAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:10mm;width:7mm;border-bottom-width:0px;padding-top:4mm;">15</div>
							<div class="styLNAmountBox" style="height:10mm;width:26mm; border-bottom-width:0px;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CalcAdjGroIncmMnsTotNetLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--Other Itemized Deductions-->
					<div class="styBB" style="width:187mm;height:13mm;">
						<div class="styIRS1040ScheduleAleftBox" style="width:20mm; height:13mm;font-size:8.8pt;border-left-width:0px;padding-top:.5mm;">
							<span class="styBoldText">Other<br/>Itemized<br/>Deductions</span>
						</div>
						<!--Line 16 -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:8mm;width:4mm;padding-left:.3mm;padding-top:0.8mm;">16</div>
							<div class="styLNDesc" style="width:129mm;height:13mm;padding-left:2mm;">
								<span style="float:left;">Other <img src="{$ImagePath}/1040SchA_JobExp_Longdash.gif" alt="Other from Longdash Image"/> from list in instructions. List type and amount
								<span style="width:1.3mm"/>
									<img src="{$ImagePath}/1040SchA_Bullet.gif" alt="SmallBullet Image"/>
									<span style="width:2mm"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/OtherMiscellaneousDedAmt"/>
									</xsl:call-template>
									<span style="width:9px;"/>
									<span style="width:40mm;border-bottom:dotted 1px;text-align:right;"/>
									<br/>
									<span style="width:120mm;border-bottom:dotted 1px;text-align:right;padding-top:3.5mm;"/>
									<span style="width:43mm;border-bottom:dotted 0px;text-align:right;padding-top:3.5mm;"/>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:13mm;width:7mm;border-bottom-width:0px;padding-top:7.5mm;">16</div>
							<div class="styLNAmountBox" style="height:13mm;width:26mm; border-bottom-width:0px;padding-top:7.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherMiscellaneousDedAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--Total Itemized Deductions-->
					<div class="styBB" style="width:187mm;height:18mm;">
						<div class="styIRS1040ScheduleAleftBox" style="width:20mm; height:18mm;font-size:8.8pt;border-left-width:0px; padding-top:.5mm;">
							<span class="styBoldText">Total<br/>Itemized<br/>Deductions<br/>
							</span>
							<br/>
						</div>
						<!--Line 17 -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:9mm;width:4mm;padding-left:.3mm;padding-top:1mm;">17</div>
							<div class="styLNDesc" style="width:129mm;height:9mm;padding-left:2mm;padding-top:1mm;">
								<span style="float:left;">Add the amounts in the far right column for lines 4 through 16. Also, enter this amount on </span>
								<br/>
								Form 1040 or 1040-SR, line 12a
								<span class="styBoldText" style="float:right;padding-right:3.2mm;">
									<xsl:call-template name="DotLoop">
										<xsl:with-param name="DotQty" select="19"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:0px;background-color:lightgray;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:26mm; border-bottom-width:0px;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:0px;">17</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:26mm; border-bottom-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalItemizedDeductionsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 18 -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:9mm;width:4mm;padding-left:.3mm;">18</div>
							<div class="styLNDesc" style="width:129mm;height:9mm;padding-left:2mm;">
								<span style="float:left;">If you elect to itemize deductions even though they are less than your standard deduction, </span>
								<br/>
								check this box
								<span style="width:3px;"/>
								<span class="styBoldText" style="padding-right:1mm;">
									<xsl:call-template name="DotLoop">
										<xsl:with-param name="DotQty" select="22"/>
									</xsl:call-template>
									<span style="width:5px;"/>
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									<span style="width:5px;"/>
									<input type="Checkbox" alt="ItmzdDedLessThanStdDedInd" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ItmzdDedLessThanStdDedInd"/>
											<xsl:with-param name="BackupName">IRS1040SchAItmzdDedLessThanStdDedInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/ItmzdDedLessThanStdDedInd"/>
											<xsl:with-param name="BackupName">IRS1040SchAItmzdDedLessThanStdDedInd</xsl:with-param>
										</xsl:call-template>
									</label>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:9mm;width:7mm;border-bottom-width:1px;background-color:lightgray;"/>
							<div class="styLNAmountBox" style="height:9mm;width:26mm; border-bottom-width:1px;background-color:lightgray;"/>
						</div>
					</div>
					<div style="width:187mm;clear:both;">
						<div style="width:112mm;font-weight:bold;font-size:6.5pt;" class="styGenericDiv">
              For Paperwork Reduction Act Notice, see the <span style="font-family:Arial">I</span>nstructions for Form 1040 and 1040-SR.
			</div>
						<div style="width:23mm;text-align:center;font-size:6pt;padding-left:0mm" class="styGenericDiv">Cat. No. 17145C</div>
						<div style="float:right;font-size:6pt" class="styGenericDiv">
							<span class="styBoldText">Schedule A (Form 1040) 2021</span>
						</div>
					</div>
					<div class="pageEnd" style="width:187mm;"/>
					<!--Begininning of write-in data -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
                          Additional Data        
                        </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" tabindex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 2c - Form or schedule number</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/FormScheduleNumber"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 11 - Qualified Contribution Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/GiftsByCashOrCheckAmt/@qualifiedContributionsAmt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
