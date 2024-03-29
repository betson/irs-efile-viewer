<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS2210FStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form2210FData" select="$RtnDoc/IRS2210F"/>
	<xsl:template match="/">
		<html lang="EN-US">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form2210FData)"/>
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
				<meta name="Description" content="IRS Form 2210"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
				<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS2210FStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form2210F">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;">
		<div class="styFNBox" style="width:38mm;height:20mm;padding:bottom:0mm;">
                         Form<span style="width:1mm;"></span>
                            <span class="styFormNumber">2210-F</span>
                            <br/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form2210FData"/>
								</xsl:call-template>
							<div class="styAgency" style="padding-top:0mm;height:0mm;padding:bottom:0mm;">Department of the Treasury<br/>
						Internal Revenue Service 
                            </div>
						</div>
		<div class="styFTBox" style="width:110mm;height:20mm;">           
			<div class="styMainTitle" style="height:5mm;padding:bottom:0mm;">
				Underpayment of Estimated Tax by<br/>Farmers and Fishermen
			</div>
			<div class="styFBT" stype="font-size:7pt;height:5mm;padding-top:1mm;">
				<img src="{$ImagePath}/2210_Bullet.gif" alt="MediumBullet"/>  Attach to Form 1040, Form 1040NR, or Form 1041.<br/>
				<img src="{$ImagePath}/2210_Bullet.gif" alt="MediumBullet"/> See separate instructions.
			</div>
		</div>
	<div class="styTYBox" style="width:38mm; height:20mm">
							<div style="padding-top:0mm;border-bottom:1 solid black;font:6pt;">OMB No. 1545-0140</div>
							<div>
								<span class="styTaxYear" style="font-size:21pt;">20<span class="styTYColor">11</span></span>
							</div>
							<div class="stySequence">Attachment<br/>Sequence No. <b style="font-size:8pt">06A</b>
							</div>
						</div>
					</div>
					<!-- Name(s) shown on return -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:140mm; height:8mm">
                    Name(s) shown on tax return<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name"/>
							</xsl:call-template>
							<br/>
							<div style="line-height:100%; font-family:verdana;font-size:7pt"/>
						</div>
                            <b> Identifying number</b><br/>
						<span style="width:100%;text-align:center;">
							<xsl:call-template name="PopulateSSN">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  start instructions -->
					<div style="width:187mm;border-bottom:1px solid black;padding bottom:1mm;">
						<b>Generally, you do not need to file Form 2210-F.</b> The IRS will figure any penalty you owe and send you a bill. File Form2210-F only if one or more of the boxes in Part I apply to you. If you do not need to file Form 2210-F, you still can use it to figure your penalty. Enter the amount from line 16 on the penalty line of your return, but do not attach Form 2210-F.
					</div>
					<!-- Part I -->
					<!-- Part I - Header -->
					<div style="width:187mm;height:0mm;border-style:solid; border-bottom-width:1px;border-top-width:0px;
          border-right-width:0px;border-left-width:0px;">
						<span class="styPartName" style="height:1mm;width:15mm;font-size:13;">Part l</span>
						<div class="styPartDesc" style="width:167mm;font-weight:normal;" >
							<span style="width:3mm;font-size:10pt;height:0mm;vertical-align:top;"/>
							<b>Reasons for Filing.</b>  Check applicable boxes.  If none apply, <b>do not file Form 2210-F.</b>
						</div>
					</div>
					<!-- End Part I Header -->
					<!-- Part I body -->
					<div  style="width:187mm;height:0mm;border-style:solid; border-bottom-width:1px;border-top-width:0px;
          border-right-width:0px;border-left-width:0px;">
						<!-- Line A -->
						<div style="width:187mm;padding-top:1mm;height:7mm;">
							<div class="styLNLeftLtrBox" style="font-size:7pt;height:5mm;aligh-text:top;padding-top:0mm; padding-left: 2.25mm">A
                            </div>
							<input type="checkbox" alt="alt" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form2210FData/PenaltyWaiverRequestInd"/>
									<xsl:with-param name="BackupName">IRS2210FPenaltyWaiverRequestInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form2210FData/PenaltyWaiverRequestInd" />
								</xsl:call-template>
								You request a <b>waiver.</b> In certain circumstances, the IRS will waive all or part of the penalty. See Waiver of Penalty in the instructions.
                            </label>
						</div>
						<!-- Line B -->
						<div style="width:187mm;padding-top:0mm;height:7mm;">
							<div class="styLNLeftLtrBox" style="font-size:7pt;height:5mm;aligh-text:top; padding-top:0mm; padding-left: 2.25mm">B
                            </div>
							<input type="checkbox" alt="alt" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form2210FData/JointReturnInd"/>
									<xsl:with-param name="BackupName">IRS2210FJointReturnInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form2210FData/JointReturnInd"/>
									<xsl:with-param name="BackupName">IRS2210FJointReturnInd</xsl:with-param>
								</xsl:call-template>
								You filed or are filing a joint return for either 2010 or 2011, but not for both years, and line 10 below is smaller than line 7 below.
                            </label>
						</div>
					</div>
					<!-- Part lI -->
					<!-- Part II - Header -->
					<div style="width:187mm;height:0mm;border-style:solid; border-bottom-width:1px;border-top-width:0px;
          border-right-width:0px;border-left-width:0px;float:left;padding-top:0mm;font-family:arial;">
						<span class="styPartName" style="height:1mm;width:15mm;font-size:13;">Part II</span>
						<span style="width:167mm;font-weight:normal;" class="styPartDesc">
							<span style="width:3mm;font-size:10pt;height:0mm;vertical-align:top;"/>
							<b>Figure Your Underpayment</b>
						</span>
					</div>
					<!-- End Part II Header -->
					<!-- Part II body -->
					<div  style="width:187mm;border-bottom:1px solid black;float:left;">
					<!-- Line 1 -->
					<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">1
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
							   Enter your 2011 tax after credits from Form 1040, line 55; Form 1040NR, line 52; or Form 1041,
                            </div>
							<div class="styLNRightNumBox" style="height:4mm; padding-bottom:0mm; border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:0px;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">
									 Schedule G, line 4
								</span>
								<span class="styIRS2210DotLn">............................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm; border-bottom-width:1px;">1</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210FData/CurrentYearTaxAfterCreditsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 2 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">2
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Other taxes, including self-employment tax (see instructions)</span>
								<span class="styIRS2210DotLn">..............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">2</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210FData/OtherTaxesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 3 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">3
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Add lines 1 and 2. If less than $1,000, you do not owe a penalty; <b>do not file Form 2210-F</b></span>
								<span class="styIRS2210DotLn">.....</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">3</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210FData/TotalTaxAfterCrAndOtherTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 4 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:3mm;padding-bottom:0mm;padding-left: 2.25mm">4
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:3mm;padding-bottom:0mm;">
							   Refundable credits you claimed on your tax return. 
                            </div>
							<div class="styLNRightNumBox" style="height:3mm;background-color: lightgrey; padding-bottom:0mm; border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="width:36mm;height:3mm;padding-bottom:0mm;border-bottom-width:0px;"/>
						</div>
						<!-- Line4a -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-left:4mm;">a
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:91.1mm;height:4mm;">
								<span style="float:left">Earned income credit (EIC)</span>
								<!--Dotted Line-->
								<span class="styIRS2210DotLn">..............</span>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:4mm;">4a
                            </div>
							<div class="styLNAmountBox" style="width:35.91mm;height:4mm;border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210FData/EarnedIncomeCreditAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;background-color:lightgrey;border-bottom:none;height:4.5mm;"/>
							<div style="float:left;clear;none;border-left:1px solid black;width:35.9mm;height:4.5mm;"/>
						</div>
						<!-- Line4b -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-left:4mm;">b
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:91.1mm;height:4mm;">
								<span style="float:left">Additional child tax credit</span>
								<!--Dotted Line-->
								<span class="styIRS2210DotLn">...............</span>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:4mm;">4b
                            </div>
							<div class="styLNAmountBox" style="width:35.91mm;height:4mm;border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210FData/AdditionalChildTaxCreditAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;background-color:lightgrey;border-bottom:none;height:4.5mm;"/>
							<div style="float:left;clear;none;border-left:1px solid black;width:35.9mm;height:4.5mm;"/>
						</div>
						<!-- Line4c -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-left:4mm;">c
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:91.1mm;height:4mm;">
								<span style="float:left">American opportunity credit (Form 8863, line 14)</span>
								<!--Dotted Line-->
								<span class="styIRS2210DotLn">.......</span>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:4mm;">4c
                            </div>
							<div class="styLNAmountBox" style="width:35.91mm;height:4mm;border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210FData/RefundableAmerOppCreditAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;background-color:lightgrey;border-bottom:none;height:4.5mm;"/>
							<div style="float:left;clear;none;border-left:1px solid black;width:35.9mm;height:4.5mm;"/>
						</div>
						<!-- Line4d -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-left:4mm;">d
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:91.1mm;height:4mm;">
								<span style="float:left">First-time homebuyer credit (Form 5405, line 10)</span>
								<!--Dotted Line-->
								<span class="styIRS2210DotLn">.......</span>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:4mm;">4d
                            </div>
							<div class="styLNAmountBox" style="width:35.91mm;height:4mm;border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210FData/FirstTimeHmByrCreditAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;background-color:lightgrey;border-bottom:none;height:4.5mm;"/>
							<div style="float:left;clear;none;border-left:1px solid black;width:35.9mm;height:4.5mm;"/>
						</div>
						<!-- Line4e-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-left:4mm;">e
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:91.1mm;height:4mm;">
								<span style="float:left">Credit for federal tax paid on fuels</span>
								<!--Dotted Line-->
								<span class="styIRS2210DotLn">............</span>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:4mm;">4e
                            </div>
							<div class="styLNAmountBox" style="width:35.91mm;height:4mm;border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210FData/FuelTaxCreditAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;background-color:lightgrey;border-bottom:none;height:4.5mm;"/>
							<div style="float:left;clear;none;border-left:1px solid black;width:35.9mm;height:4.5mm;"/>
						</div>
						<!-- Line4f -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-left:4mm;">f
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:91.1mm;height:4mm;">
								<span style="float:left">Adoption credit</span>
								<!--Dotted Line-->
								<span class="styIRS2210DotLn">..................</span>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:4mm;">4f
                            </div>
							<div class="styLNAmountBox" style="width:35.91mm;height:4mm;border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210FData/AdoptionCreditAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;background-color:lightgrey;border-bottom:none;height:4.5mm;"/>
							<div style="float:left;clear;none;border-left:1px solid black;width:35.9mm;height:4.5mm;"/>
						</div>
						<!-- Line4g -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-left:4mm;">g
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:91.1mm;height:4mm;">
								<span style="float:left">Refundable credit for prior year minimum tax (Form 8801, line 27)</span>
								<!--Dotted Line-->
								<span class="styIRS2210DotLn">.</span>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:4mm;">4g
                            </div>
							<div class="styLNAmountBox" style="width:35.91mm;height:4mm;border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210FData/RefundableCrForPriorYearAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;background-color:lightgrey;border-bottom:none;height:4.5mm;"/>
							<div style="float:left;clear;none;border-left:1px solid black;width:35.9mm;height:4.5mm;"/>
						</div>
						<!-- Line4h -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-left:4mm;">h
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:91.1mm;height:4mm;">
								<span style="float:left">Health coverage tax credit</span>
								<!--Dotted Line-->
								<span class="styIRS2210DotLn">..............</span>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:4mm;">4h
                            </div>
							<div class="styLNAmountBox" style="width:35.91mm;height:4mm;border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210FData/HealthCoverageTaxCreditAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;background-color:lightgrey;border-bottom:none;height:4.5mm;"/>
							<div style="float:left;clear;none;border-left:1px solid black;width:35.9mm;height:4.5mm;"/>
						</div>
						<!-- Line4i -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-left:4mm;">i
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:91.1mm;height:4mm;">
								<span style="float:left">Credit determined under section 1341(a)(5)(B) (see instructions)</span>
								<!--Dotted Line-->
								<span class="styIRS2210DotLn">.</span>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:4mm;">4i
                            </div>
							<div class="styLNAmountBox" style="width:35.91mm;height:4mm;border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210FData/Section1341a5BCreditAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;background-color:lightgrey;border-bottom:none;height:4.5mm;"/>
							<div style="float:left;clear;none;border-left:1px solid black;width:35.9mm;height:4.5mm;"/>
						</div>
						<!-- Line 5 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">5
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Add lines 4a through 4i</span>
								<span class="styIRS2210DotLn">..........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">5</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210FData/FarmOrFishermanCrSubtotalAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 6 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">6
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
							   Current year tax. Subtract line 5 from line 3. If less than $1,000, you do not owe a penalty; <b>do</b>
                            </div>
							<div class="styLNRightNumBox" style="height:4mm; padding-bottom:0mm; border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:0px;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">
									 <b>not file Form 2210-F</b>
								</span>
								<span class="styIRS2210DotLn">..........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm; border-bottom-width:1px;">6</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210FData/CurrentYearTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line7 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-left:2.5mm;">7
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:91.1mm;height:4mm;">
								<span style="float:left">Multiply line 6 by 66 2/3% (.667)</span>
								<!--Dotted Line-->
								<span class="styIRS2210DotLn">............</span>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;height:4mm;">7
                            </div>
							<div class="styLNAmountBox" style="width:35.91mm;height:4mm;border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210FData/CurrentYearTaxCalculatedAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="font-size:7pt;background-color:lightgrey;border-bottom:none;height:4.5mm;"/>
							<div style="float:left;clear;none;border-left:1px solid black;width:35.9mm;height:4.5mm;"/>
						</div>
						<!-- Line 8 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">8
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Withholding taxes. <b>Do not</b> include any estimated tax payments on this line (see instructions)</span>
								<span class="styIRS2210DotLn">....</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">8</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210FData/WithholdingTaxesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 9 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">9
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Subtract line 8 from line 6. If less than $1,000, you do not owe a penalty; <b>do not file Form 2210-F</b></span>
								<span class="styIRS2210DotLn">..</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">9</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210FData/NetTaxDueAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 10 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">10
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
							   Enter the tax shown on your 2010 tax return (see instructions if your 2011 filing status changed to
                            </div>
							<div class="styLNRightNumBox" style="height:4mm; padding-bottom:0mm; border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:0px;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">
									 or from married filing jointly)
								</span>
								<span class="styIRS2210DotLn">........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm; border-bottom-width:1px;">10</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210FData/PriorYearTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 11 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">11
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left"><b>Required annual payment.</b> Enter the <b>smaller</b> of line 7 or line 10</span>
								<span class="styIRS2210DotLn">.............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">11</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210FData/RequiredAnnualPaymentAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Note -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:3mm;padding-bottom:0mm;padding-left: 2.25mm">
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:3mm;padding-bottom:0mm;">
							   <b>Note:</b> If line 8 is equal to or more than line 11, stop here; you do not owe the penalty. <b>Do not file</b>
                            </div>
							<div class="styLNRightNumBox" style="height:3mm;background-color: lightgrey; padding-bottom:0mm; border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="width:36mm;height:3mm;padding-bottom:0mm;border-bottom-width:0px;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:3mm;padding-bottom:0mm;padding-left: 2.25mm">
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:3mm;padding-bottom:0mm;">
							   <b>Form 2210-F</b> unless you checked box <b>B</b> above.
                            </div>
							<div class="styLNRightNumBox" style="height:3mm;background-color: lightgrey; padding-bottom:0mm; border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="width:36mm;height:3mm;padding-bottom:0mm;border-bottom-width:0px;"/>
						</div>
						<!-- Line 12 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:3mm;padding-bottom:0mm;padding-left: 2.25mm">12
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:3mm;padding-bottom:0mm;">
							   Enter the estimated tax payments you made by January 16, 2012, and any federal income tax
                            </div>
							<div class="styLNRightNumBox" style="height:3mm;background-color: lightgrey; padding-bottom:0mm; border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="width:36mm;height:3mm;padding-bottom:0mm;border-bottom-width:0px;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">
									and excess social security or tier 1 railroad retirement tax withheld during 2011
								</span>
								<span class="styIRS2210DotLn">........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm; border-bottom-width:1px;">12</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210FData/EstTaxPaymentsAndOtherTaxesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 13 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">13
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
							   <b>Underpayment.</b> Subtract line 12 from line 11. If the result is zero or less, stop here; you do not
                            </div>
							<div class="styLNRightNumBox" style="height:4mm; padding-bottom:0mm; border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:0px;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">
									 owe the penalty. <b>Do not file Form 2210-F</b> unless you checked box <b>B</b> above
								</span>
								<span class="styIRS2210DotLn">..........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm; border-bottom:none">13</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:none;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210FData/UnderpaymentAmt"/>
								</xsl:call-template>
							</div>
						</div>

					</div>
					<!-- Part lll -->
					<!-- Part Ill - Header -->
