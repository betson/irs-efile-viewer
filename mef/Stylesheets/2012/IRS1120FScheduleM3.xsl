<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XMLSpy v2010 rel. 2 (http://www.altova.com) by Russell Winkler (IRS) -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1120FScheduleM3Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="FormData" select="$RtnDoc/IRS1120FScheduleM3"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)"/>
					</xsl:call-template>
				</title>
				<!--No Browser Caching-->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="Form IRS1120FScheduleM3"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!--HINT:This form does not have separated format -->
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1120FScheduleM3Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form1120FScheduleM3">
					<!-- BEGIN WARNING LINE -->
					<xsl:call-template name="DocumentHeader"/>
					<!-- END WARNING LINE -->
					<!--Begin Header-->
					<div class="styTBB" style="width:187mm;">
						<table cellspacing="0" cellpadding="0">
							<tbody>
								<tr>
									<!--Form Number-->
									<th rowspan="2" class="sty1120FSchM3FNBox" style="width:36mm" scope="col">
									  SCHEDULE M-3
									  <br/>
									  (Form 1120-F)
							<!--General Dependency Push Pin-->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData"/>
										</xsl:call-template>
										<div class="sty1120FSchM3Agency" style="padding-top:1.5mm">Department of the Treasury</div>
										<div class="sty1120FSchM3Agency">Internal Revenue Service</div>
									</th>
									<!--Form Name-->
									<th rowspan="2" class="sty1120FSchM3FTBox" style="width:119mm" scope="col">
										<div class="sty1120FSchM3MainTitle">
										 Net Income (Loss) Reconciliation for Foreign<br/>
										 Corporations With Reportable Assets of $10 Million or More
									   </div>
										<div class="styFST" style="padding-top:1mm">
											<img src="{$ImagePath}/1120FScheduleM3_Bullet.gif" alt="Bullet Image"/>
											Attach to Form 1120-F.
											<br/>
											<img src="{$ImagePath}/1120FScheduleM3_Bullet.gif" alt="Bullet Image"/>
											Information about Schedule M-3 (Form 1120-F) and its instructions is available at
											<br/>
											<a href="http://www.irs.gov/form1120f" title="Link to IRS.gov">
												<i>www.irs.gov/form1120f.</i>
											</a>
											<br/>
										</div>
									</th>
									<!--OMB/Tax Year-->
									<th class="sty1120FSchM3OMB" style="width:32mm" scope="col">
									 OMB No. 1545-0126
									</th>
								</tr>
								<tr>
									<td class="sty1120FSchM3TY">20<span class="styTYColor">12</span>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--End header-->
					<!--Begin Name/EIN-->
					<div style="width:187mm">
						<div class="styTableCell" style="width:135mm;float:left;height:10mm;text-align:left">
							Name of corporation
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styTableCell" style="width:52mm;border-right-width:0px;padding-left:2mm;float:left;height:10mm;text-align:left">
							<b>Employer identification number</b>
							<br/>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">EIN</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!--End Name/EIN-->
					<!--Begin Line A-D-->
					<div class="styBB" style="width:187mm">
						<!--Line A-->
						<div style="width:187mm;padding-top:3mm">
							<div class="styLNLeftNumBoxSD">A</div>
							<div class="sty1120FSchM3LNDesc">
								Has the corporation reported taxable income on Form 1120-F, page 3, using a treaty provision to attribute 
							    <span style="float:left;">business profits to a  U.S. permanent establishment under rules other than section 864(c)?</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;">.......</span>
							</div>
							<div class="sty1120FSchM3Pad4mm"/>
							<div class="sty1120FSchM3ChkBx">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/RptIncmUndRulesOthThanSect864c"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/RptIncmUndRulesOthThanSect864c"/>
											<xsl:with-param name="BackupName">IRS1120FSchM3RptIncmUndRulesOthThanSect864c</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/RptIncmUndRulesOthThanSect864c"/>
										<xsl:with-param name="BackupName">IRS1120FSchM3RptIncmUndRulesOthThanSect864c</xsl:with-param>
									</xsl:call-template>
									<span style="width:2mm"/>Yes
							   </label>
							</div>
							<div class="sty1120FSchM3ChkBx">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/RptIncmUndRulesOthThanSect864c"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/RptIncmUndRulesOthThanSect864c"/>
											<xsl:with-param name="BackupName">IRS1120FSchM3RptIncmUndRulesOthThanSect864c</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/RptIncmUndRulesOthThanSect864c"/>
										<xsl:with-param name="BackupName">IRS1120FSchM3RptIncmUndRulesOthThanSect864c</xsl:with-param>
									</xsl:call-template>
									<span style="width:2mm"/>No
							   </label>
							</div>
						</div>
						<!--Line B-->
						<div style="width:187mm;padding-top:3mm">
							<div class="styLNLeftNumBoxSD">B</div>
							<div class="sty1120FSchM3LNDesc">
							  Did the corporation prepare a non-consolidated, worldwide, certified audited income statement for the period
							   <span style="float:left;">(see instructions)?</span>
								<!-- Dotted Line -->
								<span class="styDotLn" style="float:right;">..............................</span>
							</div>
							<div class="sty1120FSchM3Pad4mm"/>
							<div class="sty1120FSchM3ChkBx">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCertAuditedIncomeStmt"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCertAuditedIncomeStmt"/>
											<xsl:with-param name="BackupName">IRS1120FSchM3NonCnsldtCertAuditedIncomeStmt</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCertAuditedIncomeStmt"/>
										<xsl:with-param name="BackupName">IRS1120FSchM3NonCnsldtCertAuditedIncomeStmt</xsl:with-param>
									</xsl:call-template>
									<span style="width:2mm"/>Yes
							    </label>
							</div>
							<div class="sty1120FSchM3ChkBx">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCertAuditedIncomeStmt"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCertAuditedIncomeStmt"/>
											<xsl:with-param name="BackupName">IRS1120FSchM3NonCnsldtCertAuditedIncomeStmt</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCertAuditedIncomeStmt"/>
										<xsl:with-param name="BackupName">IRS1120FSchM3NonCnsldtCertAuditedIncomeStmt</xsl:with-param>
									</xsl:call-template>
									<span style="width:2mm"/>No
							    </label>
							</div>
						</div>
						<!--Line C-->
						<div style="width:187mm;padding-top:3mm">
							<div class="styLNLeftNumBoxSD">C</div>
							<div class="sty1120FSchM3LNDesc">
							Did the corporation prepare a non-consolidated, worldwide income statement for the period (see instructions)?
							</div>
							<div class="sty1120FSchM3Pad4mm"/>
							<div class="sty1120FSchM3ChkBx" style="padding-top:0">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtWorldwideIncomeStmt"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtWorldwideIncomeStmt"/>
											<xsl:with-param name="BackupName">IRS1120FSchM3NonCnsldtWorldwideIncomeStmt</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtWorldwideIncomeStmt"/>
										<xsl:with-param name="BackupName">IRS1120FSchM3NonCnsldtWorldwideIncomeStmt</xsl:with-param>
									</xsl:call-template>
									<span style="width:2mm"/>Yes
							    </label>
							</div>
							<div class="sty1120FSchM3ChkBx" style="padding-top:0">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtWorldwideIncomeStmt"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtWorldwideIncomeStmt"/>
											<xsl:with-param name="BackupName">IRS1120FSchM3NonCnsldtWorldwideIncomeStmt</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtWorldwideIncomeStmt"/>
										<xsl:with-param name="BackupName">IRS1120FSchM3NonCnsldtWorldwideIncomeStmt</xsl:with-param>
									</xsl:call-template>
									<span style="width:2mm"/>No
							    </label>
							</div>
						</div>
						<!--Line D-->
						<div style="width:187mm;padding-top:3mm;padding-bottom:3mm">
							<div class="styLNLeftNumBoxSD">D</div>
							<div class="sty1120FSchM3LNDesc">
							   Did the corporation prepare certified audited income statement(s) for the set(s) of books reported on
							    <span style="float:left;">Form 1120-F, Schedule L?</span>
								<!-- Dotted Line -->
								<span class="styDotLn" style="float:right;">...........................</span>
							</div>
							<div class="sty1120FSchM3Pad4mm"/>
							<div class="sty1120FSchM3ChkBx">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/CertAudIncomeStmtBooksRptSchL"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CertAudIncomeStmtBooksRptSchL"/>
											<xsl:with-param name="BackupName">IRS1120FSchM3CertAudIncomeStmtBooksRptSchL</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/CertAudIncomeStmtBooksRptSchL"/>
										<xsl:with-param name="BackupName">IRS1120FSchM3CertAudIncomeStmtBooksRptSchL</xsl:with-param>
									</xsl:call-template>
									<span style="width:2mm"/>Yes
							    </label>
							</div>
							<div class="sty1120FSchM3ChkBx">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/CertAudIncomeStmtBooksRptSchL"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CertAudIncomeStmtBooksRptSchL"/>
											<xsl:with-param name="BackupName">IRS1120FSchM3CertAudIncomeStmtBooksRptSchL</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/CertAudIncomeStmtBooksRptSchL"/>
										<xsl:with-param name="BackupName">IRS1120FSchM3CertAudIncomeStmtBooksRptSchL</xsl:with-param>
									</xsl:call-template>
									<span style="width:2mm"/>No
							   </label>
							</div>
						</div>
					</div>
					<!--End Line A-D-->
					<!--Begin Part 1-->
					<!--Part 1 Header-->
					<div class="styBB" style="width:187mm">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">
						 Financial Information and Net Income (Loss) Reconciliation <span style="font-weight:normal">(see instructions)</span>
						</div>
					</div>
					<!--Begin Lines 1-11-->
					<div class="styTBB" style="width:187mm">
						<!--Line 1-->
						<div style="width:187mm;padding-top:3mm">
							<div class="styLNLeftNumBoxSD" style="height:40mm">1</div>
							<div class="sty1120FSchM3LNDescLong">Is the corporation a foreign bank as defined in Regulations section 1.882-5(c)(4)?</div>
							<div class="sty1120FSchM3LNDescLong">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignBankDefinedSect18825c4"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignBankDefinedSect18825c4"/>
											<xsl:with-param name="BackupName">IRS1120FSchM3ForeignBankDefinedSect18825c4</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignBankDefinedSect18825c4"/>
										<xsl:with-param name="BackupName">IRS1120FSchM3ForeignBankDefinedSect18825c4</xsl:with-param>
									</xsl:call-template>
									<span style="width:2mm"/>
									<b>Yes. </b>
								</label>
							    Complete the remainder of Part I as follows:
							</div>
							<div class="sty1120FSchM3LNDescLong">
								<span style="width:4.7mm"/>If D is “Yes,” use the income statement described in D to complete lines 2 through 5 and 7 through 11.
							</div>
							<div class="sty1120FSchM3LNDescLong">
								<span style="width:4.7mm"/>
								If D is “No,” use the income statement(s) for the set(s) of books reported on Form 1120-F, Schedule L to complete lines 2 through 
							</div>
							<div class="sty1120FSchM3LNDescLong">
								<span style="width:4.7mm"/> 5 and 7 through 11.
							</div>
							<div class="sty1120FSchM3LNDescLong">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignBankDefinedSect18825c4"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignBankDefinedSect18825c4"/>
											<xsl:with-param name="BackupName">IRS1120FSchM3ForeignBankDefinedSect18825c4</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignBankDefinedSect18825c4"/>
										<xsl:with-param name="BackupName">IRS1120FSchM3ForeignBankDefinedSect18825c4</xsl:with-param>
									</xsl:call-template>
									<span style="width:2mm"/>
									<b>No. </b>
								</label>
							    Complete the remainder of Part I as follows:
							</div>
							<div class="sty1120FSchM3LNDescLong">
								<span style="width:4.7mm"/>If B is “Yes,” use the income statement described in B to complete lines 2 through 11.
							</div>
							<div class="sty1120FSchM3LNDescLong">
								<span style="width:4.7mm"/>If B is “No” and C is “Yes,” use the income statement described in C to complete lines 2 through 11.
							</div>
							<div class="sty1120FSchM3LNDescLong">
								<span style="width:4.7mm"/>If B and C are “No” and D is “Yes,” use the income statement described in D to complete lines 2 through 11.
							</div>
							<div class="sty1120FSchM3LNDescLong">
								<span style="width:4.7mm"/>If B, C, and D are “No,” use the income statement described in the instructions to complete lines 2 through 11.
							</div>
						</div>
						<!--Line 2-->
						<!--Line 2a-->
						<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="padding-top:1.5mm">2a</div>
						<div class="sty1120FSchM3LNDescLong">
							Enter the income statement period: Beginning <span> </span>
							<span class="sty1120FSchM3UnderlinedDate">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/IncomeStatementBegngDate"/>
								</xsl:call-template>
							</span>
							<span> Ending </span>
							<span class="sty1120FSchM3UnderlinedDate">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/IncomeStatementEndDate"/>
								</xsl:call-template>
							</span>
						</div>
						</div>
						<!--Line 2b-->
						<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4mm;height:12mm">b</div>
						<div class="sty1120FSchM3LNDescLong">
						 Has the corporation’s income statement been restated for the income statement period entered on line 2a?
					    </div>
						<div class="sty1120FSchM3LNDescLong">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/CorpIncomeStatementRestated"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CorpIncomeStatementRestated"/>
										<xsl:with-param name="BackupName">IRS1120FSchM3CorpIncomeStatementRestated</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$FormData/CorpIncomeStatementRestated"/>
									<xsl:with-param name="BackupName">IRS1120FSchM3CorpIncomeStatementRestated</xsl:with-param>
								</xsl:call-template>
								<span style="width:2mm"/>
								<b>Yes. </b>
							</label>
						     Attach an explanation and the amount of each item restated.
							    <xsl:if test="$FormData/CorpIncomeStatementRestated">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/CorpIncomeStatementRestated"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="sty1120FSchM3LNDescLong">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/CorpIncomeStatementRestated"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CorpIncomeStatementRestated"/>
										<xsl:with-param name="BackupName">IRS1120FSchM3CorpIncomeStatementRestated</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$FormData/CorpIncomeStatementRestated"/>
									<xsl:with-param name="BackupName">IRS1120FSchM3CorpIncomeStatementRestated</xsl:with-param>
								</xsl:call-template>
								<span style="width:2mm"/>
								<b>No. </b>
							</label>
						</div>
						</div>
						<!--Line 2c-->
						<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4mm;height:16mm">c</div>
						<div class="sty1120FSchM3LNDescLong">
					     Has the corporation’s income statement been restated for any of the 5 income statement periods preceding the period on line 2a?
						</div>
						<div class="sty1120FSchM3LNDescLong">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/CorpIncmStmtRestated5Preceding"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CorpIncmStmtRestated5Preceding"/>
										<xsl:with-param name="BackupName">IRS1120FSchM3CorpIncmStmtRestated5Preceding</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$FormData/CorpIncmStmtRestated5Preceding"/>
									<xsl:with-param name="BackupName">IRS1120FSchM3CorpIncmStmtRestated5Preceding</xsl:with-param>
								</xsl:call-template>
								<span style="width:2mm"/>
								<b>Yes. </b>
							</label>
							 Attach an explanation and the amount of each item restated.
								<xsl:if test="$FormData/CorpIncmStmtRestated5Preceding">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/CorpIncmStmtRestated5Preceding"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="sty1120FSchM3LNDescLong">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/CorpIncmStmtRestated5Preceding"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CorpIncmStmtRestated5Preceding"/>
										<xsl:with-param name="BackupName">IRS1120FSchM3CorpIncmStmtRestated5Preceding</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$FormData/CorpIncmStmtRestated5Preceding"/>
									<xsl:with-param name="BackupName">IRS1120FSchM3CorpIncmStmtRestated5Preceding</xsl:with-param>
								</xsl:call-template>
								<span style="width:2mm"/>
								<b>No. </b>
							</label>
						</div>
						</div>
						<!--Line 3-->
						<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style=";height:16mm">3</div>
						<div class="sty1120FSchM3LNDescLong">
							Is any of the corporation’s stock publicly traded on any exchange, U.S. or foreign?
						</div>
						<div class="sty1120FSchM3LNDescLong">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/CorporationStockPubliclyTraded"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CorporationStockPubliclyTraded"/>
										<xsl:with-param name="BackupName">IRS1120FSchM3CorporationStockPubliclyTraded</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$FormData/CorporationStockPubliclyTraded"/>
									<xsl:with-param name="BackupName">IRS1120FSchM3CorporationStockPubliclyTraded</xsl:with-param>
								</xsl:call-template>
								<span style="width:2mm"/>
								<b>Yes. </b>
							</label>
							 List exchange(s) and symbol
							<span style="width:2mm"/>
							<img src="{$ImagePath}/1120FScheduleM3_Bullet.gif" alt="Bullet Image"/>
							<span style="width:2mm"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/CorporationStockPubliclyTraded"/>
							</xsl:call-template>
							<span class="sty1120FSchM3UText" style="width:36mm">
								<span style="width:1px"/>
							</span>
						</div>
						<div class="sty1120FSchM3LNDescLong">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/CorporationStockPubliclyTraded"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CorporationStockPubliclyTraded"/>
										<xsl:with-param name="BackupName">IRS1120FSchM3CorporationStockPubliclyTraded</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$FormData/CorporationStockPubliclyTraded"/>
									<xsl:with-param name="BackupName">IRS1120FSchM3CorporationStockPubliclyTraded</xsl:with-param>
								</xsl:call-template>
								<span style="width:2mm"/>
								<b>No. </b>
							</label>
						</div>
						</div>
						<!--Line 4-->
						<div style="width:187mm;height:4.4mm">
							<div class="sty1120FSchM3LN411LeftNumBoxSD" style="height:8mm;">4</div>
							<div class="sty1120FSchM3LN411Desc" style="height:8mm">
							Non-consolidated foreign corporation net income (loss) in U.S. dollars from the income statement
							<span style="float:left;">source identified in line 1</span>
								<div class="sty1120FSchM3RightFloat">
									<span style="width:0.5mm;"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/IncomeLossFromIncomeStat"/>
									</xsl:call-template>
								</div>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>
							</div>
							<div class="sty1120FSchM3LN411RightNumBox" style="height:8mm;border-top-width:1px">
								<br/>4</div>
							<div class="sty1120FSchM3LN411AmountBox" style="height:8mm;border-top-width:1px">
								<br/>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IncomeLossFromIncomeStat"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 5-->
						<!--Line 5a-->
						<div style="width:187mm;height:4.4mm">
							<div class="sty1120FSchM3LN411LeftNumBoxSD" style="height:4.4mm">5a</div>
							<div class="sty1120FSchM3LN411Desc" style="height:4.4mm">
								<span style="float:left;">Net income from includible disregarded foreign entities not included on line 4(attach statement)</span>
								<div class="sty1120FSchM3RightFloat">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/NetIncomeDisregardedForeignEnt"/>
									</xsl:call-template>
								</div>
							</div>
							<div class="sty1120FSchM3LN411RightNumBox" style="height:4.4mm">5a</div>
							<div class="sty1120FSchM3LN411AmountBox" style="height:4.4mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetIncomeDisregardedForeignEnt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 5b-->
						<div style="width:187mm;height:4.4mm">
							<div class="sty1120FSchM3LN411LeftNumBoxSD" style="padding-left:4mm">b</div>
							<div class="sty1120FSchM3LN411Desc">
								<span style="float:left;">Net loss from includible disregarded foreign entities not included on line 4 (attach statement)</span>
								<div class="sty1120FSchM3RightFloat">
									<span style="width:0.5mm"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/NetLossDisregardedForeignEnt"/>
									</xsl:call-template>
								</div>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
							</div>
							<div class="sty1120FSchM3LN411RightNumBox">5b</div>
							<div class="sty1120FSchM3LN411AmountBox">
								(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetLossDisregardedForeignEnt"/>
								</xsl:call-template>)
						    </div>
						</div>
						<!--Line 5c-->
						<div style="width:187mm;height:4.4mm">
							<div class="sty1120FSchM3LN411LeftNumBoxSD" style="padding-left:4mm">c</div>
							<div class="sty1120FSchM3LN411Desc">
								<span style="float:left;">Net income from includible disregarded U.S. entities not included on line 4 (attach statement)</span>
								<div class="sty1120FSchM3RightFloat">
									<span style="width:0.5mm"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/NetIncomeDisregardedUSEnt"/>
									</xsl:call-template>
								</div>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
							</div>
							<div class="sty1120FSchM3LN411RightNumBox">5c</div>
							<div class="sty1120FSchM3LN411AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetIncomeDisregardedUSEnt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 5d-->
						<div style="width:187mm;height:4.4mm">
							<div class="sty1120FSchM3LN411LeftNumBoxSD" style="padding-left:4mm">d</div>
							<div class="sty1120FSchM3LN411Desc">
								<span style="float:left;">Net loss from includible disregarded U.S. entities not included on line 4 (attach statement)</span>
								<div class="sty1120FSchM3RightFloat">
									<span style="width:0.5mm"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/NetLossDisregardedUSEnt"/>
									</xsl:call-template>
								</div>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
							</div>
							<div class="sty1120FSchM3LN411RightNumBox">5d</div>
							<div class="sty1120FSchM3LN411AmountBox">
								(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetLossDisregardedUSEnt"/>
								</xsl:call-template>)
						    </div>
						</div>
						<!--Line 6-->
						<div style="width:187mm;height:4.4mm">
							<div class="sty1120FSchM3LN411LeftNumBoxSD">6</div>
							<div class="sty1120FSchM3LN411Desc">
								<span style="float:left;">Net income (loss) from foreign locations not included on line 4 (attach statement)</span>
								<div class="sty1120FSchM3RightFloat">
									<span style="width:0.5mm"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/NetIncomeLossFromForeignLoc"/>
									</xsl:call-template>
								</div>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
							</div>
							<div class="sty1120FSchM3LN411RightNumBox">6</div>
							<div class="sty1120FSchM3LN411AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetIncomeLossFromForeignLoc"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 7-->
						<!--Line 7a-->
						<div style="width:187mm;height:4.4mm">
							<div class="sty1120FSchM3LN411LeftNumBoxSD">7a</div>
							<div class="sty1120FSchM3LN411Desc">
								<span style="float:left;">Net income of non-includible entities (attach statement)</span>
								<div class="sty1120FSchM3RightFloat">
									<span style="width:0.5mm"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/NetIncomeOfNonIncludibleEnt"/>
									</xsl:call-template>
								</div>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
							</div>
							<div class="sty1120FSchM3LN411RightNumBox">7a</div>
							<div class="sty1120FSchM3LN411AmountBox">
								(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetIncomeOfNonIncludibleEnt"/>
								</xsl:call-template>)
							</div>
						</div>
						<!--Line 7b-->
						<div style="width:187mm;height:4.4mm">
							<div class="sty1120FSchM3LN411LeftNumBoxSD" style="padding-left:4mm">b</div>
							<div class="sty1120FSchM3LN411Desc">
								<span style="float:left;">Net loss of non-includible entities (attach statement)</span>
								<div class="sty1120FSchM3RightFloat">
									<span style="width:0.5mm"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/NetLossOfNonIncludibleEnt"/>
									</xsl:call-template>
								</div>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
							</div>
							<div class="sty1120FSchM3LN411RightNumBox">7b</div>
							<div class="sty1120FSchM3LN411AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetLossOfNonIncludibleEnt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 8-->
						<div style="width:187mm;height:4.4mm">
							<div class="sty1120FSchM3LN411LeftNumBoxSD">8</div>
							<div class="sty1120FSchM3LN411Desc">
								<span style="float:left;">Adjustments to intercompany transactions (attach statement)</span>
								<div class="sty1120FSchM3RightFloat">
									<span style="width:0.5mm"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AdjToIntercompanyTransactions"/>
									</xsl:call-template>
								</div>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
							</div>
							<div class="sty1120FSchM3LN411RightNumBox">8</div>
							<div class="sty1120FSchM3LN411AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AdjToIntercompanyTransactions"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 9-->
						<div style="width:187mm;height:4.4mm">
							<div class="sty1120FSchM3LN411LeftNumBoxSD">9</div>
							<div class="sty1120FSchM3LN411Desc">
								<span style="float:left;">Adjustments to reconcile income statement period to tax year (attach statement) </span>
								<div class="sty1120FSchM3RightFloat">
									<span style="width:0.5mm"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AdjustmentsToReconcileIncome"/>
									</xsl:call-template>
								</div>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
							</div>
							<div class="sty1120FSchM3LN411RightNumBox">9</div>
							<div class="sty1120FSchM3LN411AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AdjustmentsToReconcileIncome"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 10-->
						<div style="width:187mm;height:4.4mm">
							<div class="sty1120FSchM3LN411LeftNumBoxSD" style="padding-left:0.8mm">10</div>
							<div class="sty1120FSchM3LN411Desc">
								<span style="float:left;">Other adjustments to reconcile to amount on line 11 (attach statement) </span>
								<div class="sty1120FSchM3RightFloat">
									<!--<span class="sty1120FSchM3DotLn">........</span>-->
									<span style="width:0.5mm"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/OtherAdjustmentsToReconcile"/>
									</xsl:call-template>
								</div>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
							</div>
							<div class="sty1120FSchM3LN411RightNumBox">10</div>
							<div class="sty1120FSchM3LN411AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherAdjustmentsToReconcile"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 11-->
						<div style="width:187mm;height:4.4mm">
							<div class="sty1120FSchM3LN411LeftNumBoxSD" style="height:8mm;padding-left:0.8mm">11</div>
							<div class="sty1120FSchM3LN411Desc" style="height:8mm">
								<b>Adjusted financial net income (loss) of non-consolidated foreign corporation.</b> Combine lines 4
							<span style="float:left;">through 10</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">............................</span>
							</div>
							<div class="sty1120FSchM3LN411RightNumBox" style="height:8mm;border-bottom-width:0">
								<br/>11</div>
							<div class="sty1120FSchM3LN411AmountBox" style="height:8mm;border-bottom-width:0">
								<br/>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AdjustedFinancialNetIncomeLoss"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--End Lines 1-11-->
					<!--Begin Page 1 Footer-->
					<div style="width:187mm;clear:both;padding-top:0.5mm">
						<div style="width:108mm;" class="styGenericDiv">
							<b>For Paperwork Reduction Act Notice, see the Instructions for<br/>Form 1120-F.</b>
						</div>
						<div style="width:30mm;text-align:center;padding-left:2mm" class="styGenericDiv">Cat. No. 39667H</div>
						<div style="float:right;" class="styGenericDiv">
							<b>Schedule M-3 (Form 1120-F) 2012</b>
						</div>
					</div>
					<br/>
					<div class="pageEnd"/>
					<!-- End Page 1 Footer-->
					<!--BEGIN PAGE 2-->
					<!--Page 2 Header-->
					<div class="styTBB" style="width:187mm">
						<div style="float:right;clear:none">
					Page <span style="font-size:8pt;font-weight:bold">2</span>
						</div>
						<div>Schedule M-3 (Form 1120-F) 2012</div>
					</div>
					<!--Begin Name/EIN-->
					<div style="width:187mm">
						<div class="styTableCell" style="width:135mm;float:left;height:10mm;text-align:left">
						 Name of corporation
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styTableCell" style="width:52mm;border-right-width:0px;padding-left:2mm;float:left;height:10mm;text-align:left">
							<b>Employer identification number</b>
							<br/>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">EIN</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!--End Name/EIN-->
					<!--BEGIN PART II-->
					<!--Part II Header-->
					<div class="styTBB" style="width:187mm">
						<div class="styPartName" style="height:4mm">Part II</div>
						<div class="styPartDesc" style="height:7mm;font-size:7.5pt">
					Reconciliation of Net Income (Loss) per Income Statement of Non-Consolidated Foreign Corporations With<br/>
					Taxable Income per Return <span style="font-weight:normal">(see instructions)</span>
						</div>
					</div>
					<!--BEGIN Part II Table-->
					<div class="styTBB" style="width:187mm">
						<!--Part II Table Header-->
						<table cellpadding="0" cellspacing="0" style="width:187mm">
							<tbody>
								<tr>
									<th class="sty1120FSchM3TableCellNum" scope="col">
										<span style="width:8mm"/>
									</th>
									<th class="sty1120FSchM3TableCellText" style="font-weight:bold;font-size:8pt" scope="col">Income (Loss) Items</th>
									<th class="sty1120FSchM3TableCellAmount" style="text-align:center" scope="col">
										<b>(a)</b>
										<br/>Income (Loss) per<br/>Income Statement<br/>
									</th>
									<th class="sty1120FSchM3TableCellAmount" style="text-align:center" scope="col">
										<b>(b)</b>
										<br/>Temporary<br/>Differences</th>
									<th class="sty1120FSchM3TableCellAmount" style="text-align:center" scope="col">
										<b>(c)</b>
										<br/>Permanent<br/>Differences</th>
									<th class="sty1120FSchM3TableCellAmount" style="text-align:center" scope="col">
										<b>(d)</b>
										<br/>Other Permanent<br/>Differences<br/>for Allocations to<br/>Non-ECI and ECI</th>
									<th class="sty1120FSchM3TableCellAmountLastCol" style="text-align:center" scope="col">
										<b>(e)</b>
										<br/>Income (Loss)<br/>per Tax Return</th>
								</tr>
								<!--Line 1-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="padding-left:1mm">1</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<div class="sty1120FSchM3RightFloat">
									    </div>
										<span style="float:left;">Gross receipts</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GrossReceipts/IncomeOrLossPerIncomeStmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GrossReceipts/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GrossReceipts/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GrossReceipts/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GrossReceipts/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 2-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="padding-left:1mm">2</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										Cost of goods sold (attach
										<span style="float:left;"> statements)
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/CostOfGoodsSold"/>
											</xsl:call-template>
										</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CostOfGoodsSold/IncomeOrLossPerIncomeStmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CostOfGoodsSold/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CostOfGoodsSold/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CostOfGoodsSold/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CostOfGoodsSold/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 3a-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="padding-left:1mm">3a</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<div class="sty1120FSchM3RightFloat">
									    </div>
										<span style="float:left;">Dividends from foreign entities</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DividendsFromForeignEntities/IncomeOrLossPerIncomeStmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DividendsFromForeignEntities/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DividendsFromForeignEntities/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DividendsFromForeignEntities/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DividendsFromForeignEntities/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 3b-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="padding-left:3mm">b</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<div class="sty1120FSchM3RightFloat">
									    </div>
										<span style="float:left;">Dividends from U.S. entities</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DividendsFromUSEntities/IncomeOrLossPerIncomeStmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DividendsFromUSEntities/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DividendsFromUSEntities/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DividendsFromUSEntities/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DividendsFromUSEntities/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 3c-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="padding-left:3mm;padding-bottom:0.5mm">c</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">Dividend equivalent received</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DividendEquivPaymentsRcvd/IncomeOrLossPerIncomeStmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DividendEquivPaymentsRcvd/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DividendEquivPaymentsRcvd/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DividendEquivPaymentsRcvd/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DividendEquivPaymentsRcvd/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 4a-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="height:8mm;padding-left:1.5mm;padding-top:0;padding-bottom:3mm">4a</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										Interest income excluding interest 
									    <span style="float:left;">equivalents</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:5mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/InterestIncomeExclEquivalents/IncomeOrLossPerIncomeStmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:5mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/InterestIncomeExclEquivalents/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:5mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/InterestIncomeExclEquivalents/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:5mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/InterestIncomeExclEquivalents/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="padding-top:5mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/InterestIncomeExclEquivalents/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 4b-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="padding-left:3.4mm">b</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">Substitute interest payments received</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubstituteInterestPaymentsRcvd/IncomeOrLossPerIncomeStmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubstituteInterestPaymentsRcvd/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubstituteInterestPaymentsRcvd/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubstituteInterestPaymentsRcvd/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubstituteInterestPaymentsRcvd/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 4c-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="padding-left:3.4mm;padding-bottom:0.5mm">c</td>
									<td class="sty1120FSchM3TableCellText" style="font-size:6pt;padding-top:0.5mm" scope="row">
										<div class="sty1120FSchM3RightFloat"/>
										<span style="float:left;">Interest equivalents not included on line 4b</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/InterestEquivalentsNotOnLine4b/IncomeOrLossPerIncomeStmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/InterestEquivalentsNotOnLine4b/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/InterestEquivalentsNotOnLine4b/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/InterestEquivalentsNotOnLine4b/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/InterestEquivalentsNotOnLine4b/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 5-->
								<tr>
									<td class="sty1120FSchM3TableCellNum">5</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<div class="sty1120FSchM3RightFloat"/>
										<span style="float:left;">Gross rental income</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GrossRentalIncome/IncomeOrLossPerIncomeStmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GrossRentalIncome/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GrossRentalIncome/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GrossRentalIncome/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GrossRentalIncome/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 6-->
								<tr>
									<td class="sty1120FSchM3TableCellNum">6</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<div class="sty1120FSchM3RightFloat"/>
										<span style="float:left;">Gross royalty income</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GrossRoyaltyIncome/IncomeOrLossPerIncomeStmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GrossRoyaltyIncome/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GrossRoyaltyIncome/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GrossRoyaltyIncome/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GrossRoyaltyIncome/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 7-->
								<tr>
									<td class="sty1120FSchM3TableCellNum">7</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<div class="sty1120FSchM3RightFloat">
									    </div>
										<span style="float:left;">Fee and commission income</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/FeeAndCommissionIncome/IncomeOrLossPerIncomeStmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/FeeAndCommissionIncome/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/FeeAndCommissionIncome/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/FeeAndCommissionIncome/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/FeeAndCommissionIncome/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 8-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="height:8mm;padding-top:0;padding-bottom:3mm">8</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										Income (loss) from equity method 
										<span style="float:left;">corporations</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IncomeLossFromEquityMthdCorp/IncomeOrLossPerIncomeStmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IncomeLossFromEquityMthdCorp/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IncomeLossFromEquityMthdCorp/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm;background-color:lightgrey">
										<br/>
										<span style="width:1px"/>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:8mm;padding-top:1mm;background-color:lightgrey">
										<br/>
										<span style="width:1px"/>
									</td>
								</tr>
								<!--Line 9-->
								<tr>
									<td class="sty1120FSchM3TableCellNum">9</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										Net income (loss) from U.S. partnerships
										<!-- Dotted Line -->
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IncomeLossFromUSPrtshp/IncomeOrLossPerIncomeStmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IncomeLossFromUSPrtshp/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IncomeLossFromUSPrtshp/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IncomeLossFromUSPrtshp/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IncomeLossFromUSPrtshp/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 10-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:8mm;padding-top:0;padding-bottom:3mm">10</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">                 
										Net income (loss) from certain foreign
										<span style="float:left;">partnerships (see instructions)
												<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/IncomeLossFromForeignPrtshp"/>
											</xsl:call-template>
										</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IncomeLossFromForeignPrtshp/IncomeOrLossPerIncomeStmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IncomeLossFromForeignPrtshp/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IncomeLossFromForeignPrtshp/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IncomeLossFromForeignPrtshp/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IncomeLossFromForeignPrtshp/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 11-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:8mm;padding-top:0;padding-bottom:3mm">11</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
									   Net income (loss) from other pass-
										<span style="float:left;">through entities (attach statement)
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/IncomeLossFromPassthroughEnt"/>
											</xsl:call-template>
										</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
										<span style="width:.5mm"/>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IncomeLossFromPassthroughEnt/IncomeOrLossPerIncomeStmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IncomeLossFromPassthroughEnt/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IncomeLossFromPassthroughEnt/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IncomeLossFromPassthroughEnt/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IncomeLossFromPassthroughEnt/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 12-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:8mm;padding-top:0;padding-bottom:3mm">12</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										Items relating to reportable transactions
										<span style="float:left;"> (attach statement)</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
										<span style="width:0.6mm"/>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/ItemsRelatingToReportableTrans"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ItemsRelatingToReportableTrans/IncomeOrLossPerIncomeStmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ItemsRelatingToReportableTrans/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ItemsRelatingToReportableTrans/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ItemsRelatingToReportableTrans/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ItemsRelatingToReportableTrans/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 13-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD">13</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">Hedging transactions</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/HedgingTransactions/IncomeOrLossPerIncomeStmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/HedgingTransactions/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/HedgingTransactions/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/HedgingTransactions/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/HedgingTransactions/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 14a-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:8mm;padding-top:0;padding-bottom:3mm">14a</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										Mark-to-market income (loss) under
										<span style="float:left;">section 475(a)</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/MarkToMarketIncomeSect475a/IncomeOrLossPerIncomeStmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/MarkToMarketIncomeSect475a/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/MarkToMarketIncomeSect475a/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/MarkToMarketIncomeSect475a/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/MarkToMarketIncomeSect475a/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 14b-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="height:8mm;padding-left:4mm;padding-top:0;padding-bottom:3mm">b</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										Mark-to-market income (loss) subject
										<span style="float:left;">to section 475(d)(3)(B)</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/MarkToMarketIncomeSect475d3B/IncomeOrLossPerIncomeStmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/MarkToMarketIncomeSect475d3B/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/MarkToMarketIncomeSect475d3B/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/MarkToMarketIncomeSect475d3B/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/MarkToMarketIncomeSect475d3B/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 14c-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="height:8mm;padding-left:4mm;padding-top:0;padding-bottom:3mm">c</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										Mark-to-market income (loss) under
										<span style="float:left;">section 475(e)</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/MarkToMarketIncomeSect475e/IncomeOrLossPerIncomeStmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/MarkToMarketIncomeSect475e/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/MarkToMarketIncomeSect475e/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/MarkToMarketIncomeSect475e/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/MarkToMarketIncomeSect475e/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 14d-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="height:8mm;padding-left:4mm;padding-top:0;padding-bottom:3mm">d</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										Mark-to-market income (loss) under
										<span style="float:left;">section 475(f)</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/MarkToMarketIncomeSect475f/IncomeOrLossPerIncomeStmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/MarkToMarketIncomeSect475f/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/MarkToMarketIncomeSect475f/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/MarkToMarketIncomeSect475f/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/MarkToMarketIncomeSect475f/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 15-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:8mm;padding-top:0;padding-bottom:3mm">15</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										Gain (loss) from certain section 988
										<span style="float:left;">transactions</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GainOrLossFromSect988Trans/IncomeOrLossPerIncomeStmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GainOrLossFromSect988Trans/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GainOrLossFromSect988Trans/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GainOrLossFromSect988Trans/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GainOrLossFromSect988Trans/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 16a-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:8mm;padding-top:0;padding-bottom:3mm">16a</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										Interest income from global securities
										<span style="float:left;">dealing</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IntIncomeFromGlobalSecDealing/IncomeOrLossPerIncomeStmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IntIncomeFromGlobalSecDealing/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IntIncomeFromGlobalSecDealing/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IntIncomeFromGlobalSecDealing/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IntIncomeFromGlobalSecDealing/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 16b-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="padding-left:4mm">b</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<!--div class="sty1120FSchM3RightFloat"-->
										<!--<span class="sty1120FSchM3DotLn">.</span>-->
										<!--/div-->
										<span style="float:left;">Dividends from global securities dealing</span>
										<!-- Dotted Line -->
										<!--<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>-->
										<!--<span  class="styDotLn" style="float:right;font-weight:bold;padding-right:1mm;">.</span>-->
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DividendsFromGlobalSecDealing/IncomeOrLossPerIncomeStmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DividendsFromGlobalSecDealing/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DividendsFromGlobalSecDealing/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DividendsFromGlobalSecDealing/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DividendsFromGlobalSecDealing/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 16c-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="height:16mm;padding-left:4mm;padding-top:0;padding-bottom:10mm">c</td>
									<td class="sty1120FSchM3TableCellText" style="height:16mm" scope="row">
									   Gains (losses) and other fixed and determinable, annual, or periodic income from global securities dealing not
										<span style="float:left;">included on lines 16a and 16b
												<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/GainOrLossFromGlobalSecDealing"/>
											</xsl:call-template>
										</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:12mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GainOrLossFromGlobalSecDealing/IncomeOrLossPerIncomeStmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:12mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GainOrLossFromGlobalSecDealing/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:12mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GainOrLossFromGlobalSecDealing/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:12mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GainOrLossFromGlobalSecDealing/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="padding-top:12mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GainOrLossFromGlobalSecDealing/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 17-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:8mm;padding-top:0;padding-bottom:3mm">17</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										Sales versus lease (for sellers and/or
										<span style="float:left;">lessors)</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SalesVersusLease/IncomeOrLossPerIncomeStmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SalesVersusLease/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SalesVersusLease/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SalesVersusLease/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SalesVersusLease/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 18-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD">18</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">Section 481(a) adjustments</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="background-color:lightgrey">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Sect481aAdjustments/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Sect481aAdjustments/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Sect481aAdjustments/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Sect481aAdjustments/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 19-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD">19</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">Unearned/deferred revenue</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UnearnedOrDeferredRevenue/IncomeOrLossPerIncomeStmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UnearnedOrDeferredRevenue/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UnearnedOrDeferredRevenue/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UnearnedOrDeferredRevenue/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UnearnedOrDeferredRevenue/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 20-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:8mm;padding-top:0;padding-bottom:3mm">20</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										Original issue discount, imputed
										<span style="float:left;">interest, and phantom income</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OriginalIssueDiscountEtc/IncomeOrLossPerIncomeStmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OriginalIssueDiscountEtc/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OriginalIssueDiscountEtc/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OriginalIssueDiscountEtc/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OriginalIssueDiscountEtc/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 21a-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:12mm;padding-top:0;padding-bottom:9mm">21a</td>
									<td class="sty1120FSchM3TableCellText" style="height:12mm" scope="row">
										Income statement gain/loss on sale,
										exchange, abandonment, worthlessness,
										or other disposition of assets other than
										<span style="float:left;">inventory and pass-through entities</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:8mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GainOrLossOnSaleOfAssets/IncomeOrLossPerIncomeStmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:8mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GainOrLossOnSaleOfAssets/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:8mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GainOrLossOnSaleOfAssets/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:12mm;padding-top:5mm;background-color:lightgrey">
										<br/>
										<span style="width:1px"/>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:12mm;padding-top:5mm;background-color:lightgrey">
										<br/>
										<span style="width:1px"/>
									</td>
								</tr>
								<!--Line 21b-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="height:12mm;padding-left:4mm;padding-top:0;padding-bottom:6.5mm">b</td>
									<td class="sty1120FSchM3TableCellText" style="height:12mm" scope="row">
										Gross capital gains from Schedule D,
										excluding amounts from pass-through
										<span style="float:left;">entities</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:12mm;padding-top:5mm;background-color:lightgrey;border-bottom-width:0">
										<br/>
										<span style="width:1px"/>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:12mm;padding-top:5mm;border-bottom-width:0">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GrossCapitalGainsFromSchD/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:12mm;padding-top:5mm;border-bottom-width:0">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GrossCapitalGainsFromSchD/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:12mm;padding-top:5mm;border-bottom-width:0">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GrossCapitalGainsFromSchD/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:12mm;padding-top:5mm;border-bottom-width:0">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GrossCapitalGainsFromSchD/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--END Part II Table-->
					<!--Begin Page 2 Footer-->
					<div style="width:187mm;clear:both;padding-top:0.5mm">
						<div style="float:right;" class="styGenericDiv">
							<b>Schedule M-3 (Form 1120-F) 2012</b>
						</div>
					</div>
					<br/>
					<div class="pageEnd"/>
					<!-- End Page 2 Footer-->
					<!--BEGIN PAGE 3-->
					<!--Page 3 Header-->
					<div class="styTBB" style="width:187mm">
						<div style="float:right;clear:none">
					Page <span style="font-size:8pt;font-weight:bold">3</span>
						</div>
						<div>Schedule M-3 (Form 1120-F) 2012</div>
					</div>
					<!--Begin Name/EIN-->
					<div style="width:187mm">
						<div class="styTableCell" style="width:135mm;float:left;height:10mm;text-align:left">
					Name of corporation
						 <br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styTableCell" style="width:52mm;border-right-width:0px;padding-left:2mm;float:left;height:10mm;text-align:left">
							<b>Employer identification number</b>
							<br/>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">EIN</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!--End Name/EIN-->
					<!--Part II Header Cont.-->
					<div class="styTBB" style="width:187mm">
						<div class="styPartName" style="height:4mm">Part II</div>
						<div class="styPartDesc" style="height:7mm;font-size:7.5pt">
				   Reconciliation of Net Income (Loss) per Income Statement of Non-Consolidated Foreign<br/>
				   Corporations With Taxable Income per Return <span style="font-weight:normal">(see instructions) <i>(continued from page 2)</i>
							</span>
						</div>
					</div>
					<!--BEGIN Part II Table-->
					<div class="styTBB" style="width:187mm">
						<!--Part II Table Header-->
						<table cellpadding="0" cellspacing="0" style="width:187mm">
							<tbody>
								<tr>
									<th class="sty1120FSchM3TableCellNum" scope="col">
										<span style="width:8mm"/>
									</th>
									<th class="sty1120FSchM3TableCellText" style="font-weight:bold;font-size:8pt" scope="col">Income (Loss) Items</th>
									<th class="sty1120FSchM3TableCellAmount" style="text-align:center" scope="col">
										<b>(a)</b>
										<br/>Income (Loss) per<br/>Income Statement<br/>
									</th>
									<th class="sty1120FSchM3TableCellAmount" style="text-align:center" scope="col">
										<b>(b)</b>
										<br/>Temporary<br/>Differences</th>
									<th class="sty1120FSchM3TableCellAmount" style="text-align:center" scope="col">
										<b>(c)</b>
										<br/>Permanent<br/>Differences</th>
									<th class="sty1120FSchM3TableCellAmount" style="text-align:center" scope="col">
										<b>(d)</b>
										<br/>Other Permanent<br/>Differences<br/>for Allocations to<br/>Non-ECI and ECI</th>
									<th class="sty1120FSchM3TableCellAmountLastCol" style="text-align:center" scope="col">
										<b>(e)</b>
										<br/>Income (Loss)<br/>per Tax Return</th>
								</tr>
								<!--Line 21c-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="height:12mm;padding-left:1mm;padding-top:0;padding-bottom:10.5mm">21c</td>
									<td class="sty1120FSchM3TableCellText" style="padding-bottom:1mm" scope="row">
										Gross capital losses from Schedule D,
										excluding amounts from pass-through
										entities, abandonment losses, and
										<span style="float:left;">worthless stock losses</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:5mm;border-bottom-width:0;background-color:lightgrey">
										<br/>
										<span style="width:1px"/>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:7mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GrossCapitalLossesFromSchD/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:7mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GrossCapitalLossesFromSchD/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:7mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GrossCapitalLossesFromSchD/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="padding-top:7mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GrossCapitalLossesFromSchD/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 21d-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="padding-left:4mm;padding-top:0;padding-bottom:9.5mm">d</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										Net gain/loss reported on Form 4797,
										line 17, excluding amounts from
										pass-through entities, abandonment
										<span style="float:left;">losses, and worthless stock losses</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:7mm;background-color:lightgrey;border-bottom-width:0">
										<br/>
										<span style="width:1px"/>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:7mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GainOrLossRptOnForm4797Line17/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:7mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GainOrLossRptOnForm4797Line17/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:7mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GainOrLossRptOnForm4797Line17/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="padding-top:7mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GainOrLossRptOnForm4797Line17/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 21e-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="padding-left:4mm">e</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">Abandonment losses</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="background-color:lightgrey;border-bottom-width:0">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AbandonmentLosses/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AbandonmentLosses/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AbandonmentLosses/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AbandonmentLosses/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 21f-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="padding-left:4mm">f</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
									   Worthless stock losses (attach
									    <span style="float:left;">statement)
									            <xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/WorthlessStockLosses"/>
											</xsl:call-template>
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="background-color:lightgrey;border-bottom-width:0">
										<br/>
										<span style="width:1px"/>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/WorthlessStockLosses/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/WorthlessStockLosses/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/WorthlessStockLosses/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/WorthlessStockLosses/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 21g-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="height:8mm;padding-left:4mm;padding-top:0;padding-bottom:3.5mm">g</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										Other gain/loss on disposition of assets
										<span style="float:left;">other than inventory</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:1mm;background-color:lightgrey;border-bottom-width:0">
										<br/>
										<span style="width:1px"/>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OthGainOrLossOnDisposOfAssets/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OthGainOrLossOnDisposOfAssets/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OthGainOrLossOnDisposOfAssets/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OthGainOrLossOnDisposOfAssets/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 22-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:8mm;padding-top:0;padding-bottom:3mm">22</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
								Capital loss limitation and carryforward
										<span style="float:left;">used</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:1mm;background-color:lightgrey;border-bottom-width:0">
										<br/>
										<span style="width:1px"/>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CapitalLossLmtAndCfwdUsed/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CapitalLossLmtAndCfwdUsed/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CapitalLossLmtAndCfwdUsed/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CapitalLossLmtAndCfwdUsed/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 23-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:12mm;padding-top:0;padding-bottom:9mm">23</td>
									<td class="sty1120FSchM3TableCellText" style="height:12mm" scope="row">
										Gross effectively connected income of<br/>
										foreign banks from books that do not give<br/>
										<span style="float:left;">rise to U.S. booked liabilities</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:12mm;padding-top:5mm;background-color:lightgrey">
										<br/>
										<span style="width:1px"/>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:12mm;padding-top:5mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GrossEDIWithNoUSBookedLiab/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:12mm;padding-top:5mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GrossEDIWithNoUSBookedLiab/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:12mm;padding-top:5mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GrossEDIWithNoUSBookedLiab/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:12mm;padding-top:5mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/GrossEDIWithNoUSBookedLiab/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 24-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:8mm;padding-top:0;padding-bottom:3mm">24</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										Other income (loss) items with
										<span style="float:left;">differences (attach statement) 
										    <xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/OtherItemsWithDifferences"/>
											</xsl:call-template>
										</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OtherItemsWithDifferences/IncomeOrLossPerIncomeStmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OtherItemsWithDifferences/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OtherItemsWithDifferences/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OtherItemsWithDifferences/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OtherItemsWithDifferences/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 25-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:8mm;padding-top:0;padding-bottom:3mm">25</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										<b>Total income (loss) items.</b> Combine lines
										<span style="float:left;">1 through 24</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalIncomeOrLossItems/IncomeOrLossPerIncomeStmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalIncomeOrLossItems/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalIncomeOrLossItems/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalIncomeOrLossItems/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalIncomeOrLossItems/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 26-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:8mm;padding-top:0;padding-bottom:3mm">26</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										<b>Total expense/deduction items</b> (from
										<span style="float:left;">Part III, line 33)</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalExpenseDeductionItems/IncomeOrLossPerIncomeStmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalExpenseDeductionItems/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalExpenseDeductionItems/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalExpenseDeductionItems/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalExpenseDeductionItems/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 27-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD">27</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">Other items with no differences</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OtherItemsWithNoDifferences/IncomeOrLossPerIncomeStmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="background-color:lightgrey">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="background-color:lightgrey">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OtherItemsWithNoDifferences/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OtherItemsWithNoDifferences/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 28-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:8mm;padding-top:0;padding-bottom:3mm">28</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										<b>Reconciliation totals.</b> Combine lines 25
										<span style="float:left;">through 27</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ReconciliationTotals/IncomeOrLossPerIncomeStmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ReconciliationTotals/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ReconciliationTotals/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ReconciliationTotals/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ReconciliationTotals/IncomeOrLossPerReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Part II Table Note-->
								<tr>
									<td class="sty1120FSchM3TableCellNum">
										<span style="width:7mm"/>
									</td>
									<td colspan="6" style="font-size:7pt">
										<b>Note.</b> Line 28, column (a), must equal the amount on Part I, line 11, and column (e) must equal Form 1120-F, page 3, line 29.
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--END Part II Table-->
					<!--END PART II-->
					<!--BEGIN -->
					<!--Part III Header-->
					<div class="styTBB" style="width:187mm">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc">
					Reconciliation of Net Income (Loss) per Income Statement of Non-Consolidated Foreign<br/>
				    Corporations With Taxable Income per Return<span style="font-weight:normal"> (see instructions)</span>
						</div>
					</div>
					<!--Begin Part III Table-->
					<div class="styTBB" style="width:187mm">
						<!--Part III Table Header-->
						<table cellpadding="0" cellspacing="0" style="width:187mm">
							<tbody>
								<tr>
									<th class="sty1120FSchM3TableCellNum" scope="col">
										<span style="width:8mm"/>
									</th>
									<th class="sty1120FSchM3TableCellText" style="font-weight:bold;font-size:8pt" scope="col">Expense/Deduction Items</th>
									<th class="sty1120FSchM3TableCellAmount" style="text-align:center" scope="col">
										<b>(a)</b>
										<br/>Expense per<br/>Income Statement<br/>
									</th>
									<th class="sty1120FSchM3TableCellAmount" style="text-align:center" scope="col">
										<b>(b)</b>
										<br/>Temporary<br/>Differences</th>
									<th class="sty1120FSchM3TableCellAmount" style="text-align:center" scope="col">
										<b>(c)</b>
										<br/>Permanent<br/>Differences</th>
									<th class="sty1120FSchM3TableCellAmount" style="text-align:center" scope="col">
										<b>(d)</b>
										<br/>Other Permanent<br/>Differences<br/>for Allocations to<br/>Non-ECI and ECI</th>
									<th class="sty1120FSchM3TableCellAmountLastCol" style="text-align:center" scope="col">
										<b>(e)</b>
										<br/>Deduction per<br/>Tax Return<br/>
									</th>
								</tr>
								<!--Line 1-->
								<tr>
									<td class="sty1120FSchM3TableCellNum">1</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">U.S. current income tax expense</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/USCurrentIncomeTaxExpense/ExpensePerIncomeStatement"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/USCurrentIncomeTaxExpense/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/USCurrentIncomeTaxExpense/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/USCurrentIncomeTaxExpense/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="background-color:lightgrey;border-bottom-width:0">
										<span style="width:1px"/>
									</td>
								</tr>
								<!--Line 2-->
								<tr>
									<td class="sty1120FSchM3TableCellNum">2</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">U.S. deferred income tax expense</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/USDeferredIncomeTaxExpense/ExpensePerIncomeStatement"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/USDeferredIncomeTaxExpense/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/USDeferredIncomeTaxExpense/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/USDeferredIncomeTaxExpense/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="background-color:lightgrey">
										<span style="width:1px"/>
									</td>
								</tr>
								<!--Line 3-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="height:8mm;padding-top:0;padding-bottom:3mm">3</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										Non-U.S. current income tax expense
										<span style="float:left;">(other than foreign withholding taxes)</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonUSCurrentIncomeTaxExpense/ExpensePerIncomeStatement"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonUSCurrentIncomeTaxExpense/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonUSCurrentIncomeTaxExpense/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonUSCurrentIncomeTaxExpense/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonUSCurrentIncomeTaxExpense/DeductionPerTaxReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 4-->
								<tr>
									<td class="sty1120FSchM3TableCellNum">4</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
									Non-U.S. deferred income tax expense
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonUSDeferredIncomeTaxExpense/ExpensePerIncomeStatement"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonUSDeferredIncomeTaxExpense/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonUSDeferredIncomeTaxExpense/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonUSDeferredIncomeTaxExpense/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="background-color:lightgrey">
										<span style="width:1px"/>
									</td>
								</tr>
								<!--Line 5-->
								<tr>
									<td class="sty1120FSchM3TableCellNum">5</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">Non-U.S. withholding taxes</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonUSWithholdingTaxes/ExpensePerIncomeStatement"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonUSWithholdingTaxes/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonUSWithholdingTaxes/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonUSWithholdingTaxes/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonUSWithholdingTaxes/DeductionPerTaxReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 6-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="height:8mm;padding-top:0;padding-bottom:3mm">6</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										Compensation with section 162(m)
										<span style="float:left;">limitation</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CompensationWithSect162mLmt/ExpensePerIncomeStatement"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CompensationWithSect162mLmt/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CompensationWithSect162mLmt/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CompensationWithSect162mLmt/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CompensationWithSect162mLmt/DeductionPerTaxReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 7-->
								<tr>
									<td class="sty1120FSchM3TableCellNum">7</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">Salaries and other base compensation</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SalariesAndOtherBaseComp/ExpensePerIncomeStatement"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SalariesAndOtherBaseComp/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SalariesAndOtherBaseComp/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SalariesAndOtherBaseComp/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SalariesAndOtherBaseComp/DeductionPerTaxReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 8-->
								<tr>
									<td class="sty1120FSchM3TableCellNum">8</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">Stock option expense</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/StockOptionExpense/ExpensePerIncomeStatement"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/StockOptionExpense/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/StockOptionExpense/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/StockOptionExpense/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/StockOptionExpense/DeductionPerTaxReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 9-->
								<tr>
									<td class="sty1120FSchM3TableCellNum">9</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">Other equity-based compensation</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OtherEquityBasedCompensation/ExpensePerIncomeStatement"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OtherEquityBasedCompensation/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OtherEquityBasedCompensation/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OtherEquityBasedCompensation/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OtherEquityBasedCompensation/DeductionPerTaxReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 10-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD">10</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">Meals and entertainment</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/MealsAndEntertainment/ExpensePerIncomeStatement"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/MealsAndEntertainment/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/MealsAndEntertainment/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/MealsAndEntertainment/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/MealsAndEntertainment/DeductionPerTaxReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 11-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD">11</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">Fines and penalties</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/FinesAndPenalties/ExpensePerIncomeStatement"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/FinesAndPenalties/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/FinesAndPenalties/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/FinesAndPenalties/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/FinesAndPenalties/DeductionPerTaxReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 12-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:8mm;padding-top:0;padding-bottom:3mm">12</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										Judgments, damages, awards, and
										<span style="float:left;">similar costs</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm;border-bottom-width:0">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/JudgmentsDamagesAwardsEtc/ExpensePerIncomeStatement"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm;border-bottom-width:0">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/JudgmentsDamagesAwardsEtc/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm;border-bottom-width:0">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/JudgmentsDamagesAwardsEtc/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm;border-bottom-width:0">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/JudgmentsDamagesAwardsEtc/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:8mm;padding-top:1mm;border-bottom-width:0">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/JudgmentsDamagesAwardsEtc/DeductionPerTaxReturn"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--END Part III Table-->
					<!--Begin Page 3 Footer-->
					<div style="width:187mm;clear:both;padding-top:0.5mm">
						<div style="float:right;" class="styGenericDiv">
							<b>Schedule M-3 (Form 1120-F) 2012</b>
						</div>
					</div>
					<br/>
					<div class="pageEnd"/>
					<!-- End Page 3 Footer-->
					<!--BEGIN PAGE 4-->
					<!--Page 4 Header-->
					<div class="styTBB" style="width:187mm">
						<div style="float:right;clear:none">
					Page <span style="font-size:8pt;font-weight:bold">4</span>
						</div>
						<div>Schedule M-3 (Form 1120-F) 2012</div>
					</div>
					<!--Begin Name/EIN-->
					<div style="width:187mm">
						<div class="styTableCell" style="width:135mm;float:left;height:10mm;text-align:left">
					Name of corporation
						 <br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styTableCell" style="width:52mm;border-right-width:0px;padding-left:2mm;float:left;height:10mm;text-align:left">
							<b>Employer identification number</b>
							<br/>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">EIN</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!--End Name/EIN-->
					<!--Part III Header Cont.-->
					<div class="styTBB" style="width:187mm">
						<div class="styPartName" style="height:4mm">Part III</div>
						<div class="styPartDesc" style="height:7mm">
					Reconciliation of Net Income (Loss) per Income Statement of Non-Consolidated Foreign<br/>
					Corporations With Taxable Income per Return<span style="font-weight:normal"> (see instructions)<i> (continued from page 3)</i>
							</span>
						</div>
					</div>
					<!--Begin Part III Table-->
					<div class="styTBB" style="width:187mm">
						<!--Part III Table Header-->
						<table cellpadding="0" cellspacing="0" style="width:187mm">
							<tbody>
								<tr>
									<th class="sty1120FSchM3TableCellNum" scope="col">
										<span style="width:8mm"/>
									</th>
									<th class="sty1120FSchM3TableCellText" style="font-weight:bold;font-size:8pt" scope="col">Expense/Deduction Items</th>
									<th class="sty1120FSchM3TableCellAmount" style="text-align:center" scope="col">
										<b>(a)</b>
										<br/>Expense per<br/>Income Statement<br/>
									</th>
									<th class="sty1120FSchM3TableCellAmount" style="text-align:center" scope="col">
										<b>(b)</b>
										<br/>Temporary<br/>Differences</th>
									<th class="sty1120FSchM3TableCellAmount" style="text-align:center; width:25mm" scope="col">
										<b>(c)</b>
										<br/>Permanent<br/>Differences</th>
									<th class="sty1120FSchM3TableCellAmount" style="text-align:center; width:23mm" scope="col">
										<b>(d)</b>
										<br/>Other Permanent<br/>Differences<br/>for Allocations to<br/>Non-ECI and ECI</th>
									<th class="sty1120FSchM3TableCellAmountLastCol" style="text-align:center" scope="col">
										<b>(e)</b>
										<br/>Deduction per<br/>Tax Return<br/>
									</th>
								</tr>
								<!--Line 13-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD">13</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">Pension and profit-sharing</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PensionAndProfitSharing/ExpensePerIncomeStatement"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PensionAndProfitSharing/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PensionAndProfitSharing/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PensionAndProfitSharing/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PensionAndProfitSharing/DeductionPerTaxReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 14-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD">14</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">Other post-retirement benefits</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OtherPostRetirementBenefits/ExpensePerIncomeStatement"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OtherPostRetirementBenefits/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OtherPostRetirementBenefits/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OtherPostRetirementBenefits/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OtherPostRetirementBenefits/DeductionPerTaxReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 15-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD">15</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">Deferred compensation</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DeferredCompensation/ExpensePerIncomeStatement"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DeferredCompensation/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DeferredCompensation/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DeferredCompensation/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DeferredCompensation/DeductionPerTaxReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 16-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD">16</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">Charitable contributions</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CharitableContributions/ExpensePerIncomeStatement"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CharitableContributions/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CharitableContributions/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CharitableContributions/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CharitableContributions/DeductionPerTaxReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 17-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:8mm;padding-top:0;padding-bottom:3mm">17</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										Domestic production activities
										<span style="float:left;">deduction</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm;background-color:lightgrey">
										<br/>
										<span style="width:1px"/>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DomesticProdActyDeduction/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DomesticProdActyDeduction/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DomesticProdActyDeduction/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DomesticProdActyDeduction/DeductionPerTaxReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 18-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:12mm;padding-top:0;padding-bottom:6.5mm">18</td>
									<td class="sty1120FSchM3TableCellText" style="height:12mm" scope="row">
										Current year acquisition or
										reorganization investment banking fees,
										<span style="float:left;">legal and accounting fees</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:12mm;padding-top:5mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CurrYrAcquisOrReorgFees/ExpensePerIncomeStatement"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:12mm;padding-top:5mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CurrYrAcquisOrReorgFees/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:12mm;padding-top:5mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CurrYrAcquisOrReorgFees/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:12mm;padding-top:5mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CurrYrAcquisOrReorgFees/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:12mm;padding-top:5mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CurrYrAcquisOrReorgFees/DeductionPerTaxReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 19-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:8mm;padding-top:0;padding-bottom:3mm">19</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										Current year acquisition/reorganization
										<span style="float:left;">other costs</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CurrYrAcquisOrReorgOtherCosts/ExpensePerIncomeStatement"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CurrYrAcquisOrReorgOtherCosts/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CurrYrAcquisOrReorgOtherCosts/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CurrYrAcquisOrReorgOtherCosts/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CurrYrAcquisOrReorgOtherCosts/DeductionPerTaxReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 20-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD">20</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">Amortization/impairment of goodwill</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AmortizationOfGoodwill/ExpensePerIncomeStatement"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AmortizationOfGoodwill/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AmortizationOfGoodwill/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AmortizationOfGoodwill/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AmortizationOfGoodwill/DeductionPerTaxReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 21-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:8mm;padding-top:0;padding-bottom:3mm">21</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										Amortization of acquisition,
										<span style="float:left;">reorganization, and start-up costs</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AmortzOfAcquisReorgStUpCosts/ExpensePerIncomeStatement"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AmortzOfAcquisReorgStUpCosts/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AmortzOfAcquisReorgStUpCosts/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AmortzOfAcquisReorgStUpCosts/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AmortzOfAcquisReorgStUpCosts/DeductionPerTaxReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 22-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:8mm;padding-top:0;padding-bottom:3mm">22</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										Other amortization or impairment
										<span style="float:left;">write-offs</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OtherAmortizationWriteOffs/ExpensePerIncomeStatement"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OtherAmortizationWriteOffs/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OtherAmortizationWriteOffs/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OtherAmortizationWriteOffs/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OtherAmortizationWriteOffs/DeductionPerTaxReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 23-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD">23</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">Depreciation</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Depreciation/ExpensePerIncomeStatement"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Depreciation/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Depreciation/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Depreciation/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Depreciation/DeductionPerTaxReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 24-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD">24</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">Bad debt expense</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BadDebtExpense/ExpensePerIncomeStatement"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BadDebtExpense/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BadDebtExpense/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BadDebtExpense/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BadDebtExpense/DeductionPerTaxReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 25-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:8mm;padding-top:0;padding-bottom:3mm">25</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										Purchase versus lease (for purchasers
										<span style="float:left;">and/or lessees)</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PurchaseVersusLease/ExpensePerIncomeStatement"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PurchaseVersusLease/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PurchaseVersusLease/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PurchaseVersusLease/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PurchaseVersusLease/DeductionPerTaxReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 26a-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD">26a</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">Interest expense per books</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/InterestExpensePerBooks/ExpensePerIncomeStatement"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/InterestExpensePerBooks/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/InterestExpensePerBooks/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="background-color:lightgrey">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="background-color:lightgrey">
										<span style="width:1px"/>
									</td>
								</tr>
								<!--Line 26b-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="height:12mm;padding-left:4mm;padding-top:0;padding-bottom:6mm">b</td>
									<td class="sty1120FSchM3TableCellText" style="height:12mm" scope="row">
										Interest expense under Regulations
										section 1.882-5 (from Schedule I
										<span style="float:left;">(Form 1120-F), line 23)</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:12mm;padding-top:5mm;background-color:lightgrey">
										<br/>
										<span style="width:1px"/>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:12mm;padding-top:5mm;background-color:lightgrey">
										<br/>
										<span style="width:1px"/>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:12mm;padding-top:5mm;background-color:lightgrey">
										<br/>
										<span style="width:1px"/>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:12mm;padding-top:5mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/InterestExpenseUnderSect18825/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:12mm;padding-top:5mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/InterestExpenseUnderSect18825/DeductionPerTaxReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 26c-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="height:12mm;padding-left:4mm;padding-top:0;padding-bottom:10mm">c</td>
									<td class="sty1120FSchM3TableCellText" style="height:12mm" scope="row">
										Regulations section 1.882-5 allocation
										amount subject to deferral or
										disallowance (from Schedule I (Form
										<span style="float:left;">1120-F), line 24d)</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:12mm;padding-top:5mm;background-color:lightgrey">
										<br/>
										<span style="width:1px"/>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:12mm;padding-top:5mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Sect18825AllocnAmtSubjToDfrl/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:12mm;padding-top:5mm">
										<br/>
										<b>(</b>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Sect18825AllocnAmtSubjToDfrl/PermanentDifferences"/>
										</xsl:call-template>
										<b>)</b>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:12mm;padding-top:5mm;background-color:lightgrey;">
										<br/>
										<span style="width:1px"/>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:12mm;padding-top:5mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Sect18825AllocnAmtSubjToDfrl/DeductionPerTaxReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 26d-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:8mm;padding-left:4mm;padding-top:0;padding-bottom:3mm">d</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										U.S. source substitute interest
										<span style="float:left;">payments</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/USSourceSubstituteInterestPymt/ExpensePerIncomeStatement"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/USSourceSubstituteInterestPymt/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/USSourceSubstituteInterestPymt/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/USSourceSubstituteInterestPymt/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/USSourceSubstituteInterestPymt/DeductionPerTaxReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 26e-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="height:8mm;padding-left:4mm;padding-top:0;padding-bottom:3mm">e</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										Interest equivalents (e.g., guarantee
										<span style="float:left;">fees) not included on line 26d</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/InterestEquivalents/ExpensePerIncomeStatement"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/InterestEquivalents/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/InterestEquivalents/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/InterestEquivalents/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/InterestEquivalents/DeductionPerTaxReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 27-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD">27</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">Dividend equivalent</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DividendEquivPayments/ExpensePerIncomeStatement"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DividendEquivPayments/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DividendEquivPayments/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DividendEquivPayments/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DividendEquivPayments/DeductionPerTaxReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 28-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD">28</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">Fee and commission expense</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/FeeAndCommissionExpense/ExpensePerIncomeStatement"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/FeeAndCommissionExpense/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/FeeAndCommissionExpense/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/FeeAndCommissionExpense/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/FeeAndCommissionExpense/DeductionPerTaxReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 29-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD">29</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">Rental expense</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RentalExpense/ExpensePerIncomeStatement"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RentalExpense/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RentalExpense/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RentalExpense/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RentalExpense/DeductionPerTaxReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 30-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD">30</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">Royalty expense</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RoyaltyExpense/ExpensePerIncomeStatement"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RoyaltyExpense/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RoyaltyExpense/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RoyaltyExpense/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RoyaltyExpense/DeductionPerTaxReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 31-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="padding-bottom:16mm;">31</td>
									<td class="sty1120FSchM3TableCellText" style="height:16mm;" scope="row">										
              Expenses allocable to effectively connected income under Regulations section 1.861-8 from home office or other books that do not give  rise to U.S. booked liabilities (from Schedule H
										<span style="float:left;">(Form 1120-F), line 20)</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:16mm;background-color:lightgrey">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:16mm;background-color:lightgrey">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:16mm;background-color:lightgrey">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:16mm;padding-top:12mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ExpnssAllcblToECIUndSect18618/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:16mm;padding-top:12mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ExpnssAllcblToECIUndSect18618/DeductionPerTaxReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 32-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:8mm;padding-top:0;padding-bottom:2.8mm">32</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
					Other expense/deduction items with
										<span style="float:left;">differences (attach schedule)
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/OtherExpenseDedItemsWithDiff"/>
											</xsl:call-template>
										</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OtherExpenseDedItemsWithDiff/ExpensePerIncomeStatement"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OtherExpenseDedItemsWithDiff/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OtherExpenseDedItemsWithDiff/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OtherExpenseDedItemsWithDiff/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OtherExpenseDedItemsWithDiff/DeductionPerTaxReturn"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 33-->
								<tr style="padding-bottom:0.5mm">
									<td class="sty1120FSchM3TableCellNumDD" style="height:8mm;padding-top:0;padding-bottom:7mm">33</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm">
										<b>Total expense/deduction items.</b>
										Combine lines 1 through 32. Enter here
										<span style="float:left;">and on Part II, line 26</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:4mm;border-bottom-width:0">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalExpenseAndDeductionItems/ExpensePerIncomeStatement"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:4mm;border-bottom-width:0">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalExpenseAndDeductionItems/TemporaryDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:4mm;border-bottom-width:0">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalExpenseAndDeductionItems/PermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:4mm;border-bottom-width:0">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalExpenseAndDeductionItems/OtherPermanentDifferences"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:8mm;padding-top:4mm;border-bottom-width:0">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalExpenseAndDeductionItems/DeductionPerTaxReturn"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--END Part III Table-->
					<!--END Part III-->
					<!--Begin Page 4 Footer-->
					<div style="width:187mm;clear:both;padding-top:0.5mm">
						<div style="float:right;" class="styGenericDiv">
							<b>Schedule M-3 (Form 1120-F) 2012</b>
						</div>
					</div>
					<br/>
					<div class="pageEnd"/>
					<!-- End Page 4 Footer-->
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
				   Additional Data        
					</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
