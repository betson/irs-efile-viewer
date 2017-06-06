<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1040ScheduleHStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form1040ScheduleHData" select="$RtnDoc/IRS1040ScheduleH"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
		    <meta http-equiv="X-UA-Compatible" content="IE=5"/>
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form1040ScheduleHData)"/>
					</xsl:call-template>
				</title>
				<!--  No Browser Caching  -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set  -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 1040ScheduleH"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					* {box-sizing:border-box;}
					input[type=checkbox] {box-sizing:content-box;}
					span {display:inline-block;}
				    <!-- Updated 5/22/2014 Per UWR111127 for R9.5 D2-->
				<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1040ScheduleHStyle"/>
						<xsl:call-template name="AddOnStyle"/>
				</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS1040ScheduleH">
					<!--  Begin Header section 1 -->
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;border-bottom-width:2px;">
						<div class="styFNBox" style="width:31mm;height:22mm;border-right-width:2px;padding-top:.5mm;">
							<div style="padding-top:1mm;">
								<span class="styFormNumber" style="font-size:12pt;">SCHEDULE H<br/>(Form 1040)</span>
							</div>
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData"/>
							</xsl:call-template>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service (99)</span>
						</div>
						<div class="styFTBox" style="width:125mm;">
							<!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
							<div class="styMainTitle" style="height:8mm;">
                Household Employment Taxes<br/>
								<span class="styNormalText" style="font-size:8pt;">
                  (For Social Security, Medicare, Withheld Income, and Federal Unemployment (FUTA) Taxes)<br/>
								</span>
							</div>
							<div class="styFST" style="height:5mm;font-size:7pt;text-align:center;">
								<span style="text-align:center;font-weight:bold;">
									<div style="width:100%;height:5mm;">
										<div style="width:100mm;height:5mm;">
											<img src="{$ImagePath}/1040ScheduleH_Bullet_Sm.gif" alt="SmallBullet"/> 
                      Attach to Form 1040, 1040NR, 1040-SS, or 1041.<br/>
											<img src="{$ImagePath}/1040ScheduleH_Bullet_Sm.gif" alt="SmallBullet"/> 
                      Information about Schedule H and its separate instructions is at <i>www.irs.gov/form1040.</i>
										</div>
									</div>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;border-left-width:2px;">
							<div class="styOMB" style="height:2mm;font-size:7pt;">OMB No. 1545-1971</div>
							<div class="styTY">20<span class="styTYColor">14</span>
							</div>
							<div style="margin-left:3mm;text-align:left;font-size:7pt;">
                Attachment<br/>Sequence No. 
                <span class="styBoldText" style="font-size:9pt;">44</span>
							</div>
						</div>
					</div>
					<!--  End Header section 1 -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:138mm;height:16mm;font-weight:normal;font-size:7pt;">
              Name of employer<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HouseholdEmployerNm"/>
							</xsl:call-template>
							<span style="width:3px;"/>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Employer Name Control</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/EmployerNameControlTxt"/>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="border-style: solid; border-color: black;border-width:0px 0px 1px 0px;width:49mm;height:8mm;font-size:7pt;float:right;padding:1px 0px 0px 0px;">
							<span style="padding-left:5px">Social security number<br/>
							</span>
							<span style="font-weight:normal;width:100%;text-align:center;">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/SSN"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styEINBox" style="width:49mm;height:8mm;font-size:7pt;padding-top:1px;">
							<span style="padding-left:5px">Employer identification number<br/>
							</span>
							<span style="font-weight:normal;padding-left:5px;width:100%;text-align:center;">
								<xsl:choose>
									<xsl:when test="$Form1040ScheduleHData/EmployerEIN">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/EmployerEIN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/AppliedForEINReasonCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!-- End Names and Identifying number section -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<div class="styTBB" style="width:187mm;">
						<div style="font-weight:bold;width:187mm;">Calendar year taxpayers having no household employees in 2014 do not have to complete this form for 2014.</div>
						<!-- Spacer -->
						<span style="width:2px;height:4mm;"/>
						<!-- A ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox">A</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:175mm;">
								<!-- Description -->
                Did you pay <span class="styBoldText">any one</span> household employee cash wages of $1,900 or more in 2014? (If any household employee was your<br/>
                spouse, your child under age 21, your parent, or anyone under age 18, see the line A instructions before you<br/>
                answer this question.)
                <br/>
								<br/>
								<!-- Checkboxes -->
								<div class="styIRS1040ScheduleHLNDesc" style="width:170mm;padding-left:0px;float:none;">
									<!-- Yes -->
									<div class="styIRS1040ScheduleHLNDesc" style="width:165mm;padding-left:0px;float:none;">
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplPdCashWageOverLmtCYInd"/>
											</xsl:call-template>
											<input type="checkbox" class="styCkbox">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplPdCashWageOverLmtCYInd"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleHDataHsldEmplPdCashWageOverLmtCYInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<label>
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplPdCashWageOverLmtCYInd"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleHDataHsldEmplPdCashWageOverLmtCYInd</xsl:with-param>
											</xsl:call-template>
											<span style="width:2mm;"/>
											<span class="styBoldText">Yes.</span> Skip lines B and C and go to line 1.
                  </label>
									</div>
									<!-- No -->
									<div class="styIRS1040ScheduleHLNDesc" style="width:165mm;padding-left:0px;">
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplPdCashWageOverLmtCYInd"/>
											</xsl:call-template>
											<input type="checkbox" class="styCkbox">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplPdCashWageOverLmtCYInd"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleHDataHsldEmplPdCashWageOverLmtCYInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<label>
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplPdCashWageOverLmtCYInd"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleHDataHsldEmplPdCashWageOverLmtCYInd</xsl:with-param>
											</xsl:call-template>
											<span style="width:2mm;"/>
											<span class="styBoldText">No.</span> Go to line B.
                  </label>
									</div>
								</div>
								<br/>
							</div>
						</div>
						<!-- B ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox">B</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:175mm;">
								<!-- Description -->
                Did you withhold federal income tax during 2014 for any household employee?
                <br/>
								<br/>
								<!-- Checkboxes -->
								<div class="styIRS1040ScheduleHLNDesc" style="width:170mm;padding-left:0px;float:none;">
									<!-- Yes -->
									<div class="styIRS1040ScheduleHLNDesc" style="width:165mm;padding-left:0px;float:none;">
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplFedIncmTaxWithheldInd"/>
											</xsl:call-template>
											<input type="checkbox" class="styCkbox">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplFedIncmTaxWithheldInd"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleHDataHsldEmplFedIncmTaxWithheldInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<label>
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplFedIncmTaxWithheldInd"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleHDataHsldEmplFedIncmTaxWithheldInd</xsl:with-param>
											</xsl:call-template>
											<span style="width:2mm;"/>
											<span class="styBoldText">Yes.</span> Skip line C and go to line 7.
                  </label>
									</div>
									<!-- No -->
									<div class="styIRS1040ScheduleHLNDesc" style="width:165mm;padding-left:0px;">
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplFedIncmTaxWithheldInd"/>
											</xsl:call-template>
											<input type="checkbox" class="styCkbox">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplFedIncmTaxWithheldInd"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleHDataHsldEmplFedIncmTaxWithheldInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<label>
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplFedIncmTaxWithheldInd"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleHDataHsldEmplFedIncmTaxWithheldInd</xsl:with-param>
											</xsl:call-template>
											<span style="width:2mm;"/>
											<span class="styBoldText">No.</span> Go to line C.
                  </label>
									</div>
								</div>
								<br/>
							</div>
						</div>
						<!-- C ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox">C</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:175mm;">
								<!-- Description -->
                Did you pay <span class="styBoldText">total</span> cash wages of $1,000 or more in <span class="styBoldText">any</span> calendar <span class="styBoldText">quarter</span> of 2013 or 2014 to <span class="styBoldText">all</span> household employees?<br/>
                (<span class="styBoldText">Do not</span> count cash wages paid in 2013 or 2014 to your spouse, your child under age 21, or your parent.)
                <br/>
								<br/>
								<!-- Checkboxes -->
								<div class="styIRS1040ScheduleHLNDesc" style="width:170mm;padding-left:0px;float:none;">
									<!-- No -->
									<div class="styIRS1040ScheduleHLNDesc" style="width:165mm;padding-left:0px;float:none;">
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplPdCashWageOvrLmtQtrInd"/>
											</xsl:call-template>
											<input type="checkbox" class="styCkbox">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplPdCashWageOvrLmtQtrInd"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleHDataHsldEmplPdCashWageOvrLmtQtrInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<label>
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplPdCashWageOvrLmtQtrInd"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleHDataHsldEmplPdCashWageOvrLmtQtrInd</xsl:with-param>
											</xsl:call-template>
											<span style="width:2mm;"/>
											<span class="styBoldText">No. Stop.</span> Do not file this schedule.
                    </label>
									</div>
									<!-- Yes -->
									<div class="styIRS1040ScheduleHLNDesc" style="width:165mm;padding-left:0px;float:none;">
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplPdCashWageOvrLmtQtrInd"/>
											</xsl:call-template>
											<input type="checkbox" class="styCkbox">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplPdCashWageOvrLmtQtrInd"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleHDataHsldEmplPdCashWageOvrLmtQtrInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<label>
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplPdCashWageOvrLmtQtrInd"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleHDataHsldEmplPdCashWageOvrLmtQtrInd</xsl:with-param>
											</xsl:call-template>
											<span style="width:2mm;"/>
											<span class="styBoldText">Yes.</span> Skip lines 1-9 and go to line 10.
										</label>
									</div>
								</div>
								<br/>
							</div>
						</div>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!--  Begin PART I -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Header -->
					<div style="width:187mm;" class="styBB">
						<!-- Top Spacer -->
						<span style="width:100%;height:2mm;"/>
						<!-- Content -->
						<div class="styPartName" style="width:15mm;">Part I</div>
						<div class="styPartDesc" style="padding-left:3mm;">
              Social Security, Medicare, and Federal Income Taxes
            </div>
						<!-- Bottom Spacer -->
						<span style="width:100%;height:2mm;"/>
					</div>
					<!-- Body -->
					<div style="width:187mm;" class="styTBB">
						<!-- (1) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styLNAmountBox" style="height:2mm;border-bottom-width:0px;float:right;"/>
							<div class="styLNRightNumBox" style="height:2mm;border-bottom-width:0px;float:right;background-color:lightgrey;"/>
						</div>
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox">1</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:98mm;">
                               <span style="float:left;">Total cash wages subject to social security tax</span>
                               <!--Dotted Line-->
                               <span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
							</div>
							<!-- Grey Box -->
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;float:right;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;float:right;background-color:lightgrey;"/>
							<!-- Box with content -->
							<div class="styLNAmountBox" style="height:2mm;float:right;padding-right:3px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/SocialSecurityTaxCashWagesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:2mm;float:right;">1</div>
						</div>
						<!-- (2) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styLNAmountBox" style="height:2mm;border-bottom-width:0px;float:right;"/>
							<div class="styLNRightNumBox" style="height:2mm;border-bottom-width:0px;float:right;"/>
						</div>
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox">2</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:138mm;">
                                <span style="float:left;">Social security tax. Multiply line 1 by 12.4% (.124)</span>
                                <!--Dotted Line-->
                                <span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
							</div>
							<!-- Box with content -->
							<div class="styLNAmountBox" style="height:2mm;float:right;padding-right:3px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/SocialSecurityTaxAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:2mm;float:right;">2</div>
						</div>
						<!-- (3) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styLNAmountBox" style="height:2mm;border-bottom-width:0px;float:right;"/>
							<div class="styLNRightNumBox" style="height:2mm;border-bottom-width:0px;float:right;background-color:lightgrey;"/>
						</div>
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox">3</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:98mm;">
                                 <span style="float:left;">Total cash wages subject to Medicare tax</span>
                                 <!--Dotted Line-->
                                <span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
							</div>
							<!-- Grey Box -->
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;float:right;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;float:right;background-color:lightgrey;"/>
							<!-- Box with content -->
							<div class="styLNAmountBox" style="height:2mm;float:right;padding-right:3px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/MedicareTaxCashWagesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:2mm;float:right;">3</div>
						</div>
						<!-- (4) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styLNAmountBox" style="height:2mm;border-bottom-width:0px;float:right;"/>
							<div class="styLNRightNumBox" style="height:2mm;border-bottom-width:0px;float:right;"/>
						</div>
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox">4</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:138mm;">
                                <span style="float:left;">Medicare tax. Multiply line 3 by 2.9% (.029)</span>
                                <!--Dotted Line-->
                                <span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
							</div>
							<!-- Box with content -->
							<div class="styLNAmountBox" style="height:2mm;float:right;padding-right:3px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/MedicareTaxWithheldAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:2mm;float:right;">4</div>
						</div>		
						<!-- (5) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styLNAmountBox" style="height:2mm;border-bottom-width:0px;float:right;"/>
							<div class="styLNRightNumBox" style="height:2mm;border-bottom-width:0px;float:right;background-color:lightgrey;"/>
						</div>
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox">5</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:98mm;">
                                <span style="float:left;">Total cash wages subject to Additional Medicare Tax withholding</span>
                                  <span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
                            </div>
                            <!-- Grey Box -->
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;float:right;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;float:right;background-color:lightgrey;"/>
							<!-- Box with content -->
							<div class="styLNAmountBox" style="height:2mm;float:right;padding-right:3px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/TotMedcrTaxCashWagesAddnlWhAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:2mm;float:right;">5</div>
						</div>
						<!-- (6) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styLNAmountBox" style="height:2mm;border-bottom-width:0px;float:right;"/>
							<div class="styLNRightNumBox" style="height:2mm;border-bottom-width:0px;float:right;"/>
						</div>
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox">6</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:138mm;">
                                <span style="float:left;">Additional Medicare Tax withholding (multiply line 5 by 0.9% (.009))</span>
                                <!--Dotted Line-->
                                <span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
							</div>
							<!-- Box with content -->
							<div class="styLNAmountBox" style="height:2mm;float:right;padding-right:3px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/AddnlMedicareTaxWithholdingAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:2mm;float:right;">6</div>
						</div>
						<!-- (7) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styLNAmountBox" style="height:2mm;border-bottom-width:0px;float:right;"/>
							<div class="styLNRightNumBox" style="height:2mm;border-bottom-width:0px;float:right;"/>
						</div>
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox">7</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:138mm;">
                                <span style="float:left;">Federal income tax withheld, if any</span>
                                <!--Dotted Line-->
                                <span class="styDotLn" style="float:right;padding-right:1mm;">.....................</span>
							</div>
							<!-- Box with content -->
							<div class="styLNAmountBox" style="height:2mm;float:right;padding-right:3px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/FederalIncomeTaxWithheldAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:2mm;float:right;">7</div>
						</div>
						<!-- (8) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styLNAmountBox" style="height:2mm;border-bottom-width:0px;float:right;"/>
							<div class="styLNRightNumBox" style="height:2mm;border-bottom-width:0px;float:right;"/>
						</div>
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox">8</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:122mm;">
								<span class="styBoldText">Total social security, Medicare, and federal income taxes.</span> Add lines 2, 4, 6, and 7
                <xsl:if test="$Form1040ScheduleHData/HsldEmplStateDisabilityPymtGrp/HsldEmplStateDisabilityPymtAmt">
									<span style="width:3px;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Household Employee State Disability Payment Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplStateDisabilityPymtGrp/HsldEmplStateDisabilityPymtAmt"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form1040ScheduleHData/HsldEmplStateDisabilityPymtGrp/HsldEmplStateDisabilityPymtCd">
									<span style="width:3px;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Household Employee State Disability Payment Code</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplStateDisabilityPymtGrp/HsldEmplStateDisabilityPymtCd"/>
									</xsl:call-template>
								</xsl:if>
							</div>
							<!-- Box with content -->
							<div class="styLNAmountBox" style="height:2mm;float:right;padding-right:3px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/TotSocSecMedcrAndFedIncmTaxAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:2mm;float:right;">8</div>
                                <!--Dotted Line-->
                                <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
						</div>
						<!-- (9) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem"/>
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox">9</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:175mm;">
								<!-- Description -->
                Did you pay <span class="styBoldText">total</span> cash wages of $1,000 or more in <span class="styBoldText">any</span> calendar <span class="styBoldText">quarter</span> of 2013 or 2014 to <span class="styBoldText">all</span> household employees?<br/>
                (<span class="styBoldText">Do not</span> count cash wages paid in 2013 or 2014 to your spouse, your child under age 21, or your parent.)
                <br/>
								<br/>
								<!-- Checkboxes -->
								<div class="styIRS1040ScheduleHLNDesc" style="width:170mm;padding-left:0px;float:none;">
									<!-- No -->
									<div class="styIRS1040ScheduleHLNDesc" style="width:165mm;padding-left:0px;float:none;">
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplPdTotCashWageAnyQtrInd"/>
											</xsl:call-template>
											<input type="checkbox" class="styCkbox">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplPdTotCashWageAnyQtrInd"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleHDataHsldEmplPdTotCashWageAnyQtrInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<label>
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplPdTotCashWageAnyQtrInd"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleHDataHsldEmplPdTotCashWageAnyQtrInd</xsl:with-param>
											</xsl:call-template>
											<span style="width:2mm;"/>
											<span class="styBoldText">No. Stop.</span> Include the amount from line 8 above on Form 1040, line 60a. If you are not<br/>
											<span style="width:10mm"/>required to file Form 1040, see the line 9 instructions.
                    </label>
									</div>
									<!-- Yes -->
									<div class="styIRS1040ScheduleHLNDesc" style="width:165mm;padding-left:0px;float:none;">
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplPdTotCashWageAnyQtrInd"/>
											</xsl:call-template>
											<input type="checkbox" class="styCkbox">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplPdTotCashWageAnyQtrInd"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleHDataHsldEmplPdTotCashWageAnyQtrInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<label>
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplPdTotCashWageAnyQtrInd"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleHDataHsldEmplPdTotCashWageAnyQtrInd</xsl:with-param>
											</xsl:call-template>
											<span style="width:2mm;"/>
											<span class="styBoldText">Yes.</span> Go to line 10.
                    </label>
									</div>
								</div>
								<br/>
							</div>
						</div>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;clear:both;font-size:6.5pt;">
						<div style="float:left;">
							<span class="styBoldText">For Privacy Act and Paperwork Reduction Act Notice, see the instructions.</span>
							<span style="text-align:center;width:30mm;">Cat. No. 12187K</span>
						</div>
						<div style="float:right;">
							<span class="styBoldText">Schedule H (Form 1040) 2014</span>
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<!-- BEGIN Page Header -->
					<div class="styTBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Schedule H (Form 1040) 2014</div>
						<div style="float:right;">
                            Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!--  Begin PART II -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Header -->
					<div style="width:187mm;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;">Part II</div>
						<div class="styPartDesc" style="padding-left:3mm;">Federal Unemployment (FUTA) Tax</div>
					</div>
					<!-- Body -->
					<div style="width:187mm;" class="styBB">
						<div style="width:187mm;" class="styNBB">
							<!-- Yes/No Headers ////////////////////////////////////////////////////////////-->
							<div class="styIRS1040ScheduleHLineItem">
								<div class="styLNRightNumBoxNBB" style="height:2mm;float:right;">No</div>
								<div class="styLNRightNumBoxNBB" style="height:2mm;float:right;">Yes</div>
							</div>
							<!-- (10) ////////////////////////////////////////////////////////////-->
							<div class="styIRS1040ScheduleHLineItem">
								<div class="styIRS1040ScheduleHLNLeftNumBox" style="text-align:left;">10</div>
								<div class="styIRS1040ScheduleHLNDesc" style="width:148mm;">
                                     Did you pay unemployment contributions to only one state? (If you paid contributions to a credit reduction
                                     <span style="float:left;">state, see instructions and check "No.")</span>
                                     <!--Dotted Line-->
									 <span class="styDotLn" style="float:right;padding-right:1mm;">.....................</span>
								</div>
								<div class="styIRS1040ScheduleHLNDesc" style="width:30mm;float:right;padding:0px 0px 0px 0px;">
									<div class="styLNRightNumBox" style="height:100%;float:right;"/>
									<div class="styLNRightNumBox" style="height:100%;float:right;"/>
									<div class="styLNRightNumBox" style="height:100%;float:right;border-width:0px 0px 1px 0px"/>
								</div>
								<div class="styIRS1040ScheduleHLNDesc" style="width:30mm;float:right;padding:0px 0px 0px 0px;">
									<!-- No Checkbox -->
									<div class="styLNRightNumBox" style="height:100%;float:right;">
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplPaidOnlyOneStateInd"/>
											</xsl:call-template>
											<input type="checkbox" class="styCkbox">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplPaidOnlyOneStateInd"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleHDataUnemplPaidOnlyOneStateInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<label>
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplPaidOnlyOneStateInd"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleHDataUnemplPaidOnlyOneStateInd</xsl:with-param>
											</xsl:call-template>
										</label>
									</div>
									<!-- Yes Checkbox -->
									<div class="styLNRightNumBox" style="height:100%;float:right;">
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplPaidOnlyOneStateInd"/>
											</xsl:call-template>
											<input type="checkbox" class="styCkbox">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplPaidOnlyOneStateInd"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleHDataUnemplPaidOnlyOneStateInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<label>
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplPaidOnlyOneStateInd"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleHDataUnemplPaidOnlyOneStateInd</xsl:with-param>
											</xsl:call-template>
										</label>
									</div>
									<!-- Number Box -->
									<div class="styLNRightNumBox" style="height:100%;float:right;">10</div>
								</div>
							</div>
							<!-- (11) ////////////////////////////////////////////////////////////-->
							<div class="styIRS1040ScheduleHLineItem">
								<div class="styIRS1040ScheduleHLNLeftNumBox" style="text-align:left;">11</div>
								<div class="styIRS1040ScheduleHLNDesc" style="width:153.5mm;">
								  Did you pay all state unemployment contributions for 2014 by April 15, 2015? Fiscal year filers, see instructions
								</div>
								<div class="styIRS1040ScheduleHLNDesc" style="width:25.5mm;float:right;padding:0px 0px 0px 0px;">
									<!-- No Checkbox -->
									<div class="styLNRightNumBox" style="height:100%;float:right;">
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/PayAllStateUnemplContriInd"/>
											</xsl:call-template>
											<input type="checkbox" class="styCkbox">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/PayAllStateUnemplContriInd"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleHDataPayAllStateUnemplContriInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<label>
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/PayAllStateUnemplContriInd"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleHDataPayAllStateUnemplContriInd</xsl:with-param>
											</xsl:call-template>
										</label>
									</div>
									<!-- Yes Checkbox -->
									<div class="styLNRightNumBox" style="height:100%;float:right;">
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/PayAllStateUnemplContriInd"/>
											</xsl:call-template>
											<input type="checkbox" class="styCkbox">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/PayAllStateUnemplContriInd"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleHDataPayAllStateUnemplContriInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<label>
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/PayAllStateUnemplContriInd"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleHDataPayAllStateUnemplContriInd</xsl:with-param>
											</xsl:call-template>
										</label>
									</div>
									<!-- Number Box -->
									<div class="styLNRightNumBox" style="height:100%;float:right;">11</div>
								</div>
							</div>
							<!-- (12) ////////////////////////////////////////////////////////////-->
							<div class="styIRS1040ScheduleHLineItem">
								<div class="styIRS1040ScheduleHLNLeftNumBox" style="text-align:left;">12</div>
								<div class="styIRS1040ScheduleHLNDesc" style="width:150mm;">
                                    <span style="float:left;">Were all wages that are taxable for FUTA tax also taxable for your state&#8221;s unemployment tax?</span>
                                     <!--Dotted Line-->
									 <span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
								</div>
								<div class="styIRS1040ScheduleHLNDesc" style="width:28mm;float:right;padding:0px 0px 0px 0px;">
									<!-- No Checkbox -->
									<div class="styLNRightNumBox" style="height:100%;float:right;">
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/TxblFUTAWagesAlsoTxblUnemplInd"/>
											</xsl:call-template>
											<input type="checkbox" class="styCkbox">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/TxblFUTAWagesAlsoTxblUnemplInd"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleHDataTxblFUTAWagesAlsoTxblUnemplInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<label>
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/TxblFUTAWagesAlsoTxblUnemplInd"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleHDataTxblFUTAWagesAlsoTxblUnemplInd</xsl:with-param>
											</xsl:call-template>
										</label>
									</div>
									<!-- Yes Checkbox -->
									<div class="styLNRightNumBox" style="height:100%;float:right;">
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/TxblFUTAWagesAlsoTxblUnemplInd"/>
											</xsl:call-template>
											<input type="checkbox" class="styCkbox">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/TxblFUTAWagesAlsoTxblUnemplInd"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleHDataTxblFUTAWagesAlsoTxblUnemplInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<label>
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/TxblFUTAWagesAlsoTxblUnemplInd"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleHDataTxblFUTAWagesAlsoTxblUnemplInd</xsl:with-param>
											</xsl:call-template>
										</label>
									</div>
									<!-- Number Box -->
									<div class="styLNRightNumBox" style="height:100%;float:right;">12</div>
								</div>
							</div>
							<!-- Spacer ///////////////////////////////////////////////////////-->
							<div class="styIRS1040ScheduleHLineItem">
								<br/>
								<br/>
							</div>
							<!-- Instructions ////////////////////////////////////////////////-->
							<div class="styIRS1040ScheduleHLineItem">
								<span class="styBoldText">Next:</span> If you checked the <span class="styBoldText">"Yes"</span> box on <span class="styBoldText">all</span> the lines above, complete Section A.<br/>
								<span style="width:31px;"/>If you checked the <span class="styBoldText">"No"</span> box on <span class="styBoldText">any</span> of the lines above, skip Section A and complete Section B.
              </div>
						</div>
					</div>
					<!-- Section A -->
					<!-- Header -->
					<div style="width:187mm;" class="styBB">
						<div class="styIRS1040ScheduleHLineItem" style="text-align:center;font-size:8pt;">
							<span class="styBoldText">Section A</span>
						</div>
					</div>
					<!-- Body -->
					<div style="width:187mm;" class="styBB">
						<!-- (13) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox" style="text-align:left;">13</div>
							<!-- Description -->
							<div class="styIRS1040ScheduleHLNDesc" style="width:90mm;">
								Name of the state where you paid unemployment contributions
								<span style="width:3px;"/>
								<img src="{$ImagePath}/1040ScheduleH_Bullet_Sm.gif" alt="SmallBullet"/>
							</div>
							<!-- Name of State text field -->
							<div class="styIRS1040ScheduleHLNDesc" style="width:40mm;border-bottom:1px dashed black;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundSingleStateGroup/StateCd"/>
								</xsl:call-template>
							</div>
							<!-- Amount Box -->
							<div class="styIRS1040ScheduleHLNDesc" style="height:100%;width:45mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styLNAmountBoxNBB" style="height:100%;width:33mm;float:right;padding:0px 0px 0px 0px;"/>
								<div class="styLNRightNumBoxNBB" style="height:100%;background-color:lightgrey;float:right;padding:0px 0px 0px 0px;"/>
							</div>
						</div>
						<!-- Empty Amount Box /////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<!-- Amount Box -->
							<div class="styIRS1040ScheduleHLNDesc" style="width:45mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styLNAmountBoxNBB" style="height:100%;width:33mm;float:right;padding:0px 0px 0px 0px;"/>
								<div class="styLNRightNumBoxNBB" style="height:100%;background-color:lightgrey;float:right;padding:0px 0px 0px 0px;"/>
							</div>
						</div>
						<!-- Empty Amount Box /////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<!-- Amount Box -->
							<div class="styIRS1040ScheduleHLNDesc" style="width:45mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styLNAmountBoxNBB" style="height:100%;width:33mm;float:right;padding:0px 0px 0px 0px;"/>
								<div class="styLNRightNumBoxNBB" style="height:100%;background-color:lightgrey;float:right;padding:0px 0px 0px 0px;"/>
							</div>
						</div>
						<!-- (14) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox" style="text-align:left;">14</div>
							<!-- Description -->
							<div class="styIRS1040ScheduleHLNDesc" style="width:95mm;">
                Contributions paid to your state unemployment fund
              </div>
							<!-- Amount Box -->
							<div class="styIRS1040ScheduleHLNDesc" style="height:100%;width:83mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styLNAmountBoxNBB" style="height:100%;width:33mm;float:right;padding:0px 0px 0px 0px;"/>
								<div class="styLNRightNumBoxNBB" style="height:100%;background-color:lightgrey;float:right;padding:0px 0px 0px 0px;"/>
								<div class="styLNAmountBox" style="height:100%;width:33mm;float:right;padding:0px 2px 0px 0px;">
									<xsl:choose>
										<xsl:when test="$Form1040ScheduleHData/UnemplFundSingleStateGroup/ContriPaidToStateUnemplFundAmt">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundSingleStateGroup/ContriPaidToStateUnemplFundAmt"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="$Form1040ScheduleHData/UnemplFundSingleStateGroup/UnemploymentFundZeroRateCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundSingleStateGroup/UnemploymentFundZeroRateCd"/>
											</xsl:call-template>
										</xsl:when>
									</xsl:choose>
								</div>
								<div class="styLNRightNumBox" style="height:100%;float:right;padding:0px 0px 0px 0px;">14</div>
							</div>
						</div>
						<!-- (15) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox" style="text-align:left;">15</div>
							<!-- Description -->
							<div class="styIRS1040ScheduleHLNDesc" style="width:134mm;">
                                    <span style="float:left;">Total cash wages subject to FUTA tax</span>
                                    <!--Dotted Line-->
									 <span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
							</div>
							<!-- Amount Box -->
							<div class="styIRS1040ScheduleHLNDesc" style="height:100%;width:45mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styLNAmountBox" style="height:100%;width:33mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundSingleStateGroup/TotalCashWagesSubjFUTATaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="height:100%;float:right;padding:0px 0px 0px 0px;">15</div>
							</div>
						</div>
						<!-- (16) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox" style="text-align:left;">16</div>
							<!-- Description -->
							<div class="styIRS1040ScheduleHLNDesc" style="width:134mm;">
							 <span style="float:left;"><span class="styBoldText">FUTA tax.</span> Multiply line 15 by .6% (.006). Enter the result here, skip Section B, and go to line 25</span>
                               <!--Dotted Line-->
                             <span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
							</div>
							<!-- Amount Box -->
							<div class="styIRS1040ScheduleHLNDesc" style="height:100%;width:45mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styLNAmountBoxNBB" style="height:100%;width:33mm;float:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundSingleStateGroup/FUTATaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBoxNBB" style="height:100%;float:right;">16</div>
							</div>
						</div>
					</div>
					<!-- Section B -->
					<!-- Header -->
					<div style="width:187mm;" class="styBB">
						<div class="styIRS1040ScheduleHLineItem" style="text-align:center;font-size:8pt;">
							<span class="styBoldText">Section B</span>
						</div>
					</div>
					<!-- Body -->
					<div style="width:187mm;" class="styBB">
						<!-- (17) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox" style="text-align:left;">17</div>
							<!-- Description -->
							<div class="styIRS1040ScheduleHLNDesc" style="width:160mm;">
                              Complete all columns below that apply (if you need more space, see instructions):
                            </div>
							<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
							<div class="styGenericDiv" style="width:3.2mm;float:right;">
								<!-- button display logic -->
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundMultiStateGroup/UnemploymentStateTaxGroup"/>
									<xsl:with-param name="containerHeight" select="2"/>
									<xsl:with-param name="containerID" select=" 'UnemploymentStateTaxGroupDiv' "/>
								</xsl:call-template>
								<!-- end button display logic -->
							</div>
							<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
						</div>
					</div>
					<div class="styTableContainerNBB" id="UnemploymentStateTaxGroupDiv" style="width:187mm">
						<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
						<!--                          Table Start                                 -->
						<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
						<xsl:call-template name="SetInitialState"/>
						<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
						<table class="styTable" cellspacing="0" style="width:100%">
							<!-- ++++++++++++++++++++++++ Start: Table Headers ++++++++++++++++++++++ -->
							<thead class="styTableThead">
								<tr style="vertical-align:top;">
									<!-- (a) //////////////////////////////////// -->
									<th class="styIRS1040ScheduleHTableCellHeader" style="text-align:center;font-size: 6pt; width:7%;" scope="col">
										<span class="styBoldText">(a)</span>
										<span class="styNormalText">
											<br/>Name<br/>of<br/>state
                                        </span>
									</th>
									<!-- (b) //////////////////////////////////// -->
									<th class="styIRS1040ScheduleHTableCellHeader" style="text-align:center;font-size: 6pt; width:14%;" scope="col">
										<span class="styBoldText">(b)</span>
										<span class="styNormalText">
											<br/>Taxable wages (as<br/>defined in state act)
                                        </span>
									</th>
									<!-- (c) //////////////////////////////////// -->
									<th class="styIRS1040ScheduleHTableCellHeader" style="text-align:center;font-size: 6pt; width:20%;padding:0px 0px 0px 0px;" scope="col">
										<div class="styIRS1040ScheduleHLineItem" style="padding:0px 0px 0px 0px;width:100%;">
											<span class="styBoldText">(c)</span>
											<span class="styNormalText">
												<br/>State experience rate <br/>period
                      </span>
										</div>
										<br/>
										<span class="styNormalText;margin-bottom:0px;">
											<div class="styIRS1040ScheduleHLineItem" style="padding:0px 0px 0px 0px;width:100%;height:100%">
												<div class="styIRS1040ScheduleHLineItem" style="padding:0px 0px 0px 0px;float:left;width:49.8%;border-width:1px 0px 0px 0px;border-color:black;border-style:solid;height:100%;">
													<span class="styNormalText">From</span>
												</div>
												<div class="styIRS1040ScheduleHLineItem" style="padding:0px 0px 0px 0px;float:right;width:50%;border-width:1px 0px 0px 1px;border-color:black;border-style:solid;height:100%;">
													<span class="styNormalText">To</span>
												</div>
											</div>
										</span>
									</th>
									<!-- (d) //////////////////////////////////// -->
									<th class="styIRS1040ScheduleHTableCellHeader" style="text-align:center;font-size: 6pt; width:7%;" scope="col">
										<span class="styBoldText">(d)</span>
										<span class="styNormalText">
											<br/>State<br/>experience<br/>rate
                                        </span>
									</th>
									<!-- (e) //////////////////////////////////// -->
									<th class="styIRS1040ScheduleHTableCellHeader" style="text-align:center;font-size: 6pt; width:13%;" scope="col">
										<span class="styBoldText">(e)</span>
										<span class="styNormalText">
											<br/>Multiply col. (b)<br/>by .054
                                        </span>
									</th>
									<!-- (f) //////////////////////////////////// -->
									<th class="styIRS1040ScheduleHTableCellHeader" style="text-align:center;font-size: 6pt; width:13%;" scope="col">
										<span class="styBoldText">(f)</span>
										<span class="styNormalText">
											<br/>Multiply col. (b)<br/>by col. (d)
                                        </span>
									</th>
									<!-- (g) //////////////////////////////////// -->
									<th class="styIRS1040ScheduleHTableCellHeader" style="text-align:center;font-size: 6pt; width:13%;" scope="col">
										<span class="styBoldText">(g)</span>
										<span class="styNormalText">
											<br/>Subtract col. (f)<br/>from col. (e). If<br/>zero or less,<br/>enter -0-.
                                        </span>
									</th>
									<!-- (h) //////////////////////////////////// -->
									<th class="styIRS1040ScheduleHTableCellHeader" style="text-align:center;font-size: 6pt; width:13%;" scope="col">
										<span class="styBoldText">(h)</span>
										<span class="styNormalText">
											<br/>Contributions<br/>paid to state<br/>unemployment<br/>fund
                                        </span>
									</th>
								</tr>
							</thead>
							<!-- ++++++++++++++++++++++++ End: Table Headers +++++++++++++++++++++++ -->
							<tfoot/>
							<tbody>
								<!-- ++++++++++++++++++++++++++ Start  Populating +++++++++++++++++++++++ -->
								<xsl:for-each select="$Form1040ScheduleHData/UnemplFundMultiStateGroup/UnemploymentStateTaxGroup">
									<!--JMI: If the print parameter is not set to be Separated, or there are less elements than the-->
									<!--container height (4), execute-->
									<xsl:if test="($Print != $Separated) or (count($Form1040ScheduleHData/UnemplFundMultiStateGroup/UnemploymentStateTaxGroup) &lt;=2)">
										<tr style="font-size: 7pt;">
											<!-- (a) //////////////////////////////////// -->
											<td class="styIRS1040ScheduleHTableCell" style="font-size: 6pt; text-align:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="StateCd"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<!-- (b) //////////////////////////////////// -->
											<td class="styIRS1040ScheduleHTableCell" style="font-size: 6pt; text-align:right;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TxblWagesPaidStUnemplFundAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<!-- (c) //////////////////////////////////// -->
											<td class="styIRS1040ScheduleHTableCell" style="font-size: 6pt; text-align:center;padding:0px 0px 0px 0px;">
												<div class="styIRS1040ScheduleHLineItem" style="padding:0px 0px 0px 0px;width:100%;height:100%;">
													<div class="styIRS1040ScheduleHLineItem" style="padding:0px 0px 0px 0px;float:left;width:50%;text-align:center;border-width:0px 0px 0px 0px;border-style:solid;border-color:black;height:100%;">
														<xsl:call-template name="PopulateMonthDayYear">
															<xsl:with-param name="TargetNode" select="UnemplStateExprncRateFromDt"/>
														</xsl:call-template>
													</div>
													<div class="styIRS1040ScheduleHLineItem" style="padding:0px 0px 0px 0px;float:left;width:49%;text-align:center;border-width:0px 0px 0px 1px;border-style:solid;border-color:black;height:100%;">
														<xsl:call-template name="PopulateMonthDayYear">
															<xsl:with-param name="TargetNode" select="UnemplStateExprncRateToDt"/>
														</xsl:call-template>
													</div>
												</div>
											</td>
											<!-- (d) //////////////////////////////////// -->
											<td class="styIRS1040ScheduleHTableCell" style="font-size: 6pt; text-align:right;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="UnemploymentStateExperienceRt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<!-- (e) //////////////////////////////////// -->
											<td class="styIRS1040ScheduleHTableCell" style="font-size: 6pt; text-align:right;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="UnemploymentTaxCrAt54RateAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<!-- (f) //////////////////////////////////// -->
											<td class="styIRS1040ScheduleHTableCell" style="font-size: 6pt; text-align:right;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="UnemploymentTaxCrAtStateRtAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<!-- (g) //////////////////////////////////// -->
											<td class="styIRS1040ScheduleHTableCell" style="font-size: 6pt; text-align:right;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="UnemploymentAdditionalTaxCrAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<!-- (h) //////////////////////////////////// -->
											<td class="styIRS1040ScheduleHTableCell" style="font-size: 6pt; text-align:right;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ContriPaidToStateUnemplFundAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<!-- Table Filler Rows -->
								<!-- JMI: added: or.... -->
								<xsl:if test="count($Form1040ScheduleHData/UnemplFundMultiStateGroup/UnemploymentStateTaxGroup) &lt; 1 or ((count($Form1040ScheduleHData/UnemplFundMultiStateGroup/UnemploymentStateTaxGroup) &gt;2) and ($Print = $Separated))">
									<tr>
										<!-- (a) //////////////////////////////////// -->
										<td class="styIRS1040ScheduleHTableCell" style="width:7%;font-size: 6pt; text-align:center;">
											<span style="width:4px"/>
											<xsl:if test="((count($Form1040ScheduleHData/UnemplFundMultiStateGroup/UnemploymentStateTaxGroup) &gt;2) and ($Print = $Separated))">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundMultiStateGroup/UnemploymentStateTaxGroup"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<!-- (b) //////////////////////////////////// -->
										<td class="styIRS1040ScheduleHTableCell" style="width:14%;font-size: 6pt; text-align:center;">
											<span style="width:4px"/>
										</td>
										<!-- (c) //////////////////////////////////// -->
										<td class="styIRS1040ScheduleHTableCell" style="width:20%;font-size: 6pt; text-align:center;padding:0px 0px 0px 0px;height:100%;">
											<div class="styIRS1040ScheduleHLineItem" style="padding:0px 0px 0px 0px;width:100%;height:100%;margin-top:0px;margin-bottom:0px;">
												<div class="styIRS1040ScheduleHLineItem" style="padding:0px 0px 0px 0px;float:left;width:50%;text-align:center;border-width:0px 0px 0px 0px;height:100%;">
													<span style="width:4px"/>
												</div>
												<div class="styIRS1040ScheduleHLineItem" style="padding:0px 0px 0px 0px;float:left;width:49%;text-align:center;border-width:0px 0px 0px 1px;border-style:solid;border-color:black;height:100%;">
													<span style="width:4px"/>
												</div>
											</div>
										</td>
										<!-- (d) //////////////////////////////////// -->
										<td class="styIRS1040ScheduleHTableCell" style="width:7%;font-size: 6pt; text-align:center;">
											<span style="width:4px"/>
										</td>
										<!-- (e) //////////////////////////////////// -->
										<td class="styIRS1040ScheduleHTableCell" style="width:13%;font-size: 6pt; text-align:center;">
											<span style="width:4px"/>
										</td>
										<!-- (f) //////////////////////////////////// -->
										<td class="styIRS1040ScheduleHTableCell" style="width:13%;font-size: 6pt; text-align:center;">
											<span style="width:4px"/>
										</td>
										<!-- (g) //////////////////////////////////// -->
										<td class="styIRS1040ScheduleHTableCell" style="width:13%;font-size: 6pt; text-align:center;">
											<span style="width:4px"/>
										</td>
										<!-- (h) //////////////////////////////////// -->
										<td class="styIRS1040ScheduleHTableCell" style="width:13%;font-size: 6pt; text-align:center;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<!-- JMI: added: or.... -->
								<xsl:if test="count($Form1040ScheduleHData/UnemplFundMultiStateGroup/UnemploymentStateTaxGroup) &lt; 2 or ((count($Form1040ScheduleHData/UnemplFundMultiStateGroup/UnemploymentStateTaxGroup) &gt;2) and ($Print = $Separated))">
									<tr>
										<!-- (a) //////////////////////////////////// -->
										<td class="styIRS1040ScheduleHTableCell" style="width:7%;font-size: 6pt; text-align:center;">
											<span style="width:4px"/>
										</td>
										<!-- (b) //////////////////////////////////// -->
										<td class="styIRS1040ScheduleHTableCell" style="width:14%;font-size: 6pt; text-align:center;">
											<span style="width:4px"/>
										</td>
										<!-- (c) //////////////////////////////////// -->
										<td class="styIRS1040ScheduleHTableCell" style="width:20%;font-size: 6pt; text-align:center;padding:0px 0px 0px 0px;height:100%;">
											<div class="styIRS1040ScheduleHLineItem" style="padding:0px 0px 0px 0px;width:100%;height:100%;">
												<div class="styIRS1040ScheduleHLineItem" style="padding:0px 0px 0px 0px;float:left;width:50%;text-align:center;border-width:0px 0px 0px 0px;border-style:solid;border-color:black;height:100%;">
													<span style="width:4px"/>
												</div>
												<div class="styIRS1040ScheduleHLineItem" style="padding:0px 0px 0px 0px;float:left;width:49%;text-align:center;border-width:0px 0px 0px 1px;border-style:solid;border-color:black;height:100%;">
													<span style="width:4px"/>
												</div>
											</div>
										</td>
										<!-- (d) //////////////////////////////////// -->
										<td class="styIRS1040ScheduleHTableCell" style="width:7%;font-size: 6pt; text-align:center;">
											<span style="width:4px"/>
										</td>
										<!-- (e) //////////////////////////////////// -->
										<td class="styIRS1040ScheduleHTableCell" style="width:13%;font-size: 6pt; text-align:center;">
											<span style="width:4px"/>
										</td>
										<!-- (f) //////////////////////////////////// -->
										<td class="styIRS1040ScheduleHTableCell" style="width:13%;font-size: 6pt; text-align:center;">
											<span style="width:4px"/>
										</td>
										<!-- (g) //////////////////////////////////// -->
										<td class="styIRS1040ScheduleHTableCell" style="width:13%;font-size: 6pt; text-align:center;">
											<span style="width:4px"/>
										</td>
										<!-- (h) //////////////////////////////////// -->
										<td class="styIRS1040ScheduleHTableCell" style="width:13%;font-size: 6pt; text-align:center;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<!-- +++++++++++++++++++++++++++ End  Populating +++++++++++++++++++++++ -->
							</tbody>
						</table>
						<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
						<!--                          Table End                                     -->
						<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
					</div>
					<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundMultiStateGroup/UnemploymentStateTaxGroup"/>
						<xsl:with-param name="containerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" 'UnemploymentStateTaxGroupDiv' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
					<div style="width:187mm;" class="styBB">
						<!-- Empty Amount Box /////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<!-- Amount Box -->
							<div class="styIRS1040ScheduleHLNDesc" style="width:60mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styLNAmountBoxNBB" style="height:100%;width:24.5mm;float:right;padding:0px 0px 0px 0px;"/>
								<div class="styLNAmountBoxNBB" style="height:100%;width:24.3mm;float:right;padding:0px 0px 0px 0px;"/>
								<div class="styLNRightNumBoxNBB" style="height:100%;float:right;padding:0px 0px 0px 0px;"/>
							</div>
						</div>
						<!-- (18) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox" style="text-align:left;">18</div>
							<!-- Description -->
							<div class="styIRS1040ScheduleHLNDesc" style="width:120mm;">
                                <span style="float:left;">Totals</span>
                                <!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.........................</span>
							</div>
							<!-- Amount Box -->
							<div class="styIRS1040ScheduleHLNDesc" style="width:58mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styLNAmountBox" style="width:24.5mm;float:right;padding:0px 2px 0px 0px;font-size:6pt;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundMultiStateGroup/TotalContriStateUnemplFundAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:24.3mm;float:right;padding:0px 2px 0px 0px;font-size:6pt;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundMultiStateGroup/TotalUnemplAdditionalTaxCrAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="float:right;padding:0px 0px 0px 0px;">18</div>
							</div>
						</div>
						<!-- (19) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox" style="text-align:left;">19</div>
							<!-- Description -->
							<div class="styIRS1040ScheduleHLNDesc" style="width:95mm;">
                                <span style="float:left;"> Add columns (g) and (h) of line 18</span>
                                <!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
							</div>
							<!-- Amount Box -->
							<div class="styIRS1040ScheduleHLNDesc" style="height:100%;width:83mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styLNAmountBoxNBB" style="height:100%;width:33mm;float:right;padding:0px 0px 0px 0px;"/>
								<div class="styLNRightNumBoxNBB" style="height:100%;background-color:lightgrey;float:right;padding:0px 0px 0px 0px;"/>
								<div class="styLNAmountBox" style="height:100%;width:33mm;float:right;padding:0px 2px 0px 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundMultiStateGroup/TentativeFUTACreditAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="height:100%;float:right;padding:0px 0px 0px 0px;">19</div>
							</div>
						</div>
						<!-- (20) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox" style="text-align:left;">20</div>
							<!-- Description -->
							<div class="styIRS1040ScheduleHLNDesc" style="width:134mm;">
                                <span style="float:left;">Total cash wages subject to FUTA tax (see the line 13 instructions)</span>
                                <!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
							</div>
							<!-- Amount Box -->
							<div class="styIRS1040ScheduleHLNDesc" style="height:100%;width:45mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styLNAmountBox" style="height:100%;width:33mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundMultiStateGroup/TotalCashWagesSubjFUTATaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="height:100%;float:right;padding:0px 0px 0px 0px;">20</div>
							</div>
						</div>
						<!-- (21) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox" style="text-align:left;">21</div>
							<!-- Description -->
							<div class="styIRS1040ScheduleHLNDesc" style="width:134mm;">
                                <span style="float:left;">Multiply line 20 by 6.0% (.060) </span>
                                <!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.....................</span>
							</div>
							<!-- Amount Box -->
							<div class="styIRS1040ScheduleHLNDesc" style="height:100%;width:45mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styLNAmountBox" style="height:100%;width:33mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundMultiStateGroup/GrossFUTATaxCreditAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="height:100%;float:right;padding:0px 0px 0px 0px;">21</div>
							</div>
						</div>
						<!-- (22) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox" style="text-align:left;">22</div>
							<!-- Description -->
							<div class="styIRS1040ScheduleHLNDesc" style="width:95mm;">
                                <span style="float:left;">Multiply line 20 by 5.4% (.054)</span>
                                <!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
							</div>
							<!-- Amount Box -->
							<div class="styIRS1040ScheduleHLNDesc" style="height:100%;width:83mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styLNAmountBoxNBB" style="height:100%;width:33mm;float:right;padding:0px 0px 0px 0px;"/>
								<div class="styLNRightNumBoxNBB" style="height:100%;background-color:lightgrey;float:right;padding:0px 0px 0px 0px;"/>
								<div class="styLNAmountBox" style="height:100%;width:33mm;float:right;padding:0px 2px 0px 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundMultiStateGroup/FUTATaxCreditMaxAllowedAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="height:100%;float:right;padding:0px 0px 0px 0px;">22</div>
							</div>
						</div>
						<!-- (23) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox" style="text-align:left;">23</div>
							<!-- Description -->
							<div class="styIRS1040ScheduleHLNDesc" style="width:134mm;">
                                <span style="float:left;">Enter the <b>smaller</b> of line 19 or line 22</span>
                                <!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
								<br/>
                (Employers in a credit reduction state must use the worksheet on page H-7 and check here)
                <span class="styBoldText">
									<span style="width:10px"/>.
                </span>
								<span style="width:5px"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundMultiStateGroup/CreditReductionStateWrkshtInd"/>
										<xsl:with-param name="BackupName">IRS1040ScheduleHDataUnemplFundMultiStateGroupCreditReductionStateWrkshtInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundMultiStateGroup/CreditReductionStateWrkshtInd"/>
										<xsl:with-param name="BackupName">IRS1040ScheduleHDataUnemplFundMultiStateGroupCreditReductionStateWrkshtInd</xsl:with-param>
									</xsl:call-template>
								</label>
							</div>
							<!-- Amount Box -->
							<div class="styIRS1040ScheduleHLNDesc" style="height:100%;width:43mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styLNAmountBoxNBB" style="height:50%;width:33mm;float:right;padding:0px 0px 0px 0px;"/>
								<div class="styLNRightNumBoxNBB" style="height:50%;background-color:lightgrey;float:right;padding:0px 0px 0px 0px;"/>
								<div class="styLNAmountBox" style="height:50%;width:33mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundMultiStateGroup/UnemplSmallerTaxAdjustmentAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="height:50%;float:right;padding:0px 0px 0px 0px;">23</div>
							</div>
						</div>
						<!-- (24) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox" style="text-align:left;">24</div>
							<!-- Description -->
							<div class="styIRS1040ScheduleHLNDesc" style="width:134mm;">
								<span style="float:left;"><span class="styBoldText">FUTA tax.</span> Subtract line 23 from line 21. Enter the result here and go to line 25</span>
                                <!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
							</div>
							<!-- Amount Box -->
							<div class="styIRS1040ScheduleHLNDesc" style="height:100%;width:45mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styLNAmountBoxNBB" style="height:100%;width:33mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/UnemplFundMultiStateGroup/FUTATaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBoxNBB" style="height:100%;float:right;padding:0px 0px 0px 0px;">24</div>
							</div>
						</div>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!--  Begin PART III -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Header -->
					<div style="width:187mm;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;">Part III</div>
						<div class="styPartDesc" style="padding-left:3mm;">
              Total Household Employment Taxes
            </div>
					</div>
					<!-- Body -->
					<div style="width:187mm;" class="styBB">
						<!-- (25) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox" style="text-align:left;">25</div>
							<!-- Description -->
							<div class="styIRS1040ScheduleHLNDesc" style="width:134mm;">
                                <span style="float:left;">Enter the amount from line 8. If you checked the "Yes" box on line C of page 1, enter -0-</span>
                                <!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
							</div>
							<!-- Amount Box -->
							<div class="styIRS1040ScheduleHLNDesc" style="height:100%;width:45mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styLNAmountBox" style="height:100%;width:33mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/TotalTaxHouseholdEmplCalcAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="height:100%;float:right;padding:0px 0px 0px 0px;">25</div>
							</div>
						</div>
						<!-- (26) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox" style="text-align:left;">26</div>
							<!-- Description -->
							<div class="styIRS1040ScheduleHLNDesc" style="width:134mm;">
                                <span style="float:left;">Add line 16 (or line 24) and line 25</span>
                                <!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
							</div>
							<!-- Amount Box -->
							<div class="styIRS1040ScheduleHLNDesc" style="height:100%;width:45mm;float:right;padding:0px 0px 0px 0px;">
								<div class="styLNAmountBox" style="height:100%;width:33mm;float:right;padding:0px 0px 0px 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/CombinedFUTATaxPlusNetTaxesAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="height:100%;float:right;padding:0px 0px 0px 0px;">26</div>
							</div>
						</div>
						<!-- (27) ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem">
							<div class="styIRS1040ScheduleHLNLeftNumBox" style="text-align:left;">27</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:175mm;">
								<!-- Description -->
                                Are you required to file Form 1040?
                                <br/>
								<!-- Checkboxes -->
								<div class="styIRS1040ScheduleHLNDesc" style="width:170mm;padding-left:0px;float:none;">
									<!-- Yes -->
									<div class="styIRS1040ScheduleHLNDesc" style="width:165mm;padding-left:0px;float:none;">
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/RequiredToFileForm1040Ind"/>
											</xsl:call-template>
											<input type="checkbox" class="styCkbox">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/RequiredToFileForm1040Ind"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleHDataRequiredToFileF1040Cd</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<label>
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/RequiredToFileForm1040Ind"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleHDataRequiredToFileF1040Cd</xsl:with-param>
											</xsl:call-template>
											<span style="width:2mm;"/>
											<span class="styBoldText">Yes. Stop.</span> Include the amount from line 26 above on Form 1040, line 60a. <span class="styBoldText">Do not</span> complete Part IV below.
                                        </label>
									</div>
									<!-- No -->
									<div class="styIRS1040ScheduleHLNDesc" style="width:165mm;padding-left:0px;">
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/RequiredToFileForm1040Ind"/>
											</xsl:call-template>
											<input type="checkbox" class="styCkbox">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/RequiredToFileForm1040Ind"/>
													<xsl:with-param name="BackupName">IRS1040ScheduleHDataRequiredToFileF1040Cd</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<label>
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/RequiredToFileForm1040Ind"/>
												<xsl:with-param name="BackupName">IRS1040ScheduleHDataRequiredToFileF1040Cd</xsl:with-param>
											</xsl:call-template>
											<span style="width:2mm;"/>
											<span class="styBoldText">No.</span> You may have to complete Part IV. See instructions for details.
                                        </label>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!--  Begin PART IV -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Header -->
					<div style="width:187mm;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;">Part IV</div>
						<div class="styPartDesc" style="padding-left:3mm;">
              Address and Signature &#45; <span class="styNormalText">Complete this part</span> only <span class="styNormalText">if required. See the line 27 instructions.</span>
						</div>
					</div>
					<!-- Body -->
					<div style="width:187mm;" class="styBB">
						<!-- 1st Row ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem" style="border-bottom-width:1px;border-color:black;padding:0px 0px 0px 0px;">
							<div class="styIRS1040ScheduleHLNDesc" style="width:75%;border-right-width:1px;padding-left:3px;border-color:black;">
								<!-- Title -->
								<div class="styIRS1040ScheduleHLNDesc" style="height:3mm;width:100%;padding-left:3px;float:none;">
                                     Address (number and street) or P.O. box if mail is not delivered to street address
                                </div>
								<!-- Data -->
								<div class="styIRS1040ScheduleHLNDesc" style="height:6mm;width:100%;padding-left:3px;float:none;">
                                </div>
							</div>
							<div class="styIRS1040ScheduleHLNDesc" style="width:25%;padding-left:3px;">
								<!-- Title -->
								<div class="styIRS1040ScheduleHLNDesc" style="height:3mm;width:100%;padding-left:3px;float:none;">
                                     Apt., room, or suite no.
                                </div>
								<!-- Data -->
								<div class="styIRS1040ScheduleHLNDesc" style="height:6mm;width:100%;padding-left:0px;float:none;text-align:center;">
                                </div>
							</div>
						</div>
						<!-- 2nd Row ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem" style="border-bottom-width:1px;border-color:black;padding:0px 0px 0px 0px;">
							<!-- Title -->
							<div class="styIRS1040ScheduleHLNDesc" style="height:3mm;width:100%;padding-left:3px;float:none;">
                                City, town or post office, state, and ZIP code
                            </div>
							<!-- Data -->
							<div class="styIRS1040ScheduleHLNDesc" style="height:6mm;width:100%;padding-left:3px;float:none;">
                            </div>
						</div>
						<!-- 3rd Row ////////////////////////////////////////////////////////////-->
						<div class="styIRS1040ScheduleHLineItem" style="font-size:6pt;">
              Under penalties of perjury, I declare that I have examined this schedule, including accompanying statements, and to the best of my knowledge and belief, it is true,<br/>
              correct, and complete. No part of any payment made to a state unemployment fund claimed as a credit was, or is to be, deducted from the payments to employees.<br/>
              Declaration of preparer (other than taxpayer) is based on all information of which preparer has any knowledge.<br/>
							<br/>
							<div class="styIRS1040ScheduleHLNDesc" style="padding:0px 0px 0px 0px;width:100%">
								<div class="styIRS1040ScheduleHLNDesc" style="padding:0px 0px 0px 2mm;width:3%">
									<img src="{$ImagePath}/1040ScheduleH_Bullet_Lg.gif" alt="LargeBullet"/>
								</div>
								<div class="styIRS1040ScheduleHLNDesc" style="padding:0px 0px 0px 0px;width:58%">
									<div class="styIRS1040ScheduleHLNDesc" style="padding:0px 0px 0px 0px;width:100%;height:4mm;border-bottom-width:1px;border-color:black;"/>
									<div class="styIRS1040ScheduleHLNDesc" style="padding:0px 0px 0px 0px;width:100%;height:4mm;font-size:6pt;">
                    Employer&#8221;s signature
                                    </div>
								</div>
								<div class="styIRS1040ScheduleHLNDesc" style="padding:0px 0px 0px 5mm;width:5%">
									<img src="{$ImagePath}/1040ScheduleH_Bullet_Lg.gif" alt="LargeBullet"/>
								</div>
								<div class="styIRS1040ScheduleHLNDesc" style="padding:0px 0px 0px 0px;width:34%">
									<div class="styIRS1040ScheduleHLNDesc" style="padding:0px 0px 0px 0px;width:100%;height:4mm;border-bottom-width:1px;border-color:black;"/>
									<div class="styIRS1040ScheduleHLNDesc" style="padding:0px 0px 0px 0px;width:100%;height:4mm;font-size:6pt;">
                                   Date
                                </div>
								</div>
							</div>
						</div>
					</div>
					<!-- Paid Preparer Section-->
					<div class="styTBB" style="width:187mm;font-size:6pt;">
						<div style="width:22.65mm;padding-top:4mm;float:left;clear:none;">
							<span class="styMainTitle" style="font-size:11pt;">
							  Paid
							  Preparer
							  Use Only
							</span>
						</div>
						<div style="width:164mm;float:left;clear:none;border-width:0px 0px 0px 1px; border-color:black;border-style:solid;">
							<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
								<div class="styLNDesc" style="height:6mm;width:46.8mm;padding-top:0mm;border-right:1 solid black;padding-left:3px;">
                                    Print/Type preparer's name<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerPersonName</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="height:6mm;width:46.5mm;padding-top:0mm;border-right:1 solid black;padding-left:1mm;">
                                     Preparer's signature
                                </div>
								<div class="styLNDesc" style="height:6mm;width:15mm;border-right:1 solid black;padding-top:0mm;padding-left:1mm;">Date <br/>
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationDateSigned</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="height:6mm;width:18mm;border-right:1 solid black;padding-top:.5mm;padding-bottom:0mm;padding-left:1mm;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
										</xsl:call-template>
                                       Check 
                                    <input class="styCkbox" type="checkbox" style="height:3.5mm;width:4mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
											</xsl:call-template>
									</input>
									<span style="width:4px;"/>if<br/>self-employed
                  </label>
								</div>
								<div class="styLNDesc" style="height:6mm;width:16mm;padding-top:0mm;padding-left:1mm;">PTIN
                             <br/>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerSSN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">PreparerSSN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerSSN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PTIN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPTIN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/STIN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">STIN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSTIN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
								<div class="styLNDesc" style="height:6mm;width:108.5mm;border-right:1 solid black;">
									<span class="styGenericDiv" style="padding-left:3px;">Firm's name 
                                    <span style="width:2.2mm;"/>
										<img src="{$ImagePath}/1040ScheduleH_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
										<span style="width:4px;"/>
									</span>
									<div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName2</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
								<div class="styLNDesc" style="height:6mm;width:32mm;padding-left:1mm;">Firm's EIN
                                    <img src="{$ImagePath}/1040ScheduleH_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
									<span style="width:4px;"/>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">PreparerFirmIDNumber</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerFirmIDNumber</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReason">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationMissingEINReason</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div style="width:164mm;float:left;clear:none;">
								<div class="styLNDesc" style="width:108.5mm;border-right:1 solid black;">
									<div class="styGenericDiv" style="padding-right:.5mm;padding-left:3px;">Firm's address 
                                         <img src="{$ImagePath}/1040ScheduleH_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
									</div>
									<div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine2</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressCity</xsl:with-param>
											</xsl:call-template>,
                                         <span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressState</xsl:with-param>
											</xsl:call-template>,
                                         <span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressZip</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignAddressCity</xsl:with-param>
											</xsl:call-template>,
                                         <span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignProvinceOrState</xsl:with-param>
											</xsl:call-template>,
                                        <span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPostalCd</xsl:with-param>
											</xsl:call-template>,
                                        <span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignCountryCd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
								<div class="styLNDesc" style="width:32mm;padding-left:1mm;"> Phone no. 
                                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">Phone</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPhone</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPhone</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;clear:all">
						<div style="float:right;">
							<span style="width:20px;"/>
							<span class="styBoldText" style="font-size:7pt;">Schedule H (Form 1040) 2014</span>
						</div>
					</div>
					<br/>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">Additional Data</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData"/>
							<xsl:with-param name="DescWidth" select="130"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Employer Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/EmployerNameControlTxt"/>
							<xsl:with-param name="DescWidth" select="130"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I, Line 8 - Household Employee State Disability Payment Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplStateDisabilityPymtGrp/HsldEmplStateDisabilityPymtAmt"/>
							<xsl:with-param name="DescWidth" select="130"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I, Line 8 - Household Employee State Disability Payment Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleHData/HsldEmplStateDisabilityPymtGrp/HsldEmplStateDisabilityPymtCd"/>
							<xsl:with-param name="DescWidth" select="130"/>
						</xsl:call-template>
					</table>
					<br/>
					<br/>
					<!-- Separated Data for Form 1040 Schedule H, Part II, Section B, Line 17 -->
					<xsl:if test="($Print = $Separated) and  (count($Form1040ScheduleHData/UnemplFundMultiStateGroup/UnemploymentStateTaxGroup) &gt; 2)">
						<span class="styRepeatingDataTitle">
              Form 1040 Schedule H, Part II, Section B, Line 17 - Complete all columns below that apply (if you need more space, see instructions):
            </span>
						<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
						<table class="styDepTbl" cellspacing="0">
							<!-- ++++++++++++++++++++++++ Start: Table Headers ++++++++++++++++++++++ -->
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<!-- (a) //////////////////////////////////// -->
									<th class="styIRS1040ScheduleHTableCellHeader" style="text-align:center;font-size: 6pt; width:7%;" scope="col">
										<span class="styBoldText">(a)</span>
										<span class="styNormalText">
											<br/>Name<br/>of<br/>state
                                        </span>
									</th>
									<!-- (b) //////////////////////////////////// -->
									<th class="styIRS1040ScheduleHTableCellHeader" style="text-align:center;font-size: 6pt; width:14%;" scope="col">
										<span class="styBoldText">(b)</span>
										<span class="styNormalText">
											<br/>Taxable wages (as<br/>defined in state act)
                                        </span>
									</th>
									<!-- (c) //////////////////////////////////// -->
									<th class="styIRS1040ScheduleHTableCellHeader" style="text-align:center;font-size: 6pt; width:20%;padding:0px 0px 0px 0px;" scope="col">
										<div class="styIRS1040ScheduleHLineItem" style="padding:0px 0px 0px 0px;width:100%;">
											<span class="styBoldText">(c)</span>
											<span class="styNormalText">
												<br/>Taxable wages (as<br/>defined in state act)
                                            </span>
										</div>
										<br/>
										<span class="styNormalText;margin-bottom:0px;">
											<div class="styIRS1040ScheduleHLineItem" style="padding:0px 0px 0px 0px;width:100%;height:100%">
												<div class="styIRS1040ScheduleHLineItem" style="padding:0px 0px 0px 0px;float:left;width:50%;border-width:1px 0px 0px 0px;border-color:black;border-style:solid;height:100%;">
													<span class="styNormalText">From</span>
												</div>
												<div class="styIRS1040ScheduleHLineItem" style="padding:0px 0px 0px 0px;float:right;width:49%;border-width:1px 0px 0px 1px;border-color:black;border-style:solid;height:100%;">
													<span class="styNormalText">To</span>
												</div>
											</div>
										</span>
									</th>
									<!-- (d) //////////////////////////////////// -->
									<th class="styIRS1040ScheduleHTableCellHeader" style="text-align:center;font-size: 6pt; width:7%;" scope="col">
										<span class="styBoldText">(d)</span>
										<span class="styNormalText">
											<br/>State<br/>experience<br/>rate
                                        </span>
									</th>
									<!-- (e) //////////////////////////////////// -->
									<th class="styIRS1040ScheduleHTableCellHeader" style="text-align:center;font-size: 6pt; width:13%;" scope="col">
										<span class="styBoldText">(e)</span>
										<span class="styNormalText">
											<br/>Multiply col. (b)<br/>by .054
                    </span>
									</th>
									<!-- (f) //////////////////////////////////// -->
									<th class="styIRS1040ScheduleHTableCellHeader" style="text-align:center;font-size: 6pt; width:13%;" scope="col">
										<span class="styBoldText">(f)</span>
										<span class="styNormalText">
											<br/>Multiply col. (b)<br/>by col. (d)
                                        </span>
									</th>
									<!-- (g) //////////////////////////////////// -->
									<th class="styIRS1040ScheduleHTableCellHeader" style="text-align:center;font-size: 6pt; width:13%;" scope="col">
										<span class="styBoldText">(g)</span>
										<span class="styNormalText">
											<br/>Subtract col. (f)<br/>from col. (e). If<br/>zero or less,<br/>enter -0-.
                    </span>
									</th>
									<!-- (h) //////////////////////////////////// -->
									<th class="styIRS1040ScheduleHTableCellHeader" style="text-align:center;font-size: 6pt; width:13%;" scope="col">
										<span class="styBoldText">(h)</span>
										<span class="styNormalText">
											<br/>Contributions<br/>paid to state<br/>unemployment<br/>fund
                                        </span>
									</th>
								</tr>
							</thead>
							<!-- ++++++++++++++++++++++++ End: Table Headers +++++++++++++++++++++++ -->
							<tfoot/>
							<tbody>
								<!-- ++++++++++++++++++++++++++ Start  Populating +++++++++++++++++++++++ -->
								<xsl:for-each select="$Form1040ScheduleHData/UnemplFundMultiStateGroup/UnemploymentStateTaxGroup">
									<tr style="border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!-- (a) //////////////////////////////////// -->
										<td class="styIRS1040ScheduleHTableCell" style="width:7%;font-size: 6pt; text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="StateCd"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<!-- (b) //////////////////////////////////// -->
										<td class="styIRS1040ScheduleHTableCell" style="width:14%;font-size: 6pt; text-align:right;padding-right:2px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TxblWagesPaidStUnemplFundAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<!-- (c) //////////////////////////////////// -->
										<td class="styIRS1040ScheduleHTableCell" style="width:20%;font-size: 6pt; text-align:center;padding:0px 0px 0px 0px;height:100%">
											<div class="styIRS1040ScheduleHLineItem" style="padding:0px 0px 0px 0px;width:100%;height:100%;">
												<div class="styIRS1040ScheduleHLineItem" style="padding:0px 0px 0px 0px;float:left;width:50%;text-align:center;border-width:0px 0px 0px 0px;border-style:solid;border-color:black;height:100%;">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="UnemplStateExprncRateFromDt"/>
													</xsl:call-template>
												</div>
												<div class="styIRS1040ScheduleHLineItem" style="padding:0px 0px 0px 0px;float:left;width:49%;text-align:center;border-width:0px 0px 0px 1px;border-style:solid;border-color:black;height:100%;">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="UnemplStateExprncRateToDt"/>
													</xsl:call-template>
												</div>
											</div>
										</td>
										<!-- (d) //////////////////////////////////// -->
										<td class="styIRS1040ScheduleHTableCell" style="width:7%;font-size: 6pt; text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="UnemploymentStateExperienceRt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<!-- (e) //////////////////////////////////// -->
										<td class="styIRS1040ScheduleHTableCell" style="width:13%;font-size: 6pt; text-align:right;padding-right:2px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="UnemploymentTaxCrAt54RateAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<!-- (f) //////////////////////////////////// -->
										<td class="styIRS1040ScheduleHTableCell" style="width:13%;font-size: 6pt; text-align:right;padding-right:2px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="UnemploymentTaxCrAtStateRtAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<!-- (g) //////////////////////////////////// -->
										<td class="styIRS1040ScheduleHTableCell" style="width:13%;font-size: 6pt; text-align:right;padding-right:2px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="UnemploymentAdditionalTaxCrAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<!-- (h) //////////////////////////////////// -->
										<td class="styIRS1040ScheduleHTableCell" style="width:13%;font-size: 6pt; text-align:right;padding-right:2px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ContriPaidToStateUnemplFundAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
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
</xsl:stylesheet>
