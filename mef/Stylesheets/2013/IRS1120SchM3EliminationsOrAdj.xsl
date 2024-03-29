<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1120SchM3EliminationsOrAdjStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form1120ScheduleM3" select="$RtnDoc/IRS1120SchM3EliminationsOrAdj"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form1120ScheduleM3)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching  -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 1120 Schedule M3"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1120SchM3EliminationsOrAdjStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form1120ScheduleM3">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Header - Form1120SchM3 Number, Title, and Year -->
					<div class="styTBB" style="width:187mm;">
						<div class="styFNBox" style="width:31mm;height:23mm;border-right-width:2px;">
							<span class="styFormNumber" style="font-size:10pt;">SCHEDULE M-3(Form 1120)
            <!-- Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3"/>
								</xsl:call-template>
							</span>
							<span class="styAgency" style="height:5mm;padding-top:7mm;">
          Department of the Treasury
          Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:125mm;height:23mm;">
							<div class="styMainTitle">Net Income (Loss) Reconciliation for Corporations<br/>
                             With Total Assets of $10 Million or More</div>
							<div class="styFBT">
								<span>
									<img src="{$ImagePath}/1120SchN_Bullet_Title.gif" alt="MidSizeBullet"/>Attach to Form 1120 or 1120-C.</span>
								<br/>
								<span style="height:2mm;">
									<img src="{$ImagePath}/1120SchN_Bullet_Title.gif" alt="MidSizeBullet"/>
									Information about Schedule M-3 (Form 1120) and its separate instructions is at
										<a href="http://www.irs.gov/form1120" title="Link to IRS.gov">
										<i>www.irs.gov/form1120.</i>
									</a>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:23mm;border-left-width:2px;">
							<div class="styOMB">OMB No. 1545-0123</div>
							<div class="styTY" style="height:11mm;padding-top:4mm;">20<span class="styTYColor">13</span>
							</div>
						</div>
					</div>
					<!-- End Header - Form Number, Title, and Year -->
					<!--  Name and Employer identification number  -->
					<div class="styTBB" style="width:187mm">
						<div class="styNameBox" style="width:141mm;font-size:7pt;">
      Name of corporation (common parent, if consolidated return)<br/>
							<xsl:choose>
								<xsl:when test="$Form1120ScheduleM3/BusinessName/BusinessNameLine1 !=''">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/BusinessName/BusinessNameLine1"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/BusinessName/BusinessNameLine2"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styEINBox" style=" padding-left:2mm;font-size:7pt;">
							<span class="BoldText">Employer identification number</span>
							<br/>
							<br/>
							<span style="font-weight:normal;">
								<xsl:choose>
									<xsl:when test="$Form1120ScheduleM3/EIN !='' or $Form1120ScheduleM3/MissingEINReasonCd !='' ">
										<xsl:choose>
											<xsl:when test="$Form1120ScheduleM3/EIN">
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/EIN"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/MissingEINReasonCd"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
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
					<!--  End Name and Employer indentification number  -->
					<!-- start check box line  -->
					<div style="width:187mm;font-size:6pt;clear:all;">
						<div class="styGenericDiv" style="width:100mm;">
							<span style="width:10mm;"/>
							<span style="width:30mm;">Check applicable box(es):</span>
							<span style="padding-left:10mm;">(1) </span>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/NonConsolidatedReturnInd"/>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/NonConsolidatedReturnInd"/>
								</xsl:call-template>
					Non-Consolidated return
					 </label>
						</div>
						<div class="styGenericDiv" style="width:60mm;">
           		 (2)
           			<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ConsolidatedReturnInd"/>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ConsolidatedReturnInd"/>
								</xsl:call-template>
					Consolidated return (Form 1120 only)
					</label>
						</div>
					</div>
					<div class="styBB" style="width:187mm;font-size:6pt;">
						<div class="styGenericDiv" style="width:100mm;">
							<span style="width:40mm;"/>
							<span style="padding-left:10mm">
           	(3) </span>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/Mixed1120LPCGroupInd"/>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/Mixed1120LPCGroupInd"/>
								</xsl:call-template> Mixed 1120/L/PC group
		   </label>
						</div>
						<div class="styGenericDiv" style="width:60mm;">
           		 (4)
           	<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/DormantSubsidiariesSchAttInd"/>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/DormantSubsidiariesSchAttInd"/>
								</xsl:call-template> Dormant subsidiaries schedule attached
		</label>
						</div>
					</div>
					<!-- end check box line  -->
					<!-- Part I - Header -->
					<div style="width:187mm;height:8mm;border-style:solid; border-bottom-width:1px;border-top-width:0px;clear:all;border-right-width:0px;border-left-width:0px;padding-top:2mm;float:left;">
						<span class="styPartName" style="width:12mm;">Part I</span>
						<span style="width:140mm;" class="styPartDesc">
							<span style="width:3mm;"/>Financial Information and Net Income (Loss) Reconciliation
          <span style="font-weight:normal"> (see instructions)</span>
							<br/>
						</span>
					</div>
					<!-- Line 1a -->
					<div style="width:187mm;clear:all;">
						<div class="styLNLeftNumBoxSD">1a</div>
						<div class="styLNDesc" style="width:179mm;">
        Did the corporation file SEC Form 10-K for its income statement period 
        ending with or within this tax year?</div>
					</div>
					<!-- Line 1a - Yes -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
						<div class="styLNDesc" style="width:179mm;">
							<span style="width:.5mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorporationFiledSECForm10KInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorporationFiledSECForm10KInd"/>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorporationFiledSECForm10KInd"/>
									<xsl:with-param name="BackupName" select="$Form1120ScheduleM3/CorporationFiledSECForm10KInd"/>
								</xsl:call-template>
								<span class="styBoldText" style="padding-left:1mm;">Yes.</span>
							</label>          
          Skip lines 1b and 1c and complete lines 2a through 11 with respect to that SEC Form 10-K.
        </div>
					</div>
					<!-- Line 1a - No -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="width:7.25mm;;"/>
						<div class="styLNDesc" style="width:179mm;">
							<span style="width:.5mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorporationFiledSECForm10KInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorporationFiledSECForm10KInd"/>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorporationFiledSECForm10KInd"/>
									<xsl:with-param name="BackupName" select="$Form1120ScheduleM3/CorporationFiledSECForm10KInd"/>
								</xsl:call-template>
								<span class="styBoldText" style="padding-left:1mm;">No.</span>
							</label>
         Go to line 1b. See instructions if multiple non-tax-basis income statements are prepared.
        </div>
					</div>
					<!-- Line 1b -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">
							<span style="width:1.5mm"/>b</div>
						<div class="styLNDesc" style="width:179mm;">Did the corporation prepare
         a certified audited non-tax-basis income statement for that period?</div>
					</div>
					<!-- Line 1b - Yes -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="width:7.25mm;;"/>
						<div class="styLNDesc" style="width:179mm;">
							<span style="width:.5mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpPrepCertAuditedIncmStmtInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpPrepCertAuditedIncmStmtInd"/>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpPrepCertAuditedIncmStmtInd"/>
									<xsl:with-param name="BackupName" select="$Form1120ScheduleM3/CorpPrepCertAuditedIncmStmtInd"/>
								</xsl:call-template>
								<span class="styBoldText" style="padding-left:1mm;">Yes.</span>
							</label>          
          Skip line 1c and complete lines 2a through 11 with respect to that income statement.
      </div>
					</div>
					<!-- Line 1b - No -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
						<div class="styLNDesc" style="width:179mm;">
							<span style="width:.5mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpPrepCertAuditedIncmStmtInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpPrepCertAuditedIncmStmtInd"/>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpPrepCertAuditedIncmStmtInd"/>
									<xsl:with-param name="BackupName" select="$Form1120ScheduleM3/CorpPrepCertAuditedIncmStmtInd"/>
								</xsl:call-template>
								<span class="styBoldText" style="padding-left:1mm;">No.</span>
							</label>
          Go to line 1c.
        </div>
					</div>
					<!-- Line 1c -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">
							<span style="width:1.5mm"/>c</div>
						<div class="styLNDesc" style="width:179mm;">Did the corporation prepare
         a non-tax-basis income statement for that period?
        </div>
					</div>
					<!-- Line 1c - Yes -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
						<div class="styLNDesc" style="width:179mm;">
							<span style="width:.5mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpPrepIncomeStatementInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpPrepIncomeStatementInd"/>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpPrepIncomeStatementInd"/>
									<xsl:with-param name="BackupName" select="$Form1120ScheduleM3/CorpPrepIncomeStatementInd"/>
								</xsl:call-template>
								<span class="styBoldText" style="padding-left:1mm;">Yes.</span>
							</label>          
          Complete lines 2a through 11 with respect to that income statement.
        </div>
					</div>
					<!-- Line 1c - No -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
						<div class="styLNDesc" style="width:179mm;">
							<span style="width:.5mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpPrepIncomeStatementInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpPrepIncomeStatementInd"/>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpPrepIncomeStatementInd"/>
									<xsl:with-param name="BackupName" select="$Form1120ScheduleM3/CorpPrepIncomeStatementInd"/>
								</xsl:call-template>
								<span class="styBoldText" style="padding-left:1mm;">No.</span>
							</label>
          Skip lines 2a through 3c and enter the corporation’s net income (loss) per its books
           and records on line 4a. </div>
					</div>
					<!-- Line 2a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">2a</div>
						<div class="styLNDesc" style="width:179mm;">Enter the income statement period:
          <span style="width:3mm"/>Beginning<span style="width:3mm"/>
							<span style="width:25mm;border-bottom:solid 1px;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/IncomeStatementBeginningDt"/>
								</xsl:call-template>
							</span>
							<span style="width:8mm"/>Ending<span style="width:3mm"/>
							<span style="width:25mm;border-bottom:solid 1px;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/IncomeStatementEndingDt"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Line 2b -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">
							<span style="width:1.5mm"/>b</div>
						<div class="styLNDesc" style="width:179mm;height:auto;">Has the corporation's income statement been restated for the income statement period on line 2a?
            <!-- Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorporationIncmStmtRestatedInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2b - Yes -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="width:7.25mm;;"/>
						<div class="styLNDesc" style="width:179mm;">
							<span style="width:.5mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorporationIncmStmtRestatedInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorporationIncmStmtRestatedInd"/>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorporationIncmStmtRestatedInd"/>
									<xsl:with-param name="BackupName" select="$Form1120ScheduleM3/CorporationIncmStmtRestatedInd"/>
								</xsl:call-template>
								<span class="styBoldText" style="padding-left:1mm;">Yes.</span>
							</label>          
          (If "Yes," attach an explanation and the amount of each item restated.)
        </div>
					</div>
					<!-- Line 2b - No -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
						<div class="styLNDesc" style="width:179mm;">
							<span style="width:.5mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorporationIncmStmtRestatedInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorporationIncmStmtRestatedInd"/>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorporationIncmStmtRestatedInd"/>
									<xsl:with-param name="BackupName" select="$Form1120ScheduleM3/CorporationIncmStmtRestatedInd"/>
								</xsl:call-template>
								<span class="styBoldText" style="padding-left:1mm;">No.</span>
							</label>
						</div>
					</div>
					<!-- Line 2c -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">
							<span style="width:1.5mm"/>c</div>
						<div class="styLNDesc" style="width:179mm;height:auto;">Has the corporation's income
         statement been restated for any of the five income statement periods preceding
          the period<br/> on line 2a?
            <!-- Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncmStmtRestated5PrecInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2c - Yes -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="width:7.25mm;;"/>
						<div class="styLNDesc" style="width:179mm;">
							<span style="width:.5mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncmStmtRestated5PrecInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncmStmtRestated5PrecInd"/>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncmStmtRestated5PrecInd"/>
									<xsl:with-param name="BackupName" select="$Form1120ScheduleM3/CorpIncmStmtRestated5PrecInd"/>
								</xsl:call-template>
								<span class="styBoldText" style="padding-left:1mm;">Yes.</span>
							</label>          
          (If "Yes," attach an explanation and the amount of each item restated.)
        </div>
					</div>
					<!-- Line 2c - No -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
						<div class="styLNDesc" style="width:179mm;">
							<span style="width:.5mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncmStmtRestated5PrecInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncmStmtRestated5PrecInd"/>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncmStmtRestated5PrecInd"/>
									<xsl:with-param name="BackupName" select="$Form1120ScheduleM3/CorpIncmStmtRestated5PrecInd"/>
								</xsl:call-template>
								<span class="styBoldText" style="padding-left:1mm;">No.</span>
							</label>
						</div>
					</div>
					<!-- Line 3a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">3a</div>
						<div class="styLNDesc" style="width:179mm;">Is any of the corporation’s voting common stock publicly traded?
            <!-- Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpVotingComStkPubTrddInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3a - Yes -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="width:7.25mm;;"/>
						<div class="styLNDesc" style="width:179mm;">
							<span style="width:.5mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpVotingComStkPubTrddInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpVotingComStkPubTrddInd"/>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpVotingComStkPubTrddInd"/>
									<xsl:with-param name="BackupName" select="$Form1120ScheduleM3/CorpVotingComStkPubTrddInd"/>
								</xsl:call-template>
								<span class="styBoldText" style="padding-left:1mm;">Yes.</span>
							</label>
						</div>
					</div>
					<!-- Line 3a - No -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="width:7.25mm;;"/>
						<div class="styLNDesc" style="width:179mm;">
							<span style="width:.5mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpVotingComStkPubTrddInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpVotingComStkPubTrddInd"/>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpVotingComStkPubTrddInd"/>
									<xsl:with-param name="BackupName" select="$Form1120ScheduleM3/CorpVotingComStkPubTrddInd"/>
								</xsl:call-template>
								<span class="styBoldText" style="padding-left:1mm;">No.</span>
							</label>
          If "No," go to line 4a.
        </div>
					</div>
					<!-- Line 3b -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">
							<span style="width:1.5mm"/>b</div>
						<div class="styLNDesc" style="width:113mm;">Enter the symbol of the corporation’s primary U.S. publicly traded voting common
						<br/>
							<span style="float:left;">stock</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.........................</span>
						</div>
						<div style="width:25mm;height:4.5mm;border: solid 1px;margin-top:1.5mm;float:left;margin-left:3mm;text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/PrimaryStockSymbolNumberTxt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3c -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBoxSD">
							<span style="width:1.5mm"/>c</div>
						<div class="styLNDesc" style="width:113mm;height:auto;">Enter the nine-digit CUSIP number of the corporation's primary publicly traded voting <span style="float:left;">common stock</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>
						</div>
						<div style="width:45mm;height:4.5mm;border: solid 1px;margin-top:1.5mm;float:left;margin-left:3mm;text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpPrimaryStockCUSIPNum"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4a -->
					<div style="width:187mm;clear:all;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">4a</div>
							<div class="styLNDesc" style="width:131mm;">Worldwide consolidated net income (loss)
           from income statement source identified in Part I, line 1</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="border-top-width:0px">4a</div>
							<div class="styLNAmountBox" style="border-top-width:0px">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/WorldwideCnsldtNetIncmLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 4b -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">
								<span style="width:1.5mm"/>b</div>
							<div class="styLNDesc" style="width:137mm;">
             Indicate accounting standard used for line 4a (see instructions):
        </div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="background-color:lightgrey;border-bottom-width:0px;"/>
						</div>
					</div>
					<!-- Line 4b1 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">
								<span style="width:1.5mm"/>
							</div>
							<div class="styLNDesc" style="width:139mm;">
								<div class="styGenericDiv">
									<span style="font-weight:bold;padding-left:.5mm;padding-right:.5mm;">(1)</span>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/GAAPInd"/>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/GAAPInd"/>
										</xsl:call-template>     GAAP
			        </label>
								</div>
								<div class="styGenericDiv">
									<span style="font-weight:bold;padding-left:.5mm;padding-right:.5mm;">(2)</span>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/IFRSInd"/>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/IFRSInd"/>
										</xsl:call-template>     IFRS
			        </label>
								</div>
								<div class="styGenericDiv">
									<span style="font-weight:bold;padding-left:.5mm;padding-right:.5mm;">(3)</span>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/StatutoryInd"/>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/StatutoryInd"/>
										</xsl:call-template>     Statutory
			        </label>
								</div>
								<div class="styGenericDiv">
									<span style="font-weight:bold;padding-left:.5mm;padding-right:.5mm;">(4)</span>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/TaxBasisInd"/>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/TaxBasisInd"/>
										</xsl:call-template>     Tax-basis
			        </label>
								</div>
								<div class="styGenericDiv">
									<span style="font-weight:bold;padding-left:.5mm;padding-right:.5mm;">(5)</span>
									<input type="checkbox" class="styCkbox">								
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/OtherInd"/>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/OtherInd"/>
										</xsl:call-template>     Other (specify)
			        </label>
								</div>
								<span style="width:32mm;border-bottom:solid 1px;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/OtherInd/@methodOfAccountingOtherDesc"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="background-color:lightgrey;height:8mm;"/>
							<div class="styLNAmountBox" style="background-color:lightgrey;height:8mm;"/>
						</div>
					</div>
					<!-- Line 5a -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">5a</div>
							<div class="styLNDesc" style="width:138mm;">
								<span style="float:left;">
							Net income from nonincludible foreign entities 
          (attach statement)
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/NetIncmNonincludibleFrgnEntAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox">5a</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateNegativeNumber">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/NetIncmNonincludibleFrgnEntAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 5b -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">
								<span style="width:1.5mm"/>b</div>
							<div class="styLNDesc" style="width:138mm;">
								<span style="float:left;">
							Net loss from nonincludible foreign entities (attach statement and enter as a positive amount)
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/NetLossNonincludibleFrgnEntAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox">5b</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/NetLossNonincludibleFrgnEntAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 6a -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">6a</div>
							<div class="styLNDesc" style="width:138mm;">
								<span style="float:left;">Net income from nonincludible U.S. entities (attach statement)
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/NetIncmNonincludibleUSEntAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox">6a</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateNegativeNumber">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/NetIncmNonincludibleUSEntAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 6b -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">
								<span style="width:1.5mm"/>b</div>
							<div class="styLNDesc" style="width:138mm;">
								<span style="float:left;">Net loss from nonincludible U.S. entities (attach statement and enter as a positive amount)
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/NetLossNonincludibleUSEntAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox">6b</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/NetLossNonincludibleUSEntAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 7a -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">7a</div>
							<div class="styLNDesc" style="width:138mm;">
								<span style="float:left;">
          Net income (loss) of other includible foreign disregarded entities (attach statement)
                <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/NetIncmOthIncludibleFrgnEntAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox">7a</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/NetIncmOthIncludibleFrgnEntAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 7b -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">
								<span style="width:1.5mm"/>b</div>
							<div class="styLNDesc" style="width:138mm;">
								<span style="float:left;">
          Net income (loss) of other includible U.S. disregarded entities (attach statement)
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/NetIncmOthIncludibleUSEntAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox">7b</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/NetIncmOthIncludibleUSEntAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 7c -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">
								<span style="width:1.5mm"/>c</div>
							<div class="styLNDesc" style="width:138mm;">
								<span style="float:left;">
         Net income (loss) of other includible entities (attach statement)
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/NetLossOtherIncludibleCorpAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox">7c</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/NetLossOtherIncludibleCorpAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 8 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:8mm;">8</div>
							<div class="styLNDesc" style="width:138mm;height:8mm">
          Adjustment to eliminations of transactions between includible entities and nonincludible entities
          							<span style="float:left;">
