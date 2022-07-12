<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1120LSchM3EliminationsOrAdjStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form1120LScheduleM3" select="$RtnDoc/IRS1120LSchM3EliminationsOrAdj"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form1120LScheduleM3)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching-->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 1120-L Schedule M3 Eliminations Or Adjustments"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1120LSchM3EliminationsOrAdjStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form1120LSchM3EliminationsOrAdj">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Header - Form1120LSchM3 Number, Title, and Year -->
					<div class="styTBB" style="width:187mm;">
						<div class="styFNBox" style="width:31mm;height:19.5mm;border-right-width:2px;">
							<span class="styFormNumber" style="width:31mm;font-size:10pt;">SCHEDULE M-3<br/>(Form 1120-L)</span>
							<span style="width:31mm;">
								<!-- Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3"/>
								</xsl:call-template>
							</span>
							<span class="styAgency" style="width:31mm;height:5mm;">
          Department of the Treasury<br/>
          Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:125mm;height:19.5mm;">
							<div class="styMainTitle">Net Income (Loss) Reconciliation for U.S. Life Insurance 
							<br/>
                             Companies With Total Assets of $10 Million or More</div>
							<div class="styFST" style="height:5mm;">
								<img src="{$ImagePath}/1120SchN_Bullet_Title.gif" width="4" height="7" alt="Bullet"/> Attach to Form 1120-L.<br/>
								<img src="{$ImagePath}/1120SchN_Bullet_Title.gif" width="4" height="7" alt="Bullet"/> Information about Schedule M-3 (Form 1120-L) and its 		instructions is at
								<br/>
								 <a href="http://www.irs.gov/form1120l" title="Link to IRS.gov"><i>www.irs.gov/form1120l</i></a><br/>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:19.5mm;border-left-width:2px;">
							<div class="styOMB" style="height:auto;">OMB No. 1545-0123</div>
							<div class="styTY" style="height:11mm;padding-top:1.5mm;">20<span class="styTYColor">14</span>
							</div>
						</div>
					</div>
					<!-- End Header - Form Number, Title, and Year -->
					<!-- End Header - Form Number, Title, and Yr -->
					<!--  Name -->
					<div class="styBB" style="width:187mm">
						<div class="styNameBox" style="width:141mm;font-size:7pt;;">
						  Name of corporation (common parent, if consolidated return)
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/BusinessName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/BusinessName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</div>
						<!--EIN-->
						<div class="styEINBox" style=" padding-left:2mm;font-size:7pt;">
							<span class="BoldText">Employer identification number</span>
							<br/>
							<br/>
							<span style="font-weight:normal;">
								<xsl:choose>
									<xsl:when test="$Form1120LScheduleM3/EIN">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/EIN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/MissingEINReasonCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!--       <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">EIN</xsl:with-param></xsl:call-template>    -->
							</span>
						</div>
					</div>
					<!--  End Name and Employer indentification number  -->
					<!-- start check box line  -->
					<div style="width:187mm;font-size:6pt;">
						<div class="styGenericDiv" style="width:100mm;">
							<span style="width:10mm;"/>
							<span style="width:30mm;">Check applicable box(es):</span>
							<span style="padding-left:10mm;">(1) </span>								
							<input type="checkbox" alt="IRS1120LScheduleM3/NonConsolidatedReturnInd" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/NonConsolidatedReturnInd"/>
							<xsl:with-param name="BackupName">IRS1120LScheduleM3/NonConsolidatedReturnInd</xsl:with-param>
						</xsl:call-template>
					</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/NonConsolidatedReturnInd"/>
								</xsl:call-template>
					Non-Consolidated return
					 </label>
						</div>
						<div class="styGenericDiv" style="width:60mm;">
           		 (2)
           			<input type="checkbox" alt="IRS1120LScheduleM3/ConsolidatedReturnInd" class="styCkbox">
					<xsl:call-template name="PopulateCheckbox">
					<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ConsolidatedReturnInd"/>
					<xsl:with-param name="BackupName">IRS1120LScheduleM3/ConsolidatedReturnInd</xsl:with-param>
				</xsl:call-template>
			</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ConsolidatedReturnInd"/>
								</xsl:call-template>
					Consolidated return (Form 1120-L only)
					</label>
						</div>
					</div>
					<div class="styBB" style="width:187mm;font-size:6pt;">
						<div class="styGenericDiv" style="width:100mm;">
							<span style="width:41mm;"/>
							<span style="padding-left:10mm">
           	(3) </span>
							<input type="checkbox" alt="IRS1120LScheduleM3/Mixed1120LPCGroupInd" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/Mixed1120LPCGroupInd"/>
						<xsl:with-param name="BackupName">IRS1120LScheduleM3/Mixed1120LPCGroupInd"</xsl:with-param>
					</xsl:call-template>
				</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/Mixed1120LPCGroupInd"/>
								</xsl:call-template> Mixed 1120/L/PC group
		   </label>
						</div>
						<div class="styGenericDiv" style="width:60mm;">
           		 (4)
          <input type="checkbox" alt="IRS1120LScheduleM3/DormantSubsidiariesSchAttInd" class="styCkbox">
			<xsl:call-template name="PopulateCheckbox">
				<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/DormantSubsidiariesSchAttInd"/>
				<xsl:with-param name="BackupName">IRS1120LScheduleM3/DormantSubsidiariesSchAttInd</xsl:with-param>
		</xsl:call-template>
		</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/DormantSubsidiariesSchAttInd"/>
								</xsl:call-template> Dormant subsidiaries schedule attached
		</label>
						</div>
					</div>
					<!-- end check box line  -->
					<!-- Part I - Header -->
					<div style="width:187mm;height:4mm;border-style:solid; border-bottom-width:1px;border-top-width:0px;border-right-width:0px;border-left-width:0px;float:left;">
						<span class="styPartName" style="height:4mm;width:12mm;">Part I</span>
						<span style="width:140mm;" class="styPartDesc">
							<span style="width:3mm;"/>Financial Information and Net Income (Loss) Reconciliation
						    <span style="font-weight:normal">(see instructions)</span>
						</span>
						<br/>
					</div>
					<!-- Line 1a -->
					<div style="width:187mm;">
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
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorporationFiledSECForm10KInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorporationFiledSECForm10KInd"/>
										<xsl:with-param name="BackupName">IRS1120LScheduleM3CorpFiledSECForm10K</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorporationFiledSECForm10KInd"/>
									<xsl:with-param name="BackupName">IRS1120LScheduleM3CorpFiledSECForm10K</xsl:with-param>
								</xsl:call-template>
								<span class="styBoldText" style="padding-left:1mm;">Yes.</span>
							</label>          
							  Skip lines 1b and 1c and complete lines 2a through 11 with respect to that SEC Form 10-K.
						</div>
					</div>
					<!-- Line 1a - No -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
						<div class="styLNDesc" style="width:179mm;">
							<span style="width:.5mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorporationFiledSECForm10KInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorporationFiledSECForm10KInd"/>
										<xsl:with-param name="BackupName">IRS1120LScheduleM3CorpFiledSECForm10K</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorporationFiledSECForm10KInd"/>
									<xsl:with-param name="BackupName">IRS1120LScheduleM3CorpFiledSECForm10K</xsl:with-param>
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
						 a certified audited inon-tax-basis income statement for that period?</div>
					</div>
					<!-- Line 1b - Yes -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
						<div class="styLNDesc" style="width:179mm;">
							<span style="width:.5mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpPrepCertAuditedIncmStmtInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpPrepCertAuditedIncmStmtInd"/>
										<xsl:with-param name="BackupName">IRS1120LScheduleM3CorpPrepCertAuditedIncomeStmt</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpPrepCertAuditedIncmStmtInd"/>
									<xsl:with-param name="BackupName">IRS1120LScheduleM3CorpPrepCertAuditedIncomeStmt</xsl:with-param>
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
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpPrepCertAuditedIncmStmtInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpPrepCertAuditedIncmStmtInd"/>
										<xsl:with-param name="BackupName">IRS1120LScheduleM3CorpPrepCertAuditedIncomeStmt</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpPrepCertAuditedIncmStmtInd"/>
									<xsl:with-param name="BackupName">IRS1120LScheduleM3CorpPrepCertAuditedIncomeStmt</xsl:with-param>
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
						<div class="styLNDesc" style="width:179mm;">Did the corporation prepare a non-tax-basis income statement for that period? 
						</div>
					</div>
					<!-- Line 1c - Yes -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
						<div class="styLNDesc" style="width:179mm;">
							<span style="width:.5mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorporationPreparedIncmStmtInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorporationPreparedIncmStmtInd"/>
										<xsl:with-param name="BackupName">IRS1120LScheduleM3CorpPrepIncomeStatement</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorporationPreparedIncmStmtInd"/>
									<xsl:with-param name="BackupName">IRS1120LScheduleM3CorpPrepIncomeStatement</xsl:with-param>
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
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorporationPreparedIncmStmtInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorporationPreparedIncmStmtInd"/>
										<xsl:with-param name="BackupName">IRS1120LScheduleM3CorpPrepIncomeStatement</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorporationPreparedIncmStmtInd"/>
									<xsl:with-param name="BackupName">IRS1120LScheduleM3CorpPrepIncomeStatement</xsl:with-param>
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
						    <span style="width:3mm"/>Beginning<span style="width:3mm;"/>
							<span style="width:25mm;border-bottom:solid 1px;text-align:center">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeStatementBeginningDt"/>
								</xsl:call-template>
							</span>
							<span style="width:8mm"/>Ending<span style="width:3mm"/>
							<span style="width:25mm;border-bottom:solid 1px;text-align:center">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeStatementEndingDt"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Line 2b -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">
							<span style="width:1.5mm"/>b</div>
						<div class="styLNDesc" style="width:179mm;">Has the corporation’s income statement been restated for the income statement period on line 2a?
            <!-- Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorporationIncmStmtRestatedInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2b - Yes -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
						<div class="styLNDesc" style="width:179mm;">
							<span style="width:.5mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorporationIncmStmtRestatedInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorporationIncmStmtRestatedInd"/>
										<xsl:with-param name="BackupName">IRS1120LScheduleM3CorpIncomeStatementRestated</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorporationIncmStmtRestatedInd"/>
									<xsl:with-param name="BackupName">IRS1120LScheduleM3CorpIncomeStatementRestated</xsl:with-param>
								</xsl:call-template>
								<span class="styBoldText" style="padding-left:1mm;">Yes.</span>
							</label>          
							  (If “Yes," attach an explanation and the amount of each item restated.)
          				</div>
					</div>
					<!-- Line 2b - No -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
						<div class="styLNDesc" style="width:179mm;">
							<span style="width:.5mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorporationIncmStmtRestatedInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorporationIncmStmtRestatedInd"/>
										<xsl:with-param name="BackupName">IRS1120LScheduleM3Corp/IncomeStatementRestated</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorporationIncmStmtRestatedInd"/>
									<xsl:with-param name="BackupName">IRS1120LScheduleM3/CorpIncomeStatementRestated</xsl:with-param>
								</xsl:call-template>
								<span class="styBoldText" style="padding-left:1mm;">No.</span>
							</label>
						</div>
					</div>
					<!-- Line 2c -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">
							<span style="width:1.5mm"/>c</div>
						<div class="styLNDesc" style="width:179mm;">Has the corporation’s income
						 statement been restated for any of the five income statement periods preceding the period on line 2a?
            <!-- Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpIncmStmtRestated5PrecInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2c - Yes -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
						<div class="styLNDesc" style="width:179mm;">
							<span style="width:.5mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpIncmStmtRestated5PrecInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpIncmStmtRestated5PrecInd"/>
										<xsl:with-param name="BackupName">IRS1120LScheduleM3CorpIncmStmtRestated5Preceding</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpIncmStmtRestated5PrecInd"/>
									<xsl:with-param name="BackupName">IRS1120LScheduleM3CorpIncmStmtRestated5Preceding</xsl:with-param>
								</xsl:call-template>
								<span class="styBoldText" style="padding-left:1mm;">Yes.</span>
							</label>          
							(If “Yes," attach an explanation and the amount of each item restated.)
						</div>
					</div>
					<!-- Line 2c - No -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
						<div class="styLNDesc" style="width:179mm;">
							<span style="width:.5mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpIncmStmtRestated5PrecInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpIncmStmtRestated5PrecInd"/>
										<xsl:with-param name="BackupName">IRS1120LScheduleM3CorpIncmStmtRestated5Preceding</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpIncmStmtRestated5PrecInd"/>
									<xsl:with-param name="BackupName">IRS1120LScheduleM3CorpIncmStmtRestated5Preceding</xsl:with-param>
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
								<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorporationVtngComStkPubTrdInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3a - Yes -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
						<div class="styLNDesc" style="width:179mm;">
							<span style="width:.5mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorporationVtngComStkPubTrdInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorporationVtngComStkPubTrdInd"/>
										<xsl:with-param name="BackupName">IRS1120LScheduleM3CorpVotingCommonStockPubTraded</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorporationVtngComStkPubTrdInd"/>
									<xsl:with-param name="BackupName">IRS1120LScheduleM3CorpVotingCommonStockPubTraded</xsl:with-param>
								</xsl:call-template>
								<span class="styBoldText" style="padding-left:1mm;">Yes.</span>
							</label>
						</div>
					</div>
					<!-- Line 3a - No -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
						<div class="styLNDesc" style="width:179mm;">
							<span style="width:.5mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorporationVtngComStkPubTrdInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorporationVtngComStkPubTrdInd"/>
										<xsl:with-param name="BackupName">IRS1120LScheduleM3CorpVotingCommonStockPubTraded</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorporationVtngComStkPubTrdInd"/>
									<xsl:with-param name="BackupName">IRS1120LScheduleM3CorpVotingCommonStockPubTraded</xsl:with-param>
								</xsl:call-template>
								<span class="styBoldText" style="padding-left:1mm;">No.</span>
							</label>
						    If “No," go to line 4a.
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
								<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/StockSymbolCd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3c -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBoxSD">
							<span style="width:1.5mm"/>c</div>
						<div class="styLNDesc" style="width:113mm;">Enter the nine-digit CUSIP number of the corporation’s primary publicly traded voting 						<span style="float:left;">common stock</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>
						</div>
						<div style="width:45mm;height:4.5mm;border: solid 1px;margin-top:1.5mm;float:left;margin-left:3mm;text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CUSIPNum"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- L4a -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">4a</div>
							<div class="styLNDesc" style="width:130mm;padding-top:.5mm;">Worldwide consolidated net income (loss) from income statement source identified in Part I, line 1</div>
							<!--<span class="styDotLn" style="float:none;padding-left:2px;" valign="bottom">.</span>-->
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox">4a</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/WorldwideCnsldtNetIncmLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- L4b r1 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">
								<span style="width:1.5mm;"/>b
							</div>
							<div class="styLNDesc" style="width:90mm;padding-top:.5mm;">Indicate accounting standard used for line 4a (see instructions):</div>
							<span class="styDotLn" style="float:none;padding-left:2px;" valign="bottom"/>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="background-color:lightgrey;"/>
						</div>
						<!-- close float right -->
					</div>
					<!-- L4b r2 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">
								<span style="width:1.5mm;"/>
							</div>
							<!--Check Box 1 -->
							<div class="styLNDesc" style="width:135mm;padding-top:.5mm;">(1)
							    <input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/GAAPInd"/>
										<xsl:with-param name="BackupName">IRS1120LScheduleM3GAAP</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1.5mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/GAAPInd"/>
										<xsl:with-param name="BackupName">IRS1120LScheduleM3GAAP</xsl:with-param>
									</xsl:call-template>
									<span style="padding-left:.5px;">GAAP</span>
								</label>
								<!--Check Box 2 -->
								<span style="width:3mm;"/>(2)
							    <input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IFRSInd"/>
										<xsl:with-param name="BackupName">IRS1120LScheduleM3IFRS</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1.5mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IFRSInd"/>
										<xsl:with-param name="BackupName">IRS1120LScheduleM3IFRS</xsl:with-param>
									</xsl:call-template>
									<span style="padding-left:.5px;">IFRS</span>
								</label>
								<!--Check Box 3 -->
								<span style="width:3mm;"/>(3)
							    <input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/StatutoryInd"/>
										<xsl:with-param name="BackupName">IRS1120LScheduleM3Statutory</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1.5mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/StatutoryInd"/>
										<xsl:with-param name="BackupName">IRS1120LScheduleM3Statutory</xsl:with-param>
									</xsl:call-template>
									<span style="padding-left:.5px;">Statutory</span>
								</label>
								<!--Check Box 4 -->
								<span style="width:3mm;"/>(4)
							    <input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/OtherInd"/>
										<xsl:with-param name="BackupName">IRS1120LScheduleM3Other</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1.5mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/OtherInd"/>
										<xsl:with-param name="BackupName">IRS1120LScheduleM3Other</xsl:with-param>
									</xsl:call-template>
									<span style="padding-left:.5px;">Other (specify)</span>
									<span style="width:1.5mm;"/>
									<!-- A straight Line -->
									<span style="width:35mm;border-bottom:solid 1px;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/OtherInd/@methodOfAccountingOtherDesc"/>
										</xsl:call-template>
									</span>
								</label>
							</div>
							<!--Close Check box 1 -->
						</div>
						<!--close float left -->
						<div style="float:right;">
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
						</div></div>
						<!-- close float right -->					
					<!-- close L4b r2 -->
					<!-- Line 5a -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">5a</div>
							<div class="styLNDesc" style="width:137mm;">
								<span style="float:left;">Net income from nonincludible foreign entities (attach statement)
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/NetIncmNonincludibleFrgnEntAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:5mm;">5a</div>
							<div class="styLNAmountBox" style="height:5mm;">
								<xsl:call-template name="PopulateNegativeNumber">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/NetIncmNonincludibleFrgnEntAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 5b -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">
								<span style="width:1.5mm"/>b</div>
							<div class="styLNDesc" style="width:137mm;">
								<span style="float:left;">Net loss from nonincludible foreign entities (attach statement and enter as a positive amount)
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/NetLossNonincludibleFrgnEntAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:5mm;">5b</div>
							<div class="styLNAmountBox" style="height:5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/NetLossNonincludibleFrgnEntAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 6a -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">6a</div>
							<div class="styLNDesc" style="width:137mm;">
								<span style="float:left;">Net income from nonincludible U.S. entities (attach statement)
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/NetIncomeNonincludibleUSEntAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:5mm;">6a</div>
							<div class="styLNAmountBox" style="height:5mm;">
								<xsl:call-template name="PopulateNegativeNumber">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/NetIncomeNonincludibleUSEntAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 6b -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">
								<span style="width:1.5mm"/>b</div>
							<div class="styLNDesc" style="width:137mm;">
								<span style="float:left;">Net loss from nonincludible U.S. entities (attach statement and enter as a positive amount)
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/NetLossNonincludibleUSEntAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:5mm;">6b</div>
							<div class="styLNAmountBox" style="height:5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/NetLossNonincludibleUSEntAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 7a -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">7a</div>
							<div class="styLNDesc" style="width:137mm;">
								<span style="float:left;">Net income (loss) of other includible foreign disregarded entities (attach statement)
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/NetIncmOthIncludibleFrgnEntAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:5mm;">7a</div>
							<div class="styLNAmountBox" style="height:5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/NetIncmOthIncludibleFrgnEntAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 7b -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">
								<span style="width:1.5mm"/>b</div>
							<div class="styLNDesc" style="width:137mm;">
								<span style="float:left;">Net income (loss) of other includible U.S. disregarded entities (attach statement)
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/NetIncomeOthIncludibleUSEntAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:5mm;">7b</div>
							<div class="styLNAmountBox" style="height:5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/NetIncomeOthIncludibleUSEntAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 7c -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">
								<span style="width:1.5mm"/>c</div>
							<div class="styLNDesc" style="width:137mm;">
								<span style="float:left;">Net income (loss) of other includible corporations (attach statement)
           <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/NetLossOtherIncludibleCorpAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:5mm;">7c</div>
							<div class="styLNAmountBox" style="height:5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/NetLossOtherIncludibleCorpAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 8 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:8mm;">8</div>
							<div class="styLNDesc" style="width:137mm;height:8mm">Adjustment to eliminations of transactions between includible entities and nonincludible entities 
                  <span style="float:left;">(attach statement)           
           <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/AdjustmentToEliminateTransAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">..........................</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">8</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/AdjustmentToEliminateTransAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 9 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">9</div>
							<div class="styLNDesc" style="width:137mm;">
								<span style="float:left;">Adjustment to reconcile income statement period to tax year (attach statement)
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/AdjRecnclIncmStmtYrToTYAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:5mm;">9</div>
							<div class="styLNAmountBox" style="height:5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/AdjRecnclIncmStmtYrToTYAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 10a -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox">10a</div>
							<div class="styLNDesc" style="width:137mm;">
								<span style="float:left;">Intercompany dividend adjustments to reconcile to line 11 (attach statement)
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IntercompanyDivAdjToRecnclAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:5mm;">10a</div>
							<div class="styLNAmountBox" style="height:5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IntercompanyDivAdjToRecnclAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- 10b -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">
								<span style="width:2.5mm"/>b</div>
							<div class="styLNDesc" style="width:137mm;">
								<span style="float:left;">Other statutory accounting adjustments to reconcile to line 11 (attach statement)
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/OtherStatutoryAcctToRecnclAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:5mm;">10b</div>
							<div class="styLNAmountBox" style="height:5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/OtherStatutoryAcctToRecnclAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- 10c -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">
								<span style="width:2.5mm"/>c</div>
							<div class="styLNDesc" style="width:137mm;">
								<span style="float:left;">Other adjustments to reconcile to amount on line 11 (attach statement)
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/OtherAdjustmentsToReconcileAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:5mm;">10c</div>
							<div class="styLNAmountBox" style="height:5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/OtherAdjustmentsToReconcileAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- L11 R2 -->				<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox">11</div>
							<div class="styLNDesc" style="width:137mm;">
								<span class="styBoldText">Net income (loss) per income statement of includible corporations.</span> Combine lines 4a through 10c
                <!--<span class="styDotLn" style="float:none;">..</span>-->
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox">11</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/NetIncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- close float right -->
					</div>
					<!-- L11 Note -->
					<div class="styBB" style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="width:137mm;">
								<span class="styBoldText">Note </span>Part I, line 11, must equal the amount
                 on Part II, line 30, column (a). 
						    </div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:40mm;"/>
						</div>
						<!-- close float right -->
					</div>
					<!-- L12 R1-->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox">12</div>
							<div class="styLNDesc" style="width:179mm;">
                Enter the total amount (not just the corporation’s share) of the assets and
                  liabilities of all entities included or removed on the following lines. 
              </div>
						</div>
						<!--<div style="float:right;">
            <div class="styLNRightNumBoxNBB">12</div>
              <div class="styLNAmountBoxNBB">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/NetIncomeLossPerIncomeStmt"/>
                </xsl:call-template>
              </div>
            </div>close float right -->
					</div>
					<!-- L12 R2-->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:67mm;"/>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:120mm;">
								<div class="styLNAmountBox" style="width:50mm;text-align:center;border-left-width: 0px;font-size:7.5pt;">
									<b>Total Assets</b>
								</div>
								<div class="styLNAmountBox" style="width:50mm;text-align:center;border-left-width: 0px;font-size:7.5pt;">
									<b>Total Liabilities</b>
								</div>
							</div>
							<!-- close width -->
						</div>
						<!-- close float right -->
					</div>
					<!-- L12 Ra-->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:66mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
								<span style="float:left;padding-top:.5mm;">Included on Part I, line 4 </span>
								<span class="styDotLn" style="padding-left:1.5mm;">......</span>
								<img src="{$ImagePath}/1120SchN_Bullet_Title.gif" width="4" height="7" alt="Bullet"/>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:120mm;">
								<!--Assets column -->
								<div class="styLNAmountBox" style="width:50mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/EntIncldWorldwideCnsldtAstAmt"/>
									</xsl:call-template>
								</div>
								<!--Liabilities column -->
								<div class="styLNAmountBox" style="width:50mm;border-right-width:1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/EntIncldWorldwideCnsldtLiabAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- close width -->
						</div>
						<!-- close float right -->
					</div>
					<!-- L12 Rb-->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:66mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
								<span style="float:left;padding-top:.5mm;">Removed on Part I, line 5 </span>
								<span class="styDotLn" style="padding-left:1mm;">......</span>
								<img src="{$ImagePath}/1120SchN_Bullet_Title.gif" width="4" height="7" alt="Bullet"/>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:120mm;">
								<!--Assets column -->
								<div class="styLNAmountBox" style="width:50mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/EntRmvdNonincludibleFrgnAstAmt"/>
									</xsl:call-template>
								</div>
								<!--Liabilities column -->
								<div class="styLNAmountBox" style="width:50mm;border-right-width:1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/EntRmvdNonincludblFrgnLiabAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- close width -->
						</div>
						<!-- close float right -->
					</div>
					<!-- L12 Rc-->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:66mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
								<span style="float:left;">Removed on Part I, line 6 </span>
								<span class="styDotLn" style="padding-left:1mm;">......</span>
								<img src="{$ImagePath}/1120SchN_Bullet_Title.gif" width="4" height="7" alt="Bullet"/>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:120mm;">
								<!--Assets column -->
								<div class="styLNAmountBox" style="width:50mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/EntRmvdNonincludibleUSAstAmt"/>
									</xsl:call-template>
								</div>
								<!--Liabilities column -->
								<div class="styLNAmountBox" style="width:50mm;border-right-width:1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/EntRmvdNonincludibleUSLiabAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- close width -->
						</div>
						<!-- close float right -->
					</div>
					<!-- L12 Rd-->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:66mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">d</div>
								<span style="float:left;padding-top:.5mm;">  Included on Part I, line 7 </span>
								<span class="styDotLn" style="padding-left:1.9mm;">......</span>
								<img src="{$ImagePath}/1120SchN_Bullet_Title.gif" width="4" height="7" alt="Bullet"/>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:120mm;">
								<!--Assets column -->
								<div class="styLNAmountBox" style="width:50mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/EntIncldOtherIncludibleAstAmt"/>
									</xsl:call-template>
								</div>
								<!--Liabilities column -->
								<div class="styLNAmountBox" style="width:50mm;border-right-width:1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/EntIncldOtherIncludibleLiabAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- close width -->
						</div>
						<!-- close float right -->
					</div>
					<!-- Blank Line -->
					<div class="styTBB" style="width:187mm;"/>
					<!-- Page 1 Footer -->
					<div class="pageEnd" style="width:187mm;">
						<div class="styBoldText" style="width:110mm;float:left;">For Paperwork Reduction Act Notice, see the Instructions for Form 1120-L.</div>
						<div style="width:25mm;float:left;">Cat. No. 39668S</div>
						<div class="styBoldText" style="float:right;">Schedule M-3 (Form 1120-L) 2014</div>
					</div>
					<!-- Page 2 -->
					<!-- Page 2 Header -->
					<div class="styBB" style="width:187mm;float:none;">
						<div style="float:left;">Schedule M-3 (Form 1120-L) 2014</div>
						<div style="float:right;">Page <span style="font-size:9pt;font-weight:bold;">2</span>
						</div>
					</div>
					<!-- Name and EIN Line -->
					<div class="styBB" style="width:187mm;">
						<!-- Name -->
						<div style="width:138mm;height:auto;border-right:solid 1px;float:left;clear:none;">
          Name of corporation (common parent, if consolidated return)<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/BusinessName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/BusinessName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</div>
						<!-- Employer Identification Number -->
						<div style="width:47mm;float:right;clear:none;padding-left:1mm;">
							<span class="styBoldText">Employer identification number</span>
							<br/><br/>
							<xsl:choose>
								<xsl:when test="$Form1120LScheduleM3/EIN">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/EIN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/MissingEINReasonCd"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!-- start check box line1  -->
					<div style="width:187mm;font-size:6pt;">
					<div class="styGenericDiv" style="padding-left:1px;">
           	Check applicable box(es): <span style="font-weight:bold;padding-left:.5mm;padding-right:.5mm;">(1)</span>
							<input type="checkbox" alt="IRS1120LScheduleM3/IncomeLossItems/ConsolidatedGroup" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/ConsolidatedGroupInd"/>
							<xsl:with-param name="BackupName">IRS1120LScheduleM3/IncomeLossItems/ConsolidatedGroupInd</xsl:with-param>
						</xsl:call-template>
					</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/ConsolidatedGroupInd"/>
								</xsl:call-template>
							</label>
						</div>
						<div class="styGenericDiv" style="padding-left:1px;">Consolidated group
           	<span style="font-weight:bold;padding-left:.5mm;padding-right:.5mm;">(2)</span>
							<input type="checkbox" alt="IRS1120LScheduleM3/IncomeLossItems/ParentCorporation" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/ParentCorporationInd"/>
						<xsl:with-param name="BackupName">IRS1120LScheduleM3/IncomeLossItems/ParentCorporationInd</xsl:with-param>
					</xsl:call-template>
				</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/ParentCorporationInd"/>
								</xsl:call-template>
							</label>
						</div>
						<div class="styGenericDiv" style="padding-left:1px;">
           	 Parent corp  <span style="font-weight:bold;padding-left:.5mm;padding-right:.5mm;">(3)</span>
							<input type="checkbox" alt="IRS1120LScheduleM3/IncomeLossItems/ConsolidatedEliminations" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/ConsolidatedEliminationsInd"/>
						<xsl:with-param name="BackupName">IRS1120LScheduleM3/IncomeLossItems/ConsolidatedEliminationsInd</xsl:with-param>
		</xsl:call-template>
		</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/ConsolidatedEliminationsInd"/>
								</xsl:call-template>
							</label>
						</div>
						<div class="styGenericDiv" style="padding-left:1px;">
           	Consolidated eliminations 
           	<span style="font-weight:bold;padding-left:.5mm;padding-right:.5mm;">(4)</span>
						<input type="checkbox" alt="IRS1120LScheduleM3/IncomeLossItems/SubsidiaryCorporation" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/SubsidiaryCorporationInd"/>
							<xsl:with-param name="BackupName">IRS1120LScheduleM3/IncomeLossItems/SubsidiaryCorporationInd</xsl:with-param>
						</xsl:call-template>
					</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/SubsidiaryCorporationInd"/>
								</xsl:call-template>
							</label>
						</div>
						<div class="styGenericDiv" style="padding-left:1px;padding-top:5px;">Subsidiary corp</div>
						<div class="styGenericDiv" style="padding-left:1px;">
							<span style="font-weight:bold;padding-left:.5mm;padding-right:.5mm;">(5)</span>
							<input type="checkbox" alt="IRS1120LScheduleM3/IncomeLossItems/Mixed1120LPCGroup" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/Mixed1120LPCGroupInd"/>
							<xsl:with-param name="BackupName">IRS1120LScheduleM3/IncomeLossItems/Mixed1120LPCGroupInd</xsl:with-param>
						</xsl:call-template>
					</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/Mixed1120LPCGroupInd"/>
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
							<input type="checkbox" alt="IRS1120LScheduleM3/IncomeLossItems/Is1120LGroup" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/Is1120LGroupInd"/>
							<xsl:with-param name="BackupName">IRS1120LScheduleM3/IncomeLossItems/Is1120LGroupInd</xsl:with-param>
						</xsl:call-template>
					</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/Is1120GroupInd"/>
								</xsl:call-template>
							</label>
						</div>
						<div class="styGenericDiv" style="padding-left:1px;">
           	1120-L group <span style="font-weight:bold;padding-left:.5mm;padding-right:.5mm;">(7)</span>
							<input type="checkbox" alt="alt" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/Is1120LEliminationsInd"/>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/Is1120LEliminationsInd"/>
								</xsl:call-template>
							</label>
						</div>
						<div class="styGenericDiv" style="padding-left:1px;padding-top:5px;">
           	1120-L eliminations</div>
					</div>
					<!-- end check box line2  -->
					<!-- Subsidiary Name and EIN Line -->
					<div style="width:187mm;">
						<!-- Name -->
						<div style="width:138mm;height:10mm;border-right:solid 1px;float:left;clear:none;border-top:solid 1px;">Name of subsidiary (if consolidated return)<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/SubsidiaryBusinessName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="$Form1120LScheduleM3/IncomeLossItems/SubsidiaryBusinessName/BusinessNameLine2Txt">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/SubsidiaryBusinessName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<!-- Employer Identification Number -->
						<div style="width:48.9mm;float:right;clear:none;border-top:solid 1px;padding-left:2mm">
							<span class="styBoldText">Employer identification number</span>
							<br/><br/>
							<xsl:if test="$Form1120LScheduleM3/IncomeLossItems/SubsidiaryEIN !=' '">
								<span style="font-weight:normal;">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/SubsidiaryEIN"/>
									</xsl:call-template>
								</span>
							</xsl:if>
							<xsl:if test="$Form1120LScheduleM3/IncomeLossItems/MissingEINReasonCd !=' '">
								<span style="font-weight:normal;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/MissingEINReasonCd">
										</xsl:with-param>
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
							<span style="width:2mm;"/>Taxable Income per Return
						    <span style="font-weight:normal">(see instructions)</span>
						</span>
					</div>
					<!-- Part II Table -->
					<table class="styTable" id="IRS1120LScheduleM3PartIITable" summary="Reconciliation of Net Income (Loss) per Income Statement of Includible Corporations With Taxable Income per Return " cellspacing="0" cellpadding="0" style="font-size:7pt;width:187mm;">
						<tr>
							<th class="styTableThead" style="width:6mm"/>
							<th class="styTableThead" style="width:81mm;text-align:center;font-size:8pt;display:table-cell;">Income (Loss) Items<br/>
								<span style="font-size:7pt;font-weight:normal;">(Attach statements for lines 1 through 11)</span>
							</th>
							<th class="styIRS1120LScheduleM3TheadCell">
								<span class="styBoldText">
                           (a)</span>
								<br/> Income (Loss) per<br/> Income Statement <br/>
							</th>
							<th class="styIRS1120LScheduleM3TheadCell">
								<span class="styBoldText">
                           (b)</span>
								<br/> Temporary<br/> Difference</th>
							<th class="styIRS1120LScheduleM3TheadCell">
								<span class="styBoldText">
                           (c)</span>
								<br/> Permanent<br/> Difference</th>
							<th class="styIRS1120LScheduleM3TheadCell">
								<span class="styBoldText">
                           (d)</span>
								<br/> Income (Loss) per<br/> Tax Return <br/>
							</th>
						</tr>
						<!-- Part II - Line 1 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">
								<span style="width:1.5mm;"/>1</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell">
							 Income (loss) from equity method foreign corporations
            <!-- Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/IncomeLossEquityMethodFrgnCorp"/>
								</xsl:call-template>
								<!--<span class="styDotLn" style="float:right;padding-right:2mm;">.....................</span>-->
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/IncomeLossEquityMethodFrgnCorp/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/IncomeLossEquityMethodFrgnCorp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/IncomeLossEquityMethodFrgnCorp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3ShadedCell">
								<span style="width:1mm"/>
							</td>
						</tr>
						<!-- Part II - Line 2 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">
								<span style="width:1.5mm;"/>2</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell">
								<span style="float:left;">Gross foreign dividends not previously taxed
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/GrossFrgnDividendsNotPrevTaxed"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">...</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/GrossFrgnDividendsNotPrevTaxed/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/GrossFrgnDividendsNotPrevTaxed/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/GrossFrgnDividendsNotPrevTaxed/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/GrossFrgnDividendsNotPrevTaxed/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 3 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">
								<span style="width:1.5mm;"/>3</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell">
								<span style="float:left;">Subpart F, QEF, and similar income inclusions
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/SubpartFQEFSimilarIncmInclsn"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">..</span>
							</td>
							<td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/SubpartFQEFSimilarIncmInclsn/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/SubpartFQEFSimilarIncmInclsn/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/SubpartFQEFSimilarIncmInclsn/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 4 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">
								<span style="width:1.5mm;"/>4</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell">
								<span style="float:left;">Section 78 gross-up
								    <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/Section78GrossUp"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">..........</span>
							</td>
							<td class="styIRS1120LScheduleM3ShadedCell">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/Section78GrossUp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/Section78GrossUp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/Section78GrossUp/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 5 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">
								<span style="width:1.5mm;"/>5</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell">
								<span style="float:left;">Gross foreign distributions previously taxed
								 <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/GrossForeignDistriPrevTaxed"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">...</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/GrossForeignDistriPrevTaxed/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/GrossForeignDistriPrevTaxed/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/GrossForeignDistriPrevTaxed/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
								<span style="width:1mm"/>
							</td>
						</tr>
						<!-- Part II - Line 6 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">
								<span style="width:1.5mm;"/>6</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell">
							    <span style="float:left;">Income (loss) from equity method U.S. corporations
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/IncomeLossEquityMethodUSCorp"/>
									</xsl:call-template>
								</span>
<!--								<span class="styDotLn" style="float:right;padding-right:2mm;">.</span>
-->							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/IncomeLossEquityMethodUSCorp/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/IncomeLossEquityMethodUSCorp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/IncomeLossEquityMethodUSCorp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3ShadedCell">
								<span style="width:1mm"/>
							</td>
						</tr>
						<!-- Part II - Line 7 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">
								<span style="width:2mm;"/>7</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell">
								<span style="float:left;">U.S. dividends not eliminated in tax consolidation
								<!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/USDivNotEliminatedTaxConsol"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">.</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/USDivNotEliminatedTaxConsol/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/USDivNotEliminatedTaxConsol/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/USDivNotEliminatedTaxConsol/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/USDivNotEliminatedTaxConsol/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 8 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">
								<span style="width:1.5mm;"/>8</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell">
								<span style="float:left;">Minority interest for includible corporations
								 <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/MinorityInterestIncludibleCorp"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">...</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/MinorityInterestIncludibleCorp/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/MinorityInterestIncludibleCorp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/MinorityInterestIncludibleCorp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3ShadedCell">
								<span style="width:1mm"/>
							</td>
						</tr>
						<!-- Part II - Line 9 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">
								<span style="width:1.5mm;"/>9</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell">
								<span style="float:left;">Income (loss) from U.S. partnerships 
								            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/IncomeLossUSPartnerships"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">.....</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/IncomeLossUSPartnerships/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/IncomeLossUSPartnerships/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/IncomeLossUSPartnerships/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/IncomeLossUSPartnerships/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 10 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">10</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell">
								<span style="float:left;">Income (loss) from foreign partnerships
								            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/IncomeLossForeignPartnerships"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">....</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/IncomeLossForeignPartnerships/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/IncomeLossForeignPartnerships/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/IncomeLossForeignPartnerships/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/IncomeLossForeignPartnerships/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 11 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">11</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell">
								<span style="padding-top:.5mm;float:left;">Income (loss) from other pass-through entities 
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/IncomeLossPassThroughEntities"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">..</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/IncomeLossPassThroughEntities/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/IncomeLossPassThroughEntities/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/IncomeLossPassThroughEntities/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/IncomeLossPassThroughEntities/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
							<!-- Part II - Line 12 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">12</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell">
								    Items relating to reportable transactions (attach <br/>
							     <span style="float:left;">statement)
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/ItemsRelatedReportableTransGrp"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">..............</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/ItemsRelatedReportableTransGrp/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/ItemsRelatedReportableTransGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/ItemsRelatedReportableTransGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/ItemsRelatedReportableTransGrp/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 13 -->
						<tr>
										<td class="styIRS1120LScheduleM3NumberCell">13</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell">
								<span style="float:left;">Interest income (attach Form 8916-A)
								 <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/InterestIncomeForm8916AGrp"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">.....</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/InterestExpenseForm8916AGrp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/InterestExpenseForm8916AGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/InterestExpenseForm8916AGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/InterestExpenseForm8916AGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
					<!--	--><!-- Part II - Line 13 --><!--
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">13</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell">
								<span style="float:left;">Interest income (attach Form 8916-A)
								 <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/InterestIncome"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">....</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/AccrualBondDiscountGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/AccrualBondDiscountGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/AccrualBondDiscountGrp/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>-->
						<!-- Part II - Line 14 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">14</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell">
								<span style="float:left;">Accrual of bond discount</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">..........</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/AccrualBondDiscountGrp/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/AccrualBondDiscountGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/AccrualBondDiscountGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/AccrualBondDiscountGrp/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 15 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">15</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell">
								<span style="float:left;">Hedging transactions</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">...........</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/HedgingTransactions/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/HedgingTransactions/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/HedgingTransactions/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/HedgingTransactions/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 16 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">16</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell">
								<span style="float:left;">Mark-to-market income (loss)</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">........</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/MarkToMarketIncomeLoss/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/MarkToMarketIncomeLoss/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/MarkToMarketIncomeLoss/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/MarkToMarketIncomeLoss/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 17 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">17</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell">
								<span style="float:left;">Deferred and uncollected premiums</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">......</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/DeferredUncollectedPremiumsGrp/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/DeferredUncollectedPremiumsGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
						<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/DeferredUncollectedPremiumsGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/DeferredUncollectedPremiumsGrp/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 18 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">18</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell">
								<span style="float:left;">Sale versus lease (for sellers and/or lessors)</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">...</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/SalesVersusLease/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/SalesVersusLease/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/SalesVersusLease/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/SalesVersusLease/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 19 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">19</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell">
								<span style="float:left;">Section 481(a) adjustments</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">.........</span>
							</td>
							<td class="styIRS1120LScheduleM3ShadedCell">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/Section481aAdjustments/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/Section481aAdjustments/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/Section481aAdjustments/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 20 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">20</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell">
								<span style="float:left;">Amortization of interest maintenance reserve</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">...</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/AmortizationIntMaintReserveGrp/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/AmortizationIntMaintReserveGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/AmortizationIntMaintReserveGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
								<span style="width:1mm"/>
							</td>
						</tr>
						<!-- Part II - Line 21 -->
				<tr>
							<td class="styIRS1120LScheduleM3NumberCell">21</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell">
								<span style="float:left;">Original issue discount and other imputed interest</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">..</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/OrigIssueDiscountOthImputedInt/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/OrigIssueDiscountOthImputedInt/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/OrigIssueDiscountOthImputedInt/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell" style="border-top-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/OrigIssueDiscountOthImputedInt/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 22 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">22</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell">
								<span style="float:left;">Market discount reclassification</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">........</span>
							</td>
							<td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/MarketDiscountReclsGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/MarketDiscountReclsGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/MarketDiscountReclsGrp/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 23a -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">23a</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell" style="padding-top:.5mm;">Income statement gain/loss on sale, exchange,
								  abandonment, worthlessness, or other disposition of
								  <span style="float:left"> assets other than pass-through entities</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">.....</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell" style="border-top-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/IncmStmtGainLossDisposAst/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/IncmStmtGainLossDisposAst/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/IncmStmtGainLossDisposAst/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:1px;">
								<span style="width:1mm"/>
							</td>
						</tr>
						<!-- Part II - Line 23b -->
						<tr>
							<td class="styLNLeftNumBoxSD" style="padding-bottom:7px;padding-top:0px;">
								<span style="width:2.5mm;"/>b</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell" style="padding-top:.5mm;">Gross capital gains from Schedule D, excluding
                             <span style="float:left">amounts from pass-through entities</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">......</span>
							</td>
							<td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/GrossCapitalGainsFromSchD/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/GrossCapitalGainsFromSchD/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/GrossCapitalGainsFromSchD/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 23c -->
						<tr>
							<td class="styLNLeftNumBoxSD" style="padding-bottom:19px;padding-top:0px;">
								<span style="width:2.5mm;"/>c</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell" style="padding-top:.5mm;">Gross capital losses from Schedule D, excluding
							  amounts from pass-through entities, abandonment 
							    <span style="float:left">losses, and worthless stock losses</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">.......</span>
							</td>
							<td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/GrossCapitalLossesFromSchD/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/GrossCapitalLossesFromSchD/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/GrossCapitalLossesFromSchD/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 23d -->
						<tr>
							<td class="styLNLeftNumBoxSD" style="padding-bottom:19px;padding-top:0px;">
								<span style="width:2.5mm;"/>d</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell" style="padding-top:.5mm;">Net gain/loss reported on Form 4797, line 17,
                             excluding amounts from pass-through entities, abandonment 
							   <span style="float:left">losses, and worthless stock losses</span>
							   <span class="styDotLn" style="float:right;padding-right:2mm;">......</span>
							</td>
							<td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/GainLossReportedOnForm4797/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/GainLossReportedOnForm4797/PermanentDifferenceAmt"/>
								</xsl:call-template>							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/GainLossReportedOnForm4797/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 23e -->
						<tr>
							<td class="styLNLeftNumBoxSD" style="padding-bottom:3px;padding-top:0px;">
								<span style="width:2.5mm;"/>e</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell" style="padding-top:.5mm;">
								<span style="float:left">Abandonment losses</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">...........</span>
							</td>
							<td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/AbandonmentLosses/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/AbandonmentLosses/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/AbandonmentLosses/IncomeLossPerTaxReturn"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 23f -->
						<tr>
							<td class="styLNLeftNumBoxSD" style="padding-bottom:.5px;">
								<span style="width:2.5mm;"/>f</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell">
								<span style="float:left;">Worthless stock losses (attach statement)          
<!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/WorthlessStockLosses"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">...</span>
							</td>
							<td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/WorthlessStockLosses/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/WorthlessStockLosses/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/WorthlessStockLosses/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 23g -->
						<tr>
							<td class="styLNLeftNumBoxSD" style="padding-bottom:8px;padding-top:0px;">
								<span style="width:2.5mm;"/>g</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell" style="padding-top:.5mm;">
								<span style="float:left">Other gain/loss on disposition of assets</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">.....</span>
							</td>
							<td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/OthGainLossDisposAssets/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/OthGainLossDisposAssets/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/OthGainLossDisposAssets/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
					</tr>
						<!-- Part II - Line 24 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">24</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell" style="padding-top:.5mm;">
								<span style="float:left">Capital loss limitation and carryforward used</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">....</span>
							</td>
							<td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/CapLossLimitationAndCfwdUsed/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/CapLossLimitationAndCfwdUsed/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/CapLossLimitationAndCfwdUsed/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 25 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">25</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell">
							 Other income (loss) items with differences (attach
								<span style="float:left"> statement)							 
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/OthIncmLossItemsDifferences"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">.............</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell" style="border-top-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/OthIncmLossItemsDifferences/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/OthIncmLossItemsDifferences/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/OthIncmLossItemsDifferences/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/OthIncmLossItemsDifferences/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 26 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">26</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell" style="padding-top:.5mm; font-size:8.5px;">
								<span style="float:left">
									<b>Total income (loss) items. </b>Combine lines 1 through 25</span>
								<!-- Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/TotalIncomeLossItems"/>
								</xsl:call-template>
								<span class="styDotLn" style="float:right;padding-right:2mm;">..</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/TotalIncomeLossItems/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/TotalIncomeLossItems/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/TotalIncomeLossItems/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/TotalIncomeLossItems/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 27 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">27</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell">
								<span class="styBoldText" style="font-weight:normal">
									<b>Total expense/deduction items</b> (from Part III, line 41) </span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/TotalExpenseDeductionItems/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/TotalExpenseDeductionItems/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/TotalExpenseDeductionItems/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/TotalExpenseDeductionItems/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 28 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell" style="padding-bottom:2mm;">28</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell">
								<span style="float:left">Other items with no differences </span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">........</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/OtherItemsNoDifferences/IncomePerIncomeStatementAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
								<span style="width:1mm"/>
						</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/OtherItemsNoDifferences/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 29a -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell" style="padding-bottom:2mm;">29a</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell" style="padding-top:.5mm;">Mixed groups, see instructions. All others, combine 
							 <span style="float:left">lines 26 through 28</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">............</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/MixedGroupsAllOthers/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell" style="border-top-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/MixedGroupsAllOthers/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell" style="border-top-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/MixedGroupsAllOthers/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/MixedGroupsAllOthers/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 29b -->
						<tr>
							<td class="styLNLeftNumBoxSD">
								<span style="width:2.5mm"/>b</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell" style="padding-top:.5mm;">
								<span style="float:left"> 1120 subgroup reconciliation totals</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">......</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/SubgroupReconciliationTotals/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/SubgroupReconciliationTotals/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/SubgroupReconciliationTotals/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/SubgroupReconciliationTotals/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 29c -->
						<tr>
							<td class="styLNLeftNumBoxSD">
								<span style="width:2.5mm"/>c</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell" style="padding-top:.5mm;">
								<span style="float:left">PC insurance subgroup reconciliation totals</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">....</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/PCInsSubgroupRecnclTotals/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/PCInsSubgroupRecnclTotals/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/PCInsSubgroupRecnclTotals/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/PCInsSubgroupRecnclTotals/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 30 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">30</td>
							<td class="styIRS1120LScheduleM3PartIICol1Cell">
								<span class="styBoldText" style="font-weight:bold">Reconciliation totals. </span>
								<span style="font-weight:normal">Combine lines 29a through 29c</span>
								<span class="styDotLn" style="float:none;padding-left:3mm;"/>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/ReconciliationTotals/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/ReconciliationTotals/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/ReconciliationTotals/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/ReconciliationTotals/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<!-- Table R40 L 30 Note -->
					<div class="styBB" style="width:187mm;border-bottom:2px solid black;">
						<span class="styBoldText" style="margin-left:10mm;">Note.</span> 
					    Line 30, column (a), must equal the amount on Part I, line 11, and column (d) must equal Form 1120-L, page 1,  line 20. </div>
					<!-- Page 2 END -->
					<div class="pageEnd" style="width:187mm;">
					<div class="styBoldText" style="float:right;padding-top:1mm;">Schedule M-3 (Form 1120-L) 2014</div>
					</div>
					<!-- Page 3 -->
					<!-- Page 3 Header -->
					<div class="styBB" style="width:187mm;float:none;">
						<div style="float:left;">Schedule M-3 (Form 1120-L) 2014</div>
						<div style="float:right;">Page <span style="font-size:9pt;font-weight:bold;">3</span>
						</div>
					</div>
					<!-- Name and EIN Line -->
					<div class="styBB" style="width:187mm;">
						<!-- Name -->
						<div style="width:138mm;height:auto;border-right:solid 1px;float:left;clear:none;">
          Name of corporation (common parent, if consolidated return)<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/BusinessName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/BusinessName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</div>
						<!-- Employer Identification Number -->
						<div style="width:47mm;float:right;clear:none;">
							<span class="styBoldText">Employer identification number</span>
							<br/><br/>
							<xsl:choose>
								<xsl:when test="$Form1120LScheduleM3/EIN">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/EIN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/MissingEINReasonCd"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!-- Defined to resolve ID conflict for ConsolidatedGroup2-->
					<xsl:variable name="consolidatedGroup2BaseID">
						<xsl:call-template name="PopulateID">
							<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItemsGrp/ConsolidatedGroupInd"/>
						</xsl:call-template>
					</xsl:variable>
					<!-- Defined to resolve ID conflict for ParentCorporation2-->
					<xsl:variable name="parentCorporation2BaseID">
						<xsl:call-template name="PopulateID">
							<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ParentCorporationInd"/>
						</xsl:call-template>
					</xsl:variable>
					<!-- Defined to resolve ID conflict for ConsolidatedEliminations2-->
					<xsl:variable name="consolidatedEliminations2BaseID">
						<xsl:call-template name="PopulateID">
							<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ConsolidatedEliminationsInd"/>
						</xsl:call-template>
					</xsl:variable>
					<!-- Defined to resolve ID conflict for SubsidiaryCorporation2-->
					<xsl:variable name="subsidiaryCorporation2BaseID">
						<xsl:call-template name="PopulateID">
							<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/SubsidiaryCorporationInd"/>
						</xsl:call-template>
					</xsl:variable>
					<!-- Defined to resolve ID conflict for Mixed1120LPCGroup2-->
					<xsl:variable name="mixed1120LPCGroup2BaseID">
						<xsl:call-template name="PopulateID">
							<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/Mixed1120LPCGroupInd"/>
						</xsl:call-template>
					</xsl:variable>
					<!-- Defined to resolve ID conflict for Is1120Group2-->
					<xsl:variable name="is1120Group2BaseID">
						<xsl:call-template name="PopulateID">
							<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/Is1120GroupInd"/>
						</xsl:call-template>
					</xsl:variable>
					<!-- start check box line1  -->
					<div style="width:187mm;font-size:6pt;">
						<div class="styGenericDiv" style="padding-left:2mm;">
           	Check applicable box(es): <span style="font-weight:bold;padding-left:.5mm;padding-right:.5mm;">(1)</span>
							<input type="checkbox" alt="IRS1120LScheduleM3/NonConsolidatedReturn" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ConsolidatedGroupInd"/>
								<xsl:with-param name="BackupName">IRS1120LScheduleM3/ExpenseDeductionItems/ConsolidatedGroupInd</xsl:with-param>
						</xsl:call-template>
						</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ConsolidatedGroupInd"/>
								</xsl:call-template>
								<xsl:attribute name="for"><xsl:value-of select="concat($consolidatedGroup2BaseID, '[2]')"/></xsl:attribute>
							</label>
						</div>
						<div class="styGenericDiv" style="padding-left:1px;">Consolidated group 
           	<span style="font-weight:bold;padding-left:.5mm;padding-right:.5mm;">(2)</span>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ParentCorporationInd"/>
								</xsl:call-template>
								<xsl:attribute name="id"><xsl:value-of select="concat($parentCorporation2BaseID, '[2]')"/></xsl:attribute>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ParentCorporationInd"/>
								</xsl:call-template>
								<xsl:attribute name="for"><xsl:value-of select="concat($parentCorporation2BaseID, '[2]')"/></xsl:attribute>
							</label>
						</div>
						<div class="styGenericDiv" style="padding-left:1px;">
           	 Parent corp <span style="font-weight:bold;padding-left:.5mm;padding-right:.5mm;">(3)</span>
						<input type="checkbox" alt="IRS1120LScheduleM3/ExpenseDeductionItems/ConsolidatedEliminationsInd" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ConsolidatedEliminationsInd"/>
							<xsl:with-param name="BackupName">IRS1120LScheduleM3/ExpenseDeductionItems/ConsolidatedEliminationsInd</xsl:with-param>
					</xsl:call-template>
				</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ConsolidatedEliminationsInd"/>
								</xsl:call-template>
								<xsl:attribute name="for"><xsl:value-of select="concat($consolidatedEliminations2BaseID, '[3]')"/></xsl:attribute>
							</label>
						</div>
							<div class="styGenericDiv" style="padding-left:1px;">
           	 Consolidated eliminations <span style="font-weight:bold;padding-left:.5mm;padding-right:.5mm;">(4)</span>
							<input type="checkbox" alt="IRS1120LScheduleM3/ExpenseDeductionItems/SubsidiaryCorporationInd" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/SubsidiaryCorporationInd"/>
								<xsl:with-param name="BackupName">IRS1120LScheduleM3/ExpenseDeductionItems/SubsidiaryCorporationInd</xsl:with-param>
							</xsl:call-template>
						</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/SubsidiaryCorporationInd"/>
								</xsl:call-template>
								<xsl:attribute name="for"><xsl:value-of select="concat($subsidiaryCorporation2BaseID, '[4]')"/></xsl:attribute>
							</label>
						</div>
						<div class="styGenericDiv" style="padding-left:1px;padding-top:5px;">Subsidiary corp</div>
						<div class="styGenericDiv" style="padding-left:1px;;">
							<span style="font-weight:bold;padding-left:.5mm;padding-right:.5mm;">(5)</span>
							<input type="checkbox" alt="IRS1120LScheduleM3/ExpenseDeductionItems/Mixed1120LPCGroupInd" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/Mixed1120LPCGroupInd"/>
							<xsl:with-param name="BackupName">IRS1120LScheduleM3/ExpenseDeductionItems/Mixed1120LPCGroupInd</xsl:with-param>
						</xsl:call-template>
					</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/Mixed1120LPCGroupInd"/>
								</xsl:call-template>
								<xsl:attribute name="for"><xsl:value-of select="concat($mixed1120LPCGroup2BaseID, '[5]')"/></xsl:attribute>
					Mixed 1120/L/PC group
				</label>
						</div>
					</div>
					<!-- end check box line1  -->
					<!-- start check box line2  -->
					<div style="width:187mm;font-size:6pt;">
						<div class="styGenericDiv" style="padding-left:2mm;">
           	Check if a sub-consolidated: <span style="font-weight:bold;padding-left:.5mm;padding-right:.5mm;">(6)</span>
							<input type="checkbox" alt="IRS1120LScheduleM3/ExpenseDeductionItems/Is1120LGroupInd" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/Is1120LGroupInd"/>
						<xsl:with-param name="BackupName">IRS1120LScheduleM3/ExpenseDeductionItems/Is1120LGroupInd</xsl:with-param>
					</xsl:call-template>
				</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/Is1120LGroupInd"/>
								</xsl:call-template>
								<xsl:attribute name="for"><xsl:value-of select="concat($is1120Group2BaseID, '[6]')"/></xsl:attribute>
							</label>
						</div>
						<div class="styGenericDiv" style="padding-left:1px;">
           	1120-L group <span style="font-weight:bold;padding-left:.5mm;padding-right:.5mm;">(7)</span>
							<input type="checkbox" alt="alt" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/Is1120LEliminationsInd"/>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/Is1120LEliminationsInd"/>
								</xsl:call-template>
							</label>
						</div>
						<div class="styGenericDiv" style="padding-left:1px;padding-top:5px;">
           	1120-L eliminations</div>
					</div>
					<!-- end check box line2  -->
					<!-- Subsidiary Name and EIN Line -->
					<div style="width:187mm;">
						<!-- Name -->
						<div style="width:138mm;height:10mm;border-right:solid 1px;float:left;clear:none;border-top:solid 1px;">
          Name of subsidiary (if consolidated return)<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/SubsidiaryBusinessName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="$Form1120LScheduleM3/ExpenseDeductionItems/SubsidiaryBusinessName/BusinessNameLine2Txt">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/SubsidiaryBusinessName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<!-- Employer Identification Number -->
						<div style="width:48.9mm;float:right;clear:none;border-top:solid 1px;padding-left:2mm">
							<span class="styBoldText">Employer identification number</span>
							<br/><br/>
							<!-- xsl:call-template name="PopulateEIN">
              <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/SubsidiaryEIN"/>
          </xsl:call-template -->
							<xsl:if test="$Form1120LScheduleM3/ExpenseDeductionItems/SubsidiaryEIN!=' '">
								<span style="font-weight:normal;">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/SubsidiaryEIN"/>
									</xsl:call-template>
								</span>
							</xsl:if>
							<xsl:if test="$Form1120LScheduleM3/ExpenseDeductionItems/MissingEINReasonCd !=' '">
								<span style="font-weight:normal;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/MissingEINReasonCd"/>
									</xsl:call-template>
								</span>
							</xsl:if>
						</div>
					</div>
					<!-- Part 3 - Header -->
					<div style="width:187mm;height:8mm;border-style:solid; border-bottom-width:1px;border-top-width:1px; border-right-width:0px;border-left-width:0px;padding-top:0;float:left;">
						<span class="styPartName" style="height:4mm;width:14mm;padding: .25mm .5mm .25mm .5mm;">Part III</span>
						<span class="styPartDesc" style="width:170mm;">
							<span style="width:2mm;"/>Reconciliation of Net Income (Loss) per Income Statement of Includible Corporations With <br/>
							<span style="width:2mm;"/>Taxable Income per Return—Expense/Deduction Items <span style="font-weight:normal">(see instructions)</span>
						</span>
					</div>
					<!-- Part III Table -->
					<table class="styTable" id="IRS1120LScheduleM3PartIII" summary="Reconciliation of Net Income (Loss) per Income Statement of Includible Corporations With Taxable Income per Return—Expense/Deduction Items " cellspacing="0" cellpadding="0" style="font-size:7pt;width:187mm;">
						<tr>
							<th class="styTableThead" style="width:6mm"/>
							<th class="styTableThead" style="width:81mm;text-align:center;font-size:8pt;display:table-cell;">Expense/Deduction Items</th>
							<th class="styIRS1120LScheduleM3TheadCell">
								<span class="styBoldText">(a)</span>
								<br/> Expense per<br/> Income Statement<br/>
							</th>
							<th class="styIRS1120LScheduleM3TheadCell">
								<span class="styBoldText">(b)</span>
								<br/> Temporary<br/> Difference</th>
							<th class="styIRS1120LScheduleM3TheadCell">
								<span class="styBoldText">(c)</span>
								<br/> Permanent<br/> Difference</th>
							<th class="styIRS1120LScheduleM3TheadCell">
								<span class="styBoldText">(d)</span>
								<br/> Deduction per<br/> Tax Return<br/>
							</th>
						</tr>
						<!-- Part III - Line 1 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">
								<span style="width:1.5mm;"/>1</td>
							<td>
								<span style="float:left;">U.S. current income tax expense</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">........</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/USCurrentIncomeTaxExpense/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/USCurrentIncomeTaxExpense/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/USCurrentIncomeTaxExpense/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
								<span style="width:1mm"/>
							</td>
						</tr>
						<!-- Part III - Line 2 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">
								<span style="width:1.5mm;"/>2</td>
							<td>
								<span style="float:left;">U.S. deferred income tax expense</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">........</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/USDeferredIncomeTaxExpense/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/USDeferredIncomeTaxExpense/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/USDeferredIncomeTaxExpense/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3ShadedCell">
								<span style="width:1mm"/>
							</td>
						</tr>
						<!-- Part III - Line 3 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">
								<span style="width:1.5mm;"/>3</td>
							<td>
								<span style="float:left;">State and local current income tax expense</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">....</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/StateLocalCurrIncomeTaxExpense/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/StateLocalCurrIncomeTaxExpense/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/StateLocalCurrIncomeTaxExpense/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/StateLocalCurrIncomeTaxExpense/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 4 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">
								<span style="width:1.5mm;"/>4</td>
							<td>
								<span style="float:left;">State and local deferred income tax expense</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">....</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/StateLocalDefrdIncmTaxExpense/               ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/StateLocalDefrdIncmTaxExpense/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/StateLocalDefrdIncmTaxExpense/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3ShadedCell">
								<span style="width:1mm"/>
							</td>
						</tr>
						<!-- Part III - Line 5 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">
								<span style="width:1.5mm;"/>5</td>
							<td style="padding-top:.5mm;">Foreign current income tax expense (other than foreign
							 <span style="float:left;"> withholding taxes)</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">.............</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ForeignCurrentIncomeTaxExpense/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ForeignCurrentIncomeTaxExpense/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ForeignCurrentIncomeTaxExpense/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ForeignCurrentIncomeTaxExpense/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 6 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">
								<span style="width:1.5mm;"/>6</td>
							<td>
								<span style="float:left;">Foreign deferred income tax expense</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">.......</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ForeignDeferredIncmTaxExpense/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ForeignDeferredIncmTaxExpense/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/               ExpenseDeductionItems/ForeignDeferredIncmTaxExpense/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3ShadedCell">
								<span style="width:1mm"/>
							</td>
						</tr>
						<!-- Part III - Line 7 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">
								<span style="width:1.5mm;"/>7</td>
							<td>
								<span style="float:left;">Foreign withholding taxes</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">...........</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ForeignWithholdingTaxes/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ForeignWithholdingTaxes/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ForeignWithholdingTaxes/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ForeignWithholdingTaxes/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 8 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">
								<span style="width:1.5mm;"/>8</td>
							<td>
								<span style="float:left;">Equity-based compensation          
              <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/EquityBasedCompensationGrp"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">.........</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/EquityBasedCompensationGrp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/EquityBasedCompensationGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/EquityBasedCompensationGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/EquityBasedCompensationGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 9 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">
								<span style="width:1.5mm;"/>9</td>
							<td>
								<span style="float:left;">Capitalization of deferred acquisition costs</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">.....</span>
							</td>
							<td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/CapitalizationDefrdAcquisCosts/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/CapitalizationDefrdAcquisCosts/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/CapitalizationDefrdAcquisCosts/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 10 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">10</td>
							<td>
								<span style="float:left;">Amortization of deferred acquisition costs</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">.....</span>
							</td>
							<td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/AmortzDefrdAcquisCostsGrp/TemporaryDifferenceAmt"/>
					</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/AmortzDefrdAcquisCostsGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/AmortzDefrdAcquisCostsGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 11 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">11</td>
							<td>
								<span style="float:left;">Meals and entertainment</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">...........</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell" style="border-color:black;border-top-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/MealsAndEntertainmentGrp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/MealsAndEntertainmentGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/MealsAndEntertainmentGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/MealsAndEntertainmentGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 12 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">12</td>
							<td>
								<span style="float:left;">Fines and penalties</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">............</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/FinesAndPenalties/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/FinesAndPenalties/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/FinesAndPenalties/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/FinesAndPenalties/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 13 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">13</td>
							<td>
								<span style="float:left;">Judgments, damages, awards, and similar costs</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">...</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/JudgmentsDamagesAwardsSmlrCost/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/JudgmentsDamagesAwardsSmlrCost/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/JudgmentsDamagesAwardsSmlrCost/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/JudgmentsDamagesAwardsSmlrCost/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 14 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">14</td>
							<td>
								<span style="float:left;">Parachute payments</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">............</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ParachutePayments/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ParachutePayments/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ParachutePayments/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ParachutePayments/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 15 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">15</td>
							<td>
								<span style="float:left;">Compensation with section 162(m) limitation</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">....</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/CompWithSect162mLimitation/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/CompWithSect162mLimitation/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/CompWithSect162mLimitation/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/CompWithSect162mLimitation/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 16 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">16</td>
							<td>
								<span style="float:left;">Pension and profit-sharing</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">..........</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/PensionAndProfitSharing/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/PensionAndProfitSharing/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/PensionAndProfitSharing/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/PensionAndProfitSharing/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 17 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">17</td>
							<td>
								<span style="float:left;">Other post-retirement benefits</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">.........</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/OtherPostRetirementBenefits/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
						<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/OtherPostRetirementBenefits/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/OtherPostRetirementBenefits/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/OtherPostRetirementBenefits/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 18 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">18</td>
							<td>
								<span style="float:left;">Deferred compensation</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">...........</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/DeferredCompensation/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/DeferredCompensation/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/DeferredCompensation/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/DeferredCompensation/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 19 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">19</td>
							<td>
								<span style="float:left;">Charitable contribution of cash and tangible property</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">..</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/CharitbleContriCashTngblProp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/CharitbleContriCashTngblProp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/CharitbleContriCashTngblProp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/CharitbleContriCashTngblProp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
					</tr>
						<!-- Part III - Line 20 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">20</td>
							<td>
								<span style="float:left;">Charitable contribution of intangible property</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">....</span>							
								</td>
							<td class="styIRS1120LScheduleM3Cell">
							<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/CharitableContriIntangibleProp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/CharitableContriIntangibleProp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/CharitableContriIntangibleProp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/CharitableContriIntangibleProp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 21 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">21</td>
							<td>
								<span style="float:left;">Charitable contribution limitation/carryforward</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">....</span>
							</td>
							<td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/CharitableContriLimitationCfwd/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/CharitableContriLimitationCfwd/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/CharitableContriLimitationCfwd/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 22 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">22</td>
							<td>
								<span style="float:left;">Change in section 807(c)(1) tax reserves</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">.....</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell" style="border-color:black;border-top-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ChangeSection807c1TaxRsrvsGrp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ChangeSection807c1TaxRsrvsGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ChangeSection807c1TaxRsrvsGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ChangeSection807c1TaxRsrvsGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 23 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">23</td>
							<td style="padding-top:.5mm;">
								<span style="float:left;">Change in section 807(c)(2) tax reserves</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">.....</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ChangeSection807c2TaxRsrvsGrp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ChangeSection807c2TaxRsrvsGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ChangeSection807c2TaxRsrvsGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
						<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ChangeSection807c2TaxRsrvsGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 24 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">24</td>
							<td style="padding-top:.5mm;">
								<span style="float:left;">Change in all other section 807(c) tax reserves</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">...</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ChangeAllOthSect807cTxRsrvGrp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ChangeAllOthSect807cTxRsrvGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ChangeAllOthSect807cTxRsrvGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ChangeAllOthSect807cTxRsrvGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 25 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">25</td>
							<td>Section 807(f) adjustments for change in computing<br/>
								<span style="float:left;">reserves</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">...............</span>
							</td>
							<td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/Sect807fAdjChgComputingRsrvGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/Sect807fAdjChgComputingRsrvGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/Sect807fAdjChgComputingRsrvGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 26 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">26</td>
							<td>Section 807(a)(2)(B) tax reserve amount with respect to
								<span style="float:left;">policyholder share of tax-exempt interest</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">.....</span>
							</td>
							<td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/Section807a2BTaxReservesAmtGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/Section807a2BTaxReservesAmtGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/Section807a2BTaxReservesAmtGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 27 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">27</td>
							<td style="padding-top:.5mm;">Current year acquisition/reorganization costs (attach
							 <span style="float:left;"> statement)          
             <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/CurrentYearAcquisReOrgCostsGrp"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">..............</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell" style="border-color:black;border-top-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/CurrentYearAcquisReOrgCostsGrp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/CurrentYearAcquisReOrgCostsGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/CurrentYearAcquisReOrgCostsGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/CurrentYearAcquisReOrgCostsGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 28 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">28</td>
							<td>Amortization of acquisition, reorganization, and start-up <br/>
							 <span style="float:left;">costs</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">................</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/AmortzAcquisReorgStartupCosts/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/AmortzAcquisReorgStartupCosts/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/AmortzAcquisReorgStartupCosts/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/AmortzAcquisReorgStartupCosts/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 29 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">29</td>
							<td>Amortization/impairment of goodwill, insurance in force 
							 <span style="float:left;">and ceding commissions
							  <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/AmortizationImpairmentGoodwill"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">..........</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/AmortizationImpairmentGoodwill/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/AmortizationImpairmentGoodwill/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/AmortizationImpairmentGoodwill/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/AmortizationImpairmentGoodwill/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 30 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">30</td>
							<td>
								<span style="float:left;">Other amortization or impairment write-offs</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">....</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/OtherAmortzImpairmentWriteOffs/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/OtherAmortzImpairmentWriteOffs/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/OtherAmortzImpairmentWriteOffs/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/OtherAmortzImpairmentWriteOffs/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 31 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">31</td>
							<td>
								<span style="float:left;">Section 846 amount</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">............</span>
							</td>
							<td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/Section846AmountGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/Section846AmountGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/Section846AmountGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 32 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">32</td>
							<td>
								<span style="float:left;">Depreciation</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">..............</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell" style="border-color:black;border-top-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/DepreciationGrp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/DepreciationGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/DepreciationGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/DepreciationGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 33 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">33</td>
							<td>
								<span style="float:left;">Bad debt expense/agency balances written off</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">....</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/BadDebtExpnsAgencyBalWrttnOff/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/BadDebtExpnsAgencyBalWrttnOff/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/BadDebtExpnsAgencyBalWrttnOff/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/BadDebtExpnsAgencyBalWrttnOff/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 34 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">34</td>
							<td>
								<span style="float:left;">Corporate owned life insurance premiums</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">.....</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/CorpOwnedLifeInsurancePremiums/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/CorpOwnedLifeInsurancePremiums/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/CorpOwnedLifeInsurancePremiums/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/CorpOwnedLifeInsurancePremiums/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 35 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">35</td>
							<td>Purchase versus lease (for purchasers and/or lessees)
							  <span class="styDotLn" style="float:none;padding-left:3mm;"/>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/PurchaseVersusLease/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/PurchaseVersusLease/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/PurchaseVersusLease/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/PurchaseVersusLease/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 36 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">36</td>
							<td>
								<span style="float:left;">Interest expense (attach Form 8916-A) 
								    <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/InterestExpenseForm8916AGrp"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">.....</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/InterestExpenseForm8916AGrp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/InterestExpenseForm8916AGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/InterestExpenseForm8916AGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/InterestExpenseForm8916AGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 37 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">37</td>
							<td>
								<span style="float:left;">Domestic production activities deduction</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">.....</span>
							</td>
							<td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:1px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/DomesticProductionActyDedGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/DomesticProductionActyDedGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/DomesticProductionActyDedGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 38 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">38</td>
							<td>
								<span style="float:left;">Research and development costs</span>
								<!-- UWR 56925 remove the dependency  06/12/2012 below    -->
								<!--<xsl:call-template name="SetFormLinkInline">
							  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
								 ExpenseDeductionItems/ResearchAndDevelopmentCosts"/>
							  </xsl:call-template>-->
								<span class="styDotLn" style="float:right;padding-right:2mm;">........</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ResearchAndDevelopmentCosts/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ResearchAndDevelopmentCosts/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ResearchAndDevelopmentCosts/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ResearchAndDevelopmentCosts/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 39 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">39</td>
							<td>
								<span style="float:left;">Section 118 exclusion (attach statement)
								    <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/Section118Exclusion"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">.....</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/Section118Exclusion/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/Section118Exclusion/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/Section118Exclusion/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/Section118Exclusion/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 40 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">40</td>
							<td style="padding-top:.5mm;">Other expense/deduction items with differences (attach 
                             <span style="float:left;">statement)
            <!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/OtherExpnsDedItemsDifferences"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">..............</span>
							</td>
							<td class="styIRS1120LScheduleM3Cell" style="border-color:black;border-top-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/OtherExpnsDedItemsDifferences/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/OtherExpnsDedItemsDifferences/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/OtherExpnsDedItemsDifferences/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/OtherExpnsDedItemsDifferences/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 41 -->
						<tr>
							<td class="styIRS1120LScheduleM3NumberCell">41</td>
							<td style="padding-top:.5mm;font-weight:bold">Total expense/deduction items.
          <span style="font-weight:normal">Combine lines 1 through 40. Enter here and on Part II, line 27, reporting positive amounts as negative and negative amounts as positive.</span>
								<span class="styDotLn" style="float:none;padding-left:3mm;"/>
							</td>
							<td class="styIRS1120LScheduleM3Cell" style="border-bottom:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/TotalExpenseDeductionItems/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell" style="border-bottom:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/TotalExpenseDeductionItems/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell" style="border-bottom:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/TotalExpenseDeductionItems/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120LScheduleM3Cell" style="border-bottom:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/TotalExpenseDeductionItems/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<div class="pageEnd" style="width:187mm;border-top:2px solid black;">
						<div class="styBoldText" style="float:right;padding-top:1mm;">Schedule M-3 (Form 1120-L) 2014</div>
					</div>
					<!-- Left Over Data Table -->
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
							<xsl:with-param name="TargetNode" select="$Form1120LScheduleM3"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>