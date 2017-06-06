<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS3800Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="Form3800Data" select="$RtnDoc/IRS3800"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form3800Data)"/>
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
				<meta name="Description" content="IRS Form 3800"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!--PRINT STATEMENT-->
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS3800Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form3800" style="font-size:7pt;">
					<!-- BEGIN WARNING LINE -->
					<xsl:call-template name="DocumentHeader"/>
					<!-- END WARNING LINE -->
					<!-- Begin Form Number and Name -->
					<div class="styTBB" style="width:187mm;height:21mm;">
						<div class="styFNBox" style="width:29mm;height:21mm;">
							<div style="height:13mm;">
               Form<span class="styFormNumber"> 3800</span>
								<br/>
								<!--General Dependency Push Pin-->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form3800Data"/>
								</xsl:call-template>
							</div>
							<div style="height:8mm;padding-top:.75mm;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service <span style="padding-left:0mm;">(99)</span>
								</span>
							</div>
						</div>
						<div class="styFTBox" style="width:128mm;height:21mm;">
							<div style="height:10mm;" class="styMainTitle">General Business Credit</div>
							<div class="styFST" style="height:5mm;padding-top:4mm;">
								<img src="{$ImagePath}/3800_Bullet.gif" alt="bullet image"/>
                 Information about Form 3800 and its separate instructions is at <!--<i>www.irs.gov/form3800.</i>-->
								<a style="text-decoration:none;color:black;" href="http://www.irs.gov/form3800" title="Link to irs.gov">
									<i>www.irs.gov/form3800.</i>
								</a>
							</div>
							<div class="styFST" style="font-size:7pt;">
								<img src="{$ImagePath}/3800_Bullet.gif" alt="bullet image"/>
                 You must attach all pages of Form 3800, pages 1, 2, and 3, to your tax return.
              </div>
						</div>
						<div class="styTYBox" style="width:30mm;height:21mm;">
							<div class="styOMB" style="height:2mm;">
                OMB No. 1545-0895
              </div>
							<div class="styTaxYear" style="height:9mm;padding-top:0;">20<span class="styTYColor">14</span>
							</div>
							<div style="text-align:left;padding-left:3mm;">Attachment Sequence No. <span class="styBoldText">22</span>
							</div>
						</div>
					</div>
					<!-- End Form Number and Name section -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:150mm;height:8mm;font-size:7pt;font-weight:normal;">
              Name(s) shown on return<br/>
							<span>
								<xsl:choose>
									<xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">Name</xsl:with-param>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
						<div class="styEINBox" style="width:30mm;height:4mm;padding-left:2mm;font-size:7pt;font-weight:bold;">
              Identifying number<br/>
							<br/>
							<span style="font-size: 7pt; font-weight: normal;text-align:left; vertical-align: bottom;">
								<xsl:choose>
									<xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">EIN</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!-- End Names and Identifying number section -->
					<!-- Begin Part I (Tentative Credit) Section -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="background-color:black;">Part I</div>
						<!-- Revisit:-->
						<div class="styPartDesc">
							<span style="width:158mm;">Current Year Credit for Credits Not Allowed Against Tentative Minimum Tax (TMT)</span>
							<div style="width:158mm;font-weight:normal">(See instructions and complete Part(s) III before Parts I and II)</div>
						</div>
					</div>
					<!--Part I, Important Line -->
					<!--  <xsl:if test="not($Form3800Data/GenBusCrOrEligSmllBusCrGrp/ConsolidatedBusinessCreditsGrp !='')">
         <xsl:call-template name="PartIIITemplate"/>        
         
        </xsl:if>-->
					<div class="styBB" style="width:187mm;">
						<!-- Part I, Line 1-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD">1</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;">General business credit from line 2 of all Parts III with box A checked </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">...........</div>
							</div>
							<div class="styLNRightNumBox">1</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/GeneralBusCrFromNnPssvActyAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Part I, Line 2-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD">2</div>
							<div class="styLNDesc" style="width:103mm;">
								<span style="float:left;">Passive activity credits from line 2 of all Parts III with box B checked </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;"/>
							</div>
							<div class="styLNRightNumBox">2</div>
							<div class="styLNAmountBox" style="width:28mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/CurrYearPassiveActyCreditsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;border-right-width:1px;border-bottom-width:0px;width:8.18mm;background-color:lightgrey;"/>
						</div>
						<!-- Part I, Line 3-->
						<div style="width:187mm;">
							<!-- extra space -->
							<div class="styLNLeftNumBoxSD">3</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;">Enter the applicable passive activity credits allowed for 2014(see instructions) </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">........</div>
							</div>
							<div class="styLNRightNumBox" style="width:8mm;">3</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/PssvActyForGenBusCrAllowedAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Part I, Line 4-->
						<div style="width:187mm;">
							<!--     Extra Space   -->
							<!--<div style="width:187mm;">
                <div class="styLNLeftNumBox" />
                <div class="styLNDesc" style="width:139mm;"/>
                <div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
                <div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
              </div>-->
							<!-- extra space -->
							<div class="styLNLeftNumBoxSD">4</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;">Carryforward of general business credit to 2014. Enter the amount from line 2 of Part III with box C</span>
								<span style="float:left;">   checked. See instructions for statement to attach
                    <!--Dotted Line-->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form3800Data/CYGeneralBusCrCarryforwardAmt"/>
									</xsl:call-template>
								</span>
								<div class="styDotLn" style="float:right;padding-right:1mm;">.................</div>
								<!--Dotted Line-->
							</div>
							<div class="styLNRightNumBox" style="height:5mm;padding-top:4.5mm;">4</div>
							<div class="styLNAmountBox" style="height:4mm;padding-top:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/CYGeneralBusCrCarryforwardAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Part I, Line 5-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD">5</div>
							<div class="styLNDesc" style="width:139mm;">
								<!-- Revisit: Changing year 2002 to 2003 -->
								<!--Passive activity credits allowed for 2002-->
								<span style="float:left;">Carryback of general business credit from 2015. Enter the amount from line 2 of Part III with box D</span>
								<span style="float:left;">checked (see instructions)</span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">...............</div>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-top:3.5mm;">5</div>
							<div class="styLNAmountBox" style="height:4mm;padding-top:3.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/CarryBackGeneralBusinessCrAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Part I, Line 6-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD">6</div>
							<div class="styLNDesc" style="width:139mm;">
								<!-- Revisit: Changing year 2002 to 2003 -->
								<!--Passive activity credits allowed for 2002-->
								<span style="float:left;">Add lines 1, 3, 4, and 5</span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">..........................</div>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4mm;padding-top:3mm;">6</div>
							<div class="styLNAmountBoxNBB" style="height:4mm;padding-top:3mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/CYCreditsNotAllwAgainstTMTAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Begin Part II Title -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="background-color:black;">Part II</div>
						<div class="styPartDesc">
							<span style="width:8px;"/>Allowable Credit
            </div>
					</div>
					<!-- Part II, Line 7 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="width:115mm;height:3mm;">
		       Regular tax before credits:
		       <li>Individuals. Enter the sum of the amounts from Form 1040, lines 44 and 46; or the
		       <span style="padding-left:4.6mm;">
		        sum of the amounts from Form 1040NR, lines 42 and 44
		        <span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;">........</span>
								</span>
							</li>
							<li>Corporations. Enter the amount from Form 1120, Schedule J, Part I, line 2; or the
		       <span style="padding-left:4.6mm;">
		        applicable line of your return
		        <span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;">.................</span>
								</span>
							</li>
							<li>Estates and trusts. Enter the sum of the amounts from Form 1041, Schedule G,<br/>
								<span style="padding-left:4.6mm;">
                lines 1a and 1b, or the amount from the applicable line of your return
                <span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;">.....</span>
								</span>
							</li>
						</div>
						<div class="styLNDesc" style="width:5mm;">
							<img src="{$ImagePath}/3800_Bracket_Lger.gif" height="85mm" alt="Curly Bracket Image"/>
						</div>
						<span style="width:18.7mm; height:14mm;letter-spacing:3.3mm; font-weight:bold; float:left;padding-bottom:0mm;padding-top:8.5mm;">...</span>
						<div class="styLNRightNumBox" style="height:9mm;border-bottom-width:0px;background-color:lightgrey;padding-top:5mm;width:8mm"/>
						<div class="styLNAmountBox" style="height:9mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;padding-top:5mm;"/>
						<div class="styLNRightNumBox" style="height:4.5mm;">7</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:32.25mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/RegularTaxBeforeCreditsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:12mm;border-bottom-width:0px;background-color:lightgrey;padding-top:5mm;width:8.03mm"/>
						<div class="styLNAmountBox" style="height:12mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;padding-top:5mm;"/>
					</div>
					<!-- Part II, Line 8 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">8</div>
						<div class="styLNDesc" style="width:115mm;height:4mm;">
                 Alternative minimum tax: 
                 <li>Individuals. Enter the amount from Form 6251, line 35<span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;">..........</span>
							</li>
							<li>Corporations. Enter the amount from Form 4626, line 14<span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;">.........</span>
							</li>
							<li>Estates and trusts. Enter the amount from Schedule I (Form 1041), line 56<span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;">...</span>
							</li>
						</div>
						<div class="styLNDesc" style="width:5mm; ">
							<img src="{$ImagePath}/3800_Bracket_Sm.gif" height="50mm" alt="Curly Bracket Image"/>
						</div>
						<span style="width:18.9mm; height:14mm;letter-spacing:3.3mm; font-weight:bold; float:left;padding-bottom:0mm;padding-top:4.5mm;padding-right:1mm;">  
                            ....
                    </span>
						<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;background-color:lightgrey;padding-top:1mm;"/>
						<div class="styLNAmountBox" style="height:4.5mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;padding-top:1mm;"/>
						<div class="styLNRightNumBox" style="height:4mm;width:8mm;">8</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/AlternativeMinimumTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;padding-top:2.5mm;background-color:lightgray;width:8mm;"/>
						<div class="styLNAmountBox" style="height:4.5mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;padding-top:2.5mm;"/>
					</div>
					<!-- Part II, Line 9 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc" style="width:138.9mm;">
							<span style="float:left;">Add lines 7 and 8 </span>
							<!--Dotted Line-->
							<div class="styDotLn" style="float:right;padding-right:1mm;">...........................</div>
						</div>
						<div class="styLNRightNumBox" style="width:8mm;">9</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/AdjustedRegTaxBeforeCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part II, Line 10a -->
					<!-- The following form element does not have a matching element in the schema -->
					<div style="width:187mm;">
						<!--     Extra Space   -->
						<div class="styLNLeftNumBox" style="height:1mm;"/>
						<div class="styLNDesc" style="width:107mm;height:1mm;"/>
						<div class="styLNAmountBox" style="height:1mm;border-left-width:0px;border-bottom-width:0px;border-left-width:0px;"/>
						<div class="styLNRightNumBox" style="height:1mm;border-bottom-width:0px;padding-top:.5mm;background-color:lightgray;width:8mm;"/>
						<div class="styLNAmountBox" style="height:1mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;padding-top:.5mm;width:31mm;"/>
						<!-- extra space -->
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">10a</div>
						<div class="styLNDesc" style="width:99mm;">
							<span style="float:left;">Foreign tax credit </span>
							<div class="styDotLn" style="float:right;padding-right:1mm;">..................</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">10a</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/ForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgray;height:4.5mm;width:8.3mm;border-right-width:1px"/>
					</div>
					<!-- Part II, Line 10b -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:4.5mm">b</div>
						<div class="styLNDesc" style="width:99mm;">
							<span style="float:left;">Certain allowable credits (see instructions) </span>
							<!--Dotted Line-->
							<div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
						</div>
						<div class="styLNRightNumBox">10b</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/CertainAllowableCreditsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.2mm;height:4.5mm;background-color:lightgrey;border-right-width:1px"/>
					</div>
					<!-- Part II, Line 10c -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:4.5mm;">c</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Add lines 10a and 10b </span>
							<!--Dotted Line-->
							<div class="styDotLn" style="float:right;padding-right:1mm;">...........................</div>
						</div>
						<div class="styLNRightNumBox">10c</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/TotalTaxCreditsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part II, Line 11 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:6mm;padding-top:3mm;">11</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="height:6mm;padding-top:3mm;">
								<b>Net income tax.</b> Subtract line 10c from line 9. If zero, skip lines 12 through 15 and enter -0- on line 16</span>
							<!--Dotted Line-->
							<div class="styDotLn" style="float:right;padding-right:1mm;"/>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:6.5mm;">11</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:6.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/NetIncomeTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part II, Line 12 -->
					<!--     Extra Space   -->
					<!--<div style="width:187mm;">
            <div class="styLNLeftNumBox" />
            <div class="styLNDesc" style="width:139mm;"/>
            <div class="styLNRightNumBox" style="border-bottom-width:0px; background-color:lightgrey;"/>
            <div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>-->
					<!-- extra space -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc" style="width:99mm;">
							<span style="float:left;">
								<span style="font-weight:bold;"> Net regular tax.</span> Subtract line 10c from line 7. 
              If zero or less, enter -0- </span>
							<div class="styDotLn" style="float:right;padding-right:1mm;">..</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm; ">12</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/NetRegularTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;width:8.2mm;border-right-width:1px"/>
						</div>
						<!-- Part II, Line 13 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;">13</div>
							<div class="styLNDesc" style="height:8mm;width:99mm;padding-top:4mm;">
								<span style="float:left;">
									<span style="font-family:arial;">
              Enter 25% (.25) of the excess, if any, of line 12 over $25,000 (see instructions)</span>
								</span>
								<div class="styDotLn" style="float:right;padding-right:1mm;">...</div>
							</div>
							<!--<div class="styLNRightNumBox" style="background-color: lightgrey; width:8mm;height:4mm;"/>-->
							<div class="styLNRightNumBox" style="padding-top:0mm;height:8mm;">
								<div style="background-color: lightgrey; width:7.75mm;height:4mm;"/>
								<div class="width:7.75mm;height:4mm;">13</div>
							</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3800Data/ExcessNetRegularTaxAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="width:8.2mm;height:8mm;background-color:lightgrey;border-right-width:1px"/>
						</div>
					<!--</div>-->
					<!-- Part II, Line 14 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc" style="width:82mm;">
             Tentative minimum tax: 
                <li>Individuals. Enter the amount from Form 6251, line 33<span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;"/>
							</li>
							<li>Corporations. Enter the amount from Form 4626, line 12<span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;"/>
							</li>
							<li>Estates and trusts. Enter the amount from Schedule I 
              <span style="padding-left:4mm;">(Form 1041), line 54
              <span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;">............</span>
								</span>
							</li>
						</div>
						<div class="styLNDesc" style="width:3mm; ">
							<img src="{$ImagePath}/3800_Bracket_Lger.gif" height="75mm" alt="Curly Bracket Image"/>
						</div>
						<span style="width:14mm; height:14mm;letter-spacing:2.3mm; font-weight:bold; float:left;padding-bottom:0mm;padding-top:8.5mm;">  
                            ....
                    </span>
						<!--<div class="styLNRightNumBox" style="background-color:yellow;">14</div>-->
						<div class="styLNRightNumBox" style="padding-top:0mm;height:8mm;">
							<div style="background-color: lightgrey; width:7.75mm;height:8.5mm;"/>
							<div class="width:7.75mm;height:4mm;">14</div>
						</div>
						<div class="styLNAmountBox" style="height:12.5mm;padding-top:8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/TentativeMinimumTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:23mm;;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:23mm;width:10mm;"/>
						<!--<div class="styLNAmountBoxNBB" style="padding-top:6.5mm;"/>-->
						<!--<div class="styLNRightNumBoxNBB" style="padding-top:3mm;background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="padding-top:3mm;background-color:red"/>
           <div class="styLNRightNumBoxNBB" style="width:8.2mm;background-color:lightgrey;border-right-width:1px"/>-->
					</div>
					<!-- Part II, Line 15.-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">15</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Enter the greater of line 13 or line 14 </span>
							<div class="styDotLn" style="float:right;padding-right:1mm;">......................</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">15</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/AdjustedExcessNetRegularTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part II, Line 16a -->
					<!--     Extra Space   -->
					<!--<div style="width:187mm;">
            <div class="styLNLeftNumBox" />
            <div class="styLNDesc" style="width:139mm;"/>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>-->
					<!-- extra space -->
					<!-- check here -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">16</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Subtract line 15 from line 11. If zero or less, enter -0- </span>
							<div class="styDotLn" style="float:right;padding-right:1mm;">.................</div>
						</div>
						<div class="styLNRightNumBox">16</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/AdjustedNetIncomeTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part II, Line 17 -->
					<!--     Extra Space   -->
					<!--<div style="width:187mm;">
            <div class="styLNLeftNumBox" />
            <div class="styLNDesc" style="width:139mm;"/>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>-->
					<!-- extra space -->
					<!-- check here -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">17</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Enter the <b>smaller</b> of line 6 or line 16
                <!--Pen and ink image -->
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Section 41(G) Indicator Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form3800Data/SmllrCYNotAllwTMTOrTotAdjAmt/@section383Or384IndicatorCd"/>
								</xsl:call-template>
							</span>
							<div class="styDotLn" style="float:right;padding-right:1mm;">.....................</div>
						</div>
						<div class="styLNRightNumBox">17</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/SmllrCYNotAllwTMTOrTotAdjAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part II, Line 17 -->
					<!--     Extra Space   -->
					<!--<div style="width:187mm;">
            <div class="styLNLeftNumBox" />
            <div class="styLNDesc" style="width:139mm;"/>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;height:8mm;"/>
            <div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          
          -->
					<!-- extra space -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:139mm;">
							<span class="styBoldText">C corporations:</span> See the line 17 instructions if there has been an ownership change, acquisition, or reorganization. 
              <!--<div class="styDotLn" style="float:right;padding-right:1mm;">...................</div>-->
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;padding-top:0mm;width:8mm;background-color:lightgray;"/>
						<div class="styLNAmountBoxNBB" style="height:7.5mm;padding-top:0mm;width:32mm;"/>
					</div>
					<!--Page 1 Footer -->
					<div style="width:187mm;clear:both;padding-top:1mm;" class="pageend">
						<div style="width:90mm;font-weight:bold;" class="styGenericDiv">For Paperwork Reduction Act Notice, see separate instructions.</div>
						<div style="width:55mm;text-align:center;" class="styGenericDiv">Cat. No. 12392F</div>
						<div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">3800</span> (2014)</div>
					</div>
					<!-- Page 2 Header -->
					<div style="width:187mm;clear:both;padding-bottom:.5mm;" class="styBB">
						<div style="width:90mm;" class="styGenericDiv">Form 3800 (2014)</div>
						<div style="width:55mm;text-align:center;" class="styGenericDiv"/>
						<div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">2</span>
						</div>
					</div>
					<!--  Begin Part II Title -->
					<div class="styBB" style="width:187mm; ">
						<div class="styPartName" style="background-color:black;">Part II</div>
						<div class="styPartDesc">
							<span style="width:8px;"/>Allowable Credit <span style="font-weight:normal;">
								<i>(Continued)</i>
							</span>
						</div>
					</div>
					<!--Part II Continue, Note Line -->
					<div class="styBB" style="width:187mm;border-bottom:1px;">
						<div class="styBB" style="width:187mm;padding-top:1mm;padding-bottom:1mm;">
							<div style="width:186mm;">
								<span class="styBoldText">Note.</span> If you are not required to report any amounts on lines 22 or 24 below, skip lines 18 through 25 and enter -0- on line 26.</div>
						</div>
					</div>
					<!-- Part II, Line 18 -->
					<!--     Extra Space   -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:139mm;"/>
						<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
					</div>
					<!-- extra space -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">18</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Multiply line 14 by 75% (.75) (see instructions) </span>
							<div class="styDotLn" style="float:right;padding-right:1mm;">...................</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">18</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/TentativeMinimunTaxTimesPctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part II, Line 19 -->
					<!--     Extra Space   -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:139mm;"/>
						<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
					</div>
					<!-- extra space -->
					<!-- check here -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">19</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Enter the greater of line 13 or line 18 </span>
							<div class="styDotLn" style="float:right;padding-right:1mm;">.....................</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">19</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/GreaterExcessOrTimesPctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part II, Line 20 -->
					<!--     Extra Space   -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:139mm;"/>
						<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
					</div>
					<!-- extra space -->
					<!-- check here -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">20</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Subtract line 19 from line 11. If zero or less, enter -0- </span>
							<div class="styDotLn" style="float:right;padding-right:1mm;">.................</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">20</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/NetIncmTaxLessGreaterExcessAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part II, Line 21 -->
					<!--     Extra Space   -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:139mm;"/>
						<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
					</div>
					<!-- extra space -->
					<!-- check here -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">21</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Subtract line 17 from line 20. If zero or less, enter -0- </span>
							<div class="styDotLn" style="float:right;padding-right:1mm;">.................</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">21</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/SubSmllrFromNetLessGreaterAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part II, Line 22 -->
					<!--     Extra Space   -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:139mm;"/>
						<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
					</div>
					<!-- extra space -->
					<!-- check here -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">22</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Combine the amounts from line 3 of all Parts III with box A, C, or D checked</span>
							<div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">22</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/TotEmpwrZoneGenBusCreditsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part II, Line 23 -->
					<!-- The following form element does not have a matching element in the schema -->
					<div style="width:187mm;">
						<!--     Extra Space   -->
						<div class="styLNLeftNumBox" style="height:1mm;"/>
						<div class="styLNDesc" style="width:107mm;height:1mm;"/>
						<div class="styLNAmountBox" style="height:1mm;border-left-width:0px;border-bottom-width:0px;border-left-width:0px;"/>
						<div class="styLNRightNumBox" style="height:1mm;border-bottom-width:0px;padding-top:.5mm;background-color:lightgrey;width:8mm"/>
						<div class="styLNAmountBox" style="height:1mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;padding-top:.5mm;"/>
						<!-- extra space -->
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">23</div>
						<div class="styLNDesc" style="width:99mm;">
              Passive activity credit from line 3 of all Parts III with box B checked 
            
            </div>
						<div class="styLNRightNumBox" style="height:4mm;">23</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/GBCFromPssvActyAllPartsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.18mm;height:4.5mm;background-color:lightgrey;border-right-width:1px"/>
					</div>
					<!-- Part II, Line 24 -->
					<!--     Extra Space   -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:139mm;"/>
						<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
					</div>
					<!-- extra space -->
					<!-- check here -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">24</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Enter the applicable passive activity credit allowed for 2014 (see instructions)</span>
							<div class="styDotLn" style="float:right;padding-right:1mm;">........</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">24</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/PassiveActyAllowedForTYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part II, Line 25 -->
					<!--     Extra Space   -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:139mm;"/>
						<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
					</div>
					<!-- extra space -->
					<!-- check here -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">25</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Add lines 22 and 24</span>
							<div class="styDotLn" style="float:right;padding-right:1mm;">..........................</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">25</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/TotalPassiveActivityCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part II, Line 26-->
					<!--     Extra Space   -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:139mm;"/>
						<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
					</div>
					<!-- extra space -->
					<!-- check here -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">26</div>
						<div class="styLNDesc" style="width:139mm;">
              Empowerment zone and renewal community employment credit allowed. Enter the smaller of line 21 or

              <span style="float:left;"> line 25  
              <!--  -->
								<!-- Push Pin image -->
								<!--
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/AllwGenAndEligSmllBusCybkCrAmt"/>
                </xsl:call-template>-->
							</span>
							<div class="styDotLn" style="float:right;padding-right:1mm;">..............................</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;padding-top:4mm;">26</div>
						<div class="styLNAmountBox" style="height:4.5mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/EmpwrZoneAndComEmploymentCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part II, Line 27 -->
					<!--     Extra Space   -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:139mm;"/>
						<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
					</div>
					<!-- extra space -->
					<!-- check here -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">27</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Subtract line 13 from line 11. If zero or less, enter -0- </span>
							<div class="styDotLn" style="float:right;padding-right:1mm;">.................</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">27</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/NetIncomeTaxLessPctExcessAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part II, Line 28 -->
					<!--     Extra Space   -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:139mm;"/>
						<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
					</div>
					<!-- extra space -->
					<!-- check here -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">28</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Add lines 17 and 26 </span>
							<div class="styDotLn" style="float:right;padding-right:1mm;">...........................</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">28</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/SumSmllrEmpwrZnEmplmnCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part II, Line 29 -->
					<!--     Extra Space   -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:139mm;"/>
						<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
					</div>
					<!-- extra space -->
					<!-- check here -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">29</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Subtract line 28 from line 27. If zero or less, enter -0- </span>
							<div class="styDotLn" style="float:right;padding-right:1mm;">.................</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">29</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/NetSmllrAndEmpwrZnEmplmnCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part II, Line 30 -->
					<!--     Extra Space   -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:139mm;"/>
						<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
					</div>
					<!-- extra space -->
					<!-- check here -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">30</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Enter the general business credit from line 5 of all Parts III with box A checked</span>
							<div class="styDotLn" style="float:right;padding-right:1mm;">........</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">30</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/AllwGenBusCrFromNonPssvActyAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part II, Line 31 -->
					<!--     Extra Space   -->
					<!-- Part II, Line 26-->
					<!--     Extra Space   -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:139mm;"/>
						<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;background-color:lightgrey;"/>
					</div>
					<!-- extra space -->
					<!-- check here -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">31</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Reserved</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;padding-top:2mm;">31</div>
						<div class="styLNAmountBox" style="height:4.5mm;padding-top:2mm; background-color:lightgrey;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/TotEligSmllBusCrNonPssvActyAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part II, Line 32 -->
					<!-- The following form element does not have a matching element in the schema -->
					<!--<div style="width:187mm;">
            -->
					<!--     Extra Space   -->
					<!--
            <div class="styLNLeftNumBox" style="height:1mm;"/>
            <div class="styLNDesc" style="width:107mm;height:1mm;"/>
            <div class="styLNAmountBox" style="height:1mm;border-left-width:0px;border-bottom-width:0px;border-left-width:0px;"/>
            <div class="styLNRightNumBox" style="height:1mm;border-bottom-width:0px;padding-top:.5mm;background-color:lightgrey;"/>
            <div class="styLNAmountBox" style="height:1mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;padding-top:.5mm;"/>
            -->
					<!-- extra space -->
					<!--
          </div>-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-top:2mm">32</div>
						<div class="styLNDesc" style="width:99mm;padding-top:2mm;">
              Passive activity credits from line 5 of all Parts III with box B checked  
              <!--<span style="float:left;">line 6 of all Parts III with box F check</span>-->
							<!--<div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>-->
						</div>
						<div class="styLNRightNumBox" style="padding-top:4mm;">32</div>
						<div class="styLNAmountBox" style="padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/GenBusEligSmllBusPssvActyCrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.2mm;height:8mm;background-color:lightgrey;border-right-width:1px"/>
					</div>
					<!-- Part II, Line 33 -->
					<!--     Extra Space   -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:139mm;"/>
						<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
					</div>
					<!-- extra space -->
					<!-- check here -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">33</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Enter the applicable passive activity credits allowed for 2014 (see instructions)</span>
							<div class="styDotLn" style="float:right;padding-right:1mm;">........</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">33</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/OtherSpecifiedAllwGenBusCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part II, Line 34 -->
					<!--     Extra Space   -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:139mm;"/>
						<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
					</div>
					<!-- extra space -->
					<!-- check here -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">34</div>
						<div class="styLNDesc" style="width:139mm;">
              Carryforward of business credit to 2014. Enter the amount from line 5 of Part III with box C checked 
              <span style="float:left;">and line 6 of Part III with box G checked. See instructions for statement to attach
                <!-- Push Pin image -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form3800Data/AllwGenAndEligSmllBusCfwdCrAmt"/>
								</xsl:call-template>
							</span>
							<div class="styDotLn" style="float:right;padding-right:1mm;">.......</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;padding-top:4mm;">34</div>
						<div class="styLNAmountBox" style="height:4.5mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/AllwGenAndEligSmllBusCfwdCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part II, Line 35-->
					<!--     Extra Space   -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:139mm;"/>
						<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
					</div>
					<!-- extra space -->
					<!-- check here -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">35</div>
						<div class="styLNDesc" style="width:139mm;">
              Carryback of business credit from 2015. Enter the amount from line 5 of Part III with box D checked 
              <span style="float:left;">(see instructions)
              <!--  -->
								<!-- Push Pin image -->
								<!--
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/AllwGenAndEligSmllBusCybkCrAmt"/>
                </xsl:call-template>-->
							</span>
							<div class="styDotLn" style="float:right;padding-right:1mm;">...........................</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;padding-top:4mm;">35</div>
						<div class="styLNAmountBox" style="height:4.5mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/AllwGenAndEligSmllBusCybkCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part II, Line 36 -->
					<!--     Extra Space   -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:139mm;"/>
						<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
					</div>
					<!-- extra space -->
					<!-- check here -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">36</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Add lines 30, 33, 34, and 35</span>
							<div class="styDotLn" style="float:right;padding-right:1mm;">.........................</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">36</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/TotAllwGenAndEligSmllBusCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part II, Line 37 -->
					<!--     Extra Space   -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:139mm;"/>
						<div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
					</div>
					<!-- extra space -->
					<!-- check here -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">37</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Enter the <b>smaller</b> of line 29 or line 36 </span>
							<div class="styDotLn" style="float:right;padding-right:1mm;">.....................</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">37</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/SmllrGenBusCrOrTotGenEligCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part II, Line 38 -->
					<div style="width:187mm;">
						<!--     Extra Space   -->
						<div class="styLNLeftNumBox" style="height:1mm;"/>
						<div class="styLNDesc" style="width:107mm;height:1mm;"/>
						<div class="styLNAmountBox" style="height:1mm;border-left-width:0px;border-bottom-width:0px;border-left-width:0px;"/>
						<div class="styLNRightNumBox" style="height:1mm;border-bottom-width:0px;padding-top:.5mm;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="height:1mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;padding-top:.5mm;"/>
						<!-- extra space -->
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">38</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="styBoldText">
								<b>Credit allowed for the current year.</b>
							</span> Add lines 28 and 37. 
                 <!-- Push Pin image -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form3800Data/CurrentYearCreditAllowedAmt"/>
							</xsl:call-template>
							<br/>
             Report the amount from line 38 (if smaller than the sum of Part I, line 6 and Part II, lines 25 and 36, see instructions)
          as indicated below or on the applicable line of your return: 
         </div>
						<div class="styLNRightNumBox" style="height:10.9mm;border-bottom-width:0px;padding-top:1.5mm;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="height:10.9mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;padding-top:1.5mm;"/>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:115mm;">
							<li>Individuals. Form 1040, line 54, or Form 1040NR, line 51<span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;">........</span>
							</li>
							<li>Corporations. Form 1120, Schedule J, Part I, line 5c<span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;">..........</span>
							</li>
							<li>Estates and trusts. Form 1041, Schedule G, line 2b<span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;">...........</span>
							</li>
						</div>
						<div class="styLNDesc" style="width:5mm;">
							<img src="{$ImagePath}/3800_Bracket_Sm.gif" height="40mm" alt="Curly Bracket Image"/>
						</div>
						<span style="width:18.9mm;height:12mm;letter-spacing:3.3mm; font-weight:bold; float:left; padding-bottom:0mm;padding-top:4mm;padding-right:1mm;">  
                            ....
                    </span>
						<div class="styLNRightNumBox" style="height:8mm;border-bottom-width:0px;background-color:lightgrey;width:8.03mm"/>
						<div class="styLNAmountBox" style="height:8mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
						<div class="styLNRightNumBox" style="width:8.03mm;border-bottom:0;">38</div>
						<div class="styLNAmountBox" style="border-bottom:0;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3800Data/CurrentYearCreditAllowedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Page 2 Footer -->
					<div style="width:187mm;clear:both;padding-top:1mm;" class="pageend">
						<div style="width:90mm;font-weight:bold;" class="styGenericDiv"/>
						<div style="width:55mm;text-align:center;" class="styGenericDiv"/>
						<div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">3800</span> (2014)</div>
						<br/>
						<br/>
					</div>
					<!-- Page 3 Header -->
					<xsl:choose>
						<xsl:when test="$Form3800Data/GenBusCrOrEligSmllBusCrGrp">
							<!-- ********    CheckBox I  ******** -->
							<!-- ********    508 fixed   ******** -->
							<xsl:variable name="CBusCrGrp" select="count($Form3800Data/GenBusCrOrEligSmllBusCrGrp/ConsolidatedBusinessCreditsGrp)*8"/>
							<xsl:variable name="GBusCrNnPassActyGrp" select="count($Form3800Data/GenBusCrOrEligSmllBusCrGrp/GeneralBusCrFromNnpssvActyGrp)*8"/>
							<xsl:variable name="GBusCrPassActyGrp" select="count($Form3800Data/GenBusCrOrEligSmllBusCrGrp/GeneralBusCrFromPassiveActyGrp)*8"/>
							<xsl:variable name="GBusCrCarFwdGrp" select="count($Form3800Data/GenBusCrOrEligSmllBusCrGrp/GeneralBusCrCarryforwardsGrp)*8"/>
							<xsl:variable name="GBusCrCarBakGrp" select="count($Form3800Data/GenBusCrOrEligSmllBusCrGrp/GeneralBusCrCarrybacksGrp)*8"/>
							<xsl:variable name="ESmllBusCrNnPassActyGrp" select="count($Form3800Data/GenBusCrOrEligSmllBusCrGrp/EligSmllBusCrFromNnpssvActyGrp)*8"/>
							<xsl:variable name="ESmllBusCrPassActyGrp" select="count($Form3800Data/GenBusCrOrEligSmllBusCrGrp/EligSmllBusCrFromPssvActyGrp)*8"/>
							<xsl:variable name="ESmllBusCrCarFwdGrp" select="count($Form3800Data/GenBusCrOrEligSmllBusCrGrp/EligibleSmallBusinessCrCfwdGrp)*8"/>
							<xsl:for-each select="$Form3800Data/GenBusCrOrEligSmllBusCrGrp/ConsolidatedBusinessCreditsGrp">
								<xsl:call-template name="PartIIITemplate">
									<xsl:with-param name="counter" select="position()"/>
								</xsl:call-template>
							</xsl:for-each>
							<!-- ********    CheckBox A  ******** -->
							<xsl:for-each select="$Form3800Data/GenBusCrOrEligSmllBusCrGrp/GeneralBusCrFromNnpssvActyGrp">
								<xsl:call-template name="PartIIITemplate">
									<xsl:with-param name="counter" select="position()+$CBusCrGrp"/>
								</xsl:call-template>