(attach statement)           
           <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/AdjToEliminateTransactionsAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">..........................</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">8</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/AdjToEliminateTransactionsAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 9 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">9</div>
							<div class="styLNDesc" style="width:138mm;">
								<span style="float:left;">Adjustment to reconcile income statement period to tax year (attach statement)
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/AdjRecnclIncmStmtYrToTYAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox">9</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/AdjRecnclIncmStmtYrToTYAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 10a -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox">10a</div>
							<div class="styLNDesc" style="width:138mm;">
								<span style="float:left;">Intercompany dividend adjustments to reconcile to line 11 (attach statement)
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/IntercompanyDivAdjToRecnclAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox">10a</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/IntercompanyDivAdjToRecnclAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 10b -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left:4.5mm">b</div>
							<div class="styLNDesc" style="width:138mm;">
								<span style="float:left;">Other statutory accounting adjustments 
          to reconcile to line 11 (attach statement)
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/OtherStryAccountingToRcnclAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox">10b</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/OtherStryAccountingToRcnclAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 10c -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left:4.5mm">c</div>
							<div class="styLNDesc" style="width:138mm;">
								<span style="float:left;">Other adjustments to reconcile to
           amount on line 11 (attach statement)
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/OtherAdjustmentsToReconcileAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox">10c</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/OtherAdjustmentsToReconcileAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 11 -->
					<div class="styBB" style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox">11</div>
							<div class="styLNDesc" style="width:138mm;height:8mm;">
								<span style="float:left;">
									<span class="styBoldText">
          Net income (loss) per income statement of includible corporations.</span> Combine lines 4 through 10
            </span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
								<br/>
								<b>Note. </b>Part I, line 11, must equal the amount on Part II, line 30, column (a), and Schedule M-2, line 2.
          </div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBoxNBB" style="border-bottom-width:1px">11</div>
							<div class="styLNAmountBoxNBB" style="border-bottom-width:1px">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/NetIncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 12 -->
					<div class="styBB" style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox">12</div>
                   Enter the total amount (not just the corporation’s share) 
          of the assets and liabilities of all entities included or removed on the following lines.<br/>
							<!-- Line 12 -->
							<div style="width:187mm;">
								<div style="float:left;clear:none;">
									<div class="styLNLeftNumBoxSD"/>
									<div class="styLNDesc" style="width:70mm;"/>
								</div>
								<div class="styLNAmountBox" style="text-align:center;border-top-width:1px">Total Assets</div>
								<div class="styLNAmountBox" style="text-align:center;border-top-width:1px;border-right-width:1px">Total Liabilities</div>
							</div>
							<!-- Line 12a -->
							<div style="width:187mm;">
								<div style="float:left;clear:none;">
									<div class="styLNLeftLtrBoxDD">a</div>
									<div class="styLNDesc" style="width:70mm;">
										<span style="float:left;">Included on Part I, line 4</span>
										<span style="float:right;padding-right:1mm;">
											<img src="{$ImagePath}/1120SchN_Bullet_Title.gif" width="10" height="8" alt="Bullet"/>
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
									</div>
								</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/EntIncldWorldwideCnsldtAstAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="border-right-width:1px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/EntIncldWorldwideCnsldtLiabAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 12b -->
							<div style="width:187mm;">
								<div style="float:left;clear:none;">
									<div class="styLNLeftLtrBoxDD">b</div>
									<div class="styLNDesc" style="width:70mm;">
										<span style="float:left;">Removed on Part I, line 5</span>
										<span style="float:right;padding-right:1mm;">
											<img src="{$ImagePath}/1120SchN_Bullet_Title.gif" width="10" height="8" alt="Bullet"/>
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
									</div>
								</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/EntRmvdNonincludibleFrgnAstAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="border-right-width:1px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/EntRmvdNonincludblFrgnLiabAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 12c -->
							<div style="width:187mm;">
								<div style="float:left;clear:none;">
									<div class="styLNLeftLtrBoxDD">c</div>
									<div class="styLNDesc" style="width:70mm;">
										<span style="float:left;">Removed on Part I, line 6</span>
										<span style="float:right;padding-right:1mm;">
											<img src="{$ImagePath}/1120SchN_Bullet_Title.gif" width="10" height="8" alt="Bullet"/>
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
									</div>
								</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/EntRmvdNonincludibleUSAstAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="border-right-width:1px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/EntRmvdNonincludibleUSLiabAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 12d -->
							<div style="width:187mm;">
								<div style="float:left;clear:none;">
									<div class="styLNLeftLtrBoxDD">d</div>
									<div class="styLNDesc" style="width:70mm;">
										<span style="float:left;">Included on Part I, line 7</span>
										<span style="float:right;padding-right:1mm;">
											<img src="{$ImagePath}/1120SchN_Bullet_Title.gif" width="10" height="8" alt="Bullet"/>
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
									</div>
								</div>
								<div class="styLNAmountBox" style="border-bottom-width:0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/EntIncldOtherIncludibleAstAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="border-right-width:1px;border-bottom-width:0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/EntIncldOtherIncludibleLiabAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- Page 1 Footer -->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;clear:all;">
						<div style="float:left;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see the Instructions for Form 1120.</span>
							<span style="width:7mm;"/>                        
      Cat. No. 37961C 
    </div>
						<div style="float:right;clear:none;">
							<span class="styBoldText">Schedule M-3 (Form 1120) 2013</span>
						</div>
					</div>
					<!-- Page 2 -->
					<!-- Page 2 Header -->
					<div class="styBB" style="width:187mm;clear:all;float:none;">
						<div style="float:left;">Schedule M-3 (Form 1120) 2013</div>
						<div style="float:right;">Page <span style="font-size:9pt;font-weight:bold;">2</span>
						</div>
					</div>
					<!-- Name and EIN Line -->
					<div class="styBB" style="width:187mm;">
						<!-- Name -->
						<div style="width:138mm;height:8mm;border-right:solid 1px;float:left;clear:none;">
          Name of corporation (common parent, if consolidated return)<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/BusinessName/BusinessNameLine1"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/BusinessName/BusinessNameLine2"/>
							</xsl:call-template>
						</div>
						<!-- Employer Identification Number -->
						<div style="width:47mm;float:right;clear:none;padding-left:1mm;">
							<span class="styBoldText">Employer identification number</span>
							<br/><br/>
							<xsl:choose>
								<xsl:when test="$Form1120ScheduleM3/EIN">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/EIN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/MissingEINReasonCd"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!-- start check box line1  -->
					<div style="width:187mm;font-size:6pt;clear:all;">
						<div class="styGenericDiv" style="padding-left:2mm;">
           	Check applicable box(es): <span style="font-weight:bold;padding-left:.5mm;padding-right:.5mm;">(1)</span>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/ConsolidatedGroupInd"/>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/ConsolidatedGroupInd"/>
								</xsl:call-template>
							</label>
						</div>
						<div class="styGenericDiv" style="padding-left:1px;">Consolidated group 
           	<span style="font-weight:bold;padding-left:.5mm;padding-right:.5mm;">(2)</span>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/ParentCorporationInd"/>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/ParentCorporationInd"/>
								</xsl:call-template>
							</label>
						</div>
						<div class="styGenericDiv" style="padding-left:1px;">
           	 Parent corp  <span style="font-weight:bold;padding-left:.5mm;padding-right:.5mm;">(3)</span>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/ConsolidatedEliminationsInd"/>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/ConsolidatedEliminationsInd"/>
								</xsl:call-template>
							</label>
						</div>
						<div class="styGenericDiv" style="padding-left:1px;">
           	Consolidated eliminations 
           	<span style="font-weight:bold;padding-left:.5mm;padding-right:.5mm;">(4)</span>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/SubsidiaryCorporationInd"/>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/SubsidiaryCorporationInd"/>
								</xsl:call-template>
							</label>
						</div>
						<div class="styGenericDiv" style="padding-left:1px;padding-top:6px;">Subsidiary corp</div>
						<div class="styGenericDiv" style="padding-left:1px;;">
							<span style="font-weight:bold;padding-left:.5mm;padding-right:.5mm;">(5)</span>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/Mixed1120LPCGroupInd"/>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/Mixed1120LPCGroupInd"/>
								</xsl:call-template>
					Mixed 1120/L/PC group
				</label>
						</div>
					</div>
					<!-- end check box line1  -->
					<!-- start check box line2  -->
					<div style="width:187mm;font-size:6pt;">
						<div class="styGenericDiv" style="padding-left:2mm;">
           	Check if a sub-consolidated: <span style="font-weight:bold;padding-left:.5mm;padding-right:.5mm;">(6)</span>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/Is1120GroupInd"/>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/Is1120GroupInd"/>
								</xsl:call-template>
							</label>
						</div>
						<div class="styGenericDiv" style="padding-left:1px;">
           	1120 group <span style="font-weight:bold;padding-left:.5mm;padding-right:.5mm;">(7)</span>
							<input type="checkbox" alt="alt" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/Is1120EliminationsInd"/>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/Is1120EliminationsInd"/>
								</xsl:call-template>
							</label>
						</div>
						<div class="styGenericDiv" style="padding-left:1px;padding-top:6px;">
           	1120 eliminations</div>
					</div>
					<!-- end check box line2  -->
					<!-- Subsidiary Name and EIN Line -->
					<div style="width:187mm;">
						<!-- Name -->
						<div style="width:138mm;height:8mm;border-right:solid 1px;float:left;clear:none;border-top:solid 1px">Name of subsidiary (if consolidated return)<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/     CorpIncomeLossItemsDtl/SubsidiaryBusinessName/BusinessNameLine1"/>
							</xsl:call-template>
							<xsl:if test="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/SubsidiaryBusinessName/   BusinessNameLine2">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/SubsidiaryBusinessName/BusinessNameLine2"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<!-- Employer Identification Number -->
						<div style="width:48.9mm;float:right;clear:none;border-top:solid 1px;padding-left:2mm">
							<span class="styBoldText">Employer identification number</span>
							<br/><br/>
							<xsl:if test="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/SubsidiaryEIN !=' '">
								<span style="font-weight:normal;">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/SubsidiaryEIN"/>
									</xsl:call-template>
								</span>
							</xsl:if>
							<xsl:if test="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/MissingEINReasonCd !=' '">
								<span style="font-weight:normal;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/MissingEINReasonCd"/>
									</xsl:call-template>
								</span>
							</xsl:if>
						</div>
					</div>
					<!-- Part 2 - Header -->
					<div style="width:187mm;height:8mm;border-style:solid; border-bottom-width:1px;border-top-width:1px; border-right-width:0px;border-left-width:0px;padding-top:0;float:left;">
						<span class="styPartName" style="height:4mm;width:14mm;padding: .25mm 1mm .25mm 1mm;">Part II</span>
						<span class="styPartDesc" style="width:170mm;">
							<span style="width:2mm;"/>Reconciliation of Net Income (Loss) per Income Statement of Includible Corporations With<br/>
							<span style="width:2mm;"/>Taxable Income per Return<span style="padding-left:1mm;font-weight:normal">(see instructions)</span>
						</span>
					</div>
					<!-- Part II Table -->
					<table class="styTable" id="IRS1120ScheduleM3PartIITable" summary="Reconciliation of Net Income (Loss) per Income Statement of Includible Corporations With Taxable Income per Return " cellspacing="0" cellpadding="0" style="font-size:7pt;width:187mm;clear:all;">
						<tr>
							<th scope="col" class="styTableThead" style="width:6mm;display:table-cell;"/>
							<th scope="col" class="styTableThead" style="width:81mm;text-align:center;font-size:8pt;display:table-cell;">
                           Income (Loss) Items<br/>
								<span style="font-weight:normal">
                           (Attach schedules for lines 1 through 11)</span>
							</th>
							<th scope="col" class="styIRS1120ScheduleM3TheadCell" style="display:table-cell;">
								<span class="styBoldText">
                           (a)</span>
								<br/> Income (Loss) per<br/> Income Statement<br/>
							</th>
							<th scope="col" class="styIRS1120ScheduleM3TheadCell" style="display:table-cell;">
								<span class="styBoldText">
                           (b)</span>
								<br/> Temporary<br/> Difference</th>
							<th scope="col" class="styIRS1120ScheduleM3TheadCell" style="display:table-cell;">
								<span class="styBoldText">
                           (c)</span>
								<br/> Permanent<br/> Difference</th>
							<th scope="col" class="styIRS1120ScheduleM3TheadCell" style="display:table-cell;">
								<span class="styBoldText">
                           (d)</span>
								<br/> Income (Loss) per<br/> Tax Return<br/>
							</th>
						</tr>
						<!-- Part II - Line 1 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell" style="width:6mm;">
								<span style="width:1.5mm;"/>1</td>
							<td style="width:81mm; text-align:left;padding-left:2mm;border:none;">
								Income (loss) from equity method foreign corporations 
						 		<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/IncomeLossEquityMethodFrgnCorp"/>
									</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/IncomeLossEquityMethodFrgnCorp/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/IncomeLossEquityMethodFrgnCorp/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/IncomeLossEquityMethodFrgnCorp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3ShadedCell">
								<span style="width:1mm"/>
							</td>
						</tr>
						<!-- Part II - Line 2 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">
								<span style="width:1.5mm;"/>2</td>
							<td>
								<span style="float:left;padding-left:2mm;">Gross foreign dividends not previously taxed
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/GrossFrgnDividendsNotPrevTaxed"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/GrossFrgnDividendsNotPrevTaxed/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/GrossFrgnDividendsNotPrevTaxed/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/GrossFrgnDividendsNotPrevTaxed/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/GrossFrgnDividendsNotPrevTaxed/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 3 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">
								<span style="width:1.5mm;"/>3</td>
							<td>
								<span style="float:left;padding-left:2mm;">
							Subpart F, QEF, and similar income inclusions
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/SubpartFQEFSimilarIncmInclsn"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
							</td>
							<td class="styIRS1120ScheduleM3ShadedCell" style="border-bottom-width:0px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/SubpartFQEFSimilarIncmInclsn/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/SubpartFQEFSimilarIncmInclsn/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/SubpartFQEFSimilarIncmInclsn/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 4 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">
								<span style="width:1.5mm;"/>4</td>
							<td>
								<span style="float:left;padding-left:2mm;">
							Section 78 gross-up
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/Section78GrossUp"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
							</td>
							<td class="styIRS1120ScheduleM3ShadedCell">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/Section78GrossUp/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/Section78GrossUp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/Section78GrossUp/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 5 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">
								<span style="width:1.5mm;"/>5</td>
							<td>
								<span style="float:left;padding-left:2mm;">
							Gross foreign distributions previously taxed 
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/GrossForeignDistriPrevTaxed"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/GrossForeignDistriPrevTaxed/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/GrossForeignDistriPrevTaxed/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/GrossForeignDistriPrevTaxed/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3ShadedCell" style="border-bottom-width:0px;">
								<span style="width:1mm"/>
							</td>
						</tr>
						<!-- Part II - Line 6 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">
								<span style="width:1.5mm;"/>6</td>
							<td>
								<span style="float:left;padding-left:2mm;">
							Income (loss) from equity method U.S. corporations
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/IncomeLossEquityMethodUSCorp"/>
									</xsl:call-template>
								</span>
								<!--							 <span class="styDotLn" style="float:right;padding-right:1mm;"></span>-->
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/IncomeLossEquityMethodUSCorp/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/IncomeLossEquityMethodUSCorp/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/IncomeLossEquityMethodUSCorp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3ShadedCell">
								<span style="width:1mm"/>
							</td>
						</tr>
						<!-- Part II - Line 7 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">
								<span style="width:1.5mm;"/>7</td>
							<td>
								<span style="float:left;padding-left:2mm;">
							U.S. dividends not eliminated in tax consolidation
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/USDivNotEliminatedTaxConsol"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/USDivNotEliminatedTaxConsol/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/USDivNotEliminatedTaxConsol/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/USDivNotEliminatedTaxConsol/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/USDivNotEliminatedTaxConsol/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 8 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">
								<span style="width:1.5mm;"/>8</td>
							<td>
								<span style="float:left;padding-left:2mm;">
							Minority interest for includible corporations
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/MinorityInterestIncludibleCorp"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/MinorityInterestIncludibleCorp/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/MinorityInterestIncludibleCorp/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/MinorityInterestIncludibleCorp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3ShadedCell">
								<span style="width:1mm"/>
							</td>
						</tr>
						<!-- Part II - Line 9 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">
								<span style="width:1.5mm;"/>9</td>
							<td>
								<span style="float:left;padding-left:2mm;">
							Income (loss) from U.S. partnerships
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/IncomeLossUSPartnerships"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/IncomeLossUSPartnerships/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/IncomeLossUSPartnerships/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/IncomeLossUSPartnerships/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/IncomeLossUSPartnerships/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 10 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">10</td>
							<td>
								<span style="float:left;padding-left:2mm;">
							Income (loss) from foreign partnerships
            <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/IncomeLossForeignPartnerships"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/IncomeLossForeignPartnerships/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/IncomeLossForeignPartnerships/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/IncomeLossForeignPartnerships/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/IncomeLossForeignPartnerships/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 11 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">11</td>
							<td style="padding-top:.5mm;">
								<span style="float:left;padding-left:2mm;">
							Income (loss) from other pass-through entities
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/IncomeLossPassThroughEntities"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/IncomeLossPassThroughEntities/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/IncomeLossPassThroughEntities/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/IncomeLossPassThroughEntities/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/IncomeLossPassThroughEntities/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 12 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">12</td>
							<td style="padding-top:.5mm;padding-left:2mm;">
							Items relating to reportable transactions (attach statement)
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/ItemsRelatedReportableTransGrp"/>
									</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/ItemsRelatedReportableTransGrp/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/ItemsRelatedReportableTransGrp/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/ItemsRelatedReportableTransGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/ItemsRelatedReportableTransGrp/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 13 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">13</td>
							<td>
								<span style="float:left;padding-left:2mm;">
							Interest income (attach Form 8916-A)
           <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/InterestIncomeForm8916AGrp"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/InterestIncomeForm8916AGrp/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/InterestIncomeForm8916AGrp/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/InterestIncomeForm8916AGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/InterestIncomeForm8916AGrp/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 14 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">14</td>
							<td>
								<span style="float:left;padding-left:2mm;">
							Total accrual to cash adjustment
									</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/TotalAccrualCashAdjustmentGrp/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/TotalAccrualCashAdjustmentGrp/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/TotalAccrualCashAdjustmentGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/TotalAccrualCashAdjustmentGrp/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 15 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">15</td>
							<td>
								<span style="float:left;padding-left:2mm;">
							Hedging transactions
									</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/HedgingTransactions/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/HedgingTransactions/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/HedgingTransactions/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/HedgingTransactions/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 16 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">16</td>
							<td>
								<span style="float:left;padding-left:2mm;">
							Mark-to-market income (loss)
									</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/MarkToMarketIncomeLoss/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/MarkToMarketIncomeLoss/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/MarkToMarketIncomeLoss/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/MarkToMarketIncomeLoss/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 17 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">17</td>
							<td>
								<span style="float:left;padding-left:2mm;">
							Cost of goods sold (attach Form 8916-A) 
         <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/CostOfGoodsSoldGrp"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateNegativeNumber">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3               /CorpIncomeLossItemsDtl/CostOfGoodsSoldGrp/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/CostOfGoodsSoldGrp/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/CostOfGoodsSoldGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateNegativeNumber">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/CostOfGoodsSoldGrp/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 18 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">18</td>
							<td>
								<span style="float:left;padding-left:2mm;">
							Sale versus lease (for sellers and/or lessors)
							</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/SalesVersusLease/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/SalesVersusLease/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/SalesVersusLease/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/SalesVersusLease/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 19 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">19</td>
							<td>
								<span style="float:left;padding-left:2mm;">
							Section 481(a) adjustments
									</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
							</td>
							<td class="styIRS1120ScheduleM3ShadedCell">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/Section481aAdjustments/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/Section481aAdjustments/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/Section481aAdjustments/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 20 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">20</td>
							<td>
								<span style="float:left;padding-left:2mm;">
							Unearned/deferred revenue
									</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/UnearnedDeferredRevenueGrp/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/UnearnedDeferredRevenueGrp/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/UnearnedDeferredRevenueGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/UnearnedDeferredRevenueGrp/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 21 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">21</td>
							<td>
								<span style="float:left;padding-left:2mm;">
