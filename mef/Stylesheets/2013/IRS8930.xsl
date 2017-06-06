<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8930Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8930"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<META http-equiv="Content-Type" content="text/html"/>
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
				<meta name="Description" content="IRS Form 8930"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8930Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form8930">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styTBB" style="width:183mm;height:23mm;">
						<div class="styFNBox" style="width:32mm;height:23mm;">
							<div style="padding-top:1mm;">
            Form <span class="styFormNumber">8930<br/>
								</span>
							</div>
							<!-- Extra Data Line -->
							<span style="width:0px;"/>
							<div style="padding-top:1mm;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:114mm;height:23mm;">
							<div style="padding-top:2mm;" class="styMainTitle">
							Qualified Disaster Recovery Assistance<br/>
							Retirement Plan Distributions and Repayments
							</div>
							<div class="styFBT" style="height:4mm;">
								<img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" /> Attach to Form 1040, Form 1040A, or Form 1040NR.<br/>
							</div>
						</div>
						<div class="styTYBox" style="width:36mm;height:23mm;">
							<div class="styOMB" style="height:2mm;">OMB No. 1545-0074</div>
							<div class="styTY" style="height:7mm;font-size:22pt;">20<span class="styTYColor">13</span></div>
							<div class="stySequence" style="height:9mm;border-bottom-width:0px;padding-left:4mm;border-left-width:0px;">
								Attachment<br/>
								Sequence No. <span class="styBoldText">164</span>
							</div>
						</div>
					</div>
					<!--Name Line -->
					<div class="styBB" style="width:183mm;">
						<div class="styNameBox" style="width:135mm;height:8mm;font-size:7pt;font-weight:normal;">
							Name. If married, file a separate form for each spouse required to file Form 8930. See instructions.<br/>
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="$FormData/QlfyDsstrQualifiedTaxpayerName"/>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:48mm;height:8mm;padding-left:2mm;font-size:7pt;font-weight:bold;">
							Your social security number<br/>
							<span style="width: 40mm; text-align: center;font-weight:normal;">
								<xsl:call-template name="PopulateSSN">
								 <xsl:with-param name="TargetNode" select="$FormData/QlfyDsstrQualifiedTaxpayerSSN"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<div class="styBB" style="width:183mm;height:100%">
						<div style="float:left;width:40mm;border-right:1px solid black;font-size:7pt;font-weight:bold;height:20mm">
							<img alt="right arrow" src="{$ImagePath}/8930_lg_right_arrow.gif" style="float:right;margin:1mm;"/>
							Fill in Your Address Only<br/>
							If You are Filing This<br/>
							Form by Itself and Not<br/>
							With Your Tax Return
						</div>
						<div style="height:100%;float:left;">
							<div class="styNameBox" style="width:115mm;height:100%;font-size:7pt;font-weight:normal;border-bottom:1px solid black;padding-left:1mm;">
								Home address (number and street, or P.O. box if mail is not delivered to your home)<br/>
									<xsl:if test="$RtnHdrData/Filer/USAddress">
										<xsl:call-template name="PopulateText">
										  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1"/>
										  <xsl:with-param name="BackupName">$RtnHdrDataFilerUSAdressAddressLine1</xsl:with-param>
										</xsl:call-template>
										<xsl:if test="$RtnHdrData/Filer/USAddress/AddressLine2">
											<br/>
											<xsl:call-template name="PopulateText">
											  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine2"/>
											  <xsl:with-param name="BackupName">$RtnHdrDataFilerUSAdressAddressLine2</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</xsl:if>
									<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
										<xsl:call-template name="PopulateText">
										  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1"/>
										  <xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAdressAddressLine1</xsl:with-param>
										</xsl:call-template>
										<xsl:if test="$RtnHdrData/Filer/ForeignAddress/AddressLine2">
											<br/>
											<xsl:call-template name="PopulateText">
											  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine2"/>
											  <xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAdressAddressLine2</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</xsl:if>
							</div>
							<div class="styNameBox" style="width:27mm;height:100%;font-size:7pt;font-weight:normal;border-right:none;padding-left:1mm;border-bottom:1px solid black;">
								Apt. no.<br/>
							</div>
						</div>
						<div class="styNameBox" style="width:142mm;height:9.5mm;font-size:7pt;font-weight:normal;padding-left:1mm;border-right:none;">
							City, town or post office, state, and ZIP code<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
							</xsl:call-template>
							<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
								<span style="width:7px;"/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">Country</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<!-- BEGIN PART I TITLE -->
					<div class="styGenericDiv" style="width:183mm;border-bottom:1px solid black;padding:1mm 0mm;">
						<div class="styPartName" style="font-family:sans-serif;width:11mm">Part I</div>
						<div class="styPartDesc">Qualified Disaster Recovery Assistance Distributions From Retirement Plans (Other Than IRAs)</div>
					</div>
					<!-- END PART I TITLE -->
					<!-- Line 1 -->
					<div style="width:187mm;height:4.5mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:1mm;width:5mm;">1</div>
						<div class="styLNDesc" style="height:4.5mm;width:82mm;">
						Enter the amount, if any, from your 2011 Form 8930, line 6
						<span style="letter-spacing:3mm;font-weight:bold;"> .</span>
						</div>
						<div style="float:left;">
							<div style="height:4.5mm;width:8mm;text-align:center;font-weight:bold;border-bottom:1px solid black;border-left:1px solid black;">1</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:4.5mm;width:40mm;position:relative;padding-right:1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyDsstrPYSumNetAndRepymtAmt" />
									</xsl:call-template>
							</div>
						</div>
						<div style="float:left;">
								<div style="height:4.5mm;width:8.2mm;text-align:center;font-weight:bold;border-right:1px solid black;border-left:1px solid black;background-color:lightgrey;"/>
						</div>
					</div>
					<!-- Line 2 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:1mm;width:5mm;">2</div>
						<div class="styLNDesc" style="height:4.5mm;width:82mm;">
							Enter the amount, if any, from your 2011 Form 8930, line 1
							<span style="letter-spacing:3mm;font-weight:bold;">.</span>
						</div>
						<div style="float:left;">
							<div style="height:4.5mm;width:8mm;text-align:center;font-weight:bold;border-bottom:1px solid black;border-left:1px solid black;">2</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:4.5mm;width:40mm;position:relative;padding-right:1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyDsstrPYSmDistriRtrPlnTxAmt" />
									</xsl:call-template>
							</div>
						</div>
						<div style="float:left;">
								<div style="height:4.5mm;width:8.2mm;text-align:center;font-weight:bold;border-right:1px solid black;border-left:1px solid black;background-color:lightgrey;"/>
						</div>
					</div>
					<!-- Line 3 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:1mm;width:5mm;">3</div>
						<div class="styLNDesc" style="height:4.5mm;width:130mm;">
							<span style="float:left;">Subtract line 2 from line 1. If zero or less, enter -0-</span>
							<span style="letter-spacing:3mm;font-weight:bold;float:right;padding-right:3mm;"> ................</span>
						</div>
						<div style="float:left;">
							<div style="height:4.5mm;width:8mm;text-align:center;font-weight:bold;border-bottom:1px solid black;border-left:1px solid black;">3</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:4.5mm;width:38mm;position:relative;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QlfyDsstrPYNetTxblRepymtAmt" />
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 4 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;padding-left:1mm;width:5mm;">4</div>
						<div class="styLNDesc" style="height:8mm;width:130mm;">
							Enter the total amount of any repayments you made in 2012. But do not include repayments <br/>
							made on or before the due date (including extensions) for filing your 2011 tax return. See<br/>
							<span style="float:left;">instructions</span>
							<span style="letter-spacing:3mm;font-weight:bold;float:right;padding-right:3mm;"> .............................</span>
						</div>
						<div style="float:left;">
							<div style="width:8mm;border-left:1px solid black;background-color:lightgrey;"><br/><span style="width:0px"/></div>
							<div style="height:4.4mm;width:8mm;text-align:center;font-weight:bold;border-bottom:1px solid black;border-left:1px solid black;">4</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:4mm;width:38mm;position:relative;"><br/><br/>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QlfyDsstrTotalRepaymentsAmt" />
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 5 -->
					<div style="width:187mm;height:8mm;">
						<div class="styLNLeftNumBox" style="height:8mm;padding-left:1mm;width:5mm;">5</div>
						<div class="styLNDesc" style="height:8mm;width:130mm;">
						Add lines 3 and 4. This amount can be carried back to reduce the amount subject to tax in a <br/>
						<span style="float:left;">prior year. See instructions</span>
						<span style="letter-spacing:3mm;font-weight:bold;float:right;padding-right:3mm;">........................</span>
						</div>
						<div style="float:left;">
							<div style="height:4.5mm;width:8mm;border-left:1px solid black;background-color:lightgrey;"/>
							<div style="height:4.5mm;width:8mm;text-align:center;font-weight:bold;border-left:1px solid black;">5</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:4.5mm;width:38mm;border-bottom:none;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:38mm;position:relative;border-bottom:none;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QlfyDsstrDistriSubjectToTaxAmt" />
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- BEGIN PART II TITLE -->
					<div class="styGenericDiv" style="width:183mm;padding:1mm 0mm;border-top:1px solid black;border-bottom:1px solid black">
						<span class="styPartName" style="width:11mm;font-family:sans-serif;">Part II</span>
						<span class="styPartDesc" style="font-size:7.5pt;">Qualified Disaster Recovery Assistance Distributions From Traditional, SEP, SIMPLE, and Roth IRAs</span>
					</div>
					<!-- END PART II TITLE  -->
					<!-- Line 6 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:1mm;width:5mm;">6</div>
						<div class="styLNDesc" style="height:4mm;width:82mm;">
							Enter the amount, if any, from your 2011 Form 8930, line 13
						</div>
						<div style="float:left;">
							<div style="height:4.5mm;width:8mm;text-align:center;font-weight:bold;border-bottom:1px solid black;border-left:1px solid black;">6</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:4.5mm;width:40mm;position:relative;padding-right:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QlfyDsstrPYIRASEPSmNetRpymtAmt" />
								</xsl:call-template>
							</div>
						</div>
						<div style="float:left;">
							<div style="height:4.5mm;width:8mm;text-align:center;font-weight:bold;border-left:1px solid black;background-color:lightgrey;"/>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:4.5mm;width:40mm;position:relative;border-bottom:none;"/>
						</div>
					</div>
					<!-- Spacer Row -->