<!--								<div class="pageend"/>
-->							</xsl:for-each>
							<!-- ********    CheckBox B WORK ON ******** -->
							<xsl:for-each select="$Form3800Data/GenBusCrOrEligSmllBusCrGrp/GeneralBusCrFromPassiveActyGrp">
								<xsl:call-template name="PartIIITemplate">
									<xsl:with-param name="counter" select="position()+$CBusCrGrp+$GBusCrNnPassActyGrp"/>
								</xsl:call-template>
<!--								<div class="pageend"/>
-->							</xsl:for-each>
							<!-- ********    CheckBox C  ******** -->
							<xsl:for-each select="$Form3800Data/GenBusCrOrEligSmllBusCrGrp/GeneralBusCrCarryforwardsGrp">
								<xsl:call-template name="PartIIITemplate">
									<xsl:with-param name="counter" select="position()+$CBusCrGrp+$GBusCrNnPassActyGrp+$GBusCrPassActyGrp"/>
								</xsl:call-template>
<!--								<div class="pageend"/>
-->							</xsl:for-each>
							<!-- ********    CheckBox D  ******** -->
							<xsl:for-each select="$Form3800Data/GenBusCrOrEligSmllBusCrGrp/GeneralBusCrCarrybacksGrp">
								<xsl:call-template name="PartIIITemplate">
									<xsl:with-param name="counter" select="position()+$CBusCrGrp+$GBusCrNnPassActyGrp+$GBusCrPassActyGrp+$GBusCrCarFwdGrp"/>
								</xsl:call-template>
