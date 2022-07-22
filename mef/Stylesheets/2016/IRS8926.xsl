<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8926Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="Form8926Data" select="$RtnDoc/IRS8926"/>
	<xsl:template match="/">
		<!-- Updated 09/27/2011 (RLW)  -->
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8926Data)"/>
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
				<meta name="Description" content="IRS Form 8926"/>
				<xsl:call-template name="InitJS"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"/>
				<style type="text/css">
					<!-- $PRINT STATEMENT -->
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8926Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<form name="Form8926">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Begin Form Number and Name -->
					<div class="styTBB" style="width:187mm;height:20mm;">
						<!-- Begin Left Form Title Box -->
						<div class="styFNBox" style="width:32mm;height:20mm;">
							<div>
								Form<span class="styFormNumber"> 8926</span>
								<!--General Dependency Push Pin -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8926Data"/>
								</xsl:call-template>
								<br/>
								(Rev. December 2011)
							</div>
							<div style="line-height:120%;padding-top:1.5mm;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<!--Close Left Form Title Box -->
						<!--Begin Center Form Title Box  -->
						<div class="styFTBox" style="width:122.5mm;height:20mm;">
							<div class="styMainTitle">Disqualified Corporate Interest Expense Disallowed </div>
							<div class="styMainTitle">Under Section 163(j) and Related Information </div>
							<div class="styFBT" style="margin-top:1.25mm;font-weight:bold;">
								<img src="{$ImagePath}/8926_Bullet.gif" alt="bullet image"/> 
						Attach to the corporation's income tax return.
				    </div>
							<br/>
							<div class="styFBT" style="margin-top:1.25mm;font-weight:bold;">
								<img src="{$ImagePath}/8926_Bullet.gif" alt="bullet image"/> 
                  See separate instructions.
              </div>
						</div>
						<!--Close Center Form Title Box -->
						<!--Begin Right Form Title Box -->
						<div class="styTYBox" style="width:32mm;height:20mm;padding-top:8.5mm;">        
              OMB No. 1545-2127        
            </div>
					</div>
					<!--Close Right Form Title Box -->
					<!-- End Form Number and Name -->
					<!-- Begin Name and Employer identification number Line -->
					<div class="styBB" style="width:187mm">
						<div class="styNameBox" style="width:131mm;font-weight:normal;font-size:7pt;">
						    Name of corporation (name of parent, if an affiliated group)<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8926Data/CorporationName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8926Data/CorporationName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style=" padding-left:2mm;font-size:7pt;">
							<span class="BoldText">Employer identification number</span>
							<br/>
							<br/>
							<span style="font-weight:normal;">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$Form8926Data/CorporationEIN"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!--  End Name and Employer indentification number  -->
					<!--Begin Check Line -->
					<div style="width:187mm;padding-top:4mm;">
						<div class="styLNDesc" style="width:179mm;">
						<span style="float:left;">Check here if the form is being filed on behalf of an affiliated group described in section 1504(a) </span>
						<!--Dotted Line-->
							<span class="styDotLn" style="padding-right:1mm;">.............</span>							
						</div>
						<input type="checkbox" class="styCkbox" alt="Section 1504a Affiliated Group Indicator">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form8926Data/FiledForSec1504aAfflGroupInd"/>
								<xsl:with-param name="BackupName">IRS8926Section1504aAffiliatedGroup</xsl:with-param>
							</xsl:call-template>
						</input>
						<!--<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$Form8926Data/FiledForSec1504aAfflGroupInd"/>
								<xsl:with-param name="BackupName">IRS8926Section1504aAffiliatedGroup</xsl:with-param>
							</xsl:call-template>
						</label>-->
					</div>
					<!--L1a -->
					<div style="width:187mm;padding-top:1mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">1a</div>
							<div class="styLNDesc" style="width:97mm;">
                Enter the total amount of the corporation’s money at the end of the tax 
                <div style="float:left;">year 
            <!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;padding-left:2.7mm;">......................</span>
								</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">1a</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8926Data/CorporationMoneyEOYAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;background:lightgrey;border-top-width:0px;border-bottom-width:0"/>
							<div class="styLNAmountBox" style="height:8mm;border-top-width:0px;border-bottom-width:0"/>
						</div>
					</div>
					<!--L1b -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="padding-left:4mm;">b</div>
							<div class="styLNDesc" style="width:97mm;">
                Enter the adjusted basis of all the corporation’s other assets at the end of 
                <span style="float:left;">the tax year </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">1b</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8926Data/AdjustedBasisOthCorpAstsEOYAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;background:lightgrey;border-bottom-width:0"/>
							<div class="styLNAmountBox" style="height:8mm;border-bottom-width:0"/>
						</div>
					</div>
					<!-- L1c -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:8mm;padding-left:4mm;padding-top:4mm;">c</div>
							<div class="styLNDesc" style="width:97mm;height:8mm;padding-top:4mm;">
								<span style="float:left;">Add lines 1a and 1b </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">1c</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8926Data/SumCorpETYRevNdAdjBsAstAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;background:lightgrey;border-bottom-width:0"/>
							<div class="styLNAmountBox" style="height:8mm;border-bottom-width:0"/>
						</div>
					</div>
					<!--L1d -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="padding-left:4mm;">d</div>
							<div class="styLNDesc" style="width:97mm;">
                Enter the total amount of the corporation’s indebtedness at the end of the 
                <span style="float:left;">tax year (see instructions) </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">1d</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8926Data/CorporationIndebtednessEOYAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;background:lightgrey;border-bottom-width:0"/>
							<div class="styLNAmountBox" style="height:8mm;border-bottom-width:0"/>
						</div>
					</div>
					<!-- L1e -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:8mm;padding-top:4mm;padding-left:4mm;">e</div>
							<div class="styLNDesc" style="width:137mm;height:8mm;padding-top:4mm">
								<span style="float:left;">Subtract line 1d from line 1c. If zero or less, enter $1 </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">1e</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8926Data/SETYTotRevNAdjBAstLsIndbtAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- L1f -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:8mm;padding-top:4mm;padding-left:4mm;">f</div>
							<div class="styLNDesc" style="width:127mm;height:8mm;padding-top:4mm">
								<span style="float:left;">
									<span style="font-weight:bold;">Debt to equity ratio.</span> Divide line 1d by line 1e (see instructions) </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
							</div>
						</div>
						<!--Due #54661 reduce the font size to keep the form integerity-->
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">1f</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;font-size:6pt;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8926Data/DebtToEquityRt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--1g-->
					<div style="width:187mm;height:7mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="padding-left:4mm;">g</div>
							<div class="styLNDesc" style="width:147mm;">
								Is the corporation including as part of its assets on line 1b stock described in Regulations section 1.7874-1(d) that it 
								<span style="float:left;"> holds in a corporation to whom it paid disqualified interest?</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNDesc" style="width:16mm;text-align:right;padding-top:3.5mm;">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8926Data/DisregardAffltOwnStkInd"/>
									</xsl:call-template>
									<input type="Checkbox" class="styCkbox" alt="Regulations Section 1.7874-1(d) Stock Yes Indicator">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8926Data/DisregardAffltOwnStkInd"/>
											<xsl:with-param name="BackupName">IRS8926RegSect178741dStock</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form8926Data/DisregardAffltOwnStkInd"/>
										<xsl:with-param name="BackupName">IRS8926RegSect178741dStock</xsl:with-param>
									</xsl:call-template>
									<span style="font-weight:bold;"> Yes</span>
								</label>
								<span style="width:4mm;"/>
							</div>
							<div class="styLNDesc" style="width:16mm;text-align:right;padding-top:3.5mm;">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8926Data/DisregardAffltOwnStkInd"/>
									</xsl:call-template>
									<input type="Checkbox" class="styCkbox" alt="Regulations Section 1.7874-1(d) Stock No Indicator">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8926Data/DisregardAffltOwnStkInd"/>
											<xsl:with-param name="BackupName">IRS8926RegSect178741dStock</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form8926Data/DisregardAffltOwnStkInd"/>
										<xsl:with-param name="BackupName">IRS8926RegSect178741dStock</xsl:with-param>
									</xsl:call-template>
									<span style="font-weight:bold;"> No</span>
								</label>
								<span style="width:4mm;"/>
							</div>
						</div>
					</div>
					<!-- L1g If Yes line -->
					<!-- NOTE: checkbox does not belong to the yes line -->
					<div style="width:187mm;height:6mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD"/>
							<div class="styLNDesc" style="width:97mm;">
								<span style="float:left;">If "Yes," enter the adjusted basis of that stock </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
							</div>
							<div>
								<!--image -->
								<img src="{$ImagePath}/8886_Bullet.gif" alt="Right Arrow Bullet"/>
								<span style="width:1px;"/>$
								<!--Underline -->
								<span style="border-bottom:1 solid black; width:35mm;text-align:right;padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8926Data/DisregardAffltOwnStkAdjBssAmt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBoxNBB" style="border-left-width:0px;"/>
							<div class="styLNAmountBoxNBB" style="border-left-width:0px;"/>
						</div>
					</div>
					<!--1h-->
					<div style="width:187mm">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="padding-left:4mm;">h</div>
							<div class="styLNDesc" style="width:147mm;">
								<span style="float:left;">Is the corporation including as part of its assets on line 1b stock it holds in foreign subsidiaries? </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">......</span> 
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNDesc" style="width:16mm;text-align:right;">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8926Data/ForeignSubsidiaryStockInd"/>
									</xsl:call-template>
									<input type="Checkbox" class="styCkbox" alt="Foreign Subsidiary Stock Yes Indicator">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8926Data/ForeignSubsidiaryStockInd"/>
											<xsl:with-param name="BackupName">IRS8926ForeignSubsidiaryStock</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form8926Data/ForeignSubsidiaryStockInd"/>
										<xsl:with-param name="BackupName">IRS8926ForeignSubsidiaryStock</xsl:with-param>
									</xsl:call-template>
									<span style="font-weight:bold;"> Yes</span>
								</label>
								<span style="width:4mm;"/>
							</div>
							<div class="styLNDesc" style="width:16mm;text-align:right;">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8926Data/ForeignSubsidiaryStockInd"/>
									</xsl:call-template>
									<input type="Checkbox" class="styCkbox" alt="Foreign Subsidiary Stock No Indicator">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8926Data/ForeignSubsidiaryStockInd"/>
											<xsl:with-param name="BackupName">IRS8926ForeignSubsidiaryStock</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form8926Data/ForeignSubsidiaryStockInd"/>
										<xsl:with-param name="BackupName">IRS8926ForeignSubsidiaryStock</xsl:with-param>
									</xsl:call-template>
									<span style="font-weight:bold;"> No</span>
								</label>
								<span style="width:4mm;"/>
							</div>
						</div>
					</div>
					<!-- L1h If Yes line -->
					<!-- NOTE: checkbox does not belong to the yes line -->
					<div style="width:187mm;height:6mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD"/>
							<div class="styLNDesc" style="width:97mm;">
								<span style="float:left;">If "Yes," enter the adjusted basis of that stock </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
							</div>
							<div>
								<!--image -->
								<img src="{$ImagePath}/8886_Bullet.gif" alt="Right Arrow Bullet"/>
								<span style="width:1px;"/>$
                <!--Underline -->
								<span style="border-bottom:1 solid black; width:35mm;text-align:right;padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8926Data/ForeignSubsidiaryStkAdjBssAmt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBoxNBB" style="border-left-width:0px;"/>
							<div class="styLNAmountBoxNBB" style="border-left-width:0px;"/>
						</div>
					</div>
					<!--1i-->
					<div style="width:187mm;height:7mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="padding-left:4mm;">i</div>
							<div class="styLNDesc" style="width:147mm;">
								Is the corporation including as part of its assets on line 1b tangible assets it directly holds that are located in a
								<span style="float:left;"> foreign country? (see instructions) </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.........................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNDesc" style="width:16mm;text-align:right;padding-top:3.5mm;;">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8926Data/TangibleAssetsForeignCntryInd"/>
									</xsl:call-template>
									<input type="Checkbox" class="styCkbox" alt="Tangible Assets Foreign Country Yes Indicator">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8926Data/TangibleAssetsForeignCntryInd"/>
											<xsl:with-param name="BackupName">IRS8926TangibleAssetsForeignCntry</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form8926Data/TangibleAssetsForeignCntryInd"/>
										<xsl:with-param name="BackupName">IRS8926TangibleAssetsForeignCntry</xsl:with-param>
									</xsl:call-template>
									<span style="font-weight:bold;"> Yes</span>
								</label>
								<span style="width:4mm;"/>
							</div>
							<div class="styLNDesc" style="width:16mm;text-align:right;padding-top:3.5mm;;">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8926Data/TangibleAssetsForeignCntryInd"/>
									</xsl:call-template>
									<input type="Checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8926Data/TangibleAssetsForeignCntryInd"/>
											<xsl:with-param name="BackupName">IRS8926TangibleAssetsForeignCntry</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form8926Data/TangibleAssetsForeignCntryInd"/>
										<xsl:with-param name="BackupName">IRS8926TangibleAssetsForeignCntry</xsl:with-param>
									</xsl:call-template>
									<span style="font-weight:bold;"> No</span>
								</label>
								<span style="width:4mm;"/>
							</div>
						</div>
					</div>
					<!-- L1i If Yes line -->
					<!-- NOTE: checkbox does not belong to the yes line -->
					<div style="width:187mm;height:6mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD"/>
							<div class="styLNDesc" style="width:97mm;">
								<span style="float:left;">If "Yes," enter the adjusted basis of those tangible assets </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
							</div>
							<div>
								<!--image -->
								<img src="{$ImagePath}/8886_Bullet.gif" alt="Right Arrow Bullet"/>
								<span style="width:1px;"/>$
								<!--Underline -->
								<span style="border-bottom:1 solid black; width:35mm;text-align:right;padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8926Data/TangibleAstsFrgnCntryAdjBssAmt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBoxNBB" style="border-left-width:0px;"/>
							<div class="styLNAmountBoxNBB" style="border-left-width:0px;"/>
						</div>
					</div>
					<!--1j-->
					<div style="width:187mm">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="padding-left:4mm;">j</div>
							<div class="styLNDesc" style="width:147mm;">
								<span style="float:left;">Is the corporation including as part of its assets on line 1b any intangible assets? </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span> 
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNDesc" style="width:16mm;text-align:right;">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8926Data/IntangibleAssetsInd"/>
										<xsl:with-param name="BackupName">IRS8926IntangibleAssets</xsl:with-param>
									</xsl:call-template>
									<input type="Checkbox" class="styCkbox" alt="Intangible Assets Yes Indicator">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8926Data/IntangibleAssetsInd"/>
											<xsl:with-param name="BackupName">IRS8926IntangibleAssets</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form8926Data/IntangibleAssetsInd"/>
										<xsl:with-param name="BackupName">IRS8926IntangibleAssets</xsl:with-param>
									</xsl:call-template>
									<span style="font-weight:bold;"> Yes</span>
								</label>
								<span style="width:4mm;"/>
							</div>
							<div class="styLNDesc" style="width:16mm;text-align:right;">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8926Data/IntangibleAssetsInd"/>
									</xsl:call-template>
									<input type="Checkbox" class="styCkbox" alt="Intangible Assets No Indicator">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8926Data/IntangibleAssetsInd"/>
											<xsl:with-param name="BackupName">IRS8926IntangibleAssets</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form8926Data/IntangibleAssetsInd"/>
										<xsl:with-param name="BackupName">IRS8926IntangibleAssets</xsl:with-param>
									</xsl:call-template>
									<span style="font-weight:bold;"> No</span>
								</label>
								<span style="width:4mm;"/>
							</div>
						</div>
					</div>
					<!-- L1j If Yes line -->
					<!-- NOTE: checkbox does not belong to the yes line -->
					<div style="width:187mm;height:6mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD"/>
							<div class="styLNDesc" style="width:97mm;">
								<span style="float:left;">If "Yes," enter the adjusted basis of those intangible assets </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
							</div>
							<div>
								<!--image -->
								<img src="{$ImagePath}/8886_Bullet.gif" alt="Right Arrow Bullet"/>
								<span style="width:1px;"/>$
								<!--Underline -->
								<span style="border-bottom:1 solid black; width:35mm; text-align:right;padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8926Data/IntangibleAssetsAdjustedBssAmt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBoxNBB" style="border-left-width:0px;"/>
							<div class="styLNAmountBoxNBB" style="border-left-width:0px;"/>
						</div>
					</div>
					<!--L2a -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">2a</div>
							<div class="styLNDesc" style="width:137mm;">
								<span style="float:left;">Enter the interest paid or accrued by the corporation for the tax year </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox">2a</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8926Data/InterestPaidOrAccruedAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--L2b -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;padding-left:4mm;">b</div>
							<div class="styLNDesc" style="width:137mm;height:8mm;padding-top:4mm;">
								<span style="float:left;">Enter any interest includible in the gross income of the corporation for the tax year </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">2b</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8926Data/InterestIncludibleGrossIncmAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--L2c -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;padding-left:4mm;">c</div>
							<div class="styLNDesc" style="width:137mm;height:8mm;padding-top:4mm;">
								<span style="float:left;">
									<span style="font-weight:bold;">Net interest expense. </span>Subtract line 2b from line 2a. If zero or less, enter -0- </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">2c</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8926Data/NetInterestExpenseAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--L3a -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:8mm;padding-top:4mm;">3a</div>
							<div class="styLNDesc" style="width:137mm;height:8mm;padding-top:4mm;">
								<span style="float:left;">Enter the corporation’s taxable income (loss) before the application of section 163(j) </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">3a</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8926Data/TaxableIncOrLossBfrSect163jAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--L3b -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;padding-left:4mm;">b</div>
							<div class="styLNDesc" style="width:137mm;height:8mm;padding-top:4mm;">
								<span style="float:left;">Enter the corporation’s net interest expense from line 2c </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">3b</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8926Data/CopyNetInterestExpenseAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--L3c -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;padding-left:4mm;">c</div>
							<div class="styLNDesc" style="width:137mm;height:8mm;padding-top:4mm;">
								<span style="float:left;">Enter any net operating loss deduction taken by the corporation under section 172 </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">3c</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8926Data/Sect172NOLTakenAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--L3d -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;padding-left:4mm;">d</div>
							<div class="styLNDesc" style="width:137mm;height:8mm;padding-top:4mm;">
								<span style="float:left;">Enter any deduction taken under section 199 </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">3d</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8926Data/Section199DeductionTakenAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--L3e -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;padding-left:4mm;">e</div>
							<div class="styLNDesc" style="width:137mm;height:8mm;padding-top:4mm;">
								<span style="float:left;">Enter any deduction taken for depreciation, amortization, or depletion </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">3e</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8926Data/DeprecAmortzDpltnDedTakenAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--L3f -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">f</div>
							<div class="styLNDesc" style="width:137mm;">
                Enter any additional adjustments the corporation has made to its taxable income (loss) (other than 
                those listed on lines 3b through 3e above) in arriving at its adjusted taxable income (see instructions—
                <span style="float:left;">attach schedule) 
                <!-- Form to Form Link or Push Pin -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form8926Data/AddnlAdjsTxblIncmOrLossAmt"/>
									</xsl:call-template>
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">...........................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">3f</div>
							<div class="styLNAmountBox" style="height:11mm;padding-top:7mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8926Data/AddnlAdjsTxblIncmOrLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--L3g -->
					<div class="styTBB" style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;padding-left:4mm;">g</div>
							<div class="styLNDesc" style="width:137mm;height:8mm;padding-top:4mm;">
								<span style="float:left;">
									<span style="font-weight:bold;">Adjusted taxable income. </span>Combine lines 3a through 3f. If zero or less, enter -0- </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBoxNBB" style="height:8mm;padding-top:4mm;">3g</div>
							<div class="styLNAmountBoxNBB" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8926Data/AdjustedTaxableIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Page Break-->
					<!-- Footer-->
					<div class="pageEnd" style="width:187mm;">
						<div style="float:left;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions. </span>
							<span style="width:80px;"/>                        
                Cat. No. 37739W 
            </div>
						<div style="float:right;">
							<span style="width:70px;"/>  
                Form <span class="styBoldText" style="font-size:8pt;">8926</span> (Rev. 12-2011)
            </div>
					</div>
					<p style="page-break-before: always"/>
					<!--Begin Page 2 -->
					<!-- Header -->
					<div class="styTBB" style="width:187mm;">
						<div style="float:left;">Form 8926 (Rev. 12-2011) <span style="width:130mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!--L4a -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:8mm;padding-top:4mm;">4a</div>
							<div class="styLNDesc" style="width:137mm;height:8mm;padding-top:4mm;">
								<span style="float:left;">Multiply line 3g by 50% </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">..........................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">4a</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8926Data/FiftyPctOfAdjTxblIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--L4b -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
							<div class="styLNDesc" style="width:137mm;">
                Enter any unused excess limitation carried forward to the current tax year from the prior 3 tax years 
                <span style="float:left;">(see instructions) </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">............................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">4b</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8926Data/UnusedExcessLimitCarriedFwdAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--L4c -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;padding-left:4mm;">c</div>
							<div class="styLNDesc" style="width:137mm;height:8mm;padding-top:4mm;">
								<span style="float:left;">Add lines 4a and 4b </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">...........................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">4c</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8926Data/SumPctAdjTxIncNUnExLmCryFwdAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--L4d -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;padding-left:4mm;">d</div>
							<div class="styLNDesc" style="width:137mm;height:8mm;padding-top:4mm;">
								<span style="float:left;">
									<span style="font-weight:bold;">Excess interest expense. </span>Subtract line 4c from line 2c. If zero or less, enter -0- </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">4d</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8926Data/ExcessInterestExpenseAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--L5a -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:8mm;padding-top:4mm;">5a</div>
							<div class="styLNDesc" style="width:137mm;height:8mm;padding-top:4mm;">
								<span style="float:left;">Enter any disqualified interest paid or accrued by the corporation to a related person </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">5a</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8926Data/DisqualifiedIntToRltdPrsnAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--L5b -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
							<div class="styLNDesc" style="width:137mm;">
                Enter any disqualified interest paid or accrued by the corporation on indebtedness subject to a 
                <span style="float:left;">disqualified guarantee </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">..........................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">5b</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8926Data/DsqlfyIntIndbtSubjToDsqlfyGAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--L5c -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
							<div class="styLNDesc" style="width:137mm;">
                Enter any interest paid or accrued by a taxable REIT subsidiary (as defined in section 856(l)) of a real 
                <span style="float:left;">estate investment trust to such trust </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">5c</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8926Data/IntByTxblREITSbsdrySect856lAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--L5d -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;padding-left:4mm;">d</div>
							<div class="styLNDesc" style="width:137mm;height:8mm;padding-top:4mm;">
								<span style="float:left;">Add lines 5a, 5b, and 5c </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">..........................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">5d</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8926Data/TotDsIntPdOrAcNTxREITPdOrAcAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--L5e -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">e</div>
							<div class="styLNDesc" style="width:137mm;">
                Enter any disqualified interest disallowed under section 163(j) for prior tax years that is treated as paid 
                <span style="float:left;">or accrued in the current tax year </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">5e</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8926Data/DisqlfyIntDsallwSect163jAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--L5f -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;padding-left:4mm;">f</div>
							<div class="styLNDesc" style="width:137mm;height:8mm;padding-top:4mm;">
								<span style="float:left;">
									<span style="font-weight:bold;">Total disqualified interest for the tax year. </span>Add lines 5d and 5e </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">5f</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8926Data/TotalDisqualifiedInterestAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--L6 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:8mm;padding-top:4mm;">6</div>
							<div class="styLNDesc" style="font-weight:bold;width:175mm;height:8mm;padding-top:4mm;">Information about related persons receiving disqualified interest: </div>
						</div>
						<div style="float:right;clear:none">
							<div style="width:4mm;height:8mm;padding-top:4mm;">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form8926Data/RelatedPersonInformation"/>
									<xsl:with-param name="containerHeight" select="5"/>
									<xsl:with-param name="headerHeight" select="1"/>
									<xsl:with-param name="containerID" select=" 'DIctn' "/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--L6 Table*************************************************************************************************************************** -->
					<div class="styTableContainer" id="DIctn" style="width:187mm;">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" cellspacing="0" name="TYTable" id="TYTable">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" style="width:8mm;border-right-width:0px;border-bottom-width:0px;" scope="col"/>
									<th class="styTableCellHeader" style="width:120mm;border-color:black;border-top-width:1px;" scope="col">
                    Name, Address, and ZIP code
                  </th>
									<th class="styTableCellHeader" style="width:59mm;border-right-width:0px;border-color:black;border-top-width:1px;" scope="col">
                    Country of Incorporation <br/>or Organization
                  </th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!-- Choice when Separated Print is not selected and Line 6, Information about related persons receiving disqualified interest is less than or equal to 5  -->
								<xsl:if test="($Print != $Separated or count($Form8926Data/RelatedPersonInformation) &lt;= 5)">
									<xsl:for-each select="$Form8926Data/RelatedPersonInformation">
										<tr>
											<!-- L6, column 1-->
											<td class="styTableCell" style="width:8mm;padding-left:4mm;text-align:left;font-weight:bold;border-color:black;border-bottom-width:0px;border-right-width:0px;">
												<xsl:number format="a" value="position()"/>
												<span class="styTableCellPad"/>
											</td>
											<!-- L6, Column 2 -->
											<td class="styTableCell" style="width:120mm;text-align:left;border-color:black;border-left-width:0px;">
												<xsl:if test="position() = last()">
													<xsl:attribute name="style">width:120mm;text-align:left;border-color:black;border-left-width:0px;border-bottom:0px;</xsl:attribute>
												</xsl:if>
												<xsl:choose>
													<xsl:when test="RelatedPersonNameAddrZipCode/BusinessName/BusinessNameLine1Txt !=''">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="RelatedPersonNameAddrZipCode/BusinessName/BusinessNameLine1Txt"/>
														</xsl:call-template>
														<xsl:if test="RelatedPersonNameAddrZipCode/BusinessName/BusinessNameLine2Txt !=''">
															<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="RelatedPersonNameAddrZipCode/BusinessName/BusinessNameLine2Txt"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="RelatedPersonNameAddrZipCode/PersonNm"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
												<br/>
												<xsl:choose>
													<xsl:when test="RelatedPersonNameAddrZipCode/USAddress">
														<xsl:call-template name="PopulateUSAddressTemplate">
															<xsl:with-param name="TargetNode" select="RelatedPersonNameAddrZipCode/USAddress"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateForeignAddressTemplate">
															<xsl:with-param name="TargetNode" select="RelatedPersonNameAddrZipCode/ForeignAddress"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
												<span class="styTableCellPad"/>
											</td>
											<!-- L6, Column 3 -->
											<td class="styTableCell" style="width:59mm;border-style:solid;border-right-width:0px;text-align:center;border-color:black;">
												<xsl:if test="position() = last()">
													<xsl:attribute name="style">width:59mm;border-style:solid;border-right-width:0px;text-align:center;border-color:black;border-bottom:0px;</xsl:attribute>
												</xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="IncorporationCountryCd"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!--Blank Table**************************************************************************************************************************************-->
								<!-- Row 1 of Blank Table -->
								<xsl:if test="(count($Form8926Data/RelatedPersonInformation) &lt; 1) or (($Print = $Separated) and (count($Form8926Data/RelatedPersonInformation) &gt; 5))">
									<tr style="height:12mm;font-size:7pt;">
										<!-- L6, column 1-->
										<td class="styTableCell" style="width:8mm;padding-left:4mm;text-align:left;font-weight:bold;border-color:black;border-bottom-width:0px;border-right-width:0px;">
											<xsl:number format="a" value="position()"/>
											<span class="styTableCellPad"/>
										</td>
										<!-- L6, Column 2 -->
										<td class="styTableCell" style="width:120mm;text-align:left;border-color:black;border-left-width:0px;">
											<!--Add See additional Table comment to the empty table to the first field -->
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form8926Data/RelatedPersonInformation"/>
												<xsl:with-param name="ShortMessage" select="'false'"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<!-- L6, Column 3 -->
										<td class="styTableCell" style="width:59mm;border-style:solid;border-right-width:0px;text-align:center;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<!-- Row 2 of Blank Table -->
								<xsl:if test="(count($Form8926Data/RelatedPersonInformation) &lt; 2) or (($Print = $Separated) and (count($Form8926Data/RelatedPersonInformation) &gt; 5))">
									<tr style="height:12mm;font-size:7pt;">
										<!-- L6, column 1-->
										<td class="styTableCell" style="width:8mm;padding-left:4mm;text-align:left;text-weight:bold;border-color:black;border-bottom-width:0px;border-right-width:0px;">
											<span style="font-weight:bold;">b </span>
											<span class="styTableCellPad"/>
										</td>
										<!-- L6, Column 2 -->
										<td class="styTableCell" style="width:120mm;text-align:left;border-color:black;border-left-width:0px;">
											<span class="styTableCellPad"/>
										</td>
										<!-- L6, Column 3 -->
										<td class="styTableCell" style="width:59mm;border-style:solid;border-right-width:0px;text-align:center;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<!-- Row 3 of Blank Table -->
								<xsl:if test="(count($Form8926Data/RelatedPersonInformation) &lt; 3) or (($Print = $Separated) and (count($Form8926Data/RelatedPersonInformation) &gt; 5))">
									<tr style="height:12mm;font-size:7pt;">
										<!-- L6, column 1-->
										<td class="styTableCell" style="width:8mm;padding-left:4mm;text-align:left;text-weight:bold;border-color:black;border-bottom-width:0px;border-right-width:0px;">
											<span style="font-weight:bold;">c</span>
											<span class="styTableCellPad"/>
										</td>
										<!-- L6, Column 2 -->
										<td class="styTableCell" style="width:120mm;text-align:left;border-color:black;border-left-width:0px;">
											<span class="styTableCellPad"/>
										</td>
										<!-- L6, Column 3 -->
										<td class="styTableCell" style="width:59mm;border-style:solid;border-right-width:0px;text-align:center;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<!-- Row 4 of Blank Table -->
								<xsl:if test="(count($Form8926Data/RelatedPersonInformation) &lt; 4) or (($Print = $Separated) and (count($Form8926Data/RelatedPersonInformation) &gt; 5))">
									<tr style="height:12mm;font-size:7pt;">
										<!-- L6, column 1-->
										<td class="styTableCell" style="width:8mm;padding-left:4mm;text-align:left;text-weight:bold;border-color:black;border-bottom-width:0px;border-right-width:0px;">
											<span style="font-weight:bold;">d</span>
											<span class="styTableCellPad"/>
										</td>
										<!-- L6, Column 2 -->
										<td class="styTableCell" style="width:120mm;text-align:left;border-color:black;border-left-width:0px;">
											<span class="styTableCellPad"/>
										</td>
										<!-- L6, Column 3 -->
										<td class="styTableCell" style="width:59mm;border-style:solid;border-right-width:0px;text-align:center;border-color:black;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<!-- Row 5 of Blank Table -->
								<xsl:if test="(count($Form8926Data/RelatedPersonInformation) &lt; 5) or (($Print = $Separated) and (count($Form8926Data/RelatedPersonInformation) &gt; 5))">
									<tr style="height:12mm;font-size:7pt;">
										<!-- L6, column 1-->
										<td class="styTableCell" style="width:8mm;padding-left:4mm;text-align:left;text-weight:bold;border-color:black;border-bottom-width:0px;border-right-width:0px;">
											<span style="font-weight:bold;">e</span>
											<span class="styTableCellPad"/>
										</td>
										<!-- L6, Column 2 -->
										<td class="styTableCell" style="width:120mm;text-align:left;border-color:black;border-left-width:0px;border-bottom-width:0px;">
											<span class="styTableCellPad"/>
										</td>
										<!-- L6, Column 3 -->
										<td class="styTableCell" style="width:59mm;border-style:solid;border-right-width:0px;text-align:center;border-color:black;border-bottom-width:0px;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$Form8926Data/RelatedPersonInformation"/>
							<xsl:with-param name="containerHeight" select="5"/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerID" select=" 'DIctn' "/>
						</xsl:call-template>
					</div>
					<!--**************************************************************************************************************************************************-->
					<!--L7 -->
					<div style="width:187mm;height:14mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">7</div>
							<div class="styLNDesc" style="width:137mm;">
								<b>Amount of interest deduction disallowed under section 163(j) for the current tax year and carried 
					forward to the next tax year. </b>  If line 1f is 1.5 or less, enter the smaller of line 4d or line 5e. If line 1f is greater than 1.5, subtract 
					the smaller of line 4d or line 5d from the interest the corporation would have otherwise deducted this tax year (see  instructions)				
				
                <!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:14mm;padding-top:10mm;">7</div>
							<div class="styLNAmountBox" style="height:14mm;padding-top:10mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8926Data/IntDedDsallw163jCFNextTYAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--L8a -->
					<div style="width:187mm;height:8mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:8mm;padding-top:4mm;">8a</div>
							<div class="styLNDesc" style="width:97mm;height:8mm;padding-top:4mm;">
								<span style="float:left;">Unused excess limitation carryforward from the prior 2 tax years</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">8a</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8926Data/UnsdExLmtCfddFromPrior2YrsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;background:lightgrey;border-bottom-width:0"/>
							<div class="styLNAmountBox" style="height:8mm;border-bottom-width:0"/>
						</div>
					</div>
					<!--L8b -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:10mm;padding-top:4mm;padding-left:4mm;">b</div>
							<div class="styLNDesc" style="width:97mm;height:10mm;padding-top:4mm;">
								<span style="font-weight:bold;">Excess limitation for the current tax year. </span>Subtract line 2c from line 4a.  
                <span style="float:left;">If zero or less, enter -0- </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:10mm;padding-top:6mm;">8b</div>
							<div class="styLNAmountBox" style="height:10mm;padding-top:6mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8926Data/ExcessLimitationForCurrYrAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:10mm;background:lightgrey;border-bottom-width:0"/>
							<div class="styLNAmountBox" style="height:10mm;border-bottom-width:0"/>
						</div>
					</div>
					<!-- L8c -->
					<div class="styTBB" style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:8mm;padding-top:4mm;padding-left:4mm;">c</div>
							<div class="styLNDesc" style="width:137mm;height:8mm;padding-top:4mm;">
								<span style="float:left;">
									<span style="font-weight:bold;">Excess limitation carryforward to the next tax year. </span>Add lines 8a and 8b (see instructions) </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBoxNBB" style="height:8mm;padding-top:4mm;">8c</div>
							<div class="styLNAmountBoxNBB" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8926Data/ExcessLmtCfddToNextTaxYrAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Footer -->
					<div class="pageEnd" style="width:187mm;">
						<div class="stySmallText" style="width:150mm;text-align:center;padding-top:1mm;">
							<span style="width:156px"/>
						</div>
						<div class="stySmallText" style="width:36mm;text-align:right;float;right;">Form <span class="styBoldText" style="font-size:8pt;">8926</span> 			(Rev. 12-2011)</div>
					</div>
					<!--Page End-->
					<br/>
					<!-- BEGIN Left Over Table -->
					<!-- ADDITIONAL DATA Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
                  Additional Data        
                </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form8926Data"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
					<!--L6 Table*************************************************************************************************************************** -->
					<xsl:if test="$Print = $Separated and count($Form8926Data/RelatedPersonInformation) &gt; 5">
						<div class="styRepeatingDataTitle">Form 8926, Line 6 - Information about Related Persons Receiving Disqualified Interest:</div>
						<div class="styTableContainer" id="TPctn" style="width:187mm;height:27mm;font-size:7pt;">
							<xsl:call-template name="SetInitialState"/>
							<table class="styDepTbl" cellspacing="0" name="TYTable" id="TYTable">
								<thead class="styTableThead">
									<tr class="styDepTblHdr">
										<th class="styDepTblCell" style="width:8mm;" scope="col"/>
										<th class="styDepTblCell" style="width:90mm;border-color:black;border-top-width:1px;" scope="col">
                    Name, Address, and ZIP code
                  </th>
										<th class="styDepTblCell" style="width:89mm;border-right-width:0px;border-color:black;border-top-width:1px;" scope="col">
                    Country of Incorporation or Organization
                  </th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<!-- Choice when Separated Print is not selected and Line 6, Information about related persons receiving disqualified interest is less than 
                or equal to 5  -->
									<xsl:for-each select="$Form8926Data/RelatedPersonInformation">
										<tr style="height:12mm;font-size:7pt;">
											<!-- L6, column 1-->
											<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styDepTblCell" style="width:8mm;padding-left:4mm;text-align:left;font-weight:bold;border-color:black;border-bottom-width:0px;border-right-width:0px;">
												<xsl:number format="a" value="position()"/>
												<span class="styTableCellPad"/>
											</td>
											<!-- L6, Column 2 -->
											<td class="styDepTblCell" style="width:120mm;text-align:left;border-color:black;border-left-width:1px;">
												<xsl:choose>
													<xsl:when test="RelatedPersonNameAddrZipCode/BusinessName/BusinessNameLine1Txt !=''">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="RelatedPersonNameAddrZipCode/BusinessName/BusinessNameLine1Txt"/>
														</xsl:call-template>
														<xsl:if test="RelatedPersonNameAddrZipCode/BusinessName/BusinessNameLine2Txt !=''">
															<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="RelatedPersonNameAddrZipCode/BusinessName/BusinessNameLine2Txt"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="RelatedPersonNameAddrZipCode/PersonNm"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
												<br/>
												<xsl:choose>
													<xsl:when test="RelatedPersonNameAddrZipCode/USAddress">
														<xsl:call-template name="PopulateUSAddressTemplate">
															<xsl:with-param name="TargetNode" select="RelatedPersonNameAddrZipCode/USAddress"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateForeignAddressTemplate">
															<xsl:with-param name="TargetNode" select="RelatedPersonNameAddrZipCode/ForeignAddress"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
												<span class="styTableCellPad"/>
											</td>
											<!-- L6, Column 3 -->
											<td class="styDepTblCell" style="width:59mm;border-style:solid;border-right-width:0px;text-align:center;border-color:black;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="IncorporationCountryCd"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</div>
					</xsl:if>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
