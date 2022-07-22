<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XMLSpy v2011 sp1 (http://www.altova.com) by Daniel Ashton (IRS) --><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS4137Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form4137Data" select="$RtnDoc/IRS4137"/>
	<!-- tallest box on the form was beside 5 lines of text and was 21mm tall -->
	<xsl:variable name="lineHeight" select="21 div 5"/>
	<!-- estimate of 1px line height or width in mm is 0.22 -->
	<xsl:variable name="borderWidth" select="0.22"/>
	<xsl:variable name="pageWidth" select="187"/>
	<xsl:variable name="greyColor" select="'lightgrey'"/>
	<xsl:variable name="widths">
		<!-- lnbox = left number box, rnbox = right number box
         rcbox = right cents box, rbox = total width of right boxes
         rinbox = total width of inner-level right boxes (e.g. lines 13 or 14) -->
		<rec linetype="YesNo" lnbox="10" rnbox="7.5" rcbox="7.75" rbox="23." rinbox="0"/>
		<rec linetype="StdLn" lnbox="8" rnbox="7.75" rcbox="0" rbox="45.3" rinbox="39.4"/>
	</xsl:variable>
	<xsl:variable name="standardLine" select="'StdLn'"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form4137Data)"/>
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
				<meta name="Description" content="IRS Form 4137"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''"> 
						<xsl:call-template name="IRS4137Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if> 
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<form name="Form4137">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;border-bottom-width: 1.5px;">
						<div class="styFNBox" style="width:31mm;height:20mm;padding-bottom:0mm;position:relative;border-right-width: 1.5px">
              Form<span style="width:1mm;"/>
							<span class="styFormNumber">4137</span>
							<br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form4137Data"/>
							</xsl:call-template>
							<div class="styAgency" style="height:6mm;position:absolute;bottom:0;">
                Department of the Treasury<br/>
						    Internal Revenue Service (99)
              </div>
						</div>
						<div class="styFTBox" style="width:125mm;height:17mm;">
							<div class="styMainTitle" style="padding-bottom:0;margin-bottom:0">Social Security and Medicare Tax<br/>on Unreported Tip Income</div>
							<div class="styFBT" style="font-size:6.5pt;margin-top:0">
								<img src="{$ImagePath}/4137_Bullet.gif" alt="MediumBullet"/> Information about Form 4137 and its instructions is at 
								<a style="text-decoration:none;color:black;" href="http://www.irs.gov/form4137" title="Link to IRS.gov"><i>www.irs.gov/form4137</i>.</a><br/><br/>
								<img src="{$ImagePath}/4137_Bullet.gif" alt="MediumBullet"/> Attach to Form 1040, Form 1040NR, Form 1040NR-EZ, Form 1040-SS, or Form 1040-PR.
			  </div>
						</div>
						<div class="styTYBox" style="width:31mm; height:20mm;border-left-width: 1.5px;">
                            <div class="styOMB" style="height:4mm;width:31mm;font-size:7pt;">OMB No. 1545-0074</div>							
          	                    <div class="styTaxYear">20<span class="styTYColor">14</span>
   							</div>
							<div style="height:4mm;margin-left:3mm;text-align:left;font-size:7pt;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">24</span>
							</div>
						</div>
					</div>
					<!-- Name(s) shown on return -->
					<div style="width:187mm;border-bottom:1px solid black;border-bottom-width:1px;">
						<div class="styFNBox" style="width:149.5mm;height:8mm;padding-top:.5mm;">
              <span style="font-family:Arial;">Name of person who received tips. If married, complete a separate Form 4137 for each spouse with unreported tips.</span><br/>
							<div style="text-align:center;padding-top:1mm;">							
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form4137Data/PersonNm"/>
							</xsl:call-template>
							</div>
						  </div>
						<div class="styGenericDiv" style="line-height:100%;padding-top:.5mm;padding-left:1.5mm;">
							<b>Social security number</b>
							<br/>
							<div style="text-align:center;padding-top:2mm;">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$Form4137Data/SSN"/>
								</xsl:call-template>
							</div>
						  </div>
						  <!--+++++++++++++++++++ Table Toggle Button +++++++++++++++++++-->
						<!-- button display logic -->
						<div class="styGenericDiv" style="width:3.2mm;float:right;padding-top:4mm">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form4137Data/UnreportedTipIncomePerEmployer"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="containerID" select=" 'UnreportedTipIncomePerEmployer' "/>
							</xsl:call-template>
						</div>
						<!-- end button display logic -->
					</div>
					<!-- Line 1 -->
					<div style="width:187mm;">
						<div class="styTableContainer" id="UnreportedTipIncomePerEmployer" style="table-layout:fixed;width:187mm;height:100%;border-bottom-width:0px;">
							<xsl:call-template name="SetInitialState"/>
							<table class="styTable" cellspacing="0" style="width:187mm;font-size:7pt;border-collapse:collapse;border-left:none;border-right:none;text-align:center;overflow-x:auto;table-layout:fixed;">
								<thead style="vertical-align:center;">
									<tr>
										<th scope="col" style="vertical-align:top;font-weight:bold;border:1px solid black;border-right:none;border-left:none;border-top:none;width:5mm;text-align:left;padding-top:2mm;padding-left:5mm;">
								1
							</th>
										<th scope="col" style="font-weight:normal;border:1px solid black;border-left:none;border-top:none;width:69mm;text-align:center" align="center">
							<b>(a)</b> Name of employer to whom <br/>
								you were required to, but did not <br/>
								report all your tips (see instructions)
							</th>
										<th scope="col" style="font-weight:normal;border:1px solid black;border-left:none;border-top:none;width:27.5mm;text-align:center">
							<b>(b)</b> Employer
								identification number 
								(see instructions)
							</th>
										<th scope="col" style="font-weight:normal;border:1px solid black;border-left:none;border-top:none;width:42mm;text-align:center">
							<b>(c)</b> Total cash and charge <br/>
								tips you received (including <br/>
								unreported tips) (see instructions)
							</th>
										<th scope="col" style="font-weight:normal;border:1px solid black;border-right:none;border-top:none;width:42mm;text-align:center">
							<b>(d)</b> Total cash and charge <br/>
									tips you reported to your <br/>
									employer
							</th>
									</tr>
								</thead>
								<tbody style="overflow-x:scroll">
									<xsl:for-each select="$Form4137Data/UnreportedTipIncomePerEmployer">
										<xsl:if test="($Print != $Separated) or (count($Form4137Data/UnreportedTipIncomePerEmployer) &lt;=5)">
											<tr>
												<td style="vertical-align:bottom;font-weight:bold;border:1px solid black;border-left:none;border-bottom:none;">
													<xsl:number value="position()" format="A"/>
												</td>
												<td style="border:1px solid black;width:69mm;text-align:left;font-weight:normal;overflow:auto;overflow-x:auto;border-bottom:none;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="EmployerName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="EmployerName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</td>
												<td style="border:1px solid black;border-bottom:none;">
													<xsl:choose>
														<xsl:when test="EmployerEIN">
															<xsl:call-template name="PopulateEIN">
																<xsl:with-param name="TargetNode" select="EmployerEIN"/>
															</xsl:call-template>
														</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="AppliedForEINReasonCd"/>
														</xsl:call-template>
													</xsl:otherwise>
													</xsl:choose>
												</td>
												<td style="border:1px solid black;text-align:right;border-bottom:none;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TotalTipsReceivedAmt"/>
													</xsl:call-template>
												</td>
												<td style="border:1px solid black;border-right:none;text-align:right;border-bottom:none;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TotalTipsReportedAmt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
									<!-- Table Filler Rows -->
									<!-- JMI: added: or.... -->
									<xsl:if test="(count($Form4137Data/UnreportedTipIncomePerEmployer) &lt; 1 or ((count($Form4137Data/UnreportedTipIncomePerEmployer) &gt;5)) and ($Print = $Separated))">
										<tr>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td style="font-weight:bold;border:1px solid black;border-left:none;border-bottom:none;">
												<span style="width:4px;">A</span>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td style="border:1px solid black;border-bottom:none;">
												<span style="width:4px"/>
												<xsl:if test="((count($Form4137Data/UnreportedTipIncomePerEmployer) &gt;5) and ($Print = $Separated))">
													<xsl:call-template name="PopulateAdditionalDataTableMessage">
														<xsl:with-param name="TargetNode" select="$Form4137Data/UnreportedTipIncomePerEmployer"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td style="border:1px solid black;border-bottom:none;">
												<span style="width:4px"/>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td style="border:1px solid black;border-bottom:none;">
												<span style="width:4px"/>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td style="border:1px solid black;border-right:none;border-bottom:none;">
												<span style="width:4px"/>
											</td>
										</tr>
									</xsl:if>
									<!-- JMI: added: or.... -->
									<xsl:if test="count($Form4137Data/UnreportedTipIncomePerEmployer) &lt; 2 or ((count($Form4137Data/UnreportedTipIncomePerEmployer) &gt;5) and ($Print = $Separated))">
										<tr>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td style="font-weight:bold;border:1px solid black;border-left:none;border-bottom:none;">
												<span style="width:4px">B</span>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td style="border:1px solid black;border-bottom:none;">
												<span style="width:4px"/>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td style="border:1px solid black;border-bottom:none;">
												<span style="width:4px"/>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td style="border:1px solid black;border-bottom:none;">
												<span style="width:4px"/>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td style="border:1px solid black;border-right:none;border-bottom:none;">
												<span style="width:4px"/>
											</td>
										</tr>
									</xsl:if>
									<!-- JMI: added: or.... -->
									<xsl:if test="count($Form4137Data/UnreportedTipIncomePerEmployer) &lt; 3 or ((count($Form4137Data/UnreportedTipIncomePerEmployer) &gt;5) and ($Print = $Separated))">
										<tr>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td style="font-weight:bold;border:1px solid black;border-left:none;border-bottom:none;">
												<span style="width:4px">C</span>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td style="border:1px solid black;border-bottom:none;">
												<span style="width:4px"/>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td style="border:1px solid black;border-bottom:none;">
												<span style="width:4px"/>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td style="border:1px solid black;border-bottom:none;">
												<span style="width:4px"/>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td style="border:1px solid black;border-right:none;border-bottom:none;">
												<span style="width:4px"/>
											</td>
										</tr>
									</xsl:if>
									<!-- JMI: added: or.... -->
									<xsl:if test="count($Form4137Data/UnreportedTipIncomePerEmployer) &lt; 4 or ((count($Form4137Data/UnreportedTipIncomePerEmployer) &gt;5) and ($Print = $Separated))">
										<tr>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td style="font-weight:bold;border:1px solid black;border-left:none;border-bottom:none;">
												<span style="width:4px">D</span>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td style="border:1px solid black;border-bottom:none;">
												<span style="width:4px"/>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td style="border:1px solid black;border-bottom:none;">
												<span style="width:4px"/>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td style="border:1px solid black;border-bottom:none;">
												<span style="width:4px"/>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td style="border:1px solid black;border-right:none;border-bottom:none;">
												<span style="width:4px"/>
											</td>
										</tr>
									</xsl:if>
									<!-- JMI: added: or.... -->
									<xsl:if test="count($Form4137Data/UnreportedTipIncomePerEmployer) &lt; 5 or ((count($Form4137Data/UnreportedTipIncomePerEmployer) &gt;5) and ($Print = $Separated))">
										<tr>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td style="font-weight:bold;border:1px solid black;border-left:none;border-bottom:none;">
												<span style="width:4px">E</span>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td style="border:1px solid black;border-bottom:none;">
												<span style="width:4px"/>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td style="border:1px solid black;border-bottom:none;">
												<span style="width:4px"/>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td style="border:1px solid black;border-bottom:none;">
												<span style="width:4px"/>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td style="border:1px solid black;border-right:none;border-bottom:none;">
												<span style="width:4px"/>
											</td>
										</tr>
									</xsl:if>
									<!-- +++++++++++++++++++++++++++ End  Populating +++++++++++++++++++++++ -->
								</tbody>
							</table>
						</div>
						<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
						<!-- Set Initial Height of Above Table -->
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$Form4137Data/UnreportedTipIncomePerEmployer"/>
							<xsl:with-param name="containerHeight" select="5"/>
							<xsl:with-param name="containerID" select=" 'UnreportedTipIncomePerEmployer' "/>
						</xsl:call-template>
						<!-- End Set Initial Height of Above Table -->
					</div>
					<!-- Line 2 -->
					<div style="width:187mm;border:1.5px solid black;border-left:none;border-right:none;border-bottom:none;">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styIRS4137DescInd" style="height:auto;">
							<!--Total cash and charge tips you <b>received</b> in 2015. Add the amounts from<br/>-->
							Total cash and charge tips you <b>received</b> in 2014. Add the amounts from line 1, column (c)
							<span class="styIRS4137Dots">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br/>2</div>
						<div class="styLNAmountBox" style="width:34mm;height:auto;padding-right:2px;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form4137Data/TotalTipsReceivedAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:auto;background-color:lightgrey;"><br/><span style="width:0px"/></div>
						<div class="styIRS4137AmountBox" style="height:auto;background-color:lightgrey;"><br/><span style="width:0px"/></div>
					</div>
					<!-- Line 3 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styIRS4137Desc" style="height:auto;">
							Total cash and charge tips you <b>reported</b> to your employer(s) in 2014. Add the amounts from <br/>
							<span style="float:left;">line 1, column (d)</span>
							<span class="styIRS4137Dots">..........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br/>3</div>
						<div class="styIRS4137AmountBox" style="height:auto;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form4137Data/TotalTipsReportedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styIRS4137Desc" style="height:auto;">
							Subtract line 3 from line 2. This amount is income you <b>must</b> include in the total on Form 1040, <br/>
							<span style="float:left;">line 7; Form 1040NR, line 8; or Form 1040NR-EZ, line 3</span>
							<span class="styIRS4137Dots">..............</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br/>4</div>
						<div class="styIRS4137AmountBox" style="height:auto;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form4137Data/TotalTipsReceivedMinusRptAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styIRS4137Desc" style="height:auto;">
							Cash and charge tips you received but did not report to your employer because the total was <br/>
							<span style="float:left;">less than $20 in a calendar month (see instructions)</span>
							<span class="styIRS4137Dots">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br/>5</div>
						<div class="styIRS4137AmountBox" style="height:auto;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form4137Data/IncidentalCashAndTipsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD"><br/>6</div>
						<div class="styIRS4137Desc" style="height:auto;">
						   <br/>Unreported tips subject to Medicare tax. Subtract line 5 from line 4
							<span class="styIRS4137Dots">..........</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br/>6</div>
						<div class="styIRS4137AmountBox" style="height:auto;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form4137Data/NetUnreportedMinusIncdntlAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styIRS4137DescInd" style="height:auto;">
							Maximum amount of wages (including tips) subject to <br/>
							<span style="float:left;">social security tax</span>
							<span class="styIRS4137Dots">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.30mm;"><br/>7</div>
						<div class="styLNAmountBox" style="height:7.30mm;width:34mm;padding-right:2px;">
							<br/>
							117,000.00
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.30mm;background-color:lightgrey;"/>
						<div class="styIRS4137AmountBox" style="height:7.30mm;border-bottom:none;"/>
					</div>
					<!-- Line 8 -->					
					  <div style="width:187mm;height:10mm;">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styIRS4137DescInd" style="height:auto;">
							Total social security wages and social security tips (total of boxes<br/> 
							3 and 7 shown on your Form(s) W-2) and railroad retirement (RRTA)<br/> 
							compensation (subject to 6.2 percent rate), see instructions
							<span class="styIRS4137Dots">...</span>
						</div>
						<div class="styLNRightNumBox" style="height:10mm;padding-top:6mm">8</div>
						<div class="styLNAmountBox" style="height:10mm;width:34mm;padding-right:2px;padding-top:6mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form4137Data/SocialSecurityWagesAndTipsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:10mm;background-color:lightgrey;"/>
						<div class="styIRS4137AmountBox" style="height:10mm;border-bottom:none;"/>
					</div>
					<!-- Line 9 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styIRS4137Desc" style="height:auto;">
							Subtract line 8 from line 7. If line 8 is more than line 7, enter -0-
							<span class="styIRS4137Dots">...........</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;">9</div>
						<div class="styIRS4137AmountBox" style="height:auto;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form4137Data/NetWageSubjectToSocSecTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 10 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">10</div>
						<div class="styIRS4137Desc" style="height:7.5mm;">
							Unreported tips subject to social security tax. Enter the <b>smaller</b> of line 6 or line 9. If you <br/>
							<span style="float:left;">
								received tips as a federal, state, or local government employee, see instructions
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Government Employee Tip Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form4137Data/GovernmentEmployeeTipAmt/@governmentEmployeeTipCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Government Employee Tip Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form4137Data/GovernmentEmployeeTipAmt"/>
								</xsl:call-template>
							</span>
							<span class="styIRS4137Dots">....</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;"><br/>10</div>
						<div class="styIRS4137AmountBox" style="height:7.5mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form4137Data/UnreportedTipsSubjToSocSecAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 11 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">11</div>
						<div class="styIRS4137Desc" style="height:auto;">
							Multiply line 10 by .062 (social security tax rate)
							<span class="styIRS4137Dots">................</span>
						</div>
						<div class="styLNRightNumBox">11</div>
						<div class="styIRS4137AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form4137Data/SocialSecurityTaxTipAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 12 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">12</div>
						<div class="styIRS4137Desc" style="height:auto;">
							Multiply line 6 by .0145 (Medicare tax rate)
							<span class="styIRS4137Dots">..................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;">12</div>
						<div class="styIRS4137AmountBox" style="height:auto;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form4137Data/MedicareTaxTipsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 13 -->
					<div style="width:187mm;border-bottom:2px solid black;">
						<div class="styLNLeftNumBox">13</div>
						<div class="styIRS4137Desc" style="height:auto;">
							Add lines 11 and 12. Enter the result here and on Form 1040, line 58; Form 1040NR, line 56; or <br/>
							<span style="float:left;">Form 1040NR-EZ, line 16 (Form 1040-SS and 1040-PR filers, see instructions.)</span>
							<span class="styIRS4137Dots">......</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:auto;"><br/>13</div>
						<div class="styIRS4137AmountBox" style="height:auto;border-bottom:none;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form4137Data/SocSecMedicareTaxUnrptdTipAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Page Footer-->
					<div class="pageEnd" style="width:{$pageWidth}mm;padding-top:0mm;">
						<div style="float:left;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see your tax return instructions.</span>
						</div>
						<div style="float:right;width:80mm;text-align:right">
							Cat. No. 12626C
							<span style="width:29.5mm;"/>
							Form 
							<span class="styBoldText" style="font-size:8pt;">4137</span> (2014)
                           </div>
					</div>
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
							<xsl:with-param name="TargetNode" select="$Form4137Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 10 - Government Employee Tip Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form4137Data/GovernmentEmployeeTipAmt/@governmentEmployeeTipCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 10 - Government Employee Tip Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form4137Data/GovernmentEmployeeTipAmt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
					<!-- Separated Data for Line 1-->
					<xsl:if test="($Print = $Separated) and (count($Form4137Data/UnreportedTipIncomePerEmployer) &gt; 5)">
						<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
						<table class="styDepTbl" cellspacing="0">
							<!-- ++++++++++++++++++++++++ Start: Table Headers ++++++++++++++++++++++ -->
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th scope="col" style="font-weight:bold;border:1px solid black;border-right:none;border-left:none;width:5mm;text-align:left;padding-left:1mm;">
								1
							</th>
									<th scope="col" style="font-weight:normal;border:1px solid black;border-left:none;width:69mm;text-align:center;">
							(a) Name of employer to whom
								you were required to, but did not
								report all your tips (see instructions)
							</th>
									<th scope="col" style="font-weight:normal;border:1px solid black;border-left:none;width:24mm;">
							(b) Employer
								identification number
								(see instructions)
							</th>
									<th scope="col" style="font-weight:normal;border:1px solid black;border-left:none;width:42mm;">
							(c) Total cash and charge
								tips you received (including
								unreported tips) (see instructions)
							</th>
									<th scope="col" style="font-weight:normal;border:1px solid black;border-right:none;width:42mm;">
							(d) Total cash and charge
									tips you reported to your
									employer
							</th>
								</tr>
							</thead>
							<!-- ++++++++++++++++++++++++ End: Table Headers +++++++++++++++++++++++ -->
							<tfoot/>
							<tbody>
								<!-- ++++++++++++++++++++++++++ Start  Populating +++++++++++++++++++++++ -->
								<xsl:for-each select="$Form4137Data/UnreportedTipIncomePerEmployer">
									<tr>
										<td style="font-weight:bold;border:1px solid black;border-left:none;width:5mm;vertical-align:bottom;">
											<xsl:number value="position()" format="A"/>
										</td>
										<td style="border:1px solid black;text-align:left;width:69mm">
											<div style="width:69mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="EmployerName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="EmployerName/BusinessNameLine2Txt"/>
											</xsl:call-template>
											</div>
										</td>
										<td style="border:1px solid black;">
											<xsl:choose>
												<xsl:when test="EmployerEIN">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="EmployerEIN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="AppliedForEINReasonCd"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td style="border:1px solid black;text-align:right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalTipsReceivedAmt"/>
											</xsl:call-template>
										</td>
										<td style="border:1px solid black;border-right:none;text-align:right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalTipsReportedAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
								<!-- +++++++++++++++++++++++++++ End  Populating +++++++++++++++++++++++ -->
							</tbody>
						</table>
						<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
					</xsl:if>
				</form>
			</body>
		</html>
	</xsl:template>
	<!--

    FlattenAndPopulateUnreportedTips : Template to prep data values for the table

    -->
	<xsl:template name="FlattenAndPopulateUnreportedTips">
		<xsl:param name="UnreportedTipIncomePerEmployer"/>
		<xsl:for-each select="$UnreportedTipIncomePerEmployer">
			<row>
				<val align="left">
					<div style="position:relative;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="EmployerName/BusinessNameLine1Txt"/>
						</xsl:call-template>
						<xsl:if test="string-length(EmployerName/BusinessNameLine2Txt) &gt; 0">
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="EmployerName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</xsl:if>
					</div>
				</val>
				<val align="center">
					<xsl:choose>
						<xsl:when test="EmployerEIN">
							<xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="EmployerEIN"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="AppliedForEINReasonCd"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</val>
				<val>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="TotalTipsReceivedAmt"/>
					</xsl:call-template>
				</val>
				<val>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="TotalTipsReportedAmt"/>
					</xsl:call-template>
				</val>
			</row>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>