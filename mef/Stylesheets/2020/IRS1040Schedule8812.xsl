<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Corey Rooks on 4/25/2019 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1040Schedule8812Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="Form8812Data" select="$RtnDoc/IRS1040Schedule8812"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8812Data)">
                        </xsl:with-param>
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
				<meta name="Description" content="IRS Form 8812"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
				    <xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1040Schedule8812Style"/>
						<xsl:call-template name="AddOnStyle"/>
				   </xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form1040Schedule8812" style="font-size:7pt;">
					<!-- BEGIN WARNING LINE -->
					<div style="width: 187mm; clear: left; float: left;">
						<xsl:call-template name="DocumentHeader"/>
					</div>
					<!-- END WARNING LINE -->
					<!-- Begin Form Number and Name -->
					<div class="styTBB" style="width: 187mm; height: 23mm; clear:left; float: left;">
						<div class="styFNBox" style="width:34mm;height:23mm;padding-top:1mm;border-right-width:2px;">
							<div style="height:13mm;">
								<span style="font-weight:bold;font-size:10pt;">SCHEDULE 8812<br/></span>
								<span style="font-weight:bold;font-size:9pt;">(Form 1040)</span>
							</div>
							<div style="height:8mm;padding-top:.75mm;">
								<span class="styAgency">Department of the Treasury</span><br/>
								<span class="styAgency">Internal Revenue Service</span>
								<span style="padding-left:3mm">(99)</span>
							</div>
						</div>
						<div class="styFTBox" style="width:120mm;height:23mm;">
							<div class="styMainTitle" style="width: 115mm; height: 11mm; text-align: left; padding-left: 0mm; font-size: 17pt;">
								Additional Child Tax Credit
								<div style="width: 35mm; height: 12mm; padding-top: 2mm; padding-left: 8mm;">
									<img src="{$ImagePath}/8812_1040_Top_Forms.png" alt="TopFormImage" height="60" width="90"/>
								</div>
							</div>
							<div class="styFBT" style="width: 120mm; height: 10mm; padding-right: 15mm; padding-bottom: 2px; font-family: Arial; font-size: 8pt;">
									<img src="{$ImagePath}/8812_Bullet_Md.gif" alt="MediumBullet" height="9" width="9"/>
									Attach to Form 1040,1040-SR, or Form 1040-NR.<br/>
								<div style="width: 100mm; height: 5mm;">
									<div style="width: 86mm; height: 8mm; padding-left: 3px; font-family: Arial; font-size: 7pt;">
										<img src="{$ImagePath}/8812_Bullet_Md.gif" alt="MediumBullet" height="9" width="9"/>
										 Go to <i><a style="text-decoration:none;color:black;" href="http://IRS.gov/Schedule8812">www.irs.gov/Schedule8812.</a></i> for instructions and the latest information. 
									</div>
								</div>
							</div>
						</div>
						<div class="styTYBox" style="width:33mm;height:23mm;border-left-width:2px;">
							<div class="styOMB" style="width:33mm; height:4mm;">
								OMB No. 1545-0074
							</div>
							<div class="styTaxYear" style="height:9mm;padding-top:1mm;padding-bottom:0;">
								20<span class="styTYColor">20</span>
							</div>
							<div style="text-align:left;padding-left:3mm;">
								Attachment<br/>Sequence No.<span class="styBoldText">47</span>
							</div>
						</div>
					</div>
					<!-- End Form Number and Name section -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width: 187mm; height: 7mm; clear:left; float: left;">
						<div class="styNameBox" style="width:140mm;height:7mm;font-size:7pt;font-weight:normal;">
							   Name(s) shown on return<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
								</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:45mm;height:7mm;padding-left:2mm;font-size:7pt;font-weight:bold;">
							Your social security number <br/>
								<span style="width:40mm;text-align:center;font-weight:normal;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
									</xsl:call-template>
								</span>
						</div>
					</div>
					<!-- BEGIN Part I Title -->
					<div class="styBB" style="width: 187mm; height: 4.5mm; border-top-width: 1px; clear:left; float: left;">
						<div class="styPartName" style="font-family:Arial;font-size:10pt;">
							Part I
						</div>
						<div class="styPartDesc" style="font-family:Arial;font-size:10pt;">
							All Filers
						</div>
					</div>
					<!-- END Part I  Title -->
					<!-- Caution line -->
					<div class="styBB" style="width: 187mm; height: 4.5mm; border-top-width: 1px; clear:left; float: left;">
						<div style="width: 170mm; height: 14mm;">
								<b>Caution:</b>  If you file Form 2555, <b>stop here;</b> you cannot claim the additional child tax credit.
							</div>
					</div>
					<!--BEGIN-->
								<!-- ####### START of PART I ####### -->
								<!-- BEGIN -->
								<!-- Line 1-->
								<div style="width: 187mm; height: 12mm; clear: left; font-size: 7.5pt; float: left;">
									 <div class="styLNLeftNumBox" style="width: 8mm; height: 46mm; padding-top: 1mm; padding-left: 3mm;">1</div>
									 <div style="width: 141mm; clear: none; float: left; height:46mm">
									    <div class="styLNDesc" style="width: 138mm; height: 46mm;">																									
									        <div class="styLNDesc" style="width: 138mm; height: 8mm;">
									            If you are required to use the worksheet in Pub. 972, enter the amount from line 10 of the Child Tax Credit and
									            Credit for Other Dependents Worksheet in the publication. Otherwise, enter the amount from line 8 of your Child Tax Credit and Credit for Other Dependents Worksheet. (See the instructions for Forms 1040 and 1040-SR, line 19, or the instructions for Form 1040-NR, line 19.)
											</div>
                                        </div>
										   
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 14mm; padding-top: 3mm;">1</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 14mm; padding-top: 3mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/TaxLessCreditsAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="width: 32mm; height: 2mm; padding-top: 10mm; border-bottom-width: 0px; float: right;"/>
									<div class="styLNAmountBox" style="width: 6mm; height: 2mm; padding-top: 10mm; border-bottom-width: 0px; float: right;"/>
								</div>
								<!--END Line 1-->
								<!-- BEGIN -->
								<!-- Line 2 -->
								<div style="width: 187mm; height: 6mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 8mm; padding-top: 2mm; padding-left: 3mm;">2</div>
									<div class="styLNDesc" style="width: 141mm; padding-top: 2mm; height: 8mm;">
										<span style="float:left;clear:none;">Enter the amount from line 19 of your Form 1040, Form 1040-SR, or Form 1040-NR.
										<span class="styDotLn" style="float:right;padding-left:1mm;">...</span></span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 6mm; padding-top: 2mm;border-bottom-width:1px;">2</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 6mm; padding-top: 2mm;border-bottom-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/CTCODCAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- END Line 2 -->
								<!-- BEGIN -->
								<!-- Line 3 -->
								<div style="width: 187mm; height: 4mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 4mm;padding-left: 3mm;">3</div>
									<div class="styLNDesc" style="width:141mm; height:4mm;padding-top:.5mm;">
										<span style="float:left;clear:none;">Subtract line 2 from line 1. If zero, <b>stop here</b>; you cannot claim this credit</span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">.........</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4mm;">3</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 4mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/ACTCBeforeLimitAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- END Line 3 -->
								<!-- Line 4 -->
								<div style="width: 187mm; height: 15mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 4mm;padding-left: 3mm;">4</div>
									<div class="styLNDesc" style="width:141mm; height:7mm;">
										<span style="float:left;clear:none;">Number of qualifying children under 17 with the required social security number: 
										    <span style="width:auto;text-decoration:underline">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form8812Data/QlfyChildUnderAgeSSNCnt"/>
													<xsl:with-param name="BackupName">QlfyChildUnderAgeSSNCnt</xsl:with-param>
												</xsl:call-template></span>
												<span style="padding-left:1mm">X $1,400.</span>
										</span><br/>
										Enter the result. If zero, <b>stop here;</b> you cannot claim this credit
										<span class="styDotLn" style="float:right;padding-right:10mm;">..........</span>
										<span style="width:140mm;"><b>TIP:</b> The number of children you use  for this line
										is the same as the number of children you used for line 1 of the Child Tax Credit and Credit for Other Dependents Worksheets.</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 7mm;padding-top:2.5mm;">4</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 7mm;padding-top:2.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/QlfyChildUnderAgeSSNLimtAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="width: 32mm; height:8mm;border-bottom-width: 0px; float: right;"/>
									<div class="styLNAmountBox" style="width: 6mm; height:8mm;border-bottom-width: 0px; float: right;"/>
								</div>
								<!-- END Line 4 --> 
								<!-- Line 5 -->
								<div style="width: 187mm; height: 4mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 4mm; padding-left: 3mm;">5</div>
									<div class="styLNDesc" style="width:141mm; height:4mm;padding-top:.75mm;">
										<span style="float:left;clear:none;">Enter the <b>smaller</b> of line 3 and line 4</span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">.....................</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4mm;">5</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 4mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/ACTCAfterLimitAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- END Line 5 -->
								<!-- BEGIN -->
								<!-- Line 6a -->
								<div style="width: 187mm; height: 5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBox" style="width: 8mm; height: 5mm; padding-left: 3mm; padding-top: .75mm;">6a </div>
									<div class="styLNDesc" style="width:103mm; height:5mm; padding-top: 1mm;">
										<span style="float:left;clear:none;">Earned income (see instructions)</span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">..........</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 5mm; padding-top: 1mm;">6a </div>
									<div class="styLNAmountBox" style="width: 32mm; height: 5mm; padding-top: 1mm; padding-right: 0.5mm; border-bottom-width: 1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/TotalEarnedIncomeAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="width: 6.2mm; height: 5mm; padding-top: 1.3mm; border-right-width: 1px; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!-- BEGIN -->
								<!-- Line 6b -->
								<div style="width: 187mm; height: 4mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBox" style="width: 8mm; height: 4mm; padding-left: 5mm;">b</div>
									<div class="styLNDesc" style="width: 64.8mm; height: 4mm;">Nontaxable combat pay (see instructions)</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4mm; border-bottom-width: 0mm;"/>
									<div class="styLNRightNumBox" style="width: 32.2mm; height: 4mm; border-bottom-width: 0mm;"/>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4mm; border-bottom-width: 0mm; background-color: lightgrey;"/>
									<div class="styLNAmountBox" style="width: 32mm; height: 4mm; border-bottom-width: 0px;">
									</div>
									<div class="styLNRightNumBox" style="width: 6.2mm; height: 4mm; border-right-width: 1px; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!-- BEGIN -->
								<!-- Line 6b -->
								<div style="width: 187mm; height: 5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBox" style="width: 8mm; height: 5mm; padding-left: 3mm;"/>
									<div style="width: 103mm; height: 5mm; clear: none; float: left;">
										<div class="styLNDesc" style="width: 64.8mm; height: 5mm;">
											
											
										</div>
										<div class="styLNRightNumBox" style="width: 6mm; height: 4mm; border-bottom-width: 1px;">6b</div>
										<div class="styLNAmountBox" style="width: 32.2mm; height: 4mm; padding-right: 0.5mm; border-bottom-width: 1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form8812Data/NontaxableCombatPayAmt"/>
											</xsl:call-template>
										</div>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 5mm; border-bottom-width: 0px; padding-top:0mm;padding-bottom:0mm;background-color: lightgrey;"/>
									<div class="styLNAmountBox" style="height: 5mm; padding-top:0mm;padding-bottom:0mm;border-bottom-width: 0px;"/>
									<div class="styLNRightNumBox" style="width: 6.2mm; height: 5mm; border-right-width: 1px; border-bottom-width: 0px; padding-top:0mm;padding-bottom:0mm;background-color: lightgrey;"/>
								</div>
								<!-- END Line 6 -->
								<!--BEGIN-->
								<!-- Line 7 -->
								<div style="width: 187mm; height: 4mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBox" style="width: 8mm; height: 4mm; padding-left: 3mm;">7</div>
									<div class="styLNDesc" style="width: 62.25mm; height: 4mm;">Is the amount on line 6a more than $2,500?</div>
									<div class="styDotLn" style="width: 40.75mm; padding-right: 0mm; float: left;">..........</div>
									<div class="styLNRightNumBox" style="border-width: 0px 1px; width: 6.25mm; height: 4mm; padding-top:0mm;padding-bottom:0mm;background-color: lightgrey;"/>
									<div class="styLNAmountBox" style="border-width: 0px; width: 31.75mm; height: 6mm;padding-top:0mm;padding-top:0mm;padding-bottom:0mm;padding-bottom:0mm;">
									</div>
									<div class="styLNRightNumBox" style="width: 6.2mm; height: 6mm; border-right-width: 1px; border-bottom-width: 0px; padding-top:0mm;padding-bottom:0mm;background-color: lightgrey;"/>
								</div>
								<!--END line 7 -->
								<!--BEGIN-->
								<!--Line 7 NO CHECK BOX -->
								<div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBox" style="width: 8mm; height: 4.5mm;"/>
									<div class="styLNDesc" style="width: 103mm; height: 4.5mm;">
										<div class="styLNDesc" style="width: 16mm; height: 5mm;">
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form8812Data/EarnedIncmMoreThanSpecifiedInd"/>
											</xsl:call-template>
											<input type="checkbox" alt="EarnedIncomeMoreThanSpecifiedNo" class="styCkbox" name="Checkbox">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="$Form8812Data/EarnedIncmMoreThanSpecifiedInd"/>
													<xsl:with-param name="BackupName">$Form8812DataEarnedIncmMoreThanSpecifiedInd</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:4px"/>
											<label>
												<xsl:call-template name="PopulateLabelNo">
													<xsl:with-param name="TargetNode" select="$Form8812Data/EarnedIncmMoreThanSpecifiedInd"/>
													<xsl:with-param name="BackupName">$Form8812DataEarnedIncmMoreThanSpecifiedInd</xsl:with-param>
												</xsl:call-template>
												<b>No.</b>
											</label>
										</div>
										<div style="width: 62mm; height: 5mm; padding-top: 1.5mm;"> Leave line 7 blank and enter -0- on line 8.</div>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 6.15mm; border-top-width: 0px; border-bottom-width: 0px; padding-top:0mm;padding-bottom:0mm;background-color: lightgrey;"/>
									<div class="styLNAmountBox" style="height: 7mm; border-bottom-width: 0px;">
									</div>
									<div class="styLNRightNumBox" style="width: 6.2mm; height: 7.15mm; border-right-width: 1px; border-bottom-width: 0px; padding-top:0mm;padding-bottom:0mm;background-color: lightgrey;"/>
								</div>
								<!--END line 7  NO CHECKBOX-->
								<!--BEGIN-->
								<!-- Line 7 Yes  CHECKBOX-->
								<div style="width: 187mm; height: 6mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBox" style="width: 8mm; height: 5mm;"/>
									<div class="styLNDesc" style="width: 103mm; height: 6mm;">
										<div class="styLNDesc" style="width: 16mm; height: 5mm; padding-top: 0.75mm;">
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form8812Data/EarnedIncmMoreThanSpecifiedInd"/>
											</xsl:call-template>
											<input type="checkbox" alt="EarnedIncomeMoreThanSpecifiedYes" class="styCkbox" name="Checkbox">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="$Form8812Data/EarnedIncmMoreThanSpecifiedInd"/>
													<xsl:with-param name="BackupName">$Form8812DataEarnedIncmMoreThanSpecifiedInd</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:4px"/>
											<label>
												<xsl:call-template name="PopulateLabelYes">
													<xsl:with-param name="TargetNode" select="$Form8812Data/EarnedIncmMoreThanSpecifiedInd"/>
													<xsl:with-param name="BackupName">$Form8812DataEarnedIncmMoreThanSpecifiedInd</xsl:with-param>
												</xsl:call-template>
												<b>Yes. </b>
											</label>
										</div>
										<div style="width: 87mm; height: 5mm; padding-top: 2mm;"> Subtract $2,500 from the amount on line 6a. Enter the result</div>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 6mm; padding-top: 2mm; padding-bottom: 0mm; border-bottom-width: 1px;">7</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 6mm; padding-top: 2mm; padding-right: 0.5mm; padding-bottom: 0mm; border-bottom-width: 1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetTotalEarnedIncomeAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="width: 6.2mm; height: 6mm; border-right-width: 1px; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!--END of line 7 yes -->
								<!--Line 8 -->
								<div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 5mm; padding-left: 3mm;">8</div>
									<div class="styLNDesc" style="width: 141mm; height: 4.5mm;">
										<span style="float:left;clear:none;">  
				                         	Multiply the amount on line 7 by 15% (0.15) and enter the result
				                        </span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">............</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4.5mm;">8</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!--End of line 8 -->
								<!--Line 8A -->
								<div style="width: 187mm; height: 4mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="height:4mm;"/>
									<div class="styLNDesc" style="width: 141mm; height: 4mm;">
										<b>Next. </b> On line 4, is the amount $4,200 or more?
                                    </div>
									<div class="styLNRightNumBox" style="width: 38mm; height: 4mm; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!--End of line 8A -->
								<!--Line 8A  no1 -->
								<div style="width: 187mm; height: 6.5mm; clear: left; font-size: 6.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="height:6.5mm;"/>
									<div class="styLNDesc" style="width:141mm; height:6.5mm;">
										<div class="styLNDesc" style="width: 16mm; height: 6.5mm;">
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form8812Data/ThreeOrMoreQlfyChildrenInd"/>
											</xsl:call-template>
											<input type="checkbox" alt="ThreeOrMoreQualifyingChildrenNo" class="styCkbox" name="Checkbox">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="$Form8812Data/ThreeOrMoreQlfyChildrenInd"/>
													<xsl:with-param name="BackupName">$Form8812DataThreeOrMoreQlfyChildrenInd</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:4px"/>
											<label>
												<xsl:call-template name="PopulateLabelNo">
													<xsl:with-param name="TargetNode" select="$Form8812Data/ThreeOrMoreQlfyChildrenInd"/>
													<xsl:with-param name="BackupName">$Form8812DataThreeOrMoreQlfyChildrenInd</xsl:with-param>
												</xsl:call-template>
												<b>No.  </b>
											</label>
										</div>
									    <div style="width:125mm;padding-top:1.2mm;">
											If line 8 is zero, <b>stop here;</b> you cannot claim this credit. Otherwise, skip Part II and enter the
											<b>smaller</b> of line 5 or line 8 on line 15.
									    </div>
                                    </div>
									<div class="styLNRightNumBox" style="width: 38mm; height: 6.5mm; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!--End of line 8A  no1 -->
								<!--Line 8A  yes1 -->
								<div style="width: 187mm; height: 8mm; clear: left; font-size: 6.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="height: 8mm;"/>
									<div class="styLNDesc" style="width: 141mm; height: 8mm; padding-right: 2mm;">
										<div class="styLNDesc" style="width: 16mm; height: 8mm;">
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form8812Data/ThreeOrMoreQlfyChildrenInd"/>
											</xsl:call-template>
											<input type="checkbox" alt="ThreeOrMoreQualifyingChildrenYes" class="styCkbox" name="Checkbox">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="$Form8812Data/ThreeOrMoreQlfyChildrenInd"/>
													<xsl:with-param name="BackupName">$Form8812DataThreeOrMoreQlfyChildrenInd</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:4px"/>
											<label>
												<xsl:call-template name="PopulateLabelYes">
													<xsl:with-param name="TargetNode" select="$Form8812Data/ThreeOrMoreQlfyChildrenInd"/>
													<xsl:with-param name="BackupName">$Form8812DataThreeOrMoreQlfyChildrenInd</xsl:with-param>
												</xsl:call-template>
												<b>Yes. </b>
											</label>
										</div>
										<div style="width:123mm;padding-top:0.8mm;">										
												 If line 8 is equal to or more than line 5, skip Part II and enter the amount 
												 from line 5 on line 15. Otherwise, go to line 9.
										</div>
                                    </div>
									<div class="styLNRightNumBox" style="width: 38mm; height: 8mm; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!--End of line 8A  yes1 -->
								<!-- END Part I Title -->
								<!-- BEGIN Part II Title -->
								<div class="styBB" style="width:187mm; border-top-width:1px; clear: left; float: left;">
									<div class="styPartName" style="font-family:Arial;font-size:10pt;">Part II</div>
									<div class="styPartDesc" style="font-family:Arial;font-size:10pt;">Certain Filers Who Have Three or More Qualifying Children</div>
								</div>
								<!-- Line 9 -->
								<div style="width: 187mm; height: 15mm; clear: left; float: left;">
									<div class="styLNLeftNumBox" style="height: 15mm; padding-top: 2.5mm; padding-left: 2.5mm;">9</div>
									<div class="styLNDesc" style="width: 103mm; height: 15mm; padding-top: 2.5mm;">
											Withheld social security, Medicare, and Additional Medicare taxes from <br/>Form(s) W-2, boxes 4 and 6. 
											If married filing jointly, include your spouse’s amounts with yours. If your employer withheld or you paid 
											Additional Medicare Tax or tier 1 RRTA taxes, see instructions
			                               <span class="styDotLn" style="float:none;padding-left:2mm;">.........</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 15mm; padding-top: 11.7mm;">9 </div>
									<div class="styLNAmountBox" style="height: 15mm; padding-top: 11.7mm; border-bottom-width: 1px; padding-right:0.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/FromW2Amt"/>
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="width: 6.2mm; height: 15mm; border-right-width: 1px; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!-- Line 10 -->
								<div style="width: 187mm; height: 10mm; clear: left; float: left;">
									<div class="styLNLeftNumBox" style="height: 10mm; padding-left: 1mm;padding-top:1mm">10</div>
									<div style="width: 103mm; height: 10mm; clear: none; float: left;">
									Enter the total of the amounts from Schedule 1 (Form 1040), line 14, and Schedule 2 (Form 1040), line 5, plus any taxes that you identified using code "UT" and entered on Schedule 2 (Form 1040), line 8
									<span class="styDotLn" style="float:right;padding-right:2mm;">..........</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 10mm; border-bottom-width: 0px;">
										<span style="border-width: 0px 0px 1px; border-style: solid; border-color: black; width: 5.7mm; height: 10mm; padding-top: 6.5mm;">10</span>
									</div>
									<div class="styLNAmountBox" style="height: 10mm; border-bottom-width: 0px;">
										<span style="border-width: 0px 0px 1px; border-style: solid; border-color: black; width: 31.7mm; height: 10mm; padding-top: 6.5mm; padding-right:0.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form8812Data/FromTaxReturnAmt"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6.2mm; height: 45mm; padding-top: 12mm; border-right-width: 1px; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!-- Line 11 -->
								<div style="width: 187mm; height: 3mm; clear: left; float: left;">
									<div class="styLNLeftNumBox" style="height: 3mm; padding-top: 1.5mm; padding-left: 1mm;">11</div>
									<div class="styLNDesc" style="width: 103mm; height: 3mm; padding-top: 1.5mm;">
										<span style="float:left;clear:none;">      
					                          Add lines 9 and 10
				                        </span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">..................</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 5mm; padding-top: 1.5mm;">11</div>
									<div class="styLNAmountBox" style="height: 5mm; padding-top: 1.5mm; padding-right:0.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/CalcFromW2AndReturnAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="width: 6.2mm; height: 4mm; border-right-width: 1px; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!-- Line 12 -->
								<div style="width: 187mm; height: 18mm; clear: left; float: left;">
									<div class="styLNLeftNumBox" style="height: 27mm;padding-top:1mm">12</div>
									<div style="width: 103mm; height: 35mm; clear: none; float: left;">
										<div class="styLNDesc" style="width:100mm;">
											<div class="styLNDesc" style="width: 22mm; height: 8mm;">
												<b>1040 and 1040-SR filers:</b>
											</div>
											<div class="styLNDesc" style="width: 77mm; height: 8mm;">Enter the total of the amounts from Form 1040 or 1040-SR, line 27, and Schedule 3 (Form 1040), line 10.
				                            </div>
											<br/>
											<div class="styLNDesc" style="width: 22mm; height: 9mm;">
												<b>1040-NR filers:</b>
											</div>
											<div class="styLNDesc" style="width: 77mm; height: 9mm; font-size: 7.5pt;">Enter the amount from Schedule 3 (Form 1040), line 10.</div>
										</div>
										<div class="styLNDesc" style="width: 2.8mm; height: 27mm;">
											<img src="{$ImagePath}/8812_Bracket_Lger_1.gif" alt="Curly Bracket Image" width="6" height="60"/>
										</div>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 16mm; padding-top: 12mm;border-bottom-width: 1px; ">12</div>
									<div class="styLNAmountBox" style="height: 16mm; padding-top: 12mm; border-bottom-width: 1px; padding-right:0.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/CalcAmtFromRetPlusTaxWhldAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="width: 6.2mm; height: 16mm; padding-top: 0mm; border-right-width: 1px; border-bottom-width: 0px;">
									</div>
								</div>
								<!--Line 13 -->
								<div style="width: 187mm; height: 5mm; clear: left; float: left;">
									<div class="styLNLeftNumBox" style="height: 5mm; padding-top: 1mm;">13</div>
									<div class="styLNDesc" style="width: 141mm; height: 5mm; padding-top: 1mm;">
										<span style="float:left;clear:none;">Subtract line 12 from line 11. If zero or less, enter -0-</span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:2mm;">.................</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 5mm; padding-top: 1mm;">13</div>
									<div class="styLNAmountBox" style="height: 5mm; padding-top: 1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/CalculatedDifferenceAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!--End of line 13 -->
								<!--Line 14 -->
								<div style="width: 187mm; height: 5mm; clear: left; float: left;">
									<div class="styLNLeftNumBox" style="height: 5mm;padding-top:1mm">14</div>
									<div class="styLNDesc" style="width: 141mm; height: 5mm; padding-top: 1mm;">
										<span style="float:left;clear:none;">Enter the <b>larger </b> of line 8 or line 13</span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:2mm;">.......................</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 5mm; padding-top: 1mm;">14</div>
									<div class="styLNAmountBox" style="height: 5mm; padding-top: 1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/LargerCalcIncomeOrDiffAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!--End of line 14 -->
								<!--Line 14A -->
								<div style="width: 187mm; height: 4mm; clear: left; float: left;">
									<div class="styLNLeftNumBox" style="height: 4mm; padding-top: 0mm;"/>
									<div class="styLNDesc" style="width: 141mm; height: 4mm; padding-top: 0mm;">
										<b>Next, </b>enter the <b>smaller</b> of line 5 or line 14 on line 15.
                                    </div>
									<div class="styLNRightNumBox" style="width: 38mm; height: 4mm; padding-top: 0mm; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!--End of line 14A -->
								<!-- BEGIN Part III Title -->
								<div style="width: 187mm; height: 4.5mm; clear: left; border-top-color: black; border-bottom-color: black; border-top-width: 1px; border-bottom-width: 1px; border-top-style: solid; border-bottom-style: solid; float: left;">
									<div class="styPartName" style="font-family: Arial; font-size: 10pt;">Part III</div>
									<div class="styPartDesc" style="font-family: Arial; font-size: 10pt;">Additional Child Tax Credit</div>
								</div>
								<!-- END Part III Title -->
								<!--Line 15 -->
								<div style="width: 187mm; height: 5mm; clear: left; float: left;">
									<div class="styLNLeftNumBox" style="height: 5mm; padding-top: 1mm;">15</div>
									<div class="styLNDesc" style="width: 141mm; height: 5mm; padding-top: 1mm;">
										<span style="float:left;clear:none;">
											<b>This is your additional child tax credit</b>
										</span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:2mm;">.....................</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 5mm; padding-top: 1mm; border-bottom-width: 1px;">15</div>
									<div class="styLNAmountBox" style="height: 5mm; padding-top: 1mm; border-bottom-width: 1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/AdditionalChildTaxCreditAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styLNDesc" style="width: 187mm; height: 16mm; text-align: right; padding-top: 0mm; clear: left; float: left;">
									<img src="{$ImagePath}/8812_1040_Bottom_Forms.png" alt="1040 Forms" height="55" width="64"/>
									<div class="styLNDesc" style="border-width: 2px; border-style: none dotted dotted none; border-color: black; width: 35mm; height: 12mm; text-align: left; padding-top: 0.5mm; padding-left: 3.5mm; clear: left; font-size: 6pt;float: right;">
										<span style="width: 28.3mm;"><i>Enter this amount on</i></span>
										<br/>
										<span style="width: 28.3mm;"><i>Form 1040, line 28, or</i></span>
										<br/>
										<span style="width: 28.3mm,"><i>Form 1040-SR, line 28, or</i></span>
										<br/>
										<span style="width: 28.3mm;"><i>Form 1040-NR, line 28.</i></span>
									</div>
								</div>
								<div style="width: 187mm; height: 1mm; clear: left; float: left;"/>
								<!--End of line 15 -->
								<!-- capturing the page bottom info -->
								<!--  FOOTER-->
								<div class="pageEnd" style="width: 187mm; height: 4mm; clear: both; font-family: Arial; font-size: 7pt; border-top-color: black; border-top-width: 2px; border-top-style: solid; float: none;">
									<span style="float:left;clear:none;">
										<b>For Paperwork Reduction Act Notice, see your tax return instructions.</b>
										<span style="width:18mm;"/>Cat. No. 59761M</span>
									<span style="float:right;clear:none;font-weight:bold;">Schedule 8812 (Form 1040) 2020</span>
								</div>								
								<!-- Adding page break -->
								<p style="page-break-before: always;"/>
								<div class="styLeftOverTitleLine" id="LeftoverData" style="clear:left; float: left;">
									<div class="styLeftOverTitle">
										Additional Data        
									</div>
									<div class="styLeftOverButtonContainer">
										<input class="styLeftoverTableBtn" tabindex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
									</div>
								</div>
								<table class="styLeftOverTbl" style="clear:left; float: left;">
									<xsl:call-template name="PopulateCommonLeftover">
										<xsl:with-param name="TargetNode" select="$Form8812Data"/>
										<xsl:with-param name="DescWidth" select="100"/>
									</xsl:call-template>
								</table>
								<!-- END Additional Data Left Over Table -->
					<!-- END Additional Data Left Over Table -->
			</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="OrdinalNumber">
		<xsl:param name="number" select="position()"/>
		<xsl:choose>
			<xsl:when test="$number = 1">first</xsl:when>
			<xsl:when test="$number = 2">second</xsl:when>
			<xsl:when test="$number = 3">third</xsl:when>
			<xsl:when test="$number = 4">fourth</xsl:when>
			<xsl:when test="$number mod 10 = 1 and $number != 11">
				<xsl:value-of select="$number"/>st</xsl:when>
			<xsl:when test="$number mod 10 = 2 and $number != 12">
				<xsl:value-of select="$number"/>nd</xsl:when>
			<xsl:when test="$number mod 10 = 3 and $number != 13">
				<xsl:value-of select="$number"/>rd</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$number"/>th</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="PopulateInlineAdditionalDataTableMessage">
    <xsl:param name="TargetNode"/>
    <xsl:param name="ShortMessage">false</xsl:param>

    <!-- If the Print parameter is set to 'inline' and the element > 4 nodes, the message will be displayed-->
    <xsl:if test="($Print = 'inline') and (count($TargetNode) &gt; 4)">
      <xsl:choose>
        <xsl:when test="$ShortMessage= 'true' ">See Add'l Data</xsl:when>
        <xsl:otherwise>See Additional Data Table Below</xsl:otherwise>
      </xsl:choose>
    </xsl:if>
</xsl:template>
</xsl:stylesheet>