Income recognition from long-term contracts
									</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/IncomeRecognitionLTContracts/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/IncomeRecognitionLTContracts/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/IncomeRecognitionLTContracts/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/IncomeRecognitionLTContracts/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 22 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">22</td>
							<td>
								<span style="float:left;padding-left:2mm;">
Original issue discount and other imputed interest
									</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/OrigIssueDiscountOthImputedInt/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/OrigIssueDiscountOthImputedInt/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/OrigIssueDiscountOthImputedInt/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/OrigIssueDiscountOthImputedInt/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 23a -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">23a</td>
							<td style="padding-top:.5mm;padding-left:2mm;">
								<span style="float:left;">
Income statement gain/loss on sale, exchange,
                      abandonment, worthlessness, or other disposition of
                      assets other than inventory and pass-through entities
									</span>
								<!--<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>-->
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/IncmStmtGainLossAstNotInvntry/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/IncmStmtGainLossAstNotInvntry/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/IncmStmtGainLossAstNotInvntry/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3ShadedCell" style="border-bottom-width:1px;">
								<span style="width:1mm"/>
							</td>
						</tr>
						<!-- Part II - Line 23b -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell" style="padding-left:.5mm;padding-left:4mm;">b</td>
							<td style="padding-top:.5mm;padding-left:2mm;">
