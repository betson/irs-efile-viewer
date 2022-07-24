<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Eugenia McDonald 11/12/2020 -->
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
								<img src="{$ImagePath}/1040SchA_Bullet.gif" alt="Right pointing arrowhead image"/>
								<b>Go to <a style="text-decoration:none;color:black;" href="www.irs.gov/ScheduleA " title="Link to IRS.gov">
										<i>www.irs.gov/ScheduleA </i>
									</a> for instructions and the latest information.
								</b>
								<br/>
								<span style="padding-top:.5mm;">
									<img src="{$ImagePath}/1040SchA_Bullet.gif" alt="Right pointing arrowhead image"/>
									<b>Attach to Form 1040.</b>
								</span>
								<span style="padding-top:.5mm;">
									<b>Caution:</b> If you are claiming a net qualified disaster loss on Form 4684, see the instructions for <br/>line 28.
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width:32mm;height:19.5mm;">
							<br/>
							<div class="styOMB" style="height:2mm;padding-top:0mm;padding-left:3mm;line-height: 0px;">OMB No. 1545-0074</div>
							<div class="styTY" style="height:6mm;font-size:18pt;padding-top:0mm;padding-bottom:0mm;line-height:100%;padding-left:0mm">
								20<span class="styTYColor">17</span>
							</div>
							<div class="styOMB" style="padding-top:1mm;text-align:left;padding-left:5mm;border-bottom-width:0px;line-height:10px">Attachment <br/>
								Sequence No. <span class="styBoldText">07</span>
							</div>
						</div>
					</div>
					
					<div style="width:187mm;height:7mm;" class="styBB">
						<div style="width:145mm;height:7mm;font-weight:normal;font-size:7pt;" class="styNameBox">Name(s) shown on Form 1040<br/>
							<div style="padding-top:1mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
									<xsl:with-param name="BackupName">$RtnHdrDataFilerName</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						
						<!--Your social Security number	/-->
						<div style="width:40mm;height:7mm;padding-left:1mm;font-size:7pt;font-weight:bold;" class="styEINBox">Your social security number<br/>
							<span style="width:9.5mm"/>
							<span style="font-weight:normal; padding-top:.8mm;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					
					<!--Medical and Dental Expenses Section	/-->
					<div class="styBB" style="width:187mm;height:22.6mm;">
						<div class="styIRS1040ScheduleAleftBox" style="width:20mm; height:22.6mm;font-size:8.8pt;border-left-width:0px; padding-top:.5mm;">
							<span class="styBoldText">Medical<br/>and<br/>Dental<br/>Expenses<br/></span>
						</div>
						<!--Caution Do not include -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;"/>
							<div class="styLNDesc" style="width:88mm;height:4.5mm;padding-left:2mm;">
								<span><b>Caution:</b> Do not include expenses reimbursed or paid by others.</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:30mm; border-bottom-width:0px;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:30mm;border-bottom-width:0px;"/>
						</div>
						
						<!--Line 1 -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:2mm;">1</div>
							<div class="styLNDesc" style="width:88mm;height:4.5mm;padding-left:2mm;">
								<span>Medical and dental expenses (see instructions)</span>
								<span style="width:1mm"/>
								<span style=" letter-spacing:3.2mm;font-weight:bold;float:right;padding-right:1mm ">......</span>   
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;">1</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:30mm;padding-right:.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MedicalAndDentalExpensesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:30mm;border-bottom-width:0px;"/>
						</div>
						
						<!--Line 2 -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:2mm;">2</div>
							<div class="styLNDesc" style="width:55mm;height:4.5mm;padding-left:2mm;">
								<span style="float:left; font-size:7pt;">Enter amount from Form 1040, line 38</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;">2</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:26mm;padding-right:.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxReturnAGIAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:30mm; border-bottom-width:0px;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:30mm;border-bottom-width:0px;"/>
						</div>
						
						<!--Line  3-->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:2mm;">3</div>
							<div class="styLNDesc" style="width:88mm;height:4.5mm;padding-left:2mm;">
								<span style="float:left;">Multiply line 2 by 7.5% (0.075)</span>
								<span style="width:1mm"/>
								<span style=" letter-spacing:3.2mm;font-weight:bold;float:right;padding-right:1mm ">..........</span>   
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;">3</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:30mm; padding-right:.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CalculatedMedicalAllowanceAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:30mm;border-bottom-width:0px;"/>
						</div>
						
						<!--Line  4-->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:2mm;">4</div>
							<div class="styLNDesc" style="width:125mm;height:4.5mm;padding-left:2mm;">
								<span style="float:left;">Subtract line 3 from line 1. If line 3 is more than line 1, enter -0-</span>
								<span class="styBoldText" style="float:right;padding-right:3.2mm;">
									<xsl:call-template name="DotLoop">
										<xsl:with-param name="DotQty" select="8"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:0px;">4</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:30mm; border-bottom-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalMedicalAndDentalExpnssAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					
					<!--Taxes You Paid	/-->
					<div class="styBB" style="width:187mm;height:35.5mm;">
						<div class="styIRS1040ScheduleAleftBox" style="width:20mm; height:35.8mm;font-size:8.8pt;border-left-width:0px; padding-top:.5mm;">
							<span class="styBoldText">Taxes You<br/>Paid<br/></span>
						</div>
						<!--Line 5 -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:2mm;">5</div>
							<div class="styLNDesc" style="width:88mm;height:13mm;padding-left:2mm;">
								<span style="float:left;">State and local <span class="styBoldText">(check only one box):</span>
								</span>
								<div style="width:38mm;height:11mm;float:left;clear:both;">
									<div style="width:38mm;float:none;clear:both;">
										<span class="styBoldText" style="padding-right:3mm;">a</span>
										<input type="Checkbox" alt="StateAndLocalIncomeTaxInd" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/StateAndLocalIncomeTaxInd"/>
												<xsl:with-param name="BackupName">IRS1040SchAStateAndLocalIncomeTaxInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/StateAndLocalIncomeTaxInd"/>
												<xsl:with-param name="BackupName">IRS1040SchAStateAndLocalIncomeTaxInd</xsl:with-param>
											</xsl:call-template>
											 Income taxes, <b>or</b>
										</label>
									</div>
									<div style="width:38mm;float:left;clear:none;">
										<span class="styBoldText" style="padding-right:3mm;">b</span>
										<input type="Checkbox" alt="IRS1040SchAStateAndLocalSalesTaxInd" class="styCkbox">
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
												General sales taxes
											</label>
									</div>
								</div>
								<div style="width:5mm;float:left;padding-top:2mm;">
									<img src="{$ImagePath}/1040SchA_Bracket_Sm3.gif" alt="SmallerBracket Image" align="middle"/>
								</div>
								<div style="width:43mm;height:11mm;padding-top:1mm;padding-left:2mm;">
									<span style="width:1mm"/>
								<span style=" letter-spacing:3.2mm;font-weight:bold;float:right;padding-right:1mm ">.........</span>   
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:13mm;width:7mm;padding-top:0mm;border-bottom-width:0px;">
								<div class="styLNRightNumBox" style="height:9mm;width:7mm;border-bottom-width:1px;border-left-width:0px;padding-top:4.5mm;">5</div>
								<div class="styLNRightNumBox" style="height:4mm;width:7mm;border-bottom-width:0px;border-left-width:0px;"/>
							</div>
							<div class="styLNAmountBox" style="height:13mm;width:30mm;border-bottom-width:0px; padding-top:0mm;">
								<div class="styLNAmountBox" style="height:9mm;width:30mm;border-bottom-width:1px;border-left-width:0px; padding-right:.5mm;padding-top:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/StateAndLocalTaxAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:13mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:13mm;width:30mm;border-bottom-width:0px;"/>
						</div>
						
						<!-- Line 6 -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:2mm;">6</div>
							<div class="styLNDesc" style="width:88mm;height:4.5mm;padding-left:2mm;">
								<span style="float:left;">Real estate taxes (see instructions)</span>
								<span style="width:1mm"/>
								<span style=" letter-spacing:3.2mm;font-weight:bold;float:right;padding-right:1mm ">.........</span>   
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:1px;">6</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:30mm;border-bottom-width:1px; padding-right:.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/RealEstateTaxesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:30mm;border-bottom-width:0px;"/>
						</div>
						
						<!-- Line 7 -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:2mm;">7</div>
							<div class="styLNDesc" style="width:88mm;height:4.5mm;padding-left:2mm;">
								<span style="float:left;">Personal property taxes</span>
								<span style="width:1mm"/>
								<span style=" letter-spacing:3.2mm;font-weight:bold;float:right;padding-right:1mm ">.............</span>   
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:1px;">7</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:30mm;border-bottom-width:1px; padding-right:.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/PersonalPropertyTaxesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:30mm;border-bottom-width:0px;"/>
						</div>
						
						<!--Line 8 -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:2mm;">8</div>
							<div class="styLNDesc" style="width:88mm;height:9mm;padding-left:2mm;">
								<span style="float:left;">Other taxes. List type and amount
										<span style="width:1.3mm"/>
									<img src="{$ImagePath}/1040SchA_Bullet.gif" alt="Right pointing arrowhead image"/>
									<span style="width:2mm"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/OtherTaxesAmt"/>
									</xsl:call-template>
								</span>
								<span style="width:9px;"/>
								<span style="width:30mm;border-bottom:dotted 1px;text-align:right;"/>
								<br/>
								<span style="width:85mm;border-bottom:dotted 1px;text-align:right;padding-top:3.5mm;"/>
							</div>
							<div class="styLNRightNumBox" style="height:9mm;width:7mm;padding-top:0mm;border-bottom-width:0px;">
								<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:0px;border-left-width:0px; background-color:lightgray;"/>
								<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:1px;border-left-width:0px;">8</div>
							</div>
							<div class="styLNAmountBox" style="height:9mm;width:30mm;border-bottom-width:1px; padding-right:.5mm;padding-top:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherTaxesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:9mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:9mm;width:30mm;border-bottom-width:0px;"/>
						</div>
						
						<!--Line  9-->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBoxSD" style="height:4.5mm;width:4mm;padding-left:2mm;">9</div>
							<div class="styLNDesc" style="width:125mm;height:4.5mm;padding-left:2mm;">
								<span style="float:left;">Add lines 5 through 8</span>
								<span style="width:1mm"/>
								<span style=" letter-spacing:3.2mm;font-weight:bold;float:right;padding-right:1mm ">.......................</span>   
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:0px;">9</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:30mm; border-bottom-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxesPaidAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					
					<!--Interest You Paid-->
					<div class="styBB" style="width:187mm;height:43mm;">
						<div class="styIRS1040ScheduleAleftBox" style="width:20mm; height:43mm;font-size:8.8pt;border-left-width:0px; border-right-width:0px;padding-top:.5mm;">
							<span class="styBoldText">Interest <br/>You Paid<br/></span>
							<br/><br/>
							<span class="styBoldText" style="font-size:7pt">Note: </span>
							<br/>
							<span style="font-size:7pt"> Your mortgage</span>
							<div style="font-size:7pt;padding-top:.2mm"> interest <br/>deduction may<br/>be limited (see<br/>instructions).</div>
						</div>
						
						<!--Line 10 -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:.3mm;">10</div>
							<div class="styLNDesc" style="width:88mm;height:4.5mm;padding-left:2mm;">
								<span style="float:left;">Home mortgage interest and points reported to you on Form 1098.
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:1px;">10</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:30mm;border-bottom-width:1px;padding-right:.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/RptHomeMortgIntAndPointsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:30mm;border-bottom-width:0px;"/>
						</div>
						
						<!-- Line 11 -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:.3mm;">11</div>
							<div class="styLNDesc" style="width:88mm;height:16mm;padding-left:2mm;">
								<span style="float:left;">Home mortgage interest not reported to you on Form 1098. If paid</span>
								<br/>
								<span style="float:left;">to the person from whom you bought the home, see instructions</span> <br/>
								<span style="float:left;"> and show that person's name, identifying no., and address 
								<span style="width:3px;"/>
									<img src="{$ImagePath}/1040SchA_Bullet.gif" alt="Right pointing arrowhead image"/>
									<span style="width:2mm"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/Form1098HomeMortgIntNotRptAmt"/>
									</xsl:call-template>
								</span>
								<br/>
								<span style="width:85mm;border-bottom:dotted 1px;text-align:right;padding-top:2.5mm;"/> <br/>
								<span style="width:85mm;border-bottom:dotted 1px;text-align:right;padding-top:2.5mm;"/>
							</div>
							<div class="styLNRightNumBox" style="height:16mm;width:7mm;padding-top:0mm;border-bottom-width:0px;">
								<div class="styLNRightNumBox" style="height:11.5mm;width:7mm;border-bottom-width:0px;border-left-width:0px; background-color:lightgray;"/>
								<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:1px;border-left-width:0px;">11</div>
							</div>
							<div class="styLNAmountBox" style="height:16mm;width:30mm;border-bottom-width:1px; padding-right:.5mm;padding-top:11.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/Form1098HomeMortgIntNotRptAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:16mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:16mm;width:30mm;border-bottom-width:0px;"/>
						</div>
						
						<!-- Line 12 -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:.3mm;">12</div>
							<div class="styLNDesc" style="width:88mm;height:9mm;padding-left:2mm;">
								<span style="float:left;">Points not reported to you on Form 1098. See instructions for </span>
								<br/>
								<span style="float:left;padding-top:1mm;">special rules</span> 
									<span style="width:1mm"/>
									<span style=" letter-spacing:3.2mm;font-weight:bold;float:right;padding-top:1mm;padding-right:1mm ">................</span>   
							</div>
							<div class="styLNRightNumBox" style="height:9mm;width:7mm;padding-top:0mm;border-bottom-width:0px;">
								<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:0px;border-left-width:0px;"/>
								<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:1px;border-left-width:0px;">12</div>
							</div>
							<div class="styLNAmountBox" style="height:9mm;width:30mm;border-bottom-width:1px; padding-right:.5mm;padding-top:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/Form1098PointsNotReportedAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:9mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:9mm;width:30mm;border-bottom-width:0px;"/>
						</div>
						
						<!-- Line 13 -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:.3mm;">13</div>
							<div class="styLNDesc" style="width:88mm;height:4.5mm;padding-left:2mm;">
								<span style="float:left;">Reserved (see instructions)</span>
								<span style="width:1mm"/>
									<span style=" letter-spacing:3.2mm;font-weight:bold;float:right;padding-right:1mm ">............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:1px;">13</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:30mm;border-bottom-width:1px; padding-right:.5mm;background-color:lightgray">
								<!--<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MortgageInsurancePremiumsAmt"/>
								</xsl:call-template>-->
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:30mm;border-bottom-width:0px;"/>
						</div>
						
						<!--Line 14 -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBoxSD" style="height:4mm;width:4mm;padding-left:.3mm;">14</div>
							<div class="styLNDesc" style="width:88mm;height:4mm;padding-left:2mm;">
								<span style="float:left;font-size:6.5pt;">Investment interest. Attach Form 4952 if required. See instructions
										<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/InvestmentInterestAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:1px;">14</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:30mm;border-bottom-width:1px; padding-right:.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/InvestmentInterestAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:30mm;border-bottom-width:0px;"/>
						</div>
						
						<!--Line  15-->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:.3mm;">15</div>
							<div class="styLNDesc" style="width:125mm;height:4.5mm;padding-left:2mm;">
								<span style="float:left;">Add lines 10 through 14</span>
								<span style="width:1mm"/>
									<span style=" letter-spacing:3.2mm;font-weight:bold;float:right;padding-right:1mm ">......................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:0px;">15</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:30mm; border-bottom-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalInterestPaidAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					
					<!--Gifts to Charity	-->
					<div class="styBB" style="width:187mm;height:27mm;">
						<div class="styIRS1040ScheduleAleftBox" style="width:20mm; height:27mm;font-size:8.8pt;border-left-width:0px;padding-top:1mm;">
							<span class="styBoldText">Gifts to<br/>Charity<br/></span>
							<br/>
							<span style="font-size:7pt">If you made a</span>
							<div style="font-size:7pt;padding-top:.2mm">gift and got a<br/>benefit for it<br/>see instructions.</div>
						</div>
						
						<!--Line 16 -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:.3mm;">16</div>
							<div class="styLNDesc" style="width:88mm;height:9mm;padding-left:2mm;">
								<span style="float:left;">Gifts by cash or check. If you made any gift of $250 or more, </span>
								<br/>
								<span style="float:left;padding-top:1mm;">see instructions</span> 
								<span style="width:1mm"/>
									<span style=" letter-spacing:3.2mm;font-weight:bold;float:right;padding-top:1mm;padding-right:1mm ">...............</span>
							</div>
							<div class="styLNRightNumBox" style="height:9mm;width:7mm;padding-top:0mm;border-bottom-width:0px;">
								<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:0px;border-left-width:0px; background-color:lightgray;"/>
								<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:1px;border-left-width:0px;">16</div>
							</div>
							<div class="styLNAmountBox" style="height:9mm;width:30mm;border-bottom-width:1px; padding-right:.5mm;padding-top:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/GiftsByCashOrCheckAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:9mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:9mm;width:30mm;border-bottom-width:0px;"/>
						</div>
						
						<!--Line 17 -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:.3mm;">17</div>
							<div class="styLNDesc" style="width:88mm;height:9mm;padding-left:2mm;">
								<span style="float:left;">Other than by cash or check. If any gift of $250 or more, see </span>
								<br/>
								<span style="float:left;padding-top:1mm;">instructions. You <span style="font-weight:bold;font-size:7.5pt"> must </span> attach Form 8283 if over $500								

									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/OtherThanByCashOrCheckAmt"/>
									</xsl:call-template>
								</span>
								<span style="width:1mm"/>
								<span style=" letter-spacing:3.2mm;font-weight:bold;float:right;padding-right:1mm ">..</span>
							</div>
							<div class="styLNRightNumBox" style="height:9mm;width:7mm;padding-top:0mm;border-bottom-width:0px;">
								<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:0px;border-left-width:0px; background-color:lightgray;"/>
								<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:1px;border-left-width:0px;">17</div>
							</div>
							<div class="styLNAmountBox" style="height:9mm;width:30mm;border-bottom-width:1px; padding-right:.5mm;padding-top:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherThanByCashOrCheckAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:9mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:9mm;width:30mm;border-bottom-width:0px;"/>
						</div>
						
						<!--Line 18 -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:.3mm;">18</div>
							<div class="styLNDesc" style="width:88mm;height:4.5mm;padding-left:2mm;">
								<span style="float:left;">Carryover from prior year</span>
								<span style="width:1mm"/>
									<span style=" letter-spacing:3.2mm;font-weight:bold;float:right;padding-right:1mm ">............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:1px;">18</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:30mm;border-bottom-width:1px; padding-right:.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CarryoverFromPriorYearAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:30mm;border-bottom-width:0px;"/>
						</div>
						
						<!--Line  19-->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:.3mm;padding-top:1mm;">19</div>
							<div class="styLNDesc" style="width:125mm;height:4.5mm;padding-left:2mm;padding-top:1mm;">
								<span style="float:left;">Add lines 16 through 18</span>
								<span style="width:1mm"/>
									<span style=" letter-spacing:3.2mm;font-weight:bold;float:right;padding-right:1mm ">......................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:0px;padding-top:1mm;">19</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:30mm; border-bottom-width:0px;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalCharitableContriAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					
					<!--Casualty and Theft Losses-->
					<div class="styBB" style="width:187mm;height:9mm;">
						<div class="styIRS1040ScheduleAleftBox" style="width:20mm; height:9mm;font-size:7.7pt;border-left-width:0px; padding-top:.5mm;">
							<span class="styBoldText" style="font-family:Arial narrow;font-size:9.5pt">Casualty and<br/>Theft Losses</span>
						</div>
						<!--Line 20 -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:9mm;width:4mm;padding-left:.3mm;">20</div>
							<div class="styLNDesc" style="width:125mm;height:9mm;padding-left:2mm;">
								<span style="float:left;">Casualty or theft loss(es) other than net hurricane disaster losses. Attach Form 4684 </span>
								<br/>
								<span style="float:left;padding-top:1mm;">and enter the amount from line 18 of that form. See instructions.
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/CasualtyOrTheftLossesAmt"/>
									</xsl:call-template>
								</span>
								<span style="width:1mm"/>
								<span style=" letter-spacing:3.2mm;font-weight:bold;float:right;padding-top:1mm;padding-right:1mm ">........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:0px;background-color:lightgrey"></div>
							<div class="styLNAmountBox" style="height:4.5mm;width:30mm; border-bottom-width:0px;"></div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:0px;padding-top:1mm;">20</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:30mm; border-bottom-width:0px;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CasualtyOrTheftLossesAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					
					<!--Job Expenses and Certain Miscellaneous deductions-->
					<div class="styBB" style="width:187mm;height:45.5mm;">
						<div class="styIRS1040ScheduleAleftBox" style="width:20mm; height:45.5mm;font-size:7.7pt;border-left-width:0px; padding-top:.5mm;">
							<span class="styBoldText" style="font-family:Arial narrow;font-size:9pt">Job Expenses<br/>and Certain<br/>Miscellaneous<br/>Deductions</span>
						</div>
						<!--Line 21 -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:12mm;width:4mm;padding-left:.3mm;padding-top:1mm;">21</div>
							<div class="styLNDesc" style="width:88mm;height:8mm;padding-left:2mm;padding-top:1mm;">
								<span style="float:left;">Unreimbursed employee expenses <img src="{$ImagePath}/1040SchA_JobExp_Longdash.gif" alt="Employee Expenses Longdash Image"/> job travel, union dues,</span>
								<br/>
								<span style="float:left;">job education, etc. Attach Form 2106 or 2106-EZ  if required.</span>
								<br/>
								<span style="float:left;">See instructions.  
								<span style="width:3px;"/>
									<img src="{$ImagePath}/1040SchA_Bullet.gif" alt="Right pointing arrowhead image"/>
									<span style="width:3px;"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/UnreimEmployeeBusExpnsAmt"/>
									</xsl:call-template>
									<span style="width:1mm"/>
									<span style="width:52mm;border-bottom:dotted 1px;text-align:right;"/>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:12mm;width:7mm;padding-top:0mm;border-bottom-width:0px;">
								<div class="styLNRightNumBox" style="height:7mm;width:7mm;border-bottom-width:0px;border-left-width:0px; background-color:lightgray;"/>
								<div class="styLNRightNumBox" style="height:5mm;width:7mm;border-bottom-width:1px;border-left-width:0px;">21</div>
							</div>
							<div class="styLNAmountBox" style="height:12mm;width:30mm;border-bottom-width:1px; padding-right:.5mm;padding-top:7.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/UnreimEmployeeBusExpnsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:12mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:12mm;width:30mm;border-bottom-width:0px;"/>
						</div>
						
						<!--Line 22 -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:.3mm;">22</div>
							<div class="styLNDesc" style="width:88mm;height:4.5mm;padding-left:2mm;">
								<span style="float:left;">Tax preparation fees</span>
								<span style="width:1mm"/>
								<span style=" letter-spacing:3.2mm;font-weight:bold;float:right;padding-right:1mm ">..............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:1px;">22</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:30mm;border-bottom-width:1px; padding-right:.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxPreparationFeesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:30mm;border-bottom-width:0px;"/>
						</div>
						
						<!--Line 23 -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:.3mm;">23</div>
							<div class="styLNDesc" style="width:88mm;height:11mm;padding-left:2mm;">
								<span style="float:left;">Other expenses 
									<img src="{$ImagePath}/1040SchA_JobExp_Longdash.gif" alt="Other Expenses Longdash Image"/> investment, safe deposit box, etc. List type</span>
								<br/>
								<span style="float:left;"> and amount 
									<span style="width:3px;"/>
									<img src="{$ImagePath}/1040SchA_Bullet.gif" alt="Right pointing arrowhead image"/>
									<span style="width:1mm"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/OtherTaxesAmt"/>
									</xsl:call-template>
									<span style="width:.5mm"/>
									<span style="padding-left:3mm; width:59mm;border-bottom:dotted 1px;text-align:right;padding-top:2.5mm;"/>
								</span>
								<br/>
								<span style="width:83mm;border-bottom:dotted 1px;text-align:right;padding-top:3.5mm;"/>
							</div>
							<div class="styLNRightNumBox" style="height:11mm;width:7mm;padding-top:0mm;border-bottom-width:0px;">
								<div class="styLNRightNumBox" style="height:6.5mm;width:7mm;border-bottom-width:0px;border-left-width:0px; background-color:lightgray;"/>
								<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:1px;border-left-width:0px;">23</div>
							</div>
							<div class="styLNAmountBox" style="height:11mm;width:30mm;border-bottom-width:1px; padding-right:.5mm;padding-top:7mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherExpensesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:11mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:11mm;width:30mm;border-bottom-width:0px;"/>
						</div>
						
						<!--Line 24 -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:.3mm;">24</div>
							<div class="styLNDesc" style="width:88mm;height:4.5mm;padding-left:2mm;">
								<span style="float:left;">Add lines 21 through 23 </span>
								<span style="width:1mm"/>
								<span style=" letter-spacing:3.2mm;font-weight:bold;float:right;padding-right:1mm ">.............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:1px;">24</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:30mm;border-bottom-width:1px; padding-right:.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotJobExpnssAndCrtnMiscDedAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:30mm;border-bottom-width:0px;"/>
						</div>
						
						<!--Line 25 -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:.3mm;">25</div>
							<div class="styLNDesc" style="width:55mm;height:4.5mm;padding-left:2mm;">
								<span style="float:left; font-size:7pt;">Enter amount from Form 1040, line 38</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;">25</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:26mm;padding-right:.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxReturnAGIAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:30mm; border-bottom-width:0px;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:30mm;border-bottom-width:0px;"/>
						</div>
						
						<!--Line  26-->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:.3mm;">26</div>
							<div class="styLNDesc" style="width:88mm;height:4.5mm;padding-left:2mm;">
								<span style="float:left;">Multiply line 25 by 2% (0.02)</span>
								<span style="width:1mm"/>
								<span style=" letter-spacing:3.2mm;font-weight:bold;float:right;padding-right:1mm ">...........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;">26</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:30mm; padding-right:.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CalcJobExpnssMiscDedAllwncAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:30mm;border-bottom-width:0px;"/>
						</div>
						
						<!--Line  27-->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:.3mm;padding-top:1mm;">27</div>
							<div class="styLNDesc" style="width:125mm;height:4.5mm;padding-left:2mm;padding-top:1mm;">
								<span style="float:left;">Subtract line 26 from line 24. If line 26 is more than line 24, enter -0-</span>
								<span style="width:1mm"/>
								<span style=" letter-spacing:3.2mm;font-weight:bold;float:right;padding-right:1mm ">........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:0px;padding-top:1mm;">27</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:30mm; border-bottom-width:0px;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetMiscellaneousDeductionsAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					
					<!--Other Itemized Deductions-->
					<div class="styBB" style="width:187mm;height:12mm;">
						<div class="styIRS1040ScheduleAleftBox" style="width:20mm; height:12mm;font-size:7.7pt;border-left-width:0px; padding-top:.5mm;">
							<span class="styBoldText" style="font-family:Arial narrow;font-size:9pt">Other <br/>Miscellaneous<br/>Deductions</span>
						</div>
						
						<!--Line 28 -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:8mm;width:4mm;padding-left:.3mm;padding-top:0.8mm;">28</div>
							<div class="styLNDesc" style="width:125mm;height:12mm;padding-left:2mm;">
								<span style="float:left;">Other - from list in instructions. List type and amount
								<span style="width:1.3mm"/>
									<img src="{$ImagePath}/1040SchA_Bullet.gif" alt="Right pointing arrowhead image"/>
									<span style="width:2mm"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/OtherMiscellaneousDedAmt"/>
									</xsl:call-template>
									<span style="width:9px;"/>
									<span style="width:41mm;border-bottom:dotted 1px;text-align:right;"/>
									<br/>
									<span style="width:120mm;border-bottom:dotted 1px;text-align:right;padding-top:2.5mm;"/>
									<span style="width:43mm;border-bottom:dotted 0px;text-align:right;padding-top:3.5mm;"/>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:7.5mm;width:7mm;border-bottom-width:0px;background-color:lightgray;"/>
							<div class="styLNAmountBox" style="height:7.5mm;width:30mm; border-bottom-width:0px;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:0px;padding-top:1mm;">28</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:30mm; border-bottom-width:0px;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherMiscellaneousDedAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					
					<!--Total Itemized Deductions-->
					<div class="styBB" style="width:187mm;height:29mm;">
						<div class="styIRS1040ScheduleAleftBox" style="width:20mm; height:29mm;font-size:8.8pt;border-left-width:0px; padding-top:.5mm;">
							<span class="styBoldText" style="font-family: Arial narrow;font-size:9pt">Total<br/>Itemized<br/>Deductions<br/></span><br/>
						</div>
						
						<!--Line 29 -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;padding-left:.3mm;">29</div>
							<div class="styLNDesc" style="width:125mm;height:20mm;padding-left:2mm;">
								<span style="float:left;">Is Form 1040, line 38, over $156,900?</span>
								<div style="width:100mm;height:25mm;float:left;clear:both;">
									<div style="width:100mm;float:left;clear:none;">
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$FormData/ItemizedLimitationsByFSInd"/>
										</xsl:call-template>
										<input type="Checkbox" alt="ItemizedLimitationsByFSIndNo" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/ItemizedLimitationsByFSInd"/>
												<xsl:with-param name="BackupName">IRS1040SchAQualifiedBusinessIncomeDedInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="$FormData/ItemizedLimitationsByFSInd"/>
												<xsl:with-param name="BackupName">IRS1040SchAQualifiedBusinessIncomeDedInd</xsl:with-param>
											</xsl:call-template>
											<b>No.</b>
										</label>
										Your deduction is not limited. Add the amounts in the far right column <br/>
										<span style="width:5mm;"/>for lines 4 through 28. Also, enter this amount on Form 1040, line 40.
									</div>
									<div style="width:100mm;float:none;clear:both;">
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$FormData/ItemizedLimitationsByFSInd"/>
										</xsl:call-template>
										<input type="Checkbox" alt="ItemizedLimitationsByFSIndYes" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/ItemizedLimitationsByFSInd"/>
												<xsl:with-param name="BackupName">IRS1040SchAQualifiedBusinessIncomeDedInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$FormData/ItemizedLimitationsByFSInd"/>
												<xsl:with-param name="BackupName">IRS1040SchAQualifiedBusinessIncomeDedInd</xsl:with-param>
											</xsl:call-template>
											<b>Yes.</b>
										</label>
										Your deduction may be limited. See the Itemized Deductions <br/>
										<span style="width:5mm;"/>Worksheet in the instructions to figure the amount to enter.	   
									</div>
								</div>
								<div style="width:5mm;float:left;padding-top:2mm;">
									<img src="{$ImagePath}/1040SchA_Bracket_Sm2.gif" height="50mm;" alt="Curly Bracket Image"/>
								</div>
								<div style="width:15mm;height:18mm;padding-top:7mm;padding-left:2mm;">
									<span style="width:1mm"/>
									<span style=" letter-spacing:3.2mm;font-weight:bold;float:right;padding-right:1mm ">...</span>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:13mm;width:7mm;border-bottom-width:1px;padding-top:9mm;">29</div>
							<div class="styLNAmountBox" style="height:13mm;width:30mm; border-bottom-width:1px;padding-top:9mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalItemizedDeductionsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:7mm;width:7mm;border-bottom-width:0px;background-color:lightgray;"/>
							<div class="styLNAmountBox" style="height:7mm;width:30mm; border-bottom-width:0px;background-color:lightgray;"/>
						</div>
						
						<!--Line 30 -->
						<div style="width:166mm;font-size:7pt;float:left;">
							<div class="styLNLeftNumBox" style="height:9mm;width:4mm;padding-left:.3mm;">30</div>
							<div class="styLNDesc" style="width:125mm;height:9mm;padding-left:2mm;">
								<span style="float:left;">If you elect to itemize deductions even though they are less than your standard </span>
								<br/>
								deduction, check here
								<span style="width:3px;"/>
								<span>
									<span style=" letter-spacing:3.2mm;font-weight:bold;float:left;padding-top:1mm;padding-left:.3mm ">....................</span>
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
							<div class="styLNAmountBox" style="height:9mm;width:30mm; border-bottom-width:1px;background-color:lightgray;"/>
						</div>
					</div>
					
					<div style="width:187mm;clear:both;">
						<div style="width:112mm;font-weight:bold;font-size:6.5pt;" class="styGenericDiv">
							  For Paperwork Reduction Act Notice, see the <span style="font-family:Arial">I</span>nstructions for Form 1040.
						</div>
						<div style="width:23mm;text-align:center;font-size:6pt;padding-left:0mm" class="styGenericDiv">Cat. No. 17145C</div>
						<div style="float:right;font-size:6pt" class="styGenericDiv">
							<span class="styBoldText">Schedule A (Form 1040) 2017</span>
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
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