<!--								<div class="pageend"/>
-->							</xsl:for-each>
							<!-- ********    CheckBox E  *WORK on******* -->
							<!--   <xsl:for-each select="$Form3800Data/GenBusCrOrEligSmllBusCrGrp/EligSmllBusCrFromNnpssvActyGrp">
                <xsl:call-template name="PartIIITemplate">
                  <xsl:with-param name="counter" select="position()+$CBusCrGrp+$GBusCrNnPassActyGrp+$GBusCrPassActyGrp+$GBusCrCarFwdGrp+$GBusCrCarBakGrp"/>
                </xsl:call-template>
                 
             </xsl:for-each>   -->
							<!-- ********    CheckBox F  ******** -->
							<!--  <xsl:for-each select="$Form3800Data/GenBusCrOrEligSmllBusCrGrp/EligSmllBusCrFromPssvActyGrp">
                <xsl:call-template name="PartIIITemplate">
                  <xsl:with-param name="counter" select="position()+$CBusCrGrp+$GBusCrNnPassActyGrp+$GBusCrPassActyGrp+$GBusCrCarFwdGrp+$GBusCrCarBakGrp+$ESmllBusCrNnPassActyGrp"/>
                </xsl:call-template>
                 
             </xsl:for-each>    -->
							<!-- ********    CheckBox G  ******** -->
							<xsl:for-each select="$Form3800Data/GenBusCrOrEligSmllBusCrGrp/EligibleSmallBusinessCrCfwdGrp">
								<xsl:call-template name="PartIIITemplate">
									<xsl:with-param name="counter" select="position()+$CBusCrGrp+$GBusCrNnPassActyGrp+$GBusCrPassActyGrp+$GBusCrCarFwdGrp+$GBusCrCarBakGrp+$ESmllBusCrNnPassActyGrp+$ESmllBusCrPassActyGrp"/>
								</xsl:call-template>