Gross capital gains from Schedule D, excluding
<span style="float:left;">
                              amounts from pass-through entities
									</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
							</td>
							<td class="styIRS1120ScheduleM3ShadedCell" style="border-bottom-width:0px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/GrossCapitalGainsFromSchD/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/GrossCapitalGainsFromSchD/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/GrossCapitalGainsFromSchD/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 23c -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell" style="padding-left:5mm;padding-left:4mm;">c</td>
							<td style="padding-top:.5mm;padding-left:2mm;">
Gross capital losses from Schedule D, excluding
              amounts from pass-through entities, abandonment
              <span style="float:left;">losses, and worthless stock losses
									</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
							</td>
							<td class="styIRS1120ScheduleM3ShadedCell" style="border-bottom-width:0px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/GrossCapitalLossesFromSchD/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/GrossCapitalLossesFromSchD/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/GrossCapitalLossesFromSchD/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 23d -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell" style="padding-left:5mm;padding-left:4mm;">d</td>
							<td style="padding-top:.5mm;padding-left:2mm;">
							Net gain/loss reported on Form 4797, line 17,
                           excluding amounts from pass-through entities,
                           <span style="float:left;">
							   abandonment losses, and worthless stock losses
							</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
							</td>
							<td class="styIRS1120ScheduleM3ShadedCell" style="border-bottom-width:0px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/GainLossReportedOnForm4797/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/GainLossReportedOnForm4797/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/GainLossReportedOnForm4797/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 23e -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell" style="padding-left:5mm;padding-left:4mm;">e</td>
							<td style="padding-top:.5mm;padding-left:2mm;">
								<span style="float:left;">
