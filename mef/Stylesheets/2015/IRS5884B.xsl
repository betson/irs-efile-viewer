<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by James Ganzy on 12/22/2011 --><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS5884BStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form5884BData" select="$RtnDoc/IRS5884B"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form5884BData)"/>
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
				<meta name="Description" content="IRS Form 5884B"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<!-- Form 5884B CSS Styles are located in the template called below -->
						<xsl:call-template name="IRS5884BStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form5884B">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Begin Form Number and Name -->
					<div class="styBB" style="width:187mm;padding-bottom:0mm;">
						<div class="styFNBox" style="height:18mm;width:32mm;padding-top:0mm;">
							<div style="height:7mm;font-size:7.5pt;">
								Form<span class="styFormNumber" style="padding-left:1mm;font-size:16pt;"> 5884-B</span>
							</div>
							<span class="styAgency" style="font-size:7.5pt;padding-bottom:2mm;">(December 2010)</span>
							<div class="styAgency" style="font-size:7.5pt;vertical-align:text-bottom;">Department of the Treasury<br/>Internal Revenue Service
							</div>
						</div>
						<div class="styFTBox" style="width:117mm;border-right:1px solid black;border-left:0px solid black;">
							<div class="styMainTitle" style="height:8mm;">New Hire Retention Credit</div>
							<div class="styFST" style="height:5mm;padding-top:.5mm;font-size:7.5pt;">
								<img src="{$ImagePath}/5884B_Bullet.gif" alt="Bullet Image"/>
								Attach to your tax return.
						   </div>
							<div class="styFST" style="height:5mm;padding-top:.5mm;font-size:7.5pt;">
								<img src="{$ImagePath}/5884B_Bullet.gif" alt="Bullet Image"/>
								Use Part II to list additional retained workers.
						   </div>
						</div>
						<div class="styTYBox" style="width:37.5mm;padding-bottom:0mm;border-left:none;">
							<div class="styOMB" style="height:8mm;">
								<div style="margin-top:6px;">OMB No. 1545-2202</div>
							</div>
							<div style="height:2mm;padding-top:3mm;margin-left:3mm;text-align:left;font-size:7pt;">
								Attachment<br/>Sequence No. <span class="styBoldText" style="font-size:9pt;">65</span>
							</div>
						</div>
					</div>
					<!-- End Form Number and Name section -->
					<!-- Begin Names and Identifying number section -->
					<div style="width:187mm;">
						<div class="styNameBox" style="width:140mm;height:8mm;font-size:7pt;">
							Name(s) shown on return<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:35mm;height:4mm;padding-left:2mm;font-size:7pt;font-weight:normal;">
							<b>Identifying number</b>
							<br/>
							<span style="width:34mm; text-align:left;font-weight:normal;">
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- End Names and Identifying number section -->
					<div class="" style="width:187mm;border-style:solid;border-color:black;border-width:1px 0px 1px 0px;">
						<div class="styLNDesc" style="width:187mm;padding-bottom:0mm;">
							A credit of up to $1,000 is allowed for each retained worker. A retained worker generally is a qualified employee (see instructions)<br/>
							whose first 52 consecutive weeks of employment ended in the current tax year. However, the worker's wages (as defined for income<br/>
							tax withholding purposes) for the second 26 consecutive weeks must equal at least 80% of the worker's wages for the first 26<br/> 
							consecutive weeks.
						</div>
					</div>
					<!-- BEGIN PART I TITLE -->
					<div class="" style="width:187mm;">
						<div class="styPartName" style="font-size:9pt;">Part I</div>
						<div class="styPartDesc" style="font-size:9pt;padding-left:3mm;float:left;clear:none;">
								  New Hire Retention Credit for Retained Workers
						</div>
					</div>
					<!-- END PART I TITLE -->
					<!-- Start Section A Employee Retention Credit -->
					<div class="styBB" style="width:187mm;font-size:7.5pt;">
						<xsl:if test="(count($Form5884BData/NewHireRtntnCrForRtnWorkerGrp) &gt;= 1)">
							<xsl:variable name="pos" select="position()"/>
							<xsl:if test="position() &lt;= 3">
								<div class="styIRS5884BTableContainer" id="Spcctn">
									<xsl:call-template name="SetInitialState"/>
									<th style="width:187mm;">
										<div class="styLNDesc" style="height:20mm;width:90mm;padding-top:5mm;text-align:left;padding-left:7mm;border-style:solid;border-color:black;border-width:1px 1px 0px 0px;">
													Use a separate column for each retained worker.<br/> 
													If you need more columns, use Part II and include <br/>
													the totals on line 10.
											</div>
										<!-- END SECTION A TITLE -->
										<!-- BEGIN Worker 1 Title  -->
										<div class="styPartDesc" style="height:20mm;width:32mm;padding-left:0mm;            padding-top:3mm;text-align:center;border-style:solid;border-color:black;border-width:1px 1px 0px 0px;">(a) <span style="font-weight:normal;">
												<br/>
												Retained<br/>Worker <br/>No. <xsl:number value="($pos)" format="1"/>
											</span>
										</div>
										<!-- END Worker 1 Title -->
										<!-- BEGIN Worker 2 Title -->
										<div class="styPartDesc" style="height:20mm;width:32mm;padding-left:0mm;            padding-top:3mm;text-align:center;border-style:solid;border-color:black;border-width:1px 1px 0px 0px;">(b) <span style="font-weight:normal;">
												<br/>
												Retained<br/>Worker <br/>No. <xsl:number value="($pos + 1)" format="1"/>
											</span>
										</div>
										<!-- END Worker 2 Title -->
										<!-- BEGIN Worker 3 Title -->
										<div class="styPartDesc" style="height:20mm;width:32.5mm;padding-left:0mm;            padding-top:3mm;text-align:center;border-style:solid;border-color:black;border-width:1px 0px 0px 0px;">(c) <span style="font-weight:normal;">
												<br/>
												Retained<br/>Worker <br/>No. <xsl:number value="($pos + 2)" format="1"/>
											</span>
										</div>
										<!-- END Worker 3 Title -->
									</th>
								</div>
								<!--Line 1 Retained Workers SSN Begin-->
								<div style="width:187mm;font-size:7.5pt;border-style:solid;border-color:black;border-width:1px 0px 0px 0px;">
									<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">1</div>
									<div class="styLNDesc" style="width:74.8mm;padding-bottom:0mm;">
											Enter the retained worker's social security number
		          <!--Dotted Line-->
										<!--<span class="styDotLn" style="float:none;clear:none;padding-left:0mm;">.</span>-->
									</div>
									<div class="styLNRightNumBox" style="font-size:8pt;">1</div>
									<div class="styLNAmountBox" style="height:4.8mm;padding-right:1mm;padding-top:.8mm;">
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos]/SSN"/>
										</xsl:call-template>
									</div>
									<div class="styLNAmountBox" style="height:4.8mm;padding-right:1mm;padding-top:.8mm;">
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 1]/SSN"/>
										</xsl:call-template>
									</div>
									<div class="styLNAmountBox" style="height:4.8mm;width:33mm;padding-right:1mm;padding-top:.8mm;">
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 2]/SSN"/>
										</xsl:call-template>
									</div>
								</div>
								<!--Line 1 Retained Workers SSN End-->
								<!--Line 2 First Date of Employment Begin -->
								<div style="width:187mm;font-size:7.5pt;">
									<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">2</div>
									<div class="styLNDesc" style="width:74.8mm;padding-bottom:0mm;">
											Enter the first date of employment from the<br/>
											retained worker's Form W-11 or similar statement
		          <!--Dotted Line-->
									</div>
									<div class="styLNRightNumBox" style="height:8mm;font-size:8pt;padding-top:3.5mm;">2</div>
									<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3.5mm;padding-right:1mm;">
										<xsl:call-template name="PopulateMonth">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos]/RtnWorkerFirstEmplmnDt"/>
										</xsl:call-template>/
										<xsl:call-template name="PopulateDay">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos]/RtnWorkerFirstEmplmnDt"/>
										</xsl:call-template>/
										<xsl:call-template name="PopulateYear">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos]/RtnWorkerFirstEmplmnDt"/>
										</xsl:call-template>
									</div>
									<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3.5mm;padding-right:1mm;">
										<xsl:call-template name="PopulateMonth">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 1]/RtnWorkerFirstEmplmnDt"/>
										</xsl:call-template>/
										<xsl:call-template name="PopulateDay">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 1]/RtnWorkerFirstEmplmnDt"/>
										</xsl:call-template>/
										<xsl:call-template name="PopulateYear">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 1]/RtnWorkerFirstEmplmnDt"/>
										</xsl:call-template>
									</div>
									<div class="styLNAmountBox" style="height:8mm;width:33mm;padding-top:3.5mm;padding-right:1mm;">
										<xsl:call-template name="PopulateMonth">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 2]/RtnWorkerFirstEmplmnDt"/>
										</xsl:call-template>/
										<xsl:call-template name="PopulateDay">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 2]/RtnWorkerFirstEmplmnDt"/>
										</xsl:call-template>/
										<xsl:call-template name="PopulateYear">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 2]/RtnWorkerFirstEmplmnDt"/>
										</xsl:call-template>
									</div>
								</div>
								<!--Line 2 First Date of Employment End-->
								<!--Line 3 Wages for first 26 consecutive weeks Begin-->
								<div style="width:187mm;font-size:7.5pt;">
									<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">3</div>
									<div class="styLNDesc" style="width:74.8mm;padding-bottom:0mm;">
											Enter the retained worker's wages for the first 26
											consecutive weeks of employment
		          <!--Dotted Line-->
										<span class="styDotLn" style="float:none;clear:none;padding-left:0mm;">......</span>
									</div>
									<div class="styLNRightNumBox" style="height:8mm;font-size:8pt;padding-top:3.5mm;">3</div>
									<div class="styLNAmountBox" style="height:8mm;padding-top:3.5mm;padding-right:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos]/RtnWorkerWgsFirst26WkEmplmnAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNAmountBox" style="height:8mm;padding-top:3.5mm;padding-right:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 1]/RtnWorkerWgsFirst26WkEmplmnAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNAmountBox" style="height:8mm;width:33mm;padding-right:1mm;padding-top:3.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 2]/RtnWorkerWgsFirst26WkEmplmnAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!--Line 3 Wages for first 26 consecutive weeks End-->
								<!--Line 4 Eighty percent of wages for first 26 weeks Begin-->
								<div style="width:187mm;font-size:7.5pt;">
									<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">4</div>
									<div class="styLNDesc" style="width:74.8mm;">
										<span style="float:left;clear:none;">
											Multiply line 3 by 80% (.80)
										</span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........</span>
									</div>
									<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">4</div>
									<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos]/RtnWorkerWgsTimesPctAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 1]/RtnWorkerWgsTimesPctAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 2]/RtnWorkerWgsTimesPctAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!--Line 4 Eighty percent of wages for first 26 weeks End-->
								<!--Line 5 Wages for second 26 consecutive weeks Begin-->
								<div style="width:187mm;font-size:7.5pt;">
									<div class="styLNLeftNumBoxSD" style="width:7mm;height:4mm;font-size:8pt;">5</div>
									<div class="styLNDesc" style="width:74.8mm;padding-top:0mm;">
											Enter the retained worker's wages for the second<br/>
											26 consecutive weeks of employment. If line 4 is<br/>
											larger than this amount, the qualified employee is<br/>
											not a retained worker and should not be listed on<br/>
											this form
											
		          <!--Dotted Line-->
										<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">..............</span>
									</div>
									<div class="styLNRightNumBox" style="height:16.8mm;padding-top:12mm;background-color:lightgrey;font-size:8pt;">
										<span style="height:4mm;background-color:white;width:7.80mm;">5</span>
									</div>
									<div class="styLNAmountBox" style="height:16.8mm;padding-top:12.5mm;padding-right:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos]/RtnWorkerWgsSnd26WkEmplmnAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNAmountBox" style="height:16.8mm;padding-top:12.5mm;padding-right:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 1]/RtnWorkerWgsSnd26WkEmplmnAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNAmountBox" style="height:16.8mm;width:33mm;padding-top:12.5mm;padding-right:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 2]/RtnWorkerWgsSnd26WkEmplmnAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!--Line 5 Wages for second 26 consecutive weeks End-->
								<!--Line 6 Add lines 3 and 5 Begin-->
								<div style="width:187mm;font-size:7.5pt;padding-bottom:0mm;">
									<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">6</div>
									<div class="styLNDesc" style="width:74.8mm;">
										<span style="float:left;clear:none;">
											Add lines 3 and 5
										</span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...........</span>
									</div>
									<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">6</div>
									<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos]/RtnWorkerTotalWagesAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 1]/RtnWorkerTotalWagesAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 2]/RtnWorkerTotalWagesAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!--Line 6 Add lines 3 and 5 End-->
								<!--Line 7 Multiply line 6 by 6.2% Begin-->
								<div style="width:187mm;font-size:7.5pt;padding-bottom:0mm;">
									<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">7</div>
									<div class="styLNDesc" style="width:74.8mm;">
										<span style="float:left;clear:none;">
											Multiply line 6 by 6.2% (.062)
										</span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.......</span>
									</div>
									<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">7</div>
									<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos]/RtnWorkerTotalWgsTimesPctAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 1]/RtnWorkerTotalWgsTimesPctAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 2]/RtnWorkerTotalWgsTimesPctAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!--Line 7 Multiply line 6 by 6.2% End-->
								<!--Line 8 No entry available Begin-->
								<div style="width:187mm;font-size:7.5pt;padding-bottom:0mm;">
									<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">8</div>
									<div class="styLNDesc" style="width:74.8mm;">
										<span style="float:left;clear:none;">
											Maximum credit allowable
										</span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........</span>
									</div>
									<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">8</div>
									<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">1,000</div>
									<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">1,000</div>
									<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;">1,000</div>
								</div>
								<!--Line 8 No entry available End-->
								<!--Line 9 Enter the smaller of lines 7 and 8 Begin-->
								<div style="width:187mm;font-size:7.5pt;padding-bottom:0mm;">
									<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">9</div>
									<div class="styLNDesc" style="width:74.8mm;">
										<span style="float:left;clear:none;">
											Enter the <b>smaller</b> of line 7 or line 8
										</span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.....</span>
									</div>
									<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">9</div>
									<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos]/RtnWorkerSmllrTotalOrMaxCrAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 1]/RtnWorkerSmllrTotalOrMaxCrAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 2]/RtnWorkerSmllrTotalOrMaxCrAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!--Line 9 Enter the smaller of lines 7 and 8 End-->
							</xsl:if>
						</xsl:if>
						<!--Start Printing Blank Section for Vehicle Expenses Group-->
						<xsl:if test="(count($Form5884BData/NewHireRtntnCrForRtnWorkerGrp) &lt; 1)">
							<xsl:variable name="pos" select="position()"/>
							<div class="styNBB" style="width:187mm;">
								<th style="width:187mm;">
									<div class="styLNDesc" style="height:20mm;width:90mm;padding-top:5mm;text-align:left;padding-left:7mm;border-style:solid;border-color:black;border-width:1px 1px 0px 0px;">
													Use a separate column for each retained worker.<br/> 
													If you need more columns, use Part II and include <br/>
													the totals on line 10.
											</div>
									<!-- END SECTION A TITLE -->
									<!-- BEGIN Worker 1 Title  -->
									<div class="styPartDesc" style="height:20mm;width:32mm;padding-left:0mm;            padding-top:3mm;text-align:center;border-style:solid;border-color:black;border-width:1px 1px 0px 0px;">(a) <span style="font-weight:normal;">
											<br/>
												Retained<br/>Worker <br/>No. <xsl:number value="($pos)" format="1"/>
										</span>
									</div>
									<!-- END Worker 1 Title -->
									<!-- BEGIN Worker 2 Title -->
									<div class="styPartDesc" style="height:20mm;width:32mm;padding-left:0mm;            padding-top:3mm;text-align:center;border-style:solid;border-color:black;border-width:1px 1px 0px 0px;">(b) <span style="font-weight:normal;">
											<br/>
												Retained<br/>Worker <br/>No. <xsl:number value="($pos + 1)" format="1"/>
										</span>
									</div>
									<!-- END Worker 2 Title -->
									<!-- BEGIN Worker 3 Title -->
									<div class="styPartDesc" style="height:20mm;width:32.5mm;padding-left:0mm;            padding-top:3mm;text-align:center;border-style:solid;border-color:black;border-width:1px 0px 0px 0px;">(c) <span style="font-weight:normal;">
											<br/>
												Retained<br/>Worker <br/>No. <xsl:number value="($pos + 2)" format="1"/>
										</span>
									</div>
									<!-- END Worker 3 Title -->
								</th>
							</div>
							<!--Line 1 Retained Workers SSN Begin-->
							<div style="width:187mm;font-size:7.5pt;border-style:solid;border-color:black;border-width:1px 0px 0px 0px;">
								<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">1</div>
								<div class="styLNDesc" style="width:74.8mm;padding-bottom:0mm;">
											Enter the retained worker's social security number
		          <!--Dotted Line-->
									<!--<span class="styDotLn" style="float:none;clear:none;padding-left:0mm;">.</span>-->
								</div>
								<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;padding-top:.8mm;">1</div>
								<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
								<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
								<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;"/>
							</div>
							<!--Line 1 Retained Workers SSN End-->
							<!--Line 2 First Date of Employment Begin -->
							<div style="width:187mm;font-size:7.5pt;">
								<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">2</div>
								<div class="styLNDesc" style="width:74.8mm;padding-bottom:0mm;">
											Enter the first date of employment from the<br/>
											retained worker's Form W-11 or similar statement
		          <!--Dotted Line-->
								</div>
								<div class="styLNRightNumBox" style="height:8mm;font-size:8pt;padding-top:3.5mm;">2</div> 
								<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3.5mm;padding-right:1mm;">/ /2010</div>
								<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3.5mm;padding-right:1mm;">/ /2010</div>
								<div class="styLNAmountBox" style="height:8mm;width:33mm;padding-top:3.5mm;padding-right:1mm;">/ /2010</div>
							</div>
							<!--Line 2 First Date of Employment End-->
							<!--Line 3 Wages for first 26 consecutive weeks Begin-->
							<div style="width:187mm;font-size:7.5pt;">
								<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">3</div>
								<div class="styLNDesc" style="width:74.8mm;padding-bottom:0mm;">
											Enter the retained worker's wages for the first 26
											consecutive weeks of employment
		          <!--Dotted Line-->
									<span class="styDotLn" style="float:none;clear:none;padding-left:0mm;">......</span>
								</div>
								<div class="styLNRightNumBox" style="height:8mm;font-size:8pt;padding-top:3.5mm;">3</div>
								<div class="styLNAmountBox" style="height:8mm;padding-top:3.5mm;padding-right:1mm;"/>
								<div class="styLNAmountBox" style="height:8mm;padding-top:3.5mm;padding-right:1mm;"/>
								<div class="styLNAmountBox" style="height:8mm;width:33mm;padding-right:1mm;padding-top:3.5mm;"/>
							</div>
							<!--Line 3 Wages for first 26 consecutive weeks End-->
							<!--Line 4 Eighty percent of wages for first 26 weeks Begin-->
							<div style="width:187mm;font-size:7.5pt;">
								<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">4</div>
								<div class="styLNDesc" style="width:74.8mm;">
									<span style="float:left;clear:none;">
										Multiply line 3 by 80% (.80)
									</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........</span>
								</div>
								<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">4</div>
								<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
								<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
								<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;"/>
							</div>
							<!--Line 4 Eighty percent of wages for first 26 weeks End-->
							<!--Line 5 Wages for second 26 consecutive weeks Begin-->
							<div style="width:187mm;font-size:7.5pt;">
								<div class="styLNLeftNumBoxSD" style="width:7mm;height:4mm;font-size:8pt;">5</div>
								<div class="styLNDesc" style="width:74.8mm;padding-top:0mm;">
											Enter the retained worker's wages for the second<br/>
											26 consecutive weeks of employment. If line 4 is<br/>
											larger than this amount, the qualified employee is<br/>
											not a retained worker and should not be listed on<br/>
											this form
											
		          <!--Dotted Line-->
									<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">..............</span>
								</div>
								<div class="styLNRightNumBox" style="height:16.5mm;padding-top:12mm;background-color:lightgrey;font-size:8pt;">
									<span style="height:4mm;background-color:white;width:7.80mm;">5</span>
								</div>
								<div class="styLNAmountBox" style="height:16.8mm;padding-top:12.5mm;padding-right:1mm;"/>
								<div class="styLNAmountBox" style="height:16.8mm;padding-top:12.5mm;padding-right:1mm;"/>
								<div class="styLNAmountBox" style="height:16.8mm;width:33mm;padding-top:12.5mm;padding-right:1mm;"/>
							</div>
							<!--Line 5 Wages for second 26 consecutive weeks End-->
							<!--Line 6 Add lines 3 and 5 Begin-->
							<div style="width:187mm;font-size:7.5pt;padding-bottom:0mm;">
								<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">6</div>
								<div class="styLNDesc" style="width:74.8mm;">
									<span style="float:left;clear:none;">
										Add lines 3 and 5
									</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...........</span>
								</div>
								<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">6</div>
								<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
								<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
								<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;"/>
							</div>
							<!--Line 6 Add lines 3 and 5 End-->
							<!--Line 7 Multiply line 6 by 6.2% Begin-->
							<div style="width:187mm;font-size:7.5pt;padding-bottom:0mm;">
								<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">7</div>
								<div class="styLNDesc" style="width:74.8mm;">
									<span style="float:left;clear:none;">
										Multiply line 6 by 6.2% (.062)
									</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.......</span>
								</div>
								<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">7</div>
								<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
								<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
								<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;"/>
							</div>
							<!--Line 7 Multiply line 6 by 6.2% End-->
							<!--Line 8 No entry available Begin-->
							<div style="width:187mm;font-size:7.5pt;padding-bottom:0mm;">
								<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">8</div>
								<div class="styLNDesc" style="width:74.8mm;">
									<span style="float:left;clear:none;">
										Maximum credit allowable
									</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........</span>
								</div>
								<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">8</div>
								<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">1,000</div>
								<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">1,000</div>
								<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;">1,000</div>
							</div>
							<!--Line 8 No entry available End-->
							<!--Line 9 Enter the smaller of lines 7 and 8 Begin-->
							<div style="width:187mm;font-size:7.5pt;padding-bottom:0mm;">
								<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">9</div>
								<div class="styLNDesc" style="width:74.8mm;">
									<span style="float:left;clear:none;">
										Enter the <b>smaller</b> of line 7 or line 8
									</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.....</span>
								</div>
								<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">9</div>
								<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
								<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
								<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;"/>
							</div>
							<!--Line 9 Enter the smaller of lines 7 and 8 End-->
						</xsl:if>
						<!--Line 10 Total Credit for All Retained Workers Begin-->
						<div style="width:187mm;font-size:8pt;">
							<div class="styLNLeftNumBox" style="width:7mm;">10</div>
							<div class="styLNDesc" style="width:139mm;">

									Add columns (a) through (c) on line 9 above and columns (a) through (c) on lines 9 of any attached Parts II
			
								<!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;font-size:8pt;padding-top:3.8mm;">10</div>
							<div class="styLNAmountBox" style="height:8mm;width:33mm;padding-right:1mm;padding-top:3.8mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5884BData/RtnWorkerAllTotalCreditAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 10 Total Credit for All Retained Workers End-->
						<!--Line 11 Total Number of Retained Workers Begin-->
						<div style="width:187mm;font-size:8pt;">
							<div class="styLNLeftNumBox" style="width:7mm;">11</div>
							<div class="styLNDesc" style="width:107mm;font-size:7.5pt;">
								Enter the total number of retained workers for whom you are receiving a 
								credit on line 10 (see instructions)
          <!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">.............</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;font-size:8pt;padding-top:3.8mm;">11</div>
							<div class="styLNAmountBox" style="height:8mm;width:24mm;padding-right:1mm;padding-top:3.8mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form5884BData/RtnWorkerTotalCreditCnt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:8.3mm;width:8.3mm;font-size:8pt;background-color:lightgrey;border-style:solid;border-color:black;border-width:0px 1px 0px 1px;"/>
						</div>
						<!--Line 11 Total Number of Retained Workers End-->
						<!--Line 12 Credit from partnerships and S corporations Begin-->
						<div style="width:187mm;font-size:8pt;">
							<div class="styLNLeftNumBox" style="width:7mm;">12</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;clear:none;">
									New hire retention credit from partnerships and S corporations (see instructions)
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">....</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">12</div>
							<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrPrtshpSCorpAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 12 Credit from partnerships and S corporations End-->
						<!--Line 13 Current year credit Begin-->
						<div style="width:187mm;font-size:8pt;">
							<div class="styLNLeftNumBox" style="height:7mm;width:7mm;">13</div>
							<div class="styLNDesc" style="width:139mm;height:7mm;font-size:7.5pt;">
								<b>Current year credit.</b> Add lines 10 and 12. Partnerships and S corporations, report this
									 amount on Schedule K; all others, report this amount on the applicable line of Form
									 3800 (e.g., line 1aa of the 2010 form 3800)
          <!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:0mm;">.......................</span>
							</div>
							<div class="styLNRightNumBox" style="height:9mm;font-size:8pt;padding-top:6mm;border-bottom:none;background-color:lightgrey;">
								<span style="height:4mm;background-color:white;width:7.5mm;">13</span>
							</div>
							<div class="styLNAmountBox" style="height:9mm;width:33mm;padding-top:6.5mm;padding-right:1mm;border-bottom:none;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRetentionCreditAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--Line 13 Current year credit End-->
					<!-- End Section B Employer Housing Credit  -->
					<!--End of form-->
					<div class="pageEnd" style="width:187mm;">
						<div class="styLNDesc" style="width:100mm;padding-top:0mm;">
							<b>For Paperwork Reduction Act Notice, see instructions.</b>
						</div>
						<div class="styLNDesc" style="width:37mm;padding-top:0mm;">
							  Cat. No. 55035V
						</div>
						<div class="styLNDesc" style="width:50mm;padding-top:0mm;text-align:right;">
							<span style="font-size:7pt;padding-right:1mm;">Form</span>
							<span class="styBoldText" style="font-size:8pt;">5884-B</span>
							<span style="font-size:7pt;padding-left:1mm;">(12-2010)</span>
						</div>
					</div>
					<!-- page 2 -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;">
						<span class="" style="width:80mm;float:left;clear:none;">Form 5884-B (12-2010)</span>
						<span class="" style="width:57mm;float:left;clear:none;">Attachment Sequence No. 65</span>
						<span style="float:right;clear:none;">Page <span class="styBoldText" style="font-size:8pt;">2</span>
						</span>
					</div>
					<!-- Begin Names and Identifying number section Page 2-->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:140mm;height:8mm;font-size:7pt;">
								Name(s) shown on return. Do not enter name and identifying number if shown on other side.<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:35mm;height:4mm;padding-left:2mm;font-size:7pt;font-weight:normal;">
							<b>Identifying number</b>
							<br/>
							<span style="width:34mm; text-align:left;font-weight:normal;">
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- End Names and Identifying number section Page 2-->
					<!-- BEGIN PART II TITLE -->
					<div style="width:187mm;">
						<div class="styPartName" style="font-size:9pt;">Part II</div>
						<div class="styPartDesc" style="font-size:9pt;padding-left:3mm;float:left;clear:none;">
								  Continuation Sheet for Additional Retained Workers
						</div>
					</div>
					<!-- END PART II TITLE -->
					<!--Start Printing Blank Section for Vehicle Expenses Group-->
					<xsl:if test="(count($Form5884BData/NewHireRtntnCrForRtnWorkerGrp) &gt;= 1)">
						<xsl:variable name="pos" select="position()"/>
						<xsl:if test="(position() mod 3)=1">
							<div class="styNBB" style="width:187mm;">
								<th style="width:187mm;">
									<div class="styLNDesc" style="height:23mm;width:90mm;padding-bottom:0mm;padding-left:0mm;border-style:solid;border-color:black;border-width:1px 1px 0px 0px;">
													Use a separate column for each retained worker. Keep track of the<br/>
													number of workers listed by entering a number at the top of each<br/>
													column. For example, the first retained worker listed on the first <br/>
													attached Part II would be Retained Worker No. 4. If you need more<br/>
													columns, use additional copies of Part II. Include the totals from <br/>
													columns (a) through (c) of all lines 9 from all copies of Part II on<br/>
													Part I, line 10.
											</div>
									<!-- END SECTION A TITLE -->
									<!-- BEGIN Worker 1 Title  -->
									<div class="styPartDesc" style="height:23mm;width:32mm;padding-left:0mm;            padding-top:3mm;text-align:center;border-style:solid;border-color:black;border-width:1px 1px 0px 0px;">(a) <span style="font-weight:normal;">
											<br/>
												Retained<br/>Worker <br/>No. 
											<xsl:if test="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 3] != ''">
												<xsl:number value="($pos + 3)" format="1"/>
											</xsl:if>
										</span>
									</div>
									<!-- END Worker 1 Title -->
									<!-- BEGIN Worker 2 Title -->
									<div class="styPartDesc" style="height:23mm;width:32mm;padding-left:0mm;            padding-top:3mm;text-align:center;border-style:solid;border-color:black;border-width:1px 1px 0px 0px;">(b) <span style="font-weight:normal;">
											<br/>
												Retained<br/>Worker <br/>No. 
												<xsl:if test="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 4] != ''">
													<xsl:number value="($pos + 4)" format="1"/>
												</xsl:if>
										</span>
									</div>
									<!-- END Worker 2 Title -->
									<!-- BEGIN Worker 3 Title -->
									<div class="styPartDesc" style="height:23mm;width:32.5mm;padding-left:0mm;            padding-top:3mm;text-align:center;border-style:solid;border-color:black;border-width:1px 0px 0px 0px;">(c) <span style="font-weight:normal;">
											<br/>
												Retained<br/>Worker <br/>No. 
												<xsl:if test="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 5] != ''">
													<xsl:number value="($pos + 5)" format="1"/>
												</xsl:if>
										</span>
									</div>
									<!-- END Worker 3 Title -->
								</th>
							</div>
							<!--Line 1 Retained Workers SSN Begin-->
							<div style="width:187mm;font-size:7.5pt;border-style:solid;border-color:black;border-width:1px 0px 0px 0px;">
								<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">1</div>
								<div class="styLNDesc" style="width:74.8mm;padding-bottom:0mm;">
											Enter the retained worker's social security number
		          <!--Dotted Line-->
									<!--<span class="styDotLn" style="float:none;clear:none;padding-left:0mm;">.</span>-->
								</div>
								<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">1</div>
								<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 3]/SSN"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 4]/SSN"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 5]/SSN"/>
									</xsl:call-template>
								</div>
							</div>
							<!--Line 1 Retained Workers SSN End-->
							<!--Line 2 First Date of Employment Begin -->
							<div style="width:187mm;font-size:7.5pt;">
								<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">2</div>
								<div class="styLNDesc" style="width:74.8mm;padding-bottom:0mm;">
											Enter the first date of employment from the<br/>
											retained worker's Form W-11 or similar statement
		          <!--Dotted Line-->
								</div>
								<div class="styLNRightNumBox" style="height:8mm;font-size:8pt;padding-top:3.5mm;">2</div>
								<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3.5mm;padding-right:1mm;">
										<xsl:call-template name="PopulateMonth">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 3]/RtnWorkerFirstEmplmnDt"/>
										</xsl:call-template>/
										<xsl:call-template name="PopulateDay">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 3]/RtnWorkerFirstEmplmnDt"/>
										</xsl:call-template>/
										<xsl:call-template name="PopulateYear">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 3]/RtnWorkerFirstEmplmnDt"/>
										</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3.5mm;padding-right:1mm;">
										<xsl:call-template name="PopulateMonth">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 4]/RtnWorkerFirstEmplmnDt"/>
										</xsl:call-template>/
										<xsl:call-template name="PopulateDay">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 4]/RtnWorkerFirstEmplmnDt"/>
										</xsl:call-template>/
										<xsl:call-template name="PopulateYear">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 4]/RtnWorkerFirstEmplmnDt"/>
										</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:8mm;width:33mm;padding-top:3.5mm;padding-right:1mm;">
										<xsl:call-template name="PopulateMonth">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 5]/RtnWorkerFirstEmplmnDt"/>
										</xsl:call-template>/
										<xsl:call-template name="PopulateDay">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 5]/RtnWorkerFirstEmplmnDt"/>
										</xsl:call-template>/
										<xsl:call-template name="PopulateYear">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 5]/RtnWorkerFirstEmplmnDt"/>
										</xsl:call-template>
								</div>
							</div>
							<!--Line 2 First Date of Employment End-->
							<!--Line 3 Wages for first 26 consecutive weeks Begin-->
							<div style="width:187mm;font-size:7.5pt;">
								<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">3</div>
								<div class="styLNDesc" style="width:74.8mm;padding-bottom:0mm;">
											Enter the retained worker's wages for the first 26
											consecutive weeks of employment
		          <!--Dotted Line-->
									<span class="styDotLn" style="float:none;clear:none;padding-left:0mm;">......</span>
								</div>
								<div class="styLNRightNumBox" style="height:8mm;font-size:8pt;padding-top:3.5mm;">3</div>
								<div class="styLNAmountBox" style="height:8mm;padding-top:3.5mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 3]/RtnWorkerWgsFirst26WkEmplmnAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:8mm;padding-top:3.5mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 4]/RtnWorkerWgsFirst26WkEmplmnAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:8mm;width:33mm;padding-right:1mm;padding-top:3.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 5]/RtnWorkerWgsFirst26WkEmplmnAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--Line 3 Wages for first 26 consecutive weeks End-->
							<!--Line 4 Eighty percent of wages for first 26 weeks Begin-->
							<div style="width:187mm;font-size:7.5pt;">
								<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">4</div>
								<div class="styLNDesc" style="width:74.8mm;">
									<span style="float:left;clear:none;">
										Multiply line 3 by 80% (.80)
									</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........</span>
								</div>
								<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">4</div>
								<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 3]/RtnWorkerWgsTimesPctAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 4]/RtnWorkerWgsTimesPctAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 5]/RtnWorkerWgsTimesPctAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--Line 4 Eighty percent of wages for first 26 weeks End-->
							<!--Line 5 Wages for second 26 consecutive weeks Begin-->
							<div style="width:187mm;font-size:7.5pt;">
								<div class="styLNLeftNumBoxSD" style="width:7mm;height:4mm;font-size:8pt;">5</div>
								<div class="styLNDesc" style="width:74.8mm;padding-top:0mm;">
											Enter the retained worker's wages for the second<br/>
											26 consecutive weeks of employment. If line 4 is<br/>
											larger than this amount, the qualified employee is<br/>
											not a retained worker and should not be listed on<br/>
											this form
											
		          <!--Dotted Line-->
									<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">..............</span>
								</div>
								<div class="styLNRightNumBox" style="height:16.5mm;padding-top:12mm;background-color:lightgrey;font-size:8pt;">
									<span style="height:4mm;background-color:white;width:7.80mm;">5</span>
								</div>
								<div class="styLNAmountBox" style="height:16.8mm;padding-top:12.5mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 3]/RtnWorkerWgsSnd26WkEmplmnAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:16.8mm;padding-top:12.5mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 4]/RtnWorkerWgsSnd26WkEmplmnAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:16.8mm;width:33mm;padding-top:12.5mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 5]/RtnWorkerWgsSnd26WkEmplmnAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--Line 5 Wages for second 26 consecutive weeks End-->
							<!--Line 6 Add lines 3 and 5 Begin-->
							<div style="width:187mm;font-size:7.5pt;padding-bottom:0mm;">
								<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">6</div>
								<div class="styLNDesc" style="width:74.8mm;">
									<span style="float:left;clear:none;">
										Add lines 3 and 5
									</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...........</span>
								</div>
								<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">6</div>
								<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 3]/RtnWorkerTotalWagesAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 4]/RtnWorkerTotalWagesAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 5]/RtnWorkerTotalWagesAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--Line 6 Add lines 3 and 5 End-->
							<!--Line 7 Multiply line 6 by 6.2% Begin-->
							<div style="width:187mm;font-size:7.5pt;padding-bottom:0mm;">
								<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">7</div>
								<div class="styLNDesc" style="width:74.8mm;">
									<span style="float:left;clear:none;">
										Multiply line 6 by 6.2% (.062)
									</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.......</span>
								</div>
								<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">7</div>
								<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 3]/RtnWorkerTotalWgsTimesPctAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 4]/RtnWorkerTotalWgsTimesPctAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 5]/RtnWorkerTotalWgsTimesPctAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--Line 7 Multiply line 6 by 6.2% End-->
							<!--Line 8 No entry available Begin-->
							<div style="width:187mm;font-size:7.5pt;padding-bottom:0mm;">
								<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">8</div>
								<div class="styLNDesc" style="width:74.8mm;">
									<span style="float:left;clear:none;">
										Maximum credit allowable
									</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........</span>
								</div>
								<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">8</div>
								<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">1,000</div>
								<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">1,000</div>
								<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;">1,000</div>
							</div>
							<!--Line 8 No entry available End-->
							<!--Line 9 Enter the smaller of lines 7 and 8 Begin-->
							<div style="width:187mm;font-size:7.5pt;padding-bottom:0mm;">
								<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">9</div>
								<div class="styLNDesc" style="width:74.8mm;">
									<span style="float:left;clear:none;">
										Enter the <b>smaller</b> of line 7 or line 8
									</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.....</span>
								</div>
								<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;border-bottom-width: 0px;">9</div>
								<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;border-bottom-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 3]/RtnWorkerSmllrTotalOrMaxCrAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;border-bottom-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 4]/RtnWorkerSmllrTotalOrMaxCrAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;border-bottom-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 5]/RtnWorkerSmllrTotalOrMaxCrAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--Line 9 Enter the smaller of lines 7 and 8 End-->
						</xsl:if>
					</xsl:if>
					<xsl:for-each select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp">
						<xsl:variable name="pos" select="position() "/>
						<xsl:if test="(position() mod 3 = 1)  and (position() &gt; 6)">
							<div class="styNBB" style="width:187mm;">
								<th style="width:187mm;">
									<div class="styLNDesc" style="height:23mm;width:90mm;background-color:lightgrey;padding-bottom:0mm;padding-left:0mm;border-style:solid;border-color:black;border-width:1px 1px 0px 0px;">
											</div>
									<!-- END SECTION A TITLE -->
									<!-- BEGIN Worker 1 Title  -->
									<div class="styPartDesc" style="height:23mm;width:32mm;padding-left:0mm;            padding-top:3mm;text-align:center;border-style:solid;border-color:black;border-width:1px 1px 0px 0px;">(a) <span style="font-weight:normal;">
											<br/>
												Retained<br/>Worker <br/>No. 
											<xsl:if test="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos] != ''">
												<xsl:number value="($pos)" format="1"/>
											</xsl:if>
										</span>
									</div>
									<!-- END Worker 1 Title -->
									<!-- BEGIN Worker 2 Title -->
									<div class="styPartDesc" style="height:23mm;width:32mm;padding-left:0mm;            padding-top:3mm;text-align:center;border-style:solid;border-color:black;border-width:1px 1px 0px 0px;">(b) <span style="font-weight:normal;">
											<br/>
												Retained<br/>Worker <br/>No. 
												
											<xsl:if test="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos +  1] != ''">
												<xsl:number value="($pos +  1)" format="1"/>
											</xsl:if>
										</span>
									</div>
									<!-- END Worker 2 Title -->
									<!-- BEGIN Worker 3 Title -->
									<div class="styPartDesc" style="height:23mm;width:32.5mm;padding-left:0mm;            padding-top:3mm;text-align:center;border-style:solid;border-color:black;border-width:1px 0px 0px 0px;">(c) <span style="font-weight:normal;">
											<br/>
												Retained<br/>Worker <br/>No. 
 											<xsl:if test="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos +  2] != ''">
												<xsl:number value="($pos +  2)" format="1"/>
											</xsl:if>
										</span>
									</div>
									<!-- END Worker 3 Title -->
								</th>
							</div>
							<!--Line 1 Retained Workers SSN Begin-->
							<div style="width:187mm;font-size:7.5pt;border-style:solid;border-color:black;border-width:1px 0px 0px 0px;">
								<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">1</div>
								<div class="styLNDesc" style="width:74.8mm;padding-bottom:0mm;">
											Enter the retained worker's social security number
		          <!--Dotted Line-->
									<!--<span class="styDotLn" style="float:none;clear:none;padding-left:0mm;">.</span>-->
								</div>
								<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">1</div>
								<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos]/SSN"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 1]/SSN"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 2]/SSN"/>
									</xsl:call-template>
								</div>
							</div>
							<!--Line 1 Retained Workers SSN End-->
							<!--Line 2 First Date of Employment Begin -->
							<div style="width:187mm;font-size:7.5pt;">
								<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">2</div>
								<div class="styLNDesc" style="width:74.8mm;padding-bottom:0mm;">
											Enter the first date of employment from the<br/>
											retained worker's Form W-11 or similar statement
		          <!--Dotted Line-->
								</div>
								<div class="styLNRightNumBox" style="height:8mm;font-size:8pt;padding-top:3.5mm;">2</div>
								<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3.5mm;padding-right:1mm;">
										<xsl:call-template name="PopulateMonth">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos]/RtnWorkerFirstEmplmnDt"/>
										</xsl:call-template>/
										<xsl:call-template name="PopulateDay">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos]/RtnWorkerFirstEmplmnDt"/>
										</xsl:call-template>/
										<xsl:call-template name="PopulateYear">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos]/RtnWorkerFirstEmplmnDt"/>
										</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3.5mm;padding-right:1mm;">
										<xsl:call-template name="PopulateMonth">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 1]/RtnWorkerFirstEmplmnDt"/>
										</xsl:call-template>/
										<xsl:call-template name="PopulateDay">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 1]/RtnWorkerFirstEmplmnDt"/>
										</xsl:call-template>/
										<xsl:call-template name="PopulateYear">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 1]/RtnWorkerFirstEmplmnDt"/>
										</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:8mm;width:33mm;padding-top:3.5mm;padding-right:1mm;">
										<xsl:call-template name="PopulateMonth">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 2]/RtnWorkerFirstEmplmnDt"/>
										</xsl:call-template>/
										<xsl:call-template name="PopulateDay">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 2]/RtnWorkerFirstEmplmnDt"/>
										</xsl:call-template>/
										<xsl:call-template name="PopulateYear">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 2]/RtnWorkerFirstEmplmnDt"/>
										</xsl:call-template>
								</div>
							</div>
							<!--Line 2 First Date of Employment End-->
							<!--Line 3 Wages for first 26 consecutive weeks Begin-->
							<div style="width:187mm;font-size:7.5pt;">
								<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">3</div>
								<div class="styLNDesc" style="width:74.8mm;padding-bottom:0mm;">
											Enter the retained worker's wages for the first 26
											consecutive weeks of employment
		          <!--Dotted Line-->
									<span class="styDotLn" style="float:none;clear:none;padding-left:0mm;">......</span>
								</div>
								<div class="styLNRightNumBox" style="height:8mm;font-size:8pt;padding-top:3.5mm;">3</div>
								<div class="styLNAmountBox" style="height:8mm;padding-top:3.5mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos]/RtnWorkerWgsFirst26WkEmplmnAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:8mm;padding-top:3.5mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 1]/RtnWorkerWgsFirst26WkEmplmnAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:8mm;width:33mm;padding-right:1mm;padding-top:3.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 2]/RtnWorkerWgsFirst26WkEmplmnAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--Line 3 Wages for first 26 consecutive weeks End-->
							<!--Line 4 Eighty percent of wages for first 26 weeks Begin-->
							<div style="width:187mm;font-size:7.5pt;">
								<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">4</div>
								<div class="styLNDesc" style="width:74.8mm;">
									<span style="float:left;clear:none;">
										Multiply line 3 by 80% (.80)
									</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........</span>
								</div>
								<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">4</div>
								<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos]/RtnWorkerWgsTimesPctAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 1]/RtnWorkerWgsTimesPctAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 2]/RtnWorkerWgsTimesPctAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--Line 4 Eighty percent of wages for first 26 weeks End-->
							<!--Line 5 Wages for second 26 consecutive weeks Begin-->
							<div style="width:187mm;font-size:7.5pt;">
								<div class="styLNLeftNumBoxSD" style="width:7mm;height:4mm;font-size:8pt;">5</div>
								<div class="styLNDesc" style="width:74.8mm;padding-top:0mm;">
											Enter the retained worker's wages for the second<br/>
											26 consecutive weeks of employment. If line 4 is<br/>
											larger than this amount, the qualified employee is<br/>
											not a retained worker and should not be listed on<br/>
											this form
											
		          <!--Dotted Line-->
									<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">..............</span>
								</div>
								<div class="styLNRightNumBox" style="height:16.5mm;padding-top:12mm;background-color:lightgrey;font-size:8pt;">
									<span style="height:4mm;background-color:white;width:7.80mm;">5</span>
								</div>
								<div class="styLNAmountBox" style="height:16.8mm;padding-top:12.5mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos]/RtnWorkerWgsSnd26WkEmplmnAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:16.8mm;padding-top:12.5mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 1]/RtnWorkerWgsSnd26WkEmplmnAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:16.8mm;width:33mm;padding-top:12.5mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 2]/RtnWorkerWgsSnd26WkEmplmnAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--Line 5 Wages for second 26 consecutive weeks End-->
							<!--Line 6 Add lines 3 and 5 Begin-->
							<div style="width:187mm;font-size:7.5pt;padding-bottom:0mm;">
								<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">6</div>
								<div class="styLNDesc" style="width:74.8mm;">
									<span style="float:left;clear:none;">
										Add lines 3 and 5
									</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...........</span>
								</div>
								<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">6</div>
								<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos]/RtnWorkerTotalWagesAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 1]/RtnWorkerTotalWagesAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 2]/RtnWorkerTotalWagesAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--Line 6 Add lines 3 and 5 End-->
							<!--Line 7 Multiply line 6 by 6.2% Begin-->
							<div style="width:187mm;font-size:7.5pt;padding-bottom:0mm;">
								<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">7</div>
								<div class="styLNDesc" style="width:74.8mm;">
									<span style="float:left;clear:none;">
										Multiply line 6 by 6.2% (.062)
									</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.......</span>
								</div>
								<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">7</div>
								<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos]/RtnWorkerTotalWgsTimesPctAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 1]/RtnWorkerTotalWgsTimesPctAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 2]/RtnWorkerTotalWgsTimesPctAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--Line 7 Multiply line 6 by 6.2% End-->
							<!--Line 8 No entry available Begin-->
							<div style="width:187mm;font-size:7.5pt;padding-bottom:0mm;">
								<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">8</div>
								<div class="styLNDesc" style="width:74.8mm;">
									<span style="float:left;clear:none;">
										Maximum credit allowable
									</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........</span>
								</div>
								<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">8</div>
								<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">1,000</div>
								<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">1,000</div>
								<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;">1,000</div>
							</div>
							<!--Line 8 No entry available End-->
							<!--Line 9 Enter the smaller of lines 7 and 8 Begin-->
							<div style="width:187mm;font-size:7.5pt;padding-bottom:0mm;">
								<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">9</div>
								<div class="styLNDesc" style="width:74.8mm;">
									<span style="float:left;clear:none;">
										Enter the <b>smaller</b> of line 7 or line 8
									</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.....</span>
								</div>
								<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;border-bottom-width: 0px;">9</div>
								<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;border-bottom-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos]/RtnWorkerSmllrTotalOrMaxCrAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;border-bottom-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 1]/RtnWorkerSmllrTotalOrMaxCrAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;border-bottom-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 2]/RtnWorkerSmllrTotalOrMaxCrAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--Line 9 Enter the smaller of lines 7 and 8 End-->
						</xsl:if>
					</xsl:for-each>
					<!---->
					<xsl:if test="(count($Form5884BData/NewHireRtntnCrForRtnWorkerGrp) &gt;= 1 and count($Form5884BData/NewHireRtntnCrForRtnWorkerGrp) &lt;= 9)">
						<div class="styNBB" style="width:187mm;">
							<th style="width:187mm;">
								<div class="styLNDesc" style="height:20mm;width:90mm;background-color:lightgrey;padding-bottom:0mm;padding-left:0mm;border-style:solid;border-color:black;border-width:1px 1px 0px 0px;">
											</div>
								<!-- END SECTION A TITLE -->
								<!-- BEGIN Worker 1 Title  -->
								<div class="styPartDesc" style="height:20mm;width:32mm;padding-left:0mm;            padding-top:3mm;text-align:center;border-style:solid;border-color:black;border-width:1px 1px 0px 0px;">(a) <span style="font-weight:normal;">
										<br/>
												Retained<br/>Worker <br/>No. </span>
								</div>
								<!-- END Worker 1 Title -->
								<!-- BEGIN Worker 2 Title -->
								<div class="styPartDesc" style="height:20mm;width:32mm;padding-left:0mm;            padding-top:3mm;text-align:center;border-style:solid;border-color:black;border-width:1px 1px 0px 0px;">(b) <span style="font-weight:normal;">
										<br/>
												Retained<br/>Worker <br/>No. </span>
								</div>
								<!-- END Worker 2 Title -->
								<!-- BEGIN Worker 3 Title -->
								<div class="styPartDesc" style="height:20mm;width:32.5mm;padding-left:0mm;            padding-top:3mm;text-align:center;border-style:solid;border-color:black;border-width:1px 0px 0px 0px;">(c) <span style="font-weight:normal;">
										<br/>
												Retained<br/>Worker <br/>No. </span>
								</div>
								<!-- END Worker 3 Title -->
							</th>
						</div>
						<!--Line 1 Retained Workers SSN Begin-->
						<div style="width:187mm;font-size:7.5pt;border-style:solid;border-color:black;border-width:1px 0px 0px 0px;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">1</div>
							<div class="styLNDesc" style="width:74.8mm;padding-bottom:0mm;">
											Enter the retained worker's social security number
		          <!--Dotted Line-->
								<!--<span class="styDotLn" style="float:none;clear:none;padding-left:0mm;">.</span>-->
							</div>
							<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">1</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;"/>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
							<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;"/>
						</div>
						<!--Line 1 Retained Workers SSN End-->
						<!--Line 2 First Date of Employment Begin -->
						<div style="width:187mm;font-size:7.5pt;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">2</div>
							<div class="styLNDesc" style="width:74.8mm;padding-bottom:0mm;">
											Enter the first date of employment from the<br/>
											retained worker's Form W-11 or similar statement
		          <!--Dotted Line-->
							</div>
							<div class="styLNRightNumBox" style="height:8mm;font-size:8pt;padding-top:3.5mm;">2</div>
							<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3.5mm;padding-right:1mm;">/ /2010</div>
							<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3.5mm;padding-right:1mm;">/ /2010</div>
							<div class="styLNAmountBox" style="height:8mm;width:33mm;padding-top:3.5mm;padding-right:1mm;">/ /2010</div>
						</div>
						<!--Line 2 First Date of Employment End-->
						<!--Line 3 Wages for first 26 consecutive weeks Begin-->
						<div style="width:187mm;font-size:7.5pt;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">3</div>
							<div class="styLNDesc" style="width:74.8mm;padding-bottom:0mm;">
											Enter the retained worker's wages for the first 26
											consecutive weeks of employment
		          <!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:0mm;">......</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;font-size:8pt;padding-top:3.5mm;">3</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:3.5mm;padding-right:1mm;"/>
							<div class="styLNAmountBox" style="height:8mm;padding-top:3.5mm;padding-right:1mm;"/>
							<div class="styLNAmountBox" style="height:8mm;width:33mm;padding-right:1mm;padding-top:3.5mm;"/>
						</div>
						<!--Line 3 Wages for first 26 consecutive weeks End-->
						<!--Line 4 Eighty percent of wages for first 26 weeks Begin-->
						<div style="width:187mm;font-size:7.5pt;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">4</div>
							<div class="styLNDesc" style="width:74.8mm;">
								<span style="float:left;clear:none;">
									Multiply line 3 by 80% (.80)
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">4</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
							<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;"/>
						</div>
						<!--Line 4 Eighty percent of wages for first 26 weeks End-->
						<!--Line 5 Wages for second 26 consecutive weeks Begin-->
						<div style="width:187mm;font-size:7.5pt;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;height:4mm;font-size:8pt;">5</div>
							<div class="styLNDesc" style="width:74.8mm;padding-top:0mm;">
											Enter the retained worker's wages for the second<br/>
											26 consecutive weeks of employment. If line 4 is<br/>
											larger than this amount, the qualified employee is<br/>
											not a retained worker and should not be listed on<br/>
											this form
											
		          <!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">..............</span>
							</div>
							<div class="styLNRightNumBox" style="height:16.5mm;padding-top:12mm;background-color:lightgrey;font-size:8pt;">
								<span style="height:4mm;background-color:white;width:7.80mm;">5</span>
							</div>
							<div class="styLNAmountBox" style="height:16.8mm;padding-top:12.5mm;padding-right:1mm;"/>
							<div class="styLNAmountBox" style="height:16.8mm;padding-top:12.5mm;padding-right:1mm;"/>
							<div class="styLNAmountBox" style="height:16.8mm;width:33mm;padding-top:12.5mm;padding-right:1mm;"/>
						</div>
						<!--Line 5 Wages for second 26 consecutive weeks End-->
						<!--Line 6 Add lines 3 and 5 Begin-->
						<div style="width:187mm;font-size:7.5pt;padding-bottom:0mm;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">6</div>
							<div class="styLNDesc" style="width:74.8mm;">
								<span style="float:left;clear:none;">
									Add lines 3 and 5
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...........</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">6</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
							<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;"/>
						</div>
						<!--Line 6 Add lines 3 and 5 End-->
						<!--Line 7 Multiply line 6 by 6.2% Begin-->
						<div style="width:187mm;font-size:7.5pt;padding-bottom:0mm;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">7</div>
							<div class="styLNDesc" style="width:74.8mm;">
								<span style="float:left;clear:none;">
									Multiply line 6 by 6.2% (.062)
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.......</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">7</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
							<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;"/>
						</div>
						<!--Line 7 Multiply line 6 by 6.2% End-->
						<!--Line 8 No entry available Begin-->
						<div style="width:187mm;font-size:7.5pt;padding-bottom:0mm;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">8</div>
							<div class="styLNDesc" style="width:74.8mm;">
								<span style="float:left;clear:none;">
									Maximum credit allowable
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">8</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">1,000</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">1,000</div>
							<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;">1,000</div>
						</div>
						<!--Line 8 No entry available End-->
						<!--Line 9 Enter the smaller of lines 7 and 8 Begin-->
						<div style="width:187mm;font-size:7.5pt;padding-bottom:0mm;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">9</div>
							<div class="styLNDesc" style="width:74.8mm;">
								<span style="float:left;clear:none;">
									Enter the <b>smaller</b> of line 7 or line 8
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.....</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;border-bottom-width: 0px;">9</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;border-bottom-width: 0px;"/>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;border-bottom-width: 0px;"/>
							<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;border-bottom-width: 0px;"/>
						</div>
						<!--Line 9 Enter the smaller of lines 7 and 8 End-->
					</xsl:if>
					
					<xsl:if test="(count($Form5884BData/NewHireRtntnCrForRtnWorkerGrp) &gt;= 1 and count($Form5884BData/NewHireRtntnCrForRtnWorkerGrp) &lt;= 6)">
						<div class="styNBB" style="width:187mm;">
							<th style="width:187mm;">
								<div class="styLNDesc" style="height:20mm;width:90mm;background-color:lightgrey;padding-bottom:0mm;padding-left:0mm;border-style:solid;border-color:black;border-width:1px 1px 0px 0px;">
											</div>
								<!-- END SECTION A TITLE -->
								<!-- BEGIN Worker 1 Title  -->
								<div class="styPartDesc" style="height:20mm;width:32mm;padding-left:0mm;            padding-top:3mm;text-align:center;border-style:solid;border-color:black;border-width:1px 1px 0px 0px;">(a) <span style="font-weight:normal;">
										<br/>
												Retained<br/>Worker <br/>No. </span>
								</div>
								<!-- END Worker 1 Title -->
								<!-- BEGIN Worker 2 Title -->
								<div class="styPartDesc" style="height:20mm;width:32mm;padding-left:0mm;            padding-top:3mm;text-align:center;border-style:solid;border-color:black;border-width:1px 1px 0px 0px;">(b) <span style="font-weight:normal;">
										<br/>
												Retained<br/>Worker <br/>No. </span>
								</div>
								<!-- END Worker 2 Title -->
								<!-- BEGIN Worker 3 Title -->
								<div class="styPartDesc" style="height:20mm;width:32.5mm;padding-left:0mm;            padding-top:3mm;text-align:center;border-style:solid;border-color:black;border-width:1px 0px 0px 0px;">(c) <span style="font-weight:normal;">
										<br/>
												Retained<br/>Worker <br/>No. </span>
								</div>
								<!-- END Worker 3 Title -->
							</th>
						</div>
						<!--Line 1 Retained Workers SSN Begin-->
						<div style="width:187mm;font-size:7.5pt;border-style:solid;border-color:black;border-width:1px 0px 0px 0px;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">1</div>
							<div class="styLNDesc" style="width:74.8mm;padding-bottom:0mm;">
											Enter the retained worker's social security number
		          <!--Dotted Line-->
								<!--<span class="styDotLn" style="float:none;clear:none;padding-left:0mm;">.</span>-->
							</div>
							<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">1</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;"/>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
							<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;"/>
						</div>
						<!--Line 1 Retained Workers SSN End-->
						<!--Line 2 First Date of Employment Begin -->
						<div style="width:187mm;font-size:7.5pt;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">2</div>
							<div class="styLNDesc" style="width:74.8mm;padding-bottom:0mm;">
											Enter the first date of employment from the<br/>
											retained worker's Form W-11 or similar statement
		          <!--Dotted Line-->
							</div>
							<div class="styLNRightNumBox" style="height:8mm;font-size:8pt;padding-top:3.5mm;">2</div>
							<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3.5mm;padding-right:1mm;">/ /2010</div>
							<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3.5mm;padding-right:1mm;">/ /2010</div>
							<div class="styLNAmountBox" style="height:8mm;width:33mm;padding-top:3.5mm;padding-right:1mm;">/ /2010</div>
						</div>
						<!--Line 2 First Date of Employment End-->
						<!--Line 3 Wages for first 26 consecutive weeks Begin-->
						<div style="width:187mm;font-size:7.5pt;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">3</div>
							<div class="styLNDesc" style="width:74.8mm;padding-bottom:0mm;">
											Enter the retained worker's wages for the first 26
											consecutive weeks of employment
		          <!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:0mm;">......</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;font-size:8pt;padding-top:3.5mm;">3</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:3.5mm;padding-right:1mm;"/>
							<div class="styLNAmountBox" style="height:8mm;padding-top:3.5mm;padding-right:1mm;"/>
							<div class="styLNAmountBox" style="height:8mm;width:33mm;padding-right:1mm;padding-top:3.5mm;"/>
						</div>
						<!--Line 3 Wages for first 26 consecutive weeks End-->
						<!--Line 4 Eighty percent of wages for first 26 weeks Begin-->
						<div style="width:187mm;font-size:7.5pt;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">4</div>
							<div class="styLNDesc" style="width:74.8mm;">
								<span style="float:left;clear:none;">
									Multiply line 3 by 80% (.80)
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">4</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
							<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;"/>
						</div>
						<!--Line 4 Eighty percent of wages for first 26 weeks End-->
						<!--Line 5 Wages for second 26 consecutive weeks Begin-->
						<div style="width:187mm;font-size:7.5pt;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;height:4mm;font-size:8pt;">5</div>
							<div class="styLNDesc" style="width:74.8mm;padding-top:0mm;">
											Enter the retained worker's wages for the second<br/>
											26 consecutive weeks of employment. If line 4 is<br/>
											larger than this amount, the qualified employee is<br/>
											not a retained worker and should not be listed on<br/>
											this form
											
		          <!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">..............</span>
							</div>
							<div class="styLNRightNumBox" style="height:16.5mm;padding-top:12mm;background-color:lightgrey;font-size:8pt;">
								<span style="height:4mm;background-color:white;width:7.80mm;">5</span>
							</div>
							<div class="styLNAmountBox" style="height:16.8mm;padding-top:12.5mm;padding-right:1mm;"/>
							<div class="styLNAmountBox" style="height:16.8mm;padding-top:12.5mm;padding-right:1mm;"/>
							<div class="styLNAmountBox" style="height:16.8mm;width:33mm;padding-top:12.5mm;padding-right:1mm;"/>
						</div>
						<!--Line 5 Wages for second 26 consecutive weeks End-->
						<!--Line 6 Add lines 3 and 5 Begin-->
						<div style="width:187mm;font-size:7.5pt;padding-bottom:0mm;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">6</div>
							<div class="styLNDesc" style="width:74.8mm;">
								<span style="float:left;clear:none;">
									Add lines 3 and 5
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...........</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">6</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
							<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;"/>
						</div>
						<!--Line 6 Add lines 3 and 5 End-->
						<!--Line 7 Multiply line 6 by 6.2% Begin-->
						<div style="width:187mm;font-size:7.5pt;padding-bottom:0mm;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">7</div>
							<div class="styLNDesc" style="width:74.8mm;">
								<span style="float:left;clear:none;">
									Multiply line 6 by 6.2% (.062)
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.......</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">7</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
							<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;"/>
						</div>
						<!--Line 7 Multiply line 6 by 6.2% End-->
						<!--Line 8 No entry available Begin-->
						<div style="width:187mm;font-size:7.5pt;padding-bottom:0mm;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">8</div>
							<div class="styLNDesc" style="width:74.8mm;">
								<span style="float:left;clear:none;">
									Maximum credit allowable
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">8</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">1,000</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">1,000</div>
							<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;">1,000</div>
						</div>
						<!--Line 8 No entry available End-->
						<!--Line 9 Enter the smaller of lines 7 and 8 Begin-->
						<div style="width:187mm;font-size:7.5pt;padding-bottom:0mm;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">9</div>
							<div class="styLNDesc" style="width:74.8mm;">
								<span style="float:left;clear:none;">
									Enter the <b>smaller</b> of line 7 or line 8
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.....</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;border-bottom-width: 0px;">9</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;border-bottom-width: 0px;"/>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;border-bottom-width: 0px;"/>
							<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;border-bottom-width: 0px;"/>
						</div>
						<!--Line 9 Enter the smaller of lines 7 and 8 End-->
					</xsl:if>
					<!--Start Printing Blank Section for Vehicle Expenses Group-->
					<xsl:if test="(count($Form5884BData/NewHireRtntnCrForRtnWorkerGrp) &lt; 1)">
						<xsl:variable name="pos" select="position()"/>
						<div class="styNBB" style="width:187mm;">
							<th style="width:187mm;">
								<div class="styLNDesc" style="height:23mm;width:90mm;padding-bottom:0mm;padding-left:0mm;border-style:solid;border-color:black;border-width:1px 1px 0px 0px;">
													Use a separate column for each retained worker. Keep track of the<br/>
													number of workers listed by entering a number at the top of each<br/>
													column. For example, the first retained worker listed on the first <br/>
													attached Part II would be Retained Worker No. 4. If you need more<br/>
													columns, use additional copies of Part II. Include the totals from <br/>
													columns (a) through (c) of all lines 9 from all copies of Part II on<br/>
													Part I, line 10.
								</div>
								<!-- END SECTION A TITLE -->
								<!-- BEGIN Worker 1 Title  -->
								<div class="styPartDesc" style="height:23mm;width:32mm;padding-left:0mm;            padding-top:3mm;text-align:center;border-style:solid;border-color:black;border-width:1px 1px 0px 0px;">(a) <span style="font-weight:normal;">
										<br/>
												Retained<br/>Worker <br/>No. </span>
								</div>
								<!-- END Worker 1 Title -->
								<!-- BEGIN Worker 2 Title -->
								<div class="styPartDesc" style="height:23mm;width:32mm;padding-left:0mm;            padding-top:3mm;text-align:center;border-style:solid;border-color:black;border-width:1px 1px 0px 0px;">(b) <span style="font-weight:normal;">
										<br/>
												Retained<br/>Worker <br/>No. </span>
								</div>
								<!-- END Worker 2 Title -->
								<!-- BEGIN Worker 3 Title -->
								<div class="styPartDesc" style="height:23mm;width:32.5mm;padding-left:0mm;            padding-top:3mm;text-align:center;border-style:solid;border-color:black;border-width:1px 0px 0px 0px;">(c) <span style="font-weight:normal;">
										<br/>
												Retained<br/>Worker <br/>No. </span>
								</div>
								<!-- END Worker 3 Title -->
							</th>
						</div>
						<!--Line 1 Retained Workers SSN Begin-->
						<div style="width:187mm;font-size:7.5pt;border-style:solid;border-color:black;border-width:1px 0px 0px 0px;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">1</div>
							<div class="styLNDesc" style="width:74.8mm;padding-bottom:0mm;">
											Enter the retained worker's social security number
		          <!--Dotted Line-->
								<!--<span class="styDotLn" style="float:none;clear:none;padding-left:0mm;">.</span>-->
							</div>
							<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">1</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;"/>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
							<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;"/>
						</div>
						<!--Line 1 Retained Workers SSN End-->
						<!--Line 2 First Date of Employment Begin -->
						<div style="width:187mm;font-size:7.5pt;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">2</div>
							<div class="styLNDesc" style="width:74.8mm;padding-bottom:0mm;">
											Enter the first date of employment from the<br/>
											retained worker's Form W-11 or similar statement
		          <!--Dotted Line-->
							</div>
							<div class="styLNRightNumBox" style="height:8mm;font-size:8pt;padding-top:3.5mm;">2</div>
							<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3.5mm;padding-right:1mm;">/ /2010</div>
							<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3.5mm;padding-right:1mm;">/ /2010</div>
							<div class="styLNAmountBox" style="height:8mm;width:33mm;padding-top:3.5mm;padding-right:1mm;">/ /2010</div>
						</div>
						<!--Line 2 First Date of Employment End-->
						<!--Line 3 Wages for first 26 consecutive weeks Begin-->
						<div style="width:187mm;font-size:7.5pt;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">3</div>
							<div class="styLNDesc" style="width:74.8mm;padding-bottom:0mm;">
											Enter the retained worker's wages for the first 26
											consecutive weeks of employment
		          <!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:0mm;">......</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;font-size:8pt;padding-top:3.5mm;">3</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:3.5mm;padding-right:1mm;"/>
							<div class="styLNAmountBox" style="height:8mm;padding-top:3.5mm;padding-right:1mm;"/>
							<div class="styLNAmountBox" style="height:8mm;width:33mm;padding-right:1mm;padding-top:3.5mm;"/>
						</div>
						<!--Line 3 Wages for first 26 consecutive weeks End-->
						<!--Line 4 Eighty percent of wages for first 26 weeks Begin-->
						<div style="width:187mm;font-size:7.5pt;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">4</div>
							<div class="styLNDesc" style="width:74.8mm;">
								<span style="float:left;clear:none;">
									Multiply line 3 by 80% (.80)
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">4</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
							<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;"/>
						</div>
						<!--Line 4 Eighty percent of wages for first 26 weeks End-->
						<!--Line 5 Wages for second 26 consecutive weeks Begin-->
						<div style="width:187mm;font-size:7.5pt;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;height:4mm;font-size:8pt;">5</div>
							<div class="styLNDesc" style="width:74.8mm;padding-top:0mm;">
											Enter the retained worker's wages for the second<br/>
											26 consecutive weeks of employment. If line 4 is<br/>
											larger than this amount, the qualified employee is<br/>
											not a retained worker and should not be listed on<br/>
											this form
											
		          <!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">..............</span>
							</div>
							<div class="styLNRightNumBox" style="height:16.5mm;padding-top:12mm;background-color:lightgrey;font-size:8pt;">
								<span style="height:4mm;background-color:white;width:7.80mm;">5</span>
							</div>
							<div class="styLNAmountBox" style="height:16.8mm;padding-top:12.5mm;padding-right:1mm;"/>
							<div class="styLNAmountBox" style="height:16.8mm;padding-top:12.5mm;padding-right:1mm;"/>
							<div class="styLNAmountBox" style="height:16.8mm;width:33mm;padding-top:12.5mm;padding-right:1mm;"/>
						</div>
						<!--Line 5 Wages for second 26 consecutive weeks End-->
						<!--Line 6 Add lines 3 and 5 Begin-->
						<div style="width:187mm;font-size:7.5pt;padding-bottom:0mm;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">6</div>
							<div class="styLNDesc" style="width:74.8mm;">
								<span style="float:left;clear:none;">
									Add lines 3 and 5
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...........</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">6</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
							<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;"/>
						</div>
						<!--Line 6 Add lines 3 and 5 End-->
						<!--Line 7 Multiply line 6 by 6.2% Begin-->
						<div style="width:187mm;font-size:7.5pt;padding-bottom:0mm;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">7</div>
							<div class="styLNDesc" style="width:74.8mm;">
								<span style="float:left;clear:none;">
									Multiply line 6 by 6.2% (.062)
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.......</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">7</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
							<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;"/>
						</div>
						<!--Line 7 Multiply line 6 by 6.2% End-->
						<!--Line 8 No entry available Begin-->
						<div style="width:187mm;font-size:7.5pt;padding-bottom:0mm;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">8</div>
							<div class="styLNDesc" style="width:74.8mm;">
								<span style="float:left;clear:none;">
									Maximum credit allowable
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">8</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">1,000</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">1,000</div>
							<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;">1,000</div>
						</div>
						<!--Line 8 No entry available End-->
						<!--Line 9 Enter the smaller of lines 7 and 8 Begin-->
						<div style="width:187mm;font-size:7.5pt;padding-bottom:0mm;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">9</div>
							<div class="styLNDesc" style="width:74.8mm;">
								<span style="float:left;clear:none;">
									Enter the <b>smaller</b> of line 7 or line 8
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.....</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;border-bottom-width: 0px;">9</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;border-bottom-width: 0px;"/>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;border-bottom-width: 0px;"/>
							<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;border-bottom-width: 0px;"/>
						</div>
						<!--Line 9 Enter the smaller of lines 7 and 8 End-->
						<div class="styNBB" style="width:187mm;">
							<th style="width:187mm;">
								<div class="styLNDesc" style="height:20mm;width:90mm;background-color:lightgrey;padding-bottom:0mm;padding-left:0mm;border-style:solid;border-color:black;border-width:1px 1px 0px 0px;"/>
											
								<!-- END SECTION A TITLE -->
								<!-- BEGIN Worker 1 Title  -->
								<div class="styPartDesc" style="height:20mm;width:32mm;padding-left:0mm;            padding-top:3mm;text-align:center;border-style:solid;border-color:black;border-width:1px 1px 0px 0px;">(a) <span style="font-weight:normal;">
										<br/>
												Retained<br/>Worker <br/>No. </span>
								</div>
								<!-- END Worker 1 Title -->
								<!-- BEGIN Worker 2 Title -->
								<div class="styPartDesc" style="height:20mm;width:32mm;padding-left:0mm;            padding-top:3mm;text-align:center;border-style:solid;border-color:black;border-width:1px 1px 0px 0px;">(b) <span style="font-weight:normal;">
										<br/>
												Retained<br/>Worker <br/>No. </span>
								</div>
								<!-- END Worker 2 Title -->
								<!-- BEGIN Worker 3 Title -->
								<div class="styPartDesc" style="height:20mm;width:32.5mm;padding-left:0mm;            padding-top:3mm;text-align:center;border-style:solid;border-color:black;border-width:1px 0px 0px 0px;">(c) <span style="font-weight:normal;">
										<br/>
												Retained<br/>Worker <br/>No. </span>
								</div>
								<!-- END Worker 3 Title -->
							</th>
						</div>
						<!--Line 1 Retained Workers SSN Begin-->
						<div style="width:187mm;font-size:7.5pt;border-style:solid;border-color:black;border-width:1px 0px 0px 0px;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">1</div>
							<div class="styLNDesc" style="width:74.8mm;padding-bottom:0mm;">
											Enter the retained worker's social security number
		          <!--Dotted Line-->
								<!--<span class="styDotLn" style="float:none;clear:none;padding-left:0mm;">.</span>-->
							</div>
							<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">1</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos]/SSN"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 1]/SSN"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 2]/SSN"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 1 Retained Workers SSN End-->
						<!--Line 2 First Date of Employment Begin -->
						<div style="width:187mm;font-size:7.5pt;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">2</div>
							<div class="styLNDesc" style="width:74.8mm;padding-bottom:0mm;">
											Enter the first date of employment from the<br/>
											retained worker's Form W-11 or similar statement
		          <!--Dotted Line-->
							</div>
							<div class="styLNRightNumBox" style="height:8mm;font-size:8pt;padding-top:3.5mm;">2</div>
							<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3.5mm;padding-right:1mm;">
										<xsl:call-template name="PopulateMonth">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos]/RtnWorkerFirstEmplmnDt"/>
										</xsl:call-template>/
										<xsl:call-template name="PopulateDay">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos]/RtnWorkerFirstEmplmnDt"/>
										</xsl:call-template>/
										<xsl:call-template name="PopulateYear">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos]/RtnWorkerFirstEmplmnDt"/>
										</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3.5mm;padding-right:1mm;">
										<xsl:call-template name="PopulateMonth">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 1]/RtnWorkerFirstEmplmnDt"/>
										</xsl:call-template>/
										<xsl:call-template name="PopulateDay">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 1]/RtnWorkerFirstEmplmnDt"/>
										</xsl:call-template>/
										<xsl:call-template name="PopulateYear">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 1]/RtnWorkerFirstEmplmnDt"/>
										</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="height:8mm;width:33mm;padding-top:3.5mm;padding-right:1mm;">
										<xsl:call-template name="PopulateMonth">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 2]/RtnWorkerFirstEmplmnDt"/>
										</xsl:call-template>/
										<xsl:call-template name="PopulateDay">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 2]/RtnWorkerFirstEmplmnDt"/>
										</xsl:call-template>/
										<xsl:call-template name="PopulateYear">
											<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 2]/RtnWorkerFirstEmplmnDt"/>
										</xsl:call-template>
							</div>
						</div>
						<!--Line 2 First Date of Employment End-->
						<!--Line 3 Wages for first 26 consecutive weeks Begin-->
						<div style="width:187mm;font-size:7.5pt;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">3</div>
							<div class="styLNDesc" style="width:74.8mm;padding-bottom:0mm;">
											Enter the retained worker's wages for the first 26
											consecutive weeks of employment
		          <!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:0mm;">......</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;font-size:8pt;padding-top:3.5mm;">3</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:3.5mm;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos]/RtnWorkerWgsFirst26WkEmplmnAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:3.5mm;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 1]/RtnWorkerWgsFirst26WkEmplmnAmt[$pos + 1]"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="height:8mm;width:33mm;padding-right:1mm;padding-top:3.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 2]/RtnWorkerWgsFirst26WkEmplmnAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 3 Wages for first 26 consecutive weeks End-->
						<!--Line 4 Eighty percent of wages for first 26 weeks Begin-->
						<div style="width:187mm;font-size:7.5pt;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">4</div>
							<div class="styLNDesc" style="width:74.8mm;">
								<span style="float:left;clear:none;">
									Multiply line 3 by 80% (.80)
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">4</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos]/RtnWorkerWgsTimesPctAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 1]/RtnWorkerWgsTimesPctAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 2]/RtnWorkerWgsTimesPctAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 4 Eighty percent of wages for first 26 weeks End-->
						<!--Line 5 Wages for second 26 consecutive weeks Begin-->
						<div style="width:187mm;font-size:7.5pt;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;height:4mm;font-size:8pt;">5</div>
							<div class="styLNDesc" style="width:74.8mm;padding-top:0mm;">
											Enter the retained worker's wages for the second<br/>
											26 consecutive weeks of employment. If line 4 is<br/>
											larger than this amount, the qualified employee is<br/>
											not a retained worker and should not be listed on<br/>
											this form
											
		          <!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">..............</span>
							</div>
							<div class="styLNRightNumBox" style="height:16.5mm;padding-top:12mm;background-color:lightgrey;font-size:8pt;">
								<span style="height:4mm;background-color:white;width:7.80mm;">5</span>
							</div>
							<div class="styLNAmountBox" style="height:16.8mm;padding-top:12.5mm;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos]/RtnWorkerWgsSnd26WkEmplmnAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="height:16.8mm;padding-top:12.5mm;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 1]/RtnWorkerWgsSnd26WkEmplmnAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="height:16.8mm;width:33mm;padding-top:12.5mm;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 2]/RtnWorkerWgsSnd26WkEmplmnAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 5 Wages for second 26 consecutive weeks End-->
						<!--Line 6 Add lines 3 and 5 Begin-->
						<div style="width:187mm;font-size:7.5pt;padding-bottom:0mm;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">6</div>
							<div class="styLNDesc" style="width:74.8mm;">
								<span style="float:left;clear:none;">
									Add lines 3 and 5
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...........</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">6</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos]/RtnWorkerTotalWagesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 1]/RtnWorkerTotalWagesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 2]/RtnWorkerTotalWagesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 6 Add lines 3 and 5 End-->
						<!--Line 7 Multiply line 6 by 6.2% Begin-->
						<div style="width:187mm;font-size:7.5pt;padding-bottom:0mm;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">7</div>
							<div class="styLNDesc" style="width:74.8mm;">
								<span style="float:left;clear:none;">
									Multiply line 6 by 6.2% (.062)
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.......</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">7</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos]/RtnWorkerTotalWgsTimesPctAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 1]/RtnWorkerTotalWgsTimesPctAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 2]/RtnWorkerTotalWgsTimesPctAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 7 Multiply line 6 by 6.2% End-->
						<!--Line 8 No entry available Begin-->
						<div style="width:187mm;font-size:7.5pt;padding-bottom:0mm;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">8</div>
							<div class="styLNDesc" style="width:74.8mm;">
								<span style="float:left;clear:none;">
									Maximum credit allowable
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">8</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">1,000</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">1,000</div>
							<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;">1,000</div>
						</div>
						<!--Line 8 No entry available End-->
						<!--Line 9 Enter the smaller of lines 7 and 8 Begin-->
						<div style="width:187mm;font-size:7.5pt;padding-bottom:0mm;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">9</div>
							<div class="styLNDesc" style="width:74.8mm;">
								<span style="float:left;clear:none;">
									Enter the <b>smaller</b> of line 7 or line 8
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.....</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;border-bottom-width: 0px;">9</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;border-bottom-width: 0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos]/RtnWorkerSmllrTotalOrMaxCrAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;border-bottom-width: 0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 1]/RtnWorkerSmllrTotalOrMaxCrAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;border-bottom-width: 0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5884BData/NewHireRtntnCrForRtnWorkerGrp[$pos + 2]/RtnWorkerSmllrTotalOrMaxCrAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 9 Enter the smaller of lines 7 and 8 End-->
						<div class="styNBB" style="width:187mm;">
							<th style="width:187mm;">
								<div class="styLNDesc" style="height:20mm;width:90mm;background-color:lightgrey;padding-bottom:0mm;padding-left:0mm;border-style:solid;border-color:black;border-width:1px 1px 0px 0px;"/>
											
								<!-- END SECTION A TITLE -->
								<!-- BEGIN Worker 1 Title  -->
								<div class="styPartDesc" style="height:20mm;width:32mm;padding-left:0mm;            padding-top:3mm;text-align:center;border-style:solid;border-color:black;border-width:1px 1px 0px 0px;">(a) <span style="font-weight:normal;">
										<br/>
												Retained<br/>Worker <br/>No. </span>
								</div>
								<!-- END Worker 1 Title -->
								<!-- BEGIN Worker 2 Title -->
								<div class="styPartDesc" style="height:20mm;width:32mm;padding-left:0mm;            padding-top:3mm;text-align:center;border-style:solid;border-color:black;border-width:1px 1px 0px 0px;">(b) <span style="font-weight:normal;">
										<br/>
												Retained<br/>Worker <br/>No. </span>
								</div>
								<!-- END Worker 2 Title -->
								<!-- BEGIN Worker 3 Title -->
								<div class="styPartDesc" style="height:20mm;width:32.5mm;padding-left:0mm;            padding-top:3mm;text-align:center;border-style:solid;border-color:black;border-width:1px 0px 0px 0px;">(c) <span style="font-weight:normal;">
										<br/>
												Retained<br/>Worker <br/>No. </span>
								</div>
								<!-- END Worker 3 Title -->
							</th>
						</div>
						<!--Line 1 Retained Workers SSN Begin-->
						<div style="width:187mm;font-size:7.5pt;border-style:solid;border-color:black;border-width:1px 0px 0px 0px;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">1</div>
							<div class="styLNDesc" style="width:74.8mm;padding-bottom:0mm;">
											Enter the retained worker's social security number
		          <!--Dotted Line-->
								<!--<span class="styDotLn" style="float:none;clear:none;padding-left:0mm;">.</span>-->
							</div>
							<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">1</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
							<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;"/>
						</div>
						<!--Line 1 Retained Workers SSN End-->
						<!--Line 2 First Date of Employment Begin -->
						<div style="width:187mm;font-size:7.5pt;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">2</div>
							<div class="styLNDesc" style="width:74.8mm;padding-bottom:0mm;">
											Enter the first date of employment from the<br/>
											retained worker's Form W-11 or similar statement
		          <!--Dotted Line-->
							</div>
							<div class="styLNRightNumBox" style="height:8mm;font-size:8pt;padding-top:3.5mm;">2</div>
							<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3.5mm;padding-right:1mm;">/ /2010</div>
							<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3.5mm;padding-right:1mm;">/ /2010</div>
							<div class="styLNAmountBox" style="height:8mm;width:33mm;padding-top:3.5mm;padding-right:1mm;">/ /2010</div>
						</div>
						<!--Line 2 First Date of Employment End-->
						<!--Line 3 Wages for first 26 consecutive weeks Begin-->
						<div style="width:187mm;font-size:7.5pt;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">3</div>
							<div class="styLNDesc" style="width:74.8mm;padding-bottom:0mm;">
											Enter the retained worker's wages for the first 26
											consecutive weeks of employment
		          <!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:0mm;">......</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;font-size:8pt;padding-top:3.5mm;">3</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:3.5mm;padding-right:1mm;"/>
							<div class="styLNAmountBox" style="height:8mm;padding-top:3.5mm;padding-right:1mm;"/>
							<div class="styLNAmountBox" style="height:8mm;width:33mm;padding-right:1mm;padding-top:3.5mm;"/>
						</div>
						<!--Line 3 Wages for first 26 consecutive weeks End-->
						<!--Line 4 Eighty percent of wages for first 26 weeks Begin-->
						<div style="width:187mm;font-size:7.5pt;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">4</div>
							<div class="styLNDesc" style="width:74.8mm;">
								<span style="float:left;clear:none;">
									Multiply line 3 by 80% (.80)
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">4</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
							<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;"/>
						</div>
						<!--Line 4 Eighty percent of wages for first 26 weeks End-->
						<!--Line 5 Wages for second 26 consecutive weeks Begin-->
						<div style="width:187mm;font-size:7.5pt;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;height:4mm;font-size:8pt;">5</div>
							<div class="styLNDesc" style="width:74.8mm;padding-top:0mm;">
											Enter the retained worker's wages for the second<br/>
											26 consecutive weeks of employment. If line 4 is<br/>
											larger than this amount, the qualified employee is<br/>
											not a retained worker and should not be listed on<br/>
											this form
											
		          <!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">..............</span>
							</div>
							<div class="styLNRightNumBox" style="height:16.5mm;padding-top:12mm;background-color:lightgrey;font-size:8pt;">
								<span style="height:4mm;background-color:white;width:7.80mm;">5</span>
							</div>
							<div class="styLNAmountBox" style="height:16.8mm;padding-top:12.5mm;padding-right:1mm;"/>
							<div class="styLNAmountBox" style="height:16.8mm;padding-top:12.5mm;padding-right:1mm;"/>
							<div class="styLNAmountBox" style="height:16.8mm;width:33mm;padding-top:12.5mm;padding-right:1mm;"/>
						</div>
						<!--Line 5 Wages for second 26 consecutive weeks End-->
						<!--Line 6 Add lines 3 and 5 Begin-->
						<div style="width:187mm;font-size:7.5pt;padding-bottom:0mm;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">6</div>
							<div class="styLNDesc" style="width:74.8mm;">
								<span style="float:left;clear:none;">
									Add lines 3 and 5
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...........</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">6</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
							<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;"/>
						</div>
						<!--Line 6 Add lines 3 and 5 End-->
						<!--Line 7 Multiply line 6 by 6.2% Begin-->
						<div style="width:187mm;font-size:7.5pt;padding-bottom:0mm;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">7</div>
							<div class="styLNDesc" style="width:74.8mm;">
								<span style="float:left;clear:none;">
									Multiply line 6 by 6.2% (.062)
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.......</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">7</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;"/>
							<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;"/>
						</div>
						<!--Line 7 Multiply line 6 by 6.2% End-->
						<!--Line 8 No entry available Begin-->
						<div style="width:187mm;font-size:7.5pt;padding-bottom:0mm;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">8</div>
							<div class="styLNDesc" style="width:74.8mm;">
								<span style="float:left;clear:none;">
									Maximum credit allowable
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;">8</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">1,000</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">1,000</div>
							<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;">1,000</div>
						</div>
						<!--Line 8 No entry available End-->
						<!--Line 9 Enter the smaller of lines 7 and 8 Begin-->
						<div style="width:187mm;font-size:7.5pt;padding-bottom:0mm;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;font-size:8pt;">9</div>
							<div class="styLNDesc" style="width:74.8mm;">
								<span style="float:left;clear:none;">
									Enter the <b>smaller</b> of line 7 or line 8
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.....</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;font-size:8pt;border-bottom-width: 0px;">9</div>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;border-bottom-width: 0px;"/>
							<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;border-bottom-width: 0px;"/>
							<div class="styLNAmountBox" style="height:5mm;width:33mm;padding-right:1mm;padding-top:1mm;border-bottom-width: 0px;"/>
						</div>
						<!--Line 9 Enter the smaller of lines 7 and 8 End-->
					</xsl:if>
					<!-- page 2 footer -->
					<div class="pageEnd" style="width:187mm;border-style:solid; border-color:black;border-width: 1px 0px 0px 0px;">
						<span style="float:right;clear:none;">
						   Form <span class="styBoldText" style="font-size:10pt;">5884-B</span> (12-2010)
					   </span>
					</div>
					<!-- end page 2 footer -->
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
							<xsl:with-param name="TargetNode" select="$Form5884BData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>