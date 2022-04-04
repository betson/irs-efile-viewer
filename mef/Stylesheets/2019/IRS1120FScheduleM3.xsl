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
	<!-- Defines the stage of the data, e.g. original or latest  -->
	<xsl:param name="FormData" select="$RtnDoc/IRS1120FScheduleM3"/>
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
			<body class="styBodyClass" style="width:187mm">
				<form name="Form1120FScheduleM3">
					<!-- BEGIN WARNING LINE -->
					<xsl:call-template name="DocumentHeader"/>
					<!-- END WARNING LINE -->
					<!--Begin Header-->
	        <div class="styTBB" style="width:187mm;">
            <div class="styFNBox" style="width:31mm;height:18.5mm;">
              <span class="styFormNumber" style="font-size:9pt;font-family:arial;">SCHEDULE M-3<br/>
                <span style="font-size:9pt;">(Form 1120-F) &#160;</span>
                <!--General Dependency Push Pin-->
				<xsl:call-template name="SetFormLinkInline">
				<xsl:with-param name="TargetNode" select="$FormData"/>
				</xsl:call-template>
                <br/>
              </span>
              <div style="line-height:120%;padding-top:5mm;">
                <span class="styAgency">Department of the Treasury</span>
                <br/>
                <span class="styAgency">Internal Revenue Service</span>
              </div>
            </div>
            <div class="styFTBox" style="width:125mm;height:18.5mm;">
             <div class="sty1120FSchM3MainTitle">
				 Net Income (Loss) Reconciliation for Foreign<br/>
				 Corporations With Reportable Assets of $10 Million or More
			 </div>
              <div class="styFST" style="height:3mm;">
              <br/>
              <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet"/>
                Attach to Form 1120-F.              
				<br/>              
				 <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet"/>
                  Go to
				  <a style="text-decoration:none;color:black;" href="http://www.irs.gov/Form1120s" title="Link to IRS.gov">
					<i>www.irs.gov/Form1120F</i>
				  </a>
				  for instructions and the latest information.
              </div>
             </div>
            <div class="styTYBox" style="width:30mm;height:18.5mm;">
              <div class="styOMB" style="height:4mm;width:30mm;">OMB No. 1545-0123</div>
              <div class="styTY" style="height:11mm;padding-top:2mm">20<span class="styTYColor">19</span>
              </div>
            </div>
          </div>
				<!--End header-->
					<!--Begin Name/EIN-->
					<div style="width:187mm">
						<div class="styTableCell" style="width:135mm;float:left;height:10mm;text-align:left">
							Name of corporation
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
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
						<div style="width:187mm;padding-top:3mm;">
							<div class="styLNLeftNumBoxSD">A</div>
							<div class="sty1120FSchM3LNDesc">
								Has the corporation reported taxable income on Form 1120-F, page 4, using a treaty provision to attribute 
							    <span style="float:left;">business profits to a  U.S. permanent establishment under rules other than section 864(c)?</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;">........</span>
							</div>
							<div class="sty1120FSchM3Pad4mm" />
							<div class="sty1120FSchM3ChkBx" style="width:16mm">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/RptIncmRlsOthThanSect864cInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="Reported Income Under Rules Other Than Section 864c Yes" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/RptIncmRlsOthThanSect864cInd"/>
							              <xsl:with-param name="BackupName">ReportedIncomeUnderRulesOtherThanSection864cIndicatorYes</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/RptIncmRlsOthThanSect864cInd"/>
										<xsl:with-param name="BackupName">ReportedIncomeUnderRulesOtherThanSection864cIndicatorYesLabel</xsl:with-param>
									</xsl:call-template>
									<span style="width:1mm"/>Yes
							   </label>
							</div>
							<div class="sty1120FSchM3ChkBx" style=";width:16mm">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/RptIncmRlsOthThanSect864cInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="Reported Income Under Rules Other Than Section 864c No"  class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox" >
											<xsl:with-param name="TargetNode" select="$FormData/RptIncmRlsOthThanSect864cInd"/>
											<xsl:with-param name="BackupName">ReportedIncomeUnderRulesOtherThanSection864cNo</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/RptIncmRlsOthThanSect864cInd"/>
										<xsl:with-param name="BackupName">ReportedIncomeUnderRulesOtherThanSection864cNoLabel</xsl:with-param>
									</xsl:call-template>
									<span style="width:2mm"/>No
							   </label>
							</div>
						</div>
						<!--Line B-->
						<div style="width:187mm;padding-top:0mm">
							<div class="styLNLeftNumBoxSD">B</div>
							<div class="sty1120FSchM3LNDesc">
							  Did the corporation prepare a non-consolidated, worldwide, certified audited income statement for the period
							   <span style="float:left;">(see instructions)?</span>
								<!-- Dotted Line -->
								<span class="styDotLn" style="float:right;">..............................</span>
							</div>
							<div class="sty1120FSchM3Pad4mm"/>
							<div class="sty1120FSchM3ChkBx" style="width:16mm">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCertAudIncmStmtInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="Non Consolidated Certified Audited Income Statement Yes"  class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCertAudIncmStmtInd"/>
											<xsl:with-param name="BackupName">NonConsolidatedCertifiedAuditedIncomeStatementYes</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCertAudIncmStmtInd"/>
										<xsl:with-param name="BackupName">NonConsolidatedCertifiedAuditedIncomeStatementYesLabel</xsl:with-param>
									</xsl:call-template>
									<span style="width:1mm"/>Yes
							    </label>
							</div>
							<div class="sty1120FSchM3ChkBx" style="width:16mm">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCertAudIncmStmtInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="Non Consolidated Certified Audited Income Statement No"  class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCertAudIncmStmtInd"/>
											<xsl:with-param name="BackupName">NonConsolidatedCertifiedAuditedIncomeStatementNo</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCertAudIncmStmtInd"/>
										<xsl:with-param name="BackupName">NonConsolidatedCertifiedAuditedIncomeStatementNoLabel</xsl:with-param>
									</xsl:call-template>
									<span style="width:2mm"/>No
							    </label>
							</div>
						</div>
						<!--Line C-->
						<div style="width:187mm;padding-top:0mm">
							<div class="styLNLeftNumBoxSD"  style="padding-top:3mm">C</div>
							<div class="sty1120FSchM3LNDesc" style="padding-top:3mm">
							Did the corporation prepare a non-consolidated, worldwide income statement for the period (see instructions)?
							</div>
							<div class="sty1120FSchM3Pad4mm"/>
							<div class="sty1120FSchM3ChkBx" style="width:16mm">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtWorldwideIncmStmtInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="Non Consolidated Worldwide Income Statement Yes" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtWorldwideIncmStmtInd"/>
											<xsl:with-param name="BackupName">NonConsolidatedWorldwideIncomeStatementYes</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtWorldwideIncmStmtInd"/>
										<xsl:with-param name="BackupName">NonConsolidatedWorldwideIncomeStatementYesLabel</xsl:with-param>
									</xsl:call-template>
									<span style="width:1mm"/>Yes
							    </label>
							</div>
							<div class="sty1120FSchM3ChkBx" style="width:16mm">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtWorldwideIncmStmtInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="Non Consolidated Worldwide Income Statement No" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtWorldwideIncmStmtInd"/>
											<xsl:with-param name="BackupName">NonConsolidatedWorldwideIncomeStatementNo</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtWorldwideIncmStmtInd"/>
										<xsl:with-param name="BackupName">NonConsolidatedWorldwideIncomeStatementNoLabel</xsl:with-param>
									</xsl:call-template>
									<span style="width:2mm"/>No
							    </label>
							</div>
						</div>
						<!--Line D-->
						<div style="width:187mm;padding-top:0mm;padding-bottom:1mm">
							<div class="styLNLeftNumBoxSD">D</div>
							<div class="sty1120FSchM3LNDesc">
							   Did the corporation prepare certified audited income statement(s) for the set(s) of books reported on
							    <span style="float:left;">Form 1120-F, Schedule L?</span>
								<!-- Dotted Line -->
								<span class="styDotLn" style="float:right;">............................</span>
							</div>
							<div class="sty1120FSchM3Pad4mm"/>
							<div class="sty1120FSchM3ChkBx" style="width:16mm">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/CertAudIncmStmtBksRptSchLInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="Certified Audited Income Statement Books Reported on 1120F Schedule L Yes" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CertAudIncmStmtBksRptSchLInd"/>
											<xsl:with-param name="BackupName">CertifiedAuditedIncomeStatementBooksReportedon1120FSchLYes</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/CertAudIncmStmtBksRptSchLInd"/>
										<xsl:with-param name="BackupName">CertifiedAuditedIncomeStatementBooksReportedon1120FSchLYesLabel</xsl:with-param>
									</xsl:call-template>
									<span style="width:1mm"/>Yes
							    </label>
							</div>
							<div class="sty1120FSchM3ChkBx" style="width:16mm">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/CertAudIncmStmtBksRptSchLInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="Certified Audited Income Statement Books Reported on 1120F Schedule L No" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CertAudIncmStmtBksRptSchLInd"/>
											<xsl:with-param name="BackupName">CertifiedAuditedIncomeStatementBooksReportedon1120FSchLNo</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/CertAudIncmStmtBksRptSchLInd"/>
										<xsl:with-param name="BackupName">CertifiedAuditedIncomeStatementBooksReportedon1120FSchLNoLabel</xsl:with-param>
									</xsl:call-template>
									<span style="width:2mm"/>No
							   </label>
							</div>
						</div>
					</div>
					<!--End Line A-D-->
					<!--Begin Part 1-->
					<!--Part 1 Header-->
					<div class="styBB" style="width:187mm;height:4mm">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">
						 Financial Information and Net Income (Loss) Reconciliation <span style="font-weight:normal">(see instructions)</span>
						</div>
					</div>
					<!--Begin Lines 1-11-->
					<div class="styTBB" style="width:187mm">
						<!--Line 1-->
						<div style="width:187mm;padding-top:3mm;">
							<div class="styLNLeftNumBoxSD" style="height:40mm">1</div>
							<div class="sty1120FSchM3LNDescLong" style="padding-left:1mm">Is the corporation a foreign bank as defined in Regulations section 1.882-5(c)(4)?</div>
							<div class="sty1120FSchM3LNDescLong" style="height:5mm">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignBankDefSect18825c4Ind"/>
									</xsl:call-template>
									<input type="checkbox" alt="ForeignBankDefinedSect18825c4Yes" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignBankDefSect18825c4Ind"/>
											<xsl:with-param name="BackupName">IRS1120FSchM3ForeignBankDefinedSect18825c4Yes</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignBankDefSect18825c4Ind"/>
										<xsl:with-param name="BackupName">IRS1120FSchM3ForeignBankDefinedSect18825c4</xsl:with-param>
									</xsl:call-template>
									<span style="width:2mm"/>
									<b>Yes. </b>
								</label>
							    Complete the remainder of Part I as follows:
							</div>
							<div class="sty1120FSchM3LNDescLong">
								<span style="width:7mm;"/>If D is "Yes," use the income statement described in D to complete lines 2 through 5 and 7 through 11.
							</div>
							<div class="sty1120FSchM3LNDescLong">
								<span style="width:6mm;"/>
								If D is "No," use the income statement(s) for the set(s) of books reported on Form 1120-F, Schedule L to complete lines 2 
							</div>
							<div class="sty1120FSchM3LNDescLong">
								<span style="width:6mm"/> through  5 and 7 through 11.
							</div>
							<div class="sty1120FSchM3LNDescLong" style="height:5mm">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignBankDefSect18825c4Ind"/>
									</xsl:call-template>
									<input type="checkbox" alt="ForeignBankDefinedSect18825c4No" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignBankDefSect18825c4Ind"/>
											<xsl:with-param name="BackupName">IRS1120FSchM3ForeignBankDefinedSect18825c4No</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignBankDefSect18825c4Ind"/>
										<xsl:with-param name="BackupName">IRS1120FSchM3ForeignBankDefinedSect18825c4</xsl:with-param>
									</xsl:call-template>
									<span style="width:2mm"/>
									<b>No. </b>
								</label>
							    Complete the remainder of Part I as follows:
							</div>
							<div class="sty1120FSchM3LNDescLong">
								<span style="width:6.5mm"/>If B is "Yes," use the income statement described in B to complete lines 2 through 11.
							</div>
							<div class="sty1120FSchM3LNDescLong">
								<span style="width:6.5mm"/>If B is "No" and C is "Yes," use the income statement described in C to complete lines 2 through 11.
							</div>
							<div class="sty1120FSchM3LNDescLong">
								<span style="width:6.5mm"/>If B and C are "No" and D is "Yes," use the income statement described in D to complete lines 2 through 11.
							</div>
							<div class="sty1120FSchM3LNDescLong">
								<span style="width:6.5mm"/>If B, C, and D are "No," use the income statement described in the instructions to complete lines 2 through 11.
							</div>
						</div>
						<!--Line 2a-->
						<div style="width:187mm;height:5mm;">
						<div class="styLNLeftNumBoxSD " style="padding-top:1mm" >2a</div>
						<div class="sty1120FSchM3LNDescLong" style="padding-left:1mm" >Enter the income statement period: Beginning 
							<span class="sty1120FSchM3UnderlinedDate">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/IncomeStatementBeginningDt"/>
								</xsl:call-template>
							</span>
							<span> Ending </span>
							<span class="sty1120FSchM3UnderlinedDate">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/IncomeStatementEndingDt"/>
								</xsl:call-template>
							</span>
						</div>
						</div>
						<!--Line 2b-->
						<div style="width:187mm;height:13mm">
						<div class="styLNLeftNumBoxSD" style="padding-left:4mm;height:12mm">b</div>
						<div class="sty1120FSchM3LNDescLong" style="padding-left:1mm">
						 Has the corporation’s income statement been restated for the income statement period entered on line 2a?
					    </div>
						<div class="sty1120FSchM3LNDescLong">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/CorporationIncmStmtRestatedInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="CorporationIncomeStatementRestatedYes" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CorporationIncmStmtRestatedInd"/>
										<xsl:with-param name="BackupName">IRS1120FSchM3CorpIncomeStatementRestatedYes</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$FormData/CorporationIncmStmtRestatedInd"/>
									<xsl:with-param name="BackupName">IRS1120FSchM3CorpIncomeStatementRestated</xsl:with-param>
								</xsl:call-template>
								<span style="width:2mm"/>
								<b>Yes. </b>
							</label>
						     Attach an explanation and the amount of each item restated.
							    <xsl:if test="$FormData/CorporationIncmStmtRestatedInd">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/CorporationIncmStmtRestatedInd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="sty1120FSchM3LNDescLong">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/CorporationIncmStmtRestatedInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="CorporationIncomeStatementRestatedNo" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CorporationIncmStmtRestatedInd"/>
										<xsl:with-param name="BackupName">IRS1120FSchM3CorpIncomeStatementRestatedNo</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$FormData/CorporationIncmStmtRestatedInd"/>
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
						<div class="sty1120FSchM3LNDescLong" style="padding-left:1mm;height:7mm">
					     Has the corporation’s income statement been restated for any of the 5 income statement periods immediately <br/>preceding the period on line 2a?
						</div>
						<div class="sty1120FSchM3LNDescLong">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/CorpIncmStmtRestated5PrecInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="CorporationIncomeStatementRestated5PrecedingYes" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CorpIncmStmtRestated5PrecInd"/>
										<xsl:with-param name="BackupName">IRS1120FSchM3CorpIncmStmtRestated5PrecedingYes</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$FormData/CorpIncmStmtRestated5PrecInd"/>
									<xsl:with-param name="BackupName">IRS1120FSchM3CorpIncmStmtRestated5Preceding</xsl:with-param>
								</xsl:call-template>
								<span style="width:2mm"/>
								<b>Yes. </b>
							</label>
							 Attach an explanation and the amount of each item restated.
								<xsl:if test="$FormData/CorpIncmStmtRestated5PrecInd">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/CorpIncmStmtRestated5PrecInd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="sty1120FSchM3LNDescLong">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/CorpIncmStmtRestated5PrecInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="CorporationIncomeStatementRestated5PrecedingNo" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CorpIncmStmtRestated5PrecInd"/>
										<xsl:with-param name="BackupName">IRS1120FSchM3CorpIncmStmtRestated5PrecedingNo</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$FormData/CorpIncmStmtRestated5PrecInd"/>
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
									<xsl:with-param name="TargetNode" select="$FormData/CorpStkPubliclyTradedInd"/>
								</xsl:call-template>
								<input type="checkbox"  alt="CorporationStockPubliclyTradedYes" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CorpStkPubliclyTradedInd"/>
										<xsl:with-param name="BackupName">IRS1120FSchM3CorporationStockPubliclyTradedYes</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$FormData/CorpStkPubliclyTradedInd"/>
									<xsl:with-param name="BackupName">IRS1120FSchM3CorporationStockPubliclyTraded</xsl:with-param>
								</xsl:call-template>
								<span style="width:2mm"/>
								<b>Yes. </b>
							</label>
							 List exchange(s) and symbol
							<span style="width:2mm"/>
								<img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet"/>
							<span style="width:2mm"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/CorpStkPubliclyTradedInd"/>
							</xsl:call-template>
							<span class="sty1120FSchM3UText" style="width:36mm">
								<span style="width:1px"/>
							</span>
						</div>
						<div class="sty1120FSchM3LNDescLong">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/CorpStkPubliclyTradedInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="CorporationStockPubliclyTradedNo"  class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CorpStkPubliclyTradedInd"/>
										<xsl:with-param name="BackupName">IRS1120FSchM3CorporationStockPubliclyTradedNo</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$FormData/CorpStkPubliclyTradedInd"/>
									<xsl:with-param name="BackupName">IRS1120FSchM3CorporationStockPubliclyTraded</xsl:with-param>
								</xsl:call-template>
								<span style="width:2mm"/>
								<b>No. </b>
							</label>
						</div>
						</div>
						<!--Line 4-->
						<div style="width:187mm;height:8mm">
							<div class="sty1120FSchM3LN411LeftNumBoxSD" style="height:8mm;">4</div>
							<div class="sty1120FSchM3LN411Desc" style="height:8mm">
							Non-consolidated foreign corporation net income (loss) in U.S. dollars from the income statement
							<span style="float:left;">source identified in line 1
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>
						</div>
						<div class="sty1120FSchM3LN411RightNumBox" style="height:8mm;border-top-width:1px;padding-top:1mm">
							<br/>4</div>
							<div class="sty1120FSchM3LN411AmountBox" style="height:8mm;border-top-width:1px;padding-top:1mm">
								<br/>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 5-->
						<!-- Line 5a  -->
						<div style="width:187mm;height:5mm;">
							<div class="sty1120FSchM3LN411LeftNumBoxSD" style="height:5mm;">5a</div>
							<div class="sty1120FSchM3LN411Desc" style="height:5mm">
								<span style="float:left;">Net income from includible disregarded foreign entities not included on line 4	(attach statement)
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/NetIncomeDisregardedFrgnEntAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1120FSchM3LN411RightNumBox" style="height:5mm;padding-top:1.5mm">5a</div>
							<div class="sty1120FSchM3LN411AmountBox" style="height:5mm;border-top-width:0px;padding-top:1.5mm">						
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetIncomeDisregardedFrgnEntAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 5b-->
						<div style="width:187mm;height:4.4mm">
							<div class="sty1120FSchM3LN411LeftNumBoxSD" style="padding-left:4mm;padding-top:1mm">b</div>
							<div class="sty1120FSchM3LN411Desc">
								<span style="float:left;">Net loss from includible disregarded foreign entities not included on line 4 (attach statement)
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/NetLossFrgnDisregardedEntAmt"/>
									</xsl:call-template>
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
							</div>
							<div class="sty1120FSchM3LN411RightNumBox" style="height:5mm;padding-top:1.5mm">5b</div>
							<div class="sty1120FSchM3LN411AmountBox" style="height:5mm;;padding-top:1.5mm">
								(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetLossFrgnDisregardedEntAmt"/>
								</xsl:call-template>)
						    </div>
						</div>
						<!--Line 5c-->
						<div style="width:187mm;height:4.4mm">
							<div class="sty1120FSchM3LN411LeftNumBoxSD" style="padding-left:4mm;padding-top:1mm;">c</div>
							<div class="sty1120FSchM3LN411Desc">
								<span style="float:left;">Net income from includible disregarded U.S. entities not included on line 4 (attach statement)
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/NetIncomeDisregardedUSEntAmt"/>
									</xsl:call-template>
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
							</div>
							<div class="sty1120FSchM3LN411RightNumBox" style="height:5mm;;padding-top:1.5mm">5c</div>
							<div class="sty1120FSchM3LN411AmountBox" style="height:5mm;padding-top:1.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetIncomeDisregardedUSEntAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 5d-->
						<div style="width:187mm;height:4.4mm">
							<div class="sty1120FSchM3LN411LeftNumBoxSD" style="padding-left:4mm;padding-top:1mm;">d</div>
							<div class="sty1120FSchM3LN411Desc">
								<span style="float:left;">Net loss from includible disregarded U.S. entities not included on line 4 (attach statement)
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/NetLossDisregardedUSEntAmt"/>
									</xsl:call-template>
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
							</div>
							<div class="sty1120FSchM3LN411RightNumBox" style="height:5mm;padding-top:1.5mm">5d</div>
							<div class="sty1120FSchM3LN411AmountBox" style="height:5mm;;padding-top:1.5mm">
								(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetLossDisregardedUSEntAmt"/>
								</xsl:call-template>)
						    </div>
						</div>
						<!--Line 6-->
						<div style="width:187mm;height:4.4mm">
							<div class="sty1120FSchM3LN411LeftNumBoxSD" style="padding-top:1mm;">6</div>
							<div class="sty1120FSchM3LN411Desc">
								<span style="float:left;">Net income (loss) from foreign locations not included on line 4 (attach statement)
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/NetIncomeLossForeignLocAmt"/>
									</xsl:call-template>
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
							</div>
							<div class="sty1120FSchM3LN411RightNumBox" style="height:5mm;padding-top:1.5mm">6</div>
							<div class="sty1120FSchM3LN411AmountBox" style="height:5mm;padding-top:1.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetIncomeLossForeignLocAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 7-->
						<!--Line 7a-->
						<div style="width:187mm;height:4.4mm">
							<div class="sty1120FSchM3LN411LeftNumBoxSD" style="padding-top:1mm;">7a</div>
							<div class="sty1120FSchM3LN411Desc">
								<span style="float:left;">Net income of non-includible entities (attach statement)
							     	<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/NetIncomeNonIncludibleEntAmt"/>
									</xsl:call-template>
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
							</div>
							<div class="sty1120FSchM3LN411RightNumBox">7a</div>
							<div class="sty1120FSchM3LN411AmountBox">
								(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetIncomeNonIncludibleEntAmt"/>
								</xsl:call-template>)
							</div>
						</div>
						<!--Line 7b-->
						<div style="width:187mm;height:4.4mm">
							<div class="sty1120FSchM3LN411LeftNumBoxSD" style="padding-left:4mm;padding-top:1mm;">b</div>
							<div class="sty1120FSchM3LN411Desc">
								<span style="float:left;">Net loss of non-includible entities (attach statement)
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/NetLossNonIncludibleEntAmt"/>
									</xsl:call-template>
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
							</div>
							<div class="sty1120FSchM3LN411RightNumBox">7b</div>
							<div class="sty1120FSchM3LN411AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetLossNonIncludibleEntAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 8-->
						<div style="width:187mm;height:4.4mm">
							<div class="sty1120FSchM3LN411LeftNumBoxSD" style="padding-top:1mm;">8</div>
							<div class="sty1120FSchM3LN411Desc">
								<span style="float:left;">Adjustments to intercompany transactions (attach statement)
							         <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AdjustmentIntercompanyTransAmt"/>
									</xsl:call-template>
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
							</div>
							<div class="sty1120FSchM3LN411RightNumBox">8</div>
							<div class="sty1120FSchM3LN411AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AdjustmentIntercompanyTransAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 9-->
						<div style="width:187mm;height:4.4mm">
							<div class="sty1120FSchM3LN411LeftNumBoxSD" style="padding-top:1mm;">9</div>
							<div class="sty1120FSchM3LN411Desc">
								<span style="float:left;">Adjustments to reconcile income statement period to tax year (attach statement) 
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AdjRecnclIncmStmtYrToTYAmt"/>
									</xsl:call-template>
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
							</div>
							<div class="sty1120FSchM3LN411RightNumBox" style="height:5mm;padding-top:1mm;">9</div>
							<div class="sty1120FSchM3LN411AmountBox" style="height:5mm;padding-top:1mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AdjRecnclIncmStmtYrToTYAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 10-->
						<div style="width:187mm;height:4.4mm">
							<div class="sty1120FSchM3LN411LeftNumBoxSD" style="padding-left:0.8mm;padding-top:1mm;">10</div>
							<div class="sty1120FSchM3LN411Desc">
								<span style="float:left;">Other adjustments to reconcile to amount on line 11 (attach statement) 
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/OtherAdjustmentsToReconcileAmt"/>
									</xsl:call-template>
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
							</div>
							<div class="sty1120FSchM3LN411RightNumBox">10</div>
							<div class="sty1120FSchM3LN411AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherAdjustmentsToReconcileAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 11-->
						<div style="width:187mm;height:14mm">
							<div class="sty1120FSchM3LN411LeftNumBoxSD" style="height:6mm;padding-left:0.8mm">11</div>
							<div class="sty1120FSchM3LN411Desc" style="height:10mm">
								<b>Adjusted financial net income (loss) of non-consolidated foreign corporation.</b> Combine lines 4 through 10
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">............................</span>
							</div>
							<div class="sty1120FSchM3LN411RightNumBox" style="height:7mm;border-bottom-width:1;padding-top:3.5mm;">11</div>
							<div class="sty1120FSchM3LN411AmountBox" style="height:7mm;border-bottom-width:1;padding-top:3.5mm;">								
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AdjustedFinclNetIncmLossAmt"/>
								</xsl:call-template>
							</div>
							<div style="padding-left:8mm;">
								<b>Note.</b> Part I, line 11, must equal Part II, line 28, column (a) or Schedule M-1, line 1 (see instructions).
							</div>
						</div>
					</div>
					<!--End Lines 1-11-->
					<!--Begin Page 1 Footer-->
					<div style="width:187mm;clear:both;padding-top:0.5mm">
						<div style="width:105mm;" class="styGenericDiv">
							<b>For Paperwork Reduction Act Notice, see the Instructions for Form 1120-F.</b>
						</div>
						<div style="width:30mm;text-align:center;padding-left:1mm" class="styGenericDiv">Cat. No. 39667H</div>
						<div style="float:right;" class="styGenericDiv">
							<b>Schedule M-3 (Form 1120-F) 2019</b>
						</div>
					</div>
					<br/>
					<div class="pageEnd"/>
					<!-- End Page 1 Footer-->
					<p style="page-break-before:always"/>
					<!--BEGIN PAGE 2-->
					<!--Page 2 Header-->
					<div class="styTBB" style="width:187mm">
					<div>Schedule M-3 (Form 1120-F) 2019</div>
						<div style="float:right;clear:none">
							Page <span style="font-size:8pt;font-weight:bold">2</span>
						</div>						
					</div>
					<!--Begin Name/EIN-->
					<div style="width:187mm">
						<div class="styTableCell" style="width:135mm;float:left;height:10mm;text-align:left">
						 Name of corporation
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
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
					<div class="styBB" style="width:187mm;border-top-width:0px;">
						<div class="styPartName" style="height:4mm;">Part II</div>
						<div class="styPartDesc" style="height:7mm;font-size:7.5pt;">
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
										<span style="width:8mm;height:20mm;"/>
									</th>
									<th class="sty1120FSchM3TableCellText" style="font-weight:bold;font-size:8pt;text-align:left" scope="col">Income (Loss) Items</th>
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
									<td class="sty1120FSchM3TableCellNum" style="padding-left:1mm">&#160;&#160;1</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<div class="sty1120FSchM3RightFloat">
									    </div>
										<span style="float:left;">Gross receipts</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGrossReceipts/IncomeLossPerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGrossReceipts/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGrossReceipts/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGrossReceipts/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGrossReceipts/IncomeLossPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 2-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="padding-left:1mm">&#160;&#160;2</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										Cost of goods sold (attach statement)
												<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCostOfGoodsSold"/>
											</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCostOfGoodsSold/IncomeLossPerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCostOfGoodsSold/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCostOfGoodsSold/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCostOfGoodsSold/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCostOfGoodsSold/IncomeLossPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 3a-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="padding-left:1mm">&#160;&#160;3a</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<div class="sty1120FSchM3RightFloat">
									    </div>
										<span style="float:left;">Dividends from foreign entities</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtDividendsFromFrgnEnt/IncomeLossPerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtDividendsFromFrgnEnt/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtDividendsFromFrgnEnt/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtDividendsFromFrgnEnt/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtDividendsFromFrgnEnt/IncomeLossPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 3b-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="padding-left:3mm">&#160;b</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<div class="sty1120FSchM3RightFloat">
									    </div>
										<span style="float:left;">Dividends from U.S. entities</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtDividendsFromUSEnt/IncomeLossPerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtDividendsFromUSEnt/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtDividendsFromUSEnt/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtDividendsFromUSEnt/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtDividendsFromUSEnt/IncomeLossPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 3c-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="padding-left:3mm;padding-bottom:0.5mm">&#160;c</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">Substitute dividend payments received</span>
		                           	<!-- Dotted Line -->
	                         		<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtDivEquivalentPymtRcvd/IncomeLossPerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtDivEquivalentPymtRcvd/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtDivEquivalentPymtRcvd/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtDivEquivalentPymtRcvd/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtDivEquivalentPymtRcvd/IncomeLossPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 4a-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:8mm;padding-top:0;padding-bottom:3mm">&#160;&#160;4a</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										Interest income excluding interest equivalents
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtIntIncmExclEquivlnts/IncomeLossPerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtIntIncmExclEquivlnts/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtIntIncmExclEquivlnts/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtIntIncmExclEquivlnts/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtIntIncmExclEquivlnts/IncomeLossPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 4b-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="padding-left:3.4mm">&#160;b</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">Substitute interest payments received</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtSubstituteIntPymtRcvd/IncomeLossPerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtSubstituteIntPymtRcvd/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtSubstituteIntPymtRcvd/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtSubstituteIntPymtRcvd/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtSubstituteIntPymtRcvd/IncomeLossPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 4c-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="padding-left:3.4mm;padding-top:0.5mm">&#160;c</td>
									<td class="sty1120FSchM3TableCellText" style="font-size:6pt;padding-top:0.5mm" scope="row">
										<div class="sty1120FSchM3RightFloat"/>
										<span style="float:left;font-size:7pt">Interest equivalents not included on line 4b</span>
										<!-- Dotted Line -->
										<!--<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>-->
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtIntEquivlntsNotRpt/IncomeLossPerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtIntEquivlntsNotRpt/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtIntEquivlntsNotRpt/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtIntEquivlntsNotRpt/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtIntEquivlntsNotRpt/IncomeLossPerTaxReturnAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGrossRentalIncome/IncomeLossPerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGrossRentalIncome/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGrossRentalIncome/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGrossRentalIncome/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGrossRentalIncome/IncomeLossPerTaxReturnAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGrossRoyaltyIncome/IncomeLossPerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGrossRoyaltyIncome/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGrossRoyaltyIncome/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGrossRoyaltyIncome/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGrossRoyaltyIncome/IncomeLossPerTaxReturnAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtFeeCommissionIncome/IncomeLossPerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtFeeCommissionIncome/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtFeeCommissionIncome/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtFeeCommissionIncome/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtFeeCommissionIncome/IncomeLossPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 8-->
								<tr>
								<td class="sty1120FSchM3TableCellNumDD" style="height:8mm;padding-top:0;padding-bottom:3mm">&#160;&#160;8 </td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										Income (loss) from equity method 
										<span style="float:left;">corporations</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtIncmLossEqtyMthdCorp/IncomeLossPerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtIncmLossEqtyMthdCorp/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtIncmLossEqtyMthdCorp/PermanentDifferenceAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtNetIncmLossUSPrtshp/IncomeLossPerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtNetIncmLossUSPrtshp/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtNetIncmLossUSPrtshp/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtNetIncmLossUSPrtshp/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtNetIncmLossUSPrtshp/IncomeLossPerTaxReturnAmt"/>
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
												<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtNetIncmLossFrgnPrtshp"/>
											</xsl:call-template>
										</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtNetIncmLossFrgnPrtshp/IncomeLossPerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtNetIncmLossFrgnPrtshp/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtNetIncmLossFrgnPrtshp/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtNetIncmLossFrgnPrtshp/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtNetIncmLossFrgnPrtshp/IncomeLossPerTaxReturnAmt"/>
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
												<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtNetIncmLossPassEnt"/>
											</xsl:call-template>
										</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
										<span style="width:.5mm"/>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtNetIncmLossPassEnt/IncomeLossPerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtNetIncmLossPassEnt/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtNetIncmLossPassEnt/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtNetIncmLossPassEnt/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtNetIncmLossPassEnt/IncomeLossPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 12-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:8mm;padding-top:0;padding-bottom:3mm">12</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										Items relating to reportable transactions (attach statement)
										<span style="width:0.6mm"/>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtItemRltngRprtbleTrans"/>
										</xsl:call-template>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtItemRltngRprtbleTrans/IncomeLossPerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtItemRltngRprtbleTrans/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtItemRltngRprtbleTrans/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtItemRltngRprtbleTrans/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtItemRltngRprtbleTrans/IncomeLossPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 13-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD">13</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">Hedging transactions</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtHedgingTransactions/IncomeLossPerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtHedgingTransactions/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtHedgingTransactions/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtHedgingTransactions/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtHedgingTransactions/IncomeLossPerTaxReturnAmt"/>
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
										<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtMarkMrktIncmSect475a/IncomeLossPerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtMarkMrktIncmSect475a/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtMarkMrktIncmSect475a/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtMarkMrktIncmSect475a/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtMarkMrktIncmSect475a/IncomeLossPerTaxReturnAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtMarkMrktIncmSec475d3B/IncomeLossPerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtMarkMrktIncmSec475d3B/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtMarkMrktIncmSec475d3B/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtMarkMrktIncmSec475d3B/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtMarkMrktIncmSec475d3B/IncomeLossPerTaxReturnAmt"/>
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
										<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtMarkMrktIncmSect475e/IncomeLossPerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtMarkMrktIncmSect475e/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtMarkMrktIncmSect475e/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtMarkMrktIncmSect475e/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtMarkMrktIncmSect475e/IncomeLossPerTaxReturnAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtMarkMrktIncmSect475f/IncomeLossPerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtMarkMrktIncmSect475f/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtMarkMrktIncmSect475f/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtMarkMrktIncmSect475f/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtMarkMrktIncmSect475f/IncomeLossPerTaxReturnAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGainLossSect988Trans/IncomeLossPerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGainLossSect988Trans/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGainLossSect988Trans/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGainLossSect988Trans/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGainLossSect988Trans/IncomeLossPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 16a-->
								<tr>
								<td class="sty1120FSchM3TableCellNumDD" style="height:8mm;padding-top:0;padding-bottom:3mm;">16a</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										Interest income from global securities <br/>dealing
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtIntIncmGlblSecDealing/IncomeLossPerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtIntIncmGlblSecDealing/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtIntIncmGlblSecDealing/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtIntIncmGlblSecDealing/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtIntIncmGlblSecDealing/IncomeLossPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 16b-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="padding-left:4mm">b</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">Dividends from global securities dealing</span>
										<!-- Dotted Line -->
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtDivGlblSecDealing/IncomeLossPerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtDivGlblSecDealing/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtDivGlblSecDealing/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtDivGlblSecDealing/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtDivGlblSecDealing/IncomeLossPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 16c-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="height:16mm;padding-left:4mm;padding-top:0;padding-bottom:10mm">c</td>
									<td class="sty1120FSchM3TableCellText" style="height:16mm" scope="row">
									   Gains (losses) and other fixed and determinable, annual, or periodic income from global securities dealing not
										<span style="float:left;padding-top:1mm;">included on lines 16a and 16b
												<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGainLossGlblSecDealng"/>
											</xsl:call-template>
										</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;padding-top:1mm;">..</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:12mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGainLossGlblSecDealng/IncomeLossPerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:12mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGainLossGlblSecDealng/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:12mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGainLossGlblSecDealng/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:12mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGainLossGlblSecDealng/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="padding-top:12mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGainLossGlblSecDealng/IncomeLossPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 17-->
								<tr>
								<td class="sty1120FSchM3TableCellNumDD" style="height:8mm;padding-top:0;padding-bottom:3mm;">17</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										Sales versus lease (for sellers and/or <br/> lessors)
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtSalesVersusLease/IncomeLossPerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm" >
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtSalesVersusLease/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtSalesVersusLease/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtSalesVersusLease/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtSalesVersusLease/IncomeLossPerTaxReturnAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtSect481aAdjustments/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtSect481aAdjustments/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtSect481aAdjustments/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtSect481aAdjustments/IncomeLossPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 19-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD">19</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">Unearned/deferred revenue</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtUnearnedDefrdRevenue/IncomeLossPerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtUnearnedDefrdRevenue/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtUnearnedDefrdRevenue/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtUnearnedDefrdRevenue/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtUnearnedDefrdRevenue/IncomeLossPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 20-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:8mm;padding-top:0;padding-bottom:2mm">20</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										Original issue discount, imputed interest, <br/> and phantom income
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOrigIssDscntAddnlItem/IncomeLossPerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOrigIssDscntAddnlItem/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOrigIssDscntAddnlItem/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOrigIssDscntAddnlItem/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOrigIssDscntAddnlItem/IncomeLossPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 21a-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:12mm;padding-top:0;padding-bottom:9mm;">21a</td>
									<td class="sty1120FSchM3TableCellText" style="height:12mm" scope="row">
										Income statement gain/loss on sale, exchange, abandonment, worthlessness, or other disposition of assets other than
										<span style="float:left;">inventory and pass-through entities</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:8mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IncmStmtGainLossDisposAst/IncomeLossPerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:8mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IncmStmtGainLossDisposAst/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:8mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IncmStmtGainLossDisposAst/PermanentDifferenceAmt"/>
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
								<td class="sty1120FSchM3TableCellNumDD" style="height:8mm;padding-top:0;padding-bottom:5mm">&#160;&#160;&#160;&#160;b</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										Gross capital gains from Schedule D, excluding amounts from pass-through entities
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:5mm;background-color:lightgrey;border-bottom-width:0">
										<br/>
										<span style="width:1px"/>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:5mm;border-bottom-width:0">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGroCapGainsFromSchD/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:5mm;border-bottom-width:0">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGroCapGainsFromSchD/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:5mm;border-bottom-width:0">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGroCapGainsFromSchD/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:8mm;padding-top:5mm;border-bottom-width:0">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGroCapGainsFromSchD/IncomeLossPerTaxReturnAmt"/>
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
							<b>Schedule M-3 (Form 1120-F) 2019</b>
						</div>
					</div>
					<br/>
					<!-- End Page 2 Footer-->
					<!--BEGIN PAGE 3-->
					<p style="page-break-before:always"/>
					<!--Page 3 Header-->
					<div class="styTBB" style="width:187mm">
					<div>Schedule M-3 (Form 1120-F) 2019</div>
						<div style="float:right;clear:none">
							Page <span style="font-size:8pt;font-weight:bold">3</span>
						</div>						
					</div>
					<!--Begin Name/EIN-->
					<div style="width:187mm">
						<div class="styTableCell" style="width:135mm;float:left;height:10mm;text-align:left">
							Name of corporation
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
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
					<div class="styBB" style="width:187mm;border-top-width:0px;">
						<div class="styPartName" style="height:4mm">Part II</div>
						<div class="styPartDesc" style="height:7mm;font-size:7.5pt">
						   Reconciliation of Net Income (Loss) per Income Statement of Non-Consolidated Foreign<br/>
						   Corporations With Taxable Income per Return 
						   <span style="font-weight:normal"> (see instructions) <i>(continued from page 2)</i></span>
						</div>
					</div>
					<!--BEGIN Part II Table-->
					<div  style="width:187mm">
						<!--Part II Table Header-->
						<table cellpadding="0" cellspacing="0" style="width:187mm">
							<tbody>
								<tr>
									<th class="sty1120FSchM3TableCellNum" scope="col">
										<span style="width:8mm;height:20mm;"/>
									</th>
									<th class="sty1120FSchM3TableCellText" style="font-weight:bold;font-size:8pt;text-align:left" scope="col">Income (Loss) Items</th>
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
									<td class="sty1120FSchM3TableCellNum" style="height:12mm;padding-left:1mm;padding-top:0;padding-bottom:10mm;">21c</td>
									<td class="sty1120FSchM3TableCellText" style="padding-bottom:1mm" scope="row">
										Gross capital losses from Schedule D, excluding amounts from pass-through entities, abandonment losses, and
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
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGroCapLossesFromSchD/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:7mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGroCapLossesFromSchD/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:7mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGroCapLossesFromSchD/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="padding-top:7mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGroCapLossesFromSchD/IncomeLossPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 21d-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="padding-left:4mm;padding-top:0;padding-bottom:8.5mm;">d</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										Net gain/loss reported on Form 4797, line 17, excluding amounts from pass-through entities, abandonment losses, and 
										<span style="float:left;"> worthless stock losses</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:7mm;background-color:lightgrey;border-bottom-width:0">
										<br/>
										<span style="width:1px"/>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:7mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGainLossRptOnForm4797/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:7mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGainLossRptOnForm4797/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:7mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGainLossRptOnForm4797/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="padding-top:7mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGainLossRptOnForm4797/IncomeLossPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 21e-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="padding-left:4mm">e</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">Abandonment losses</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="background-color:lightgrey;border-bottom-width:0">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtAbandonmentLosses/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtAbandonmentLosses/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtAbandonmentLosses/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtAbandonmentLosses/IncomeLossPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 21f-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="padding-left:4mm;padding-bottom:3mm;">f</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										Worthless stock losses (attach statement)
									    <xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtWorthlessStockLosses"/>
										</xsl:call-template>
										<!--HINT:Dotted Line is comment out because the push pen appeals on a separate line -->
										<!-- Dotted Line -->
										<!--<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>-->
									</td>
									
									<td class="sty1120FSchM3TableCellAmount" style="background-color:lightgrey;border-bottom-width:0">
										<br/>
										<span style="width:1px"/>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtWorthlessStockLosses/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtWorthlessStockLosses/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtWorthlessStockLosses/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtWorthlessStockLosses/IncomeLossPerTaxReturnAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOthGainLossDisposAst/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOthGainLossDisposAst/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOthGainLossDisposAst/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOthGainLossDisposAst/IncomeLossPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 22-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:8mm;padding-top:0;padding-bottom:4mm;">22</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										Capital loss limitation and carryforward <br/> used										
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="padding-top:1mm;background-color:lightgrey;border-bottom-width:0">
										<br/>
										<span style="width:1px"/>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCapLossLimitCfwdUsed/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCapLossLimitCfwdUsed/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCapLossLimitCfwdUsed/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCapLossLimitCfwdUsed/IncomeLossPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 23-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:12mm;padding-top:0;padding-bottom:6mm">23</td>
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
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGroECINoUSBookedLiab/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:12mm;padding-top:5mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGroECINoUSBookedLiab/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:12mm;padding-top:5mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGroECINoUSBookedLiab/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:12mm;padding-top:5mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtGroECINoUSBookedLiab/IncomeLossPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 24-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:8mm;padding-top:0;padding-bottom:3mm">24</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										Other income (loss) items with differences (attach statement) 
										    <xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOtherItemsDifferences"/>
											</xsl:call-template>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm;border-bottom-width:1px;">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOtherItemsDifferences/IncomeLossPerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm;border-bottom-width:1px;">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOtherItemsDifferences/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm;border-bottom-width:1px;">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOtherItemsDifferences/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm;border-bottom-width:1px;">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOtherItemsDifferences/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:8mm;padding-top:1mm;border-bottom-width:1px;">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOtherItemsDifferences/IncomeLossPerTaxReturnAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtTotalIncomeLossItems/IncomeLossPerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtTotalIncomeLossItems/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtTotalIncomeLossItems/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtTotalIncomeLossItems/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtTotalIncomeLossItems/IncomeLossPerTaxReturnAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtTotExpenseDedItems/IncomeLossPerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtTotExpenseDedItems/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtTotExpenseDedItems/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtTotExpenseDedItems/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtTotExpenseDedItems/IncomeLossPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 27-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:6mm">27</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">Other items with no differences</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="border-bottom-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOthItemsNoDifferences/IncomeLossPerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="background-color:lightgrey;border-bottom-width1;border-right-width:1px;">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="background-color:lightgrey;border-bottom-width:1px;border-right-width:1px;">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="border-bottom-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOthItemsNoDifferences/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="border-bottom-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOthItemsNoDifferences/IncomeLossPerTaxReturnAmt"/>
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
										<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtReconciliationTotals/IncomeLossPerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtReconciliationTotals/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtReconciliationTotals/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtReconciliationTotals/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtReconciliationTotals/IncomeLossPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Part II Table Note-->
								<tr  style="border-bottom-width:1px">
									<td class="sty1120FSchM3TableCellNum">
										<span style="width:7mm;border-bottom-width:1px"/>
									</td>
									<td colspan="6" style="font-size:7pt;border-bottom-width:10px;">
										<b>Note.</b> Line 28, column (a), must equal Part I, line 11, and column (e) 
										must equal Form 1120-F, page 4, line 29.
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--END Part II Table-->
					<!--END PART II-->
					<!--BEGIN -->
					<!--Part III Header-->
					<div class="styBB" style="width:187mm;border-top-width:1px">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc" style="height:7.5mm">
							Reconciliation of Net Income (Loss) per Income Statement of Non-Consolidated Foreign Corporations<br/>
							 With Taxable Income per Return 
							<span style="font-weight:normal">  (see instructions)</span>
						</div>
					</div>
					<!--Begin Part III Table-->
					<div class="styTBB" style="width:187mm">
						<!--Part III Table Header-->
						<table cellpadding="0" cellspacing="0" style="width:187mm">
							<tbody>
								<tr>
									<th class="sty1120FSchM3TableCellNum" scope="col">
										<span style="width:8mm;height:20mm;"/>
									</th>
									<th class="sty1120FSchM3TableCellText" style="font-weight:bold;font-size:8pt;text-align:left" scope="col">Expense/Deduction Items</th>
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
										<br/>Deduction per <br/>Tax Return</th>
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
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtUSCurrIncmTxExpns/ExpensePerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtUSCurrIncmTxExpns/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtUSCurrIncmTxExpns/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtUSCurrIncmTxExpns/OtherPermanentDifferenceAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtUSDefrdIncmTxExpns/ExpensePerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtUSDefrdIncmTxExpns/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtUSDefrdIncmTxExpns/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtUSDefrdIncmTxExpns/OtherPermanentDifferenceAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtNonUSCurrIncmTxExpns/ExpensePerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtNonUSCurrIncmTxExpns/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtNonUSCurrIncmTxExpns/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtNonUSCurrIncmTxExpns/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtNonUSCurrIncmTxExpns/DeductionPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 4-->
								<tr>
									<td class="sty1120FSchM3TableCellNum">4</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
									Non-U.S. deferred income tax expense
									<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtNonUSDefrdIncmTxExpns/ExpensePerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtNonUSDefrdIncmTxExpns/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtNonUSDefrdIncmTxExpns/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtNonUSDefrdIncmTxExpns/OtherPermanentDifferenceAmt"/>
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
										<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtNonUSWithholdingTaxes/ExpensePerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtNonUSWithholdingTaxes/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtNonUSWithholdingTaxes/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtNonUSWithholdingTaxes/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtNonUSWithholdingTaxes/DeductionPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 6-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="height:8mm;padding-top:0;padding-bottom:3mm">6</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										Compensation with section 162(m) <br/>
										<span style="float:left;"> limitation</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCompWithSect162mLmt/ExpensePerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCompWithSect162mLmt/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCompWithSect162mLmt/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCompWithSect162mLmt/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCompWithSect162mLmt/DeductionPerTaxReturnAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtSalariesOtherBaseComp/ExpensePerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtSalariesOtherBaseComp/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtSalariesOtherBaseComp/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtSalariesOtherBaseComp/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtSalariesOtherBaseComp/DeductionPerTaxReturnAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtStockOptionExpense/ExpensePerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtStockOptionExpense/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtStockOptionExpense/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtStockOptionExpense/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtStockOptionExpense/DeductionPerTaxReturnAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOtherEquityBasedComp/ExpensePerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOtherEquityBasedComp/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOtherEquityBasedComp/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOtherEquityBasedComp/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOtherEquityBasedComp/DeductionPerTaxReturnAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtMealsAndEntertainment/ExpensePerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtMealsAndEntertainment/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtMealsAndEntertainment/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtMealsAndEntertainment/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtMealsAndEntertainment/DeductionPerTaxReturnAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtFinesAndPenalties/ExpensePerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtFinesAndPenalties/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtFinesAndPenalties/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtFinesAndPenalties/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtFinesAndPenalties/DeductionPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 12-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:8mm;padding-top:0;padding-bottom:3mm">12</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										Judgments, damages, awards, and similar 
										<span style="float:left;">costs</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:2mm;border-bottom-width:0">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtJudgmentsAwrdSmlrCost/ExpensePerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:2mm;border-bottom-width:0">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtJudgmentsAwrdSmlrCost/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:2mm;border-bottom-width:0">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtJudgmentsAwrdSmlrCost/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:2mm;border-bottom-width:0">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtJudgmentsAwrdSmlrCost/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:9mm;padding-top:2mm;border-bottom-width:0">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtJudgmentsAwrdSmlrCost/DeductionPerTaxReturnAmt"/>
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
							<b>Schedule M-3 (Form 1120-F) 2019</b>
						</div>
					</div>
					<br/>
					<div class="pageEnd"/>
					<!-- End Page 3 Footer-->
					<p style="page-break-before:always"/>
					<!--BEGIN PAGE 4-->
					<!--Page 4 Header-->
					<div class="styTBB" style="width:187mm">
					<div>Schedule M-3 (Form 1120-F) 2019</div>
						<div style="float:right;clear:none">
							Page <span style="font-size:8pt;font-weight:bold">4</span>
						</div>						
					</div>
					<!--Begin Name/EIN-->
					<div style="width:187mm">
						<div class="styTableCell" style="width:135mm;float:left;height:10mm;text-align:left;border-bottom-width:0px">
							Name of corporation
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styTableCell" style="width:52mm;border-right-width:0px;padding-left:2mm;float:left;height:10mm;text-align:left;border-bottom-width:0px">
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
					<div class="styBB" style="width:187mm;border-top-width:1px">
						<div class="styPartName" style="height:4mm">Part III</div>
						<div class="styPartDesc" style="height:7.5mm">
							Reconciliation of Net Income (Loss) per Income Statement of Non-Consolidated Foreign<br/>
							Corporations With Taxable Income per Return 
							<span style="font-weight:normal"> (see instructions)<i> (continued from page 3)</i></span>
						</div>
					</div>
					<!--Begin Part III Table-->
					<div class="styTBB" style="width:187mm">
						<!--Part III Table Header-->
						<table cellpadding="0" cellspacing="0" style="width:187mm">
							<tbody>
								<tr>
									<th class="sty1120FSchM3TableCellNum" scope="col">
										<span style="width:8mm;height:20mm;"/>
									</th>
									<th class="sty1120FSchM3TableCellText" style="font-weight:bold;font-size:8pt;text-align:left" scope="col">Expense/Deduction Items</th>
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
										<br/>Deduction per <br/>Tax Return</th>
								</tr>								
								<tr>
									<!--Line 13-->
									<td class="sty1120FSchM3TableCellNumDD">13</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">Pension and profit-sharing</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtPensionProfitSharing/ExpensePerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtPensionProfitSharing/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtPensionProfitSharing/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtPensionProfitSharing/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtPensionProfitSharing/DeductionPerTaxReturnAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOthPostRetireBenefits/ExpensePerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOthPostRetireBenefits/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOthPostRetireBenefits/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOthPostRetireBenefits/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOthPostRetireBenefits/DeductionPerTaxReturnAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtDeferredCompensation/ExpensePerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtDeferredCompensation/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtDeferredCompensation/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtDeferredCompensation/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtDeferredCompensation/DeductionPerTaxReturnAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCharitableContri/ExpensePerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCharitableContri/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCharitableContri/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCharitableContri/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCharitableContri/DeductionPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 17-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:12mm;padding-top:0;padding-bottom:5mm">17</td>
									<td class="sty1120FSchM3TableCellText" style="height:12mm" scope="row">
										Section 162(r)-FDIC premiums paid by certain large financial institutions (see instructions)
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:12mm;padding-top:5mm;">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Sect162rFDICPremPdLgFinclInstn/ExpensePerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>									<td class="sty1120FSchM3TableCellAmount" style="height:12mm;padding-top:5mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Sect162rFDICPremPdLgFinclInstn/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:12mm;padding-top:5mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Sect162rFDICPremPdLgFinclInstn/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:12mm;padding-top:5mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Sect162rFDICPremPdLgFinclInstn/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:12mm;padding-top:5mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Sect162rFDICPremPdLgFinclInstn/DeductionPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 18-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:12mm;padding-top:0;padding-bottom:6mm">18</td>
									<td class="sty1120FSchM3TableCellText" style="height:12mm" scope="row">
										Current year acquisition or reorganization investment banking fees, legal and
										<span style="float:left;"> accounting fees</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:12mm;padding-top:5mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCYAcquisReorgFees/ExpensePerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:12mm;padding-top:5mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCYAcquisReorgFees/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:12mm;padding-top:5mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCYAcquisReorgFees/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:12mm;padding-top:5mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCYAcquisReorgFees/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:12mm;padding-top:5mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCYAcquisReorgFees/DeductionPerTaxReturnAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCYAcquisReorgOthCosts/ExpensePerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCYAcquisReorgOthCosts/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCYAcquisReorgOthCosts/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCYAcquisReorgOthCosts/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtCYAcquisReorgOthCosts/DeductionPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 20-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD">20</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">Amortization/impairment of goodwill</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtAmortizationGoodwill/ExpensePerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtAmortizationGoodwill/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtAmortizationGoodwill/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtAmortizationGoodwill/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtAmortizationGoodwill/DeductionPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 21-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:8mm;padding-top:0;padding-bottom:3mm">21</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										Amortization of acquisition, reorganization,
										<span style="float:left;"> and start-up costs</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtAmortzAcquisReorgCost/ExpensePerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtAmortzAcquisReorgCost/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtAmortzAcquisReorgCost/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtAmortzAcquisReorgCost/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtAmortzAcquisReorgCost/DeductionPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 22-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD">22</td>
									<td class="sty1120FSchM3TableCellText"  scope="row">
										Other amortization or impairment write-offs
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOthAmortzWriteOffs/ExpensePerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOthAmortzWriteOffs/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOthAmortzWriteOffs/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOthAmortzWriteOffs/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOthAmortzWriteOffs/DeductionPerTaxReturnAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtDepreciation/ExpensePerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtDepreciation/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtDepreciation/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtDepreciation/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtDepreciation/DeductionPerTaxReturnAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtBadDebtExpense/ExpensePerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtBadDebtExpense/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtBadDebtExpense/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtBadDebtExpense/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtBadDebtExpense/DeductionPerTaxReturnAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtPurchaseVersusLease/ExpensePerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtPurchaseVersusLease/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtPurchaseVersusLease/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtPurchaseVersusLease/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtPurchaseVersusLease/DeductionPerTaxReturnAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtIntExpensePerBooks/ExpensePerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtIntExpensePerBooks/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtIntExpensePerBooks/PermanentDifferenceAmt"/>
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
										Interest expense under Regulations section 1.882-5 (from Schedule I (Form 1120-F), line 23)
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
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
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtIntExpnsUndSect18825/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:12mm;padding-top:5mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtIntExpnsUndSect18825/DeductionPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 26c-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="height:12mm;padding-left:4mm;padding-top:0;padding-bottom:6mm">c</td>
									<td class="sty1120FSchM3TableCellText" style="height:12mm" scope="row">
										Regulations section 1.882-5 allocation amount subject to deferral or disallowance (from Schedule I (Form 1120-F), line 24d)
										<!-- Dotted Line -->
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:12mm;padding-top:8mm;background-color:lightgrey">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:12mm;padding-top:8mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtSect18825AllocnDfrl/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<!-- Defect 127425 10/29/18 WT: added Font-size to align this data field -->
									<td class="sty1120FSchM3TableCellAmount" style="height:12mm;padding-right:0mm;padding-top:8mm;font-size:5.9pt;">
										(
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtSect18825AllocnDfrl/PermanentDifferenceAmt"/>
										</xsl:call-template>)
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:12mm;padding-top:8mm;background-color:lightgrey;">
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:12mm;padding-top:8mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtSect18825AllocnDfrl/DeductionPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 26d-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:4mm;padding-left:4mm;padding-top:0;">d</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">Substitute interest payments</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
									</td>	
									<td class="sty1120FSchM3TableCellAmount" style="height:4mm;padding-top:0mm">
										
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtUSSrceSubstIntPymt/ExpensePerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:4mm;padding-top:0mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtUSSrceSubstIntPymt/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:4mm;padding-top:0mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtUSSrceSubstIntPymt/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:4mm;padding-top:0mm">
									<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtUSSrceSubstIntPymt/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:4mm;padding-top:01mm">
									<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtUSSrceSubstIntPymt/DeductionPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 26e-->
								<tr>
									<td class="sty1120FSchM3TableCellNum" style="height:8mm;padding-left:4mm;padding-top:0;padding-bottom:3mm">e</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										Interest equivalents (for example, guarantee 
										<span style="float:left;"> fees) not included on line 26d</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtInterestEquivalents/ExpensePerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtInterestEquivalents/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtInterestEquivalents/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtInterestEquivalents/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:8mm;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtInterestEquivalents/DeductionPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 27-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD">27</td>
									<td class="sty1120FSchM3TableCellText" scope="row">
										<span style="float:left;">Substitute dividend payments</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtDivEquivalentPayments/ExpensePerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtDivEquivalentPayments/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtDivEquivalentPayments/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtDivEquivalentPayments/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtDivEquivalentPayments/DeductionPerTaxReturnAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtFeeAndCommissionExpns/ExpensePerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtFeeAndCommissionExpns/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtFeeAndCommissionExpns/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtFeeAndCommissionExpns/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtFeeAndCommissionExpns/DeductionPerTaxReturnAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtRentalExpense/ExpensePerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtRentalExpense/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtRentalExpense/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtRentalExpense/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtRentalExpense/DeductionPerTaxReturnAmt"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtRoyaltyExpense/ExpensePerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtRoyaltyExpense/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtRoyaltyExpense/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtRoyaltyExpense/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtRoyaltyExpense/DeductionPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 31-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="padding-bottom:12mm;">31</td>
									<td class="sty1120FSchM3TableCellText" style="height:16mm;" scope="row">										
									  Expenses allocable to effectively connected income under Regulations section 1.861-8 from home office or other books that do not give  rise to U.S. booked liabilities (from Schedule H (Form 1120-F), line 20)
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
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
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtExpnssAllcblECI/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:16mm;padding-top:12mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtExpnssAllcblECI/DeductionPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 32-->
								<tr>
									<td class="sty1120FSchM3TableCellNumDD" style="height:8mm;padding-top:0;padding-bottom:2.8mm">32</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm" scope="row">
										Other expense/deduction items with
										<span style="float:left;">differences (attach statement)
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOthExpnsDedItemsDiff"/>
											</xsl:call-template>
										</span>
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:5mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOthExpnsDedItemsDiff/ExpensePerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:5mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOthExpnsDedItemsDiff/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:5mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOthExpnsDedItemsDiff/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:5mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOthExpnsDedItemsDiff/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:8mm;padding-top:5mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtOthExpnsDedItemsDiff/DeductionPerTaxReturnAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 33 -->
								<tr style="padding-bottom:0.5mm">
									<td class="sty1120FSchM3TableCellNumDD" style="height:8mm;padding-top:0;padding-bottom:6mm">33</td>
									<td class="sty1120FSchM3TableCellText" style="height:8mm">
										<b>Total expense/deduction items.</b>
										Combine lines 1 through 32. Enter here and on Part II, line 26 
										<!-- Dotted Line -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:4mm;border-bottom-width:0">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtTotExpnsAndDedItems/ExpensePerIncomeStmtAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:4mm;border-bottom-width:0">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtTotExpnsAndDedItems/TemporaryDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:4mm;border-bottom-width:0">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtTotExpnsAndDedItems/PermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmount" style="height:8mm;padding-top:4mm;border-bottom-width:0">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtTotExpnsAndDedItems/OtherPermanentDifferenceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FSchM3TableCellAmountLastCol" style="height:8mm;padding-top:4mm;border-bottom-width:0">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonCnsldtTotExpnsAndDedItems/DeductionPerTaxReturnAmt"/>
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
							<b>Schedule M-3 (Form 1120-F) 2019</b>
						</div>
					</div>
					<br/>
					<div class="pageEnd"/>
					<!-- End Page 4 Footer-->
					<p style="page-break-before:always"/>
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