Abandonment losses
									</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
							</td>
							<td class="styIRS1120ScheduleM3ShadedCell" style="border-bottom-width:0px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/AbandonmentLosses/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/AbandonmentLosses/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/AbandonmentLosses/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 23f -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell" style="padding-left:5mm;padding-left:4mm;">f</td>
							<td>
								<span style="float:left;padding-left:2mm;">
Worthless stock losses (attach statement)
   <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/WorthlessStockLosses"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
							</td>
							<td class="styIRS1120ScheduleM3ShadedCell" style="border-bottom-width:0px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/WorthlessStockLosses/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/WorthlessStockLosses/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/WorthlessStockLosses/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 23g -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell" style="padding-left:5mm;padding-left:4mm;">g</td>
							<td style="padding-top:.5mm;padding-left:2mm;">
							Other gain/loss on disposition of assets other than
							<span style="padding-top:1mm;float:left;">
							inventory
							</span>
								<span class="styDotLn" style="padding-top:1mm;float:right;padding-right:1mm;">...............</span>
							</td>
							<td class="styIRS1120ScheduleM3ShadedCell" style="border-bottom-width:0px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/OthGainLossAssetsNotInventory/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/OthGainLossAssetsNotInventory/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/OthGainLossAssetsNotInventory/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 24 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">24</td>
							<td style="padding-top:.5mm;">
								<span style="float:left;padding-left:2mm;">
Capital loss limitation and carryforward used
									</span>
								<span class="styDotLn" style="padding-top:1mm;float:right;padding-right:1mm;">....</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell" style="background-color:lightgrey">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/CapLossLimitationAndCfwdUsed/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/      CapLossLimitationAndCfwdUsed /TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/ CapLossLimitationAndCfwdUsed/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/ CapLossLimitationAndCfwdUsed/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 25 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">25</td>
							<td style="padding-top:.5mm;padding-left:2mm;">
Other income (loss) items with differences (attach<span style="float:left;">statement)
<!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/OthIncmLossItemsDifferences"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/OthIncmLossItemsDifferences/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/OthIncmLossItemsDifferences/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/OthIncmLossItemsDifferences/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/OthIncmLossItemsDifferences/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 26 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">26</td>
							<td style="padding-top:.5mm;padding-left:2mm;">
								<span class="styBoldText">Total income (loss) items.   </span>
								<br/>
								<span style="padding-top:1mm;float:left;">