<!--					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:1mm;width:5mm;"/>
						<div class="styLNDesc" style="height:4mm;width:82mm;"/>
						<div style="float:left;">
							<div style="height:4.5mm;width:8mm;text-align:center;font-weight:bold;border-left:1px solid black;"/>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:4.5mm;width:42mm;position:relative;border-bottom:none;"/>
						</div>
						<div style="float:left;">
							<div style="height:4.5mm;width:8mm;text-align:center;font-weight:bold;border-left:1px solid black;background-color:lightgrey;border-bottom:none"/>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:4.5mm;width:42mm;position:relative;border-bottom:none;"/>
						</div>
					</div>-->
					<!-- Line 7 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:1mm;width:5mm;">7</div>
						<div class="styLNDesc" style="height:4mm;width:82mm;">
							Enter the amount, if any, from your 2011 Form 8930, line 8
						</div>
						<div style="float:left;">
							<div style="height:4.5mm;width:8mm;text-align:center;font-weight:bold;border-bottom:1px solid black;border-left:1px solid black;">7</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:4.5mm;width:40mm;position:relative;padding-right:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QlfyDsstrPYIRASEPSmDistriTxAmt" />
								</xsl:call-template>
							</div>
						</div>
						<div style="float:left;">
							<div style="height:4.5mm;width:8mm;text-align:center;font-weight:bold;border-left:1px solid black;background-color:lightgrey;"/>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:4.5mm;width:40mm;position:relative;border-bottom:none;"/>
						</div>
					</div>
					<!-- Spacer Row -->
					<!--<div style="width:187mm;height:4.5mm;">
						<div class="styLNDesc" style="width:137mm;height:4.5mm;"/>
						<div class="styLNRightNumBox" style="width:8mm;height:4.5mm;border-bottom:none;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="width:42mm;height:4.5mm;border-bottom:none;"/>
					</div>-->
					<!-- Line 8 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:1mm;width:5mm;">8</div>
						<div class="styLNDesc" style="height:4mm;width:130mm;">
							<span style="float:left;">Subtract line 7 from line 6. If zero or less, enter -0-</span>
							<span style="letter-spacing:3mm;font-weight:bold;float:right;padding-right:3mm;">...............</span>
						</div>
						<div style="float:left;">
							<div style="height:4.5mm;width:8mm;text-align:center;font-weight:bold;border-bottom:1px solid black;border-left:1px solid black;">8</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:4.5mm;width:38mm;position:relative;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QlfyDsstrPYNetTotRepymtAmt" />
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Spacer Row -->
					<!--<div style="width:183mm;height:4.5mm;">
						<div class="styLNDesc" style="width:135mm;height:4.5mm;"/>
						<div class="styLNRightNumBox" style="width:8mm;height:4.5mm;border-bottom:none;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="width:38mm;height:4.5mm;border-bottom:none;"/>
					</div>-->
					<!-- Line 9 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:10mm;padding-left:1mm;width:5mm;">9</div>
						<div class="styLNDesc" style="height:10mm;width:130mm;">
							Enter the total amount of any repayments you made in 2012. But do not include repayments <br/>
							made on or before the due date (including extensions) for filing your 2011 tax return. See <br/>
							<span style="float:left;">instructions</span>
							<span style="letter-spacing:3mm;font-weight:bold;float:right;padding-right:3mm;">.............................</span>
						</div>
						<div style="float:left;">
							<div style="width:8mm;border-left:1px solid black;background-color:lightgrey;"><br/><span style="width:0px"/></div>
							<div style="height:4.4mm;width:8mm;text-align:center;font-weight:bold;border-bottom:1px solid black;border-left:1px solid black;">9</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="width:38mm;position:relative;"><br/><br/>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QlfyDsstrIRASEPTotalRepymtAmt" />
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Spacer Row -->
					<!--<div style="width:183mm;height:4.5mm;">
						<div class="styLNDesc" style="width:135mm;height:4.5mm;"/>
						<div class="styLNRightNumBox" style="width:8mm;height:4.5mm;border-bottom:none;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="width:38mm;height:4.5mm;border-bottom:none;"/>
					</div>-->
					<!-- Line 10 -->
					<div style="width:183mm;height:8.5mm;border-bottom:1px solid black;">
						<div class="styLNLeftNumBox" style="padding-left:1mm;width:5mm;">10</div>
						<div class="styLNDesc" style="height:8.5mm;width:130mm;">
							Add lines 8 and 9. This amount can be carried back to reduce the amount subject to tax in a <br/>
							<span style="float:left;">prior year. See instructions</span>
							<span style="letter-spacing:3mm;font-weight:bold;float:right;padding-right:3mm;">........................</span>
						</div>
						<div style="float:left;">
							<div style="height:4mm;width:8mm;border-left:1px solid black;background-color:lightgrey;"/>
							<div style="height:4.4mm;width:8mm;text-align:center;font-weight:bold;border-left:1px solid black;">10</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:4mm;width:38mm;border-bottom:none;"/>
							<div class="styLNAmountBox" style="height:4.3mm;width:38mm;position:relative;border-bottom:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyDsstrIRASEPSubjectToTaxAmt" />
									</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- BEGIN Signature -->
					<div style="width:183mm;border-bottom:1px solid black">
						<!-- BEGIN Left Column -->
						<div class="styGenericDiv" style="font-size:10pt;width:37mm;float:left;padding-top:2.5mm;">
							<div class="styMainTitle" style="font-size:10pt;">
								Sign Here Only If You<br/>
								Are Filing This Form<br/>
								by Itself and Not With<br/>
								Your Tax Return
							</div>
						</div>
						<!-- END Left Column -->
						<!-- BEGIN Right Column -->
						<div style="float:left;clear:none;width:146mm;border-left:1px solid black;">
							<div style="width:140mm;font-size:7pt;font-family:Arial-Narrow;padding-left:1mm;">
								Under penalties of perjury, I declare that I have examined this form, including accompanying attachments, and to the best of my
								knowledge and belief, it is true, correct, and complete. Declaration of preparer (other than taxpayer) is based on all information of which
								preparer has any knowledge.
							</div>
							<div style="width:140mm;margin-top:4mm">
								<div style="float:left;width:80mm;padding-left:1mm;">
									<img alt="right arrow" src="{$ImagePath}/8930_med_rt_arrow.gif" style="float:left;margin-right:2mm;"/>
									<div class="styGenericDiv" style="height:4.5mm;width:70mm;"><!-- Signature space --></div>
									<div class="styGenericDiv" style="width:70mm;border-top:1px solid black;font-size:7pt">Your Signature</div>
								</div>
								<div style="float:right;clear:none;width:58mm;margin-left:1mm;">
									<img alt="right arrow" src="{$ImagePath}/8930_med_rt_arrow.gif" style="float:left;margin-right:2mm;"/>
									<div style="height:4.5mm;width:52mm;clear:none;">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignatureDt"/>
											<xsl:with-param name="BackupName">$RtnHdrDataPrimarySignatureDate</xsl:with-param>
										</xsl:call-template>
									</div>
									<div style="width:52mm;border-top:1px solid black;font-size:7pt;float:left;clear:none">Date</div>
								</div>
							</div>
						</div>
						<!-- END Right Column -->
					</div>
					<!-- END Signature -->
					<!-- BEGIN paid preparer -->
					<div class="styGenericDiv" style="width:184mm;font-size:6pt;">
						<div style="width:22mm;padding-top:4mm;float:left;clear:none;">
							<span class="styMainTitle" style="font-size:11pt;">
									Paid
									Preparer
									Use Only
									</span>
						</div>
						<div style="width:161mm;float:left;clear:none;border-left:1px solid black;">
							<div style="width:161mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
								<div class="styLNDesc" style="height:6mm;width:46.8mm;padding-top:0mm;border-right:1 solid black;">
								Print/Type preparer's name<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerPersonName</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="height:6mm;width:46.5mm;padding-top:0mm;border-right:1 solid black;padding-left:1mm;">
								Preparer's signature
							</div>
								<div class="styLNDesc" style="height:6mm;width:15mm;border-right:1 solid black;padding-top:0mm;padding-left:1mm;">Date <br/>
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationDateSigned</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="height:6mm;width:18mm;border-right:1 solid black;padding-top:.5mm;padding-bottom:0mm;padding-left:1mm;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
										</xsl:call-template>
										Check 
										<input class="styCkbox" type="checkbox" style="width:4mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:4px;"/>if<br/>self-employed
									</label>
								</div>
								<div class="styLNDesc" style="height:6mm;width:16mm;padding-top:0mm;padding-left:1mm">PTIN
                             <br/>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerSSN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">PreparerSSN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerSSN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PTIN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPTIN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/STIN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">STIN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSTIN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div style="width:161mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
								<div class="styLNDesc" style="height:6mm;width:108.5mm;border-right:1 solid black;">
									<span class="styGenericDiv" style="">Firm's name 
									<span style="width:2.2mm;"/>
										<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
										<span style="width:4px;"/>
									</span>
									<div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName2</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
								<div class="styLNDesc" style="height:6mm;width:50mm;padding-left:1mm;">Firm's EIN
								<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									<span style="width:4px;"/>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">PreparerFirmIDNumber</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerFirmIDNumber</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReason">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationMissingEINReason</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div style="width:161mm;float:left;clear:none;">
								<div class="styLNDesc" style="width:108.5mm;border-right:1 solid black;">
									<div class="styGenericDiv" style="padding-right:.5mm;">Firm's address 
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									</div>
									<div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine2</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">City</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressCity</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">State</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressState</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">ZIPCode</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressZip</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">City</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignAddressCity</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">ProvinceOrState</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignProvinceOrState</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">PostalCode</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPostalCode</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">Country</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignCountry</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
								<div class="styLNDesc" style="width:50mm;padding-left:1mm;border-bottom-width:0;"> Phone no. 
 								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">Phone</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPhone</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPhone</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- END paid preparer -->
					<!--Page Footer-->
					<div style="width:183mm; font-size:7pt;border-top:2px solid black; padding-top:0.5mm">
						<div style="float:left; font-size:8pt">
							<b>For Privacy Act and Paperwork Reduction Act Notice, see instructions.</b>
						</div>
						<div style="float:right;">
						Cat. No. 37744P
						<span style="width:5mm"/>
						Form <b style="font-size:9pt">8930</b> (2013)
						</div>
					</div>
					<!--END Page Footer-->
					<!-- added div tag below to ensure additional data prints on separate page -->
					<div class="pageEnd"/>
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					
					<!-- Additional Data Table -->
          
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