<!--								<div class="pageend"/>
-->							</xsl:for-each>
							<!-- ********    CheckBox H  ******** -->
							<!--       <xsl:for-each select="$Form3800Data/GenBusCrOrEligSmllBusCrGrp/EligibleSmallBusCrCybkTypGrp">
                <xsl:call-template name="PartIIITemplate">
                  <xsl:with-param name="counter" select="position()+$CBusCrGrp+$GBusCrNnPassActyGrp+$GBusCrPassActyGrp+$GBusCrCarFwdGrp+$GBusCrCarBakGrp+$ESmllBusCrNnPassActyGrp+$ESmllBusCrPassActyGrp+$ESmllBusCrCarFwdGrp"/>
                </xsl:call-template>
                 
             </xsl:for-each>    -->
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="PartIIIemptyTemplate"/>
						</xsl:otherwise>
					</xsl:choose>
					<!--ADDITIONAL DATA SECTION-->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
        Additional Data        
      </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" tabindex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- <xsl:call-template name="LinkToLeftoverDataTableInline">
                  <xsl:with-param name="Desc">Section 41(G) Indicator Code</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$Form3800Data/SmllrCYNotAllwTMTOrTotAdjAmt/@sec383Or384Indicator"/>
                </xsl:call-template>
                
                 <xsl:call-template name="LinkToLeftoverDataTableInline">
                  <xsl:with-param name="Desc">Section 41(G) Indicator Code</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$Form3800Data/SmllrCYNotAllwTMTOrAdjNetAmt/@sec383Or384Indicator"/>
                </xsl:call-template>-->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form3800Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 17a - sec383 or sec384 Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form3800Data/SmllrCYNotAllwTMTOrTotAdjAmt/@section383Or384IndicatorCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 17b - sec383 or sec384 Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form3800Data/SmllrCYNotAllwTMTOrAdjNetAmt/@section383Or384IndicatorCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
	<!--   Add counter to fix  508 issue  -->
	<xsl:template name="PartIIITemplate">
		<xsl:param name="counter"/>
		<!--     Checkbox Iiiiiiiii  -->
					<div style="width:187mm;height:1px;">
						<div style="width:187mm;clear:both;padding-bottom:.5mm;" class="styBB">
							<div style="width:90mm;" class="styGenericDiv">Form 3800 (2014)</div>
							<div style="width:55mm;text-align:center;" class="styGenericDiv"/>
							<div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">3</span>
							</div>
						</div>
			<div class="styBB" style="width:187mm;border-top-width:0px;">
				<div class="styNameBox" style="font-size:7pt;width:100mm;font-weight: normal">Name(s) shown on return
			  <br/>
					<xsl:choose>
						<xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">Name</xsl:with-param>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</div>
				<div class="styEINBox" style="width:52mm;padding-left:0mm;font-size:7pt;border-left-width:1px;">Identifying number
                  <br/>
					<div style="font-size: 7pt; font-weight: normal;text-align:left; vertical-align: bottom;padding-top:3mm;">
						<xsl:choose>
							<xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<div class="styBB" style="width:187mm; ">
				<div class="styPartName" style="background-color:black;">Part III</div>
				<div class="styPartDesc">
					<span style="width:8px;"/>General Business Credits or Eligible Small Business Credits <span style="font-weight:normal">(see instructions)</span>
				</div>
			</div>
			<!--Part II Continue, Note Line -->
			<div class="styBB" style="width:187mm;padding-top:1mm;padding-bottom:1mm;border-bottom:0;">
				<div style="width:140mm;">Complete a separate Part III for each box checked below. (see instructions)</div>
				<div style="height:1mm;width:187mm;float:left;">
					<span style="width:90mm;">
						<span class="styLNLeftNumBox" style="width:5mm;padding-top:.15mm">A</span>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="GeneralBusCrFromNnpssvActyInd"/>
								<xsl:with-param name="BackupName">IRS3800GeneralBusCrFromNnpssvActyInd</xsl:with-param>
							</xsl:call-template>
							<xsl:attribute name="id"><xsl:value-of select="concat('IRS3800GeneralBusCrFromNnpssvActyInd', $counter)"/></xsl:attribute>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="GeneralBusCrFromPassiveActyGrp/GeneralBusCrFromNnpssvActyInd"/>
								<xsl:with-param name="BackupName">IRS3800GeneralBusCrFromNnpssvActyInd</xsl:with-param>
							</xsl:call-template>
							<xsl:attribute name="for"><xsl:value-of select="concat('IRS3800GeneralBusCrFromNnpssvActyInd', $counter)"/></xsl:attribute>
							<span style="width:2mm;"/>General Business Credit From a Non-Passive Activity
							</label>
					</span>
					<span style="width:90mm;">
						<span class="styLNLeftNumBox" style="width:5mm;padding-top:.15mm">E</span>
						<input class="styCkbox" style="background-color:lightgrey">
							<!--<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="EligSmllBusCrFromNnpssvActyInd"/>
									<xsl:with-param name="BackupName">IRS3800EligSmllBusCrFromNnpssvActyInd</xsl:with-param>
								</xsl:call-template>-->
							<xsl:attribute name="id"><xsl:value-of select="concat('IRS3800EligSmllBusCrFromNnpssvActyInd', $counter)"/></xsl:attribute>
						</input>
						<label>
							<!--<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="EligSmllBusCrFromNnpssvActyGrp/EligSmllBusCrFromNnpssvActyInd"/>
									<xsl:with-param name="BackupName">IRS3800EligSmllBusCrFromNnpssvActyInd</xsl:with-param>
								</xsl:call-template>-->
							<xsl:attribute name="for"><xsl:value-of select="concat('IRS3800EligSmllBusCrFromNnpssvActyInd', $counter)"/></xsl:attribute>
							<span style="width:2mm;"/>Reserved
                      </label>
					</span>
					<span style="width:90mm;">
						<span class="styLNLeftNumBox" style="width:5mm;padding-top:.15mm">B</span>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="GeneralBusCrFromPassiveActyInd"/>
								<xsl:with-param name="BackupName">IRS3800GeneralBusCrFromPassiveActyInd</xsl:with-param>
							</xsl:call-template>
							<xsl:attribute name="id"><xsl:value-of select="concat('IRS3800GeneralBusCrFromPassiveActyInd', $counter)"/></xsl:attribute>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="GeneralBusCrFromPassiveActyGrp/GeneralBusCrFromPassiveActyInd"/>
								<xsl:with-param name="BackupName">IRS3800GeneralBusCrFromPassiveActyInd</xsl:with-param>
							</xsl:call-template>
							<xsl:attribute name="for"><xsl:value-of select="concat('IRS3800GeneralBusCrFromPassiveActyInd', $counter)"/></xsl:attribute>
							<span style="width:2mm;"/>General Business Credit From a Passive Activity
							</label>
					</span>
					<span style="width:90mm;">
						<span class="styLNLeftNumBox" style="width:5mm;padding-top:.15mm">F</span>
						<input class="styCkbox" style="background-color:lightgrey;">
							<!--<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="EligSmllBusCrFromPssvActyInd"/>
									<xsl:with-param name="BackupName">IRS3800EligSmllBusCrFromPssvActyInd</xsl:with-param>
								</xsl:call-template>-->
							<xsl:attribute name="id"><xsl:value-of select="concat('IRS3800EligSmllBusCrFromPssvActyInd', $counter)"/></xsl:attribute>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="EligSmllBusCrFromPssvActyInd"/>
								<xsl:with-param name="BackupName">IRS3800EligSmllBusCrFromPssvActyInd</xsl:with-param>
							</xsl:call-template>
							<xsl:attribute name="for"><xsl:value-of select="concat('IRS3800EligSmllBusCrFromPssvActyInd', $counter)"/></xsl:attribute>
							<span style="width:2mm;"/>Reserved
                      </label>
					</span>
					<span style="width:90mm;">
						<span class="styLNLeftNumBox" style="width:5mm;padding-top:.15mm">C</span>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="GeneralBusCrCarryforwardsInd"/>
								<xsl:with-param name="BackupName">IRS3800GeneralBusCrCarryforwardsInd</xsl:with-param>
							</xsl:call-template>
							<xsl:attribute name="id"><xsl:value-of select="concat('IRS3800GeneralBusCrCarryforwardsInd', $counter)"/></xsl:attribute>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="GeneralBusCrCarryforwardsInd"/>
								<xsl:with-param name="BackupName">IRS3800GeneralBusCrCarryforwardsInd</xsl:with-param>
							</xsl:call-template>
							<xsl:attribute name="for"><xsl:value-of select="concat('IRS3800GeneralBusCrCarryforwardsInd', $counter)"/></xsl:attribute>
							<span style="width:2mm;"/>General Business Credit Carryforwards
							</label>
					</span>
					<span style="width:90mm;">
						<span class="styLNLeftNumBox" style="width:5mm;padding-top:.15mm">G</span>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="EligSmllBusCrCarryforwardsInd"/>
								<xsl:with-param name="BackupName">IRS3800EligSmllBusCrCarryforwardsInd</xsl:with-param>
							</xsl:call-template>
							<xsl:attribute name="id"><xsl:value-of select="concat('IRS3800EligSmllBusCrCarryforwardsInd', $counter)"/></xsl:attribute>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="EligSmllBusCrCarryforwardsInd"/>
								<xsl:with-param name="BackupName">IRS3800EligSmllBusCrCarryforwardsInd</xsl:with-param>
							</xsl:call-template>
							<xsl:attribute name="for"><xsl:value-of select="concat('IRS3800EligSmllBusCrCarryforwardsInd', $counter)"/></xsl:attribute>
							<span style="width:2mm;"/>Eligible Small Business Credit Carryforwards
                      </label>
					</span>
					<span style="width:90mm;">
						<span class="styLNLeftNumBox" style="width:5mm;padding-top:.15mm">D</span>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="GeneralBusCrCarrybacksInd"/>
								<xsl:with-param name="BackupName">IRS3800GeneralBusCrCarrybacksInd</xsl:with-param>
							</xsl:call-template>
							<xsl:attribute name="id"><xsl:value-of select="concat('IRS3800GeneralBusCrCarrybacksInd', $counter)"/></xsl:attribute>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="GeneralBusCrCarrybacksInd"/>
								<xsl:with-param name="BackupName">IRS3800GeneralBusCrCarrybacksInd</xsl:with-param>
							</xsl:call-template>
							<xsl:attribute name="for"><xsl:value-of select="concat('IRS3800GeneralBusCrCarrybacksInd', $counter)"/></xsl:attribute>
							<span style="width:2mm;"/>General Business Credit Carrybacks
							</label>
					</span>
					<span style="width:90mm;">
						<span class="styLNLeftNumBox" style="width:5mm;padding-top:.15mm">H</span>
						<input class="styCkbox" style="background-color:lightgrey;">
							<!--<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="EligSmllBusCrCarrybacksInd"/>
									<xsl:with-param name="BackupName">IRS3800EligSmllBusCrCarrybacksInd</xsl:with-param>
								</xsl:call-template>-->
							<xsl:attribute name="id"><xsl:value-of select="concat('IRS3800EligSmllBusCrCarrybacksInd', $counter)"/></xsl:attribute>
						</input>
						<label>
							<!--<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="EligSmllBusCrCarrybacksInd"/>
									<xsl:with-param name="BackupName">IRS3800EligSmllBusCrCarrybacksInd</xsl:with-param>
								</xsl:call-template>-->
							<xsl:attribute name="for"><xsl:value-of select="concat('IRS3800EligSmllBusCrCarrybacksInd', $counter)"/></xsl:attribute>
							<span style="width:2mm;"/>Reserved
                      </label>
					</span>
					<span class="styLNDesc" style="width:180mm;padding-left:1mm;">
						<b>I</b>
						<span style="width:3.5mm;"/>  If you are filing more than one Part
                        III with box A or B checked, complete and attach first an additional Part III combining</span>
					<span class="styLNDesc" style="width:180mm;padding-left:6mm;"> amounts from all Parts III with box A or B checked. Check here if this 
                      is the consolidated Part III  
                       <span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;">...
                     </span>
						<img src="{$ImagePath}/3800_Bullet.gif" alt="bullet image"/>
						<span style="width:5mm"/>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="ConsolidatedSectionInd"/>
								<xsl:with-param name="BackupName">IRS3800ConsolidatedSectionInd</xsl:with-param>
							</xsl:call-template>
							<xsl:attribute name="id"><xsl:value-of select="concat('IRS3800ConsolidatedSectionInd', $counter)"/></xsl:attribute>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="ConsolidatedSectionInd"/>
								<xsl:with-param name="BackupName">IRS3800ConsolidatedSectionInd</xsl:with-param>
							</xsl:call-template>
							<xsl:attribute name="for"><xsl:value-of select="concat('IRS3800ConsolidatedSectionInd', $counter)"/></xsl:attribute>
						</label>
						<!--start here III-->
					</span>
				</div>
				<!--<div  style="width:187mm;">
            <div class="styNameBox" style="width:122.5mm;height:14mm;font-weight:normal;border-top-width:1px;border-bottom-width:1px;">
              <div class="styPartDesc" style="width:115mm;text-align:center;font-weight:normal;background-color:yellow"><b>(a)</b> Description of credit</div>
              <div class="styPartDesc" style="width:115mm;font-weight:normal;background-color:lightblue;">
							<b>Note:</b> On any line where the credit is from more than one source and one of the sources is a pass-through entity, a separate Part III
							is needed for each pass-through entity.
							</div> 
            </div>
            <div class="styNameBox" style="width:32mm;height:14mm;border-top-width:1px;background-color:lightblue;">
                <div class="styPartDesc" style="width:30mm;text-align:center;border-right-width:0px;font-weight:normal"><b>(b)</b></div>
                <div class="styPartDesc" style="width:31mm;border-right-width:0px;font-weight:normal;font-size:9px;background-color:yellow">
                If claiming the credit from a pass-through entity, enter the EIN
                </div>
            </div>
            <div class="styNameBox" style="width:32mm;height:14mm;border-top-width:1px;border-right-width:0px;background-color:red">
                <div class="styPartDesc" style="width:30mm;text-align:center;border-right-width:0px;font-weight:normal;background-color:pink"><b>(c)</b></div>
                <div class="styPartDesc" style="width:31mm;border-right-width:0px;font-weight:normal;text-align:center;background-color:yellow">
                Enter the appropriate amount
                </div>       
            </div>
          </div>-->
				<div style="width:187mm; border-top-width:1px;height:14mm;" class="styBB">
					<div class="styNameBox" style="text-align:center;width:123.2mm;font-weight:normal;font-size:8pt;">
						<b>(a)</b> Description of credit