Combine lines 1 through 25	
								</span>
								<span class="styDotLn" style="padding-top:1mm;float:right;padding-right:1mm;">.........</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/TotalIncomeLossItems/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/TotalIncomeLossItems/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/TotalIncomeLossItems/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/TotalIncomeLossItems/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 27 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">27</td>
							<td style="padding-top:.5mm;padding-left:2mm;">
								<span class="styBoldText">Total expense/deduction items</span>
								<br/>
								<span style="padding-top:1mm;float:left;">
								(from Part III, line 38) </span>
								<span class="styDotLn" style="padding-top:1mm;float:right;padding-right:1mm;">..........</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/TotalExpenseDeductionItems/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/TotalExpenseDeductionItems/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/TotalExpenseDeductionItems/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/TotalExpenseDeductionItems/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 28 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">28</td>
							<td>
								<span style="float:left;padding-left:2mm;">
Other items with no differences
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/OtherItemsNoDifferences/IncomePerIncomeStatementAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3ShadedCell" style="border-bottom-width:1px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1120ScheduleM3ShadedCell" style="border-bottom-width:1px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/OtherItemsNoDifferences/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 29a -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">29a</td>
							<td style="padding-top:.5mm;padding-left:2mm;">
							Mixed groups, see instructions. All others, combine
							<span style="float:left;">
							lines 26 through 28
							</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/SubgroupReconciliationTotals/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/SubgroupReconciliationTotals/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/SubgroupReconciliationTotals/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/SubgroupReconciliationTotals/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 29b -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell" style="padding-left:4mm">b</td>
							<td style="padding-top:.5mm;padding-left:2mm;">
								<span style="float:left;">
PC insurance subgroup reconciliation totals
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/PCInsSubgroupRecnclTotals/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/PCInsSubgroupRecnclTotals/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/PCInsSubgroupRecnclTotals/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/PCInsSubgroupRecnclTotals/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 29c -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell" style="padding-left:4mm">c</td>
							<td style="padding-top:.5mm;padding-left:2mm;">
								<span style="float:left;">
