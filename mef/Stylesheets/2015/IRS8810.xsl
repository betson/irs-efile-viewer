<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8810Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8810Data" select="$RtnDoc/IRS8810"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8810Data)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching  -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set  -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="Form IRS8810"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8810Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form8810">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styTBB" style="width:187mm;">
						<div class="styFNBox" style="width:30mm;height:18.5mm;">
							<div style="height:9mm;">Form<span class="styFormNumber">  8810</span>
							</div>
							<div style="height:6mm;padding-top:2.5mm;">
								<span class="styAgency">Department of the Treasury</span>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8810Data"/>
								</xsl:call-template>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:125mm;height:18.5mm;">
							<div class="styMainTitle" style="height:8mm;padding-top:1mm;">
								Corporate Passive Activity Loss and Credit Limitations
							 </div>
							<div class="styFST">
								<img src="{$ImagePath}/8810_Bullet_Sm.gif" alt="Bullet Image"/>
							   Attach to your tax return (personal service and closely held corporations only).
                             </div>
							<div class="styFST" style="height:5mm;font-size:6pt;padding-top:1mm;font-weight:bold">
								<img src="{$ImagePath}/3800_Bullet.gif" alt="bullet image"/>
								<b> Information about Form 8810 and its separate instructions is at </b>
								<a href="http://www.irs.gov/form8810" title="Link to irs.gov">
									<i>www.irs.gov/form8810</i>
								</a>
								 .
							  </div>
						</div>
						<div class="styTYBox" style="width:32mm;height:18.5mm;">
							<div class="styOMB" style="height:5mm;">
							OMB No. 1545-1091
						 </div>
							<div class="styTY" style="height:9mm;font-size:21pt;padding-top:2mm;">
                        20<span class="stytycolor">15</span>
							</div>
						</div>
					</div>
					<div style="width:187mm;height:9mm" class="styBB">
						<div style="width:138mm;height:9mm;font-weight:normal;font-size:7pt;" class="styNameBox">
							 Name<br/>
							<div style="font-family:verdana;font-size:7pt;height:7mm">
								<span>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div style="width:49mm;height:9mm;padding-left:2mm;font-weight:bold;font-size:7pt;" class="styEINBox">
							 Employer identification number<br/>
							<br/>
							<span style="font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Begin Part I -->
					<div style="width:187mm;height:8mm;" class="styBB">
						<div class="styPartName" style="width:15mm;">Part I</div>
						<div class="styPartDesc" style="padding-left:3mm;width:172mm;">
							 2015 Passive Activity Loss <br/>
							 Caution:<span class="styItalicText" style="font-weight:normal;">
							 See the instructions and complete Worksheets 1 and 2 before completing Part I.</span>
						</div>
					</div>
					<div style="width:187mm;" class="styBB">
						<div style="width:187mm;height:6.5mm;">
							<div class="styLNLeftNumBox" style="height:6.5mm;padding-top:2.5mm;padding-left:3mm">1a</div>
							<div style="float:left;padding-top:2.5mm;padding-bottom:.5mm;height:6.5mm;">
							Current year income (from Worksheet 2, column (a))                              
							</div>
							<div style="float:right;">
								<span class="styDotLn" style="height:6.5mm;padding-top:2.5mm;">         
									......
								</span>
								<div class="styLNRightNumBox" style="height:6.5mm;padding-top:2.5mm;">1a</div>
								<div class="styLNAmountBox" style="height:6.5mm;width:34mm;padding-top:2.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8810Data/CurrentYearIncomeAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="border-bottom-width:0px;background-color:lightgrey;height:6.5mm;"/>
								<div class="styLNAmountBoxNBB" style="height:6.5mm;"/>
							</div>
						</div>
						<div style="width:187mm;height:6mm;">
							<div class="styLNLeftLtrBox" style="height:6mm;padding-top:2mm;;padding-left:4.5mm">b</div>
							<div style="float:left;padding-top:2mm;padding-bottom:0mm;height:6mm;">
                        Current year deductions and losses (from Worksheet 2, column (b))                              
                     </div>
							<div style="float:right;">
								<span class="styDotLn" style="height:6mm;padding-top:2mm;">         
                        ..
                        </span>
								<div class="styLNRightNumBox" style="height:6.5mm;padding-top:2mm;">1b</div>
								<div class="styLNAmountBox" style="height:6.5mm;width:34mm;padding-top:2mm;">
									<xsl:call-template name="PopulateNegativeNumber">
										<xsl:with-param name="TargetNode" select="$Form8810Data/CurrentYearDeductionsAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px;height:6.5mm;"/>
								<div class="styLNAmountBoxNBB" style="height:6.5mm;"/>
							</div>
						</div>
						<div style="width:187mm">
							<div class="styLNLeftLtrBox" style="height:6mm;padding-top:2mm;padding-left:4.5mm;">c</div>
							<div style="float:left;padding-top:2mm;padding-bottom:.5mm;padding-top:2.5mm;">
                        Prior year unallowed losses (from Worksheet 2, column (c))                              
                     </div>
							<div style="float:right;">
								<span class="styDotLn" style="height:6mm;padding-top:2.5mm;">         
                        ....
                        </span>
								<div class="styLNRightNumBox" style="height:6mm;padding-top:2.6mm;">1c</div>
								<div class="styLNAmountBox" style="height:6mm;width:34mm;padding-top:2.6mm;">
									<xsl:call-template name="PopulateNegativeNumber">
										<xsl:with-param name="TargetNode" select="$Form8810Data/PriorYearUnallowedLossesAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px;height:6.5mm;"/>
								<div class="styLNAmountBoxNBB" style="height:6.5mm;"/>
							</div>
						</div>
						<div style="width:187mm">
							<div class="styLNLeftLtrBox" style="height:6mm;padding-top:2mm;padding-left:4.5mm">d</div>
							<div style="float:left;padding-top:2mm;padding-bottom:.5mm;height:6mm;">
                        Combine lines 1a, 1b, and 1c. If the result is net income or zero, see instructions   
                     </div>
							<div style="float:right;">
								<span class="styDotLn" style="height:6mm;padding-top:2mm;">         
                        ........
                        </span>
								<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;">1d</div>
								<div class="styLNAmountBox" style="height:6mm;padding-top:2mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8810Data/CYIncmCYDedAndPYUnllwLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<div style="width:187mm">
							<div class="styLNLeftNumBox" style="height:6mm;padding-top:2mm;padding-left:3mm">2</div>
							<div style="float:left;padding-top:2mm;padding-bottom:.5mm;height:6mm;">
								  Closely held corporations enter net active income and see instructions.
								  Personal service                      
							 </div>
							<div style="float:right;">
								<div class="styLNRightNumBoxNBB" style="height:6mm;padding-top:2mm;"/>
								<div class="styLNAmountBoxNBB" style="height:6mm;padding-top:2mm;"/>
							</div>
						</div>
						<div style="width:187mm">
							<div class="styLNLeftNumBox"/>
							<div style="float:left;">
                        corporations enter -0- on this line
                     </div>
							<div style="float:right">
								<span class="styDotLn">   
                           ......................     
                        </span>
								<div class="styLNRightNumBox">2</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8810Data/NetActiveIncomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<div style="width:187mm">
							<div class="styLNLeftNumBox" style="height:6mm;padding-top:2mm;padding-left:3mm">3</div>
							<div style="float:left;padding-top:2mm;padding-bottom:.5mm;height:6mm;">
								<span class="styBoldText">Unallowed passive activity deductions and losses.</span> Combine lines 1d and 2. If the
                  result is net income                  
                     </div>
							<div style="float:right;">
								<div class="styLNRightNumBoxNBB" style="height:6mm;padding-top:2mm;"/>
								<div class="styLNAmountBoxNBB" style="height:6mm;padding-top:2mm;"/>
							</div>
						</div>
						<div style="width:187mm">
							<div class="styLNLeftNumBox"/>
							<div style="float:left;">
                        or zero, see the instructions for lines 1d and 3.
                  Otherwise, go to line 4   </div>
							<div style="float:right">
								<span class="styDotLn">   
                           ...........   
                        </span>
								<div class="styLNRightNumBox">3</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8810Data/UnallowedPssvActyDedAndLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<div style="width:187mm">
							<div class="styLNLeftNumBox" style="height:6mm;padding-top:2mm;padding-left:3mm">4</div>
							<div style="float:left;padding-top:2mm;padding-bottom:.5mm;height:6mm;">
								<span class="styBoldText">Total deductions and losses allowed.</span> Add the income, if any, on lines 1a and 2
                        and enter the result 
                     </div>
							<div style="float:right;">
								<div class="styLNRightNumBoxNBB" style="height:6mm;padding-top:2mm;"/>
								<div class="styLNAmountBoxNBB" style="height:6mm;padding-top:2mm;"/>
							</div>
						</div>
						<div style="width:187mm">
							<div class="styLNLeftNumBox"/>
							<div style="float:left;">
                  (see instructions)   </div>
							<div style="float:right">
								<span class="styDotLn">   
                           .......................... 
                        </span>
								<div class="styLNRightNumBoxNBB">4</div>
								<div class="styLNAmountBoxNBB">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8810Data/TotalDedsAndLossesAllwAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- Begining Part II -->
					<div style="width:187mm;height:8mm" class="styBB">
						<div class="styPartName" style="width:15mm;">Part II</div>
						<div class="styPartDesc" style="padding-left:3mm;">
                     2015 Passive Activity Credits <br/>
                     Caution:<span class="styItalicText" style="font-weight:normal;"> 
                     See the instructions and complete Worksheet 5 before completing Part II.</span>
						</div>
					</div>
					<div style="width:187mm;" class="styBB">
						<div style="width:187mm">
							<div class="styLNLeftNumBox" style="height:7mm;padding-top:3mm;padding-left:3mm">5a</div>
							<div style="float:left;padding-top:3mm;padding-bottom:.5mm;height:7mm;">
                        Current year credits (from Worksheet 5, column (a))                              
                     </div>
							<div style="float:right;">
								<span class="styDotLn" style="height:7mm;padding-top:3mm;">         
                        ......
                        </span>
								<div class="styLNRightNumBox" style="height:7mm;padding-top:3mm;">5a</div>
								<div class="styLNAmountBox" style="height:7mm;width:34mm;padding-top:3mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8810Data/CurrentYearCreditAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px;height:7mm;"/>
								<div class="styLNAmountBoxNBB" style="height:7mm;"/>
							</div>
						</div>
						<div style="width:187mm">
							<div class="styLNLeftLtrBox" style="height:6mm;padding-top:2mm;padding-left:4.5mm">b</div>
							<div style="float:left;padding-top:2mm;padding-bottom:.5mm;height:6mm;">
                        Prior year unallowed credits (from Worksheet 5, column (b))                              
                     </div>
							<div style="float:right;">
								<span class="styDotLn" style="height:6mm;padding-top:2mm;">         
                        ...
                        </span>
								<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;">5b</div>
								<div class="styLNAmountBox" style="height:6mm;width:34mm;padding-top:2mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8810Data/PriorYearUnallowedCreditsAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px;height:6mm;"/>
								<div class="styLNAmountBoxNBB" style="height:6mm;"/>
							</div>
						</div>
						<div style="width:187mm">
							<div class="styLNLeftNumBox" style="height:6mm;padding-top:2mm;padding-left:3mm">6</div>
							<div style="float:left;padding-top:2mm;padding-bottom:.5mm;height:6mm;">
                        Add lines 5a and 5b                              
                     </div>
							<div style="float:right;">
								<span class="styDotLn" style="height:6mm;padding-top:2mm;">         
                        ...........................
                        </span>
								<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;">6</div>
								<div class="styLNAmountBox" style="height:6mm;padding-top:2mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8810Data/AddCYCreditsAndPYUnllwCrsAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<div style="width:187mm">
							<div class="styLNLeftNumBox" style="height:6mm;padding-top:2mm;padding-left:3mm">7</div>
							<div style="float:left;padding-top:2mm;padding-bottom:.5mm;height:6mm;">
                        Enter the tax attributable to net passive income and net active income (see instructions)                              
                     </div>
							<div style="float:right;">
								<span class="styDotLn" style="height:6mm;padding-top:2mm;">         
                        .....
                        </span>
								<span class="styDotLn" style="height:6mm;padding-top:2mm;"/>
								<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;">7</div>
								<div class="styLNAmountBox" style="height:6mm;padding-top:2mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8810Data/TaxNetPassiveIncmNetActIncmAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<div style="width:187mm">
							<div class="styLNLeftNumBox" style="height:6mm;padding-top:2mm;padding-left:3mm">8</div>
							<div style="float:left;padding-top:2mm;padding-bottom:.5mm;height:6mm;">
								<span class="styBoldText">Unallowed passive activity credit.</span> Subtract line 7 from line 6. If the result is zero
                        or less, enter -0-      
                     </div>
							<div style="float:right;">
								<span class="styDotLn" style="height:6mm;padding-top:2mm;">
                           ..   
                        </span>
								<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;">8</div>
								<div class="styLNAmountBox" style="height:6mm;padding-top:2mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8810Data/UnallowedPassiveActivityCrAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<div style="width:187mm">
							<div class="styLNLeftNumBox" style="height:6mm;padding-top:2mm;padding-left:3mm">9</div>
							<div style="float:left;padding-top:2mm;padding-bottom:.5mm;height:6mm;">
								<span class="styBoldText">Allowed passive activity credit.</span> Subtract line 8 from line 6 (see instructions)                           
                     </div>
							<div style="float:right;">
								<span class="styDotLn" style="height:6mm;padding-top:2mm;">
                           .........   
                        </span>
								<div class="styLNRightNumBoxNBB" style="height:6mm;padding-top:2mm;">9</div>
								<div class="styLNAmountBoxNBB" style="height:6mm;padding-top:2mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8810Data/AllowedPassiveActivityCrAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- Begin Part III -->
					<div style="width:187mm;height:7mm;" class="styBB">
						<div class="styPartName" style="width:15mm;margin-top:1.2mm;margin-bottom:1.8mm;">Part III</div>
						<div class="styPartDesc" style="width:168mm;padding-left:3mm;margin-top:1.2mm;margin-bottom:1.8mm;">
							 Election To Increase Basis of Credit Property
						  </div>
						<div class="styGenericDiv" style="width:4mm;height:auto;clear:none;padding-top:3mm;">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form8810Data/CrPropForWhichElectIsMadeGrp"/>
									<xsl:with-param name="containerHeight" select="1"/>
									<xsl:with-param name="headerHeight" select="3"/>
									<xsl:with-param name="containerID" select=" 'DEctn' "/>
								</xsl:call-template>
						</div>
					</div>
					<div class="styTableContainer" id="DEctn" style="height:28.5mm;">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" cellspacing="0" name="TYTable" id="TYTable" style="font-size:7pt;width:100%;">
							<thead class="styTableThead"/>
							<tfoot/>
							<tbody>
								<tr>
									<td class="styTableCell" style="width:8mm;font-weight:bold;text-align:left;border:0;vertical-align:top;">10<span class="styTableCellPad"/></td>
									<!-- Exception: Part III Line 10 third lines of text end with a checkbox, it is display differently due to naturally wrapping of text and the functionaly of scroll bar button expand/contract.  Customer concur of the deviation where the checkbox display in the same position for expand/contract scroll bar -->  									
									<td class="styTableCell" style="text-align:left;width:179mm;vertical-align:top;border:0;">
										<span style="float:left;">
											If the corporation disposed of its entire interest in a passive activity or former passive activity in a fully taxable
											transaction, and the corporation elects to increase the basis of credit property used in that activity by the unallowed
											credit that reduced the property's basis, check this box (see instructions)                  
											<span style="letter-spacing:3.2mm; font-weight:bold; ">..............................</span>
											<img src="{$ImagePath}/8810_Bullet_Md.gif" width="7" alt="bullet image"/>
											<span style="width:3px;"/>
											<input type="checkbox" class="styCkbox" onclick="return false;">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$Form8810Data/DisposOfEntireIntInPssvActyInd"/>
												</xsl:call-template>
											</input>
										</span>
									</td>
								</tr>
								<xsl:choose>
									<xsl:when test="$Form8810Data/CrPropForWhichElectIsMadeGrp">
										<xsl:if test="($Print != $Separated)                      or count($Form8810Data/CrPropForWhichElectIsMadeGrp) = 1">
											<xsl:for-each select="$Form8810Data/CrPropForWhichElectIsMadeGrp">
												<tr style="height:6mm;">
													<td class="styTableCell" style="width:8mm;font-weight:bold;text-align:left;border:0;                           vertical-align:top;">
			                                 11
			                              </td>
													<td class="styTableCell" style="width:179mm;text-align:left;vertical-align:top;border:0;">
														<span style="float:left;width:53mm;">
			                                       Name of passive activity disposed of <span style="width:4px;"/>
															<img src="{$ImagePath}/8810_Bullet_Md.gif" width="7" alt="bullet image"/>
														</span>
														<span style="border-bottom:1 solid black; width:121mm;float:right;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="DisposedPassiveActivityNm"/>
															</xsl:call-template>
														</span>
													</td>
												</tr>
												<tr style="height:6mm;">
													<td class="styTableCell" style="width:8mm;font-weight:bold;text-align:left;border:0;vertical-align:top;">
			                                 12
			                              </td>
													<td class="styTableCell" style="width:179mm;text-align:left;vertical-align:top;border-bottom-width:0px;border-right-width:0px;">
														<span style="float:left;padding-top:0mm;width:97mm;">   
			                                    Description of the credit property for which the election is being made <span style="width:7px;"/>
															<img src="{$ImagePath}/8810_Bullet_Md.gif" width="7" alt="bullet image"/>
														</span>
														<span style="border-bottom:1 solid black; width:75mm;float:right;">
															<span style="width:1px;"/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="PropertyDesc"/>
															</xsl:call-template>
														</span>
													</td>
												</tr>
												<tr style="height:6mm;">
													<td class="styTableCell" style="width:8mm;font-weight:bold;text-align:left;border:0;vertical-align:bottom;">
														13
													</td>
													<td class="styTableCell" style="width:179mm;text-align:left;text-align:left;vertical-align:bottom;border:0;">
														<span style="float:left;">
														Amount of unallowed credit that reduced the property's basis 
														<span style="width:3px;"/>
														</span>
														<span style="float:left;">
															<span class="styDotLn">
															   .............
															</span>
															<img src="{$ImagePath}/8810_Bullet_Md.gif" width="7" alt="bullet image"/>
															<span style="width:6px;"/>$
			                                 </span>
														<span style="float:right;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="UnallowedCreditAmt"/>
															</xsl:call-template>
														</span>
													</td>
												</tr>
											</xsl:for-each>
										</xsl:if>
										<xsl:if test="($Print = $Separated) and count($Form8810Data/CrPropForWhichElectIsMadeGrp) &gt; 1">
											<tr style="height:6mm;">
												<td class="styTableCell" style="width:8mm;font-weight:bold;text-align:left;border:0;vertical-align:bottom;">
			                                 11
			                              </td>
												<td class="styTableCell" style="width:179mm;text-align:left;vertical-align:bottom;border:0;">
													<span style="float:left;width:53mm;">
			                                    Name of passive activity disposed of <span style="width:4px;"/>
														<img src="{$ImagePath}/8810_Bullet_Md.gif" width="7" alt="bullet image"/>
													</span>
													<span style="border-bottom:1 solid black; width:121mm;float:right;">
														<xsl:call-template name="PopulateAdditionalDataTableMessage">
															<xsl:with-param name="TargetNode" select="$Form8810Data/CrPropForWhichElectIsMadeGrp/DisposedPassiveActivityNm"/>
														</xsl:call-template>
													</span>
												</td>
											</tr>
											<tr style="height:6mm;">
												<td class="styTableCell" style="width:8mm;font-weight:bold;text-align:left;border:0;vertical-align:bottom;">
			                                 12
			                              </td>
												<td class="styTableCell" style="width:179mm;text-align:left;vertical-align:bottom;border-bottom-width:0px;border-right-width:0px;">
													<span style="float:left;padding-top:0mm;width:97mm;">   
			                                    Description of the credit property for which the election is being made <span style="width:7px;"/>
														<img src="{$ImagePath}/8810_Bullet_Md.gif" width="7" alt="bullet image"/>
													</span>
													<span style="border-bottom:1 solid black; width:80mm;float:right;">
														<xsl:call-template name="PopulateAdditionalDataTableMessage">
															<xsl:with-param name="TargetNode" select="$Form8810Data/CrPropForWhichElectIsMadeGrp/PropertyDesc"/>
														</xsl:call-template>
													</span>
												</td>
											</tr>
											<tr style="height:6mm;">
												<td class="styTableCell" style="width:8mm;font-weight:bold;text-align:left;border:0;vertical-align:bottom;">
			                                 13
			                              </td>
												<td class="styTableCell" style="width:179mm;text-align:left;text-align:left;vertical-align:bottom;border:0;">
													<span style="float:left;">Amount of unallowed credit that reduced the property's basis <span style="width:3px;"/>
													</span>
													<span style="float:left;">
														<span class="styDotLn">
			                                       .............
			                                    </span>
														<img src="{$ImagePath}/8810_Bullet_Md.gif" width="7" alt="bullet image"/>
														<span style="width:6px;"/>$
			                                 </span>
													<xsl:call-template name="PopulateAdditionalDataTableMessage">
														<xsl:with-param name="TargetNode" select="$Form8810Data/CrPropForWhichElectIsMadeGrp/UnallowedCreditAmt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:if>
									</xsl:when>
									<xsl:otherwise>
										<tr style="height:6mm;">
											<td class="styTableCell" style="width:8mm;font-weight:bold;text-align:left;border:0;vertical-align:bottom;">
                                 11
                              </td>
											<td class="styTableCell" style="width:179mm;text-align:left;vertical-align:bottom;border:0;">
												<span style="float:left;width:53mm;">
                                    Name of passive activity disposed of <span style="width:4px;"/>
													<img src="{$ImagePath}/8810_Bullet_Md.gif" width="7" alt="bullet image"/>
												</span>
												<span style="border-bottom:1 solid black; width:121mm;float:right;"/>
											</td>
										</tr>
										<tr style="height:6mm;">
											<td class="styTableCell" style="width:8mm;font-weight:bold;text-align:left;border:0;vertical-align:bottom;">
                                 12
                              </td>
											<td class="styTableCell" style="width:179mm;text-align:left;vertical-align:bottom;border-bottom-width:0px;border-right-width:0px;">
												<span style="float:left;padding-top:0mm;width:97mm;">   
                                    Description of the credit property for which the election is being made <span style="width:7px;"/>
													<img src="{$ImagePath}/8810_Bullet_Md.gif" width="7" alt="bullet image"/>
												</span>
												<span style="border-bottom:1 solid black; width:80mm;float:right;">
													<span style="width:1px;"/>
												</span>
											</td>
										</tr>
										<tr style="height:5mm;">
											<td class="styTableCell" style="width:8mm;font-weight:bold;text-align:left;border:0;vertical-align:bottom;">
												13
											</td>
											<td class="styTableCell" style="width:179mm;text-align:left;text-align:left;vertical-align:bottom;border:0;">
												<span style="float:left;">Amount of unallowed credit that reduced the property's basis <span style="width:3px;"/>
												</span>
												<span style="float:left;">
													<span class="styDotLn">
													   .............
													</span>
													<img src="{$ImagePath}/8810_Bullet_Md.gif" width="7" alt="bullet image"/>
													<span style="width:6px;"/>$
													</span>
												<span style="float:right;"/>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form8810Data/CrPropForWhichElectIsMadeGrp"/>
						<xsl:with-param name="containerHeight" select="1"/>
						<xsl:with-param name="headerHeight" select="3"/>
						<xsl:with-param name="containerID" select=" 'DEctn' "/>
					</xsl:call-template>
					<div style="width:187mm;clear:both;padding-top:1mm;">
						<div style="width:90mm;font-weight:bold;" class="styGenericDiv">
							For Paperwork Reduction Act Notice, see separate instructions.
						</div>
						<div style="width:55mm;text-align:center;" class="styGenericDiv">
							Cat. No. 10356T
						</div>
						<div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">8810</span> (2015)</div>
					</div>
					<p style="page-break-before:always"/>
					<!-- Additonal Data Title Bar and Button -->
					<!-- Begininning of write-in data -->
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
							<xsl:with-param name="TargetNode" select="$Form8810Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- Separated Data for Lines 11, 12, and 13 -->
					<xsl:if test="($Print = $Separated) and count($Form8810Data/CrPropForWhichElectIsMadeGrp) &gt; 1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 8810 - Lines 11, 12, and 13:</span>
						<br/>
						<xsl:for-each select="$Form8810Data/CrPropForWhichElectIsMadeGrp">
							<table class="styDepTbl" style="font-size:7pt;">
								<thead class="styTableThead">
									<tr class="styDepTblHdr">
										<th class="styDepTblCell" colspan="2" style="width: 93mm; text-align: left; height:4mm; padding-top: 2.5mm"/>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<tr class="styDepTblRow1" style="height:6mm;">
										<td class="styTableCell" style="width:8mm;font-weight:bold;text-align:left;border:0;vertical-align:center;">
										   11
										</td>
										<td class="styTableCell" style="width:179mm;text-align:left;vertical-align:center;border:0;">
											<span style="float:left;width:53mm;">
												Name of passive activity disposed of <span style="width:4px;"/>
												<img src="{$ImagePath}/8810_Bullet_Md.gif" width="7" alt="bullet image"/>
											</span>
											<span style="border-bottom:1 solid black; width:121mm;float:right;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DisposedPassiveActivityNm"/>
												</xsl:call-template>
											</span>
										</td>
									</tr>
									<tr class="styDepTblRow2" style="height:6mm;">
										<td class="styTableCell" style="width:8mm;font-weight:bold;text-align:left;border:0;vertical-align:center;">
										   12
										</td>
										<td class="styTableCell" style="width:179mm;text-align:left;vertical-align:center;border-bottom-width:0px;border-right-width:0px;">
											<span style="float:left;padding-top:1.5mm;width:97mm;">   
												Description of the credit property for which the election is being made <span style="width:7px;"/>
												<img src="{$ImagePath}/8810_Bullet_Md.gif" width="7" alt="bullet image"/>
											</span>
											<span style="border-bottom:1 solid black; width:75mm;float:right;">
												<span style="width:1px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PropertyDesc"/>
												</xsl:call-template>
											</span>
										</td>
									</tr>
									<tr class="styDepTblRow1" style="height:6mm;">
										<td class="styTableCell" style="width:8mm;font-weight:bold;text-align:left;border:0;vertical-align:center;">
										   13
										</td>
										<td class="styTableCell" style="width:179mm;text-align:left;text-align:left;vertical-align:center;border:0;">
											<span style="float:left;">Amount of unallowed credit that reduced the property's basis <span style="width:3px;"/>
											</span>
											<span style="float:left;">
												<span class="styDotLn">
													.............
												</span>
												<img src="{$ImagePath}/8810_Bullet_Md.gif" width="7" alt="bullet image"/>
												<span style="width:6px;"/>$
											</span>
											<span style="float:right;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="UnallowedCreditAmt"/>
												</xsl:call-template>
											</span>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
						</xsl:for-each>
					</xsl:if>
					<!-- Separated Data for Lines 11, 12, and 13 -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