<br/><br/>
						<div style="text-align:left;">
							<b>Note:</b> On any line where the credit is from more than one source, a separate Part III is needed for each pass-through entity.
</div>
					</div>
					<div class="styNameBox" style="text-align:center;width:32mm;;font-size:8pt;">
						<b>(b)</b>
						<br/>
If claiming the credit from a pass-through entity, enter the EIN
</div>
					<div class="styNameBox" style="font-size:8pt;text-align:center;width:31mm;border-right-width:0px;">
						<b>(c)</b>
						<br/>
Enter the appropriate amount
</div>
				</div>
				<!-- Schedule C Line 1a-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">1a</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left"> Investment (Form 3468, Part II only) (attach Form 3468) 
                      <!--Dotted Line -->
								<!-- Push Pin image -->
								<span style="float:none;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearInvestmentCreditGrp/CurrentYearInvestmentCreditAmt"/>
									</xsl:call-template>
								</span>
							</span>
							<!--Dotted Line-->
							<div class="styDotLn" style="float:right;padding-right:1mm;">.......</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:0;height:4.5mm;">1a</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;text-align:center;height:4.5mm;">
							<xsl:if test="BusinessCreditsGrp/CurrentYearInvestmentCreditGrp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearInvestmentCreditGrp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/CurrentYearInvestmentCreditGrp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearInvestmentCreditGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearInvestmentCreditGrp/CurrentYearInvestmentCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Schedule C Line 1b-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">b</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left"> Reserved</span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">.......................</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBoxNBB" style="border-top:0px solid black;height:4.5mm;">1b</div>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;border-bottom-width:0px;border-top:1px solid black;background-color:lightgrey">
								
							</div>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;border-bottom-width:0px;border-top:1px solid black;background-color:lightgrey">
								
							</div>
					</div>
				</div>
				<!-- Schedule C Line 1c-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">c</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left"> Increasing research activities (Form 6765)
                      <!--Dotted Line -->
								<!-- Push Pin image -->
								<span style="float:none;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYIncreasingResearchCrGrp/CYIncreasingResearchCrAmt"/>
									</xsl:call-template>
								</span>
							</span>
							<div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;height:4.5mm;">1c</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;height:4.5mm;">
							<xsl:if test="BusinessCreditsGrp/CYIncreasingResearchCrGrp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYIncreasingResearchCrGrp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/CYIncreasingResearchCrGrp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYIncreasingResearchCrGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYIncreasingResearchCrGrp/CYIncreasingResearchCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Schedule C Line 1d-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">d</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left">  Low-income housing (Form 8586, Part I only) 
                 <!-- Push Pin image -->
								<span style="float:none;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYLowIncomeHousingCrGrp/CurrentYearLowIncomeHsngCrAmt"/>
									</xsl:call-template>
								</span>
							</span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;height:4.5mm;">1d</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;text-align:center;height:4.5mm;">
							<xsl:if test="BusinessCreditsGrp/CYLowIncomeHousingCrGrp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYLowIncomeHousingCrGrp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/CYLowIncomeHousingCrGrp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYLowIncomeHousingCrGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYLowIncomeHousingCrGrp/CurrentYearLowIncomeHsngCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Schedule C Line 1e-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">e</div>
						<div class="styLNDesc" style="height:4.5mm;width:107mm;padding-top:1mm;">
							<span style="float:left"> Disabled access (Form 8826) (see instructions for limitation)
                              <!-- Push Pin image -->
								<span style="float:none;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearDisabledAccessCrGrp/CurrentYearDisabledAccessCrAmt"/>
									</xsl:call-template>
								</span>
							</span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">.....</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="height:4.6mm;border-bottom-width:0px;text-align:center;padding-top:1.5mm;">1e</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;height:4.5mm;text-align:center;padding-top:1.5mm">
							<xsl:if test="BusinessCreditsGrp/CurrentYearDisabledAccessCrGrp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearDisabledAccessCrGrp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/CurrentYearDisabledAccessCrGrp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearDisabledAccessCrGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;height:4.5mm;padding-top:1.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearDisabledAccessCrGrp/CurrentYearDisabledAccessCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- End Schedule C Line 1e -->
				<!-- Schedule C Line 1f-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">f</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Renewable electricity, refined coal, and Indian coal production (Form 8835) 
                                 <!-- Push Pin image -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYRenewableElectricityCrGrp/CurrentYearRenewableElecCrAmt"/>
							</xsl:call-template>
							<!--Dotted Line -->
							<span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;"/>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;height:4.5mm;">1f</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;height:4.5mm;">
							<xsl:if test="BusinessCreditsGrp/CYRenewableElectricityCrGrp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYRenewableElectricityCrGrp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/CYRenewableElectricityCrGrp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYRenewableElectricityCrGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYRenewableElectricityCrGrp/CurrentYearRenewableElecCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Schedule C Line 1g-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">g</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left">   Indian employment (Form 8845)
                <!-- Push Pin image -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearIndianEmplmnCrGrp/CYIndianEmploymentCreditAmt"/>
								</xsl:call-template>
							</span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">..............</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;height:4.5mm;">1g</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;height:4.5mm;">
							<xsl:if test="BusinessCreditsGrp/CurrentYearIndianEmplmnCrGrp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearIndianEmplmnCrGrp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/CurrentYearIndianEmplmnCrGrp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearIndianEmplmnCrGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearIndianEmplmnCrGrp/CYIndianEmploymentCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Schedule C Line 1h-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">h</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left">   Orphan drug (Form 8820)
                	<!-- Push Pin image -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearOrphanDrugCreditGrp/CurrentYearOrphanDrugCreditAmt"/>
								</xsl:call-template>
							</span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">................</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;height:4.5mm;">1h</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;height:4.5mm;">
							<xsl:if test="BusinessCreditsGrp/CurrentYearOrphanDrugCreditGrp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearOrphanDrugCreditGrp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/CurrentYearOrphanDrugCreditGrp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearOrphanDrugCreditGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearOrphanDrugCreditGrp/CurrentYearOrphanDrugCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Schedule C Line 1i-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">i</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left">   New markets (Form 8874) 
                 <!-- Push Pin image -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearNewMarketsCreditGrp/CurrentYearNewMarketsCreditAmt"/>
								</xsl:call-template>
							</span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">................</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;">1i</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;text-align:center;height:4.5mm;">
							<xsl:if test="BusinessCreditsGrp/CurrentYearNewMarketsCreditGrp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearNewMarketsCreditGrp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/CurrentYearNewMarketsCreditGrp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearNewMarketsCreditGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearNewMarketsCreditGrp/CurrentYearNewMarketsCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Schedule C Line1j-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:8mm;padding-left:4mm;">j</div>
						<div class="styLNDesc" style="height:8mm;width:107mm;padding-top:1mm;"> 
                 Small employer pension plan startup costs (Form 8881) (see instructions for
                 <span style="float:left;"> limitation)</span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">.....................</div>
							<!-- Push Pin image -->
							<span style="width:3mm;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYSmallEmployerPensionPlanGrp/CurrentYrSmllEmplrPnsnPlanAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;border-bottom-width:0px;">1j</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;height:8.5mm;padding-top:4mm;text-align:center;">
							<xsl:if test="BusinessCreditsGrp/CYSmallEmployerPensionPlanGrp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYSmallEmployerPensionPlanGrp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/CYSmallEmployerPensionPlanGrp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYSmallEmployerPensionPlanGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;height:8.5mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYSmallEmployerPensionPlanGrp/CurrentYrSmllEmplrPnsnPlanAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Schedule C Line 1k-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">k</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;"> 
             Employer-provided child care facilities and services (Form 8882) (see
             <span style="float:left"> instructions for limitation)</span>
							<!-- Push Pin image -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYEmplrProvChildCareFcltsCrGrp/CYEmplrProvChldCareFcltsCrAmt"/>
							</xsl:call-template>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">.................</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;height:6mm;padding-top:4.5mm;">1k</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;height:6mm;padding-top:4.5mm;">
							<xsl:if test="BusinessCreditsGrp/CYEmplrProvChildCareFcltsCrGrp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYEmplrProvChildCareFcltsCrGrp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/CYEmplrProvChildCareFcltsCrGrp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYEmplrProvChildCareFcltsCrGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;height:6mm;padding-top:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYEmplrProvChildCareFcltsCrGrp/CYEmplrProvChldCareFcltsCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Schedule C Line 1l-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">l</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left">  Biodiesel and renewable diesel fuels  (attach Form 8864) 
                  <!-- Push Pin image -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearBiodieselFuelCrGrp/CurrentYearBiodieselFuelCrAmt"/>
								</xsl:call-template>
							</span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">.......</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;height:4.5mm;">1l</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;height:4.5mm;">
							<xsl:if test="BusinessCreditsGrp/CurrentYearBiodieselFuelCrGrp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearBiodieselFuelCrGrp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/CurrentYearBiodieselFuelCrGrp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearBiodieselFuelCrGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearBiodieselFuelCrGrp/CurrentYearBiodieselFuelCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Schedule C Line 1m-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">m</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left">   Low sulfur diesel fuel production (Form 8896) 
                   	<!-- Push Pin image -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYLowSulfurDieselCreditGrp/CurrentYearLowSulfurDslCrAmt"/>
								</xsl:call-template>
							</span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">...........</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;height:4.5mm;">1m</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;height:4.5mm;">
							<xsl:if test="BusinessCreditsGrp/CYLowSulfurDieselCreditGrp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYLowSulfurDieselCreditGrp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/CYLowSulfurDieselCreditGrp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYLowSulfurDieselCreditGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYLowSulfurDieselCreditGrp/CurrentYearLowSulfurDslCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Schedule C Line 1n-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">n</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left">   Distilled spirits (Form 8906) 
                     <!-- Push Pin image -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/DistilledSpiritsCreditGrp/DistilledSpiritsCreditAmt"/>
								</xsl:call-template>
							</span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">................</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;height:4.5mm;">1n</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
							<xsl:if test="BusinessCreditsGrp/DistilledSpiritsCreditGrp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/DistilledSpiritsCreditGrp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/DistilledSpiritsCreditGrp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/DistilledSpiritsCreditGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/DistilledSpiritsCreditGrp/DistilledSpiritsCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Schedule C Line 1o-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">o</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left">   Nonconventional source fuel (Form 8907)
                 	<!-- Push Pin image -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYNonconventionalFuelCreditGrp/CurrentYearNnconvFuelCrAmt"/>
								</xsl:call-template>
							</span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">...........</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;height:4.5mm;">1o</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;height:4.5mm;">
							<xsl:if test="BusinessCreditsGrp/CYNonconventionalFuelCreditGrp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYNonconventionalFuelCreditGrp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/CYNonconventionalFuelCreditGrp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYNonconventionalFuelCreditGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYNonconventionalFuelCreditGrp/CurrentYearNnconvFuelCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Schedule C Line 1p-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">p</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left">    Energy efficient home (Form 8908)
                                   <!-- Push Pin image -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYEnergyEfficientHomeCreditGrp/CurrentYrEngyEfficientHmCrAmt"/>
								</xsl:call-template>
							</span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">.............</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;height:4.5mm;">1p</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;;border-top:1px solid black;text-align:center;height:4.5mm;">
							<xsl:if test="BusinessCreditsGrp/CYEnergyEfficientHomeCreditGrp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYEnergyEfficientHomeCreditGrp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/CYEnergyEfficientHomeCreditGrp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYEnergyEfficientHomeCreditGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYEnergyEfficientHomeCreditGrp/CurrentYrEngyEfficientHmCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Schedule C Line 1q-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">q</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left">   Energy efficient appliance (Form 8909) 
                                    			<!-- Push Pin image -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYEnergyEfficientApplianceGrp/CYEngyEfficientApplianceAmt"/>
								</xsl:call-template>
							</span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">.............</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;height:4.5mm;">1q</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;height:4.5mm;">
							<xsl:if test="BusinessCreditsGrp/CYEnergyEfficientApplianceGrp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYEnergyEfficientApplianceGrp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/CYEnergyEfficientApplianceGrp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYEnergyEfficientApplianceGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYEnergyEfficientApplianceGrp/CYEngyEfficientApplianceAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Schedule C Line 1r-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">r</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left">   Alternative motor vehicle (Form 8910) 
                <!-- Push Pin image -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYAlternativeMotorVehicleCrGrp/CurrentYearAltMtrVehCrAmt"/>
								</xsl:call-template>
							</span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">.............</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;height:4.5mm;">1r</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;height:4.5mm;">
							<xsl:if test="BusinessCreditsGrp/CYAlternativeMotorVehicleCrGrp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYAlternativeMotorVehicleCrGrp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/CYAlternativeMotorVehicleCrGrp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYAlternativeMotorVehicleCrGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYAlternativeMotorVehicleCrGrp/CurrentYearAltMtrVehCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Schedule C Line 1s-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">s</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left">  Alternative fuel vehicle refueling property (Form 8911) 
                <!-- Push Pin image -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYAlternativeRefuelingCrGrp/CurrentYearAltRefuelingCrAmt"/>
								</xsl:call-template>
							</span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">........</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;height:4.5mm;">1s</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;height:4.5mm;">
							<xsl:if test="BusinessCreditsGrp/CYAlternativeRefuelingCrGrp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYAlternativeRefuelingCrGrp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/CYAlternativeRefuelingCrGrp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYAlternativeRefuelingCrGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYAlternativeRefuelingCrGrp/CurrentYearAltRefuelingCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Schedule C Line 1t-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">t</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left"> Reserved</span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">......................</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;height:4.5mm;">1t</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;background-color:lightgrey;height:4.5mm;">
								
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;background-color:lightgrey;height:4.5mm;">
								
							</div>
					</div>
				</div>
				<!-- Schedule C Line 1u-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">u</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left">    Mine rescue team training (Form 8923)
                 	<!-- Push Pin image -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/MineRescueTeamTrainingCrGrp/MineRescueTeamTrainingCrAmt"/>
								</xsl:call-template>
							</span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">............</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;height:4.5mm;">1u</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;text-align:center;height:4.5mm;">
							<xsl:if test="BusinessCreditsGrp/MineRescueTeamTrainingCrGrp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/MineRescueTeamTrainingCrGrp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/MineRescueTeamTrainingCrGrp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/MineRescueTeamTrainingCrGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/MineRescueTeamTrainingCrGrp/MineRescueTeamTrainingCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- End Schedule C Line 1v -->
				<!-- Schedule C Line 1v-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">v</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;padding-top:1mm;">
							<span style="float:left">Agricultural chemicals security (Form 8931) (see instructions for limitation)</span>
							<!--Dotted Line -->
							<!-- Push Pin image -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/AgriculturalChemicalsCreditGrp/AgriculturalChemicalsCreditAmt"/>
							</xsl:call-template>
							<!--<div class="styDotLn" style="float:right;padding-right:1mm;">...</div> -->
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="height:4.5mm;padding-top:1.5mm;border-bottom-width:0px;">1v</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;height:4.5mm;padding-top:1.5mm;text-align:center;">
							<xsl:if test="BusinessCreditsGrp/AgriculturalChemicalsCreditGrp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/AgriculturalChemicalsCreditGrp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/AgriculturalChemicalsCreditGrp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/AgriculturalChemicalsCreditGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;height:4.5mm;padding-top:1.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/AgriculturalChemicalsCreditGrp/AgriculturalChemicalsCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- End Schedule C Line 1v -->
				<!-- Schedule C Line 1w-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">w</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left">   Employer differential wage payments (Form 8932) 
                 <!-- Push Pin image -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/DifferentialWagePaymentsCrGrp/DifferentialWagePaymentsCrAmt"/>
								</xsl:call-template>
							</span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">........</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;text-align:center;height:4.5mm;">1w</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;height:4.5mm;">
							<xsl:if test="BusinessCreditsGrp/DifferentialWagePaymentsCrGrp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/DifferentialWagePaymentsCrGrp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/DifferentialWagePaymentsCrGrp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/DifferentialWagePaymentsCrGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/DifferentialWagePaymentsCrGrp/DifferentialWagePaymentsCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Schedule C Line 1x-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">x</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left">Carbon dioxide sequestration (Form 8933)
                  	<!-- Push Pin image -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CarbonDioxideCreditGrp/CarbonDioxideCreditAmt"/>
								</xsl:call-template>
							</span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;height:4.5mm;">1x</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;height:4.5mm;">
							<xsl:if test="BusinessCreditsGrp/CarbonDioxideCreditGrp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CarbonDioxideCreditGrp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/CarbonDioxideCreditGrp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CarbonDioxideCreditGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CarbonDioxideCreditGrp/CarbonDioxideCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Schedule C Line 1y-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">y</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left">Qualified plug-in electric drive motor vehicle (Form 8936) 
                               <!-- Push Pin image -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/QlfyPlugInElecDriveMtrVehCrGrp/QlfyPlugInElecDriveMtrVehCrAmt"/>
								</xsl:call-template>
							</span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">......</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;height:4.5mm;">1y</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;height:4.5mm;">
							<xsl:if test="BusinessCreditsGrp/QlfyPlugInElecDriveMtrVehCrGrp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/QlfyPlugInElecDriveMtrVehCrGrp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/QlfyPlugInElecDriveMtrVehCrGrp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/QlfyPlugInElecDriveMtrVehCrGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:0px solid black;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/QlfyPlugInElecDriveMtrVehCrGrp/QlfyPlugInElecDriveMtrVehCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Schedule C Line 1z-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">z</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left">Qualified plug-in electric vehicle (carryforward only) 
                  <!-- Push Pin image -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/AllowableQlfyElectricVehGrp/AllowableQualifiedElecVehAmt"/>
								</xsl:call-template>
							</span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">........</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;height:4.5mm;">1z</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;height:4.5mm;">
							<xsl:if test="BusinessCreditsGrp/AllowableQlfyElectricVehGrp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/AllowableQlfyElectricVehGrp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/AllowableQlfyElectricVehGrp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/AllowableQlfyElectricVehGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/AllowableQlfyElectricVehGrp/AllowableQualifiedElecVehAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Schedule C Line 1aa-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">aa</div>
						<div class="styLNDesc" style="width:107mm;">
							<span style="float:left">New hire retention (carryforward only) 
                <!-- Push Pin image -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/NewHireRetentionCreditAmtGrp/NewHireRetentionCreditAmt"/>
								</xsl:call-template>
							</span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">............</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;height:4.5mm;">1aa</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;height:4.5mm;">
							<xsl:if test="BusinessCreditsGrp/NewHireRetentionCreditAmtGrp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/NewHireRetentionCreditAmtGrp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/NewHireRetentionCreditAmtGrp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/NewHireRetentionCreditAmtGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/NewHireRetentionCreditAmtGrp/NewHireRetentionCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Schedule C Line 1bb-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">bb</div>
						<div class="styLNDesc" style="width:107mm;"> 
               General credits from an electing large partnership (Schedule K-1 (Form 
                 <span style="float:left">1065-B)) 
                  <!-- Push Pin image -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYGenBusCrElectingLgePrtshpGrp/CYGenBusCrElectingLgePrtshpAmt"/>
								</xsl:call-template>
							</span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">.....................</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;height:8mm;padding-top:3mm;">1bb</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;height:8mm;padding-top:3mm;">
							<xsl:if test="BusinessCreditsGrp/CYGenBusCrElectingLgePrtshpGrp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYGenBusCrElectingLgePrtshpGrp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/CYGenBusCrElectingLgePrtshpGrp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYGenBusCrElectingLgePrtshpGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;height:8mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYGenBusCrElectingLgePrtshpGrp/CYGenBusCrElectingLgePrtshpAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Schedule C Line 1zz-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">zz</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left">Other </span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">........................</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;height:4.5mm;">1zz</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;text-align:center;height:4.5mm;">
							<xsl:if test="BusinessCreditsGrp/OtherCurrentYearCreditAmtGrp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/OtherCurrentYearCreditAmtGrp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/OtherCurrentYearCreditAmtGrp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/OtherCurrentYearCreditAmtGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;height:4.5mm;">
							<!-- Push Pin image -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/OtherCurrentYearCreditAmtGrp/OtherCurrentYearCreditAmt"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/OtherCurrentYearCreditAmtGrp/OtherCurrentYearCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Schedule C Line 2-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="padding-left:2.25mm;">2</div>
						<div class="styLNDesc" style="width:107mm;">
							<span style="float:left">Add lines 1a through 1zz and enter here and on the applicable line of Part I</span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">..</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox">2</div>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px;background-color:lightgrey">
								
							</div>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearGeneralBusCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- End Schedule C Line 2 -->
				<!-- Schedule C Line 3-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="padding-left:2.25mm;">3</div>
						<div class="styLNDesc" style="width:107mm;">
							<span style="float:left">Enter the amount from Form 8844 here and on the applicable line of Part II
          <!-- Push Pin image -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/EnterAmountFromF8844Grp/EnterAmountFromF8844Amt"/>
								</xsl:call-template>
							</span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;"/>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-bottom-width:0px;height:4.5mm;">3</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;text-align:center;height:4.5mm;">
							<xsl:if test="BusinessCreditsGrp/EnterAmountFromF8844Grp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/EnterAmountFromF8844Grp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/EnterAmountFromF8844Grp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/EnterAmountFromF8844Grp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/EnterAmountFromF8844Grp/EnterAmountFromF8844Amt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Schedule C Line 4a-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;border-bottom-width:0px;">4a</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left">Investment (Form 3468, Part III) (attach Form 3468) 
                                     <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/InvestmentCreditGrp/InvestmentCreditAmt"/>
								</xsl:call-template>
							</span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">.......</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;height:4.5mm;">4a</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;height:4.5mm;">
							<xsl:if test="BusinessCreditsGrp/InvestmentCreditGrp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/InvestmentCreditGrp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/InvestmentCreditGrp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/InvestmentCreditGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;height:4.5mm;">
							<!-- Push Pin image -->
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/InvestmentCreditGrp/InvestmentCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Schedule C Line 4b-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">b</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left">Work opportunity (Form 5884)
                <!-- Push Pin image -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/WorkOpportunityCrFrom5884Grp/WorkOpportunityCrFrom5884Amt"/>
								</xsl:call-template>
							</span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">.............</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:px solid black;border-bottom-width:0px;height:4.5mm;">4b</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;height:4.5mm;">
							<xsl:if test="BusinessCreditsGrp/WorkOpportunityCrFrom5884Grp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/WorkOpportunityCrFrom5884Grp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/WorkOpportunityCrFrom5884Grp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/WorkOpportunityCrFrom5884Grp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:0px solid black;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/WorkOpportunityCrFrom5884Grp/WorkOpportunityCrFrom5884Amt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Schedule C Line4c-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">c</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left">Biofuel producer (Form 6478) 
                <!-- Push Pin image -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/BiofuelProducerCreditGrp/BiofuelProducerCreditAmt"/>
								</xsl:call-template>
							</span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">................</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;height:4.5mm;">4c</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;height:4.5mm;">
							<xsl:if test="BusinessCreditsGrp/BiofuelProducerCreditGrp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/BiofuelProducerCreditGrp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/BiofuelProducerCreditGrp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/BiofuelProducerCreditGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/BiofuelProducerCreditGrp/BiofuelProducerCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Schedule C Line 4d-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">d</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left"> Low-income housing (Form 8586, Part II) 
                   	<!-- Push Pin image -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/LowIncomeHousingCreditGrp/LowIncomeHousingCreditAmt"/>
								</xsl:call-template>
							</span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:0px solid black;text-align:center;height:4.5mm;">4d</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;text-align:center;height:4.5mm;">
							<xsl:if test="BusinessCreditsGrp/LowIncomeHousingCreditGrp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/LowIncomeHousingCreditGrp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/LowIncomeHousingCreditGrp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/LowIncomeHousingCreditGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/LowIncomeHousingCreditGrp/LowIncomeHousingCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Schedule C Line 4e-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">e</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;padding-top:1mm;"> 
             Renewable electricity, refined coal, and Indian coal production (Form 8835)
                <!-- Push Pin image -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/RnwblElecCoalCrFromF8835Grp/RnwblElecCoalCrFromF8835Amt"/>
							</xsl:call-template>
							<!--Dotted Line -->
							<span style="letter-spacing:4mm;font-weight:bold;padding-left:2.8mm;"/>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-bottom-width:0px;height:5mm;padding-top:1mm;">4e</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;height:5mm;padding-top:1mm;text-align:center;">
							<xsl:if test="BusinessCreditsGrp/RnwblElecCoalCrFromF8835Grp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/RnwblElecCoalCrFromF8835Grp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/RnwblElecCoalCrFromF8835Grp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/RnwblElecCoalCrFromF8835Grp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;height:5mm;height:5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/RnwblElecCoalCrFromF8835Grp/RnwblElecCoalCrFromF8835Amt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- End Schedule C Line 4e -->
				<!-- Schedule C Line 4f-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">f</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;"> 
          Employer social security and Medicare taxes paid on certain employee tips (Form 8846)    
           
                	<!-- Push Pin image -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CrForEmployerSSMedicareTaxGrp/CreditForEmployerSSMedcrTxAmt"/>
							</xsl:call-template>
							<!--Dotted Line -->
							<span style="letter-spacing:4mm;font-weight:bold;padding-left:7.5mm;">.................</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-bottom-width:0px;border-top:1px solid black;height:8.5mm;padding-top:4mm;">4f</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;height:8.5mm;padding-top:4mm;text-align:center;">
							<xsl:if test="BusinessCreditsGrp/CrForEmployerSSMedicareTaxGrp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CrForEmployerSSMedicareTaxGrp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/CrForEmployerSSMedicareTaxGrp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CrForEmployerSSMedicareTaxGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;height:8.5mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CrForEmployerSSMedicareTaxGrp/CreditForEmployerSSMedcrTxAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Schedule C Line 4g-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">g</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left">Qualified railroad track maintenance (Form 8900) 
                							<!-- Push Pin image -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/QualifiedRailroadTrackMaintGrp/QualifiedRailroadTrackMaintAmt"/>
								</xsl:call-template>
							</span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">........</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;height:4.5mm;">4g</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;height:4.5mm;">
							<xsl:if test="BusinessCreditsGrp/QualifiedRailroadTrackMaintGrp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/QualifiedRailroadTrackMaintGrp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/QualifiedRailroadTrackMaintGrp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/QualifiedRailroadTrackMaintGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/QualifiedRailroadTrackMaintGrp/QualifiedRailroadTrackMaintAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Schedule C Line 4h-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">h</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left">Small employer health insurance premiums (Form 8941)
                									<!-- Push Pin image -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/SmallEmployerHIPCreditAmtGrp/SmallEmployerHIPCreditAmt"/>
								</xsl:call-template>
							</span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">......</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;height:4.5mm;">4h</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;height:4.5mm;">
							<xsl:if test="BusinessCreditsGrp/SmallEmployerHIPCreditAmtGrp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/SmallEmployerHIPCreditAmtGrp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/SmallEmployerHIPCreditAmtGrp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/SmallEmployerHIPCreditAmtGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/SmallEmployerHIPCreditAmtGrp/SmallEmployerHIPCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Schedule C Line 4i-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">i</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left"> Reserved</span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">.......................</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;height:4.5mm;">4i</div>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;border-top:1px solid black;background-color:lightgrey"/>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;border-top:1px solid black;background-color:lightgrey">	</div>
					</div>
				</div>
				<!-- Schedule C Line 4j-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">j</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left">Reserved</span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">.......................</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;height:4.5mm;">4j</div>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;border-top:1px solid black;background-color:lightgrey"/>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;border-top:1px solid black;background-color:lightgrey">	</div>
					</div>
				</div>
				<!-- Schedule C Line 4z-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">z</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left">Other </span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">........................</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;height:4.5mm;">4z</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;text-align:center;height:4.5mm;">
							<xsl:if test="BusinessCreditsGrp/OtherSpecifiedCreditAmtGrp/PassThroughEntityEIN !=''">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/OtherSpecifiedCreditAmtGrp/PassThroughEntityEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="BusinessCreditsGrp/OtherSpecifiedCreditAmtGrp/MissingEINReasonCd !=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/OtherSpecifiedCreditAmtGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;height:4.5mm;">
							<!-- Push Pin image -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/OtherSpecifiedCreditAmtGrp/OtherSpecifiedCreditAmt"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/OtherSpecifiedCreditAmtGrp/OtherSpecifiedCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Schedule C Line 5-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="padding-left:2.25mm">5</div>
						<div class="styLNDesc" style="width:107mm;">
							<span style="float:left">Add lines 4a through 4z and enter here and on the applicable line of Part II</span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;"/>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="padding-top:0mm;height:4.5mm;">5</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;background-color:lightgrey;height:4.5mm;">
								
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/SumOfAllowableGeneralBusCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- End Schedule C Line 5 -->
				<!-- Schedule C Line 6-->
				<div class="styBB" style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="padding-left:2.25mm">6</div>
						<div class="styLNDesc" style="width:107mm;p">
							<span style="float:left">Add lines 2, 3, and 5 and enter here and on the applicable line of Part II</span>
							<!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">..</div>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-bottom-width:0px;">6</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;background-color:lightgrey;">
								
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/TotalBusinessCreditsAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!--Page 3 Footer -->
				<!-- Just here III-->
				<div style="width:187mm;clear:both;padding-top:1mm;" class="pageend">
					<div style="width:90mm;font-weight:bold;" class="styGenericDiv"/>
					<div style="width:55mm;text-align:center;" class="styGenericDiv"/>
					<div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">3800</span> (2014)</div>
				</div>
			</div>
			<!--</xsl:for-each>-->
		</div>
	</xsl:template>
	<xsl:template name="PartIIIemptyTemplate">
		<!--     Checkbox Iiiiiiiii  -->
					<div style="width:187mm;height:1px;">
						<div style="width:187mm;clear:both;padding-bottom:.5mm;" class="styBB">
							<div style="width:90mm;" class="styGenericDiv">Form 3800 (2014)</div>
							<div style="width:55mm;text-align:center;" class="styGenericDiv"/>
							<div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">3</span>
							</div>
						</div>
			<div class="styBB" style="width:187mm;border-top:none;">
				<div class="styPartName" style="background-color:black;">Part III</div>
				<div class="styPartDesc">
					<span style="width:8px;"/>General Business Credits or Eligible Small Business Credits <span style="font-weight:normal">(see instructions)</span>
				</div>
			</div>
			<div class="styBB" style="width:187mm;padding-top:1mm;padding-bottom:1mm;">
				<div style="width:140mm;">Complete a separate Part III for each box checked below. (see instructions)</div>
				<div style="height:1mm;width:187mm;float:left;">
					<span style="width:90mm;">
						<span class="styLNLeftNumBox" style="width:5mm;padding-bottom:0mm;">A</span>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="GeneralBusCrCarryforwardsInd"/>
								<xsl:with-param name="BackupName">IRS3800GeneralBusCrFromNnpssvActyInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="GeneralBusCrFromPassiveActyGrp/GeneralBusCrFromNnpssvActyInd"/>
								<xsl:with-param name="BackupName">IRS3800GeneralBusCrFromNnpssvActyInd</xsl:with-param>
							</xsl:call-template>
							<span style="width:2mm;"/>General Business Credit From a Non-Passive Activity
							</label>
					</span>
					<span style="width:90mm;">
						<span class="styLNLeftNumBox" style="width:5mm;padding-bottom:0mm;">E</span>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="EligSmllBusCrFromNnpssvActyInd"/>
								<xsl:with-param name="BackupName">IRS3800EligSmllBusCrFromNnpssvActyInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="EligSmllBusCrFromNnpssvActyGrp/EligSmllBusCrFromNnpssvActyInd"/>
								<xsl:with-param name="BackupName">IRS3800EligSmllBusCrFromNnpssvActyInd</xsl:with-param>
							</xsl:call-template>
							<span style="width:2mm;"/>Eligible Small Business Credit From a Non-Passive Activity
                      </label>
					</span>
					<span style="width:90mm;">
						<span class="styLNLeftNumBox" style="width:5mm;padding-bottom:0mm;">B</span>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="GeneralBusCrFromPassiveActyInd"/>
								<xsl:with-param name="BackupName">IRS3800GeneralBusCrFromPassiveActyInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="GeneralBusCrFromPassiveActyGrp/GeneralBusCrFromPassiveActyInd"/>
								<xsl:with-param name="BackupName">IRS3800GeneralBusCrFromPassiveActyInd</xsl:with-param>
							</xsl:call-template>
							<span style="width:2mm;"/>General Business Credit From a Passive Activity
							</label>
					</span>
					<span style="width:90mm;">
						<span class="styLNLeftNumBox" style="width:5mm;padding-bottom:0mm;">F</span>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="EligSmllBusCrFromPssvActyInd"/>
								<xsl:with-param name="BackupName">IRS3800EligSmllBusCrFromPssvActyInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="EligSmllBusCrFromPssvActyInd"/>
								<xsl:with-param name="BackupName">IRS3800EligSmllBusCrFromPssvActyInd</xsl:with-param>
							</xsl:call-template>
							<span style="width:2mm;"/>Eligible Small Business Credit From a Passive Activity
                      </label>
					</span>
					<span style="width:90mm;">
						<span class="styLNLeftNumBox" style="width:5mm;padding-bottom:0mm;">C</span>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="GeneralBusCrCarryforwardsInd"/>
								<xsl:with-param name="BackupName">IRS3800GeneralBusCrCarryforwardsInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="GeneralBusCrCarryforwardsInd"/>
								<xsl:with-param name="BackupName">IRS3800GeneralBusCrCarryforwardsInd</xsl:with-param>
							</xsl:call-template>
							<span style="width:2mm;"/>General Business Credit Carryforwards
							</label>
					</span>
					<span style="width:90mm;">
						<span class="styLNLeftNumBox" style="width:5mm;padding-bottom:0mm;">G</span>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="EligSmllBusCrCarryforwardsInd"/>
								<xsl:with-param name="BackupName">IRS3800EligSmllBusCrCarryforwardsInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="EligSmllBusCrCarryforwardsInd"/>
								<xsl:with-param name="BackupName">IRS3800EligSmllBusCrCarryforwardsInd</xsl:with-param>
							</xsl:call-template>
							<span style="width:2mm;"/>Eligible Small Business Credit Carryforwards
                      </label>
					</span>
					<span style="width:90mm;">
						<span class="styLNLeftNumBox" style="width:5mm;padding-bottom:0mm;">D</span>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="GeneralBusCrCarrybacksInd"/>
								<xsl:with-param name="BackupName">IRS3800GeneralBusCrCarrybacksInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="GeneralBusCrCarrybacksInd"/>
								<xsl:with-param name="BackupName">IRS3800GeneralBusCrCarrybacksInd</xsl:with-param>
							</xsl:call-template>
							<span style="width:2mm;"/>General Business Credit Carrybacks
							</label>
					</span>
					<span style="width:90mm;">
						<span class="styLNLeftNumBox" style="width:5mm;padding-bottom:0mm;">H</span>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="EligSmllBusCrCarrybacksInd"/>
								<xsl:with-param name="BackupName">IRS3800EligSmllBusCrCarrybacksInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="EligSmllBusCrCarrybacksInd"/>
								<xsl:with-param name="BackupName">IRS3800EligSmllBusCrCarrybacksInd</xsl:with-param>
							</xsl:call-template>
							<span style="width:2mm;"/>Eligible Small Business Credit Carrybacks
                      </label>
					</span>
					<span class="styLNDesc" style="width:180mm;padding-left:1mm;">
						<b>I</b>
						<span style="width:3.5mm;"/>  If you are filing more than one Part
                      III with box A, B, E, or F checked, complete and attach first an additional Part III combining</span>
					<span class="styLNDesc" style="width:180mm;padding-left:6mm;"> amounts from all Parts III with boxes A, B, E, or F checked.
                          Check here if this is the consolidated Part III   
                       <span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;">...
                     </span>
						<img src="{$ImagePath}/3800_Bullet.gif" alt="bullet image"/>
						<span style="width:5mm"/>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="ConsolidatedSectionInd"/>
								<xsl:with-param name="BackupName">IRS3800ConsolidatedSectionInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="ConsolidatedSectionInd"/>
								<xsl:with-param name="BackupName">IRS3800ConsolidatedSectionInd</xsl:with-param>
							</xsl:call-template>
						</label>
						<!--start here III-->
					</span>
				</div>
				<div style="width:187mm;">
					<div class="styNameBox" style="text-align:center;width:123.2mm;height:14mm;font-weight:normal;font-size:8pt;  border-top-width:1px;border-bottom-width:1px;">
						<b>(a)</b> Description of credit