Life insurance subgroup reconciliation totals
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/LifeInsSubgroupRecnclTotals/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/LifeInsSubgroupRecnclTotals/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/LifeInsSubgroupRecnclTotals/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/LifeInsSubgroupRecnclTotals/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 30 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">30</td>
							<td>
								<span style="float:left;padding-left:2mm;"><b>Reconciliation totals. </b>Combine lines 29a through 29c</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/      ReconciliationTotals/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/ReconciliationTotals/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/  CorpIncomeLossItemsDtl/ReconciliationTotals/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/      ReconciliationTotals/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<div class="styBB" style="width:187mm;padding-left:11mm">
						<span class="styBoldText">Note.</span> 
         Line 30, column (a), must equal the amount on Part I, line 11, and column (d) must equal Form 1120, page 1, line 28.</div>
					<div class="pageEnd" style="width:187mm;clear:all;">
						<div class="styBoldText" style="float:right;padding-top:1mm;">Schedule M-3 (Form 1120) 2013</div>
					</div>
					<!-- Page 3 -->
					<!-- Page 3 Header -->
					<div class="styBB" style="width:187mm;float:none;">
						<div style="float:left;">Schedule M-3 (Form 1120) 2013</div>
						<div style="float:right;">Page <span style="font-size:9pt;font-weight:bold;">3</span>
						</div>
					</div>
					<!-- Name and EIN Line -->
					<div class="styBB" style="width:187mm;">
						<!-- Name -->
						<div style="width:138mm;height:8mm;border-right:solid 1px;float:left;clear:none;">
          Name of corporation (common parent, if consolidated return)<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/BusinessName/BusinessNameLine1"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/BusinessName/BusinessNameLine2"/>
							</xsl:call-template>
						</div>
						<!-- Employer Identification Number -->
						<div style="width:47mm;float:right;clear:none;">
							<span class="styBoldText">Employer identification number</span>
							<br/><br/>
							<xsl:choose>
								<xsl:when test="$Form1120ScheduleM3/EIN">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/EIN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/MissingEINReasonCd"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!-- Defined to resolve ID conflict for ConsolidatedGroup2-->
					<xsl:variable name="consolidatedGroup2BaseID">
						<xsl:call-template name="PopulateID">
							<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/ConsolidatedGroupInd"/>
						</xsl:call-template>
					</xsl:variable>
					<!-- Defined to resolve ID conflict for ParentCorporation2-->
					<xsl:variable name="parentCorporation2BaseID">
						<xsl:call-template name="PopulateID">
							<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/ParentCorporationInd"/>
						</xsl:call-template>
					</xsl:variable>
					<!-- Defined to resolve ID conflict for ConsolidatedEliminations2-->
					<xsl:variable name="consolidatedEliminations2BaseID">
						<xsl:call-template name="PopulateID">
							<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/ConsolidatedEliminationsInd"/>
						</xsl:call-template>
					</xsl:variable>
					<!-- Defined to resolve ID conflict for SubsidiaryCorporation2-->
					<xsl:variable name="subsidiaryCorporation2BaseID">
						<xsl:call-template name="PopulateID">
							<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/SubsidiaryCorporationInd"/>
						</xsl:call-template>
					</xsl:variable>
					<!-- Defined to resolve ID conflict for Mixed1120LPCGroup2-->
					<xsl:variable name="mixed1120LPCGroup2BaseID">
						<xsl:call-template name="PopulateID">
							<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/Mixed1120LPCGroupInd"/>
						</xsl:call-template>
					</xsl:variable>
					<!-- Defined to resolve ID conflict for Is1120Group2-->
					<xsl:variable name="is1120Group2BaseID">
						<xsl:call-template name="PopulateID">
							<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/Is1120GroupInd"/>
						</xsl:call-template>
					</xsl:variable>
					<!-- start check box line1  -->
					<div style="width:187mm;font-size:6pt;clear:all;">
						<div class="styGenericDiv" style="padding-left:2mm;">
           	Check applicable box(es): <span style="font-weight:bold;padding-left:.5mm;padding-right:.5mm;">(1)</span>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl        /ConsolidatedGroupInd"/>
								</xsl:call-template>
								<xsl:attribute name="id"><xsl:value-of select="concat($consolidatedGroup2BaseID, '[2]')"/></xsl:attribute>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/ConsolidatedGroupInd"/>
								</xsl:call-template>
								<xsl:attribute name="for"><xsl:value-of select="concat($consolidatedGroup2BaseID, '[2]')"/></xsl:attribute>
							</label>
						</div>
						<div class="styGenericDiv" style="padding-left:1px;">Consolidated group 
           	<span style="font-weight:bold;padding-left:.5mm;padding-right:.5mm;">(2)</span>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/ParentCorporationInd"/>
								</xsl:call-template>
								<xsl:attribute name="id"><xsl:value-of select="concat($parentCorporation2BaseID, '[2]')"/></xsl:attribute>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/ParentCorporationInd"/>
								</xsl:call-template>
								<xsl:attribute name="for"><xsl:value-of select="concat($parentCorporation2BaseID, '[2]')"/></xsl:attribute>
							</label>
						</div>
						<div class="styGenericDiv" style="padding-left:1px;">
           	 Parent corp  <span style="font-weight:bold;padding-left:.5mm;padding-right:.5mm;">(3)</span>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/ConsolidatedEliminationsInd"/>
								</xsl:call-template>
								<xsl:attribute name="id"><xsl:value-of select="concat($consolidatedEliminations2BaseID, '[2]')"/></xsl:attribute>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/ConsolidatedEliminationsInd"/>
								</xsl:call-template>
								<xsl:attribute name="for"><xsl:value-of select="concat($consolidatedEliminations2BaseID, '[2]')"/></xsl:attribute>
							</label>
						</div>
						<div class="styGenericDiv" style="padding-left:1px;">
           	Consolidated eliminations 
           	<span style="font-weight:bold;padding-left:.5mm;padding-right:.5mm;">(4)</span>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/SubsidiaryCorporationInd"/>
								</xsl:call-template>
								<xsl:attribute name="id"><xsl:value-of select="concat($subsidiaryCorporation2BaseID, '[2]')"/></xsl:attribute>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/SubsidiaryCorporationInd"/>
								</xsl:call-template>
								<xsl:attribute name="for"><xsl:value-of select="concat($subsidiaryCorporation2BaseID, '[2]')"/></xsl:attribute>
							</label>
						</div>
						<div class="styGenericDiv" style="padding-left:1px;padding-top:6px;">Subsidiary corp</div>
						<div class="styGenericDiv" style="padding-left:1px;;">
							<span style="font-weight:bold;padding-left:.5mm;padding-right:.5mm;">(5)</span>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/Mixed1120LPCGroupInd"/>
								</xsl:call-template>
								<xsl:attribute name="id"><xsl:value-of select="concat($mixed1120LPCGroup2BaseID, '[2]')"/></xsl:attribute>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/Mixed1120LPCGroupInd"/>
								</xsl:call-template>
								<xsl:attribute name="for"><xsl:value-of select="concat($mixed1120LPCGroup2BaseID, '[2]')"/></xsl:attribute>
					Mixed 1120/L/PC group
				</label>
						</div>
					</div>
					<!-- end check box line1  -->
					<!-- start check box line2  -->
					<div style="width:187mm;font-size:6pt;">
						<div class="styGenericDiv" style="padding-left:2mm;">
           	Check if a sub-consolidated: <span style="font-weight:bold;padding-left:.5mm;padding-right:.5mm;">(6)</span>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/Is1120GroupInd"/>
								</xsl:call-template>
								<xsl:attribute name="id"><xsl:value-of select="concat($is1120Group2BaseID, '[2]')"/></xsl:attribute>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/Is1120GroupInd"/>
								</xsl:call-template>
								<xsl:attribute name="for"><xsl:value-of select="concat($is1120Group2BaseID, '[2]')"/></xsl:attribute>
							</label>
						</div>
						<div class="styGenericDiv" style="padding-left:1px;">
           	1120 group <span style="font-weight:bold;padding-left:.5mm;padding-right:.5mm;">(7)</span>
							<input type="checkbox" alt="alt" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/Is1120EliminationsInd"/>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/CorpIncomeLossItemsDtl/Is1120EliminationsInd"/>
								</xsl:call-template>
							</label>
						</div>
						<div class="styGenericDiv" style="padding-left:1px;padding-top:6px;">
           	1120 eliminations</div>
					</div>
					<!-- end check box line2  -->
					<!-- Subsidiary Name and EIN Line -->
					<div style="width:187mm;">
						<!-- Name -->
						<div style="width:138mm;height:8mm;border-right:solid 1px;float:left;clear:none;border-top:solid 1px;">
          Name of subsidiary (if consolidated return)<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/     ExpenseDeductionItemsGrp/SubsidiaryBusinessName/BusinessNameLine1"/>
							</xsl:call-template>
							<xsl:if test="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/SubsidiaryBusinessName/   BusinessNameLine2">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/SubsidiaryBusinessName/BusinessNameLine2"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<!-- Employer Identification Number -->
						<div style="width:48.9mm;float:right;clear:none;border-top:solid 1px;padding-left:2mm">
							<span class="styBoldText">Employer identification number</span>
							<br/><br/>
							<!-- xsl:call-template name="PopulateEIN">
              <xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/
              IncomeLossItems/SubsidiaryEIN"/>
          </xsl:call-template -->
							<xsl:if test="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/SubsidiaryEIN !=' '">
								<span style="font-weight:normal;">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/SubsidiaryEIN"/>
									</xsl:call-template>
								</span>
							</xsl:if>
							<xsl:if test="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/MissingEINReasonCd !=' '">
								<span style="font-weight:normal;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/MissingEINReasonCd"/>
									</xsl:call-template>
								</span>
							</xsl:if>
						</div>
					</div>
					<!-- Part 3 - Header -->
					<div style="width:187mm;height:8mm;border-style:solid; border-bottom-width:1px;          border-top-width:1px; border-right-width:0px;border-left-width:0px;clear:all;padding-top:0;float:left;">
						<span class="styPartName" style="height:4mm;width:14mm;padding: .25mm .5mm .25mm .5mm;">Part III</span>
						<span class="styPartDesc" style="width:170mm;">
							<span style="width:2mm;"/>Reconciliation of Net Income (Loss) per Income Statement of Includible Corporations With <br/>
							<span style="width:2mm;"/>Taxable Income per Return—Expense/Deduction Items<span style="padding-left:1mm;font-weight:normal">(see instructions)</span>
						</span>
					</div>
					<!-- Part III Table -->
					<table class="styTable" id="IRS1120ScheduleM3PartIII" summary="Reconciliation of Net Income (Loss) per Income        Statement of Includible Corporations With Taxable Income        per Return—Expense/Deduction Items (See Instructions)" cellspacing="0" cellpadding="0" style="font-size:7pt;width:187mm;clear:all;">
						<tr>
							<th scope="col" class="styTableThead" style="width:6mm;display:table-cell;"/>
							<th scope="col" class="styTableThead" style="width:81mm;text-align:center;font-size:8pt;display:table-cell;">Expense/Deduction Items</th>
							<th scope="col" class="styIRS1120ScheduleM3TheadCell">
								<span class="styBoldText">(a)</span>
								<br/> Expense per<br/> Income Statement<br/>
							</th>
							<th scope="col" class="styIRS1120ScheduleM3TheadCell"  style="display:table-cell;">
								<span class="styBoldText">(b)</span>
								<br/> Temporary<br/> Difference</th>
							<th scope="col" class="styIRS1120ScheduleM3TheadCell"  style="display:table-cell;">
								<span class="styBoldText">(c)</span>
								<br/> Permanent<br/> Difference</th>
							<th scope="col" class="styIRS1120ScheduleM3TheadCell"  style="display:table-cell;">
								<span class="styBoldText">(d)</span>
								<br/> Deduction per<br/> Tax Return<br/>
							</th>
						</tr>
						<!-- Part III - Line 1 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">
								<span style="width:1.5mm;"/>1
							</td>
							<td>
								<span style="float:left;padding-left:2mm;">U.S. current income tax expense</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/USCurrentIncomeTaxExpense/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/USCurrentIncomeTaxExpense/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/USCurrentIncomeTaxExpense/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3ShadedCell" style="border-bottom-width:0px;">
								<span style="width:1mm"/>
							</td>
						</tr>
						<!-- Part III - Line 2 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">
								<span style="width:1.5mm;"/>2</td>
							<td>
								<span style="float:left;padding-left:2mm;">U.S. deferred income tax expense</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/USDeferredIncomeTaxExpense/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/USDeferredIncomeTaxExpense/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/USDeferredIncomeTaxExpense/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3ShadedCell">
								<span style="width:1mm"/>
							</td>
						</tr>
						<!-- Part III - Line 3 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">
								<span style="width:1.5mm;"/>3</td>
							<td>
								<span style="float:left;padding-left:2mm;">State and local current income tax expense</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/StateLocalCurrIncomeTaxExpense/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/StateLocalCurrIncomeTaxExpense/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/StateLocalCurrIncomeTaxExpense/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/StateLocalCurrIncomeTaxExpense/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 4 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">
								<span style="width:1.5mm;"/>4</td>
							<td>
								<span style="float:left;padding-left:2mm;">State and local deferred income tax expense</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/StateLocalDefrdIncmTaxExpense/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/StateLocalDefrdIncmTaxExpense/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/StateLocalDefrdIncmTaxExpense/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3ShadedCell">
								<span style="width:1mm"/>
							</td>
						</tr>
						<!-- Part III - Line 5 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">
								<span style="width:1.5mm;"/>5</td>
							<td style="padding-top:.5mm;padding-left:2mm;">
							Foreign current income tax expense (other than foreign
							<span style="float:left;">withholding taxes)</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/ForeignCurrentIncomeTaxExpense/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/ForeignCurrentIncomeTaxExpense/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/ForeignCurrentIncomeTaxExpense/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/ForeignCurrentIncomeTaxExpense/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 6 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">
								<span style="width:1.5mm;"/>6</td>
							<td>
								<span style="float:left;padding-left:2mm;">Foreign deferred income tax expense</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/ForeignDeferredIncmTaxExpense/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/ForeignDeferredIncmTaxExpense/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/ForeignDeferredIncmTaxExpense/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3ShadedCell">
								<span style="width:1mm"/>
							</td>
						</tr>
						<!-- Part III - Line 7 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">
								<span style="width:1.5mm;"/>7</td>
							<td>
								<span style="float:left;padding-left:2mm;">Foreign withholding taxes</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/ForeignWithholdingTaxes/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/ForeignWithholdingTaxes/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/ForeignWithholdingTaxes/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/ForeignWithholdingTaxes/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 8 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">
								<span style="width:1.5mm;"/>8</td>
							<td>
								<span style="float:left;padding-left:2mm;">Interest expense (attach Form 8916-A)
               <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/InterestExpenseForm8916AGrp"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/InterestExpenseForm8916AGrp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/InterestExpenseForm8916AGrp/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/InterestExpenseForm8916AGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/InterestExpenseForm8916AGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 9 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">
								<span style="width:1.5mm;"/>9</td>
							<td>
								<span style="float:left;padding-left:2mm;">Stock option expense
          </span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/StockOptionExpense/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/StockOptionExpense/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/StockOptionExpense/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/StockOptionExpense/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 10 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">10</td>
							<td>
								<span style="float:left;padding-left:2mm;">Other equity-based compensation</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/OtherEquityBasedCompensation/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/OtherEquityBasedCompensation/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/OtherEquityBasedCompensation/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/OtherEquityBasedCompensation/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 11 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">11</td>
							<td>
								<span style="float:left;padding-left:2mm;">Meals and entertainment</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/MealsAndEntertainmentGrp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/MealsAndEntertainmentGrp/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/MealsAndEntertainmentGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/MealsAndEntertainmentGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 12 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">12</td>
							<td>
								<span style="float:left;padding-left:2mm;">Fines and penalties</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/FinesAndPenalties/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/FinesAndPenalties/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/FinesAndPenalties/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/FinesAndPenalties/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 13 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">13</td>
							<td>
								<span style="float:left;padding-left:2mm;">Judgments, damages, awards, and similar costs
          </span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/JudgmentsDamagesAwardsSmlrCost/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/JudgmentsDamagesAwardsSmlrCost/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/JudgmentsDamagesAwardsSmlrCost/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/JudgmentsDamagesAwardsSmlrCost/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 14 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">14</td>
							<td>
								<span style="float:left;padding-left:2mm;">Parachute payments</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/ParachutePayments/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/ParachutePayments/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/ParachutePayments/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/ParachutePayments/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 15 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">15</td>
							<td>
								<span style="float:left;padding-left:2mm;">Compensation with section 162(m) limitation</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/CompWithSect162mLimitation/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/CompWithSect162mLimitation/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/CompWithSect162mLimitation/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/CompWithSect162mLimitation/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 16 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">16</td>
							<td>
								<span style="float:left;padding-left:2mm;">Pension and profit-sharing</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/PensionAndProfitSharing/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/PensionAndProfitSharing/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/PensionAndProfitSharing/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/PensionAndProfitSharing/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 17 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">17</td>
							<td>
								<span style="float:left;padding-left:2mm;">Other post-retirement benefits</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/OtherPostRetirementBenefits/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/OtherPostRetirementBenefits/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/OtherPostRetirementBenefits/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/OtherPostRetirementBenefits/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 18 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">18</td>
							<td>
								<span style="float:left;padding-left:2mm;">Deferred compensation</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/DeferredCompensation/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/DeferredCompensation/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/DeferredCompensation/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/DeferredCompensation/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 19 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">19</td>
							<td>
								<span style="float:left;padding-left:2mm;">Charitable contribution of cash and tangible property</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/CharitbleContriCashTngblProp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/CharitbleContriCashTngblProp/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/CharitbleContriCashTngblProp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/CharitbleContriCashTngblProp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 20 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">20</td>
							<td>
								<span style="float:left;padding-left:2mm;">Charitable contribution of intangible property</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/CharitableContriIntangibleProp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/CharitableContriIntangibleProp/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/CharitableContriIntangibleProp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/CharitableContriIntangibleProp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 21 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">21</td>
							<td>
								<span style="float:left;padding-left:2mm;">Charitable contribution limitation/carryforward</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
							</td>
							<td class="styIRS1120ScheduleM3ShadedCell" style="border-bottom-width:0px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/CharitableContriLimitationCfwd/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/CharitableContriLimitationCfwd/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/CharitableContriLimitationCfwd/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 22 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">22</td>
							<td>
								<span style="float:left;padding-left:2mm;">Domestic production activities deduction</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
							</td>
							<td class="styIRS1120ScheduleM3ShadedCell" style="border-bottom-width:1px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/DomesticProductionActyDedGrp/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/DomesticProductionActyDedGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/DomesticProductionActyDedGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 23 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">23</td>
							<td style="padding-top:.5mm;padding-left:2mm;">
									Current year acquisition or reorganization investment
									<span style="float:left;">banking fees
							  </span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/CYAcquisReorgInvstBankingFees/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/CYAcquisReorgInvstBankingFees/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/CYAcquisReorgInvstBankingFees/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/CYAcquisReorgInvstBankingFees/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 24 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">24</td>
							<td style="padding-top:.5mm;padding-left:2mm;">
							Current year acquisition or reorganization legal and
							<span style="float:left;">accounting fees</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/CYAcquisReorgLegalAcctFees/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/CYAcquisReorgLegalAcctFees/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/CYAcquisReorgLegalAcctFees/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/CYAcquisReorgLegalAcctFees/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 25 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">25</td>
							<td>
								<span style="float:left;padding-left:2mm;">Current year acquisition/reorganization other costs</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/CYAcquisReorgOtherCosts/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/CYAcquisReorgOtherCosts/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/CYAcquisReorgOtherCosts/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/CYAcquisReorgOtherCosts/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 26 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">26</td>
							<td>
								<span style="float:left;padding-left:2mm;">Amortization/impairment of goodwill</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/AmortizationImpairmentGoodwill/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/AmortizationImpairmentGoodwill/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/AmortizationImpairmentGoodwill/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/AmortizationImpairmentGoodwill/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 27 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">27</td>
							<td style="padding-top:.5mm;padding-left:2mm;">
							Amortization of acquisition, reorganization, and start-up
							<span style="float:left;">costs</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/AmortzAcquisReorgStartupCosts/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/AmortzAcquisReorgStartupCosts/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/AmortzAcquisReorgStartupCosts/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/AmortzAcquisReorgStartupCosts/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 28 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">28</td>
							<td>
								<span style="float:left;padding-left:2mm;">Other amortization or impairment write-offs</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/OtherAmortzImpairmentWriteOffs/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/OtherAmortzImpairmentWriteOffs/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/OtherAmortzImpairmentWriteOffs/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/OtherAmortzImpairmentWriteOffs/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 29 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">29</td>
							<td>
								<span style="float:left;padding-left:2mm;">Reserved</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell" style="background-color:lightgrey">
							    <span style="width:5px;"></span>
								<!--<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/Sect198EnvrmtRemediationCosts/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>-->
							</td>
							<td class="styIRS1120ScheduleM3Cell"  style="background-color:lightgrey">
							    <span style="width:5px;"></span>
								<!--<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/Sect198EnvrmtRemediationCosts/TemporaryDifferenceAmt "/>
								</xsl:call-template>-->
							</td>
							<td class="styIRS1120ScheduleM3Cell"  style="background-color:lightgrey">
							    <span style="width:5px;"></span>
								<!--<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/Sect198EnvrmtRemediationCosts/PermanentDifferenceAmt"/>
								</xsl:call-template>-->
							</td>
							<td class="styIRS1120ScheduleM3Cell"   style="background-color:lightgrey">
							     <span style="width:5px;"></span>
								<!--<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/Sect198EnvrmtRemediationCosts/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>-->
							</td>
						</tr>
						<!-- Part III - Line 30 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">30</td>
							<td>
								<span style="float:left;padding-left:2mm;">Depletion</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/DepletionGrp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/DepletionGrp/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/DepletionGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/DepletionGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 31 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">31</td>
							<td>
								<span style="float:left;padding-left:2mm;">
         Depreciation</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/DepreciationGrp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/DepreciationGrp/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/DepreciationGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/DepreciationGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 32 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">32</td>
							<td>
								<span style="float:left;padding-left:2mm;">Bad debt expense</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/BadDebtExpnsAgencyBalWrttnOff/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/BadDebtExpnsAgencyBalWrttnOff/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/BadDebtExpnsAgencyBalWrttnOff/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/BadDebtExpnsAgencyBalWrttnOff/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 33 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">33</td>
							<td>
								<span style="float:left;padding-left:2mm;">Corporate owned life insurance premiums</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/CorpOwnedLifeInsurancePremiums/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/CorpOwnedLifeInsurancePremiums/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/CorpOwnedLifeInsurancePremiums/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/CorpOwnedLifeInsurancePremiums/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 34 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">34</td>
							<td>
								<span style="float:left;padding-left:2mm;">Purchase versus lease (for purchasers and/or lessees)
          </span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/PurchaseVersusLease/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/PurchaseVersusLease/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/PurchaseVersusLease/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/PurchaseVersusLease/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 35 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">35</td>
							<td>
								<span style="float:left;padding-left:2mm;">Research and development costs
								 <!--(attach schedule)-->
							  <!-- Form Link -->
