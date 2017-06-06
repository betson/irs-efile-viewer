<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Steven Fook on 07/31/2014 --><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1065ScheduleM3Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form1065ScheduleM3" select="$RtnDoc/IRS1065ScheduleM3"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form1065ScheduleM3)"/>
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
				<meta name="Description" content="IRS Form 1065 Schedule M3"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1065ScheduleM3Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form1065ScheduleM3">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Header - Form1065SchM3 Number, Title, and Year -->
					<div class="styTBB" style="width:187mm;">
						<div class="styFNBox" style="width:25mm;height:14.5mm;border-right-width:2px;">
							<span class="styFormNumber" style="font-size:9pt;">SCHEDULE M-3<span style="font-size:8pt;">(Form 1065)</span>
								<!-- Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3"/>
								</xsl:call-template>
							</span>
							<br/>
							<span class="styAgency" style="height:4mm;padding-top:1mm;">
          Department of the Treasury<br/>
          Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:132mm;height:12mm;">
							<div class="styMainTitle" style="font-size:9.5pt">Net Income (Loss) Reconciliation<br/>for Certain Partnerships</div>
							<div class="styFST" style="height:4mm;">
								<img src="{$ImagePath}/1065ScheduleM3_Bullet_Title.gif" width="7" height="5" alt="Bullet"/>Attach to Form 1065 or Form 1065-B.<br/>
								<img src="{$ImagePath}/1065ScheduleM3_Bullet_Title.gif" width="7" height="5" alt="Bullet"/>Information about Schedule M-3 (Form 1065) and its
										instructions is at www.irs.gov/form1065.<br/>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:16mm;border-left-width:2px;">
							<div class="styOMB" style="height:1mm;">OMB No. 1545-0123</div>
							<div class="styTaxYear" style="height:7mm;padding-top:1mm;">20<span class="styTYColor">14</span>
							</div>
						</div>
					</div>
					<!-- End Header - Form Number, Title, and Year -->
					<!--  Name and Employer identification number  -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:124mm;height:6mm;font-size:7pt;">
            Name of partnership<br/>
							<div style="font-family:verdana;font-size:7pt;height:4mm;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<div class="styEINBox" style="height:4mm;padding-left:2mm;font-size:7pt;">
         Employer identification number<br/>
							<br/>
							<span style="font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!--  End Name and Employer indentification number  -->
					<br/>
					<div class="styBB" style="width:187mm;border-bottom:none;height:4mm">
						<span style="width:130mm;font-size:7pt;">
							<b>This Schedule M-3 is being filed because (check all that apply):</b>
						</span>
					</div>
					<div style="width:187mm;height:4mm;border-style:solid; border-bottom-width:1px;border-top-width:0;           border-right-width:0px;border-left-width:0px;float:left;">
						<!-- Line A -->
						<div style="width:187mm;">
							<div style="float:left;width:5mm;padding-left:1mm;padding-right:1mm;height:4mm;padding-top:none">
								<b>A</b>
							</div>
							<div class="styLNDesc" style="width:179mm;height:4mm;padding-top:none">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/TotalAssetsEndOfTaxYearInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/TotalAssetsEndOfTaxYearInd"/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/TotalAssetsEndOfTaxYearInd"/>
										<xsl:with-param name="BackupName" select="Form1065ScheduleM3/TotalAssetsEndOfTaxYearInd"/>
									</xsl:call-template>
								</label>
          The amount of the partnership's total assets at the end of the tax year is equal to $10 million or more.</div>
						</div>
						<!-- Line B -->
						<div style="width:187mm;">
							<div style="float:left;width:5mm;padding-left:1mm;padding-right:1mm;">
								<b>B</b>
							</div>
							<div class="styLNDesc" style="width:179mm;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/AdjustedTotalAssetsForYearInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/AdjustedTotalAssetsForYearInd"/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/AdjustedTotalAssetsForYearInd"/>
										<xsl:with-param name="BackupName" select="Form1065ScheduleM3/AdjustedTotalAssetsForYearInd"/>
									</xsl:call-template>
								</label>          
         The amount of the partnership’s adjusted total assets for the tax year is equal to $10 million or more. If box B is checked, enter the amount of adjusted total assets for the tax year 
<span style="width:30mm;border-bottom:solid 1px;text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/AdjustedTotalAssetsForYearInd/@amt"/>
									</xsl:call-template>
								</span>
.        </div>
						</div>
						<!-- Line C -->
						<div style="width:187mm;">
							<div style="float:left;width:5mm;padding-left:1mm;padding-right:1mm;">
								<b>C</b>
							</div>
							<div class="styLNDesc" style="width:179mm;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/TotalReceiptsForTaxYearInd "/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/TotalReceiptsForTaxYearInd "/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/TotalReceiptsForTaxYearInd "/>
										<xsl:with-param name="BackupName" select="Form1065ScheduleM3/TotalReceiptsForTaxYearInd "/>
									</xsl:call-template>
								</label>          
The amount of total receipts for the tax year is equal to $35 million or more. If box C is checked, enter the total
receipts for the tax year 
<span style="width:30mm;border-bottom:solid 1px;text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/TotalReceiptsForTaxYearInd/@totalReceiptsAmt"/>
									</xsl:call-template>
								</span>
.       </div>
						</div>
						<!-- Line D -->
						<div style="width:187mm;">
							<div style="float:left;width:5mm;padding-left:1mm;padding-right:1mm;">
								<b>D</b>
							</div>
							<div class="styLNDesc" style="width:179mm;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/ReportableEntityPartnersGrp/ReportableEntityCheckBoxInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/ReportableEntityPartnersGrp/ReportableEntityCheckBoxInd"/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/ReportableEntityPartnersGrp/ReportableEntityCheckBoxInd"/>
										<xsl:with-param name="BackupName" select="Form1065ScheduleM3/ReportableEntityPartnersGrp/ReportableEntityCheckBoxInd"/>
									</xsl:call-template>
								</label>          
         An entity that is a reportable entity partner with respect to the partnership owns or is deemed to own an interest of 50