<br/>
						<div style="text-align:left;">
							<b>Note:</b> On any line where the credit is from more than one source, a separate Part III is needed for each pass-through entity.
</div>
					</div>
					<div class="styNameBox" style="text-align:center;width:32mm;height:14mm;  border-top-width:1px;font-size:8pt;">
						<b>(b)</b>
						<br/>

If claiming the credit from a pass-through entity, enter the EIN

</div>
					<div class="styNameBox" style="font-size:8pt;text-align:center;width:31mm;  height:14mm;border-top-width:1px;border-right-width:0px;">
						<b>(c)</b>
						<br/>

Enter the appropriate amount

</div>
				</div>
				<!-- Schedule C Line 1a-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">1a</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left">Investment (Form 3468, Part II only) (attach Form 3468) </span>
							<!--Dotted Line -->
							<!-- Push Pin image -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;">1a</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center">
							
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
								</div>
					</div>
				</div>
				<!-- Schedule C Line 1b-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">b</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left"> Reserved</span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBoxNBB" style="border-top:0px solid black;">1b</div>
						<div class="styLNAmountBoxNBB" style="border-bottom-width:0px;border-top:1px solid black;background-color:lightgrey">
								
							</div>
						<div class="styLNAmountBoxNBB" style="border-bottom-width:0px;border-top:1px solid black;background-color:lightgrey">
								
							</div>
					</div>
				</div>
				<!-- Schedule C Line 1c-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">c</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left"> Increasing research activities (Form 6765)</span>
							<!--Dotted Line -->
							<!-- Push Pin image -->
							<span style="float:none;">
                                </span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:1px;">1c</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
							
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
							  							</div>
					</div>
				</div>
				<!-- Schedule C Line 1d-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">d</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left"> Low-income housing (Form 8586, Part I only) </span>
							<!-- Push Pin image -->
							<span style="float:none;">
                                </span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px;">1d</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;text-align:center;">
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;">
							</div>
					</div>
				</div>
				<!-- Schedule C Line 1e-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">e</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left">Disabled access (Form 8826) (see instructions for limitation) </span>
							<!-- Push Pin image -->
							<span style="float:none;">
							    </span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px;">1e</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px;text-align:center;">
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px;">
							</div>
					</div>
				</div>
				<!-- End Schedule C Line 1e -->
				<!-- Schedule C Line 1f-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">f</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left">Renewable electricity, refined coal, and Indian coal production (Form 8835) </span>
							<!-- Push Pin image -->
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px;border-bottom-width:0px;">1f</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px;text-align:center;">
								
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px;">
							
								
							</div>
					</div>
				</div>
				<!-- Schedule C Line 1g-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">g</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left">Indian employment (Form 8845)</span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1g</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
							</div>
					</div>
				</div>
				<!-- Schedule C Line 1h-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">h</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left">Orphan drug (Form 8820)</span>
							<!-- Push Pin image -->
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1h</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
								
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
					
								
							</div>
					</div>
				</div>
				<!-- Schedule C Line 1i-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">i</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left">New markets (Form 8874) </span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;">1i</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;text-align:center;">
						
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;">
							
								
							</div>
					</div>
				</div>
				<!-- Schedule C Line1j-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:8mm;padding-left:4mm;">j</div>
						<div class="styLNDesc" style="height:8mm;width:107mm;padding-top:1mm;"> 
                 Small employer pension plan startup costs (Form 8881) (see instructions for
                 <span style="float:left;"> limitation)</span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>
							<!-- Push Pin image -->
							<span style="width:3mm;"/>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;border-bottom-width:0px;">1j</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;height:8mm;padding-top:4mm;text-align:center;">
							
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;height:8mm;padding-top:4mm;">
							</div>
					</div>
				</div>
				<!-- Schedule C Line 1k-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:8mm;padding-left:4mm;">k</div>
						<div class="styLNDesc" style="height:8mm;width:107mm;"> 
             Employer-provided child care facilities and services (Form 8882) (see
             <span style="float:left"> instructions for limitation)</span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="height:8mm;border-top:1px solid black;border-bottom-width:0px;padding-top:4mm;">1k</div>
						<div class="styLNAmountBox" style="height:8mm;border-bottom-width:0px;border-top:1px solid black;text-align:center;padding-top:4mm;">
							</div>
						<div class="styLNAmountBox" style="height:8mm;border-bottom-width:0px;border-top:1px solid black;padding-top:4mm;">
								</div>
					</div>
				</div>
				<!-- Schedule C Line 1l-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">l</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left;">Biodiesel and renewable diesel fuels  (attach Form 8864) </span>
							<!-- Push Pin image -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearBiodieselFuelCrGrp/CurrentYearBiodieselFuelCrAmt"/>
							</xsl:call-template>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1l</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
							
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
							
							</div>
					</div>
				</div>
				<!-- Schedule C Line 1m-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">m</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left;">Low sulfur diesel fuel production (Form 8896) </span>
							<!-- Push Pin image -->
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1m</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
							</div>
					</div>
				</div>
				<!-- Schedule C Line 1n-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">n</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left;">Distilled spirits (Form 8906) </span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1n</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
								</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
							</div>
					</div>
				</div>
				<!-- Schedule C Line 1o-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">o</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left;">Nonconventional source fuel (Form 8907)</span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1o</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
							
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
							
							</div>
					</div>
				</div>
				<!-- Schedule C Line 1p-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">p</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left;">Energy efficient home (Form 8908)</span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1p</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;;border-top:1px solid black;text-align:center;">
									</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
								
							</div>
					</div>
				</div>
				<!-- Schedule C Line 1q-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">q</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left;">Energy efficient appliance (Form 8909) </span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1q</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
							
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
							</div>
					</div>
				</div>
				<!-- Schedule C Line 1r-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">r</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left;">Alternative motor vehicle (Form 8910) </span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1r</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
							
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
								
							</div>
					</div>
				</div>
				<!-- Schedule C Line 1s-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">s</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left;">Alternative fuel vehicle refueling property (Form 8911) </span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1s</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
							
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
							
							</div>
					</div>
				</div>
				<!-- Schedule C Line 1t-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">t</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left;">Reserved</span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1t</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;background-color:lightgrey">
								
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;background-color:lightgrey">
								
							</div>
					</div>
				</div>
				<!-- Schedule C Line 1u-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">u</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left;">Mine rescue team training (Form 8923)</span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;">1u</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;text-align:center;">
										
							
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;">
							
							</div>
					</div>
				</div>
				<!-- End Schedule C Line 1v -->
				<!-- Schedule C Line 1v-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">v</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;padding-top:1mm;">
							<span style="float:left;">Agricultural chemicals security (Form 8931) (see instructions for limitation)</span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="height:4.5mm;border-top:1px;border-bottom-width:0px;">1v</div>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;border-top:1px;text-align:center;">
							
							</div>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;border-top:1px;">
								
							</div>
					</div>
				</div>
				<!-- End Schedule C Line 1v -->
				<!-- Schedule C Line 1w-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">w</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left;">Employer differential wage payments (Form 8932) </span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;text-align:center;">1w</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
							
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
								
							</div>
					</div>
				</div>
				<!-- Schedule C Line 1x-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">x</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left;">Carbon dioxide sequestration (Form 8933)</span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1x</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
									</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CarbonDioxideCreditGrp/CarbonDioxideCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Schedule C Line 1y-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">y</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left;">Qualified plug-in electric drive motor vehicle (Form 8936) </span>
							<!-- Push Pin image -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/QlfyPlugInElecDriveMtrVehCrGrp/QlfyPlugInElecDriveMtrVehCrAmt"/>
							</xsl:call-template>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1y</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
							
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:0px solid black;">
							
							</div>
					</div>
				</div>
				<!-- Schedule C Line 1z-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">z</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left;">Qualified plug-in electric vehicle (Form 8834, Part I only) </span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1z</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
											
							
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
							
							</div>
					</div>
				</div>
				<!-- Schedule C Line 1aa-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">aa</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left;">New hire retention (Form 5884-B) </span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1aa</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
												</div>
					</div>
				</div>
				<!-- Schedule C Line 1bb-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">bb</div>
						<div class="styLNDesc" style="height:8mm;width:107mm;padding-top:1mm;"> 
                General credits from an electing large partnership (Schedule K-1 (<span style="float:left;">Form 1065-B))</span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;border-top:1px solid black;border-bottom-width:0px;">1bb</div>
						<div class="styLNAmountBox" style="height:8.5mm;padding-top:4mm;border-bottom-width:0px;border-top:1px solid black;text-align:center;">
							</div>
						<div class="styLNAmountBox" style="height:8.5mm;padding-top:4mm;border-bottom-width:0px;border-top:1px solid black;">
							</div>
					</div>
				</div>
				<!-- Schedule C Line 1zz-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">zz</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left;">Other </span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;">1zz</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;text-align:center;">
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;">
							</div>
					</div>
				</div>
				<!-- Schedule C Line 2-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="padding-left:2.25mm;">2</div>
						<div class="styLNDesc" style="width:107mm;">
							<span style="float:left;">Add lines 1a through 1zz and enter here </span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox">2</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;background-color:lightgrey">
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;">
							
							</div>
					</div>
				</div>
				<!-- End Schedule C Line 2 -->
				<!-- Schedule C Line 3-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="padding-left:2.25mm;">3</div>
						<div class="styLNDesc" style="width:107mm;">
							<span style="float:left;">Enter the amount from Form 8844</span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-bottom-width:0px;">3</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;text-align:center;">
															
						
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;">
							
							</div>
					</div>
				</div>
				<!-- Schedule C Line 4a-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;border-bottom-width:0px;">4a</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left;">Investment (Form 3468, Part III) (attach Form 3468) </span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;">4a</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;">
							</div>
					</div>
				</div>
				<!-- Schedule C Line 4b-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">b</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left;">Work opportunity (Form 5884)</span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:px solid black;border-bottom-width:0px;">4b</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:0px solid black;">
							</div>
					</div>
				</div>
				<!-- Schedule C Line4c-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">c</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left;">Biofuel producer (Form 6478) </span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;">4c</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
							</div>
					</div>
				</div>
				<!-- Schedule C Line 4d-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">d</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left;">Low-income housing (Form 8586, Part II) </span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:0px solid black;text-align:center;">4d</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;text-align:center;">
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;">
							</div>
					</div>
				</div>
				<!-- Schedule C Line 4e-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">e</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;padding-top:1mm;">
							<span style="float:left;">Renewable electricity, refined coal, and Indian coal production (Form 8835)</span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-bottom-width:0px;height:2mm;padding-top:1mm;">4e</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;height:2mm;padding-top:1mm;text-align:center;">
							
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;height:5mm;">
							
							</div>
					</div>
				</div>
				<!-- End Schedule C Line 4e -->
				<!-- Schedule C Line 4f-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">f</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Employer social security and Medicare taxes paid on certain employee tips <span style="float:left;">(Form 8846) </span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-bottom-width:0px;border-top:1px solid black;height:8.5mm;padding-top:4mm;">4f</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;height:8.5mm;padding-top:4mm;text-align:center;">
						
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;height:8.5mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CrForEmployerSSMedicareTaxGrp/CreditForEmployerSSMedcrTxAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
				<!-- Schedule C Line 4g-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">g</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left;">Qualified railroad track maintenance (Form 8900) </span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">4g</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
													
							
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
							
							</div>
					</div>
				</div>
				<!-- Schedule C Line 4h-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">h</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left;">Small employer health insurance premiums (Form 8941)</span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">4h</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
														
							
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
							
							</div>
					</div>
				</div>
				<!-- Schedule C Line 4i-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">i</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left;">Reserved </span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">4i</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;background-color:lightgrey"/>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;background-color:lightgrey">	</div>
					</div>
				</div>
				<!-- Schedule C Line 4j-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">j</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left;">Reserved </span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">4j</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;background-color:lightgrey"/>
						<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;background-color:lightgrey">	</div>
					</div>
				</div>
				<!-- Schedule C Line 4z-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">z</div>
						<div class="styLNDesc" style="height:4mm;width:107mm;">
							<span style="float:left;">Other </span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="border-top:1px solid black;">4z</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;text-align:center;">
							
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;">
							<!-- Push Pin image -->
						</div>
					</div>
				</div>
				<!-- Schedule C Line 5-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="padding-left:2.25mm">5</div>
						<div class="styLNDesc" style="width:107mm;">
							<span style="float:left;">Add lines 4a through 4z and enter here </span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox" style="height:4.5mm;padding-top:0mm;">5</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;background-color:lightgrey;">
								
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;">
				
							</div>
					</div>
				</div>
				<!-- End Schedule C Line 5 -->
				<!-- Schedule C Line 6-->
				<div style="width:187mm;">
					<div style="float:left;clear:none:">
						<div class="styLNLeftNumBox" style="padding-left:2.25mm">6</div>
						<div class="styLNDesc" style="width:107mm;p">
							<span style="float:left;">Add lines 2, 3, and 5</span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
						</div>
					</div>
					<div style="float:right;clear:none;">
						<div class="styLNRightNumBox">6</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;background-color:lightgrey;">
								
							</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;">
									
							</div>
					</div>
				</div>
			</div>
			<!--</xsl:for-each>-->
		</div>
		<!--Page 3 Footer -->
		<div style="width:187mm;clear:both;padding-top:1mm;" class="pageend">
			<div style="width:90mm;font-weight:bold;" class="styGenericDiv"/>
			<div style="width:55mm;text-align:center;" class="styGenericDiv"/>
			<div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">3800</span> (2014)</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