<!--									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/
              ExpenseDeductionItems/ResearchAndDevelopmentCosts"/>
									</xsl:call-template>-->
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/ResearchAndDevelopmentCosts/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/ResearchAndDevelopmentCosts/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/ResearchAndDevelopmentCosts/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/ResearchAndDevelopmentCosts/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 36 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">36</td>
							<td>
								<span style="float:left;padding-left:2mm;">Section 118 exclusion (attach statement)
							  <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/Section118Exclusion"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/Section118Exclusion/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/Section118Exclusion/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/Section118Exclusion/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/Section118Exclusion/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 37 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">37</td>
							<td style="padding-top:.5mm;padding-left:2mm;">
							Other expense/deduction items with differences
                            (attach<span style="float:left;">statement)
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/OtherExpnsDedItemsDifferences"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/OtherExpnsDedItemsDifferences/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/OtherExpnsDedItemsDifferences/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/OtherExpnsDedItemsDifferences/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/OtherExpnsDedItemsDifferences/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 38 -->
						<tr>
							<td class="styIRS1120ScheduleM3NumberCell">38</td>
							<td style="padding-top:.5mm;font-weight:bold;padding-left:2mm;">Total expense/deduction items.
          <span style="font-weight:normal">Combine lines 1 through 37. Enter here and
           on Part II, line 27, reporting positive amounts as negative and negative amounts as positive</span>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/TotalExpenseDeductionItems/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/TotalExpenseDeductionItems/TemporaryDifferenceAmt "/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/TotalExpenseDeductionItems/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/ExpenseDeductionItemsGrp/TotalExpenseDeductionItems/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
								<br/>
							</td>
						</tr>
					</table>
					<div class="pageEnd" style="width:187mm;">
						<div class="styBoldText" style="float:right;padding-top:1mm;">Schedule M-3 (Form 1120) 2013</div>
					</div>
					<!-- Left Over Data Table -->
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
							<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<!-- Populate left over row for the pen image on Line F. Used this code instead of calling the template in order to set the style attribute to top align the description label. -->
						<!-- xsl:if test="$Form1120ScheduleM3/Other/@description">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;vertical-align:top;" scope="row">Form 1120 Schedule M-3, Line 4b - Other (description):</td>
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM3/Other/@description"/>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if -->
					</table>
					<!-- END Left Over Table -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>