<div style="width:187mm;height:4mm;border-style:solid; border-bottom-width:1px;border-top-width:0px;
          border-right-width:0px;border-left-width:0px;float:left;">
						<span class="styPartName" style="height:4mm;width:18mm;font-size:13;">Part lll</span>
						<span style="width:167mm;font-weight:normal;" class="styPartDesc">
							<span style="width:3mm;font-size:10pt;height:4mm;vertical-align:center;"/>
							<b>Figure the Penalty</b>
						</span>
					</div>
					<!-- END Part lll Header-->
					<div class="styBB" style="width:187mm;border-bottom:1px solid black;">	
						<!-- Spacer Row -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-left: 2.25mm"/>
                        	<div class="styLNDesc" style="font-size:7pt;width:135mm;height:5mm;"/>
							<div class="styLNRightNumBox" style="height:5mm;border-bottom:none;"></div>
							<div class="styLNAmountBox" style="width:36mm;height:5mm;border-bottom:none;"/>
						</div>
						<!-- Line 14 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-bottom:0mm;padding-left: 2.25mm">14
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Enter the date the amount on line 13 was paid or April 15, 2012, whichever is earlier</span>
								<span class="styIRS2210DotLn">......</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;padding-bottom:0mm;bottom-border-width:1px;">14</div>
							<div class="styLNAmountBox" style="width:36mm;height:5mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateMonth">
									<xsl:with-param name="TargetNode" select="$Form2210FData/EarlierOfPaymentOrTaxDueDt"/>
								</xsl:call-template>-<xsl:call-template name="PopulateDay">
									<xsl:with-param name="TargetNode" select="$Form2210FData/EarlierOfPaymentOrTaxDueDt"/>
								</xsl:call-template>-<xsl:call-template name="PopulateYear">
									<xsl:with-param name="TargetNode" select="$Form2210FData/EarlierOfPaymentOrTaxDueDt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Spacer Row -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-left: 2.25mm"/>
                        	<div class="styLNDesc" style="font-size:7pt;width:135mm;height:5mm;"/>
							<div class="styLNRightNumBox" style="height:5mm;border-bottom:none;"></div>
							<div class="styLNAmountBox" style="width:36mm;height:5mm;border-bottom:none;"/>
						</div>
						<!-- Line 15 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-bottom:0mm;padding-left: 2.25mm">15
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Number of days <b>from</b> January 15, 2012, <b>to</b> the date on line 14</span>
								<span class="styIRS2210DotLn">.............</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;padding-bottom:0mm;bottom-border-width:1px;">15</div>
							<div class="styLNAmountBox" style="width:36mm;height:5mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2210FData/PenaltyDayCnt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Spacer Row -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-left: 2.25mm"/>
                        	<div class="styLNDesc" style="font-size:7pt;width:135mm;height:5mm;"/>
							<div class="styLNRightNumBox" style="height:5mm;border-bottom:none;"></div>
							<div class="styLNAmountBox" style="width:36mm;height:5mm;border-bottom:none;"/>
						</div>
						<!-- Line 16 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-bottom:0mm;padding-left: 2.25mm">16
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;padding-bottom:0mm;">
								<b style="float:left;">Penalty.</b>
								<div style="height:4mm;text-align:center;vertical-align:super;float:left;margin:0mm 5mm;">
									Underpayment<br/>
									on line 13
								</div>
								<div style="float:left;">x</div>
								<div style="height:4mm;text-align:center;vertical-align:super;float:left;margin:0mm 5mm;">
									<span style="text-decoration:underline;">Number of days on line 15</span><br/>
									365
								</div>
								<div style="height:4mm;float:left;">x </div>
								<div style="height:4mm;float:left;margin-left:5mm">.XX</div>
								<div style="height:4mm;float:left;margin-left:1mm">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form2210FData/PenaltyAmt"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Penalty Waiver Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form2210FData/PenaltyAmt/@requestedPenaltyWaiverAmt"/>
									</xsl:call-template>
								</div>
								<div class="styIRS2210DotLn" style="margin-left:2mm;">......</div>
								<div style="padding-left:1.2mm;float:right">
									<img src="{$ImagePath}/2210_Bullet.gif" alt="MediumBullet"></img>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-bottom:0mm;bottom-border-width:1px;">16</div>
							<div class="styLNAmountBox" style="width:36mm;height:8mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2210FData/PenaltyAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Spacer Row -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-left: 2.25mm"/>
                        	<div class="styLNDesc" style="font-size:7pt;width:135mm;height:5mm;"/>
							<div class="styLNRightNumBox" style="height:5mm;border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="width:36mm;height:5mm;border-bottom:none;border-left:none;background-color:lightgrey;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-left: 2.25mm"/>
                        	<div class="styLNDesc" style="font-size:7pt;width:135mm;height:5mm;"><li>Form 1040 filers, enter the amount from line 16 on Form 1040, line 77.</li></div>
							<div class="styLNRightNumBox" style="height:5mm;border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="width:36mm;height:5mm;border-bottom:none;border-left:none;background-color:lightgrey;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-left: 2.25mm"/>
                        	<div class="styLNDesc" style="font-size:7pt;width:135mm;height:5mm;"><li>Form 1040NR filers, enter the amount from line 16 on Form 1040NR, line 73.</li></div>
							<div class="styLNRightNumBox" style="height:5mm;border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="width:36mm;height:5mm;border-bottom:none;border-left:none;background-color:lightgrey;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-left: 2.25mm"/>
                        	<div class="styLNDesc" style="font-size:7pt;width:135mm;height:5mm;"><li>Form 1041 filers, enter the amount from line 16 on Form 1041, line 26.</li></div>
							<div class="styLNRightNumBox" style="height:5mm;border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="width:36mm;height:5mm;border-bottom:none;border-left:none;background-color:lightgrey;"/>
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:0mm;">
						<div style="float:left;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see instructions.</span>
						</div>
						<div style="float:right;">
							  Cat. No. 11745A
							   <span style="width:25mm;"/>  
							  Form <span class="styBoldText" style="font-size:8pt;">2210-F</span> (2011)
                           </div>
					</div>
					<!-- END Page Break and Footer-->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form2210FData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="TargetNode" select="$Form2210FData/PenaltyAmt/@requestedPenaltyWaiverAmt"/>
							<xsl:with-param name="Desc">Line 16 - Penalty Waiver Amount</xsl:with-param>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- Additional Data Table -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
