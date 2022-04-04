<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS8994Style.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS8994" />
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge" />
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)" />
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache" />
				<meta http-equiv="Cache-Control" content="no-cache" />
				<meta http-equiv="Expires" content="0" />
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private" />
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
				<meta name="Description" content="IRS Form 8994" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8994Style" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form8994">
					<xsl:call-template name="DocumentHeader" />
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:30mm;height:18.5mm;border-right:2px solid black;">
							Form <span class="styFN" style="font-size:18pt;">8994</span> 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							(Rev. January 2021)<br />
							<span class="styAgency" style="margin-top:6px;">
								Department of the Treasury
								<br />
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:127mm;height:18.5mm;">
							<span class="styFMT" style="font-size:11pt;padding-top:1mm;padding-bottom:1mm;">Employer Credit for Paid Family and Medical Leave</span>
							<br />
							<br />
							<span style="font-weight:bold;">
								&#9658;Attach to your tax return.
							</span><br />
							<span style="font-weight:bold;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form8994</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:30mm;height:18.5mm;border-left:2px solid black;">
							<div class="styOMB" style="height:8mm;font-size:6pt;padding-top:2mm;">OMB No. 1545-2282</div>
							<br />
							<div style="margin-left:0mm;text-align:left;font-size:6pt;padding-top:0.5mm;margin-top:2mm;">
								Attachment<br />Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">994</span>
							</div>
						</div>
						<!-- Filer information section -->
						<div class="styStdDiv" style="border-top:2px solid black;">
							<div class="styNameBox" style="width:135mm;">Name(s) shown on return
								<br />
								<xsl:call-template name="PopulateFilerName">
									<xsl:with-param name="TargetNode" select="$FormData" />
								</xsl:call-template>
							</div>
							<div class="styEINBox" style="width:52mm;padding-left:0.5mm;font-weight:normal;">
								<strong>Identifying number</strong>
								<br />
								<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
							</div>
						</div>
						<!-- End of header -->
						<!-- Begin body -->
						<!-- Line A -->
						<div class="styStdDiv" style="border-top:2px solid black;">
							<br />
							<span class="styLNLeftLtrBox">A</span>
							<span class="styLNDesc" style="width:179mm;height:auto;">
								Do you have a written policy providing for at least 2 weeks of annual paid family and medical leave for your qualifying<br />
								employee(s) to whom wages are paid (prorated for any part-time employees)? See instructions.
								<br />
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/WrttnPlcy2WksPdFamMedLvInd" />
									</xsl:call-template>
									<div style="width:5mm;height:4mm;float:left;">
										<input type="checkbox"  class="styCkbox" style="margin-top:3px;margin-bottom:0px;margin-right:0px;margin-left:0px;">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/WrttnPlcy2WksPdFamMedLvInd" />
												<xsl:with-param name="BackupName">IRS8994WrttnPlcy2WksPdFamMedLvInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</div>
									<div style="width:173mm;height:4mm;float:left;padding-top:0.4mm;">
										<label style="font-weight:bold;margin-right:8px;">
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$FormData/WrttnPlcy2WksPdFamMedLvInd" />
												<xsl:with-param name="BackupName">IRS8994WrttnPlcy2WksPdFamMedLvInd</xsl:with-param>
											</xsl:call-template>
											Yes.
										</label>
									</div>
									<br />
									<div style="width:5mm;height:4mm;float:left;">
										<input type="checkbox" class="styCkbox" style="margin-top:3px;margin-bottom:0px;margin-right:0px;margin-left:0px;">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/WrttnPlcy2WksPdFamMedLvInd" />
												<xsl:with-param name="BackupName">IRS8994WrttnPlcy2WksPdFamMedLvInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</div>
									<div style="padding-top:0.7mm;">
										<label style="font-weight:bold;margin-right:8px;">
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="$FormData/WrttnPlcy2WksPdFamMedLvInd" />
												<xsl:with-param name="BackupName">IRS8994WrttnPlcy2WksPdFamMedLvInd</xsl:with-param>
											</xsl:call-template>
											No. <span style="font-weight:normal;">Stop. Do not file Form 8994 (see instructions for an exception that may apply to a partnership or S corporation).</span>
										</label>
									</div>
								</span>
							</span>
						</div>
						<!-- Line B -->
						<div class="styStdDiv">
							<br />
							<span class="styLNLeftLtrBox">B</span>
							<span class="styLNDesc" style="width:179mm;height:auto;">
								Does the written policy provide paid family and medical leave of at least 50% of the wages normally paid to a qualifying<br/>
								employee? See instructions.
								<br />
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/WrttnPlcyPdFamMedLv50PctInd" />
									</xsl:call-template>
									<div style="width:5mm;height:4mm;float:left;">
										<input type="checkbox"  class="styCkbox" style="margin-top:3px;margin-bottom:0px;margin-right:0px;margin-left:0px;">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/WrttnPlcyPdFamMedLv50PctInd" />
												<xsl:with-param name="BackupName">IRS8994WrttnPlcyPdFamMedLv50PctInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</div>
									<div style="width:173mm;height:4mm;float:left;padding-top:0.4mm;">
										<label style="font-weight:bold;margin-right:8px;">
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$FormData/WrttnPlcyPdFamMedLv50PctInd" />
												<xsl:with-param name="BackupName">IRS8994WrttnPlcyPdFamMedLv50PctInd</xsl:with-param>
											</xsl:call-template>
											Yes.
										</label>
									</div>
									<br />
									<div style="width:5mm;height:4mm;float:left;">
										<input type="checkbox" class="styCkbox" style="margin-top:3px;margin-bottom:0px;margin-right:0px;margin-left:0px;">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/WrttnPlcyPdFamMedLv50PctInd" />
												<xsl:with-param name="BackupName">IRS8994WrttnPlcyPdFamMedLv50PctInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</div>
									<div style="padding-top:0.7mm;">
										<label style="font-weight:bold;margin-right:8px;">
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="$FormData/WrttnPlcyPdFamMedLv50PctInd" />
												<xsl:with-param name="BackupName">IRS8994WrttnPlcyPdFamMedLv50PctInd</xsl:with-param>
											</xsl:call-template>
											No. <span style="font-weight:normal;">Stop. Do not file Form 8994 (see instructions for an exception that may apply to a partnership or S corporation).</span>
										</label>
									</div>
								</span>
							</span>
						</div>
						<!-- Line C -->
						<div class="styStdDiv">
							<br />
							<span class="styLNLeftLtrBox">C</span>
							<span class="styLNDesc" style="width:179mm;height:auto;">
								Did you pay family and medical leave to at least one qualifying employee during the tax year? See instructions.
								<br />
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/PaidFamilyMedLeaveInd" />
									</xsl:call-template>
									<div style="width:5mm;height:4mm;float:left;">
										<input type="checkbox"  class="styCkbox" style="margin-top:3px;margin-bottom:0px;margin-right:0px;margin-left:0px;">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/PaidFamilyMedLeaveInd" />
												<xsl:with-param name="BackupName">IRS8994PaidFamilyMedLeaveInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</div>
									<div style="width:173mm;height:4mm;float:left;padding-top:0.4mm;">
										<label style="font-weight:bold;margin-right:8px;">
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$FormData/PaidFamilyMedLeaveInd" />
												<xsl:with-param name="BackupName">IRS8994PaidFamilyMedLeaveInd</xsl:with-param>
											</xsl:call-template>
											Yes.
										</label>
									</div>
									<br />
									<div style="width:5mm;height:4mm;float:left;">
										<input type="checkbox" class="styCkbox" style="margin-top:3px;margin-bottom:0px;margin-right:0px;margin-left:0px;">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/PaidFamilyMedLeaveInd" />
												<xsl:with-param name="BackupName">IRS8994PaidFamilyMedLeaveInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</div>
									<div style="padding-top:0.7mm;">
										<label style="font-weight:bold;margin-right:8px;">
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="$FormData/PaidFamilyMedLeaveInd" />
												<xsl:with-param name="BackupName">IRS8994PaidFamilyMedLeaveInd</xsl:with-param>
											</xsl:call-template>
											No. <span style="font-weight:normal;">Stop. Do not file Form 8994 (see instructions for an exception that may apply to a partnership or S corporation).</span>
										</label>
									</div>
								</span>
							</span>
						</div>
						<!-- Line D -->
						<div class="styStdDiv">
							<br />
							<span class="styLNLeftLtrBox">D</span>
							<span class="styLNDesc" style="width:179mm;height:auto;">
								If you employed at least one qualifying employee who was not covered by the Family Medical and Leave Act, did you<br />
								include in your written policy and otherwise comply with "non-interference" language? See instructions.
								<br />
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/WrttnPolicyNoninterferenceInd" />
									</xsl:call-template>
									<div style="width:5mm;height:4mm;float:left;">
										<input type="checkbox"  class="styCkbox" style="margin-top:3px;margin-bottom:0px;margin-right:0px;margin-left:0px;">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/WrttnPolicyNoninterferenceInd" />
												<xsl:with-param name="BackupName">IRS8994WrttnPolicyNoninterferenceInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</div>
									<div style="width:173mm;height:4mm;float:left;padding-top:0.4mm;">
										<label style="font-weight:bold;margin-right:8px;">
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$FormData/WrttnPolicyNoninterferenceInd" />
												<xsl:with-param name="BackupName">IRS8994WrttnPolicyNoninterferenceInd</xsl:with-param>
											</xsl:call-template>
											Yes.
										</label>
									</div>
									<br />
									<div style="width:5mm;height:4mm;float:left;">
										<input type="checkbox" class="styCkbox" style="margin-top:3px;margin-bottom:0px;margin-right:0px;margin-left:0px;">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/WrttnPolicyNoninterferenceInd" />
												<xsl:with-param name="BackupName">IRS8994WrttnPolicyNoninterferenceInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</div>
									<div style="padding-top:0.7mm;">
										<label style="font-weight:bold;margin-right:8px;">
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="$FormData/WrttnPolicyNoninterferenceInd" />
												<xsl:with-param name="BackupName">IRS8994WrttnPolicyNoninterferenceInd</xsl:with-param>
											</xsl:call-template>
											No. <span style="font-weight:normal;">Stop. Do not file Form 8994 (see instructions for an exception that may apply to a partnership or S corporation).</span>
										</label>
									</div>
								</span>
							</span>
						</div>
						<br />
						<div class="styStdDiv" style="border-top:2px solid black;">
							<div class="styLNAmountBox" style="float:right;border-left:1px solid black;border-bottom:0px solid black;" />
							<div class="styLNLeftNumBoxSD" style="float:right;border-left:1px solid black;background-color:lightgrey;" />
						</div>
						<!-- Line 1 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">1</div>
							<div class="styLNDesc" style="width:139mm;height:13mm;">
								Enter the total paid family and medical leave credit figured for wages paid during your tax year<br />
								to your qualifying employee(s) while on family and medical leave (if you use the Paid Family and<br />
								Medical Leave Credit Worksheet, the total from column (d)). See instructions for the adjustment you<br />
								must make to your deduction for salaries and wages
								<span class="sty8994DotLn">..................</span>
							</div>
							<div class="styLNRightNumBox" style="height:13mm;padding-top:0mm;padding-bottom:0mm;">
								<div class="styStdDiv" style="height:9.5mm;width:auto;background-color:lightgrey;" />
								1
							</div>
							<div class="styLNAmountBox" style="height:13mm;">
								<br />
								<br />
								<br />
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotPaidFamilyMedicalLeaveCrAmt" />
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 2 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">2</div>
							<div class="styLNDesc" style="width:139mm;height:7mm;">
								Employer credit for paid family and medical leave from partnerships and S corporations (see<br />
								instructions)
								<span class="sty8994DotLn">..............................</span>
							</div>
							<div class="styLNRightNumBox" style="height:7mm;padding-top:0mm;padding-bottom:0mm;">
								<div class="styStdDiv" style="height:3.5mm;width:auto;background-color:lightgrey;" />
								2
							</div>
							<span class="styLNAmountBox" style="height:7mm;">
								<br />
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/EmplrCrPrtshpSCorpAmt" />
								</xsl:call-template>
							</span>
						</div>
						<!-- Line 3 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">3</div>
							<div class="styLNDesc" style="width:139mm;height:7mm;">
								Add lines 1 and 2. Partnerships and S corporations, report this amount on Schedule K. All others, report<br />
								this amount on Form 3800, Part III, line 4j
								<span class="sty8994DotLn">....................</span>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:7mm;padding-top:0mm;padding-bottom:0mm;">
								<div class="styStdDiv" style="height:3.5mm;width:auto;background-color:lightgrey;" />
								3
							</div>
							<span class="styLNAmountBoxNBB" style="height:7mm;">
								<br />
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/EmplrCrPdFamilyMedLeaveAmt" />
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- End body -->
					<!-- Form footer-->
					<div class="styStdDiv" style="border-top:2px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see separate instructions.</span>
						<span style="margin-left:20mm;font-size:6.5pt;">Cat. No. 37804G</span>
						<span style="float:right;font-weight:normal;font-size:6.5pt;">Form <span style="font-size:10pt;"><strong>8994</strong></span> (Rev. 1-2021)</span>
					</div>
					<!-- End form footer -->
					<!-- Additional Data title bar and button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<br/>
				</form>
			</body>
		</html>
	</xsl:template>	
</xsl:stylesheet>
