<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS1041ScheduleDStyle.xsl"/>
  <xsl:param name="FormData" select="$RtnDoc/IRS1041ScheduleD"/>
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
		<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
			<!-- Set Document Title -->
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
			<!-- Set Target to Top -->
			<!-- Set Filename and Description -->
			<meta name="Description" content="Schedule D (Form 1041)"/>
			<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
			<xsl:call-template name="InitJS"/>
			<style type="text/css">
				<xsl:if test="not($Print) or $Print=''">
					<xsl:call-template name="IRS1041ScheduleDStyle"/>
					<xsl:call-template name="AddOnStyle"/>
				</xsl:if>
			</style>
			<xsl:call-template name="GlobalStylesForm"/>
		</head>
		<body class="styBodyClass" style="width:187mm">
			<form name="Form1041ScheduleD">
				<!-- BEGIN WARNING LINE -->
				<div class="styGenericDiv" style=" width:187mm;">
					<xsl:call-template name="DocumentHeader"/>
				</div>
				<!-- END WARNING LINE -->
				<!-- BEGIN FORM HEADER -->
				<div style="width:187mm;">
					<div class="styBB" style="width: 187mm;">
						<!-- Form Name -->
						<div class="styFNBox" style="width:26mm;height:20mm;border-right-width:2px;">
							<!-- Form Name -->
							<div class="styFormNumber" style="font-size: 10pt;height:13.3mm">SCHEDULE D<br/>
								<div class="styFormNumber" style="font-size: 8pt;">(Form 1041)</div><br/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData"/>
								</xsl:call-template>
							</div>
							<!-- Agency Name -->
							<span class="styAgency" style="font-size:6pt;">Department of the Treasury</span><br/>
							<span class="styAgency" style="font-size:6pt;">Internal Revenue Service</span>
						</div>
						<!-- Form Title Box -->
						<div class="styFTBox" style="width:130mm;height:20mm;">
							<!-- Form Title -->
							<div class="styMainTitle" style="height:6.5mm;padding-top: 1.7mm;padding-bottom: 1.2mm;">Capital Gains and Losses</div>
							<!-- Form Subtitle -->
							<div style="padding-top:3.5mm;">
								<span style="font-weight:bold; height:4mm;">
									<img src="{$ImagePath}/1040SchD_Bullet.gif" alt="Right arrow" border="0"/> Attach to Form 1041, Form 5227, or Form 990-T. <br />
									<img src="{$ImagePath}/1040SchD_Bullet.gif" alt="Right arrow" border="0"/> Use Form 8949 to list your transactions for lines 1b, 2, 3, 8b, 9, and 10. <br/>
									<img src="{$ImagePath}/1040SchD_Bullet.gif" alt="Right arrow" border="0"/> Information about Schedule D and its separate instructions is at 
									<a style="text-decoration:none;color:black;" href="http://www.irs.gov/form1041" title="Link to IRS.gov"><i>www.irs.gov/form1041</i>.</a>
								</span>              
							</div>
						</div>
						<!-- Tax Year Box -->
						<div class="styTYBox" style="width:31mm;height:20mm;border-left-width:2px;">
							<!-- OMB No. -->
							<div class="styOMB" style="height: 4mm;">OMB No. 1545-0092</div>
							<!-- Tax Year -->
							<div class="styTaxYear" style="height:8mm;padding-top:3.5mm;">20<span style="color:green;">16</span></div>            
						</div>
					</div>
					<!-- END FORM HEADER -->
					<!-- BEGIN TAXPAYER INFO -->
					<div class="styBB" style="width:187mm;float:left;clear:none;border-top-width:1px;">
						<!-- Name -->
						<div class="styNameBox" style="width:136mm;font-size:7pt;font-weight:normal;">Name of estate or trust<br/>
							<span style="height:6.5mm;">
								<xsl:choose>
									<xsl:when test="$RtnHdrData/Filer/NationalMortgageAssocCd">												
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">NationalMortgageAssocCd</xsl:with-param>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
										</xsl:call-template><br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
						<!-- SSN -->
						<div class="styEINBox" style="width:50mm;height:4mm;padding-left:2mm;font-size:7pt;">
							<b>Employer identification number</b><br/><br/>
							<span style="width:34mm;text-align:bottom;font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- END TAXPAYER INFO -->
					<!-- BEGIN NOTE -->
					<div class="styBB" style="width:187mm;padding-left:2px;font-size:9pt;">
						<b>Note: </b><i> Form 5227 filers need to complete <b>only</b> Parts I and II.</i>
					</div>
					<!-- END NOTE -->
					<!-- BEGIN PART I HEADER -->
					<div class="styBB" style="width:187mm;">
						<span class="styPartName" style="width:12mm;font-size:9pt;">Part l</span>
						<div class="styPartDesc" style="padding-left:1mm;width:168mm;font-size:9pt;">Short-Term Capital Gains and Losses&#151;Assets Held One Year or Less 
						</div>
					</div>
					<!-- END PART I HEADER -->
					<!-- 5/12/2015 AM: Adjusted widths to columns for Part I and Part II per Defect 43004 -->
					<div>
						<table class="IRS1041ScheduleD_styTable" cellspacing="0" name="STCapGainTable" id="STCapGainTable">
							<!-- BEGIN PART I TABLE HEADER -->
							<tr>
								<th class="IRS1041ScheduleD_styTableCellNote" style="width:75mm;height:18mm;font-weight:normal;" scope="col">
									See instructions for how to figure the amounts to enter on the lines below.<br/><br/>
									This form may be easier to complete if you round off cents to whole dollars.
								</th>
								<th class="IRS1041ScheduleD_styTableCellAmt" style="width:28mm;height:18mm;text-align:center;font-weight:normal;" scope="col">
									<span style="font-weight:bold;padding-top:2mm">(d)</span><br/>Proceeds<br/>(sales price)
								</th>
								<th class="IRS1041ScheduleD_styTableCellAmt" style="width:28mm;height:18mm;text-align:center;font-weight:normal;" scope="col">
									<span style="font-weight:bold;padding-top:2mm">(e)</span><br/>Cost<br/>(or other basis)
								</th>
								<th class="IRS1041ScheduleD_styTableCellAmt" style="width:28mm;height:18mm;text-align:center;font-weight:normal;font-size:7pt;" scope="col">
									<span style="font-weight:bold;">(g)</span><br/>Adjustments to gain or loss from Form(s) 8949, Part I, line 2, column (g)
								</th>
								<th class="IRS1041ScheduleD_styTableCellAmt" style="width:28mm;height:18mm;text-align:center;font-weight:normal;font-size:7pt;border-right-width:0px;" scope="col">
									<span style="font-weight:bold;">(h)</span><b> Gain or (loss)</b><br/>Subtract column (e) from column (d) and combine the result with column (g)
								</th>
							</tr>
							<!-- END PART I TABLE HEADER -->
							<!-- BEGIN PART I TABLE -->
							<!-- Line 1a -->
							<tr>
								<td class="IRS1041ScheduleD_styTableCellNote" style="width:8mm;height:24mm;border-right-width:0px">
									<span class="styLNLeftNumBoxSD">1a</span>
								</td>
								<td class="IRS1041ScheduleD_styTableCellNote" style="width:67mm;height:24mm">
									<span class="styDesc" style="width:67mm;padding-top:.5mm">Totals for all short-term transactions reported<br/> on Form 1099-B for which
										basis was reported<br/> to the IRS and for which you have no<br/> adjustments (see instructions). However, if<br/> you choose to
										report all these transactions<br/> on Form 8949, leave this line blank and go<br/>
										<span style="float:left;"> to line 1b</span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-left:6.5mm;padding-right:1mm;">...........</span>
									</span>
								</td>
								<td class="IRS1041ScheduleD_styTableCellDt" style="width:28mm;height:24mm;padding-top:20mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BBssRptNoAdjGrp/TotalProceedsSalesPriceAmt"/>
										</xsl:call-template>
								</td>
								<td class="IRS1041ScheduleD_styTableCellDt" style="width:28mm;height:24mm;padding-top:20mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BBssRptNoAdjGrp/TotalCostOrOtherBasisAmt"/>
										</xsl:call-template>
								</td>
								<td class="IRS1041ScheduleD_styTableCellAmt" style="width:28mm;height:24mm;vertical-align:bottom;background-color:lightgrey;"><br/></td>
								<td class="IRS1041ScheduleD_styTableCellAmt" style="width:28mm;height:24mm;border-right-width:0px;padding-top:20mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BBssRptNoAdjGrp/TotalGainOrLossAmt"/>
										</xsl:call-template>
								</td>
							</tr>
							<!-- Line 1b -->
							<tr>
								<td class="IRS1041ScheduleD_styTableCellNote" style="width:8mm;height:8mm;border-right-width:0px">
									<span class="styLNLeftNumBoxSD" style="height:auto;">1b</span>
								</td>
								<td class="IRS1041ScheduleD_styTableCellNote" style="width:67mm;height:8mm">
									<span style="float:left;">Totals for all transactions reported on Form(s) 8949</span><br/>
									<span style="float:left;"> with <b>Box A</b> checked</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
								</td>
								<td class="IRS1041ScheduleD_styTableCellDt" style="width:28mm;height:8mm;padding-top:4mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BShowsBasisGrp/TotalProceedsSalesPriceAmt"/>
										</xsl:call-template>
								</td>
								<td class="IRS1041ScheduleD_styTableCellDt" style="width:28mm;height:8mm;padding-top:4mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BShowsBasisGrp/TotalCostOrOtherBasisAmt"/>
										</xsl:call-template>
								</td>
								<td class="IRS1041ScheduleD_styTableCellAmt" style="width:28mm;height:8mm;padding-top:4mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BShowsBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
										</xsl:call-template>
								</td>
								<td class="IRS1041ScheduleD_styTableCellAmt" style="width:28mm;height:8mm;border-right-width:0px;padding-top:4mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BShowsBasisGrp/TotalGainOrLossAmt"/>
										</xsl:call-template>
								</td>
							</tr>
							<!-- Line 2 -->
							<tr>
								<td class="IRS1041ScheduleD_styTableCellNote" style="width:8mm;height:8mm;border-right-width:0px">
									<span class="styLNLeftNumBoxSD" style="height:auto;">2</span>
								</td>
								<td class="IRS1041ScheduleD_styTableCellNote" style="width:67mm;height:8mm">
									<span style="float:left;">Totals for all transactions reported on Form(s) 8949</span><br/>
									<span style="float:left;"> with <b>Box B</b> checked</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
								</td>
								<td class="IRS1041ScheduleD_styTableCellDt" style="width:28mm;height:8mm;padding-top:4mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotShowBasisGrp/TotalProceedsSalesPriceAmt"/>
										</xsl:call-template>
								</td>
								<td class="IRS1041ScheduleD_styTableCellDt" style="width:28mm;height:8mm;padding-top:4mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotShowBasisGrp/TotalCostOrOtherBasisAmt"/>
										</xsl:call-template>
								</td>
								<td class="IRS1041ScheduleD_styTableCellAmt" style="width:28mm;height:8mm;padding-top:4mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotShowBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
										</xsl:call-template>
								</td>
								<td class="IRS1041ScheduleD_styTableCellAmt" style="width:28mm;height:8mm;padding-top:4mm;border-right-width:0px;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotShowBasisGrp/TotalGainOrLossAmt"/>
										</xsl:call-template>
								</td>
							</tr>
							<!-- Line 3 -->
							<tr>
								<td class="IRS1041ScheduleD_styTableCellNote" style="width:8mm;height:8mm;border-right-width:0px">
									<span class="styLNLeftNumBoxSD" style="height:auto;">3</span>
								</td>
								<td class="IRS1041ScheduleD_styTableCellNote" style="width:67mm;height:8mm">
									<span style="float:left;">Totals for all transactions reported on Form(s) 8949</span><br/>
									<span style="float:left;">  with <b>Box C</b> checked</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
								</td>
								<td class="IRS1041ScheduleD_styTableCellDt" style="width:28mm;height:8mm;padding-top:4mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotReceivedGrp/TotalProceedsSalesPriceAmt"/>
										</xsl:call-template>
								</td>
								<td class="IRS1041ScheduleD_styTableCellDt" style="width:28mm;height:8mm;padding-top:4mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotReceivedGrp/TotalCostOrOtherBasisAmt"/>
										</xsl:call-template>
								</td>
								<td class="IRS1041ScheduleD_styTableCellAmt" style="width:28mm;height:8mm;padding-top:4mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotReceivedGrp/TotAdjustmentsToGainOrLossAmt"/>
										</xsl:call-template>
								</td>
								<td class="IRS1041ScheduleD_styTableCellAmt" style="width:28mm;height:8mm;padding-top:4mm;border-right-width:0px;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotReceivedGrp/TotalGainOrLossAmt"/>
										</xsl:call-template>
								</td>
							</tr>
						</table>
					</div>
					<!-- END PART I TABLE -->
					<!-- BEGIN LINE 4 -->
					<div class="styBB" style="width:187mm;border-bottom-width:0px;">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width:143.7mm;">
							<span style="float:left;">Short-term capital gain or (loss) from Forms 4684, 6252, 6781, and 8824</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
						</div>
						<div class="styLNRightNumBox" style="width:7mm;">4</div>
						<div class="styLNAmountBox" style="width:28mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/STGainOrLossFromFormsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 4 -->
					<!-- BEGIN LINE 5 -->
					<div class="styBB" style="width:187mm;border-bottom-width:0px;">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="width:143.7mm;">
							<span style="float:left;">Net short-term gain or (loss) from partnerships, S corporations, and other estates or trusts</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
						</div>
						<div class="styLNRightNumBox" style="width:7mm;">5</div>
						<div class="styLNAmountBox" style="width:28mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetSTGainOrLossFromSchK1Amt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 5 -->
					<!-- BEGIN LINE 6 -->
					<div class="styGenericDiv" style="width:187mm;height:8mm;">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="width:143.7mm;">Short-term capital loss carryover. Enter the amount, if any, from line 9 of the 2015 Capital Loss <br/>
							<span style="float:left;">Carryover Worksheet</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">...........................</span>
						</div>
						<div class="styLNRightNumBox" style="width:7mm;height:8mm;"><br/>6</div>
						<div class="styLNAmountBox" style="width:28mm;height:8mm;"><br/>(
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/STCapitalLossCarryoverAmt"/>
							</xsl:call-template>)
						</div>
					</div>
					<!-- END LINE 6 -->
					<!-- BEGIN LINE 7 -->
					<div class="styGenericDiv" style="width:187mm;height:8mm;">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="width:143.7mm;">
							<b>Net short-term capital gain or (loss).</b> Combine lines 1a through 6 in column (h). Enter here and on line <br/> 
							<span style="float:left;">17, column (3) on the back</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:left;padding-left:2mm;padding-right:1mm;">........................</span>
							<img src="{$ImagePath}/1040SchD_Bullet.gif" alt="Right arrow" border="0"/>
						</div>
						<div class="styLNRightNumBox" style="width:7mm;height:8mm;border-bottom:0px;"><br/>7</div>
						<div class="styLNAmountBox" style="width:28mm;height:8mm;border-bottom:0px;"><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetSTCapitalGainOrLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 7 -->                  
					<!-- BEGIN PART II HEADER -->
				   <div class="styBB" style="width:187mm;border-top:1px solid black;">
						<span class="styPartName" style="width:12mm;font-size:9pt;">Part ll</span>
						<div class="styPartDesc" style="padding-left:1mm;width:168mm;font-size:9pt;">
							Long-Term Capital Gains and Losses&#151;Assets Held More Than One Year
						</div>
					</div>
					<!-- END PART II HEADER -->
					<!-- BEGIN PART II TABLE -->
					<div>
						<table class="IRS1041ScheduleD_styTable" cellspacing="0" name="STCapGainTable" id="STCapGainTable">
							<!-- BEGIN PART II TABLE HEADER -->
							<tr>
								<th class="IRS1041ScheduleD_styTableCellNote" style="width:75mm;height:18mm;font-weight:normal;" scope="col">
									See instructions for how to figure the amounts to enter on the lines below.<br/><br/>
									This form may be easier to complete if you round off cents to whole dollars.
								</th>
								<th class="IRS1041ScheduleD_styTableCellAmt" style="width:28mm;height:18mm;text-align:center;font-weight:normal;" scope="col">
									<span style="font-weight:bold;padding-top:2mm">(d)</span><br/>Proceeds<br/>(sales price)
								</th>
								<th class="IRS1041ScheduleD_styTableCellAmt" style="width:28mm;height:18mm;text-align:center;font-weight:normal;" scope="col">
									<span style="font-weight:bold;padding-top:2mm">(e)</span><br/>Cost<br/>(or other basis)
								</th>
								<th class="IRS1041ScheduleD_styTableCellAmt" style="width:28mm;height:18mm;text-align:center;font-weight:normal;font-size:7pt;" scope="col">
									<span style="font-weight:bold;">(g)</span><br/>Adjustments to gain or loss from Form(s) 8949, Part II, line 2, column (g)
								</th>
								<th class="IRS1041ScheduleD_styTableCellAmt" style="width:28mm;height:18mm;text-align:center;font-weight:normal;font-size:7pt; border-right-width:0px;" scope="col">
									<span style="font-weight:bold;">(h)</span><b> Gain or (loss)</b><br/>Subtract column (e) from column (d) and combine the result with column (g)
								</th>
							</tr>
							<!-- END PART II TABLE HEADER -->
							<!-- BEGIN PART II TABLE -->
							<!-- Line 8a -->
							<tr>
								<td class="IRS1041ScheduleD_styTableCellNote" style="width:8mm;height:24mm;border-right-width:0px">
									<span class="styLNLeftNumBoxSD" style="height:auto;">8a</span>
								</td>
								<td class="IRS1041ScheduleD_styTableCellNote" style="width:67mm;height:24mm">
									<span style="float:left;padding-top:.5mm">Totals for all long-term transactions reported<br/> on Form 1099-B for which
										basis was reported<br/> to the IRS and for which you have no<br/> adjustments (see instructions). However, if<br/> you choose to
										report all these transactions<br/> on Form8949, leave this line blank and go<br/>
										<span style="float:left;"> to line 8b</span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-left:6.5mm;padding-right:1mm;">...........</span>
									</span>
								</td>
								<td class="IRS1041ScheduleD_styTableCellDt" style="width:28mm;height:24mm;padding-top:20mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BBssRptNoAdjGrp/TotalProceedsSalesPriceAmt"/>
										</xsl:call-template>
								</td>
								<td class="IRS1041ScheduleD_styTableCellDt" style="width:28mm;height:24mm;padding-top:20mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BBssRptNoAdjGrp/TotalCostOrOtherBasisAmt"/>
										</xsl:call-template>
								</td>
								<td class="IRS1041ScheduleD_styTableCellAmt" style="width:28mm;height:24mm;vertical-align:bottom;background-color:lightgrey;"><br/></td>
								<td class="IRS1041ScheduleD_styTableCellAmt" style="width:28mm;height:24mm;padding-top:20mm;border-right-width:0px;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BBssRptNoAdjGrp/TotalGainOrLossAmt"/>
										</xsl:call-template>
								</td>
							</tr>
							<!-- Line 8b -->
							<tr>
								<td class="IRS1041ScheduleD_styTableCellNote" style="width:8mm;height:8mm;border-right-width:0px">
									<span class="styLNLeftNumBoxSD" style="height:auto;">8b</span>
								</td>
								<td class="IRS1041ScheduleD_styTableCellNote" style="width:67mm;height:8mm">
									<span style="float:left;">Totals for all transactions reported on Form(s) 8949</span><br/>
									<span style="float:left;"> with <b>Box D</b> checked</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
								</td>
								<td class="IRS1041ScheduleD_styTableCellDt" style="width:28mm;height:8mm;padding-top:4mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BShowsBasisGrp/TotalProceedsSalesPriceAmt"/>
										</xsl:call-template>
								</td>
								<td class="IRS1041ScheduleD_styTableCellDt" style="width:28mm;height:8mm;padding-top:4mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BShowsBasisGrp/TotalCostOrOtherBasisAmt"/>
										</xsl:call-template>
								</td>
								<td class="IRS1041ScheduleD_styTableCellAmt" style="width:28mm;height:8mm;padding-top:4mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BShowsBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
										</xsl:call-template>
								</td>
								<td class="IRS1041ScheduleD_styTableCellAmt" style="width:28mm;height:8mm;padding-top:4mm;border-right-width:0px;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BShowsBasisGrp/TotalGainOrLossAmt"/>
										</xsl:call-template>
								</td>
							</tr>
							<!-- Line 9 -->
							<tr>
								<td class="IRS1041ScheduleD_styTableCellNote" style="width:8mm;height:8mm;border-right-width:0px">
									<span class="styLNLeftNumBoxSD" style="height:auto;">9</span>
								</td>
								<td class="IRS1041ScheduleD_styTableCellNote" style="width:67mm;height:8mm">
									<span style="float:left;">Totals for all transactions reported on Form(s) 8949</span><br/>
									<span style="float:left;"> with <b>Box E</b> checked</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
								</td>
								<td class="IRS1041ScheduleD_styTableCellDt" style="width:28mm;height:8mm;padding-top:4mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotShowBasisGrp/TotalProceedsSalesPriceAmt"/>
										</xsl:call-template>
								</td>
								<td class="IRS1041ScheduleD_styTableCellDt" style="width:28mm;height:8mm;padding-top:4mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotShowBasisGrp/TotalCostOrOtherBasisAmt"/>
										</xsl:call-template>
								</td>
								<td class="IRS1041ScheduleD_styTableCellAmt" style="width:28mm;height:8mm;padding-top:4mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotShowBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
										</xsl:call-template>
								</td>
								<td class="IRS1041ScheduleD_styTableCellAmt" style="width:28mm;height:8mm;padding-top:4mm;border-right-width:0px;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotShowBasisGrp/TotalGainOrLossAmt"/>
										</xsl:call-template>
								</td>
							</tr>
							<!-- Line 10 -->
							<tr>
								<td class="IRS1041ScheduleD_styTableCellNote" style="width:8mm;height:8mm;border-right-width:0px">
									<span class="styLNLeftNumBox" style="height:auto;">10</span>
								</td>
								<td class="IRS1041ScheduleD_styTableCellNote" style="width:67mm;height:8mm">
									<span style="float:left;">Totals for all transactions reported on Form(s) 8949</span><br/>
									<span style="float:left;"> with <b>Box F</b> checked</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
								</td>
								<td class="IRS1041ScheduleD_styTableCellDt" style="width:28mm;height:8mm;padding-top:4mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotReceivedGrp/TotalProceedsSalesPriceAmt"/>
										</xsl:call-template>
								</td>
								<td class="IRS1041ScheduleD_styTableCellDt" style="width:28mm;height:8mm;padding-top:4mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotReceivedGrp/TotalCostOrOtherBasisAmt"/>
										</xsl:call-template>
								</td>
								<td class="IRS1041ScheduleD_styTableCellAmt" style="width:28mm;height:8mm;padding-top:4mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotReceivedGrp/TotAdjustmentsToGainOrLossAmt"/>
										</xsl:call-template>
								</td>
								<td class="IRS1041ScheduleD_styTableCellAmt" style="width:28mm;height:8mm;padding-top:4mm;border-right-width:0px;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotReceivedGrp/TotalGainOrLossAmt"/>
										</xsl:call-template>
								</td>
							</tr>
						</table>
					</div>
					<!-- END PART II TABLE -->
					<!-- BEGIN LINE 11 -->
					<div class="styGenericDiv" style="width:187mm;float:none;clear:both;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:143.7mm;"/>
						<div class="styLNRightNumBox" style="width:7mm;border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="width:28mm;border-bottom-width:0px;"/>
					</div>         
					<div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="width:143.7mm;">
							<span style="float:left;">Long-term capital gain or (loss) from Forms 2439, 4684, 6252, 6781, and 8824</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
						</div>
						<div class="styLNRightNumBox" style="width:7mm;">11</div>
						<div class="styLNAmountBox" style="width:28mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/LTGainOrLossFromFormsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 11 -->
					<!-- BEGIN LINE 12 -->
					<div class="styGenericDiv" style="width:187mm;float:none;clear:both;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:143.7mm;"/>
						<div class="styLNRightNumBox" style="width:7mm;border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="width:28mm;border-bottom-width:0px;"/>
					</div>         
					<div class="styBB" style="width:187mm;border-bottom-width:0px;">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc" style="width:143.7mm;">
							<span style="float:left;">Net long-term gain or (loss) from partnerships, S corporations, and other estates or trusts</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="width:7mm;">12</div>
						<div class="styLNAmountBox" style="width:28mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetLTGainOrLossFromSchK1Amt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 12 -->
					<!-- BEGIN LINE 13 -->
					<div class="styGenericDiv" style="width:187mm;float:none;clear:both;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:143.7mm;"/>
						<div class="styLNRightNumBox" style="width:7mm;border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="width:28mm;border-bottom-width:0px;"/>
					</div>         
					<div class="styBB" style="width:187mm;border-bottom-width:0px;">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc" style="width:143.7mm;">
							<span style="float:left;">Capital gain distributions</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">..........................</span>
						</div>
						<div class="styLNRightNumBox" style="width:7mm;">13</div>
						<div class="styLNAmountBox" style="width:28mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CapitalGainDistributionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 13 -->
					<!-- BEGIN LINE 14 -->
					<div class="styGenericDiv" style="width:187mm;float:none;clear:both;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:143.7mm;"/>
						<div class="styLNRightNumBox" style="width:7mm;border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="width:28mm;border-bottom-width:0px;"/>
					</div>         
					<div class="styBB" style="width:187mm;border-bottom-width:0px;">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc" style="width:143.7mm;">
							<span style="float:left;">Gain from Form 4797, Part I</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.........................</span>
						</div>
						<div class="styLNRightNumBox" style="width:7mm;">14</div>
						<div class="styLNAmountBox" style="width:28mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form4797GainOrLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 14 -->
					<!-- BEGIN LINE 15 -->
					<div class="styGenericDiv" style="width:187mm;height:8mm;float:none;clear:both;">
						<div class="styLNLeftNumBox">15</div>
						<div class="styLNDesc" style="width:143.7mm;">Long-term capital loss carryover. Enter the amount, if any, from line 14 of the 2015 Capital Loss <br/>
							<span style="float:left;">Carryover Worksheet</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">...........................</span>
						</div>
						<div class="styLNRightNumBox" style="width:7mm;height:8mm;"><br/>15</div>
						<div class="styLNAmountBox" style="width:28mm;height:8mm;"><br/>(
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/LTCapitalLossCarryoverAmt"/>
							</xsl:call-template>)
						</div>
					</div>
					<!-- END LINE 15 -->
					<!-- BEGIN LINE 16 -->
					<div class="styGenericDiv" style="width:187mm;height:8mm;float:none;clear:both;">
						<div class="styLNLeftNumBox">16</div>
						<div class="styLNDesc" style="width:143.7mm;">
							<b>Net long-term capital gain or (loss).</b> Combine lines 8a through 15 in column (h). Enter here and on line<br/> 
							<span style="float:left;">18a, column (3) on the back</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:left;padding-left:2mm;padding-right:1mm;">......................</span>
							<img src="{$ImagePath}/1040SchD_Bullet.gif" alt="Right arrow" border="0"/>
						</div>
						<div class="styLNRightNumBox" style="width:7mm;height:8mm;border-bottom:0px;"><br/>16</div>
						<div class="styLNAmountBox" style="width:28mm;height:8mm;border-bottom:0px;"><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetLTCapitalGainOrLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 16 -->
					<!-- page footer -->
					<div class="pageEnd" style="width:187mm;border-top:1px solid black;border-top-width:2px;">
						<div class="stySmallText" style="width:110mm;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see the Instructions for Form 1041.</span>
						</div>
						<div class="stySmallText" style="width:29mm;">Cat. No. 11376V</div>
						<div class="stySmallText" style="width:48mm;text-align:right;"><span class="styBoldText">Schedule D (Form 1041) 2016</span>       </div>
					</div>
					<p style="page-break-before: always"/>
					<!--Begin Page 2 -->
					<div class="styBB" style="width:187mm;border-bottom-width:2px;">
						<span style="width:65mm;font-size:7pt;" class="styGenericDiv">Schedule D (Form 1041) 2016</span>
						<span style="float:right;font-size:7pt;text-align:center;" class="styGenericDiv">Page <b>2</b></span>
					</div>
					<!--  PART III HEADER -->
					<div class="styBB" style="width:187mm;height:11mm;">
						<span class="styPartName" style="width:17mm;font-size:9pt;">Part lll</span>
						<div class="styPartDesc" style="padding-left:1mm;width:73.8mm;font-size:9pt;padding-bottom:1mm;">
							<span style="width:3mm;"/>
							Summary of Parts I and II<br />
							<span style="font-size:8pt;font-weight:normal;">
								<span style="width:3mm;"/><b>Caution: </b> <i>Read the instructions <b>before</b><br />
								<span style="width:4mm;"/>completing this part.</i>
							</span>
						</div>
						<div class="IRS1041ScheduleD_styPartIIIHeader" style="padding-top:1mm"><b>(1)</b> Beneficiaries’<br />(see instr.)</div>
						<div class="IRS1041ScheduleD_styPartIIIHeader" style="padding-top:1mm"><b>(2)</b> Estate’s<br />or trust’s</div>
						<div class="IRS1041ScheduleD_styPartIIIHeader" style="padding-top:3.5mm;"><b>(3)</b> Total</div>
					</div> 
					<!-- END PART III HEADER -->
					<!-- BEGIN LINE 17 -->               
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBox">17</div>
						<div class="styLNDesc" style="width:74.8mm;">
							<span style="float:left;"><b>Net short-term gain or (loss)</b></span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
						</div>
						<div class="styLNRightNumBox">17</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BeneficiariesCapGainOrLossGrp/NetSTCapitalGainOrLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/EstateOrTrustCapGainOrLossGrp/NetSTCapitalGainOrLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCapitalGainOrLossGrp/NetSTCapitalGainOrLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 17 -->
					<!-- BEGIN LINE 18 -->               
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBox">18</div>
						<div class="styLNDesc" style="width:74.8mm;">
							<span style="float:left;"><b>Net long-term gain or (loss):</b></span>				
						</div>
						<div class="styLNRightNumBox" style="border-bottom-width:0px;" />
						<div class="styLNAmountBox" style="border-bottom-width:0px;" />
						<div class="styLNAmountBox" style="border-bottom-width:0px;" />
						<div class="styLNAmountBox" style="border-bottom-width:0px;" />	
					</div>
					<!-- END LINE 18 -->
					<!-- BEGIN LINE 18a -->               
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
						<div class="styLNDesc" style="width:74.8mm;">
							<span style="float:left;">Total for year</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
						</div>
						<div class="styLNRightNumBox">18a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BeneficiariesCapGainOrLossGrp/NetLongTermGainOrLossGrp/TotalForYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/EstateOrTrustCapGainOrLossGrp/NetLongTermGainOrLossGrp/TotalForYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCapitalGainOrLossGrp/NetLongTermGainOrLossGrp/TotalForYearAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 18a -->
					<!-- BEGIN LINE 18b -->               
					<div class="styGenericDiv" style="width:187mm;height:8mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
						<div class="styLNDesc" style="width:74.8mm;">
							<span style="float:left;">Unrecaptured section 1250 gain (see line 18 of the</span><br /><span style="float:left;">wrksht.)</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;"><br />18b</div>
						<div class="styLNAmountBox" style="height:8mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BeneficiariesCapGainOrLossGrp/NetLongTermGainOrLossGrp/UnrecapturedSection1250GainAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:8mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/EstateOrTrustCapGainOrLossGrp/NetLongTermGainOrLossGrp/UnrecapturedSection1250GainAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:8mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCapitalGainOrLossGrp/NetLongTermGainOrLossGrp/UnrecapturedSection1250GainAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 18b -->
					<!-- BEGIN LINE 18c -->               
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
						<div class="styLNDesc" style="width:74.8mm;">
							<span style="float:left;">28% rate gain</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
						</div>
						<div class="styLNRightNumBox">18c</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BeneficiariesCapGainOrLossGrp/NetLongTermGainOrLossGrp/Collectibles28PercentGainAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/EstateOrTrustCapGainOrLossGrp/NetLongTermGainOrLossGrp/Collectibles28PercentGainAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCapitalGainOrLossGrp/NetLongTermGainOrLossGrp/Collectibles28PercentGainAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 18c -->
					<!-- BEGIN LINE 19 -->               
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBox">19</div>
						<div class="styLNDesc" style="width:74.8mm;">
							<span style="float:left;padding-right:3mm"><b>Total net gain or (loss).</b> Combine lines 17 and 18a</span>
							<!--Dotted Line-->
							<!--<span class="styDotLn" style="float:left;padding-left:2mm;padding-right:1mm;">.</span>-->
							<img src="{$ImagePath}/1040SchD_Bullet.gif" alt="Right arrow" border="0"/>							
						</div>
						<div class="styLNRightNumBox">19</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BeneficiariesCapGainOrLossGrp/TotalNetGainOrLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/EstateOrTrustCapGainOrLossGrp/TotalNetGainOrLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCapitalGainOrLossGrp/TotalNetGainOrLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 19 -->
					<!-- BEGIN Note -->
					<div class="styGenericDiv" style="width:187mm;padding-top:1mm;padding-bottom:1mm;border-bottom:1px solid black;">
						<b>Note: </b><i> If line 19, column (3), is a net gain, enter the gain on Form 1041, line 4 (or Form 990-T, Part I, line 4a). If lines 18a and 19, column (2), are net
						gains, go to Part V, and <b>don't</b> complete Part IV. If line 19, column (3), is a net loss, complete Part IV and the <b>Capital Loss Carryover Worksheet,</b>
						 as necessary.</i>
					</div>
					<!-- END Note -->         
					<!--  PART IV HEADER -->
					<div class="styBB" style="width:187mm;">
						<span class="styPartName" style="width:17mm;font-size:9pt;">Part lV</span>
						<div class="styPartDesc" style="padding-left:1mm;width:168mm;font-size:9pt;">
							<span style="width:3mm;"/>Capital Loss Limitation 
						</div>
					</div> 
					<!-- END PART IV HEADER -->
					<!-- BEGIN LINE 20 -->               
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBoxSD">20</div>
						<div class="styLNDesc" style="width:138.8mm;padding-bottom:0mm;">
							<span style="float:left;">Enter here and enter as a (loss) on Form 1041, line 4 (or Form 990-T, Part I, line 4c, if a trust), the<br/><b>smaller</b> of:</span>
						</div>
						<div class="styLNRightNumBox" style="border-bottom-width:0px;height:7mm;" />
						<div class="styLNAmountBox" style="border-bottom-width:0px;height:7mm;" />
					</div>                               
					<div class="styGenericDiv" style="width:187mm;padding-top:0mm;">
						<div class="styLNLeftNumBoxSD" style="padding-left:5mm;">a</div>
						<div class="styLNDesc" style="width:138.8mm;">
							<span style="float:left;">The loss on line 19, column (3) <b>or b</b> $3,000</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
						</div>
						<div class="styLNRightNumBox">20</div>       
						<div class="styLNAmountBox">( 
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CapitalLossLimitationAmt"/>
							</xsl:call-template>)
						</div>
					</div>
					<!-- END LINE 20 -->
					<!-- BEGIN Note -->
					<div class="styGenericDiv" style="width:187mm;padding-top:1mm;padding-bottom:1mm;border-bottom:1px solid black;">
						<b>Note: </b> <i> If the loss on line 19, column (3), is more than $3,000, <b>or</b> if Form 1041, page 1, line 22 (or Form 990-T, line 34), is a loss, complete the
						<b>Capital Loss Carryover Worksheet</b> in the instructions to figure your capital loss carryover.</i>
					</div>
					<!-- END Note -->  
					<!--  PART V HEADER -->
					<div class="styBB" style="width:187mm;float:none;clear:both;">
						<span class="styPartName" style="width:17mm;font-size:9pt;">Part V</span>
						<div class="styPartDesc" style="padding-left:1mm;width:168mm;font-size:9pt;">
							<span style="width:3mm;"/>Tax Computation Using Maximum Capital Gains Rates<br />
						</div>
						<div class="styGenericDiv" style="width:187mm;padding-top:1mm;font-size:8pt;font-weight:normal;border-top:1px solid black;">
							<b>Form 1041 filers.</b> Complete this part <b>only</b> if both lines 18a and 19 in column (2) are gains, or an amount is entered
							 in Part I or Part II and there is an entry on Form 1041, line 2b(2), <b>and</b> Form 1041, line 22, is more than zero.<br />
						</div>
						<div class="styGenericDiv" style="width:187mm;padding-top:1mm;font-size:8pt;font-weight:normal;">
							<b>Caution:</b> Skip this part and complete the <b>Schedule D Tax Worksheet</b> in the instructions if:<br />
							• <i>Either line 18b, col. (2) or line 18c, col. (2) is more than zero, or</i><br />
							• <i>Both Form 1041, line 2b(1), and Form 4952, line 4g are more than zero.</i><br />
						</div>
						<div class="styGenericDiv" style="width:187mm;padding-top:1mm;padding-bottom:1mm;font-size:8pt;font-weight:normal;">
							<b>Form 990-T trusts.</b> Complete this part <b>only</b> if both lines 18a and 19 are gains, or qualified dividends are included in income
							 in Part I of Form 990-T, <b>and</b> Form 990-T, line 34, is more than zero. Skip this part and complete the <b>Schedule D Tax Worksheet</b>
							 in the instructions if either line 18b, col. (2) or line 18c, col. (2) is more than zero.
						</div>
					</div> 
					<!-- END PART V HEADER -->
					<div style="float:none;clear:both;">
					<!-- BEGIN LINE 21 -->               
					<div class="styGenericDiv" style="width:187mm;float:none;clear:both;height:4.4mm;">
						<div class="styLNLeftNumBox" style="4.4mm;">21</div>
						<div class="styLNDesc" style="width:98.8mm;height:4.4mm;">
							<span style="float:left;">Enter taxable income from Form 1041, line 22 (or Form 990-T, line 34)</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;">21</div>
						<div class="styLNAmountBox" style="height:4.4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="width:8mm;height:4.4mm;background-color:lightgrey;border-bottom-width:0px;" />
						<div class="styLNAmountBox" style="height:4.4mm;border-bottom:0px;width:10mm;" />
					</div>
					<!-- END LINE 21 -->
					<!-- BEGIN LINE 22 -->               
					<div class="styGenericDiv" style="width:187mm;float:none;clear:both;">
						<div class="styLNLeftNumBox">22</div>
						<div class="styLNDesc" style="width:58.8mm;">
							<span style="float:left;">Enter the <b>smaller</b> of line 18a or 19 in</span> <br /><span style="float:left;">column (2) but not less than zero</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>							
						</div>
						<div class="styLNRightNumBox" style="height:8mm;"><br />22</div>
						<div class="styLNAmountBox" style="height:8mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SmallerGainAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="width:8mm;height:8mm;background-color:lightgrey;border-bottom-width:0px;" />
						<div class="styLNAmountBox" style="border-bottom:0px;width:32mm;height:8mm;" />
						<div class="styLNRightNumBox" style="width:8mm;height:8mm;background-color:lightgrey;border-bottom-width:0px;" />
						<div class="styLNAmountBox" style="border-bottom:0px;height:8mm;width:10mm;" />
					</div>
					<!-- END LINE 22 -->
					<!-- BEGIN LINE 23 -->               
					<div class="styGenericDiv" style="width:187mm;float:none;clear:both;">
						<div class="styLNLeftNumBox">23</div>
						<div class="styLNDesc" style="width:58.8mm;">
							<span style="float:left;">Enter the estate’s or trust’s qualified</span><br />
							<span style="float:left;"> dividends from Form 1041, line 2b(2) (or</span><br />
							<span style="float:left;">enter the qualified dividends included in</span><br />
							<span style="float:left;"> income in Part I of Form 990-T)</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>					
						</div>
						<div class="styLNRightNumBox" style="height:15mm;"><br /><br /><br />23</div>
						<div class="styLNAmountBox" style="height:15mm;"><br /><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyDividendsEstateTrustAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="width:8mm;height:15mm;background-color:lightgrey;border-bottom-width:0px;" />
						<div class="styLNAmountBox" style="border-bottom:0px;width:32mm;height:15mm;" />
						<div class="styLNRightNumBox" style="width:8mm;height:15mm;background-color:lightgrey;border-bottom-width:0px;" />
						<div class="styLNAmountBox" style="border-bottom:0px;width:32mm;height:15mm;" />
					</div>
					<!-- END LINE 23 -->
					<!-- BEGIN LINE 24 -->               
					<div class="styGenericDiv" style="width:187mm;float:none;clear:both;">
						<div class="styLNLeftNumBox">24</div>
						<div class="styLNDesc" style="width:58.8mm;">
							<span style="float:left;">Add lines 22 and 23</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>							
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;">24</div>
						<div class="styLNAmountBox" style="height:4.4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/GainPlusDividendsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="width:8mm;height:4.4mm;background-color:lightgrey;border-bottom-width:0px;" />
						<div class="styLNAmountBox" style="border-bottom:0px;width:32mm;height:4.4mm;" />
						<div class="styLNRightNumBox" style="width:8mm;height:4.4mm;background-color:lightgrey;border-bottom-width:0px;" />
						<div class="styLNAmountBox" style="border-bottom:0px;width:32mm;height:4.4mm;" />
					</div>
					<!-- END LINE 24 -->
					<!-- BEGIN LINE 25 -->               
					<div class="styGenericDiv" style="width:187mm;float:none;clear:both;">
						<div class="styLNLeftNumBox">25</div>
						<div class="styLNDesc" style="width:58.8mm;">
							<span style="float:left;">If the estate or trust is filing Form 4952,</span><br />
							<span style="float:left;">enter the amount from line 4g; otherwise,</span><br />
							<span style="float:left;">enter -0-</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:left;padding-left:2mm;padding-right:1mm;">..........</span>					
							<img src="{$ImagePath}/1040SchD_Bullet.gif" alt="Right arrow" border="0"/>				
						</div>
						<div class="styLNRightNumBox" style="height:11mm;"><br /><br />25</div>
						<div class="styLNAmountBox" style="height:11mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/InvestmentIncomeElectionAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="width:8mm;height:11mm;background-color:lightgrey;border-bottom-width:0px;" />
						<div class="styLNAmountBox" style="border-bottom:0px;width:32mm;height:11mm;" />
						<div class="styLNRightNumBox" style="width:8mm;height:11mm;background-color:lightgrey;border-bottom-width:0px;" />
						<div class="styLNAmountBox" style="border-bottom:0px;width:32mm;height:11mm;" />
					</div>
					<!-- END LINE 25 -->
					<!-- BEGIN LINE 26 -->               
					<div class="styGenericDiv" style="width:187mm;float:none;clear:both;">
						<div class="styLNLeftNumBox" style="height:4.4mm;">26</div>
						<div class="styLNDesc" style="width:98.8mm; height:4.4mm;">
							<span style="float:left;">Subtract line 25 from line 24. If zero or less, enter -0-</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>					
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;">26</div>
						<div class="styLNAmountBox" style="height:4.4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/GainLessIncludedAmt"/>
							</xsl:call-template>
						</div>            
						<div class="styLNRightNumBox" style="width:8mm;height:4.4mm;background-color:lightgrey;border-bottom-width:0px;" />
						<div class="styLNAmountBox" style="border-bottom:0px;width:32mm;height:4.4mm;" />
					</div>
					<!-- END LINE 26 -->
					<!-- BEGIN LINE 27 -->               
					<div class="styGenericDiv" style="width:187mm;float:none;clear:both;">
						<div class="styLNLeftNumBox" style="height:4.4mm;">27</div>
						<div class="styLNDesc" style="width:98.8mm; height:4.4mm;">
							<span style="float:left;">Subtract line 26 from line 21. If zero or less, enter -0-</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>						
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;">27</div>
						<div class="styLNAmountBox" style="height:4.4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeLessGainAmt"/>
							</xsl:call-template>
						</div>            
						<div class="styLNRightNumBox" style="width:8mm;height:4.4mm;background-color:lightgrey;border-bottom-width:0px;" />
						<div class="styLNAmountBox" style="border-bottom:0px;width:32mm;height:4.4mm;" />
					</div>
					<!-- END LINE 27 -->
					<!-- BEGIN LINE 28 -->
					<div class="styGenericDiv" style="width:187mm;float:none;clear:both;">
						<div class="styLNLeftNumBox" style="height:4.4mm;">28</div>
						<div class="styLNDesc" style="width:98.8mm;height:4.4mm;">
							<span style="float:left;">Enter the <b>smaller</b> of the amount on line 21 or $2,550</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>					
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;">28</div>
						<div class="styLNAmountBox" style="height:4.4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SmallerTaxableIncmOrAllowedAmt"/>
							</xsl:call-template>
						</div>            
						<div class="styLNRightNumBox" style="width:8mm;height:4.4mm;background-color:lightgrey;border-bottom-width:0px;" />
						<div class="styLNAmountBox" style="border-bottom:0px;width:32mm;height:4.4mm;" />
					</div>
					<!-- END LINE 28 -->
					<!-- BEGIN LINE 29 -->               
					<div class="styGenericDiv" style="width:187mm;float:none;clear:both;">
						<div class="styLNLeftNumBox" style="height:4.4mm;">29</div>
						<div class="styLNDesc" style="width:98.8mm;height:4.4mm;">
							<span style="float:left;">Enter the <b>smaller</b> of the amount on line 27 or line 28</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>			
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;">29</div>
						<div class="styLNAmountBox" style="height:4.4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SmllrTxiLessGainOrTxiOrAllwAmt"/>
							</xsl:call-template>
						</div>            
						<div class="styLNRightNumBox" style="width:8mm;height:4.4mm;background-color:lightgrey;border-bottom-width:0px;" />
						<div class="styLNAmountBox" style="border-bottom:0px;width:32mm;height:4.4mm;" />
					</div>
					<!-- END LINE 29 -->          
					<!-- BEGIN LINE 30 -->                       
					<div class="styGenericDiv" style="width:187mm;float:none;clear:both;">
						<div class="styLNLeftNumBox">30</div>
						<div class="styLNDesc" style="width:138.75mm;">
							<span style="float:left;">Subtract line 29 from line 28. If zero or less, enter -0-. This amount is taxed at 0%</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:left;padding-left:1.5mm;padding-right:1mm;">......</span>
							<img src="{$ImagePath}/1040SchD_Bullet.gif" alt="Right arrow" border="0"/>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom-width:1px;">30</div>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DiffOfSmallerAmt"/>
							</xsl:call-template>
						</div>   
					</div>
					<!-- END LINE 30 -->
					<!-- BEGIN LINE 31 -->
					<div class="styGenericDiv" style="width:187mm;float:none;clear:both;">
						<div class="styLNLeftNumBox">31</div>
						<div class="styLNDesc" style="width:98.8mm;">
							<span style="float:left;">Enter the <b>smaller </b>of line 21 or line 26</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>						
						</div>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom-width:1px;">31</div>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SmallerTaxableIncomeOrNetAmt"/>
							</xsl:call-template>
						</div> 
						<div class="styLNRightNumBox" style="width:8mm;height:4.4mm;background-color:lightgrey;border-bottom-width:0px;" />
						<div class="styLNAmountBox" style="border-bottom:0px;width:32mm;height:4.4mm;" />  
					</div>
					<!-- END LINE 31 -->
					<!-- BEGIN LINE 32 -->                       
					<div class="styGenericDiv" style="width:187mm;float:none;clear:both;">
						<div class="styLNLeftNumBox" style="height:4.4mm;">32</div>
						<div class="styLNDesc" style="width:98.8mm;height:4.4mm;">
							<span style="float:left;">Subtract line 30 from line 26</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>					
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;border-bottom-width:1px;">32</div>
						<div class="styLNAmountBox" style="height:4.4mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetIncomeMinusSmallerAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="width:8mm;height:4.4mm;background-color:lightgrey;border-bottom-width:0px;" />
						<div class="styLNAmountBox" style="border-bottom:0px;width:32mm;height:4.4mm;" />   
					</div>
					<!-- END LINE 32 -->
					<!-- BEGIN LINE 33 -->                       
					<div class="styGenericDiv" style="width:187mm;float:none;clear:both;">
						<div class="styLNLeftNumBox" style="height:4.4mm;">33</div>
						<div class="styLNDesc" style="width:98.8mm; height:4.4mm;">
							<span style="float:left;">Enter the <b>smaller</b> of line 21 or $12,400</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>						
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;border-bottom-width:1px;">33</div>
						<div class="styLNAmountBox" style="height:4.4mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SmllrTxblIncmOrOthAllowedAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="width:8mm;height:4.4mm;background-color:lightgrey;border-bottom-width:0px;" />
						<div class="styLNAmountBox" style="border-bottom:0px;width:32mm;height:4.4mm;" />   
					</div>
					<!-- END LINE 33 -->
					<!-- BEGIN LINE 34 -->                       
					<div class="styGenericDiv" style="width:187mm;float:none;clear:both;">
						<div class="styLNLeftNumBox" style="height:4.4mm;">34</div>
						<div class="styLNDesc" style="width:98.8mm; height:4.4mm;">
							<span style="float:left;">Add lines 27 and 30</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>							
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;border-bottom-width:1px;">34</div>
						<div class="styLNAmountBox" style="height:4.4mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TxiLessGainPlusDiffOfSmllAmt"/>
							</xsl:call-template>
						</div> 
						<div class="styLNRightNumBox" style="width:8mm;height:4.4mm;background-color:lightgrey;border-bottom-width:0px;" />
						<div class="styLNAmountBox" style="border-bottom:0px;width:32mm;height:4.4mm;" />  
					</div>
					<!-- END LINE 34 -->
					<!-- BEGIN LINE 35 -->                       
					<div class="styGenericDiv" style="width:187mm;float:none;clear:both;">
						<div class="styLNLeftNumBox" style="height:4.4mm;">35</div>
						<div class="styLNDesc" style="width:98.8mm;height:4.4mm;">
							<span style="float:left;">Subtract line 34 from line 33. If zero or less, enter -0-</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>							
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;border-bottom-width:1px;">35</div>
						<div class="styLNAmountBox" style="height:4.4mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SmllrTxiOrAllwLessSmllrAmt"/>
							</xsl:call-template>
						</div>   
						<div class="styLNRightNumBox" style="width:8mm;height:4.4mm;background-color:lightgrey;border-bottom-width:0px;" />
						<div class="styLNAmountBox" style="border-bottom:0px;width:32mm;height:4.4mm;" />
					</div>
					<!-- END LINE 35 -->
					<!-- BEGIN LINE 36 -->                       
					<div class="styGenericDiv" style="width:187mm;float:none;clear:both;">
						<div class="styLNLeftNumBox" style="height:4.4mm;">36</div>
						<div class="styLNDesc" style="width:98.8mm;height:4.4mm;">
							<span style="float:left;">Enter the <b>smaller</b> of line 32 or line 35</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>				
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;border-bottom-width:1px;">36</div>
						<div class="styLNAmountBox" style="height:4.4mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SmallerOfCalcAmt"/>
							</xsl:call-template>
						</div>   
						<div class="styLNRightNumBox" style="width:8mm;height:4.4mm;background-color:lightgrey;border-bottom-width:0px;" />
						<div class="styLNAmountBox" style="border-bottom:0px;width:32mm;height:4.4mm;" />
					</div>
					<!-- END LINE 36 -->
					<!-- BEGIN LINE 37 -->                       
					<div class="styGenericDiv" style="width:187mm;float:none;clear:both;">
						<div class="styLNLeftNumBox">37</div>
						<div class="styLNDesc" style="width:138.75mm;">
							<span style="float:left;">Multiply line 36 by 15% (0.15)</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:left;padding-left:1.5mm;padding-right:1mm;">.......................</span>
							<img src="{$ImagePath}/1040SchD_Bullet.gif" alt="Right arrow" border="0"/>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom-width:1px;">37</div>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SmallerTimesPercentAmt"/>
							</xsl:call-template>
						</div>   
					</div>
					<!-- END LINE 37 -->
					<!-- BEGIN LINE 38 -->                       
					<div class="styGenericDiv" style="width:187mm;float:none;clear:both;">
						<div class="styLNLeftNumBox" style="height:4.4mm;">38</div>
						<div class="styLNDesc" style="width:98.8mm; height:4.4mm;">
							<span style="float:left;">Enter the amount from line 31</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>						
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;border-bottom-width:1px;">38</div>
						<div class="styLNAmountBox" style="height:4.4mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SmallerTaxableIncomeOrNetAmt"/>
							</xsl:call-template>
						</div>  
						<div class="styLNRightNumBox" style="width:8mm;height:4.4mm;background-color:lightgrey;border-bottom-width:0px;" />
						<div class="styLNAmountBox" style="border-bottom:0px;width:32mm;height:4.4mm;" /> 
					</div>
					<!-- END LINE 38 -->
					<!-- BEGIN LINE 39 -->                       
					<div class="styGenericDiv" style="width:187mm;float:none;clear:both;">
						<div class="styLNLeftNumBox" style="height:4.4mm;">39</div>
						<div class="styLNDesc" style="width:98.8mm;height:4.4mm;">
							<span style="float:left;">Add lines 30 and 36</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>					
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;border-bottom-width:1px;">39</div>
						<div class="styLNAmountBox" style="height:4.4mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DiffOfSmllrPlusSmllrOfCalcAmt"/>
							</xsl:call-template>
						</div> 
						<div class="styLNRightNumBox" style="width:8mm;height:4.4mm;background-color:lightgrey;border-bottom-width:0px;" />
						<div class="styLNAmountBox" style="border-bottom:0px;width:32mm;height:4.4mm;" />  
					</div>
					<!-- END LINE 39 -->
					<!-- BEGIN LINE 40 -->                       
					<div class="styGenericDiv" style="width:187mm;float:none;clear:both;">
						<div class="styLNLeftNumBox" style="height:4.4mm;">40</div>
						<div class="styLNDesc" style="width:98.8mm;height:4.4mm;">
							<span style="float:left;">Subtract line 39 from line 38. If zero or less, enter -0-</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>						
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;border-bottom-width:1px;">40</div>
						<div class="styLNAmountBox" style="height:4.4mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetSmallerAmt"/>
							</xsl:call-template>
						</div>   
						<div class="styLNRightNumBox" style="width:8mm;height:4.4mm;background-color:lightgrey;border-bottom-width:0px;" />
						<div class="styLNAmountBox" style="border-bottom:0px;width:32mm;height:4.4mm;" />
					</div>
					<!-- END LINE 40 -->
					<!-- BEGIN LINE 41 -->                       
					<div class="styGenericDiv" style="width:187mm;float:none;clear:both;">
						<div class="styLNLeftNumBox">41</div>
						<div class="styLNDesc" style="width:138.75mm;">
							<span style="float:left;">Multiply line 40 by 20% (0.20)</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:left;padding-left:1.5mm;padding-right:1mm;">.......................</span>
							<img src="{$ImagePath}/1040SchD_Bullet.gif" alt="Right arrow" border="0"/>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom-width:1px;">41</div>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetTimesPercentAmt"/>
							</xsl:call-template>
						</div>   
					</div>
					<!-- END LINE 41 -->
					<!-- BEGIN LINE 42 -->                       
					<div class="styGenericDiv" style="width:187mm;float:none;clear:both;">
						<div class="styLNLeftNumBox">42</div>
						<div class="styLNDesc" style="width:98.8mm;">Figure the tax on the amount on line 27. Use the 2016 Tax Rate Schedule<br />
							for Estates and Trusts (see the Schedule G instructions in the instructions<br />
							<span style="float:left;">for Form 1041)</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>		
						</div>
						<div class="styLNRightNumBox" style="height:11mm;border-bottom-width:1px;"><br /><br />42</div>
						<div class="styLNAmountBox" style="height:11mm;border-bottom-width:1px;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetGainsTaxAmt"/>
							</xsl:call-template>
						</div>  
						<div class="styLNRightNumBox" style="width:8mm;height:11mm;background-color:lightgrey;border-bottom-width:0px;" />
						<div class="styLNAmountBox" style="border-bottom:0px;width:32mm;height:11mm;" /> 
					</div>
					<!-- END LINE 42 -->
					<!-- BEGIN LINE 43 -->                       
					<div class="styGenericDiv" style="width:187mm;float:none;clear:both;">
						<div class="styLNLeftNumBox" style="height:4.4mm;">43</div>
						<div class="styLNDesc" style="width:98.8mm; height:4.4mm;">
							<span style="float:left;">Add lines 37, 41, and 42</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">................</span>				
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;border-bottom-width:1px;">43</div>
						<div class="styLNAmountBox" style="height:4.4mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxPlusTimePercentAmt"/>
							</xsl:call-template>
						</div>   
						<div class="styLNRightNumBox" style="width:8mm;height:4.4mm;background-color:lightgrey;border-bottom-width:0px;" />
						<div class="styLNAmountBox" style="border-bottom:0px;width:32mm;height:4.4mm;" />
					</div>
					<!-- END LINE 43 -->
					<!-- BEGIN LINE 44 -->                       
					<div class="styGenericDiv" style="width:187mm;float:none;clear:both;">
						<div class="styLNLeftNumBox" style="height:10mm;">44</div>
						<div class="styLNDesc" style="width:98.8mm;height:10mm;">Figure the tax on the amount on line 21. Use the 2016 Tax Rate Schedule<br/>
							for Estates and Trusts (see the Schedule G instructions in the instructions<br/>
							<span style="float:left;">for Form 1041)</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
						</div>
						<div class="styLNRightNumBox" style="height:10mm;border-bottom-width:1px;"><br /><br />44</div>
						<div class="styLNAmountBox" style="height:10mm;border-bottom-width:1px;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxOnTaxableIncomeAmt"/>
							</xsl:call-template>
						</div>   
						<div class="styLNRightNumBox" style="width:8mm;height:10mm;background-color:lightgrey;border-bottom-width:0px;" />
						<div class="styLNAmountBox" style="border-bottom:0px;width:32mm;height:10mm;" />
					</div>
					<!-- END LINE 44 -->          
					<!-- BEGIN LINE 45 -->                       
					<div class="styGenericDiv" style="width:187mm;float:none;clear:both;">
						<div class="styLNLeftNumBox" style="height:7mm;">45</div>
						<div class="styLNDesc" style="width:138.75mm; height:7mm;">
							<span style="float:left;"><b>Tax on all taxable income.</b> Enter the <b>smaller</b> of line 43 or line 44 here and on Form 1041, Schedule G,</span><br />
							<span style="float:left;"> line 1a (or Form 990-T, line 36)</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:left;padding-left:1.5mm;padding-right:1mm;">......................</span>
							<img src="{$ImagePath}/1040SchD_Bullet.gif" alt="Right arrow" border="0"/>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;border-bottom-width:0px;"><br />45</div>
						<div class="styLNAmountBox" style="height:7mm;border-bottom-width:0px;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 45 -->
				</div>
				<div class="styBB" style="width:187mm;border-top-width: 2px;border-bottom-width:0px;">
					<span style="font-weight:bold;float:right" class="styGenericDiv">Schedule D (Form 1041) 2016</span>
				</div>
				<div class="pageEnd"></div>
            </div>
            <p style="page-break-before: always"/>
			<div class="styLeftOverTitleLine" id="LeftoverData">
				<div class="styLeftOverTitle">Additional Data </div>
				<div class="styLeftOverButtonContainer" style="float:right;">
					<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
				</div>
			</div>
			<table class="styLeftOverTbl">
				<xsl:call-template name="PopulateCommonLeftover">
					<xsl:with-param name="TargetNode" select="$FormData"/>
					<xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>          
			</table>
			</form>
		</body>
    </html>
  </xsl:template>
</xsl:stylesheet>