percent or more in the partnership’s capital, profit, or loss, on any day during the tax year of the partnership.      </div>
						</div>
						<div class="styBB" style="width:187mm;">
							<div class="styGenericDiv" style="width:3.2mm;float:right;" align="right">
								<!-- button display logic -->
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/ReportableEntityPartnersGrp/Item"/>
									<xsl:with-param name="containerHeight" select="2"/>
									<xsl:with-param name="containerID" select=" 'REPtbl' "/>
								</xsl:call-template>
								<!-- end button display logic -->
							</div>
						</div>
						<div class="styTableContainer" id="REPtbl">
							<!-- print logic -->
							<xsl:call-template name="SetInitialState"/>
							<!-- end -->
							<table class="styTable" cellspacing="0">
								<thead class="styTableThead">
									<tr>
										<th class="styTableCellHeader" style="width:98mm;vertical-align:top;font-size:6.5pt;height:4mm" scope="col">
											<span class="styNormalText">Name of Reportable Entity Partner </span>
										</th>
										<th class="styTableCellHeader" style="width:44mm;vertical-align:top;font-size:6.5pt;height:4mm" scope="col">
											<span class="styNormalText">Identifying Number</span>
										</th>
										<th class="styTableCellHeader" style="width:44mm;vertical-align:top;font-size:6.5pt;height:4mm" scope="col">
											<span class="styNormalText">Maximum Percentage<br/>Owned or Deemed Owned</span>
										</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:for-each select="$Form1065ScheduleM3/ReportableEntityPartnersGrp/Item">
										<xsl:if test="($Print != $Separated) or (count($Form1065ScheduleM3/ReportableEntityPartnersGrp/Item) &lt;=2)">
											<tr style="font-size: 7pt;">
												<td class="styTableCellText" style="width:98mm;height:4mm;">
													<span style="width:4px"/>
													<xsl:if test="ReportableEntityPartnerTxt">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ReportableEntityPartnerTxt"/>
														</xsl:call-template>
													</xsl:if>
												</td>
												<td class="styTableCellText" style="width:44mm;text-align:center;">
													<xsl:choose>
														<xsl:when test="ReportableEntityPartnerSSN">
															<xsl:call-template name="PopulateSSN">
																<xsl:with-param name="TargetNode" select="ReportableEntityPartnerSSN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:when test="ReportableEntityParnterEIN">
															<xsl:call-template name="PopulateEIN">
																<xsl:with-param name="TargetNode" select="ReportableEntityParnterEIN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="MissingSSNEINReason"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td class="styTableCellText" style="width:44mm;text-align:center;">
													<span style="width:4px"/>
													<xsl:call-template name="PopulatePercent">
														<xsl:with-param name="TargetNode" select="MaximumDeemedOwnershipPct"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
									<!-- Table Filler Rows -->
									<xsl:if test="count($Form1065ScheduleM3/ReportableEntityPartnersGrp/Item) &lt; 1 or ((count($Form1065ScheduleM3/ReportableEntityPartnersGrp/Item) &gt;2) and ($Print = $Separated))">
										<tr>
											<td class="styTableCellText" style="width:98mm;height:4mm;font-size:7pt;">
												<span style="width:4px"/>
												<xsl:if test="((count($Form1065ScheduleM3/ReportableEntityPartnersGrp/Item) &gt;2) and ($Print = $Separated))">
													<xsl:call-template name="PopulateAdditionalDataTableMessage">
														<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/ReportableEntityPartnersGrp/Item"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellText" style="width:44mm;height:6.5mm;">
												<span style="width:4px"/>
											</td>
											<td class="styTableCellCtr" style="width:44mm;">
												<span style="width:4px"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form1065ScheduleM3/ReportableEntityPartnersGrp/Item) &lt; 2 or ((count($Form1065ScheduleM3/ReportableEntityPartnersGrp/Item) &gt;2) and ($Print = $Separated))">
										<tr>
											<td class="styTableCellText" style="width:98mm;height:6.5mm;">
												<span style="width:4px"/>
											</td>
											<td class="styTableCellText" style="width:44mm;">
												<span style="width:4px"/>
											</td>
											<td class="styTableCellCtr" style="width:44mm;">
												<span style="width:4px"/>
											</td>
										</tr>
									</xsl:if>
								</tbody>
							</table>
						</div>
						<!-- Set Initial Height of Above Table -->
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/ReportableEntityPartnersGrp/Item"/>
							<xsl:with-param name="containerHeight" select="2"/>
							<xsl:with-param name="containerID" select=" 'REPtbl' "/>
						</xsl:call-template>
						<!-- End Set Initial Height of Above Table -->
						<!-- Line E -->
						<div style="width:187mm;">
							<div style="float:left;width:5mm;padding-left:1mm;padding-right:1mm;">
								<b>E</b>
							</div>
							<div class="styLNDesc" style="width:179mm;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/VoluntaryFilerInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/VoluntaryFilerInd"/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/VoluntaryFilerInd"/>
										<xsl:with-param name="BackupName" select="Form1065ScheduleM3/VoluntaryFilerInd"/>
									</xsl:call-template>
								</label>          
         Voluntary Filer. </div>
						</div>
					</div>
					<!-- Part I - Header -->
					<div style="width:187mm;height:3mm;border-style:solid; border-bottom-width:1px;border-top-width:0px;           border-right-width:0px;border-left-width:0px;padding-top:none;padding-bottom:none;float:left;">
						<span class="styPartName" style="height:1mm;width:12mm;font-size:7pt">Part I</span>
						<span style="width:130mm;font-size:7pt" class="styPartDesc">
							<span style="width:3mm;"/>Financial Information and Net Income (Loss) Reconciliation<br/>
						</span>
					</div>
					<!-- Line 1a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">1a</div>
						<div class="styLNDesc" style="width:179mm;">
        Did the partnership file SEC Form 10-K for its income statement period 
        ending with or within this tax year?</div>
					</div>
					<!-- Line 1a - Yes -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="width:7.25mm;;"/>
						<div class="styLNDesc" style="width:179mm;">
							<span style="width:.5mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PartnershipFiledSECForm10KInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PartnershipFiledSECForm10KInd"/>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PartnershipFiledSECForm10KInd"/>
									<xsl:with-param name="BackupName" select="Form1065ScheduleM3/PartnershipFiledSECForm10KInd"/>
								</xsl:call-template>
								<span class="styBoldText" style="padding-left:1mm;">Yes.</span>
							</label>          
          Skip lines 1b and 1c and complete lines 2 through 11 with respect to that SEC Form 10-K.
        </div>
					</div>
					<!-- Line 1a - No -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="width:7.25mm;;"/>
						<div class="styLNDesc" style="width:179mm;">
							<span style="width:.5mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PartnershipFiledSECForm10KInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PartnershipFiledSECForm10KInd"/>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PartnershipFiledSECForm10KInd"/>
									<xsl:with-param name="BackupName" select="Form1065ScheduleM3/PartnershipFiledSECForm10KInd"/>
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
						<div class="styLNDesc" style="width:179mm;">Did the partnership prepare
         a certified audited non-tax-basis income statement for that period?</div>
					</div>
					<!-- Line 1b - Yes -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="width:7.25mm;;"/>
						<div class="styLNDesc" style="width:179mm;">
							<span style="width:.5mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PrtshpPrepCertAudIncmStmtInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PrtshpPrepCertAudIncmStmtInd"/>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PrtshpPrepCertAudIncmStmtInd"/>
									<xsl:with-param name="BackupName" select="Form1065ScheduleM3/PrtshpPrepCertAudIncmStmtInd"/>
								</xsl:call-template>
								<span class="styBoldText" style="padding-left:1mm;">Yes.</span>
							</label>          
          Skip line 1c and complete lines 2 through 11 with respect to that income statement.
        </div>
					</div>
					<!-- Line 1b - No -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
						<div class="styLNDesc" style="width:179mm;">
							<span style="width:.5mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PrtshpPrepCertAudIncmStmtInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PrtshpPrepCertAudIncmStmtInd"/>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PrtshpPrepCertAudIncmStmtInd"/>
									<xsl:with-param name="BackupName" select="Form1065ScheduleM3/PrtshpPrepCertAudIncmStmtInd"/>
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
						<div class="styLNDesc" style="width:179mm;">Did the partnership prepare
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
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PartnershipPrepareIncmStmtInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PartnershipPrepareIncmStmtInd"/>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PartnershipPrepareIncmStmtInd"/>
									<xsl:with-param name="BackupName" select="Form1065ScheduleM3/PartnershipPrepareIncmStmtInd"/>
								</xsl:call-template>
								<span class="styBoldText" style="padding-left:1mm;">Yes.</span>
							</label>          
          Complete lines 2 through 11 with respect to that income statement.
        </div>
					</div>
					<!-- Line 1c - No -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
						<div class="styLNDesc" style="width:179mm;">
							<span style="width:.5mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PartnershipPrepareIncmStmtInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/ PartnershipPrepareIncmStmtInd"/>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PartnershipPrepareIncmStmtInd"/>
									<xsl:with-param name="BackupName" select="Form1065ScheduleM3/PartnershipPrepareIncmStmtInd"/>
								</xsl:call-template>
								<span class="styBoldText" style="padding-left:1mm;">No.</span>
							</label>
          Skip lines 2 through 3b and enter the partnership’s net income (loss) per its books
           and records on line 4a. </div>
					</div>
					<!-- Line 2 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="width:179mm;">Enter the income statement period:
							<span style="width:3mm"/>Beginning<span style="width:3mm"/>
							<span style="width:25mm;border-bottom:solid 1px;text-align:center">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeStatementBeginningDt"/>
								</xsl:call-template>
							</span>
							<span style="width:8mm"/>Ending<span style="width:3mm"/>
							<span style="width:25mm;border-bottom:solid 1px;text-align:center">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeStatementEndingDt"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Line 3a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">3a</div>
						<div class="styLNDesc" style="width:179mm;">Has the partnership’s income statement been restated for the income statement period on line 2?
            <!-- Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PartnershipIncmStmtRestatedInd"/>
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
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PartnershipIncmStmtRestatedInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PartnershipIncmStmtRestatedInd"/>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PartnershipIncmStmtRestatedInd"/>
									<xsl:with-param name="BackupName" select="Form1065ScheduleM3/PartnershipIncmStmtRestatedInd"/>
								</xsl:call-template>
								<span class="styBoldText" style="padding-left:1mm;">Yes.</span>
							</label>          
          (If "Yes," attach a statement and the amount of each item restated.)
        </div>
					</div>
					<!-- Line 3a - No -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
						<div class="styLNDesc" style="width:179mm;">
							<span style="width:.5mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PartnershipIncmStmtRestatedInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PartnershipIncmStmtRestatedInd"/>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PartnershipIncmStmtRestatedInd"/>
									<xsl:with-param name="BackupName" select="Form1065ScheduleM3/PartnershipIncmStmtRestatedInd"/>
								</xsl:call-template>
								<span class="styBoldText" style="padding-left:1mm;">No.</span>
							</label>
						</div>
					</div>
					<!-- Line3b -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">
							<span style="width:1.5mm"/>b</div>
						<div class="styLNDesc" style="width:179mm;">Has the partnership’s income
         statement been restated for any of the five income statement periods immediately preceding
          the period<br/> on line 2?
            <!-- Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PrtshpStmtRestatedPrev5PrdInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3b - Yes -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="width:7.25mm;;"/>
						<div class="styLNDesc" style="width:179mm;">
							<span style="width:.5mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PrtshpStmtRestatedPrev5PrdInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PrtshpStmtRestatedPrev5PrdInd"/>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PrtshpStmtRestatedPrev5PrdInd"/>
									<xsl:with-param name="BackupName" select="Form1065ScheduleM3/PrtshpStmtRestatedPrev5PrdInd"/>
								</xsl:call-template>
								<span class="styBoldText" style="padding-left:1mm;">Yes.</span>
							</label>          
          (If "Yes," attach a statement and the amount of each item restated.)
        </div>
					</div>
					<!-- Line 3b - No -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
						<div class="styLNDesc" style="width:179mm;">
							<span style="width:.5mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PrtshpStmtRestatedPrev5PrdInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PrtshpStmtRestatedPrev5PrdInd"/>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PrtshpStmtRestatedPrev5PrdInd"/>
									<xsl:with-param name="BackupName" select="Form1065ScheduleM3/PrtshpStmtRestatedPrev5PrdInd"/>
								</xsl:call-template>
								<span class="styBoldText" style="padding-left:1mm;">No.</span>
							</label>
						</div>
					</div>
					<!-- Line 4a -->
					<!--<div style="width:187mm;border-style:solid; border-bottom-width:1px;border-top-width:0px;border-right-width:0px;border-left-width:0px;float:left;">
                   </div>-->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:4mm">4a</div>
							<div class="styLNDesc" style="width:130mm;height:4mm">Worldwide consolidated net income (loss) from income statement source identified in Part I, line 1</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox">4a</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/WorldwideCnsldtNetIncmLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 4b -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:4mm">
								<span style="width:1.5mm"/>b</div>
							<div class="styLNDesc" style="width:130mm;height:4mm">Indicate accounting standard used for line 4a (see instructions):</div>
							<div style="float:right;">
								<div class="styLNRightNumBox" style="height:4mm;border-bottom:none"/>
								<div class="styLNAmountBox" style="height:4mm;border-bottom:none"/>
							</div>
						</div>
					</div>
					<!-- Line 4b - 1 GAAP -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
							<span class="styBoldText">1</span>
							<span style="width:4mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/GAAPInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/GAAPInd"/>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/GAAPInd"/>
									<xsl:with-param name="BackupName" select="Form1065ScheduleM3/GAAPInd"/>
								</xsl:call-template>
								<span style="padding-left:3.5mm;">GAAP</span>
							</label>
							<!-- Line 4b - 2 IFRS -->
							<span style="width:13mm;"/>
							<span class="styBoldText">2</span>
							<span style="width:4mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IFRSInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IFRSInd"/>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IFRSInd"/>
									<xsl:with-param name="BackupName" select="Form1065ScheduleM3/IFRSInd"/>
								</xsl:call-template>
								<span style="padding-left:4mm;">IFRS</span>
							</label>
							<!-- Line 4b - 3 704(b) -->
							<span style="width:23.5mm;"/>
							<span class="styBoldText">3</span>
							<span style="width:5mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/StatutoryInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/StatutoryInd"/>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/StatutoryInd"/>
									<xsl:with-param name="BackupName" select="Form1065ScheduleM3/StatutoryInd"/>
								</xsl:call-template>
								<span style="padding-left:4mm;">704(b)</span>
							</label>
						</div>
						<!-- Closes Lline 4b GAAP (float:left)-->
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:4mm;border-bottom:none"/>
							<div class="styLNAmountBox" style="height:4mm;border-bottom:none"/>
						</div>
					</div>
					<!--Closes Line 4b - GAAP-->
					<!-- Line 4b - 4 Tax-basis -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
							<span class="styBoldText">4</span>
							<span style="width:4mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/TaxBasisInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/TaxBasisInd"/>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/TaxBasisInd"/>
									<xsl:with-param name="BackupName" select="Form1065ScheduleM3/TaxBasisInd"/>
								</xsl:call-template>
								<span style="padding-left:3.5mm;">Tax-basis</span>
							</label>
							<!-- Line 4b - 5 Other: (Specify) -->
							<span style="width:7.5mm;"/>
							<span class="styBoldText">5</span>
							<span style="width:4mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/OtherInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/OtherInd"/>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/OtherInd"/>
									<xsl:with-param name="BackupName" select="Form1065ScheduleM3/OtherInd"/>
								</xsl:call-template>
								<span style="padding-left:4mm;">Other: (Specify)
                                       <img src="{$ImagePath}/1065ScheduleM3_Bullet_Title.gif" width="8" height="8" alt="Bullet"/>
									<span style="width:60mm;border-bottom:solid 1px;">
										<span style="width:3mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/OtherInd/@otherDesc"/>
										</xsl:call-template>
									</span>
								</span>
							</label>
						</div>
						<!--Closes Line 4b Tax-basis (float:left)-->
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:4mm;border-bottom:none"/>
							<div class="styLNAmountBox" style="height:4mm;border-bottom:none"/>
						</div>
					</div>
					<!--Closes Line 4b - Tax Basis-->
					<!-- Line 5a -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:4mm">5a</div>
							<div class="styLNDesc" style="width:137mm;height:4mm">
							  Net income from nonincludible foreign entities (attach statement)
                                <!-- Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/NetIncmNonincludibleFrgnEntAmt"/>
								</xsl:call-template>
								<span class="styDotLn" style="float:none;padding-left:3mm">...........</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:4.4mm;">5a</div>
							<div class="styLNAmountBox" style="height:4.4mm;">
								<xsl:call-template name="PopulateNegativeNumber">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/NetIncmNonincludibleFrgnEntAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 5b -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:4mm">
								<span style="width:1.5mm"/>b
                                  </div>
							<div class="styLNDesc" style="width:139mm;height:4mm">
							  Net loss from nonincludible foreign entities (attach statement and enter as a positive amount)
                                <!-- Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/NetLossNonincludibleFrgnEntAmt"/>
								</xsl:call-template>
								<span class="styDotLn" style="float:none;padding-left:1mm">..</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:4.4mm;">5b</div>
							<div class="styLNAmountBox" style="height:4.4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/NetLossNonincludibleFrgnEntAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 6a -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:4mm">6a</div>
							<div class="styLNDesc" style="width:137mm;height:4mm">
							  Net income from nonincludible U.S. entities (attach statement)
							    <!-- Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/NetIncomeNonincludibleUSEntAmt"/>
								</xsl:call-template>
								<span class="styDotLn" style="float:none;padding-left:2.5mm">............</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:4.4mm;">6a</div>
							<div class="styLNAmountBox" style="height:4.4mm;">
								<xsl:call-template name="PopulateNegativeNumber">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/NetIncomeNonincludibleUSEntAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 6b -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:4mm">
								<span style="width:1.5mm"/>b</div>
							<div class="styLNDesc" style="width:137mm;height:4mm">
							  Net loss from nonincludible U.S. entities (attach statement and enter as a positive amount)
							  <!-- Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/NetLossNonincludibleUSEntAmt"/>
								</xsl:call-template>
								<span class="styDotLn" style="float:none;padding-left:4.2mm">..</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:4.4mm;">6b</div>
							<div class="styLNAmountBox" style="height:4.4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/NetLossNonincludibleUSEntAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 7a -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:4mm">7a</div>
							<div class="styLNDesc" style="width:137mm;height:4mm">
							  Net income (loss) of other foreign disregarded entities (attach statement)
							    <!-- Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<!-- check for setformlink elsewhere -->
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/NetLossFrgnDisregardedEntAmt"/>
								</xsl:call-template>
								<span class="styDotLn" style="float:none;">.........</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:4.4mm;">7a</div>
							<div class="styLNAmountBox" style="height:4.4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/NetLossFrgnDisregardedEntAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 7b -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:4mm">
								<span style="width:1.5mm"/>b</div>
							<div class="styLNDesc" style="width:137mm;height:4mm">
							  Net income (loss) of other U.S. disregarded entities (attach statement)
							    <!-- Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/NetLossOtherDisregardedEntAmt"/>
								</xsl:call-template>
								<span class="styDotLn" style="float:none;padding-left:3.5mm">.........</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:4.4mm;">7b</div>
							<div class="styLNAmountBox" style="height:4.4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/NetLossOtherDisregardedEntAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 8 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:4mm;">8</div>
							<div class="styLNDesc" style="width:138mm;height:4mm">
							  Adjustment to eliminations of transactions between includible entities and nonincludible entities 
							  <br/> (attach statement)           
							    <!-- Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/AdjustmentsToEliminateTransAmt"/>
								</xsl:call-template>
								<span class="styDotLn" style="float:none;padding-left:1mm">...........................</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:7.53mm;padding-top:3mm;">8</div>
							<div class="styLNAmountBox" style="height:7.53mm;padding-top:3mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/AdjustmentsToEliminateTransAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 9 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:4mm">9</div>
							<div class="styLNDesc" style="width:137mm;height:4mm">
							  Adjustment to reconcile income statement period to tax year (attach statement)
							    <!-- Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/AdjToRecnclIncmStmtYrToTyAmt"/>
								</xsl:call-template>
								<span class="styDotLn" style="float:none;padding-left:3.3mm">......</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:4.4mm;">9</div>
							<div class="styLNAmountBox" style="height:4.4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/AdjToRecnclIncmStmtYrToTyAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 10 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm">10</div>
							<div class="styLNDesc" style="width:137mm;height:4mm">
							  Other adjustments to reconcile to amount on line 11 (attach statement)
							    <!-- Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/OtherAdjustmentsToReconcileAmt"/>
								</xsl:call-template>
								<span class="styDotLn" style="float:none;padding-left:2.5mm">.........</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:4.4mm;">10</div>
							<div class="styLNAmountBox" style="height:4.4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/OtherAdjustmentsToReconcileAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 11 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="height:3mm">11</div>
							<div class="styLNDesc" style="width:137mm;height:3mm">
								<span class="styBoldText">Net income (loss) per income statement of the partnership.
								</span> 
								Combine lines 4a through 10<span class="styDotLn" style="float:none;padding-left:3.5mm">....</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:4mm;">11</div>
							<div class="styLNAmountBox" style="height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/NetIncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:2mm"/>
							<div class="styLNDesc" style="width:147mm;height:2mm">
								<span class="styBoldText" style="height:2mm">Note. </span>
								<span style="width:1mm"/>
								<span style="height:2mm">Part I, line 11, must equal Part II, line 26, column (a) or Schedule M-1, line 1 (see instructions).</span>
							</div>
						</div>
					</div>
					<!-- Line 12 -->
					<!--<div class="styBB" style="height:10mm;border-bottom-width:1px">-->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm">12</div>
							<div class="styLNDesc" style="width:179mm;font-size:6.374pt">
                            Enter the total amount (not just the partnership's share) of the assets and liabilities of all entities included or removed on the following lines:</div>
						</div>
					</div>
					<!--<div style="width:187mm;">
                           <div style="float:left;clear:none;">
                                  <div class="styLNLeftNumBoxSD">4a</div>
                                  <div class="styLNDesc" style="width:130mm;">Worldwide consolidated net income (loss) from income statement source identified in Part I, line 1</div>
                           </div>
                           <div style="float:right;">
                                  <div class="styLNRightNumBox">4a</div>
                                  <div class="styLNAmountBox">
                                         <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/WorldwideCnsldtNetIncomeLoss"/>
                                         </xsl:call-template>
                                  </div>
                           </div>
                   </div>-->
					<!-- Line 12 - Total Assets       Total Liabilities -->
					<div style="width:187mm;">
						<div style="float:right;width:140mm">
							<div class="styLNAmountBox" style="padding-top:none;padding-bottom:none;width:42mm;border-top:solid black 1px;">
								<span style="padding-right:15mm;font-size:6pt;">Total Assets</span>
							</div>
							<div class="styLNAmountBox" style="padding-top:none;padding-bottom:none;width:42mm;border-top:solid black 1px;                                                                                           border-right:solid black 1 px">
								<span style="padding-right:12mm;font-size:6pt;">Total Liabilities</span>
							</div>
						</div>
					</div>
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">
								<span style="width:1.5mm;font-size:6pt"/>a
                                  </div>
							<div class="styLNDesc" style="width:35mm;font-size:6pt">Included on Part I, line 4
                                         </div>
						</div>
						<div style="float:right;width:140mm">
							<div class="styLNAmountBox" style="width:42mm;border-top:solid black 0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/WorldwideCnsldtTotAstIncldAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:42mm;border-top:solid black 0px;border-right:solid black 1px">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/WorldwideCnsldtTotLiabIncldAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">
								<span style="width:1.5mm;font-size:6pt"/>b
                                  </div>
							<div class="styLNDesc" style="width:35mm;font-size:6pt">Removed on Part I, line 5
                                  </div>
						</div>
						<div style="float:right;width:140mm">
							<div class="styLNAmountBox" style="width:42mm;border-top:solid black 0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/NnincldblFrgnEntTotAstRmvdAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:42mm;border-top:solid black 0px;border-right:solid black 1px">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/NnincldblFrgnEntTotLiabRmvdAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">
								<span style="width:1.5mm;font-size:6pt"/>c
                                  </div>
							<div class="styLNDesc" style="width:35mm;font-size:6pt">Removed on Part I, line 6
                                  </div>
						</div>
						<div style="float:right;width:140mm">
							<div class="styLNAmountBox" style="width:42mm;border-top:solid black 0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/TotalAssetsRemovedAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:42mm;border-top:solid black 0px;border-right:solid black 1px">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/TotalLiabilitiesRemovedAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">
								<span style="width:1.5mm;font-size:6pt"/>d
                                   </div>
							<div class="styLNDesc" style="width:35mm;font-size:6pt">Included on Part I, line 7
                                   </div>
						</div>
						<div style="float:right;width:140mm">
							<div class="styLNAmountBox" style="padding-top:none;padding-bottom:none;height:2mm;width:42mm;border-top:solid black 0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/TotalIncludedAssetAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="padding-top:none;padding-bottom:none;height:2mm;width:42mm;                                                                                           border-top:solid black 0px;border-right:solid black 1px">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/TotalIncludedLiabilityAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Page 1 Footer -->
					<div class="pageEnd" style="width:187mm;">
						<div class="styBoldText" style="width:115mm;float:left;font-size:6pt;height:3mm">For Paperwork Reduction Act Notice, see the Instructions for your return.
                        </div>
						<div style="float:left;font-size:6pt">Cat. No. 39669D</div>
						<div class="styBoldText" style="float:right;font-size:6pt;height:3mm">Schedule M-3 (Form 1065) 2014</div>
					</div>
					<!-- Page 2 -->
					<!-- Page 2 Header -->
					<div class="styBB" style="width:187mm;">
						<div style="float:left;">Schedule M-3 (Form 1065) 2014</div>
						<div style="float:right;">Page <span style="font-size:9pt;font-weight:bold;">2</span>
						</div>
					</div>
					<!-- Name and EIN Line -->
					<div class="styBB" style="width:187mm;">
						<!-- Name -->
						<div style="width:138mm;height:8mm;border-right:solid 1px;float:left;clear:none;">
          Name of partnership<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/PartnershipName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/PartnershipName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</div>
						<!-- Employer Identification Number -->
						<div style="width:47mm;float:right;clear:none;padding-left:1mm;">
							<span class="styBoldText">Employer identification number</span>
							<br/>
							<br/>
							<xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/PartnershipEIN"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2 - Header -->
					<div style="width:187mm;height:8mm;border-style:solid; border-bottom-width:1px;border-top-width:1px; border-right-width:0px;border-left-width:0px;padding-top:0;float:left;">
						<span class="styPartName" style="height:1mm;width:14mm;padding: .25mm 1mm .25mm 1mm;">Part II</span>
						<span class="styPartDesc" style="width:170mm;">
							<span style="width:2mm;"/>Reconciliation of Net Income (Loss) per Income Statement of Partnership With Income (Loss)<br/>
							<span style="width:2mm;"/> per Return
           <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems"/>
							</xsl:call-template>
						</span>
					</div>
					<!-- Part II Table -->
					<table class="styTable" id="IRS1065ScheduleM3PartIITable" summary="Reconciliation of Net Income (Loss) per Income Statement of Includible entities With Taxable Income per Return " cellspacing="0" cellpadding="0" style="font-size:7pt;width:187mm;">
						<tr>
							<th class="styTableThead" style="width:6mm" scope="col"/>
							<th class="styTableThead" style="width:81mm;text-align:center;font-size:8pt;" scope="col">
                           Income (Loss) Items
                                   <br/>
								<br/>
								<span style="font-size:7pt;font-weight:normal;float:left">(Attach statements for lines 1 through 10)
                                   </span>
							</th>
							<th class="styIRS1065ScheduleM3TheadCell" scope="col">
								<span class="styBoldText">
                           (a)</span>
								<br/> Income (Loss) per<br/> Income Statement <br/>
							</th>
							<th class="styIRS1065ScheduleM3TheadCell" scope="col">
								<span class="styBoldText">
                           (b)</span>
								<br/> Temporary<br/> Difference</th>
							<th class="styIRS1065ScheduleM3TheadCell" scope="col">
								<span class="styBoldText">
                           (c)</span>
								<br/> Permanent<br/> Difference</th>
							<th class="styIRS1065ScheduleM3TheadCell" scope="col">
								<span class="styBoldText">
                           (d)</span>
								<br/> Income (Loss) per<br/> Tax Return <br/>
							</th>
						</tr>
						<!-- Part II - Line 1 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">
								<span style="width:1.5mm;"/>1
                             </td>
							<td>
                            Income (loss) from equity method foreign corporations
            <!-- Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/IncomeLossEquityMethodFrgnCorp"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/IncomeLossEquityMethodFrgnCorp/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/IncomeLossEquityMethodFrgnCorp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/IncomeLossEquityMethodFrgnCorp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3ShadedCell">
								<span style="width:1mm"/>
							</td>
						</tr>
						<!-- Part II - Line 2 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">
								<span style="width:1.5mm;"/>2</td>
							<td>Gross foreign dividends not previously taxed
            <!-- Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/GrossFrgnDividendsNotPrevTaxed"/>
								</xsl:call-template>
								<span class="styDotLn" style="float:none;padding-left:3mm;">...</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/GrossFrgnDividendsNotPrevTaxed/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/GrossFrgnDividendsNotPrevTaxed/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/GrossFrgnDividendsNotPrevTaxed/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/GrossFrgnDividendsNotPrevTaxed/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 3 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">
								<span style="width:1.5mm;"/>3</td>
							<td>Subpart F, QEF, and similar income inclusions
            <!-- Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/SubpartFQEFSimilarIncmInclsn"/>
								</xsl:call-template>
								<span class="styDotLn" style="float:none;padding-left:1mm;">...</span>
							</td>
							<td class="styIRS1065ScheduleM3ShadedCell" style="border-bottom-width:1px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/SubpartFQEFSimilarIncmInclsn/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/SubpartFQEFSimilarIncmInclsn/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/SubpartFQEFSimilarIncmInclsn/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 4 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">
								<span style="width:1.5mm;"/>4</td>
							<td>Gross foreign distributions previously taxed
            <!-- Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/GrossForeignDistriPrevTaxed"/>
								</xsl:call-template>
								<span class="styDotLn" style="float:none;padding-left:4mm;">...</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/GrossForeignDistriPrevTaxed/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/GrossForeignDistriPrevTaxed/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/GrossForeignDistriPrevTaxed/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3ShadedCell" style="border-bottom-width:0px;">
								<span style="width:1mm"/>
							</td>
						</tr>
						<!-- Part II - Line 5 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">
								<span style="width:1.5mm;"/>5</td>
							<td>Income (loss) from equity method U.S. corporations
            <!-- Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/IncomeLossEquityMethodUSCorp"/>
								</xsl:call-template>
								<span class="styDotLn" style="float:none;padding-left:1.3mm;">.</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/IncomeLossEquityMethodUSCorp/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/IncomeLossEquityMethodUSCorp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/IncomeLossEquityMethodUSCorp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3ShadedCell">
								<span style="width:1mm"/>
							</td>
						</tr>
						<!-- Part II - Line 6 -->
						<tr>
						  <td class="styIRS1065ScheduleM3NumberCell">
							<span style="width:1.5mm;"/>6</td>
						  <td>U.S. dividends            <!-- Form Link -->
							<xsl:call-template name="SetFormLinkInline">
							  <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/USDividendsGrp"/>
							</xsl:call-template>
							<span class="styDotLn" style="float:none;padding-left:3.3mm;">.............</span>
						  </td>
						  <td class="styIRS1065ScheduleM3Cell">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/USDividendsGrp/IncomeLossPerIncomeStmtAmt"/>
							</xsl:call-template>
						  </td>
						  <td class="styIRS1065ScheduleM3Cell">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/USDividendsGrp/TemporaryDifferenceAmt"/>
							</xsl:call-template>
						  </td>
						  <td class="styIRS1065ScheduleM3Cell">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/USDividendsGrp/PermanentDifferenceAmt"/>
							</xsl:call-template>
						  </td>
						  <td class="styIRS1065ScheduleM3Cell">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/USDividendsGrp/IncomeLossPerTaxReturnAmt"/>
							</xsl:call-template>
						  </td>
						</tr>
						<!-- Part II - Line 7 -->
						<tr>
						  <td class="styIRS1065ScheduleM3NumberCell">
							<span style="width:1.5mm;"/>7</td>
						  <td>Income (loss) from U.S. partnerships
                            <!-- Form Link -->
							<xsl:call-template name="SetFormLinkInline">
							  <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/IncomeLossUSPartnerships"/>
							</xsl:call-template>
							<span class="styDotLn" style="float:none;padding-left:1mm;">......</span>
						  </td>
						  <td class="styIRS1065ScheduleM3Cell">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/IncomeLossUSPartnerships/IncomeLossPerIncomeStmtAmt"/>
							</xsl:call-template>
						  </td>
						  <td class="styIRS1065ScheduleM3Cell">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/IncomeLossUSPartnerships/TemporaryDifferenceAmt"/>
							</xsl:call-template>
						  </td>
						  <td class="styIRS1065ScheduleM3Cell">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/IncomeLossUSPartnerships/PermanentDifferenceAmt"/>
							</xsl:call-template>
						  </td>
						  <td class="styIRS1065ScheduleM3Cell">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/IncomeLossUSPartnerships/IncomeLossPerTaxReturnAmt"/>
							</xsl:call-template>
						  </td>
						</tr>
						<!-- Part II - Line 8 -->
						<tr>
						  <td class="styIRS1065ScheduleM3NumberCell">
							<span style="width:1.5mm;"/>8</td>
						  <td>Income (loss) from foreign partnerships
                            <!-- Form Link -->
							<xsl:call-template name="SetFormLinkInline">
							  <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/IncomeLossForeignPartnerships"/>
							</xsl:call-template>
							<span class="styDotLn" style="float:none;padding-left:1.5mm;">.....</span>
						  </td>
						  <td class="styIRS1065ScheduleM3Cell">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/IncomeLossForeignPartnerships/IncomeLossPerIncomeStmtAmt"/>
							</xsl:call-template>
						  </td>
						  <td class="styIRS1065ScheduleM3Cell">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/IncomeLossForeignPartnerships/TemporaryDifferenceAmt"/>
							</xsl:call-template>
						  </td>
						  <td class="styIRS1065ScheduleM3Cell">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/IncomeLossForeignPartnerships/PermanentDifferenceAmt"/>
							</xsl:call-template>
						  </td>
						  <td class="styIRS1065ScheduleM3Cell">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/IncomeLossForeignPartnerships/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 9 -->
						<tr>
						  <td class="styIRS1065ScheduleM3NumberCell">
							<span style="width:1.5mm;"/>9</td>
						  <td>Income (loss) from other pass-through entities<xsl:call-template name="SetFormLinkInline">
							  <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/IncomeLossPassThroughEntities"/>
							</xsl:call-template>
							<span class="styDotLn" style="float:none;padding-left:.5mm;">...</span>
						  </td>
						  <td class="styIRS1065ScheduleM3Cell">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/IncomeLossPassThroughEntities/IncomeLossPerIncomeStmtAmt"/>
							</xsl:call-template>
						  </td>
						  <td class="styIRS1065ScheduleM3Cell">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/IncomeLossPassThroughEntities/TemporaryDifferenceAmt"/>
							</xsl:call-template>
						  </td>
						  <td class="styIRS1065ScheduleM3Cell">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/IncomeLossPassThroughEntities/PermanentDifferenceAmt"/>
							</xsl:call-template>
						  </td>
						  <td class="styIRS1065ScheduleM3Cell">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/IncomeLossPassThroughEntities/IncomeLossPerTaxReturnAmt"/>
							</xsl:call-template>
				          </td>
						</tr>
						<!-- Part II - Line 10 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">10</td>
							<td>Items relating to reportable transactions
            <!-- Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/ItemsRelatedReportableTransGrp"/>
								</xsl:call-template>
									<span class="styDotLn" style="float:none;padding-left:.1mm;">.....</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/ItemsRelatedReportableTransGrp/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/ItemsRelatedReportableTransGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/ItemsRelatedReportableTransGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/ItemsRelatedReportableTransGrp/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 11 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">11</td>
							<td>Interest income (see instructions)  
                                 <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/InterestIncomeForm8916AGrp"/>
								</xsl:call-template>
								<span class="styDotLn" style="float:none;padding-left:.2mm;">.......</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/InterestIncomeForm8916AGrp/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/InterestIncomeForm8916AGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/InterestIncomeForm8916AGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/InterestIncomeForm8916AGrp/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 12 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">12</td>
							<td>Total accrual to cash adjustment<span class="styDotLn" style="float:none;padding-left:2.5mm;">........</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/TotalAccrualCashAdjustmentGrp/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/TotalAccrualCashAdjustmentGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/TotalAccrualCashAdjustmentGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/TotalAccrualCashAdjustmentGrp/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 13 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">13</td>
							<td>Hedging transactions<span class="styDotLn" style="float:none;                   padding-left:1.8mm;">............</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/HedgingTransactions/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/HedgingTransactions/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/HedgingTransactions/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/HedgingTransactions/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 14 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">14</td>
							<td>Mark-to-market income (loss)<span class="styDotLn" style="float:none;                   padding-left:2mm;">.........</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/     IRS1065SSchM3IncomeLossItems/MarkToMarketIncomeLoss/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/MarkToMarketIncomeLoss/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/MarkToMarketIncomeLoss/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/MarkToMarketIncomeLoss/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 15 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">15</td>
							<td>Cost of goods sold (see instructions)
                      <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/CostOfGoodsSoldNNGrp"/>
								</xsl:call-template>
								<span class="styDotLn" style="float:none;padding-left:.7mm;">......</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<span>(</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/CostOfGoodsSoldNNGrp/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
								<span>)</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/CostOfGoodsSoldNNGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/CostOfGoodsSoldNNGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<span>(</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/CostOfGoodsSoldNNGrp/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
								<span>)</span>
							</td>
						</tr>
						<!-- Part II - Line 16 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">16</td>
							<td>Sale versus lease (for sellers and/or lessors)
							   <span class="styDotLn" style="float:none;padding-left:1.5mm;">....</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/SalesVersusLease/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/SalesVersusLease/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/SalesVersusLease/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/SalesVersusLease/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 17 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">17</td>
							<td>Section 481(a) adjustments<span class="styDotLn" style="float:none;                   padding-left:.8mm;">..........</span>
							</td>
							<td class="styIRS1065ScheduleM3ShadedCell">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/Section481aAdjustments/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/Section481aAdjustments/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/Section481aAdjustments/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 18 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">18</td>
							<td>Unearned/deferred revenue<span class="styDotLn" style="float:none;                   padding-left:2mm;">..........</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/UnearnedDeferredRevenueGrp/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/UnearnedDeferredRevenueGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/UnearnedDeferredRevenueGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/UnearnedDeferredRevenueGrp/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 19 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">19</td>
							<td>Income recognition from long-term contracts<span class="styDotLn" style="float:none;padding-left:2.3mm;">....</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/IncomeRecognitionLTContracts/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/IncomeRecognitionLTContracts/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/IncomeRecognitionLTContracts/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/IncomeRecognitionLTContracts/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 20 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">20</td>
							<td>Original issue discount and other imputed interest<span class="styDotLn" style="float:none;padding-left:3.5mm;">..</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/OrigIssueDiscountOthImputedInt/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/OrigIssueDiscountOthImputedInt/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/OrigIssueDiscountOthImputedInt/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/OrigIssueDiscountOthImputedInt/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 21a -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell" align="left">21a</td>
							<td style="padding-top:.5mm;">Income statement gain/loss on sale, exchange,<br/>
                      abandonment, worthlessness, or other disposition of<br/>
                      assets other than inventory and pass-through entities
                          <span class="styDotLn" style="float:none;padding-left:1.5mm;">.</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/IncmStmtGainLossAstNotInvntry/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/IncmStmtGainLossAstNotInvntry/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/IncmStmtGainLossAstNotInvntry/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3ShadedCell" style="border-bottom-width:1px;">
								<span style="width:1mm"/>
							</td>
						</tr>
						<!-- Part II - Line 21b -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">
								<span style="width:1.5mm;padding-left:3.5mm;"/>b</td>
							<td style="padding-top:.5mm;">Gross capital gains from Schedule D, excluding
                              amounts from pass-through entities
                          <span class="styDotLn" style="float:none;padding-left:2mm;">..........</span>
							</td>
							<td class="styIRS1065ScheduleM3ShadedCell" style="border-bottom-width:0px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/GrossCapitalGainsFromSchD/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/GrossCapitalGainsFromSchD/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/GrossCapitalGainsFromSchD/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 21c -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">
								<span style="width:1.5mm;padding-left:3.5mm;"/>c</td>
							<td style="padding-top:.5mm;">Gross capital losses from Schedule D, excluding
              amounts from pass-through entities, abandonment
              losses, and worthless stock losses
            <span class="styDotLn" style="float:none;padding-left:3mm;">...........</span>
							</td>
							<td class="styIRS1065ScheduleM3ShadedCell" style="border-bottom-width:0px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/GrossCapitalLossesFromSchD/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/GrossCapitalLossesFromSchD/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/GrossCapitalLossesFromSchD/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 21d -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">
								<span style="width:1.5mm;padding-left:3.5mm;"/>d</td>
							<td style="padding-top:.5mm;">Net gain/loss reported on Form 4797, line 17,
excluding amounts from pass-through entities,
abandonment losses, and worthless stock losses
            <span class="styDotLn" style="float:none;padding-left:1.2mm;">..........</span>
							</td>
							<td class="styIRS1065ScheduleM3ShadedCell" style="border-bottom-width:0px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/GainLossReportedOnForm4797/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/GainLossReportedOnForm4797/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/GainLossReportedOnForm4797/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 21e -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">
								<span style="width:1.5mm;padding-left:3.5mm;"/>e</td>
							<td style="padding-top:.5mm;">Abandonment losses
          <span class="styDotLn" style="float:none;padding-left:1.5mm;">............</span>
							</td>
							<td class="styIRS1065ScheduleM3ShadedCell" style="border-bottom-width:0px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/AbandonmentLosses/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/AbandonmentLosses/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/AbandonmentLosses/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 21f -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">
								<span style="width:1.5mm;padding-left:3.5mm;"/>f</td>
							<td>Worthless stock losses (attach statement)
<!-- Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/WorthlessStockLosses"/>
								</xsl:call-template>
								<span class="styDotLn" style="float:none;padding-left:1.5mm;">....</span>
							</td>
							<td class="styIRS1065ScheduleM3ShadedCell" style="border-bottom-width:0px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/WorthlessStockLosses/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/WorthlessStockLosses/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/WorthlessStockLosses/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 21g -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">
								<span style="width:1.5mm;padding-left:3.5mm;"/>g</td>
							<td style="padding-top:.5mm;">Other gain/loss on disposition of assets other than inventory
          <span class="styDotLn" style="float:none;padding-left:3mm;"/>
							</td>
							<td class="styIRS1065ScheduleM3ShadedCell" style="border-bottom-width:1px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/OthGainLossAssetsNotInventory/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/OthGainLossAssetsNotInventory/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/OthGainLossAssetsNotInventory/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 22 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">22</td>
							<td style="padding-top:.5mm;">Other income (loss) items with differences (attach statement)
<!-- Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/OthIncmLossItemsDifferences"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/OthIncmLossItemsDifferences/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/OthIncmLossItemsDifferences/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/OthIncmLossItemsDifferences/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/OthIncmLossItemsDifferences/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 23 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">23</td>
							<td>
								<span class="styBoldText" style="font-weight:bold">Total income (loss) items. </span>
								<span style="font-weight:normal">Combine lines 1 through
             22</span>
								<span class="styDotLn" style="float:none;padding-left:2mm;">.</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/TotalIncomeLossItems/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/TotalIncomeLossItems/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/TotalIncomeLossItems/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/TotalIncomeLossItems/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 24 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">24</td>
							<td>
								<span class="styBoldText" style="font-weight:bold">Total expense/deduction items. </span>
								<span style="font-weight:normal"> (from Part III,</span>
								<br/>
								<span style="font-weight:normal"> line 31) (see instructions)</span>
								<span class="styDotLn" style="float:none;padding-left:3.8mm;">..........</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<span>(</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/TotalExpenseDeductionItems/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
								<span>)</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/TotalExpenseDeductionItems/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/TotalExpenseDeductionItems/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<span>(</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/TotalExpenseDeductionItems/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
								<span>)</span>
							</td>
						</tr>
						<!-- Part II - Line 25 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">25</td>
							<td style="padding-top:.5mm;">Other items with no differences
                           <span class="styDotLn" style="float:none;padding-left:.3mm;">.........</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/OtherItemsNoDifferences/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3ShadedCell" style="border-bottom-width:1px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1065ScheduleM3ShadedCell" style="border-bottom-width:1px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/OtherItemsNoDifferences/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part II - Line 26 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">26</td>
							<td>
								<span class="styBoldText" style="font-weight:bold">Reconciliation totals. </span>
								<span style="font-weight:normal">Combine lines 23 through 25</span>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/ReconciliationTotals"/>
								</xsl:call-template>
								<span class="styDotLn" style="float:none;padding-left:2.7mm;">.</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/ReconciliationTotals/IncomeLossPerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/ReconciliationTotals/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/ReconciliationTotals/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SSchM3IncomeLossItems/ReconciliationTotals/IncomeLossPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<div style="width:187mm;height:4mm;"/>
					<div style="width:165mm;margin-left:7mm;">
						<span class="styBoldText">Note.</span> 
         Line 26, column (a), must equal Part I, line 11, and column (d) must equal Form 1065,
Analysis of Net <br/>Income (Loss), line 1.</div>
					<div class="styBB" style="width:187mm;"/>
					<div class="pageEnd" style="width:187mm;">
						<div class="styBoldText" style="float:right;padding-top:1mm;">Schedule M-3 (Form 1065) 2014</div>
					</div>
					<!-- Page 3 -->
					<!-- Page 3 Header -->
					<div class="styBB" style="width:187mm;">
						<div style="float:left;">Schedule M-3 (Form 1065) 2014</div>
						<div style="float:right;">Page <span style="font-size:9pt;font-weight:bold;">3</span>
						</div>
					</div>
					<!-- Name and EIN Line -->
					<div class="styBB" style="width:187mm;">
						<!-- Name -->
						<div style="width:138mm;height:8mm;border-right:solid 1px;float:left;clear:none;">
          Name of partnership<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/PartnershipName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/PartnershipName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</div>
						<!-- Employer Identification Number -->
						<div style="width:47mm;float:right;clear:none;">
							<span class="styBoldText">Employer identification number</span>
							<br/>
							<br/>
							<xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/PartnershipEIN"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3 - Header -->
					<div style="width:187mm;height:8mm;border-style:solid; border-bottom-width:1px;                         border-top-width:1px; border-right-width:0px;border-left-width:0px;                         padding-top:0;float:left;">
						<span class="styPartName" style="height:1mm;width:14mm;padding: .25mm .5mm                       .25mm .5mm;">Part III</span>
						<span class="styPartDesc" style="width:170mm;">
Reconciliation of Net Income (Loss) per Income Statement of Partnership With Income (Loss) per
Return—Expense/Deduction Items
        </span>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems"/>
						</xsl:call-template>
					</div>
					<!-- Part III Table -->
					<table class="styTable" id="IRS1065ScheduleM3PartIII" summary="Reconciliation of Net Income (Loss) per Income Statement of Includible entities With Taxable Income per Return—Expense/Deduction Items " cellspacing="0" cellpadding="0" style="font-size:7pt;width:187mm;">
						<tr>
							<th class="styTableThead" style="width:6mm" scope="col"/>
							<th class="styTableThead" style="width:81mm;text-align:center;font-size:8pt;" scope="col">Expense/Deduction Items</th>
							<th class="styIRS1065ScheduleM3TheadCell" scope="col">
								<span class="styBoldText">(a)</span>
								<br/> Expense per<br/> Income Statement <br/>
							</th>
							<th class="styIRS1065ScheduleM3TheadCell" scope="col">
								<span class="styBoldText">(b)</span>
								<br/> Temporary<br/> Difference</th>
							<th class="styIRS1065ScheduleM3TheadCell" scope="col">
								<span class="styBoldText">(c)</span>
								<br/> Permanent<br/> Difference</th>
							<th class="styIRS1065ScheduleM3TheadCell" scope="col">
								<span class="styBoldText">(d)</span>
								<br/> Deduction per<br/> Tax Return <br/>
							</th>
						</tr>
						<!-- Part III - Line 1 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">
								<span style="width:1.5mm;"/>1</td>
							<td>State and local current income tax expense
							   <span class="styDotLn" style="float:none;padding-left:4mm;">....</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/StateLocalCurrIncomeTaxExpense/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/StateLocalCurrIncomeTaxExpense/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/StateLocalCurrIncomeTaxExpense/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/StateLocalCurrIncomeTaxExpense/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 2 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">
								<span style="width:1.5mm;"/>2</td>
							<td>State and local deferred income tax expense
							   <span class="styDotLn" style="float:none;padding-left:2.7mm;">....</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/StateLocalDefrdIncmTaxExpense/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/StateLocalDefrdIncmTaxExpense/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/StateLocalDefrdIncmTaxExpense/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/StateLocalDefrdIncmTaxExpense/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 3 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">
								<span style="width:1.5mm;"/>3</td>
							<td style="padding-top:.5mm;">Foreign current income tax expense (other than foreign withholding taxes)
                               <span class="styDotLn" style="float:none;padding-left:1.5mm;">.............</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/ForeignCurrentIncomeTaxExpense/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/ForeignCurrentIncomeTaxExpense/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/ForeignCurrentIncomeTaxExpense/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/ForeignCurrentIncomeTaxExpense/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 4 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">
								<span style="width:1.5mm;"/>4</td>
							<td>Foreign deferred income tax expense
							   <span class="styDotLn" style="float:none;padding-left:.8mm;">.......</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/ForeignDeferredIncmTxExpnsTyp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/ForeignDeferredIncmTxExpnsTyp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/ForeignDeferredIncmTxExpnsTyp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/ForeignDeferredIncmTxExpnsTyp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 5 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">
								<span style="width:1.5mm;"/>5</td>
							<td>Equity-based compensation
							   <span class="styDotLn" style="float:none;padding-left:.5mm;">..........</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/EquityBasedCompensationGrp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/EquityBasedCompensationGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/EquityBasedCompensationGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/EquityBasedCompensationGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 6 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">
								<span style="width:1.5mm;"/>6</td>
							<td>Meals and entertainment
							   <span class="styDotLn" style="float:none;padding-left:.7mm;">...........</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/MealsAndEntertainmentGrp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/MealsAndEntertainmentGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/MealsAndEntertainmentGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/MealsAndEntertainmentGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 7 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">
								<span style="width:1.5mm;"/>7</td>
							<td>Fines and penalties
							   <span class="styDotLn" style="float:none;padding-left:4mm;">............</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/FinesAndPenalties/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/FinesAndPenalties/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/FinesAndPenalties/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/FinesAndPenalties/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 8 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">
								<span style="width:1.5mm;"/>8</td>
							<td>Judgments, damages, awards, and similar costs
							   <span class="styDotLn" style="float:none;padding-left:2.5mm;">...</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/JudgmentsDamagesAwardsSmlrCost/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/JudgmentsDamagesAwardsSmlrCost/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/JudgmentsDamagesAwardsSmlrCost/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/JudgmentsDamagesAwardsSmlrCost/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 9 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">
								<span style="width:1.5mm;"/>9</td>
							<td>Guaranteed payments
							   <span class="styDotLn" style="float:none;padding-left:4.4mm;">...........</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/GuaranteedPaymentsTyp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/GuaranteedPaymentsTyp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/GuaranteedPaymentsTyp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/GuaranteedPaymentsTyp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 10 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">10</td>
							<td>Pension and profit-sharing
							   <span class="styDotLn" style="float:none;padding-left:2.8mm;">..........</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/PensionAndProfitSharing/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/PensionAndProfitSharing/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/PensionAndProfitSharing/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/PensionAndProfitSharing/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 11 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">11</td>
							<td>Other post-retirement benefits
							   <span class="styDotLn" style="float:none;padding-left:1mm;">.........</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/OtherPostRetirementBenefits/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/OtherPostRetirementBenefits/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/OtherPostRetirementBenefits/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/OtherPostRetirementBenefits/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 12 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">12</td>
							<td>Deferred compensation
							   <span class="styDotLn" style="float:none;padding-left:3.2mm;">...........</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/DeferredCompensation/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/DeferredCompensation/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/DeferredCompensation/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/DeferredCompensation/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 13 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">13</td>
							<td>Charitable contribution of cash and tangible property
							   <span class="styDotLn" style="float:none;padding-left:4mm;">.</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/CharitbleContriCashTngblProp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/CharitbleContriCashTngblProp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/CharitbleContriCashTngblProp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/CharitbleContriCashTngblProp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 14 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">14</td>
							<td>Charitable contribution of intangible property
							   <span class="styDotLn" style="float:none;padding-left:2.4mm;">....</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/CharitableContriIntangibleProp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/CharitableContriIntangibleProp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/CharitableContriIntangibleProp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/CharitableContriIntangibleProp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 15 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">15</td>
							<td style="padding-top:.5mm;">Organizational expenses as per Regulations section<br/>1.709-2(a)
                               <span class="styDotLn" style="float:none;padding-left:3mm;">...............</span>
                            </td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/OrganizationalExpenses/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/OrganizationalExpenses/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/OrganizationalExpenses/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/OrganizationalExpenses/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 16 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">16</td>
							<td style="padding-top:.5mm;">Syndication expenses as per Regulations section<br/>1.709-2(b)
                               <span class="styDotLn" style="float:none;padding-left:2.9mm;">...............</span>
                            </td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/SyndicationExpensesTyp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/SyndicationExpensesTyp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/SyndicationExpensesTyp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/SyndicationExpensesTyp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 17 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">17</td>
							<td style="padding-top:.5mm;">Current year acquisition/reorganization
                           investment<br/>banking fees
                               <span class="styDotLn" style="float:none;padding-left:1.2mm;">...............</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/CYAcquisReorgInvstBankingFees/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/CYAcquisReorgInvstBankingFees/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/CYAcquisReorgInvstBankingFees/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/CYAcquisReorgInvstBankingFees/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 18 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">18</td>
							<td style="padding-top:.5mm;">Current year acquisition/reorganization legal and
                          accounting fees<span class="styDotLn" style="float:none;padding-left:1.8mm;">..............</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/CYAcquisReorgLegalAcctFees/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/CYAcquisReorgLegalAcctFees/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/CYAcquisReorgLegalAcctFees/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/CYAcquisReorgLegalAcctFees/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 19 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">19</td>
							<td>Amortization/impairment of goodwill
							   <span class="styDotLn" style="float:none;padding-left:2.5mm;">.......</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/AmortizationImpairmentGoodwill/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/AmortizationImpairmentGoodwill/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/AmortizationImpairmentGoodwill/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/AmortizationImpairmentGoodwill/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 20 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">20</td>
							<td style="padding-top:.5mm;">Amortization of acquisition, reorganization, and
                           start-up costs<span class="styDotLn" style="float:none;padding-left:3.5mm;">.................</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/AmortzAcquisReorgStartupCosts/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/AmortzAcquisReorgStartupCosts/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/AmortzAcquisReorgStartupCosts/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/AmortzAcquisReorgStartupCosts/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 21 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">21</td>
							<td>Other amortization or impairment write-offs
							   <span class="styDotLn" style="float:none;padding-left:.5mm;">.....</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/OtherAmortzImpairmentWriteOffs/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/OtherAmortzImpairmentWriteOffs/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/OtherAmortzImpairmentWriteOffs/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/OtherAmortzImpairmentWriteOffs/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 22 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">22</td>
							<td>Reserved
							   <span class="styDotLn" style="float:none;padding-left:1mm;">................</span>
							</td>
							<td class="styIRS1065ScheduleM3ShadedCell" style="border-bottom-width:1px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1065ScheduleM3ShadedCell" style="border-bottom-width:1px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1065ScheduleM3ShadedCell" style="border-bottom-width:1px;">
								<span style="width:1mm"/>
							</td>
							<td class="styIRS1065ScheduleM3ShadedCell" style="border-bottom-width:1px;">
								<span style="width:1mm"/>
							</td>
						</tr>
						<!-- Part III - Line 23a -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell" align="left">23a</td>
							<td>Depletion—Oil &amp; Gas
							   <span class="styDotLn" style="float:none;padding-left:2.2mm;">............</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/DepletionOilGas/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/DepletionOilGas/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/DepletionOilGas/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3ShadedCell">
								<span style="width:1mm"/>
							</td>
						</tr>
						<!-- Part III - Line 23b -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">
								<span style="width:1.5mm;padding-left:3.5mm;"/>b</td>
							<td>Depletion—Other than Oil &amp; Gas
							   <span class="styDotLn" style="float:none;padding-left:3mm;">........</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/DepletionOtherThanOilGas/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/DepletionOtherThanOilGas/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/DepletionOtherThanOilGas/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/DepletionOtherThanOilGas/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 24 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">24</td>
							<td>Intangible drilling &amp; development costs 
                               <span class="styDotLn" style="float:none;padding-left:1.9mm;">......</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/IntangibleDrillingAndDevCosts/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/IntangibleDrillingAndDevCosts/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/IntangibleDrillingAndDevCosts/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/IntangibleDrillingAndDevCosts/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 25 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">25</td>
							<td>Depreciation<span class="styDotLn" style="float:none;padding-left:1.9mm;">...............</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/DepreciationGrp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/DepreciationGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/DepreciationGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/DepreciationGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 26 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">26</td>
							<td>Bad debt expense<span class="styDotLn" style="float:none;padding-left:3.2mm;">.............</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/BadDebtExpnsAgencyBalWrttnOff/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/BadDebtExpnsAgencyBalWrttnOff/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/BadDebtExpnsAgencyBalWrttnOff/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/BadDebtExpnsAgencyBalWrttnOff/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 27 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">27</td>
							<td>Interest expense (see instructions)  
                                 <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/InterestExpenseForm8916AGrp"/>
								</xsl:call-template>
								<span class="styDotLn" style="float:none;padding-left:3.2mm;">......</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/InterestExpenseForm8916AGrp/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/InterestExpenseForm8916AGrp/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/InterestExpenseForm8916AGrp/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/InterestExpenseForm8916AGrp/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 28 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">28</td>
							<td>Purchase versus lease (for purchasers and/or lessees)
                               <span class="styDotLn" style="float:none;padding-left:1mm;">.</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/PurchaseVersusLease/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/PurchaseVersusLease/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/PurchaseVersusLease/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/PurchaseVersusLease/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 29 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">29</td>
							<td style="padding-top:.5mm;">Research and development costs
            <!-- Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/ResearchAndDevelopmentCosts"/>
								</xsl:call-template>
								<span class="styDotLn" style="float:none;padding-left:2mm;">........</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/ResearchAndDevelopmentCosts/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/ResearchAndDevelopmentCosts/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/ResearchAndDevelopmentCosts/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/ResearchAndDevelopmentCosts/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 30 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">30</td>
							<td style="padding-top:.5mm;">Other expense/deduction items with differences
                            (attach statement)
            <!-- Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/OtherExpnsDedItemsDifferences"/>
								</xsl:call-template>
								<span class="styDotLn" style="float:none;padding-left:1.5mm;">..............</span>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/OtherExpnsDedItemsDifferences/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/OtherExpnsDedItemsDifferences/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/OtherExpnsDedItemsDifferences/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/OtherExpnsDedItemsDifferences/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- Part III - Line 31 -->
						<tr>
							<td class="styIRS1065ScheduleM3NumberCell">31</td>
							<td style="padding-top:.5mm;font-weight:bold">Total expense/deduction items.
                                <span style="font-weight:normal">Combine lines 1
                                 through 30. Enter here and on Part II, line 24, reporting
                                 positive amounts as negative and negative amounts as
                                 positive 
                                  <span class="styDotLn" style="float:none;padding-left:3.5mm;">................</span>
								</span>
								<div style="width:187mm;border-style:solid; border-bottom-width:2px;                         border-top-width:0px; border-right-width:0px;border-left-width:0px;                         padding-top:0;float:left;"/>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/TotalExpenseDeductionItems/ExpensePerIncomeStmtAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/TotalExpenseDeductionItems/TemporaryDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/TotalExpenseDeductionItems/PermanentDifferenceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1065ScheduleM3Cell">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IRS1065SchM3ExpenseDedItems/TotalExpenseDeductionItems/DeductionPerTaxReturnAmt"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<div class="pageEnd" style="width:187mm;">
						<div class="styBoldText" style="float:right;padding-top:1mm;">Schedule M-3 (Form 1065) 2014</div>
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
							<xsl:with-param name="TargetNode" select="$Form1065ScheduleM3"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
					<!-- Additional Data Table-->
					<!-- Separated Data for D -->
					<xsl:if test="($Print = $Separated) and  (count($Form1065ScheduleM3/ReportableEntityPartnersGrp/Item) &gt;2)">
						<br/>
						<span class="styRepeatingDataTitle">Form 1065 Schedule M3, Line D</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<thead class="styTableThead">
								<!-- Label the Column Headers -->
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" valign="middle">Name of Reportable Entity Partner</th>
									<th class="styDepTblCell" scope="col" valign="middle">Identifying Number</th>
									<th class="styDepTblCell" scope="col" align="center" valign="middle">Maximum Percentage Owned or Deemed Owned</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1065ScheduleM3/ReportableEntityPartnersGrp/Item">
									<tr style="border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!-- First Column -->
										<td class="styTableCellText" align="center">
											<div style="width:120mm;">
												<span style="float:left;">
													<xsl:if test="ReportableEntityPartnerTxt">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ReportableEntityPartnerTxt"/>
														</xsl:call-template>
													</xsl:if>
												</span>
											</div>
										</td>
										<!-- Second Column -->
										<td class="styTableCellText">
											<div style="width:36mm;" align="center">
												<span style="">
													<xsl:choose>
														<xsl:when test="ReportableEntityPartnerSSN">
															<xsl:call-template name="PopulateSSN">
																<xsl:with-param name="TargetNode" select="ReportableEntityPartnerSSN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:when test="ReportableEntityParnterEIN">
															<xsl:call-template name="PopulateEIN">
																<xsl:with-param name="TargetNode" select="ReportableEntityParnterEIN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="MissingSSNEINReason"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</span>
											</div>
										</td>
										<!-- Third Column -->
										<td class="styTableCellCtr">
											<div style="width:30mm;" align="center">
												<span style="">
													<xsl:call-template name="PopulatePercent">
														<xsl:with-param name="TargetNode" select="MaximumDeemedOwnershipPct"/>
													</xsl:call-template>
												</span>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!--/Separated Data for D -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>