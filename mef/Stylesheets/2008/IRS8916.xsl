<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8916Style.xsl"/>
	<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8916"/>
	<xsl:template match="/">
		<html>
			<head>
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
				<meta name="Description" content="Schedule P (Form 5735)"/>
				<meta name="Generator" content="IBM WebSphere Studio"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8916Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form style="font-family:Arial; font-size:9pt">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Begin Form title an dForm number section -->
					<div class="styBB" style="width:187mm;clear:both;float:none;">
						<div class="styFNBox" style="width:31mm;height:18mm;">
                                           Form <span class="styFormNumber">8916</span>
                              <div class="styAgency" style="padding-left:3mm;padding-top:1.5mm;">(Rev. December 2008)</div>
                              <div class="styAgency" style="padding-left:3mm;height:1.5mm;">Department of the Treasury</div>
                                   <div class="styAgency" style="padding-left:3mm;height:1.5mm;">Internal Revenue Service</div>

						</div>
						<div class="styFTBox" style="width:125mm;height:15mm; ">
							<div class="styMainTitle" style="padding-top:0mm;">
                 Reconciliation of Schedule M-3 Taxable Income <br/>
                 with Tax Return Taxable Income for Mixed Groups
             </div>
							<div class="styFST" style="font-size:7pt;padding-top:5mm;font-weight:bold;">
								<img src="{$ImagePath}/8916_Bullet.gif" alt="bullet image"/>
              Attach to Schedule M-3 for Forms 1120, 1120-L, or 1120-PC.
            </div>
						</div>
						<div class="styTYBox" style="width:30mm;height:20.4mm;font-size:7pt;">
							<div class="styOMB" style="height:2mm;border-bottom-width:0px;">
              OMB No. 1545-2062
            </div>
	<!--						<div class="styTY" style="height:5mm;font-size:23pt; padding-top:2mm;">hhhhhh
								<div class="styTaxYear" style="height:9mm;padding-top:0;">20<span class="styTYColor">07</span>
								</div>  					
								</div>-->

						</div>
					</div>
					<!-- End form title and Form number Section -->
					<!-- Begin Name and Identifying Number Section-->
					<div class="styBB" style="width:187mm;clear:both;font-family:verdana;font-size:7pt;">
						<div class="styFNBox" style="width:144mm;height:8mm;">
            Name of common parent<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/BusinessName/BusinessNameLine1"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/BusinessName/BusinessNameLine2"/>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="padding-left:2mm;">
							<span class="BoldText">Employer identification number</span>
							<br/>
							<br/>
							<span style="font-weight:normal;">
								<xsl:choose>
									<xsl:when test="$FormData/EIN">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$FormData/EIN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/MissingEINReason"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!-- End Name and Identifying Number Section-->
					<!-- BEGIN Part I Line Items -->
					<!-- line 1 -->
					<div style="width:187mm">
						<div style="width:187mm;">
							<div style="float:right;">
								<div class="styIRS8916LNRightNumBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
							</div>
						</div>
						<div class="styIRS8916LNLeftNumBoxTop">1</div>
						<div style="float:left; width:113.5mm;height:4mm;">
                  Enter the tax reconciliation amount from the applicable line of Schedule M-3 (see instructions)
                  <span style="letter-spacing:3.3mm; font-weight:bold;padding-left:1mm;">......................</span>
						</div>
						<div class="styIRS8916LNRightNumBox" style="padding-top:4mm;height:8.5mm;">1</div>
						<div class="styIRS8916LNAmountBox" style="padding-top:4mm;height:8.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchM3TaxReconciliationAamt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0; height:8.5mm;"/>
						<div class="styIRS8916LNAmountBox" style="border-bottom:0; height:8.5mm;"/>
					</div>
					<!-- line 2a -->
					<div style="width:187mm">
						<div style="width:187mm;">
							<div style="float:right;">
								<div class="styIRS8916LNRightNumBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
							</div>
						</div>
						<div class="styIRS8916LNLeftNumBoxTop">2a</div>
						<div style="float:left; width:113.5mm;height:4mm;">
                  Life/non-life loss limitation amount
                  <span style="letter-spacing:3.3mm; font-weight:bold;padding-left:1mm;">................</span>
						</div>
						<div class="styIRS8916LNRightNumBox" style="padding-top:1mm;height:5.5mm;">2a</div>
						<div class="styIRS8916LNAmountBox" style="padding-top:1.5mm;height:5.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/LifeNonLifeLimitationAmount"/>
							</xsl:call-template>
						</div>
						<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0; height:5.5mm;"/>
						<div class="styIRS8916LNAmountBox" style="border-bottom:0; height:5.5mm;"/>
					</div>
					<!--End of line 2 -->
					<!-- Line 2b -->
					<div style="width:187mm">
						<div style="width:187mm;">
							<div style="float:right;">
								<div class="styIRS8916LNRightNumBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
							</div>
						</div>
						<div class="styIRS8916LNLeftNumBoxTop" style="padding-left:5mm;">b</div>
						<div style="float:left; width:113.5mm;height:4mm;">
                  Limitation on non-insurance losses (Form 1120-L, page 1, line 25
              <span style="letter-spacing:3.3mm; font-weight:bold;padding-left:1mm;">....</span>
						</div>
						<div class="styIRS8916LNRightNumBox" style="padding-top:1mm;height:5.5mm;">2b</div>
						<div class="styIRS8916LNAmountBox" style="padding-top:1.5mm;height:5.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/LimitationOnNonIssuranceLosses"/>
							</xsl:call-template>
						</div>
						<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0; height:5.5mm;"/>
						<div class="styIRS8916LNAmountBox" style="border-bottom:0; height:5.5mm;"/>
					</div>
					<!--End of line 2b -->
					<!-- line 2c -->
					<div style="width:187mm">
						<div class="styIRS8916LNLeftNumBoxTop" style="padding-left:5mm;">c</div>
						<div style="float:left">
             Amount subtracted from policyholders surplus account (Form 11 20-L, <br/>
             page 1, line 26)
             <span style="letter-spacing:3.3mm; font-weight:bold;padding-left:1mm;">...................</span>
						</div>
						<div style="float:right;">
							<div class="styIRS8916LNRightNumBox" style="height:8mm; padding-top:3mm;">2c</div>
							<div class="styIRS8916LNAmountBox" style="height:8mm;padding-top:4mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmtSubFromPlcyhldrsSurplusAcct"/>
								</xsl:call-template>
							</div>
							<div class="styIRS8916LNRightNumBoxNBB" style="height:8mm;background-color:lightgrey;border-bottom:0;"/>
							<div class="styIRS8916LNAmountBoxNBB" style="height:8mm;border-bottom:0;"/>
						</div>
					</div>
					<!-- End of 2c -->
					<!-- Line 2d(1) -->
					<div style="width:187mm">
						<div style="width:187mm;">
							<div style="float:right;">
								<div class="styIRS8916LNRightNumBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
							</div>
						</div>
						<div class="styIRS8916LNLeftNumBoxTop" style="padding-left:5mm;">d</div>
						<div style="float:left; width:113.5mm;height:4mm;">
							<span style="font-weight:bold"> (1)</span> Non-life capital loss limitation
                     <span style="letter-spacing:3.3mm; font-weight:bold;padding-left:1mm;">................</span>
						</div>
						<div class="styIRS8916LNRightNumBox" style="padding-top:1mm;font-size:6pt; height:5mm;">2d(1)</div>
						<div class="styIRS8916LNAmountBox" style="padding-top:1mm;height:5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NonLifeCapitalLossLimitation"/>
							</xsl:call-template>
						</div>
						<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0; height:5mm;"/>
						<div class="styIRS8916LNAmountBox" style="border-bottom:0; height:5mm;"/>
					</div>
					<!--End of line 2d(1) -->
					<!-- Line 2d(2) -->
					<div style="width:187mm">
						<div style="width:187mm;">
							<div style="float:right;">
								<div class="styIRS8916LNRightNumBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
							</div>
						</div>
						<div class="styIRS8916LNLeftNumBoxTop" style="padding-left:5mm;"/>
						<div style="float:left; width:113.5mm;height:4mm;">
							<span style="font-weight:bold"> (2)</span> Life capital loss limitation
                    <span style="letter-spacing:3.3mm; font-weight:bold;padding-left:1mm;">.................</span>
						</div>
						<div class="styIRS8916LNRightNumBox" style="padding-top:1.5mm;font-size:6pt;height:5.5mm;">2d(2)</div>
						<div class="styIRS8916LNAmountBox" style="padding-top:1mm; height:5.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/LifeCapitalLossLimitation"/>
							</xsl:call-template>
						</div>
						<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0; height:5.5mm;"/>
						<div class="styIRS8916LNAmountBox" style="border-bottom:0; height:5.5mm;"/>
					</div>
					<!--End of line 2d(2) -->
					<!-- Line 2e(1) -->
					<div style="width:187mm">
						<div style="width:187mm;">
							<div style="float:right;">
								<div class="styIRS8916LNRightNumBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
							</div>
						</div>
						<div class="styIRS8916LNLeftNumBoxTop" style="padding-left:5mm;">e</div>
						<div style="float:left; width:113.5mm;height:4mm;">
							<span style="font-weight:bold"> (1)</span> Non-life charitable deduction limitation
                 <span style="letter-spacing:2.3mm; font-weight:bold;padding-left:1mm;">...............</span>
						</div>
						<div class="styIRS8916LNRightNumBox" style="padding-top:1mm;font-size:6pt; height:5.5mm;">2e(1)</div>
						<div class="styIRS8916LNAmountBox" style="padding-top:1mm;height:5.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NonLifeCharitableDedLmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0; height:5.5mm;"/>
						<div class="styIRS8916LNAmountBox" style="border-bottom:0; height:5.5mm;"/>
					</div>
					<!--End of line 2e(1) -->
					<!-- Line 2e(2) -->
					<div style="width:187mm">
						<div style="width:187mm;">
							<div style="float:right;">
								<div class="styIRS8916LNRightNumBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
							</div>
						</div>
						<div class="styIRS8916LNLeftNumBoxTop" style="padding-left:5mm;"/>
						<div style="float:left; width:113.5mm;height:4mm;">
							<span style="font-weight:bold"> (2)</span> Life charitable deduction limitation
                    <span style="letter-spacing:3.3mm; font-weight:bold;padding-left:1mm;">.............</span>
						</div>
						<div class="styIRS8916LNRightNumBox" style="padding-top:1.5mm;font-size:6pt;height:5.5mm;">2e(2)</div>
						<div class="styIRS8916LNAmountBox" style="padding-top:1.5mm;height:5.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/LifeCharitableDedLmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0; height:5.5mm;"/>
						<div class="styIRS8916LNAmountBox" style="border-bottom:0; height:5.5mm;"/>
					</div>
					<!--End of line 2e(2) -->
					<!-- Line 2f(1) -->
					<div style="width:187mm">
						<div style="width:187mm;">
							<div style="float:right;">
								<div class="styIRS8916LNRightNumBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
							</div>
						</div>
						<div class="styIRS8916LNLeftNumBoxTop" style="padding-left:5mm;">f</div>
						<div style="float:left; width:113.5mm;height:4mm;">
							<span style="font-weight:bold"> (1)</span> Non-life dual consolidated loss amount disallowed          
                 <span style="letter-spacing:3.3mm; font-weight:bold;padding-left:1mm;">........</span>
						</div>
						<div class="styIRS8916LNRightNumBox" style="padding-top:1.5mm;font-size:6pt; height:5.5mm;">2f(1)</div>
						<div class="styIRS8916LNAmountBox" style="padding-top:1.5mm;height:5.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NonLifeDualConsolidatedLoss"/>
							</xsl:call-template>
						</div>
						<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0; height:5.5mm;"/>
						<div class="styIRS8916LNAmountBox" style="border-bottom:0; height:5.5mm;"/>
					</div>
					<!--End of line 2f(1) -->
					<!-- Line 2f(2) -->
					<div style="width:187mm">
						<div style="width:187mm;">
							<div style="float:right;">
								<div class="styIRS8916LNRightNumBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
							</div>
						</div>
						<div class="styIRS8916LNLeftNumBoxTop" style="padding-left:5mm;"/>
						<div style="float:left; width:113.5mm;height:4mm;">
							<span style="font-weight:bold"> (2)</span> Life dual consolidated loss amount disallowed
                    <span style="letter-spacing:3.3mm; font-weight:bold;padding-left:1mm;">.........</span>
						</div>
						<div class="styIRS8916LNRightNumBox" style="padding-top:1.5mm;font-size:6pt;">2f(2)</div>
						<div class="styIRS8916LNAmountBox" style="padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/LifeDualConsolidatedLoss"/>
							</xsl:call-template>
						</div>
						<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0; height:5mm;"/>
						<div class="styIRS8916LNAmountBox" style="border-bottom:0; height:5mm;"/>
					</div>
					<!--End of line 2f(2) -->
					<!-- line 3 -->
					<div style="width:187mm">
						<div style="width:187mm;">
							<div style="float:right;">
								<div class="styIRS8916LNRightNumBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
							</div>
						</div>
						<div class="styIRS8916LNLeftNumBoxTop" style="padding-left:2.6mm;">3</div>
						<div style="float:left">
         Combine lines 1 through 2f(2)          
        </div>
						<div style="float:right">
							<span class="styDotLn">      
            ......................
          </span>
							<div class="styIRS8916LNRightNumBox">3</div>
							<div class="styIRS8916LNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SchM3TaxRecnclPlusLmtAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End of line 3 -->
					<!-- Line 4a(1) -->
					<div style="width:187mm">
						<div style="width:187mm;">
							<div style="float:right;">
								<div class="styIRS8916LNRightNumBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
							</div>
						</div>
						<div class="styIRS8916LNLeftNumBoxTop">4a</div>
						<div style="float:left; width:113.5mm;height:4mm;">
							<span style="font-weight:bold"> (1)</span> Non-life net operating loss deduction
                     <span style="letter-spacing:3.3mm; font-weight:bold;padding-left:1mm;">.............</span>
						</div>
						<div class="styIRS8916LNRightNumBox" style="padding-top:1mm;font-size:6pt; height:5mm;">4a(1)</div>
						<div class="styIRS8916LNAmountBox" style="padding-top:1mm;height:5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NonLifeNetOperatingLossDed"/>
							</xsl:call-template>
						</div>
						<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0; height:5mm;"/>
						<div class="styIRS8916LNAmountBox" style="border-bottom:0; height:5mm;"/>
					</div>
					<!--End of line 4a(1) -->
					<!-- Line 4a(2) -->
					<div style="width:187mm">
						<div style="width:187mm;">
							<div style="float:right;">
								<div class="styIRS8916LNRightNumBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
							</div>
						</div>
						<div class="styIRS8916LNLeftNumBoxTop" style="padding-left:5mm;"/>
						<div style="float:left; width:113.5mm;height:4mm;">
							<span style="font-weight:bold"> (2)</span> Life operations loss deduction
                    <span style="letter-spacing:3.3mm; font-weight:bold;padding-left:1mm;">...............</span>
						</div>
						<div class="styIRS8916LNRightNumBox" style="padding-top:1.5mm;font-size:6pt;height:5.5mm;">4a(2)</div>
						<div class="styIRS8916LNAmountBox" style="padding-top:1.5mm; height:5.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/LifeOperationsLossDeduction"/>
							</xsl:call-template>
						</div>
						<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0; height:5.5mm;"/>
						<div class="styIRS8916LNAmountBox" style="border-bottom:0; height:5.5mm;"/>
					</div>
					<!--End of line 4a(2) -->
					<!-- Line 4b(1) -->
					<div style="width:187mm">
						<div style="width:187mm;">
							<div style="float:right;">
								<div class="styIRS8916LNRightNumBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
							</div>
						</div>
						<div class="styIRS8916LNLeftNumBoxTop" style="padding-left:5mm;">b</div>
						<div style="float:left; width:113.5mm;height:4mm;">
							<span style="font-weight:bold"> (1)</span> Non-life dividends received deduction
                 <span style="letter-spacing:3.3mm; font-weight:bold;padding-left:1mm;">.............</span>
						</div>
						<div class="styIRS8916LNRightNumBox" style="padding-top:1.5mm;font-size:6pt; height:5.5mm;">4b(1)</div>
						<div class="styIRS8916LNAmountBox" style="padding-top:1.5mm;height:5.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NonLifeDividendsReceivedDed"/>
							</xsl:call-template>
						</div>
						<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0; height:5.5mm;"/>
						<div class="styIRS8916LNAmountBox" style="border-bottom:0; height:5.5mm;"/>
					</div>
					<!--End of line 4b(1) -->
					<!-- Line 4b(2) -->
					<div style="width:187mm">
						<div style="width:187mm;">
							<div style="float:right;">
								<div class="styIRS8916LNRightNumBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
							</div>
						</div>
						<div class="styIRS8916LNLeftNumBoxTop" style="padding-left:5mm;"/>
						<div style="float:left; width:113.5mm;height:4mm;">
							<span style="font-weight:bold"> (2)</span> Life dividends received deduction
                    <span style="letter-spacing:3.3mm; font-weight:bold;padding-left:1mm;">..............</span>
						</div>
						<div class="styIRS8916LNRightNumBox" style="padding-top:1.5mm;font-size:6pt;height:5.5mm;">4b(2)</div>
						<div class="styIRS8916LNAmountBox" style="padding-top:1.5mm;height:5.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/LifeDividendsReceivedDed"/>
							</xsl:call-template>
						</div>
						<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0; height:5.5mm;"/>
						<div class="styIRS8916LNAmountBox" style="border-bottom:0; height:5.5mm;"/>
					</div>
					<!--End of line 4b(2) -->
					<!-- Line 4c(1) -->
					<div style="width:187mm">
						<div style="width:187mm;">
							<div style="float:right;">
								<div class="styIRS8916LNRightNumBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
							</div>
						</div>
						<div class="styIRS8916LNLeftNumBoxTop" style="padding-left:5mm;">c</div>
						<div style="float:left; width:113.5mm;height:4mm;">
							<span style="font-weight:bold"> (1)</span> Non-life capital loss carryforward used          
                 <span style="letter-spacing:3.3mm; font-weight:bold;padding-left:1mm;">.............</span>
						</div>
						<div class="styIRS8916LNRightNumBox" style="padding-top:0mm;font-size:6pt;height:5.5mm;padding-top:1.5mm;">4c(1)</div>
						<div class="styIRS8916LNAmountBox" style="padding-top:1.5mm;height:5.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NonLifeCapitalLossCfwdUsed"/>
							</xsl:call-template>
						</div>
						<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0; height:5.5mm;"/>
						<div class="styIRS8916LNAmountBox" style="border-bottom:0; height:5.5mm;"/>
					</div>
					<!--End of line 4c(1) -->
					<!-- Line 4c(2) -->
					<div style="width:187mm">
						<div style="width:187mm;">
							<div style="float:right;">
								<div class="styIRS8916LNRightNumBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
							</div>
						</div>
						<div class="styIRS8916LNLeftNumBoxTop" style="padding-left:5mm;"/>
						<div style="float:left; width:113.5mm;height:4mm;">
							<span style="font-weight:bold"> (2)</span> Life capital loss carryforward used
                    <span style="letter-spacing:3.3mm; font-weight:bold;padding-left:1mm;">..............</span>
						</div>
						<div class="styIRS8916LNRightNumBox" style="padding-top:1.5mm;font-size:6pt;height:5mm">4c(2)</div>
						<div class="styIRS8916LNAmountBox" style="padding-top:1mm;height:5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/LifeCapitalLossCfwdUsed"/>
							</xsl:call-template>
						</div>
						<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0; height:5mm;"/>
						<div class="styIRS8916LNAmountBox" style="border-bottom:0; height:5mm;"/>
					</div>
					<!--End of line 4c(2) -->
					<!-- Line 4d(1) -->
					<div style="width:187mm">
						<div style="width:187mm;">
							<div style="float:right;">
								<div class="styIRS8916LNRightNumBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
							</div>
						</div>
						<div class="styIRS8916LNLeftNumBoxTop" style="padding-left:5mm;">d</div>
						<div style="float:left; width:113.5mm;height:4mm;">
							<span style="font-weight:bold"> (1)</span> Non-life charitable deduction carryforward used          
                 <span style="letter-spacing:3.3mm; font-weight:bold;padding-left:1mm;">.........</span>
						</div>
						<div class="styIRS8916LNRightNumBox" style="padding-top:1.5mm;font-size:6pt; height:5.5mm;">4d(1)</div>
						<div class="styIRS8916LNAmountBox" style="padding-top:1.5mm;height:5.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NonLifeCharitableDedCfwdUsed"/>
							</xsl:call-template>
						</div>
						<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0; height:5.5mm;"/>
						<div class="styIRS8916LNAmountBox" style="border-bottom:0; height:5.5mm;"/>
					</div>
					<!--End of line 4d(1) -->
					<!-- Line 4d(2) -->
					<div style="width:187mm">
						<div style="width:187mm;">
							<div style="float:right;">
								<div class="styIRS8916LNRightNumBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
							</div>
						</div>
						<div class="styIRS8916LNLeftNumBoxTop" style="padding-left:5mm;"/>
						<div style="float:left; width:113.5mm;height:4mm;">
							<span style="font-weight:bold"> (2)</span> Life charitable deduction carryforward used
                    <span style="letter-spacing:3.3mm; font-weight:bold;padding-left:1mm;">...........</span>
						</div>
						<div class="styIRS8916LNRightNumBox" style="padding-top:1.5mm;font-size:6pt;height:5.5mm;">4d(2)</div>
						<div class="styIRS8916LNAmountBox" style="padding-top:1mm;height:5.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/LifeCharitableDedCfwdUsed"/>
							</xsl:call-template>
						</div>
						<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0; height:5.5mm;"/>
						<div class="styIRS8916LNAmountBox" style="border-bottom:0; height:5.5mm;"/>
					</div>
					<!--End of line 4d(2) -->
					<!-- Line 4e(1) -->
					<div style="width:187mm">
						<div style="width:187mm;">
							<div style="float:right;">
								<div class="styIRS8916LNRightNumBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
							</div>
						</div>
						<div class="styIRS8916LNLeftNumBoxTop" style="padding-left:5mm;">e</div>
						<div style="float:left; width:113.5mm;height:4mm;">
                Small life insurance company deduction (Form 1120-L, page 1, line 23)          
                 <span style="letter-spacing:3.3mm; font-weight:bold;padding-left:1mm;">..</span>
						</div>
						<div class="styIRS8916LNRightNumBox" style="padding-top:1mm; height:5.5mm;">4e</div>
						<div class="styIRS8916LNAmountBox" style="padding-top:1.5mm;height:5.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SmallLifeInsuranceCompanyDed"/>
							</xsl:call-template>
						</div>
						<div class="styIRS8916LNRightNumBox" style="background-color:lightgrey;border-bottom:0; height:5.5mm;"/>
						<div class="styIRS8916LNAmountBox" style="border-bottom:0; height:5.5mm;"/>
					</div>
					<!--End of line 4e(1) -->
					<!-- line 5 -->
					<div style="width:187mm">
						<div class="styIRS8916LNLeftNumBoxTop" style="padding-left:2.6mm;">5</div>
						<div style="float:left">
         Add lines 4a(1) through 4e          
        </div>
						<div style="float:right">
							<span class="styDotLn">      
            .......................
          </span>
							<div class="styIRS8916LNRightNumBox">5</div>
							<div class="styIRS8916LNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AddCfwdAndDeductionAmounts"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--End of line 5-->
					<!-- Line 6 -->
					<div style="width:187mm">
						<div style="width:187mm;">
							<div style="float:right;">
								<div class="styIRS8916LNRightNumBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
							</div>
						</div>
						<div class="styIRS8916LNLeftNumBoxTop" style="padding-left:2.6mm;">6</div>
						<div style="float:left">
         Subtract line 5 from line 3          
        </div>
						<div style="float:right;">
							<span class="styDotLn">      
            .......................
          </span>
							<div class="styIRS8916LNRightNumBox">6</div>
							<div class="styIRS8916LNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SubCfwdAndDedFrmShM3PlusLmtAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--End of line 6 -->
					<div style="width:187mm">
						<div style="width:187mm;">
							<div style="float:right;">
								<div class="styIRS8916LNRightNumBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
							</div>
						</div>
						<div class="styIRS8916LNLeftNumBoxTop" style="padding-left:2.6mm;">7</div>
						<div style="float:left">
         Other adjustments to reconcile to taxable income on tax return (attach schedule)      
              <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/OtherReconcileAdjustments"/>
							</xsl:call-template>
						</div>
						<div style="float:right;">
							<span class="styDotLn">      
            ......
          </span>
							<div class="styIRS8916LNRightNumBox">7</div>
							<div class="styIRS8916LNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherReconcileAdjustments"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- line 8 -->
					<div style="width:187mm;">
						<div style="width:187mm;">
							<div style="float:right;">
								<div class="styIRS8916LNRightNumBox" style="border-bottom:0;"/>
								<div class="styIRS8916LNAmountBox" style="border-bottom:0;"/>
							</div>
						</div>
						<div class="styIRS8916LNLeftNumBoxTop" style="padding-left:2.6mm;">8</div>
						<div style="float:left;width:146.2mm;">
							<span style="font-weight:bold">Total.</span> Combine lines 6 and 7. This amount must equal the amount reported on the "Taxable Income"</div>
						<div class="styIRS8916LNRightNumBox" style="border-bottom:0px;border-right:1 solid black;width:7.2mm; height:4.5mm; "/>
						<div style="float:left;width:154.2mm;padding-left:8mm;"> line of  the consolidated
               Form 1120, Form 1120-L, or Form 1120-PC, (see instructions)
          </div>
						<div style="float:right;">
							<div class="styIRS8916LNRightNumBoxNBB">8</div>
							<div class="styIRS8916LNAmountBoxNBB" style="padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/Total"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  End of Page  -->
					<div style="width:187mm; border-top:1 solid Black; font-size:8pt;">
						<div style="font-weight:bold; float:left; padding-top:0.5mm;">
             For Paperwork Reduction Act Notice,  see page 2.  
        </div>
						<div style="float:right">
							<span style="margin-right:20mm; font-size:7pt;">Cat. No. 37727E</span>          
          Form <b>8916</b> (12-2008)   
        </div>
					</div>
					<p style="page-break-before:always"/>
					<div class="styLeftOverTitleLine" id="LeftoverData" style="font-family:verdana, arial, sans-serif">
						<div class="styLeftOverTitle">
          Additional Data        
        </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage()" tabindex="1"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
