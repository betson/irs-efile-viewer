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
						<div class="styFTBox" style="width:130mm;height:23mm;">
							<div style="float:left; clear:left; width: 89mm; padding-top:1mm">	
							<div class="styMainTitle" style="width: 90mm; height: 8mm; text-align:center; font-size: 12pt; ">
								Credits for Qualifying Children<br/> and Other Dependents
							</div>
							<div class="styFBT" style="width: 110mm; height: 10mm; padding-right: 15mm; font-family: Arial; font-size: 8pt;">
									<img src="{$ImagePath}/8812_Bullet_Md.gif" alt="MediumBullet" height="9" width="9"/>
									Attach to Form 1040,1040-SR, or Form 1040-NR.<br/>
									<img src="{$ImagePath}/8812_Bullet_Md.gif" alt="MediumBullet" height="9" width="9"/>
    								 Go to <i><a style="text-decoration:none;color:black;" href="http://IRS.gov/Schedule8812">www.irs.gov/Schedule8812.</a></i> for instructions and the latest information. 
							</div>
							</div>
							
							<div style="float:right; clear:none; width: 40mm; height: 12mm; padding-top:1mm">
								<img src="{$ImagePath}/8812_1040_Top_Forms.png" alt="TopFormImage" height="60" width="90"/>
							</div>						
							</div>
						<div class="styTYBox" style="width:23mm;height:23mm;border-left-width:2px;">
							<div class="styOMB" style="width:23mm; height:4mm;">
								OMB No. 1545-0074
							</div>
							<div class="styTaxYear" style="height:9mm;padding-top:1mm;padding-bottom:0;">
								20<span class="styTYColor">21</span>
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
					<!-- BEGIN Part I-A Title -->
					<div class="styBB" style="width: 187mm; height: 4.5mm; border-top-width: 1px; clear:left; float: left;">
						<div class="styPartName" style="font-family:Arial;font-size:10pt;">
							Part I-A
						</div>
						<div class="styPartDesc" style="font-family:Arial;font-size:10pt;">
							Child Tax Credit and Credit for Other Dependents
						</div>
					</div>
								<!-- BEGIN -->
								<!-- Line 1-->
								<div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
									 <div class="styLNLeftNumBox" style="width: 8mm; height: 4.5mm; padding-top: 1mm; padding-left: 3mm;">1</div>
									 <div style="width: 141mm; clear: none; float: left; height:4.5mm">
									    <div class="styLNDesc" style="width: 138mm; height: 4.5mm;">																									
									        <div class="styLNDesc" style="width: 138mm; height: 4.5mm;">
									           Enter the amount from line 11 of your Form 1040, 1040-SR, or 1040-NR
									           <span class="styDotLn" style="float:right;padding-right:2mm;">........</span>
											</div>
                                        </div>
										   
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4.5mm; padding-top: 1mm;">1</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 4.5mm; padding-top: 1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/TaxLessCreditsAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="width: 32mm; height: 2mm; padding-top: 10mm; border-bottom-width: 0px; float: right;"/>
									<div class="styLNAmountBox" style="width: 6mm; height: 2mm; padding-top: 10mm; border-bottom-width: 0px; float: right;"/>
								</div>
								<!--END Line 1-->
								<!-- BEGIN -->
								<!-- Line 2a -->
								<div style="width: 187mm; height: 5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBox" style="width: 8mm; height: 5mm; padding-left: 3mm; padding-top: .75mm;">2a </div>
									<div class="styLNDesc" style="width:103mm; height:5mm; padding-top: 1mm;">
										<span style="float:left;clear:none;">Enter income from Puerto Rico that you excluded</span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">........</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 5mm; padding-top: 1mm;">2a </div>
									<div class="styLNAmountBox" style="width: 32mm; height: 5mm; padding-top: 1mm; padding-right: 0.5mm; border-bottom-width: 1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/TotalEarnedIncomeAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="width: 6.2mm; height: 5mm; padding-top: 1.3mm; border-right-width: 1px; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!-- END Line 2a -->
								<!-- Line b -->
								<div style="width: 187mm; height: 5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBox" style="width: 8mm; height: 5mm; padding-left: 5mm; padding-top: .75mm;">b </div>
									<div class="styLNDesc" style="width:103mm; height:5mm; padding-top: 1mm;">
										<span style="float:left;clear:none;">Enter the amounts from lines 45 and 50 of your Form 2555</span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">.....</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 5mm; padding-top: 1mm;">2b </div>
									<div class="styLNAmountBox" style="width: 32mm; height: 5mm; padding-top: 1mm; padding-right: 0.5mm; border-bottom-width: 1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/TotalEarnedIncomeAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="width: 6.2mm; height: 5mm; padding-top: 1.3mm; border-right-width: 1px; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!-- END Line b -->
								<!-- Line c -->
								<div style="width: 187mm; height: 5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBox" style="width: 8mm; height: 5mm; padding-left: 5mm; padding-top: .75mm;">c </div>
									<div class="styLNDesc" style="width:103mm; height:5mm; padding-top: 1mm;">
										<span style="float:left;clear:none;">Enter the amount from line 15 of your Form 4563</span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">.......</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 5mm; padding-top: 1mm;">2c </div>
									<div class="styLNAmountBox" style="width: 32mm; height: 5mm; padding-top: 1mm; padding-right: 0.5mm; border-bottom-width: 1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/TotalEarnedIncomeAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="width: 6.2mm; height: 5mm; padding-top: 1.3mm; border-right-width: 1px; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!-- END Line c -->
								<!-- Line 2d-->
								<div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
									 <div class="styLNLeftNumBox" style="width: 8mm; height: 4.5mm; padding-top: 1mm; padding-left: 5mm;">d</div>
									 <div style="width: 141mm; clear: none; float: left; height:4.5mm">
									    <div class="styLNDesc" style="width: 138mm; height: 4.5mm;">																									
									        <div class="styLNDesc" style="width: 138mm; height: 4.5mm;">
									           Add lines 2a through 2c
									           <span class="styDotLn" style="float:right;padding-right:2mm;">.........................</span>
											</div>
                                        </div>
										   
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4.5mm; padding-top: 1mm;">2d</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 4.5mm; padding-top: 1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/TaxLessCreditsAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="width: 32mm; height: 2mm; padding-top: 10mm; border-bottom-width: 0px; float: right;"/>
									<div class="styLNAmountBox" style="width: 6mm; height: 2mm; padding-top: 10mm; border-bottom-width: 0px; float: right;"/>
								</div>
								<!--END Line 1-->
								<!-- BEGIN -->
								<!-- Line 3 -->
								<div style="width: 187mm; height: 4mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 4mm;padding-left: 3mm;">3</div>
									<div class="styLNDesc" style="width:141mm; height:4mm;padding-top:.5mm;">
										<span style="float:left;clear:none;">Add lines 1 and 2d</span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">...........................</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4mm;">3</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 4mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/ACTCBeforeLimitAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- END Line 3 -->
								<!-- Line 4a -->
								<div style="width: 187mm; height: 6mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBox" style="width: 8mm; height: 6mm; padding-left: 3mm; padding-top: .75mm;">4a </div>
									<div class="styLNDesc" style="width:103mm; height:5mm; padding-top: 1mm;">
										<span style="float:left;clear:none;">Number of qualifying children under age 18 with the required social security number</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 6mm; padding-top: 1.5mm;">4a </div>
									<div class="styLNAmountBox" style="width: 32mm; height: 6mm; padding-top: 1mm; padding-right: 0.5mm; border-bottom-width: 1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/TotalEarnedIncomeAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="width: 6.2mm; height: 6mm; padding-top: 1.3mm; border-right-width: 1px; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!-- Line 4a -->
								<!-- Line 4b -->
								<div style="width: 187mm; height: 6mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBox" style="width: 8mm; height: 5mm; padding-left: 5mm; padding-top: .75mm;">b </div>
									<div class="styLNDesc" style="width:103mm; height:5mm; padding-top: 1mm;">
										<span style="float:left;clear:none;">Number of children included on line 4a who were under age 6 at the end of 2021</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 6mm; padding-top: 1.5mm;">4b </div>
									<div class="styLNAmountBox" style="width: 32mm; height: 6mm; padding-top: 1mm; padding-right: 0.5mm; border-bottom-width: 1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/TotalEarnedIncomeAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="width: 6.2mm; height: 6mm; padding-top: 1.3mm; border-right-width: 1px; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!-- Line 4b -->
								<!-- Line 4c -->
								<div style="width: 187mm; height: 6mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBox" style="width: 8mm; height: 5mm; padding-left: 5mm; padding-top: .75mm;">c </div>
									<div class="styLNDesc" style="width:103mm; height:5mm; padding-top: 1mm;">
										<span style="float:left;clear:none;">Subtract line 4b from line 4a</span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">...............</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 6mm; padding-top: 1.5mm;">4c </div>
									<div class="styLNAmountBox" style="width: 32mm; height: 6mm; padding-top: 1mm; padding-right: 0.5mm; border-bottom-width: 1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/TotalEarnedIncomeAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="width: 6.2mm; height: 6mm; padding-top: 1.3mm; border-right-width: 1px; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!-- Line 4c -->
								<!-- Line 5 -->
								<div style="width: 187mm; height: 4mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 4mm; padding-left: 3mm;">5</div>
									<div class="styLNDesc" style="width:141mm; height:4mm;padding-top:.75mm;">
										<span style="float:left;clear:none;">If line 4a is more than zero, enter the amount from the <b>Line 5 Worksheet</b>; otherwise, enter -0-</span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">..</span>
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
								<!-- Line 6 -->
								<div style="width: 187mm; height: 10mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBox" style="width: 8mm; height: 9mm; padding-left: 3mm; padding-top: .75mm;">6 </div>
									<div class="styLNDesc" style="width:103mm; height:9mm; padding-top: 1mm;">
										<span style="float:left;clear:none;">Number of other dependents, including any qualifying children who are not under age 18 or who do not have the required social security number</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 10mm; padding-top: 6.5mm;">6 </div>
									<div class="styLNAmountBox" style="width: 32mm; height: 10mm; padding-top: 1mm; padding-right: 0.5mm; border-bottom-width: 1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/TotalEarnedIncomeAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="width: 6.2mm; height: 10mm; padding-top: 1.3mm; border-right-width: 1px; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!-- Line 6 -->
								<div style="width: 187mm; height: 10mm; clear: left; font-size: 7.5pt; float: left;">
									<!--<div class="styLNLeftNumBox" style="width: 8mm; height: 9mm; padding-left: 3mm; padding-top: .75mm;">6 </div>-->
									<div class="styLNDesc" style="width:149mm; height:9mm; padding-left:8mm; padding-top: 0mm;">
										<span style="float:left;clear:none;"><b>Caution:</b> Do not include yourself, your spouse, or anyone who is not a U.S. citizen, U.S. national, or U.S. resident alien. Also, do not include anyone you inlcluded on line 4a.</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6.2mm; height: 10mm; padding-top: 1.3mm; border-right-width: 1px; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!--BEGIN-->
								<!-- Line 7 -->
								<div style="width: 187mm; height: 4mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 4mm;padding-left: 3mm;">7</div>
									<div class="styLNDesc" style="width:141mm; height:4mm;padding-top:.5mm;">
										<span style="float:left;clear:none;">Multiply line 6 by $500</span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">..........................</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4mm;">7</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 4mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/ACTCBeforeLimitAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!--END line 7 -->
								<!--Line 8 -->
								<div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 5mm; padding-left: 3mm;">8</div>
									<div class="styLNDesc" style="width: 141mm; height: 4.5mm;">
										<span style="float:left;clear:none;">  
				                         	Add lines 5 and 7
				                        </span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">............................</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4.5mm;">8</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!--END line 8-->
								<!--Line 9-->
								<div style="width: 187mm; height: 13mm; clear: left; font-size: 7.5pt; float: left;">
								
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 4.5mmmm; padding-left: 3mm;">9</div>
									<div class="styLNDesc" style="width: 141mm; height: 4.5mm;">
										<span style="float:left;clear:none;">  
				                         	Enter the amount shown below for your filing status.
				                        </span>
				                    <br/>
				                    <div>
				                    <div style="float:left;font-size:7pt;width:50mm;height:8mm;padding-top:.7mm;">
									   &#8226; Married filing jointly--$400,000.<br/>
									   &#8226; All other filing statuses--$200,000
						            </div>
						            <div style="float:left;width:5mm;height:8mm;">
										<img alt="right bracket" height="30px" src="{$ImagePath}/8912_Bracket_Sm.gif"/>
									</div>
									<div style="float:left;width:5mm;height:8mm;padding-top:5mm;">
										<span style="letter-spacing:2mm;font-weight:bold;">...........................</span>
									</div>
						            </div>
						            
						            </div>
				                
				                <div class="styLNRightNumBox" style="width: 6mm;  height: 13mm; padding-top:8mm;">9</div>
								<div class="styLNAmountBox"   style="width: 32mm; height: 13mm; padding-top:8mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!--Line 10-->
								<div style="width: 187mm; height: 13mm; clear: left; font-size: 7.5pt; float: left;">
								
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 4.5mmmm; padding-left: 3mm;">10</div>
									<div class="styLNDesc" style="width: 141mm; height: 4.5mm;">
										<span style="float:left;clear:none;">  
				                         	Subtract line 9 from line 3.
				                        </span>
				                    <br/>
				                    <div>
				                    <div style="float:left;font-size:7pt;width:110mm;height:8mm;padding-top:.7mm;">
									   &#8226; If zero or less, enter -0-.<br/>
									   &#8226; If more than zero and not a multiple of $1,000, enter the next multiple of $1,000. For example, if the result is $425, enter $1,000; if the result is $1,025, enter $2,000, etc.
						            </div>
						            <div style="float:left;width:5mm;height:8mm;">
										<img alt="right bracket" height="30px" src="{$ImagePath}/8912_Bracket_Sm.gif"/>
									</div>
									<div style="float:left;width:5mm;height:8mm;padding-top:5mm;">
										<span style="letter-spacing:2mm;font-weight:bold;">.........</span>
									</div>
						            </div>
						            </div>				                
				                <div class="styLNRightNumBox" style="width: 6mm;  height: 13mm; padding-top:8mm;">10</div>
								<div class="styLNAmountBox"   style="width: 32mm; height: 13mm; padding-top:8mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!--END line 10-->
								<!--Line 11 -->
								<div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 5mm; padding-left: 3mm;">11</div>
									<div class="styLNDesc" style="width: 141mm; height: 4.5mm;">
										<span style="float:left;clear:none;">  
				                         	Miltiply line 10 by 5% (0.05)
				                        </span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">........................</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4.5mm;">11</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!--END line 11-->
								<!--Line 12 -->
								<div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 5mm; padding-left: 3mm;">12</div>
									<div class="styLNDesc" style="width: 141mm; height: 4.5mm;">
										<span style="float:left;clear:none;">  
				                         	Subtract line 11 from line 8. If zero or less, enter -0-
				                        </span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">................</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4.5mm;">12</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!--END line 12-->
								<!--Line 13-->
								<div style="width: 187mm; height: 20mm; clear: left; font-size: 7.5pt; float: left;">
								
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 4.5mm; padding-left: 3mm;">13</div>
									<div class="styLNDesc" style="width: 141mm; height: 4.5mm;">
										<span style="float:left;clear:none;">  
				                         	Check all the boxes that apply to you (or your spouse if married filing jointly).
				                        </span>
				                    
				                    <div style="float:left; font-size:7pt; width:141mm; height:8mm; padding-top:.7mm;">
																	   
									   <div style="float:left; width: 4mm;"><b>A</b></div> 
									   <div style="float:left; width: 130mm;">Check here if you (or your spouse if married filing jointly) have a principal place of abode in the United.
									   States for more than half of 2021 
									   <span style="letter-spacing:2mm;font-weight:bold;">..............................</span></div>
									   <div style="float:right; padding-right:1mm; padding-top:2mm;">
									   <input type="checkbox" alt="MainHomeInUSOverHalfYrInd" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8812Data/MainHomeInUSOverHalfYrInd"/>
												<xsl:with-param name="BackupName">Form8812DataMainHomeInUSOverHalfYrInd</xsl:with-param>
											</xsl:call-template>
										</input></div>
									</div>
									<div style="float:left; font-size:7pt; width:141mm; height:8mm; padding-top:.7mm;">
									  <div style="float:left; width: 4mm;"><b>B</b></div> 
									   <div style="float:left; width: 130mm;">
									   Check here if you (or your spouse if married filing jointly) are 
									   a bona fide resident of Puerto Rico for 2021
									   <span style="letter-spacing:2mm;font-weight:bold;">..........................................</span></div> 
									   <div style="float:right; padding-right:1mm; padding-top:2mm;">
									   <input type="checkbox" alt="BonaFidePRResidentInd" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8812Data/BonaFidePRResidentInd"/>
												<xsl:with-param name="BackupName">Form8812DataBonaFidePRResidentInd</xsl:with-param>
											</xsl:call-template>
										</input></div>									
									</div> 
						            
						            </div>
				                
				                <div class="styLNRightNumBox" style="width: 6mm;  height: 20mm; padding-top:8mm; background-color:lightGray"></div>
								<div class="styLNAmountBox"   style="width: 32mm; height: 20mm; padding-top:8mm; background-color:lightGray"></div>
								</div>
								<!--END line 13-->
								<!-- BEGIN Part I-B Title -->
								<div style="width: 187mm; height: 4.5mm; clear: left; border-top-color: black; border-bottom-color: black; border-top-width: 1px; border-bottom-width: 1px; border-top-style: solid; border-bottom-style: solid; float: left;">
									<div class="styPartName" style="font-family: Arial; font-size: 10pt;">Part I-B</div>
									<div class="styPartDesc" style="font-family: Arial; font-size: 10pt;">Filers Who Check a Box on Line 13</div>

								</div>
								<div style="width:187mm;height:4.5mm;border-bottom color:black;border-bottom-width: 1px;border-bottom-style:solid;padding-bottom:2mm;padding-top:0mm;">
									   <b>Caution:</b> If you did not check a box on line 13, do not complete Part I-B; instead, skip to Part I-C.                  
								</div>
								<!--End of Part I-B Title-->
                                   <div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 5mm; padding-left: 3mm;">14a</div>
									<div class="styLNDesc" style="width: 141mm; height: 4.5mm;padding-left: 2mm">
										<span style="float:left;clear:none;">  
				                         	Enter the smaller of line 7 or line 12
				                        </span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">.....................</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4.5mm;">14a</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 5mm; padding-left: 7mm;">b</div>
									<div class="styLNDesc" style="width: 141mm; height: 4.5mm;padding-left: 2mm">
										<span style="float:left;clear:none;">  
				                         	Subtract line 14a from line 12
				                        </span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">.......................</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4.5mm;">14b</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 5mm; padding-left: 7mm;">c</div>
									<div class="styLNDesc" style="width: 141mm; height: 4.5mm;padding-left: 2mm">
										<span style="float:left;clear:none;">  
				                         	If line 14a is zero, enter -0-; otherwise, enter the amount from the <b>Credit Limit Worksheet A</b>
				                        </span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">..</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4.5mm;">14c</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 5mm; padding-left: 7mm;">d</div>
									<div class="styLNDesc" style="width: 141mm; height: 4.5mm;padding-left: 2mm">
										<span style="float:left;clear:none;">  
				                         	Enter the smaller of line 14a or line 14c
				                        </span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">....................</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4.5mm;">14d</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 5mm; padding-left: 7mm;">e</div>
									<div class="styLNDesc" style="width: 141mm; height: 4.5mm;padding-left: 2mm">
										<span style="float:left;clear:none;">  
				                         	Add lines 14b and 14d
				                        </span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">..........................</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4.5mm;">14e</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div style="width: 187mm; height: 10.5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 5mm; padding-left: 7mm;">f</div>
									<div class="styLNDesc" style="width: 141mm; height: 4.5mm;padding-left: 2mm">
										<span style="float:left;clear:none;">  
				                         	Enter the aggregate amount of advance child tax credit payments you (and your spouse if filing jointly) received for 2021. See your Letter(s) 6419 for the amounts to include on this line. If you are missing Letter 6419, see the instructions before entering an amount on this line
				                         	<span class="styDotLn" style="float:right;padding-right:2mm;">.........</span>
				                        </span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 10.5mm;padding-top:6.5mm;">14f</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 10.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
									<div style="width: 187mm; height: 8mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNDesc" style="width:149mm; height:8mm; padding-left:10mm; padding-top: 0mm;">
										<span style="float:left;clear:none;"><b>Caution:</b> If the amount on this line doesn’t match the aggregate amounts reported to you (and your spouse if filing jointly) on your Letter(s) 6419, the processing of your return will be delayed.</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6.2mm; height: 8mm; padding-top: 1.3mm; border-right-width: 1px; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 5mm; padding-left: 7mm;">g</div>
									<div class="styLNDesc" style="width: 141mm; height: 4.5mm;padding-left: 2mm">
										<span style="float:left;clear:none;">  
				                         	Subtract line 14f from line 14e. If zero or less, enter -0- on lines 14g through 14i and go to Part III
				                        </span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4.5mm;">14g</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div style="width: 187mm; height: 7mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 5mm; padding-left: 7mm;">h</div>
									<div class="styLNDesc" style="width: 141mm; height: 8.5mm;padding-left: 2mm">
										<span style="float:left;clear:none;">  
				                         	Enter the smaller of line 14d or line 14g. <b>This is your credit for other dependents. Enter this amount on line 19 of your Form 1040, 1040-SR, or 1040-NR</b>
				                         	<span class="styDotLn" style="float:right;padding-right:2mm;">...........</span>
				                        </span>
										
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 7mm;padding-top: 3mm;">14h</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 7mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div style="width: 187mm; height: 8mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 5mm; padding-left: 7mm;">i</div>
									<div class="styLNDesc" style="width: 141mm; height: 8mm;padding-left: 2mm">
										<span style="float:left;clear:none;">  
				                         	Subtract line 14h from line 14g. <b>This is your refundable child tax credit. Enter this amount on line 28 of your Form 1040, 1040-SR, or 1040-NR</b>
				                         	<span class="styDotLn" style="float:right;padding-right:2mm;">...............</span>
				                        </span>
										
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 7mm;padding-top: 3mm;">14i</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 7mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- END Part I-B Title -->
								<!--Line 15 -->
								<!--<div style="width: 187mm; height: 5mm; clear: left; float: left;">
									<div class="styLNLeftNumBox" style="height: 5mm; padding-top: 1mm;">15</div>
									<div class="styLNDesc" style="width: 141mm; height: 5mm; padding-top: 1mm;">
										<span style="float:left;clear:none;">
											<b>This is your additional child tax credit</b>
										</span>
										--><!--Dotted Line--><!--
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
								<div style="width: 187mm; height: 1mm; clear: left; float: left;"/>-->
								<!--End of line 15 -->
								<!-- capturing the page bottom info -->
								<!--  FOOTER-->
								<div class="pageEnd" style="width: 187mm; height: 8mm; clear: both; font-family: Arial; font-size: 7pt; border-top-color: black; border-top-width: 2px; border-top-style: solid; float: none;">
									<span style="float:left;clear:none;">
										<b>For Paperwork Reduction Act Notice, see your tax return instructions.</b>
										<span style="width:18mm;"/>Cat. No. 59761M</span>
									<span style="float:right;clear:none;font-weight:bold;">Schedule 8812 (Form 1040) 2021</span>
								</div>
								<!--Begin Page 2 -->
					<!-- Page Header -->
					<div class="styTBB" style="width:187mm;padding-top:2.5mm;">
						<div style="float:left;">Schedule 8812 (Form 1040) 2021</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></div>
					</div>
					<!-- END Page Header -->	
					<!-- BEGIN Part I-C Title -->
								<!-- BEGIN Part I-C Title -->
								<div style="width: 187mm; height: 4.5mm; clear: left; border-top-color: black; border-bottom-color: black; border-top-width: 1px; border-bottom-width: 1px; border-top-style: solid; border-bottom-style: solid; float: left;">
									<div class="styPartName" style="font-family: Arial; font-size: 10pt;">Part I-C</div>
									<div class="styPartDesc" style="font-family: Arial; font-size: 10pt;">Filers Who Do Not Check a Box on Line 13</div>
									
								</div>
								<div style="width:187mm;height:4.5mm;border-bottom color:black;border-bottom-width: 1px;border-bottom-style:solid;padding-bottom:2mm;padding-top:0mm;">
								   <b>Caution:</b> If you checked a box on line 13, do not complete Part I-C.                  
								</div>
								<!--End of Part I-C Title-->
            <div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 5mm; padding-left: 3mm;">15a</div>
									<div class="styLNDesc" style="width: 141mm; height: 4.5mm;padding-left: 2mm">
										<span style="float:left;clear:none;">  
				                         	Enter the amount from the <b>Credit Limit Worksheet A</b>
				                        </span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">...............</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4.5mm;">15a</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 5mm; padding-left: 7mm;">b</div>
									<div class="styLNDesc" style="width: 141mm; height: 4.5mm;padding-left: 2mm">
										<span style="float:left;clear:none;">  
				                         	Enter the smaller of line 12 or line 15a
				                        </span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">.....................</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4.5mm;">15b</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
								<div class="styLNDesc" style="width: 149mm; height: 4.5mm;padding-left: 10mm">
										<span style="float:left;clear:none;">  
				                         	Additional child tax credit. Complete Parts II-A through II-C if you meet each of the following items.
				                        </span>
				                        </div>
				                        	<div class="styLNRightNumBox" style="width: 6.2mm; height: 18mm; padding-top: 1.3mm; border-right-width: 1px; border-bottom-width: 0px; background-color: lightgrey;"/>
								
				                        </div>
				                        <div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
								<div class="styLNDesc" style="width: 141mm; height: 4.5mm;padding-left: 10mm">
										<span style="float:left;clear:none;">  
				                         	1. You are not filing Form 2555.
				                        </span>
				                        </div>
				                        </div>
				                        <div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
								<div class="styLNDesc" style="width: 141mm; height: 4.5mm;padding-left: 10mm">
										<span style="float:left;clear:none;">  
				                         	2. Line 4a is more than zero.
				                        </span>
				                        </div>
				                        </div>
				                        <div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
								<div class="styLNDesc" style="width: 141mm; height: 4.5mm;padding-left: 10mm">
										<span style="float:left;clear:none;">  
				                         	3. Line 12 is more than line 15a.
				                        </span>
				                        </div>
				                        </div>
								<div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 5mm; padding-left: 7mm;">c</div>
									<div class="styLNDesc" style="width: 141mm; height: 4.5mm;padding-left: 2mm">
										<span style="float:left;clear:none;">  
				                         	If you completed Parts II-A through II-C, enter the amount from line 27; otherwise, enter -0-
				                        </span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">..</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4.5mm;">15c</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 5mm; padding-left: 7mm;">d</div>
									<div class="styLNDesc" style="width: 141mm; height: 4.5mm;padding-left: 2mm">
										<span style="float:left;clear:none;">  
				                         	Add lines 15b and 15c
				                        </span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">..........................</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4.5mm;">15d</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div style="width: 187mm; height: 11mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 11mm; padding-left: 7mm;">e</div>
									<div class="styLNDesc" style="width: 141mm; height: 11mm;padding-left: 2mm;">
										<span style="float:left;clear:none;">  
				                         	Enter the aggregate amount of advance child tax credit payments you (and your spouse if filing jointly) received for 2021. See your Letter(s) 6419 for the amounts to include on this line. If you are missing Letter 6419, see the instructions before entering an amount on this line
				                         	<span class="styDotLn" style="float:right;padding-right:2mm;">.........</span>
				                        </span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 11mm;padding-top:7mm;">15e</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 11mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div style="width: 187mm; height: 7mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNDesc" style="width:149mm; height:7mm; padding-left:10mm; padding-top: 0mm;">
										<span style="float:left;clear:none;"><b>Caution:</b>If the amount on this line doesn’t match the aggregate amounts reported to you (and your spouse if filing jointly) on your Letter(s) 6419, the processing of your return will be delayed.</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6.2mm; height: 7mm; padding-top: 1.3mm; border-right-width: 1px; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 5mm; padding-left: 7mm;">f</div>
									<div class="styLNDesc" style="width: 141mm; height: 4.5mm;padding-left: 2mm">
										<span style="float:left;clear:none;">  
				                         	Subtract line 15e from line 15d. If zero or less, enter -0- on lines 15f through 15h and go to Part III.
				                        </span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4.5mm;">15f</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div style="width: 187mm; height: 8.5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 8.5mm; padding-left: 7mm;">g</div>
									<div class="styLNDesc" style="width: 141mm; height: 8.5mm;padding-left: 2mm">
										<span style="float:left;clear:none;">  
				                         Enter the smaller of line 15b or line 15f. <b>This is your nonrefundable child tax credit and credit for other dependents. Enter this amount on line 19 of your Form 1040, 1040-SR, or 1040-NR</b>	
				                        </span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 8.4mm;padding-top:5mm">15g</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 8.4mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div style="width: 187mm; height: 7mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 5mm; padding-left: 7mm;">h</div>
									<div class="styLNDesc" style="width: 141mm; height: 8.5mm;padding-left: 2mm">
										<span style="float:left;clear:none;">  
				                         	Subtract line 15g from line 15f. <b>This is your additional child tax credit. Enter this amount on line 28 of your Form 1040, 1040-SR, or 1040-NR</b>
				                         	<span class="styDotLn" style="float:right;padding-right:2mm;">.................</span>
				                        </span>
										
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 7mm;padding-top: 3mm;">15h</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 7mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- BEGIN Part II-A Title -->
								<div style="width: 187mm; height: 4.5mm; clear: left; border-top-color: black; border-bottom-color: black; border-top-width: 1px; border-bottom-width: 1px; border-top-style: solid; border-bottom-style: solid; float: left;">
									<div class="styPartName" style="font-family: Arial; font-size: 10pt;">Part II-A</div>
									<div class="styPartDesc" style="font-family: Arial; font-size: 10pt;"><b>Additional Child Tax Credit</b> (use only if completing Part I-C)</div>
									
								</div>
								<div style="width:187mm;height:4.5mm;border-bottom color:black;border-bottom-width: 1px;border-bottom-style:solid;padding-bottom:2mm;padding-top:0mm;">
								   <b>Caution:</b> If you file Form 2555, <b>stop here</b> and enter -0- on line 15c; you cannot claim the additional child tax credit.                  
								</div>
								<div style="width:187mm;height:4.5mm;border-bottom color:black;border-bottom-width: 1px;border-bottom-style:solid;padding-bottom:2mm;padding-top:0mm;">
								   <b>Caution:</b> If you checked a box on line 13, do not complete parts II-A through II-C; you cannot claim the additional child tax credit.                  
								</div>
								<!--End of Part II-A Title-->
								<!-- Line 16a-->
								<div style="width: 187mm; height: 5.5mm; clear: left; font-size: 7.5pt; float: left;">
									 <div class="styLNLeftNumBox" style="width: 8mm; height: 5.5mm; padding-top: 1mm; padding-left: 3mm;">16a</div>
									 <div style="width: 141mm; clear: none; float: left; height:5.5mm">
									    <div class="styLNDesc" style="width: 138mm; height: 5.5mm;">																									
									        <div class="styLNDesc" style="width: 138mm; height: 5.5mm;padding-left:1mm">
									           Subtract line 15b from line 12. If zero, <b>stop here</b> and enter -0- on line 15c; you cannot claim this credit									           <span class="styDotLn" style="float:right;padding-right:2mm;">...............................</span>
											</div>
                                        </div>
										   
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 6.5mm; padding-top: 2.5mm;">16a</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 6.5mm; padding-top: 1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/TaxLessCreditsAmt"/>
										</xsl:call-template>
									</div>
	<!--								<div class="styLNRightNumBox" style="width: 32mm; height: 2mm; padding-top: 10mm; border-bottom-width: 0px; float: right;"/>
									<div class="styLNAmountBox" style="width: 6mm; height: 2mm; padding-top: 10mm; border-bottom-width: 0px; float: right;"/>-->
								</div>
								<!--END Line 16a-->
								<!-- BEGIN -->
								<!-- Line b -->
								<div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 5mm; padding-left: 7mm;">b</div>
									<div class="styLNDesc" style="width: 141mm; height: 4.5mm;padding-left: 2mm;padding-top:1mm">
										<span style="float:left;clear:none;">  
				                         	Number of qualifying children under 18 with the required social security number: ________  x $1,400.
				                        </span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 17mm;padding-top:13mm">16b</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 17mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
								<div class="styLNDesc" style="width: 149mm; height: 4.5mm;padding-left: 10mm">
										<span style="float:left;clear:none;">  
				                         	Enter the result. If zero, <b>stop here</b> and enter -0- on line 15c; you cannot claim this credit
				                        </span>
				                        </div>								
				                        </div>
				                        <div style="width: 187mm; height: 7.5mm; clear: left; font-size: 7.5pt; float: left;">
								<div class="styLNDesc" style="width: 141mm; height: 7.5mm;padding-left: 10mm">
										<span style="float:left;clear:none;">  
				                         	<b>TIP:</b> The number of children you use for this line is the same as the number of children you used for line 4a.
				                        </span>
				                        </div>
				                        </div>
								<!-- END Line b -->
								<!-- Line 17 -->
								<div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 5mm; padding-left: 3mm;">17</div>
									<div class="styLNDesc" style="width: 141mm; height: 4.5mm;padding-left: 2mm">
										<span style="float:left;clear:none;">  
				                         Enter the <b>smaller</b>	 of line 16a or line 16b
				                        </span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">....................</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4.5mm;">17</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- END Line 17 -->
								<!-- Line 18a -->
								<div style="width: 187mm; height: 5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBox" style="width: 8mm; height: 5mm; padding-left: 2mm; padding-top: .75mm;">18a</div>
									<div class="styLNDesc" style="width:103mm; height:5mm; padding-top: 1mm;">
										<span style="float:left;clear:none;">Earned income (see instructions)</span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">..............</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 5mm; padding-top: 1mm;">18a </div>
									<div class="styLNAmountBox" style="width: 32mm; height: 5mm; padding-top: 1mm; padding-right: 0.5mm; border-bottom-width: 1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/TotalEarnedIncomeAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="width: 6.2mm; height: 12mm; padding-top: 1.3mm; border-right-width: 1px; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!-- END Line 18a -->
								<!-- Line 18b -->
								<div style="width: 187mm; height: 5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBox" style="width: 8mm; height: 5mm; padding-left: 5mm; padding-top: .75mm;">b</div>
									<div class="styLNDesc" style="width:65mm; height:5mm; padding-top: 1mm;">
										<span style="float:left;clear:none;">Nontaxable combat pay (see instructions)</span>
										<!--<span class="styDotLn" style="float:right;padding-right:2mm;">....</span>-->
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 5mm; padding-top: 1mm;">18b </div>
									<div class="styLNAmountBox" style="width: 32mm; height: 5mm; padding-top: 1mm; padding-right: 0.5mm; border-bottom-width: 1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/TotalEarnedIncomeAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="width: 6.2mm; height: 5mm; padding-top: 1.3mm; border-right-width: 1px; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!-- END Line 18b -->
								<!-- Line 19-->
								<div style="width: 187mm; height: 15mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBox" style="width: 8mm; height: 5mm; padding-left: 2mm; padding-top: .75mm;">
										19
									</div>
									<div class="styLNDesc" style="float:left;clear:none; width:103mm; height:5mm; padding-top: 1mm;">
										Is the amount on line 18a more than $2,500?
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 5mm; background-color:lightgray; border-bottom-width: 0px;"/>
									<div class="styLNAmountBox"   style="width: 32mm; height: 5mm; border-bottom-width: 0px;"/>
									<div class="styLNRightNumBox" style="width: 6mm; height: 5mm; background-color:lightgray; border-bottom-width: 0px;"/>
									<div class="styLNAmountBox"   style="width: 32mm; height: 5mm; border-bottom-width: 0px;"/>

									<div style="float:left; clear:left; padding-left:8mm; padding-right:2mm;">
									    <input type="checkbox" alt="MainHomeInUSOverHalfYrInd" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8812Data/EarnedIncmMoreThanSpecifiedInd"/>
												<xsl:with-param name="BackupName">Form8812DataEarnedIncmMoreThanSpecifiedInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</div>
									<div class="styLNDesc" style="width:96.1mm; height:5mm; padding-top: 1mm;">
										<b>No.</b> Leave line 19 blank and enter -0- on line 20.
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 5mm; background-color:lightgray; border-bottom-width: 0px;"/>
									<div class="styLNAmountBox"   style="width: 32mm; height: 5mm; border-bottom-width: 0px;"/>
									<div class="styLNRightNumBox" style="width: 6mm; height: 5mm; background-color:lightgray; border-bottom-width: 0px;"/>
									<div class="styLNAmountBox"   style="width: 32mm; height: 5mm; border-bottom-width: 0px;"/>
									
									<div style="float:left; clear:left; padding-left:8mm; padding-right:2mm;">
									    <input type="checkbox" alt="MainHomeInUSOverHalfYrInd" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8812Data/EarnedIncmMoreThanSpecifiedInd"/>
												<xsl:with-param name="BackupName">Form8812DataEarnedIncmMoreThanSpecifiedInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</div>
									<div class="styLNDesc" style="width:96.1mm; height:5mm; padding-top: 1mm;">
										<b>Yes.</b> Subtract $2,500 from the amount on line 18a. Enter the result
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 5mm; ">19</div>
									<div class="styLNAmountBox"   style="width: 32mm; height: 5mm;  border-bottom-width: 1px;">
									<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetTotalEarnedIncomeAmt"/>
									</xsl:call-template>
									</div>
									
									<div class="styLNRightNumBox" style="width: 6mm; height: 5mm; background-color:lightgray;"/>
									<div class="styLNAmountBox"   style="width: 32mm; height: 5mm; border-bottom-width: 1px;"/>
									
										</div>
								<!--END Line 19-->
								
								<!-- Line 20-->
								<div style="width: 187mm; height: 26mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBox" style="width: 8mm; height: 5mm; padding-left: 2mm; padding-top: .75mm;">
										20
									</div>
									<div class="styLNDesc" style="float:left; clear:none; width:141mm; height:5mm; padding-top: 1mm;">
										Multiply the amount on line 19 by 15% (0.15) and enter the result 
										<span style="letter-spacing:2mm;font-weight:bold;">................</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 5mm;  border-bottom-width: 0px;">20</div>
									<div class="styLNAmountBox"   style="width: 32mm; height: 5mm; border-bottom-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
									</xsl:call-template>
									</div>
									
									<div class="styLNDesc" style="float:left; clear:left; width:149mm; height:4mm; padding-left:8mm; ">
									<b>Next.</b> On line 16b, is the amount $4,200 or more?</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4mm; background-color:lightgray; border-bottom-width: 0px;"/>
									<div class="styLNAmountBox"   style="width: 32mm; height: 4mm; background-color:lightgray; border-bottom-width: 0px;"/>

									<div style="float:left; clear:left; padding-left:8mm; padding-right:2mm;">
									    <input type="checkbox" alt="MainHomeInUSOverHalfYrInd" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8812Data/ThreeOrMoreQlfyChildrenInd"/>
												<xsl:with-param name="BackupName">Form8812DataThreeOrMoreQlfyChildrenInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</div>
									<div class="styLNDesc" style="width:134.1mm; height:8mm; padding-top: 1mm;">
										<b>No.</b> If line 20 is zero, stop here and enter -0- on line 15c; you cannot claim this credit. 
										<br/>Otherwise, skip Part II-B and enter the smaller of line 17 or line 20 on line 27.
									</div>

									<div class="styLNRightNumBox" style="width: 6mm; height: 8mm; background-color:lightgray; border-bottom-width: 0px;"/>
									<div class="styLNAmountBox"   style="width: 32mm; height: 8mm; background-color:lightgray; border-bottom-width: 0px;"/>
									
									<div style="float:left; clear:left; padding-left:8mm; padding-right:2mm;">
									    <input type="checkbox" alt="MainHomeInUSOverHalfYrInd" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8812Data/ThreeOrMoreQlfyChildrenInd"/>
												<xsl:with-param name="BackupName">Form8812DataThreeOrMoreQlfyChildrenInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</div>
									<div class="styLNDesc" style="width:134.1mm; height:8mm; padding-top: 1mm;">
										<b>Yes.</b> If line 20 is equal to or more than line 17, skip Part II-B and enter the amount from line 17 
										<br/>on line 27. Otherwise, go to line 21.
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 8mm; background-color:lightgray;"/>
									<div class="styLNAmountBox"   style="width: 32mm; height: 8mm; background-color:lightgray; border-bottom-width: 1px;"/>

										</div>
								<!--END Line 20-->
								<!-- BEGIN Part II-B Title -->
					<div class="styBB" style="width: 187mm; height: 4.5mm; border-top-width: 1px; clear:left; float: left;">
						<div class="styPartName" style="font-family:Arial;font-size:10pt;">
							Part II-B
						</div>
						<div class="styPartDesc" style="font-family:Arial;font-size:10pt;">
							Certain Filers Who Have Three or More Qualifying Children
						</div>
					</div>
					<!-- Line 21 -->
								<div style="width: 187mm; height: 14mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBox" style="width: 8mm; height: 14mm; padding-left: 3mm; padding-top: .75mm;">21 </div>
									<div class="styLNDesc" style="width:103mm; height:14mm; padding-top: 1mm;">
										<span style="float:left;clear:none;">Withheld social security, Medicare, and Additional Medicare taxes from Form(s) W-2, boxes 4 and 6. If married filing jointly, include your spouse’s amounts with yours. If your employer withheld or you paid Additional Medicare Tax or tier 1 RRTA taxes, see instructions
										<span class="styDotLn" style="float:right;padding-right:2mm;">.......</span></span>
										
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 14mm; padding-top: 11mm;">21 </div>
									<div class="styLNAmountBox" style="width: 32mm; height: 14mm; padding-top: 1mm; padding-right: 0.5mm; border-bottom-width: 1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/TotalEarnedIncomeAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="width: 6.2mm; height: 14mm; padding-top: 1.3mm; border-right-width: 1px; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!-- END Line 21 -->
								<!-- Line 22 -->
								<div style="width: 187mm; height: 11mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBox" style="width: 8mm; height: 11mm; padding-left: 3mm; padding-top: .75mm;">22 </div>
									<div class="styLNDesc" style="width:103mm; height:11mm; padding-top: 1mm;">
										<span style="float:left;clear:none;">Enter the total of the amounts from Schedule 1 (Form 1040), line 15; Schedule 2 (Form 1040), line 5; Schedule 2 (Form 1040), line 6; and Schedule 2 (Form 1040), line 13
										<span class="styDotLn" style="float:right;padding-right:2mm;">..............</span></span>
										
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 11mm; padding-top: 7mm;">22 </div>
									<div class="styLNAmountBox" style="width: 32mm; height: 11mm; padding-top: 1mm; padding-right: 0.5mm; border-bottom-width: 1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/TotalEarnedIncomeAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="width: 6.2mm; height: 14mm; padding-top: 1.3mm; border-right-width: 1px; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!-- END Line 22 -->
								<!-- Line 23 -->
								<div style="width: 187mm; height: 5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBox" style="width: 8mm; height: 5mm; padding-left: 3mm; padding-top: .75mm;">23 </div>
									<div class="styLNDesc" style="width:103mm; height:5mm; padding-top: 1mm;">
										<span style="float:left;clear:none;">Add lines 21 and 22</span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">..................</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 5mm; padding-top: 1mm;">23 </div>
									<div class="styLNAmountBox" style="width: 32mm; height: 5mm; padding-top: 1mm; padding-right: 0.5mm; border-bottom-width: 1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/TotalEarnedIncomeAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="width: 6.2mm; height: 5mm; padding-top: 1.3mm; border-right-width: 1px; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!-- END Line 23 -->
								<!--Line 24-->
								<div style="width: 187mm; height: 23mm; clear: left; font-size: 7.5pt; float: left;">
								
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 14.5mmmm; padding-left: 3mm;">24</div>
									<div class="styLNDesc" style="width: 103mm; height: 14.5mm;">
										<span style="float:left;clear:none;">  
				                         	<b>1040 and</b>
				                        </span>
				                    <br/>
				                    <div>
				                    <div style="float:left;font-size:7pt;width:80mm;height:18mm;padding-top:.7mm;">
									   <b>1040-SR filers:</b> Enter the total of the amounts from Form 1040 or 1040-SR, line 27a<br/>
									   and Schedule 3 (Form 1040), line 11.
									   <div style="float:left;font-size:7pt;width:80mm;height:18mm;padding-top:.7mm;">
									   <b>1040-NR filers:</b> Enter the amount from Schedule 3 (Form 1040), line 11.
									 </div>
						            </div>
						            <div style="float:left;width:5mm;height:18mm;">
										<img alt="right bracket" height="50px" src="{$ImagePath}/8912_Bracket_Sm.gif"/>
									</div>
									<div style="float:left;width:5mm;height:18mm;padding-top:5mm;">
									</div>
						            </div> 
						            </div>						             
				                	<div class="styLNRightNumBox" style="width: 6mm;  height: 23mm; padding-top:19mm;">24</div>
								<div class="styLNAmountBox"   style="width: 32mm; height: 23mm; padding-top:8mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="width: 6.2mm; height: 23mm; padding-top: 1.3mm; border-right-width: 1px; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!--END Line 24-->
								<!--Line 25-->
								<div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 5mm; padding-left: 3mm;">25</div>
									<div class="styLNDesc" style="width: 141mm; height: 4.5mm;padding-left: 2mm">
										<span style="float:left;clear:none;">  
				                         	Subtract line 24 from line 23. If zero or less, enter -0-
				                        </span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">...............</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4.5mm;">25</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!--END Line 25-->
								<!--Line 26-->
								<div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 5mm; padding-left: 3mm;">26</div>
									<div class="styLNDesc" style="width: 141mm; height: 4.5mm;padding-left: 2mm">
										<span style="float:left;clear:none;">  
				                         	Enter the larger of line 20 or line 25
				                        </span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">.....................</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4.5mm;">26</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styLNDesc" style="width: 149mm; height: 4.5mm;padding-left: 10mm">
										<span style="float:left;clear:none;">  
				                         	<b>Next,</b> enter the <b>smaller</b> of line 17 or line 26 on line 27.
				                        </span>
				                        	</div>
				                        	<div class="styLNRightNumBox" style="width: 38mm; height: 4mm; background-color:lightgray; border-bottom-width: 0px;"/>

								<!--END Line 26-->
								<!-- BEGIN Part II-C Title -->
					<div class="styBB" style="width: 187mm; height: 4.5mm; border-top-width: 1px; clear:left; float: left;">
						<div class="styPartName" style="font-family:Arial;font-size:10pt;">
							Part II-C
						</div>
						<div class="styPartDesc" style="font-family:Arial;font-size:10pt;">
							Additional Child Tax Credit
						</div>
					</div>
					<!--Line 27-->
								<div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 5mm; padding-left: 3mm;">27</div>
									<div class="styLNDesc" style="width: 141mm; height: 4.5mm;padding-left: 2mm">
										<span style="float:left;clear:none;">  
				                         	Enter this amount on line 15c
				                        </span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">...............</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4.5mm;">27</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!--END Line 27-->
								<div class="pageEnd" style="width: 187mm; height: 4mm; clear: both; font-family: Arial; font-size: 7pt; border-top-color: black; border-top-width: 2px; border-top-style: solid; float: none;">
								<span style="float:right;clear:none;font-weight:bold;">Schedule 8812 (Form 1040) 2021</span>
								</div>
								<!--Begin Page 3 -->
					<!-- Page Header -->
					<div class="styTBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Schedule 8812 (Form 1040) 2021</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span></div>
					</div>
					<!-- END Page Header -->	
					<!-- BEGIN Part III Title -->
					<div class="styBB" style="width: 187mm; height: 4.5mm; border-top-width: 1px; clear:left; float: left;">
						<div class="styPartName" style="font-family:Arial;font-size:10pt;">
							Part III
						</div>
						<div class="styPartDesc" style="font-family:Arial;font-size:10pt;">
							<b>Additional Tax</b> (use only if line 14g or line 15f is zero)
						</div>
					</div>
					<div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 5mm; padding-left: 3mm;">28a</div>
									<div class="styLNDesc" style="width: 141mm; height: 4.5mm;padding-left: 2mm">
										<span style="float:left;clear:none;">  
				                         	Enter the amount from line 14f or line 15e, whichever applies
				                        </span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">.............</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4.5mm;">28a</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 5mm; padding-left: 7mm;">b</div>
									<div class="styLNDesc" style="width: 141mm; height: 4.5mm;padding-left: 2mm">
										<span style="float:left;clear:none;">  
				                         	Enter the amount from line 14e or line 15d, whichever applies
				                        </span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">.............</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4.5mm;">28b</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div style="width: 187mm; height: 9.5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 10mm; padding-left: 3mm;">29</div>
									<div class="styLNDesc" style="width: 141mm; height: 9.5mm;padding-left: 2mm">
										<span style="float:left;clear:none;">  
				                         	Excess advance child tax credit payments. Subtract line 28b from line 28a. If zero, stop; you do not owe the additional tax
				                      <span class="styDotLn" style="float:right;padding-right:2mm;">.........................</span>  </span>
										
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 8.5mm;padding-top:5mm">29</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 8.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div style="width: 187mm; height: 12mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 10mm; padding-left: 3mm;">30</div>
									<div class="styLNDesc" style="width: 141mm; height: 12mm;padding-left: 2mm;">
										<span style="float:left;clear:none;">  
				                         	Enter the number of qualifying children taken into account in determining the annual advance amount you received for 2021. See your Letter 6419 for this number. If you are missing your Letter 6419, you are filing a joint return, or you received more than one Letter 6419, see the instructions before entering a number on this line
				                         	<span class="styDotLn" style="float:right;padding-right:2mm;">..</span>
				                        </span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 12mm;padding-top:7mm;">30</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 12mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div style="width: 187mm; height: 7mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNDesc" style="width:149mm; height:7mm; padding-left:10mm; padding-top: 0mm;">
										<span style="float:left;clear:none;"><b>Caution:</b> If the amount on this line doesn’t match the number of qualifying children reported to you (and your spouse if filing jointly) on your Letter(s) 6419, the processing of your return will be delayed.</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6.2mm; height: 7mm; padding-top: 1.3mm; border-right-width: 1px; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 10mm; padding-left: 3mm;">31</div>
									<div class="styLNDesc" style="width: 141mm; height: 4.5mm;padding-left: 2mm">
										<span style="float:left;clear:none;">  
				                         	Enter the smaller of line 4a or line 30
				                        </span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">.....................</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4.5mm;">31</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div style="width: 187mm; height: 7mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 12mm; padding-left: 3mm;">32</div>
									<div class="styLNDesc" style="width: 141mm; height: 7mm;padding-left: 2mm">
										<span style="float:left;clear:none;">  
				                         	Subtract line 31 from line 30. If zero, skip to line 40 and enter the amount from line 29; otherwise, continue to line 33
				                       <span class="styDotLn" style="float:right;padding-right:2mm;">...........................</span> </span>
										
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 7mm;padding-top:3mm">32</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 7mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!--Line 33-->
								<div style="width: 187mm; height: 17mm; clear: left; font-size: 7.5pt; float: left;">
								
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 11.5mmmm; padding-left: 3mm;">33</div>
									<div class="styLNDesc" style="width: 141mm; height: 11.5mm;">
										<span style="float:left;clear:none;">  
				                         	Enter the amount shown below for your filing status.
				                        </span>
				                    <br/>
				                    <div>
				                    <div style="float:left;font-size:7pt;width:80mm;height:12mm;padding-top:.7mm;">
									   &#8226; Married filing jointly or Qualifying widow(er)--$60,000.<br/>
									   &#8226; Head of household--$50,000<br/>
									   &#8226; All other filing statuses--$40,000
						            </div>
						            <div style="float:left;width:5mm;height:12mm;">
						            
										<img alt="right bracket" height="60px" src="{$ImagePath}/8912_Bracket_Sm.gif"/>
										
									</div>
									<div style="float:left;width:5mm;height:12mm;padding-top:5mm;">
										
									</div>
						            </div><span style="letter-spacing:2mm;font-weight:bold;">.................</span>
						            
						            </div>
				                
				                <div class="styLNRightNumBox" style="width: 6mm;  height: 17mm; padding-top:13mm;">33</div>
								<div class="styLNAmountBox"   style="width: 32mm; height: 17mm; padding-top:13mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 10mm; padding-left: 3mm;">34</div>
									<div class="styLNDesc" style="width: 141mm; height: 4.5mm;padding-left: 2mm">
										<span style="float:left;clear:none;">  
				                         	Subtract line 33 from line 3. If zero or less, enter -0-
				                        </span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">................</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4.5mm;">34</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div><div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 10mm; padding-left: 3mm;">35</div>
									<div class="styLNDesc" style="width: 141mm; height: 4.5mm;padding-left: 2mm">
										<span style="float:left;clear:none;">  
				                         	Enter the amount from line 33
				                        </span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">.......................</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4.5mm;">35</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div style="width: 187mm; height: 7mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 12mm; padding-left: 3mm;">36</div>
									<div class="styLNDesc" style="width: 141mm; height: 7mm;padding-left: 2mm">
										<span style="float:left;clear:none;">  
				                         	Divide line 34 by line 35. Enter the result as a decimal (rounded to at least three places). If the result is 1.000 or more, enter 1.000
				                       <span class="styDotLn" style="float:right;padding-right:2mm;">.......................</span> </span>
										
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 7mm;padding-top:3mm">36</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 7mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								
								<div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 10mm; padding-left: 3mm;">37</div>
									<div class="styLNDesc" style="width: 141mm; height: 4.5mm;padding-left: 2mm">
										<span style="float:left;clear:none;">  
				                         	Multiply line 32 by $2,000
				                        </span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">........................</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4.5mm;">37</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								
								<div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 10mm; padding-left: 3mm;">38</div>
									<div class="styLNDesc" style="width: 141mm; height: 4.5mm;padding-left: 2mm">
										<span style="float:left;clear:none;">  
				                         	Multiply line 37 by line 36
				                        </span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">........................</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4.5mm;">38</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								
								<div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 10mm; padding-left: 3mm;">39</div>
									<div class="styLNDesc" style="width: 141mm; height: 4.5mm;padding-left: 2mm">
										<span style="float:left;clear:none;">  
				                         	Subtract line 38 from line 37
				                        </span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">.......................</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4.5mm;">39</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div style="width: 187mm; height: 7mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 12mm; padding-left: 3mm;">40</div>
									<div class="styLNDesc" style="width: 141mm; height: 7mm;padding-left: 2mm">
										<span style="float:left;clear:none;">  
				                         	Subtract line 39 from line 29. If zero or less, enter -0-. <b>This is your additional tax. If more than zero, enter this amount on Schedule 2 (Form 1040), line 19</b>
				                       <span class="styDotLn" style="float:right;padding-right:2mm;">...........</span> </span>
										
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 7mm;padding-top:3mm">40</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 7mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="pageEnd" style="width: 187mm; height: 4mm; clear: both; font-family: Arial; font-size: 7pt; border-top-color: black; border-top-width: 2px; border-top-style: solid; float: none;">
								<span style="float:right;clear:none;font-weight:bold;">Schedule 8812 (Form 1040) 2021</span>
								</div>
								<!-- BEGIN -->
								<!-- Line 3 -->
								
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
