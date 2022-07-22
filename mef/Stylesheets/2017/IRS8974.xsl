<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8974Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="FormData" select="$RtnDoc/IRS8974"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
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
				<meta name="Description" content="IRS Form 8974"/>
				<xsl:call-template name="GlobalStylesForm"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8974Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
			</head>
			<body class="styBodyClass" style="width:187mm">
				<form name="IRS8974">
					<xsl:call-template name="DocumentHeader"/>
					<!-- BEGIN FORM HEADER -->
                    <div class="styBB" style="width:187mm;border-bottom-width:0px;">
					<br/>
					<div class="styFNBox" style="width:23mm;height:10mm;border:0px;">
						Form
						<span class="styFormNumber" style="font-size:15pt;">  
							8974:
						</span><br/>
						<div class="styFST" style="height:4mm;">
							<span class="styAgency" style="font-weight:normal">(Rev. December 2017)</span>
						</div>
					</div>
					<div class="styFTBox" style="width:132mm;text-align:left;height:10mm;">
						<div class="styMainTitle" style="font-size:10pt;padding-top:1mm;">
							Qualified Small Business Payroll Tax Credit for Increasing Research Activities
						</div>
						<div class="styFST" style="height:4mm;padding-top:1mm;">
							<span class="styAgency" style="font-weight:normal">Department of the Treasury — Internal Revenue Service</span>
						</div>
					</div>
				   <div class="styTYBox" style="width:32mm;height:10mm;border:0px;float:right;">
					  <div style="font-size:12pt;font-family:Courier New;font-weight:bold;text-align:right;padding-left:16mm;">950817</div>
					  <div class="styOMB" style="font-size:7pt;text-align:right;border:0px;padding-top:1mm;">OMB No. 1545-0029</div>
				   </div>
							<div class="styBB" style="width:128mm;height:48mm;float:left;border:black solid 1px;padding-top:2mm;padding-left:2mm;padding-right:2mm;">
							<div style="width:124mm;padding-top:0mm;">
								<span style="float:left;padding-top:2mm;"><b>Employer identification number</b> (EIN)</span>
								<span class="styLNCtrNumBox" style="width:72mm;border-top-width:1px;padding-top:1mm;float:right;height:6mm;">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$FormData/EIN"/>
                                    </xsl:call-template>
								</span>
							</div>
							<div style="width:124mm;height:16mm;padding-bottom:2mm;padding-top:2mm;">
								<span style="float:left;padding-top:4mm;"><b>Name</b><i> (not your trade name)</i></span>
								<span class="styLNCtrNumBox" style="width:86mm;border-top-width:1px;padding-left:1mm;float:right;text-align:left;height:auto;font-size:6pt;">
									<xsl:call-template name="PopulateText">
                                        <xsl:with-param name="TargetNode" select="$FormData/BusinessName/BusinessNameLine1Txt"/>
                                    </xsl:call-template><br/>
									<xsl:call-template name="PopulateText">
                                        <xsl:with-param name="TargetNode" select="$FormData/BusinessName/BusinessNameLine2Txt"/>
                                    </xsl:call-template>
								</span>
							</div>
							<!--2/1/2018 AM: Per Defects 125418, 125630, and 125884 (Mitchell Buyck instructions) modified the target node of the otherwise statements to make the choice an invalid element in order to have JAWS read the checkboxes correctly. -->
							<div style="width:124mm;height:16mm;">
								<span style="float:left;padding-top:2mm;font-weight:bold">The credit from Part 2, line 12, will be <br/> reported on (check only one box):</span>
								<span style="padding-top:1mm;padding-left:2mm">
									<xsl:choose>
										<xsl:when test="($RtnHdrData/ReturnTypeCd='941') or ($RtnHdrData/ReturnTypeCd='941SS')  or ($RtnHdrData/ReturnTypeCd='941PR')">
											<input type="checkbox" alt="CreditReportedOnForm941Or941PROr941SS" class="styCkbox" checked="checked">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/ReturnTypeCd"/>
													<xsl:with-param name="BackupName">8974CreditReportedOnForm941Or941PROr941SS</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/ReturnTypeCd"/>
													<xsl:with-param name="BackupName">8974CreditReportedOnForm941Or941PROr941SS</xsl:with-param>
												</xsl:call-template>
												<span style="width:1mm;"/><b>Form 941, 941-PR, or 941-SS </b>
											</label><br/>
										</xsl:when>
										<xsl:otherwise>
											<input alt="CreditReportedOnForm941Or941PROr941SS"  type="checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">8974CreditReportedOnForm941Or941PROr941SS</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">8974CreditReportedOnForm941Or941PROr941SS</xsl:with-param>
												</xsl:call-template>
												<span style="width:1mm;"/>
												<b>Form 941, 941-PR, or 941-SS </b>
											</label>
											<br/>
										</xsl:otherwise>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="($RtnHdrData/ReturnTypeCd='943') or ($RtnHdrData/ReturnTypeCd='943PR')">
											<input type="checkbox" alt="CreditReportedOnForm943Or943PR" class="styCkbox" checked="checked">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/ReturnTypeCd"/>
													<xsl:with-param name="BackupName">8974CreditReportedOnForm943Or943PR</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/ReturnTypeCd"/>
													<xsl:with-param name="BackupName">8974CreditReportedOnForm943Or943PR</xsl:with-param>
												</xsl:call-template>
												<span style="width:1mm;"/><b>Form 943 or 943-PR </b>
											</label><br/>
										</xsl:when>
										<xsl:otherwise>
											<input alt="CreditReportedOnForm943Or943PR"  type="checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">8974CreditReportedOnForm943Or943PR</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">Form 943 or 943-PR Checkbox</xsl:with-param>
												</xsl:call-template>
												<span style="width:1mm;"/>
												<b>Form 943 or 943-PR</b>
											</label>
											<br/>
										</xsl:otherwise>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="($RtnHdrData/ReturnTypeCd='944')">
											<input type="checkbox" alt="CreditReportedOnForm944Or944SP" class="styCkbox" checked="checked">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/ReturnTypeCd"/>
													<xsl:with-param name="BackupName">8974CreditReportedOnForm944Or944SP</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/ReturnTypeCd"/>
													<xsl:with-param name="BackupName">8974CreditReportedOnForm944Or944SP</xsl:with-param>
												</xsl:call-template>
												<span style="width:1mm;"/><b>Form 944 or 944(SP) </b>
											</label>
										</xsl:when>
										<xsl:otherwise>
											<input alt="CreditReportedOnForm944Or944SP"  type="checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">8974CreditReportedOnForm944Or944SP</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">8974CreditReportedOnForm944Or944SP</xsl:with-param>
												</xsl:call-template>
												<span style="width:1mm;"/>
												<b>Form 944 or 944(SP) </b>
											</label>
											<br/>
										</xsl:otherwise>
									</xsl:choose>									
								</span>
							</div>
							<div style="width:124mm;height:16mm;">
								<span class="styLNDesc" style="width:21mm;padding-top:2mm;padding-right:1mm;font-weight:bold;">Calendar year</span>
									<div class="styLNCtrNumBox" style="width:24mm;border-top-width:1px;height:5mm;text-align:center;padding-right:1mm;">
										<xsl:call-template name="PopulateYear">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/TaxYr"/>
										</xsl:call-template>										
									</div> 
									<span class="styLNDesc" style="width:79mm;padding-top:2mm;padding-left:1mm;font-size:6.5pt">You must select a quarter if you file Form 941, 941-PR, or 941-SS.</span>
							</div>
						</div>
						<div style="width:56mm;float:right;padding-right:2mm;">
							<div class="styBB" style="width:54mm;height:40mm;border-left-width:1px;border-right-width:1px;border-top-width:1px;padding-left:2mm;padding-top:2mm;">
								<div class="styPartName" style="width:49mm;height:5mm;text-align:left;padding-left:1mm;padding-top:0.4mm;padding-bottom:0.4mm;font-family:Arial Narrow;font-size:10pt;">Report for this quarter ...<br/></div>
								<xsl:variable name="Date">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
									</xsl:call-template>
								</xsl:variable>
								<div style="width:49mm;float:none;clear:both;">
									<div style="width:49mm;float:none;clear:both;">
										<div style="width:49mm;padding-top:1.6mm;float:none;clear:both;">Check only one box.<br/>
											<input type="checkbox" alt="FirstQuarter" class="styCkbox">
												<xsl:call-template name="PopulateEnumeratedCheckbox">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
													<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '03')"/>
													<xsl:with-param name="BackupName">IRS8974QuarterEndingDt[1]</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
													<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '03')"/>
													<xsl:with-param name="BackupName">IRS8974QuarterEndingDt[1]</xsl:with-param>
												</xsl:call-template>
												<b>1:</b> January, February, March 
											</label>
										</div>
										<div style="width:49mm;">
											<div style="float:left;clear:none;padding-top:2.6mm;">
												<input type="checkbox" alt="SecondQuarter" class="styCkbox">
													<xsl:call-template name="PopulateEnumeratedCheckbox">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
														<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '06')"/>
														<xsl:with-param name="BackupName">IRS8974QuarterEndingDt[2]</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
														<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '06')"/>
														<xsl:with-param name="BackupName">IRS8974QuarterEndingDt[2]</xsl:with-param>
													</xsl:call-template>
													<b>2:</b> April, May, June
												</label>
											</div>
										</div>
										<div style="width:49mm;">
											<div style="float:left;clear:none;padding-top:2.6mm;">
												<input type="checkbox" alt="ThirdQuarter" class="styCkbox">
													<xsl:call-template name="PopulateEnumeratedCheckbox">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
														<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '09')"/>
														<xsl:with-param name="BackupName">IRS8974QuarterEndingDt[3]</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
														<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '09')"/>
														<xsl:with-param name="BackupName">IRS8974QuarterEndingDt[3]</xsl:with-param>
													</xsl:call-template>
													<b>3:</b> July, August, September
												</label>
											</div>
										</div>
										<div style="width:49mm;">
											<div style="float:left;clear:none;padding-top:2.6mm;padding-bottom:1.6mm;">
												<input type="checkbox" alt="FourthQuarter" class="styCkbox">
													<xsl:call-template name="PopulateEnumeratedCheckbox">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
														<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '12')"/>
														<xsl:with-param name="BackupName">IRS8974QuarterEndingDt[4]</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
														<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '12')"/>
														<xsl:with-param name="BackupName">IRS8974QuarterEndingDt[4]</xsl:with-param>
													</xsl:call-template>
													<b>4:</b> October, November, December
												</label>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>						
				<div class="styLNDesc" style="width:187mm;"></div>	
				<div class="styBB" style="width:187mm;height:5mm;border-top-width:1px;">
					<div class="styPartName" style="width:13mm;text-align:center;height:4.5mm;padding-top:0mm;">Part 1:</div>
					<div class="styPartDesc" style="width:173.9mm;text-align:left;height:5mm;padding-top:.5mm;padding-left:2mm;">Tell us about your income tax return.</div>
				</div>				
				<div style="width:187mm;padding-left:0mm;padding-bottom:0px;">
					<!-- START OF PART 1 TABLE -->
					<div class="styTableContainer" id="USODctn" style="border-right:0px;border-bottom-width:0px">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" style="width:20mm;" scope="col">(a)<br/>
										<span class="styNormalText">Ending date <br/>of income tax period </span>
									</th>
									<th class="styTableCellHeader" style="width:20mm;" scope="col">(b)<br/>
										<span class="styNormalText">Income tax return filed<br/> that included Form 6765</span>
									</th>
									<th class="styTableCellHeader" style="width:20mm;" scope="col">(c)<br/>
										<span class="styNormalText">Date income tax return was filed</span>
									</th>
									<th class="styTableCellHeader" style="width:25mm;" scope="col">(d)<br/>
										<span class="styNormalText">EIN used on<br/> Form 6765</span>
									</th>
									<th class="styTableCellHeader" style="width:34mm;" scope="col">(e)<br/>
										<span class="styNormalText">Amount from Form 6765,<br/> line 44, or, if applicable, the amount that was allocated<br/> to your EIN </span>
									</th>
									<th class="styTableCellHeader" style="width:34mm;" scope="col">(f)<br/>
										<span class="styNormalText">Amount of credit<br/> from column (e) taken<br/> on a previous period(s) </span>
									</th>
									<th class="styTableCellHeader" style="width:34mm;border-right-width:0mm;" scope="col">(g)<br/>
										<span class="styNormalText">Remaining credit (subtract column (f) from column (e))</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$FormData/EmployerPayrollTaxElectionGrp">									
									<tr style="font-size: 7pt;">
										<td class="styTableCellCtr" style="width:23mm;text-align:center;padding-left:1mm;padding-top:2mm">
											<div class="styLNLeftNumBox" style="width:3mm;height:5mm;padding-top:0mm;padding-right:1mm;">
												<xsl:value-of select="position()"/>
											</div>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TaxYearEndDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="width:20mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ReturnTypeCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtr" style="width:20mm;text-align:center;padding-left:1.5mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ReturnFiledDt"/>
											</xsl:call-template>
										</td>									
										<td class="styTableCellText" style="width:22mm;text-align:center;">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="GroupMemberEIN"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtr" style="width:34mm;text-align:right;padding-right:.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PayrollTaxCreditAllocatedAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtr" style="width:34mm;text-align:right;padding-right:.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PriorPeriodPayrollTaxCreditAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtr" style="width:34mm;text-align:right;padding-right:.5mm;border-right-width:0mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="RemainingCreditAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
								<!-- Table Filler Rows -->
								<xsl:if test="count($FormData/EmployerPayrollTaxElectionGrp) &lt; 5">
									<xsl:call-template name="PrintBlankRows">
										<xsl:with-param name="numRows" select="5 - count($FormData/EmployerPayrollTaxElectionGrp)"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
						<!-- Row 6 of Table -->
						<div style="width:187mm;padding-bottom:.5mm;">
							<div class="styLNLeftNumBoxSD" style="width:3mm;padding-top:1mm;padding-left:2mm;">6</div>
							<div class="styLNDesc" style="width:150mm;padding-left:3mm;padding-top:1mm;">
								<span style="float:left;">Add lines 1(g) through 5(g) and enter total here </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.....................</span>
							</div>
							<span style="width:34mm;text-align:right;padding-top:1mm">									
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MaxAllwblPayrollTaxCreditAmt"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- END OF PART 1 TABLE -->
					<!--Part 2-->
					<div class="styBB" style="width:187mm;border-top-width:1px;">			
						<div class="styPartName" style="width:13mm;text-align:center;height:4mm;padding-top:0mm;">Part 2:</div>
						<div class="styPartDesc" style="width:173.9mm;text-align:left;height:4mm;padding-top:0mm;padding-left:2mm;">Determine the credit that you can use this period.</div>
					</div>
					<!--Line 7-->
					<div style="width:187mm;height:7mm;padding-top:1mm;">
						<span style="float:left;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:1mm;padding-left:4mm;">7</div>
							<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;">
								<span style="float:left;">Enter the amount from Part 1, line 6g </span>
								<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.....................</span>
							</div>
						</span>
						<span style="float:right;">
							<div class="styIRS8974RightNumBox">7</div>
							<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MaxAllwblPayrollTaxCreditAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					<!--Line 8-->
					<div style="width:187mm;height:9mm;">
						<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:1mm;padding-left:4mm;">8</div>
						<div class="styLNDesc" style="width:94mm;height:7mm;padding-left:1mm;padding-top:1mm;">Enter the amount from Form 941 (941-PR or 941-SS), line 5a, Column 2;
							<span style="float:left;">Form 943 (943-PR), line 3; or Form 944 (944(SP)), line 4a, Column 2 </span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-left:1mm;">.</span>
						</div>
						<span style="padding-top:3mm;">
							<div class="styIRS8974RightNumBox">8</div>
							<div class="styLNCtrNumBox" style="width:36mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityTaxAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					<!--Line 9-->
					<div style="width:187mm;height:9mm;">
						<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:1mm;padding-left:4mm;">9</div>
						<div class="styLNDesc" style="width:94mm;height:7mm;padding-left:1mm;padding-top:1mm;">Enter the amount from Form 941 (941-PR or 941-SS), line 5b, Column 2;
							<span style="float:left;"> or Form 944 (944(SP)), line 4b, Column 2 </span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-left:1mm;">.........</span>
						</div>
						<span style="padding-top:2mm;">
						<div class="styIRS8974RightNumBox">9</div>
						<div class="styLNCtrNumBox" style="width:36mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxOnSocialSecurityTipsAmt"/>
							</xsl:call-template>
						</div>
						</span>
					</div>
					<!--Line 10-->
					<div style="width:187mm;height:7mm;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:1mm;">10</div>
							<div class="styLNDesc" style="width:94mm;padding-left:1mm;padding-top:1mm;">
								<span style="float:left;">Add lines 8 and 9 </span>
								<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-left:1mm;">.................</span>
							</div>
							<div class="styIRS8974RightNumBox">10</div>
							<div class="styLNCtrNumBox" style="width:36mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSocialSecurityTaxTipAmt"/>
								</xsl:call-template>
							</div>
					</div>
					<!--Line 11-->
					<div style="width:187mm;height:14mm;">
						<span style="float:left;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:2mm;">11</div>
							<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;">Multiply line 10 by 50% (0.50). Check this box
								 <input type="checkbox" alt="ThirdPartySickPayCheckbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ThirdPartySickPayInd"/>
									<xsl:with-param name="BackupName">8974ThirdPartySickPayInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/ThirdPartySickPayInd"/>
									<xsl:with-param name="BackupName">8974ThirdPartySickPayInd</xsl:with-param>
								</xsl:call-template>
								<span style="width:1mm;"/>if you're a third-party payer of sick pay or check this box
							</label>
							<input type="checkbox" alt="ReceivedSection3121(q)Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Section3121qInd"/>
									<xsl:with-param name="BackupName">8974Section3121qInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/Section3121qInd"/>
									<xsl:with-param name="BackupName">8974Section3121qInd</xsl:with-param>
								</xsl:call-template>
								<span style="width:1mm;"/> if you received a Section 3121(q) Notice and Demand. See the instructions before completing line 
							</label>						
							<span style="float:left;">11. </span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">................................</span>
							</div>
						</span>
						<span style="float:right;padding-top:9mm;">
							<div class="styIRS8974RightNumBox">11</div>
							<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AdjSocialSecurityTaxTipAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					<!--Line 12-->
					<div class="styBB" style="width:187mm;height:9mm;padding-top:1mm;">
						<span style="float:left;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:1mm;">12</div>
							<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;"><b>Credit.</b> Enter the smaller of line 7 or line 11. Also enter this
							 amount on Form 941 (941-PR or
								<span style="float:left;">941-SS), line 11; Form 943 (943-PR), line 12; or  Form 944 (944(SP)), line 8 </span>
								<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
							</div>
						</span>
						<span style="float:right;padding-top:2mm;">
							<div class="styIRS8974RightNumBox">12</div>
							<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/PayrollTaxCreditAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>	
				</div>
				<!-- Page boundary -->
				<div class="pageEnd" style="width:187mm;border-top-width:1px;">
					<span style="float:left;clear:none;font-weight:bold;">For Paperwork Reduction Act Notice, see the separate instructions.</span>
					<span style="float:left;clear:none;margin-left:5mm;">IRS.gov/form8974</span>
					<span style="float:left;clear:none;margin-left:5mm;">Cat. No. 37797C</span>
					<span style="float:right;clear:none;">Form <span class="styBoldText" style="font-size:8pt;">8974</span> (12-2017)</span>
				</div>
				<p style="page-break-before: always"/>
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
					<xsl:with-param name="TargetNode" select="$FormData"/>
					<xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>
			</table>
		</form>
	</body>
</html>
</xsl:template>
<xsl:template name="PrintBlankRows">
		<xsl:param name="numRows" select="5 - count($FormData/EmployerPayrollTaxElectionGrp)"/>
		<xsl:if test="$numRows &gt; 0">
			<tr>
				<td class="styTableCellText" style="width:23mm;">
					<span style="width:4px"/>
				</td>
				<td class="styTableCellText" style="width:20mm;">
					<span style="width:4px"/>
				</td>
				<td class="styTableCellCtr" style="width:20mm;">
					<span style="width:4px"/>
				</td>
				<td class="styTableCellCtr" style="width:22mm;">
					<span style="width:4px"/>
				</td>
				<td class="styTableCellCtr" style="width:34mm;">
					<span style="width:4px"/>
				</td>
				<td class="styTableCellCtr" style="width:34mm;">
					<span style="width:4px"/>
				</td>
				<td class="styTableCellCtr" style="width:34mm;border-right-width:0mm;">
					<span style="width:4px"/>
				</td>
			</tr>
			<xsl:call-template name="PrintBlankRows">
				<xsl:with-param name="numRows" select="$numRows - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>