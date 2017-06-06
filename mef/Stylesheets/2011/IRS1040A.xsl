<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS1040AStyle.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="FormData" select="$RtnDoc/IRS1040A"/>
  <xsl:template match="/">
    <html lang="EN-US">
      <head>
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
        <meta name="Description" content="IRS Form 1040A"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS1040AStyle"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form1040A">
          <xsl:call-template name="DocumentHeader"/>
          <!-- BEGIN Header Section -->
          <div style="width:187mm;border-bottom:3px solid black;position:relative;height:12mm;">
            <div style="position:absolute;bottom:0;left:0;font-size:7pt;margin-right:10mm;">
              Form<br/>
              <span style="font-size:18pt;font-family:arial;font-weight:bold;">1040A</span>
            </div>
            <div style="position:absolute;bottom:0;left:25mm;font-size:7pt;margin-right:5mm;">
              Department of the Treasury-Internal Revenue Service<br/>
              <span class="styMainTitle">U.S. Individual Income Tax Return</span>(99)
            </div>
            <div class="styTaxYear" style="position:absolute;bottom:0;left:110mm;font-size:18pt;font-family:arial;font-weight:bold;text-align:center;margin-right:5mm;">2011</div>
            <div style="font-size:7pt;font-family:arial;position:absolute;bottom:0;right:0;">
              <div>
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData"/>
                </xsl:call-template>
                <xsl:if test="$FormData/PrimaryDateOfDeath">
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Top Right Margin - Primary Date Of Death</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$FormData/PrimaryDateOfDeath"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="$FormData/SpouseDateOfDeath">
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Top Right Margin - Spouse Date Of Death</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$FormData/SpouseDateOfDeath"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:choose>
                  <xsl:when test="$FormData/SpecialProcessingLiteralCd">
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Top Right Margin - Special Processing Literal Code</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$FormData/SpecialProcessingLiteralCd"/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:when test="$FormData/SpecialProcessingLiteralCd2">
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Top Right Margin - Special Processing Literal</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$FormData/SpecialProcessingLiteralCd2"/>
                    </xsl:call-template>
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Top Right Margin - Combat Zone Date</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$FormData/SpecialProcessingLiteralCd2/@combatZoneDate"/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:when test="$FormData/SpecialProcessingCodeTxt">
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Top Right Margin - Special Processing Code Text</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$FormData/SpecialProcessingCodeTxt"/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise/>
                </xsl:choose>
                <xsl:call-template name="LinkToLeftoverDataTableInline">
					<xsl:with-param name="Desc">Top Right Margin - Protective Section 108i ELC Record Indicator</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/ProtectiveSec108iELCRecordInd"/>
                </xsl:call-template>
                <xsl:if test="$FormData/PowerOfAttorneySignedBy">
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Top Right Margin - Signed by Power Of Attorney Checkbox</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneySignedBy"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="$FormData/PowerOfAttorneyName">
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Top Right Margin - Power Of Attorney Name</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneyName"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="$FormData/NonPaidPreparerCd">
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Top Right Margin - Non Paid Preparer Code</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$FormData/NonPaidPreparerCd"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="$FormData/RefundAnticipationLoanCd">
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Top Right Margin - Refund Anticipation Loan Code</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$FormData/RefundAnticipationLoanCd"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="$FormData/CommPropStateRtnInd">
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Top Right Margin - Community Property Return Indicator</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$FormData/CommPropStateRtnInd"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="$FormData/SurvivingSpouseInd">
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Top Right Margin - Surviving Spouse Indicator</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$FormData/SurvivingSpouseInd"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="$FormData/PersonalRepresentativeInd">
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Top Right Margin - Personal Representative</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$FormData/PersonalRepresentativeInd"/>
                  </xsl:call-template>
                </xsl:if>
              </div>
            IRS Use Only-Do not write or staple in this space.</div>
          </div>
          <!-- END Header Section -->
          <!-- BEGIN Name, Address, SSN Section -->
 					<!-- Entity Data -->
					<div class="styBB" style="width:187mm;">
						<!-- Line i -->
						<div class="styIRS1040AHeaderCell" style="width:67mm;height:10.5mm;">
							Your first name and initial<br/><br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">Name</xsl:with-param>
							</xsl:call-template>
							<span style="width:4px;"/>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Header Area - Primary Name Control</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNameControl"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1040AHeaderCell" style="width:74.8mm;height:10.5mm;">
							Last name <br/><br/><span style="width:4px;"/>
						</div>
						<div class="styIRS1040AHeaderCell" style="width:45mm;height:3mm;border-right-width:0px;text-align:center;">
							OMB No. 1545-0074
						</div>
						<div class="styIRS1040AHeaderCell" style="width:45mm;border-right-width:0px;height:7.2mm;">
							<span class="styBoldText">Your social security number</span><br/>
							<span style="width:100%;text-align:center;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
									<xsl:with-param name="EINChanged">true</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<!-- Line ii -->
						<div class="styIRS1040AHeaderCell" style="width:67mm;">
							If a joint return, spouse's first name and initial<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">SpouseName</xsl:with-param>
							</xsl:call-template>
							<span style="width:4px;"/>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Header Area - Spouse Name Control</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseNameControl"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1040AHeaderCell" style="width:74.8mm;">
							Last name <br/>
						</div>
						<div class="styIRS1040AHeaderCell" style="width:45mm;border-right-width:0px;">
							<span class="styBoldText" style="font-family:Arial Bold;font-size:7.5pt;">Spouse's social security number</span><br/>
							<span style="width:100%;text-align:center;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">SpouseSSN</xsl:with-param>
									<xsl:with-param name="EINChanged">true</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<!-- Line iii -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS1040AHeaderCell" style="width:120mm;height:10mm;">
								Home address (number and street). If you have a P.O. box, see instructions.<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styIRS1040AHeaderCell" style="width:21.8mm;height:10mm;">
								Apt. no.<br/><span style="width:0px;"/>
							</div>
							<div class="styIRS1040AHeaderCell" style="width:45mm;height:10mm;padding-top:6px;border-right-width:0px;">
								<div class="styGenericDiv" style="width:5mm;padding-top:0.5mm;"><img alt="Up-pointing triangle" src="{$ImagePath}/1040A_up_arrow.gif" height="20" width="20"/></div>
								<div class="styGenericDiv" style="text-align:center;width:35mm;font-family:arial;">Make sure the SSN(s) above <br/>and on line 6c are correct.</div>
							</div>
						</div>
						<!-- Line iv -->
						<div class="styIRS1040AHeaderCell" style="width:141.8mm;height:10mm;">
							<span style="font-family:Arial;">City, town or post office, state, and ZIP code. If you have a foreign address, also complete spaces below (see instructions).</span><br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS1040AHeaderCell" style="width:45mm;height:20mm;float:right;font-family:Arial Narrow;border-right-width:0px;">
							<span style="font-family:Arial;font-weight:bold;padding-left:4px;">Presidential Election Campaign</span><br/>
							<span style="font-size:4pt;"><br/></span>
							Check here if you, or your spouse if filing<br/>
							jointly, want $3 to go to this fund. Checking <br/>
							a box below will not change your tax or <br/>
							<span style="float:left;">refund.</span>
							<span style="float:right;">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PECFPrimaryInd"/>
										<xsl:with-param name="BackupName" select="IRS1040APECFPrimaryInd"/>
									</xsl:call-template>
								</input>
								<span style="width:4px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/PECFPrimaryInd"/>
										<xsl:with-param name="BackupName" select="IRS1040APECFPrimaryInd"/>
									</xsl:call-template>
									<b>You</b>
								</label>
								<span style="width:4px;"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PECFSpouseInd"/>
										<xsl:with-param name="BackupName" select="IRS1040APECFSpousend"/>
									</xsl:call-template>
								</input>
								<span style="width:4px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/PECFSpouseInd"/>
										<xsl:with-param name="BackupName" select="IRS1040APECFSpouseInd"/>
									</xsl:call-template>
									<b>Spouse</b>
								</label>
								<span style="width:4px;"/>
							</span>
						</div>
						<!-- Line v -->
						<div class="styIRS1040AHeaderCell" style="width:64mm;height:10mm;">
							Foreign country name<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">Country</xsl:with-param>
								<xsl:with-param name="MainForm">true</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS1040AHeaderCell" style="width:47mm;height:10mm;">
							Foreign province/county<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">ProvinceOrState</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS1040AHeaderCell" style="width:30.8mm;height:10mm;">
							<span style="font-family:arial;">Foreign postal code</span><br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">PostalCode</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Entity Data -->
					<!-- Filing status area -->
					<div style="width:187mm; border-style:solid; border-color: black; border-width: 0px 0px 1px 0px;">
						<div style="width:26mm;float:left;clear:none;">
							<div style="padding-top:.2mm;padding-bottom:.2mm;">
								<span class="styMainTitle" style="font-size:11pt;">Filing <br/>Status</span>
							</div>
                     Check only <br/>one box.
                  </div>
						<!-- Filing Status Single Indicator -->
						<div style="width:80mm;float:left;clear:none;">
							<div style="width:80mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">1</div>
								<div style="float:left;clear:none;padding-top:.5mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
											<xsl:with-param name="BackupName">IRS1040AIndividualReturnFilingStatusCd[1]</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
											<xsl:with-param name="BackupName">IRS1040AIndividualReturnFilingStatusCd[1]</xsl:with-param>
										</xsl:call-template>
										 Single
								  </label>
								</div>
							</div>
							<!-- Filing Status Married Filing Jointly Indicator -->
							<div style="width:80mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">2</div>
								<div style="float:left;clear:none;padding-top:.5mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
											<xsl:with-param name="BackupName">IRS1040AIndividualReturnFilingStatusCd[2]</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
											<xsl:with-param name="BackupName">IRS1040AIndividualReturnFilingStatusCd[2]</xsl:with-param>
										</xsl:call-template>
										 Married filing jointly (even if only one had income)
								  </label>
								</div>
							</div>
							<!-- Filing Status Married Filing Separately Indicator -->
							<div style="width:80mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">3</div>
								<div style="float:left;clear:none;padding-top:.5mm;">
									<div style="float:left;clear:none;">
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateEnumeratedCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
												<xsl:with-param name="DisplayedCheckboxValue" select="'3'"/>
												<xsl:with-param name="BackupName">IRS1040AIndividualReturnFilingStatusCd[3]</xsl:with-param>
											</xsl:call-template>
										</input>
									</div>
									<div style="float:left;clear:none;width:72mm;padding-left:1mm;">
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
												<xsl:with-param name="DisplayedCheckboxValue" select="'3'"/>
												<xsl:with-param name="BackupName">IRS1040AIndividualReturnFilingStatusCd[3]</xsl:with-param>
											</xsl:call-template>
										   Married filing separately. Enter spouse's SSN above
										   and full name here.
								  </label>
										<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
										<span style="width:7px;"/>
										<xsl:choose>
											<xsl:when test="$FormData/SpousesName!=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SpousesName"/>
													<xsl:with-param name="BackupName">IRS1040ASpousesName</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/NRALiteralCd"/>
													<xsl:with-param name="BackupName">IRS1040ANRALiteralCd</xsl:with-param>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</div>
								</div>
							</div>
						</div>
						<!-- Filing Status Head Of Household Indicator -->
						<div style="width:80mm;float:left;clear:none;">
							<div style="width:80mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">4</div>
								<div style="float:left;clear:none;padding-top:.5mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'4'"/>
											<xsl:with-param name="BackupName">IRS1040AIndividualReturnFilingStatusCd[4]</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<div class="styArialText" style="font-size:7pt;float:left;clear:none;width:72mm;padding-left:1mm;padding-top:.5mm;">
									<div style="float:none;clear:none;">
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
												<xsl:with-param name="DisplayedCheckboxValue" select="'4'"/>
												<xsl:with-param name="BackupName">IRS1040AIndividualReturnFilingStatusCd[4]</xsl:with-param>
											</xsl:call-template>
										   Head of household (with qualifying person). (See instructions.) If
										   the qualifying person is a child but not your dependent, enter
										   this child&apos;s name here.
								  </label>
										<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
										<span class="styBB" style="width:40mm;float:none;clear:none;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/QualifyingNameForHOH"/>
												<xsl:with-param name="BackupName">IRS1040AQualifyingNameForHOH</xsl:with-param>
											</xsl:call-template>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Line 4 - Qualifying HOH SSN</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/QualifyingHOHSSN"/>
											</xsl:call-template>
										</span>
									</div>
								</div>
							</div>
							<!-- Filing Status Qualifying Widow Indicator -->
							<div style="width:80mm;">
								<div class="styLNLeftNumBox" style="width:4mm;">5</div>
								<div style="float:left;clear:none;padding-top:.5mm;">
									<div style="float:left;clear:none;">
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateEnumeratedCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
												<xsl:with-param name="DisplayedCheckboxValue" select="'5'"/>
												<xsl:with-param name="BackupName">IRS1040AIndividualReturnFilingStatusCd[5]</xsl:with-param>
											</xsl:call-template>
										</input>
									</div>
									<div style="float:left;clear:none;width:72mm;padding-left:1mm;">
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
												<xsl:with-param name="DisplayedCheckboxValue" select="'5'"/>
												<xsl:with-param name="BackupName">IRS1040AIndividualReturnFilingStatusCd[5]</xsl:with-param>
											</xsl:call-template>
											<span class="styArialText" style="font-size:7.5pt;">
										  Qualifying widow(er) with dependent child (see instructions)
										  </span>
										</label>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- End Filing status area -->
          <!-- BEGIN Exemptions Section -->
          <div style="width:187mm; border-style:solid; border-color: black; border-width: 0px 0px 1px 0px;">
						<div style="width:25.5mm;float:left;clear:none;">
							<div style="padding-top:4mm;padding-bottom:10mm;">
								<span class="styMainTitle" style="font-size:11pt;">Exemptions</span>
							</div>
												  If more than six<br/>
												 dependents, see<br/>
												 instructions
						</div>
						<div style="width:126.5mm;float:left;clear:none;">
							<div style="width:126mm;float:left;clear:none;">
								<div style="width:123mm;float:left;clear:none;">
									<div style="width:122mm;float:left;clear:none;">
										<div class="styLNLeftNumBox" style="width:4mm;">6a</div>
										<div style="float:left;clear:none;padding-top:.5mm;padding-left:2mm;">
											<span style="float:left;clear:none;">
												<input type="Checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$FormData/ExemptPrimaryInd"/>
														<xsl:with-param name="BackupName">IRS1040AExemptPrimaryInd</xsl:with-param>
													</xsl:call-template>
												</input>
											</span>
											<div style="width:112mm;padding-left:1.5mm;float:left;clear:none;">
												<span style="float:left;clear:none;">
													<label>
														<xsl:call-template name="PopulateLabel">
															<xsl:with-param name="TargetNode" select="$FormData/ExemptPrimaryInd"/>
															<xsl:with-param name="BackupName">IRS1040AExemptPrimaryInd</xsl:with-param>
														</xsl:call-template>
														<b>Yourself. </b> If someone can claim you as a dependent, <b>do not</b> check box 6a
                                     </label>
												</span>
												<span class="styDotLn" style="float:right;padding-right:2mm;">...</span>
											</div>
										</div>
									</div>
									<div style="width:123mm;float:left;clear:none;">
										<div class="styLNLeftNumBox" style="width:4mm;padding-left:2.75mm;">b</div>
										<div style="float:left;clear:none;padding-top:.5mm;padding-left:2mm;">
											<span style="float:left;clear:none;">
												<input type="Checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseInd"/>
														<xsl:with-param name="BackupName">IRS1040AExemptSpouseInd</xsl:with-param>
													</xsl:call-template>
												</input>
											</span>
											<div style="width:112mm;padding-left:1.5mm;float:left;clear:none;">
												<span style="padding-right:1mm;float:left;clear:none;">
													<label>
														<xsl:call-template name="PopulateLabel">
															<xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseInd"/>
															<xsl:with-param name="BackupName">IRS1040AExemptSpouseInd</xsl:with-param>
														</xsl:call-template>
														<b>Spouse</b>
													</label>
												</span>
												<div class="styUnderlineAmount" style="text-align:left;float:left;clear:none;height:4mm;width:98 mm;padding-top:0mm;padding-left:.5mm;border-style:dotted;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseName"/>
														<xsl:with-param name="BackupName">IRS1040AExemptSpouseName</xsl:with-param>
													</xsl:call-template>
													<span style="width:2px;"/>
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Line 6b - Exempt Spouse Name Control</xsl:with-param>
														<xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseNameControl"/>
													</xsl:call-template>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div style="width:3mm;float:right;clear:none;">
									<img src="{$ImagePath}/1040A_right_bracket_sm.gif" alt="Bracket"/>
								</div>
								<!-- Table expand/collapse toggle button -->
								<div class="styGenericDiv" style="width:3.2mm;height:4mm;float:right;clear:none;">
									<xsl:call-template name="SetDynamicTableToggleButton">
										<xsl:with-param name="TargetNode" select="$FormData/DependentInformations"/>
										<xsl:with-param name="containerHeight" select="6"/>
										<xsl:with-param name="headerHeight" select="1"/>
										<xsl:with-param name="containerID" select=" 'depdContainerId'  "/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:127.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:2.75mm;padding-top:0mm;">c</div>
								<!-- Dependents table -->
								<!-- Column widths used 
49.4
30.2 c/to 26.2
20.6 c/to 18.6
18.6 c/to 22.6 to 24.6
-->
								<!-- Generated Table (Start) -->
								<div class="sty1040ADepdContainer" style="height:27mm;width: 120mm;" id="depdContainerId">
									<!-- print logic -->
									<xsl:call-template name="SetInitialState"/>
									<!-- end -->
									<table class="styTable" cellspacing="0">
										<thead class="styTableThead">
											<tr>
												<th class="styTableCellHeader" scope="col" style="text-align:left;width:49.4mm;border-right-width:1px;">
													<div style="float:left;clear:none;width:44mm;vertical-align:top;">
														<span style="width:7px;"/>
														<span style="font-weight:bold;">Dependents:</span>
														<br/>
														<div class="styNormalText" style="float:left;clear:none;padding-top:3mm;padding-left:1mm;">
															<span class="styBoldText">(1)</span> First name
                                             <span style="width:27px;"/> 
                                             Last name
                                          </div>
													</div>
												</th>
												<th class="styTableCellHeader" scope="col" style="width:26.2mm;border-right-width:1px;padding-top:1mm;">
													<!-- uncomment and change table header literals here or use 'cellpad' -->
													<span style="font-weight:bold;">(2)</span>
													<span class="styNormalText">
                                       Dependent's<span style="width:4mm"/>
                                       social security number
                                       </span>
													<!-- span class="styTableCellPad"></span -->
												</th>
												<th class="styTableCellHeader" scope="col" style="width:18.6mm;border-right-width:1px;vertical-align:top;">
													<!-- uncomment and change table header literals here or use 'cellpad' -->
													<span style="font-weight:bold;">(3)</span>
													<span class="styNormalText">
                                       Dependent's
                                       relationship to
                                       you
                                       </span>
													<!-- span class="styTableCellPad"></span -->
												</th>
												<th class="styTableCellHeader" scope="col" style="width:24.6mm;border-right-width:0px;">
													<b>(4) </b>
													<img src="{$ImagePath}/1040_Check.gif" alt="Check"/>
													<span class="styNormalText">
												   if child under age 17 qualifying
												   for child tax
												   credit (see instructions)
												   </span>
												</th>
											</tr>
										</thead>
										<tbody>
											<xsl:if test="($Print != $Separated) or (count($FormData/DependentInformations) &lt;= 6)">
												<xsl:for-each select="$FormData/DependentInformations">
													<tr>
														<!-- Column 1 -->
														<td class="styTableCell" style="width:49.4mm;height:4mm;float:left;clear:none;border-right-width:1px;">
															<!-- insert Populate template call here (and remove group level reference) -->
															<label>
																<xsl:call-template name="PopulateLabel">
																	<xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
																	<xsl:with-param name="BackupName">IRS1040ADependentInformations<xsl:number value="position()"/>EligibleForChildTaxCreditInd</xsl:with-param>
																</xsl:call-template>
																<span style="width:25mm;text-align:left;float:left;clear:none;">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="DependentFirstName"/>
																	</xsl:call-template>
																</span>
																<span style="width:18mm;text-align:left;float:left;clear:none;">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="DependentLastName"/>
																	</xsl:call-template>
																</span>
															</label>
															<span style="width:4mm;align:left;float:none;clear:none;">
																<xsl:call-template name="LinkToLeftoverDataTableInline">
																	<xsl:with-param name="Desc">Line 6c - Dependent <xsl:number value="position()"/> Name Control</xsl:with-param>
																	<xsl:with-param name="TargetNode" select="DependentNameControl"/>
																</xsl:call-template>
															</span>
														</td>
														<!-- Column 2 -->
														<td class="styTableCell" style="text-align:center;width:26.2mm;height:4mm;float:left;clear:none;border-right-width:1px;">
															<xsl:choose>
																<xsl:when test="DiedLiteralCd">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="DiedLiteralCd"/>
																	</xsl:call-template>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:call-template name="PopulateSSN">
																		<xsl:with-param name="TargetNode" select="DependentSSN"/>
																	</xsl:call-template>
																</xsl:otherwise>
															</xsl:choose>
														</td>
														<!-- Column 3 -->
														<td class="styTableCell" style="width:18.6mm;height:4mm;text-align:left;float:left;clear:none;border-right-width:1px;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="DependentRelationship"/>
															</xsl:call-template>
														</td>
														<!-- Column 4 -->
														<td class="styTableCell" style="text-align:center;width:24.6mm;height:4mm;float:left;clear:none;border-right-width:0px;">
															<!-- Checkbox -->
															<input type="Checkbox" class="styCkbox">
																<xsl:call-template name="PopulateCheckbox">
																	<xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
																	<xsl:with-param name="BackupName">IRS1040ADependentInformations<xsl:number value="position()"/>EligibleForChildTaxCreditInd</xsl:with-param>
																</xsl:call-template>
															</input>
														</td>
													</tr>
												</xsl:for-each>
											</xsl:if>
											<!-- Table Filler Rows -->
											<xsl:if test="count($FormData/DependentInformations) &lt; 1 or ((count($FormData/DependentInformations) &gt; 6) and ($Print = $Separated))">
												<tr>
													<td class="styTableCell" style="width:49.4mm;text-align:left;height:4mm;float:left;clear:none;border-right-width:1px;">
														<xsl:call-template name="PopulateAdditionalDataTableMessage">
															<xsl:with-param name="TargetNode" select="$FormData/DependentInformations"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:26.2mm;height:4mm;float:left;clear:none;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:18.6mm;height:4mm;float:left;clear:none;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:24.6mm;height:4mm;float:left;clear:none;border-right-width:0px;">
														<span class="styTableCellPad"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/DependentInformations) &lt; 2 or ((count($FormData/DependentInformations) &gt; 6) and ($Print = $Separated))">
												<tr>
													<td class="styTableCell" style="width:49.4mm;height:4mm;float:left;clear:none;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:26.2mm;height:4mm;float:left;clear:none;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:18.6mm;height:4mm;float:left;clear:none;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:24.6mm;height:4mm;float:left;clear:none;border-right-width:0px;">
														<span class="styTableCellPad"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/DependentInformations) &lt; 3 or ((count($FormData/DependentInformations) &gt; 6) and ($Print = $Separated))">
												<tr>
													<td class="styTableCell" style="width:49.4mm;height:4mm;float:left;clear:none;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:26.2mm;height:4mm;float:left;clear:none;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:18.6mm;height:4mm;float:left;clear:none;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:24.6mm;height:4mm;float:left;clear:none;border-right-width:0px;">
														<span class="styTableCellPad"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/DependentInformations) &lt; 4 or ((count($FormData/DependentInformations) &gt; 6) and ($Print = $Separated))">
												<tr>
													<td class="styTableCell" style="width:49.4mm;height:4mm;float:left;clear:none;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:26.2mm;height:4mm;float:left;clear:none;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:18.6mm;height:4mm;float:left;clear:none;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:24.6mm;height:4mm;float:left;clear:none;border-right-width:0px;">
														<span class="styTableCellPad"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/DependentInformations) &lt; 5 or ((count($FormData/DependentInformations) &gt; 6) and ($Print = $Separated))">
												<tr>
													<td class="styTableCell" style="width:49.4mm;height:4mm;float:left;clear:none;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:26.2mm;height:4mm;float:left;clear:none;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:18.6mm;height:4mm;float:left;clear:none;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:24.6mm;height:4mm;float:left;clear:none;border-right-width:0px;">
														<span class="styTableCellPad"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/DependentInformations) &lt; 6 or ((count($FormData/DependentInformations) &gt; 6) and ($Print = $Separated))">
												<tr>
													<td class="styTableCell" style="width:49.4mm;height:4mm;float:left;clear:none;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:26.2mm;height:4mm;float:left;clear:none;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:18.6mm;height:4mm;float:left;clear:none;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:24.6mm;height:4mm;float:left;clear:none;border-right-width:0px;">
														<span class="styTableCellPad"/>
													</td>
												</tr>
											</xsl:if>
											<!-- End of filler rows -->
										</tbody>
									</table>
								</div>
							</div>
							<!-- Set Initial Height of Above Table -->
							 <xsl:call-template name="SetInitialDynamicTableHeight">
                <xsl:with-param name="TargetNode" select="$FormData/DependentInformations"/>
                <xsl:with-param name="containerHeight" select="6"/>
                <xsl:with-param name="headerHeight" select="1"/>
                <xsl:with-param name="containerID" select=" 'depdContainerId' "/>
              </xsl:call-template>
							<!-- Generated Table (End) -->
							<!-- End Dependents table -->
							<div style="width:127mm;height:4mm;padding-top:1mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:2mm;">d</div>
								<div style="float:left;clear:none;padding-left:1mm;">
									<div style="width:120mm;padding-left:0mm;float:left;clear:none;">
										<span style="float:left;padding-top:.5mm;clear:none;">
                              Total number of exemptions claimed.
                              </span>
									</div>
								</div>
							</div>
						</div>
						<!-- Boxes checked area -->
						<div style="width:34mm;height:8mm;float:left;clear:none;">
							<div style="height:9mm;width:24mm;float:left;clear:none;">
								<b>
								  Boxes 
								  <br/>
								  checked on
								  <br/>                  
								  6a and 6b 
								</b>
							  </div>
							  <div class="styBB" style="height:9mm;padding-top:6mm;text-align:right;float:right;clear:none;width:8mm;">
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$FormData/TotalExemptPrimaryAndSpouseCnt"/>
								</xsl:call-template>
							  </div>
							  <div style="width:24mm;float:left;clear:none;">
								<b>
								  No. of children<br/>
								  on 6c who:<br/>
								  <img src="{$ImagePath}/1040_Bullet_Round.gif" alt="Round bullet image"/>
								  <span style="width:5px;"/>
								  lived with you
								</b>
							  </div>
							  <div class="styBB" style="padding-top:6mm;text-align:right;float:right;clear:none;width:8mm;">
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$FormData/NumOfChildWhoLivedWithYouCnt"/>
								</xsl:call-template>
							  </div>
							  <div style="width:24mm;float:left;clear:none;">
								<img src="{$ImagePath}/1040_Bullet_Round.gif" alt="Round bullet image"/>
								<span style="width:5px;"/>
								<b>
								  did not live 
								  <br/>
								  with you due to 
								  <br/>
								  divorce or 
								  separation (see 
								  <br/>
								  instructions)
								</b>
							  </div>
							  <div class="styBB" style="padding-top:12mm;text-align:right;float:right;clear:none;width:8mm;">
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$FormData/NumOfChildNotLivingWithYouCnt"/>
								</xsl:call-template>
							  </div>
							  <div style="width:24mm;padding-top:1mm;float:left;clear:none;">
								<b>
								  Dependents 
								  <br/>
								  on 6c not 
								  <br/>
								  entered above
								</b>
							  </div>
							  <div class="styBB" style="padding-top:7mm;text-align:right;float:right;clear:none;width:8mm;">
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$FormData/NumOfOtherDepdListedCnt"/>
								</xsl:call-template>
							  </div>
							  <div style="width:24mm;padding-top:2mm;float:left;clear:none;">
								<b>Add numbers on
									 lines above</b>
								<img src="{$ImagePath}/1040A_Bullet.gif" alt="Right pointing arrowhead image" style="margin:0mm 1mm;"/>
							  </div>
							  <div class="styDblBox" style="padding-top:4mm;text-align:right;float:right;clear:none;width:8mm;">
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$FormData/TotalExemptionsCnt"/>
								</xsl:call-template>
							  </div>
						</div>
					</div>
          <!-- END Exemptions Section -->
          <!-- BEGIN Income Section -->
          <div style="position:relative;width:187mm;border-bottom:2px solid black;">
            <!-- BEGIN Left Column -->
            <div style="width:24.5mm;float:left;clear:none;">
              <div style="margin:4mm 0mm;">
                <span class="styMainTitle" style="font-size:11pt;">Income</span>
              </div>
              <div class="styBoldText" style="margin:5mm 0mm;">
                Attach Form(s) W-2 here. Also attach Form(s) 1099-R if tax was withheld.
              </div>
              <div style="margin:5mm 0mm;">
                 If you did not<br/>
                 get a W-2,<br/>
                 see instructions.
               </div>
              <div style="position:absolute; bottom:3mm;">
                  Enclose, but do<br/>          
                  not attach, any<br/>
                  payment. Also,<br/>
                  please use<br/>
                <span class="styBoldText">Form 1040-V.</span>
              </div>
            </div>
            <!-- END Left Column -->
            <!-- BEGIN Right Column -->
            <div style="width:162.5mm;float:left;clear:none;">
              <!-- Line 7 -->
              <div class="sty1040ALongLine" style="padding-top:2mm;">
                <div class="styLNLeftNumBox" style="width:4mm;padding-left:2.5mm;">7</div>
                <div style="width:117.5mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                  <span style="float:left;clear:none;">
                     Wages, salaries, tips, etc. Attach Form(s) W-2
                  </span>
                  <div style="float:left;clear:none;padding-left:1mm">
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/WagesSalariesAndTipsAmt"/>
                    </xsl:call-template>
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Line 7 - Wages Not Shown Literal Only Code</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$FormData/WagesSalariesAndTipsAmt/@wagesNotShownLitOnlyCd"/>
                    </xsl:call-template>
                  </div>
                </div>
                <div class="styLNRightNumBox" style="border:none;font-weight:normal;">7</div>
                <div class="styLNAmountBox" style="border:none;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/WagesSalariesAndTipsAmt"/>
                    <xsl:with-param name="BackupName">IRS1040AWagesSalariesAndTipsAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <!--End Line 7 -->
              <!-- Line 8a -->
              <div style="width:162.5mm;padding-top:2mm;">
                <div class="sty1040AShortLine" style="width:4mm;border-bottom:none;font-weight:bold;padding-left:2.5mm;">8a</div>
                <div class="sty1040AShortLine" style="width:114.5mm;margin-left:1.5mm;">
                  <span style="float:left;clear:none;">
                    <span class="styBoldText">Taxable</span> interest. Attach Schedule B if required
                   </span>
                  <div style="float:left;clear:none;padding-left:1mm">
                    <!-- Form to Form Link -->
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/TaxableInterestAmt"/>
                    </xsl:call-template>
                  </div>
                </div>
                <div class="sty1040AShortLine" style="width:8mm;text-align:center;">8a</div>
                <div class="sty1040AShortLine" style="width:32mm;text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/TaxableInterestAmt"/>
                    <xsl:with-param name="BackupName">IRS1040ATaxableInterestAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <!--End Line 8a -->
              <!-- Line 8b -->
              <div style="width:162.5mm;">
                <div class="sty1040AShortLine" style="width:4mm;padding-left:4.25mm;font-weight:bold;">b</div>
                <div class="sty1040AShortLine" style="width:76.5mm;padding-left:1.5mm;">
                  <span style="float:left;clear:none;">
                    <b>Tax-exempt</b> interest. <b>Do not</b> include on line 8a
                  </span>
                </div>
                <div class="sty1040AShortLine" style="width:8mm;padding-left:1.5mm;">8b</div>
                <div class="sty1040AShortLine" style="width:32mm;padding-left:1.5mm;border-right:0px solid black">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/TaxExemptInterestAmt"/>
                    <xsl:with-param name="BackupName">IRS1040TaxExemptInterestAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="sty1040AShortLine" style="width:8.3mm"/>
              </div>
              <!--End Line 8b -->
              <!-- Line 9a -->
              <div style="width:162.5mm;">
                <div class="sty1040AShortLine" style="width:4mm;border-bottom:none;font-weight:bold;padding-left:2.5mm;">9a</div>
                <div class="sty1040AShortLine" style="width:114.5mm;margin-left:1.5mm;">
                  <span style="float:left;clear:none;">
                    Ordinary dividends. Attach Schedule B if required
                   </span>
                  <div style="float:left;clear:none;padding-left:1mm">
                    <!-- Form to Form Link -->
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/OrdinaryDividendsAmt"/>
                    </xsl:call-template>
                  </div>
                </div>
                <div class="sty1040AShortLine" style="width:8mm;text-align:center;">9a</div>
                <div class="sty1040AShortLine" style="width:32mm;text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/OrdinaryDividendsAmt"/>
                    <xsl:with-param name="BackupName">IRS1040AOrdinaryDividendsAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <!--End Line 9a -->
              <!-- Line 9b -->
              <div style="width:162.5mm;">
                <div class="sty1040AShortLine" style="width:4mm;padding-left:4.25mm;font-weight:bold;">b</div>
                <div class="sty1040AShortLine" style="width:76.5mm;padding-left:1.5mm;">
                  <span style="float:left;clear:none;">
                    Qualified dividends (see instructions).
                  </span>
                </div>
                <div class="sty1040AShortLine" style="width:8mm;padding-left:1.5mm;">9b</div>
                <div class="sty1040AShortLine" style="width:32mm;padding-left:1.5mm;border-right:0px solid black">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/QualifiedDividendsAmt"/>
                    <xsl:with-param name="BackupName">IRS1040AQualifiedDividendsAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="sty1040AShortLine" style="width:8.3mm"/>
              </div>
              <!--End Line 9b -->
              <!-- Line 10 -->
              <div class="sty1040ALongLine" style="width:162.5mm;">
                <div class="styLNLeftNumBox" style="width:4mm;">10</div>
                <div style="width:117.5mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                  <span style="float:left;clear:none;">
                     Capital gain distributions (see instructions).
                  </span>
                  <span style="float:left;clear:none;padding-left:1mm">
                    <!-- Form to Form Link -->
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/CapitalGainLossAmt"/>
                    </xsl:call-template>
                  </span>
                </div>
                <div class="styLNRightNumBox" style="border:none;font-weight:normal;">10</div>
                <div class="styLNAmountBox" style="border:none;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/CapitalGainLossAmt"/>
                    <xsl:with-param name="BackupName">IRS1040ACapitalGainLossAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <!--End Line 10 -->
              <!-- Line 11a,b -->
              <div class="sty1040ALongLine">
                <div class="styLNLeftNumBox" style="width:4mm;">11a</div>
                <div style="float:left;clear:none;width:71mm;padding:.5mm 0mm .5mm 2mm;border-right:0px solid black;position:relative;">
                  IRA<br/>distributions.
                  <div style="position:absolute; bottom:0mm; right:35mm">
                    11a
                  </div>
                  <div class="LNAmountBox" style="position:absolute; bottom:0mm; right:2mm;border:none;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/IRADistributionsAmt"/>
                    </xsl:call-template>
                  </div>
                </div>
                <div class="styLNLeftNumBox" style="width:4mm;">11b</div>
                <div style="float:left;clear:none;width:78.5mm;padding:.5mm 0mm .5mm 2mm;position:relative;">
                  Taxable amount<br/>(see instructions).
                  <div style="position:absolute; bottom:0mm; right:32mm">
                    11b
                  </div>
                  <div class="styLNAmountBox" style="border:none;position:absolute; bottom:0; right:0">
                    <div>
                      <xsl:call-template name="LinkToLeftoverDataTableInline">
                        <xsl:with-param name="Desc">Line 11b - IRA Distributions Literal Code</xsl:with-param>
                        <xsl:with-param name="TargetNode" select="$FormData/IRADistributionsLiteralCd"/>
                      </xsl:call-template>
                      <xsl:call-template name="SetFormLinkInline">
                        <xsl:with-param name="TargetNode" select="$FormData/TaxableIRAAmt"/>
                      </xsl:call-template>
                    </div>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/TaxableIRAAmt"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- End Line 11a,b -->
              <!-- Line 12a,b -->
              <div class="sty1040ALongLine">
                <div class="styLNLeftNumBox" style="width:4mm;">12a</div>
                <div style="float:left;clear:none;width:71mm;padding:.5mm 0mm .5mm 2mm;border-right:0px solid black;position:relative;">
                  Pensions and<br/>annuities.
                  <div style="position:absolute; bottom:0mm; right:35mm">
                    12a
                  </div>
                  <div class="styLNAmountbox" style="position:absolute; bottom:0mm; right:2mm;border:none;">
                    <br/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/PensionsAnnuitiesAmt"/>
                    </xsl:call-template>
                  </div>
                </div>
                <div class="styLNLeftNumBox" style="width:4mm;">12b</div>
                <div style="float:left;clear:none;width:78.5mm;padding:.5mm 0mm .5mm 2mm;position:relative;">
                  Taxable amount<br/>(see instructions).
                  <div style="position:absolute; bottom:0mm; right:32mm">
                    12b
                  </div>
                  <div class="styLNAmountBox" style="border:none;position:absolute; bottom:0; right:0">
                    <div>
                      <xsl:call-template name="LinkToLeftoverDataTableInline">
                        <xsl:with-param name="Desc">Line 12b - Foreign Employer Pension Code</xsl:with-param>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignEmployerPensionCd"/>
                      </xsl:call-template>
                      <xsl:call-template name="LinkToLeftoverDataTableInline">
                        <xsl:with-param name="Desc">Line 12b - Taxable Foreign Pensions Total Amount</xsl:with-param>
                        <xsl:with-param name="TargetNode" select="$FormData/TaxableForeignPensionsTotalAmt"/>
                      </xsl:call-template>
                      <xsl:call-template name="LinkToLeftoverDataTableInline">
                        <xsl:with-param name="Desc">Line 12b - Pensions and Annuities Literal Code</xsl:with-param>
                        <xsl:with-param name="TargetNode" select="$FormData/TotalTaxablePensionsAmt/@pensionsAnnuitiesLiteralCd"/>
                      </xsl:call-template>
                    </div>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/TotalTaxablePensionsAmt"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!--End Line 12a,b -->
              <!-- Line 13 -->
              <div class="sty1040ALongLine" style="padding-top:2mm;">
                <div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">13</div>
                <div style="width:117.5mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                  <span style="float:left;clear:none;">
                     Unemployment compensation and Alaska Permanent Fund dividends.
                  </span>
                  <div style="float:left;clear:none;padding-left:1mm">
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Line 13 - Repayment Code</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$FormData/UnemploymentCompAmt/@repaymentCd"/>
                    </xsl:call-template>
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Line 13 - Repayment Amount</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$FormData/UnemploymentCompAmt/@repaymentAmt"/>
                    </xsl:call-template>
                  </div>
                </div>
                <div class="styLNRightNumBox" style="border:none;font-weight:normal;">13</div>
                <div class="styLNAmountBox" style="border:none;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/UnemploymentCompAmt"/>
                    <xsl:with-param name="BackupName">IRS1040AUnemploymentCompAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <!-- End Line 13 -->
              <!-- Line 14a,b -->
              <div class="sty1040ALongLine">
                <div class="styLNLeftNumBox" style="width:4mm;">14a</div>
                <div style="float:left;clear:none;width:71mm;padding:.5mm 0mm .5mm 2mm;border-right:0px solid black;position:relative;">
                  Social security<br/>benefits.
                  <div style="position:absolute; bottom:0mm; right:35mm">
                    14a
                  </div>
                  <div class="styLNAmountBox" style="position:absolute; bottom:0mm; right:2mm;border:none;">
                    <div>
                      <xsl:call-template name="LinkToLeftoverDataTableInline">
                        <xsl:with-param name="Desc">Line 14a - Social Security Benefit Code</xsl:with-param>
                        <xsl:with-param name="TargetNode" select="$FormData/SocSecBnftAmt/@socSecBnftCd"/>
                      </xsl:call-template>
                    </div>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/SocSecBnftAmt"/>
                    </xsl:call-template>
                  </div>
                </div>
                <div class="styLNLeftNumBox" style="width:4mm;">14b</div>
                <div style="float:left;clear:none;width:78.5mm;padding:.5mm 0mm .5mm 2mm;position:relative;">
                  Taxable amount<br/>(see instructions).
                  <div style="position:absolute; bottom:0mm; right:32mm">
                    14b
                  </div>
                  <div class="styLNAmountBox" style="border:none;position:absolute; bottom:0; right:0">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/TaxableSocSecAmt"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- End Line 14a,b -->
              <!-- Line 15 -->
              <div style="width:162.5mm;padding-top:2mm;">
                <div class="styLNLeftNumBox" style="width:4mm;">15</div>
                <div style="width:117.5mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                  <span style="float:left;clear:none;">
                     Add lines 7 through 14b (far right column). This is your <b>total income.</b>
                    <img src="{$ImagePath}/1040A_Bullet.gif" alt="bullet" style="margin:0mm 1mm;"/>
                  </span>
                  <div style="float:left;clear:none;padding-left:1mm">
                    <!-- Form to Form Link -->
                  </div>
                </div>
                <div class="styLNRightNumBox" style="border:none;font-weight:normal;">15</div>
                <div class="styLNAmountBox" style="border:none;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/TotalIncomeAmt"/>
                    <xsl:with-param name="BackupName">IRS1040ATotalIncomeAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <!-- End Line 15 -->
            </div>
            <!-- END Right Column -->
          </div>
          <!-- END Income Section -->
          <!-- BEGIN AGI Section -->
          <div style="width:187mm;border-bottom:2px solid black;padding-top:1mm;">
            <!-- BEGIN Left Column -->
            <div style="width:24.5mm;float:left;clear:none;">
              <div style="margin:4mm 0mm;">
                <span class="styMainTitle" style="font-size:11pt;">Adjusted<br/>gross<br/>income</span>
              </div>
            </div>
            <!-- END Left Column -->
            <!-- BEGIN Right Column -->
            <div style="width:162.5mm;float:left;clear:none;">
              <!-- Line 16 -->
              <div class="sty1040ALongLine" style="padding-top:2mm;">
                <div class="styLNLeftNumBox" style="width:4mm;">16</div>
                <div style="width:85mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                  <span style="float:left;clear:none;">
                     Educator expenses (see instructions).
                  </span>
                  <div style="float:left;clear:none;padding-left:1mm">
                    <!-- Form to Form Link -->
                  </div>
                </div>
                <div class="styLNRightNumBox" style="border:none;font-weight:normal;">16</div>
                <div class="styLNAmountBox" style="border:none;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/EducatorExpensesAmt"/>
                    <xsl:with-param name="BackupName">IRS1040AEducatorExpensesAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <!--End Line 16 -->
              <!-- Line 17 -->
              <div class="sty1040ALongLine">
                <div class="styLNLeftNumBox" style="width:4mm;">17</div>
                <div style="width:85mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                  <span style="float:left;clear:none;">
                     IRA deduction (see instructions).
                  </span>
                  <div style="float:left;clear:none;padding-left:1mm">
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Line 17 - IRA Deduction Code</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$FormData/IRADeductionCd"/>
                    </xsl:call-template>
                  </div>
                </div>
                <div class="styLNRightNumBox" style="border:none;font-weight:normal;">17</div>
                <div class="styLNAmountBox" style="border:none;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/IRADeductionAmt"/>
                    <xsl:with-param name="BackupName">IRS1040AIRADeductionAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <!--End Line 17 -->
              <!-- Line 18 -->
              <div class="sty1040ALongLine">
                <div class="styLNLeftNumBox" style="width:4mm;">18</div>
                <div style="width:85mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                  <span style="float:left;clear:none;">
                     Student loan interest deduction (see instructions).
                  </span>
                  <div style="float:left;clear:none;padding-left:1mm">
                    <!-- Form to Form Link -->
                  </div>
                </div>
                <div class="styLNRightNumBox" style="border:none;font-weight:normal;">18</div>
                <div class="styLNAmountBox" style="border:none;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/StudentLoanInterestDedAmt"/>
                    <xsl:with-param name="BackupName">IRS1040AStudentLoanInterestDedAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <!--End Line 18 -->
              <!-- Line 19 -->
              <div class="sty1040ALongLine" style="padding-top:3mm;">
                <div class="styLNLeftNumBox" style="width:4mm;">19</div>
                <div style="width:85mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                  <span style="float:left;clear:none;">
                     Tuition and fees. Attach Form 8917.
                  </span>
                  <div style="float:left;clear:none;padding-left:1mm">
                    <!-- Form to Form Link -->
                    <xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$FormData/TuitionAndFeesDedAmt"/>
                    </xsl:call-template>
                  </div>
                </div>
                <div class="styLNRightNumBox" style="border:none;font-weight:normal;">19</div>
                <div class="styLNAmountBox" style="border:none;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/TuitionAndFeesDedAmt"/>
                    <xsl:with-param name="BackupName">IRS1040ATuitionAndFeesDedAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <!--End Line 19 -->
              <!-- Line 20 -->
              <div class="sty1040ALongLine">
                <div class="styLNLeftNumBox" style="width:4mm;">20</div>
                <div style="width:117.5mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                  <span style="float:left;clear:none;">
                     Add lines 16 through 19. These are your <b>total adjustments.</b>
                  </span>
                  <div style="float:left;clear:none;padding-left:1mm">
                    <!-- Form to Form Link -->
                  </div>
                </div>
                <div class="styLNRightNumBox" style="border:none;font-weight:normal;">20</div>
                <div class="styLNAmountBox" style="border:none;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/TotalAdjustmentsAmt"/>
                    <xsl:with-param name="BackupName">IRS1040ATotalAdjustmentsAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <!--End Line 20 -->
              <!-- Line 21 -->
              <div class="sty1040ALongLine" style="border-bottom:none;padding-top:3mm;">
                <div class="styLNLeftNumBox" style="width:4mm;">21</div>
                <div style="width:117.5mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                  <span style="float:left;clear:none;">
                     Subtract line 20 from line 15. This is your <b>adjusted gross income.</b>
                  </span>
                  <img alt="bullet" src="{$ImagePath}/1040A_Bullet.gif" style="float:right;"/>
                  <div style="float:left;clear:none;padding-left:1mm">
                    <!-- Form to Form Link -->
                  </div>
                </div>
                <div class="styLNRightNumBox" style="border:none;font-weight:normal;">21</div>
                <div class="styLNAmountBox" style="border:none;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/AdjustedGrossIncomeAmt"/>
                    <xsl:with-param name="BackupName">IRS1040AAdjustedGrossIncomeAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <!--End Line 21 -->
            </div>
            <!-- END Right Column -->
          </div>
          <!--Page 1 Footer-->
          <div class="pageEnd" style="width:187mm; font-size:7pt;padding-top:0.5mm">
            <div style="float:left; font-size:7pt">
              <b>For Disclosure, Privacy Act, and Paperwork Reduction Act Notice, see separate instructions.</b>
            </div>
            <div style="float:right">
            Cat. No. 11327A
            <span style="width:12mm"/>
            Form <b style="font-size:7pt">1040A</b> (2011)
            </div>
          </div>
          <!-- page 2 Header -->
          <div class="styTBB" style="width:187mm;padding-top:.5mm;">
            <span class="" style="float:left;clear:none;">Form 1040A (2011)</span>
            <span style="float:right;clear:none;">Page <span class="styBoldText" style="font-size:8pt;">2</span>
            </span>
          </div>
          <!--END Page Footer-->
          <!-- END AGI Section -->
          <!-- BEGIN Tax, credits, payments section -->
          <div style="width:187mm;border-bottom:2px solid black;">
            <!-- BEGIN Left Column -->
            <div style="width:24.5mm;float:left;clear:none;">
              <div style="margin:2mm 0mm;">
                <span class="styMainTitle" style="font-size:11pt;">Tax, credits,<br/>and<br/>payments</span>
              </div>
              
              <div class="styGenericDiv" style="width:20.5mm;border:1px solid black;padding-left:8px;font-size:6pt;margin-left:4.5px;z-index:-5">
								<b>Standard<br/>
								Deduction<br/>
								for&#8211;</b><br/>
								&#8226; People who<br/>
								check any<br/>
								box on line<br/>
								23a or 23b <b>or</b><br/>
								who can be<br/>
								claimed as a<br/>
								dependent,<br/>
								see<br/>
								instructions.<br/>
								&#8226; All others:<br/>
								Single or<br/>
								Married filing<br/>
								separately,<br/>
								$5,800<br/>
								<span style="font-size:2pt;"><br/></span>
								Married filing<br/>
								jointly or<br/>
								Qualifying<br/>
								widow(er)<br/>
								$11,600<br/>
								<span style="font-size:2pt;"><br/></span>
								Head of<br/>
								household,<br/>
								$8,500
							</div>

					<div class="styGenericDiv" style="margin-top:25px;width:20.5mm;border:1px solid black;padding-left:8px;font-size:6pt;margin-left:4.5px;z-index:-5;">
                  If you have a qualifying child, attach Schedule EIC.
					</div>
            </div>
            <!-- END Left Column -->
            <!-- BEGIN Right Column -->
            <div style="width:162.5mm;margin-left:-10px;float:left;clear:none;">
              <!-- Line 22 -->
              <div class="sty1040ALongLine" style="margin-left:10px">
                <div class="styLNLeftNumBox" style="width:4mm;">22</div>
                <div style="width:117.5mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                  <span style="float:left;clear:none;">
                     Enter the amount from line 21 (adjusted gross income).
                  </span>
                  <div style="float:left;clear:none;padding-left:1mm">
                    <!-- Form to Form Link -->
                  </div>
                </div>
                <div class="styLNRightNumBox" style="border:none;font-weight:normal;">22</div>
                <div class="styLNAmountBox" style="border:none;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/AdjustedGrossIncomeAmt"/>
                    <xsl:with-param name="BackupName">IRS1040AAdjustedGrossIncomeAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <!-- End Line 22 -->
              <!-- BEGIN Line 23a -->
              <div style="width:162.5mm;padding-top:1mm;margin-left:10px">
                <div style="width:4mm;float:left;font-weight:bold;padding-left:1mm;">23a</div>
                <div style="width:124mm;float:left;clear:none;margin-left:1.5mm;border-bottom:1px solid black;">
                  <div style="float:left;width:12mm;">
                    <img alt="small left bracket" src="{$ImagePath}/1040A_left_bracket_sm.gif" style="float:right;"/>
                    Check<br/>if:
                  </div>
                  <div class="styGenericDiv">
                    <input type="checkbox" class="styCkbox" style="padding:0;margin:0;height:15px;width:15px;">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$FormData/Primary65OrOlderInd"/>
                        <xsl:with-param name="BackupName">IRS1040APrimary65OrOlderInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
                    <br/>
                    <input type="checkbox" class="styCkbox" style="padding:0;margin:0;height:15px;width:15px;">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$FormData/Spouse65OrOlderInd"/>
                        <xsl:with-param name="BackupName">IRS1040ASpouse65OrOlderInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
                  </div>
                  <div class="styGenericDiv" style="padding-top:.5mm;padding-left:1mm;padding-right:1mm;">
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$FormData/Primary65OrOlderInd"/>
                        <xsl:with-param name="BackupName">IRS1040APrimary65OrOlderInd</xsl:with-param>
                      </xsl:call-template>
                      <b>You</b> were born before January 2, 1947, 
                    </label>
                    <br/>
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$FormData/Spouse65OrOlderInd"/>
                        <xsl:with-param name="BackupName">IRS1040ASpouse65OrOlderInd</xsl:with-param>
                      </xsl:call-template>
                      <b>Spouse</b> was born before January 2, 1947,
                    </label>
                  </div>
                  <div class="styGenericDiv" style="padding-top:0mm;">
                    <input type="checkbox" class="styCkbox" style="padding:0;margin:0;height:15px;width:15px;">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$FormData/PrimaryBlindInd"/>
                        <xsl:with-param name="BackupName">IRS1040APrimaryBlindInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
                    <br/>
                    <input type="checkbox" class="styCkbox" style="padding:0;margin:0;height:15px;width:15px;">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$FormData/SpouseBlindInd"/>
                        <xsl:with-param name="BackupName">IRS1040ASpouseBlindInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
                  </div>
                  <div class="styGenericDiv" style="padding-top:.5mm;padding-left:1mm;padding-right:1mm;">
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$FormData/PrimaryBlindInd"/>
                        <xsl:with-param name="BackupName">IRS1040APrimaryBlindInd</xsl:with-param>
                      </xsl:call-template>
                      Blind
                    </label>
                    <br/>
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$FormData/SpouseBlindInd"/>
                        <xsl:with-param name="BackupName">IRS1040ASpouseBlindInd</xsl:with-param>
                      </xsl:call-template>
                      Blind
                    </label>
                  </div>
                  <div style="float:left;clear:none;width:28mm;font-weight:bold;">
                    <img alt="small left bracket" src="{$ImagePath}/1040A_right_bracket_sm.gif" style="float:left;"/>
                    Total boxes<br/>checked <img alt="bullet" src="{$ImagePath}/1040A_Bullet.gif" style="margin:0mm 1mm;"/>
                    <span style="font-weight:normal">23a</span>
                  </div>
                  <div class="styDblBox" style="padding-top:4mm;text-align:right;float:left;clear:none;width:8mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/TotalBoxesCheckedCnt"/>
                      <xsl:with-param name="BackupName">IRS1040ATotalBoxesCheckedCnt</xsl:with-param>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- END Line 23a -->
              <!-- BEGIN Line 23b -->
              <div style="width:162.5mm;height:7mm;border-bottom-width:0;margin-left:10px">
                <div style="width:4mm;float:left;font-weight:bold;padding-left:3.5mm;">b</div>
                <div style="width:125mm;float:left;clear:none;margin-left:1.5mm;">
                  <div style="float:left;clear:none;width:100mm;">
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$FormData/MustItemizeInd"/>
                        <xsl:with-param name="BackupName">IRS1040AMustItemizeInd</xsl:with-param>
                      </xsl:call-template>
                      If you are married filing separately and your spouse itemizes deductions, check here
                    </label>
                  </div>
                  <div style="float:left;clear:none;width:12mm;margin-right:5.5mm;padding-top:2.5mm;">
                    <img alt="bullet" src="{$ImagePath}/1040A_Bullet.gif" style="margin:0mm 1mm;"/>
                    23b
                  </div>
                  <div style="float:left;clear:none;padding-top:2mm;">
                    <input type="checkbox" class="styCkbox" style="padding:0;margin:0;height:15px;width:15px;">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$FormData/MustItemizeInd"/>
                        <xsl:with-param name="BackupName">IRS1040AMustItemizeInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
                  </div>
                </div>
              </div>
              <!-- END Line 23b -->
              <!-- Line 24 -->
              <div class="sty1040ALongLine" style="margin-left:0px;background-color:white;z-index:400;width:165mm;border-top:1px solid black">
				<div class="styGenericDiv" style="width:15px"/>
                <div class="styGenericDiv" style="width:4mm;font-weight:bold;">24</div>
                <div class="styGenericDiv" style="width:119.175mm;padding-top:.5mm;padding-left:3mm;">
                  <span style="float:left;clear:none;">
                     Enter your <b>standard deduction</b>.
                  </span>
                  <div class="styGenericDiv" style="padding-left:1mm">
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Line 24 - Modified Standard Deduction Indicator</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$FormData/TotalItemizedOrStandardDedAmt/@modifiedStandardDeductionInd"/>
                    </xsl:call-template>
                  </div>
                </div>
                <div class="styGenericDiv" style="border:none;font-weight:normal;">24</div>
                <div  class="styGenericDiv" style="margin-left:19px;border:none;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/TotalItemizedOrStandardDedAmt"/>
                  </xsl:call-template>
                </div>
              </div>
              <!-- End Line 24 -->
              <!-- Line 25 -->
              <div class="sty1040ALongLine" style="margin-left:10px">
                <div class="styLNLeftNumBox" style="width:4mm;">25</div>
                <div style="width:117.5mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                  <span style="float:left;clear:none;">
                     Subtract line 24 from line 22. If line 24 is more than line 22, enter -0-.
                  </span>
                  <div style="float:left;clear:none;padding-left:1mm">
                    <!-- Form to Form Link -->
                  </div>
                </div>
                <div class="styLNRightNumBox" style="border:none;font-weight:normal;">25</div>
                <div class="styLNAmountBox" style="border:none;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/AGILessDeductionsAmt"/>
                    <xsl:with-param name="BackupName">IRS1040AAGILessDeductionsAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <!-- End Line 25 -->
              <!-- Line 26 -->
              <div class="sty1040ALongLine" style="margin-left:10px">
                <div class="styLNLeftNumBox" style="width:4mm;">26</div>
                <div style="width:117.5mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                  <span style="float:left;clear:none;">
                    <b>Exemptions.</b> Multiply $3,700 by the number on line 6d.
                  </span>
                  <div style="float:left;clear:none;padding-left:1mm">
                    <!-- Form to Form Link -->
                  </div>
                </div>
                <div class="styLNRightNumBox" style="border:none;font-weight:normal;">26</div>
                <div class="styLNAmountBox" style="border:none;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/ExemptionsAmt"/>
                    <xsl:with-param name="BackupName">IRS1040AExemptionsAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <!-- End Line 26 -->
              <!-- Line 27 -->
              <div class="sty1040ALongLine" style="margin-left:10px">
                <div class="styLNLeftNumBox" style="width:4mm;">27</div>
                <div style="width:117.5mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                  <span style="float:left;clear:none;">
                     Subtract line 26 from line 25. If line 26 is more than line 25, enter -0-.<br/>This is your <b>taxable income.</b>
                  </span>
                  <div style="float:left;clear:none;padding-left:1mm">
                    <!-- Form to Form Link -->
                  </div>
                  <img alt="bullet" src="{$ImagePath}/1040A_Bullet.gif" style="float:right;margin-right:1mm;margin-top:3mm;"/>
                </div>
                <div class="styLNRightNumBox" style="border:none;font-weight:normal;padding-top:3mm;">27</div>
                <div class="styLNAmountBox" style="border:none;padding-top:3mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt"/>
                    <xsl:with-param name="BackupName">IRS1040ATaxableIncmAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <!-- End Line 27 -->
              <!-- Line 28 -->
              <div class="sty1040ALongLine" style="margin-left:10px">
                <div class="styLNLeftNumBox" style="width:4mm;">28</div>
                <div style="width:117.5mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                  <span style="float:left;clear:none;">
                    <b>Tax</b>, including any alternative minimum tax (see instructions).
                  </span>
                  <div style="float:left;clear:none;padding-left:1mm">
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Line 28 - Alternative Minimum Tax Code</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$FormData/AlternativeMinimumTaxAmt/@alternativeMinimumTaxCd"/>
                    </xsl:call-template>
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Line 28 - Alternative Minimum Tax Amount</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$FormData/AlternativeMinimumTaxAmt"/>
                    </xsl:call-template>
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/TaxAmt"/>
                    </xsl:call-template>
                  </div>
                </div>
                <div class="styLNRightNumBox" style="border:none;font-weight:normal;">28</div>
                <div class="styLNAmountBox" style="border:none;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/TaxAmt"/>
                    <xsl:with-param name="BackupName">IRS1040ATaxAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <!-- End Line 28 -->
              <!-- Line 29 -->
              <div class="sty1040ALongLine" style="margin-left:10px">
                <div class="styLNLeftNumBox" style="width:4mm;">29</div>
                <div style="width:85mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                  <span style="float:left;clear:none;">
                     Credit for child and dependent care expenses. Attach<br/>Form 2441.
                  </span>
                  <div style="float:left;clear:none;padding-left:1mm">
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/CrForChildAndDEPDCareAmt"/>
                    </xsl:call-template>
                  </div>
                </div>
                <div class="styLNRightNumBox" style="border:none;font-weight:normal;padding-top:3mm;">29</div>
                <div class="styLNAmountBox" style="border:none;padding-top:3mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/CrForChildAndDEPDCareAmt"/>
                    <xsl:with-param name="BackupName">IRS1040ACrForChildAndDEPDCareAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <!--End Line 29 -->
              <!-- Line 30 -->
              <div class="sty1040ALongLine" style="margin-left:10px">
                <div class="styLNLeftNumBox" style="width:4mm;">30</div>
                <div style="width:85mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                  <span style="float:left;clear:none;">
                     Credit for the elderly or the disabled. Attach<br/>
                     Schedule R.
                  </span>
                  <div style="float:left;clear:none;padding-left:1mm">
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/CreditForElderlyOrDisabledAmt"/>
                    </xsl:call-template>
                  </div>
                </div>
                <div class="styLNRightNumBox" style="border:none;font-weight:normal;padding-top:3mm;">30</div>
                <div class="styLNAmountBox" style="border:none;padding-top:3mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/CreditForElderlyOrDisabledAmt"/>
                    <xsl:with-param name="BackupName">IRS1040ACrForElderlyOrDisabledAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <!--End Line 30 -->
              <!-- Line 31 -->
              <div class="sty1040ALongLine" style="margin-left:10px">
                <div class="styLNLeftNumBox" style="width:4mm;">31</div>
                <div style="width:85mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                  <span style="float:left;clear:none;">
                    Education credits from Form 8863, line 23.
                  </span>
                  <div style="float:left;clear:none;padding-left:1mm">
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/EducationCreditAmt"/>
                    </xsl:call-template>
                  </div>
                </div>
                <div class="styLNRightNumBox" style="border:none;font-weight:normal;">31</div>
                <div class="styLNAmountBox" style="border:none;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/EducationCreditAmt"/>
                    <xsl:with-param name="BackupName">IRS1040AEducationCreditAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <!--End Line 31 -->
              <!-- Line 32 -->
              <div class="sty1040ALongLine" style="margin-left:10px">
                <div class="styLNLeftNumBox" style="width:4mm;">32</div>
                <div style="width:85mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                  <span style="float:left;clear:none;">
                    Retirement savings contributions credit. Attach Form 8880.
                  </span>
                  <div style="float:left;clear:none;padding-left:1mm">
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/RtrSavingsContributionsCrAmt"/>
                    </xsl:call-template>
                  </div>
                </div>
                <div class="styLNRightNumBox" style="border:none;font-weight:normal;">32</div>
                <div class="styLNAmountBox" style="border:none;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/RtrSavingsContributionsCrAmt"/>
                    <xsl:with-param name="BackupName">IRS1040ARtrSavingsContributionsCrAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <!--End Line 32 -->
              <!-- Line 33 -->
              <div class="sty1040ALongLine" style="margin-left:10px">
                <div class="styLNLeftNumBox" style="width:4mm;">33</div>
                <div style="width:85mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                  <span style="float:left;clear:none;">
                    Child tax credit (see instructions).
                  </span>
                  <div style="float:left;clear:none;padding-left:1mm">
                    <!-- Form to Form Link -->
                  </div>
                </div>
                <div class="styLNRightNumBox" style="border:none;font-weight:normal;">33</div>
                <div class="styLNAmountBox" style="border:none;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/ChildTaxCreditAmt"/>
                    <xsl:with-param name="BackupName">IRS1040AChildTaxCreditAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <!--End Line 33 -->
              <!-- Line 34 -->
              <div class="sty1040ALongLine" style="margin-left:10px">
                <div class="styLNLeftNumBox" style="width:4mm;">34</div>
                <div style="width:117.5mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                  <span style="float:left;clear:none;">
                     Add lines 29 through 33. These are your <b>total credits.</b>
                  </span>
                  <div style="float:left;clear:none;padding-left:1mm">
                    <!-- Form to Form Link -->
                  </div>
                </div>
                <div class="styLNRightNumBox" style="border:none;font-weight:normal;">34</div>
                <div class="styLNAmountBox" style="border:none;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/TotalCreditsAmt"/>
                    <xsl:with-param name="BackupName">IRS1040ATotalCreditsAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <!-- End Line 34 -->
              <!-- Line 35 -->
              <div class="sty1040ALongLine" style="margin-left:10px">
                <div class="styLNLeftNumBox" style="width:4mm;">35</div>
                <div style="width:117.5mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                  <span style="float:left;clear:none;">
                     Subtract line 34 from line 28. If line 34 is more than line 28, enter -0-. This is your <b>total tax</b>.
                  </span>
                  <div style="float:left;clear:none;padding-left:1mm">
                    <!-- Form to Form Link -->
                  </div>
                </div>
                <div class="styLNRightNumBox" style="border:none;font-weight:normal;"><br/>35</div>
                <div class="styLNAmountBox" style="border:none;"><br/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt"/>
                    <xsl:with-param name="BackupName">IRS1040ATotalTaxAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <!-- End Line 35 -->
              <!-- Line 36 -->
              <div class="sty1040ALongLine" style="margin-left:10px">
                <div class="styLNLeftNumBox" style="width:4mm;">36</div>
                <div style="width:85mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                  <span style="float:left;clear:none;">
                     Federal income tax withheld from Forms W-2 and 1099.
                  </span>
                  <div style="float:left;clear:none;padding-left:1mm">
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/WithholdingTaxAmt"/>
                    </xsl:call-template>
                  </div>
                </div>
                <div class="styLNRightNumBox" style="border:none;font-weight:normal;">36</div>
                <div class="styLNAmountBox" style="border:none;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/WithholdingTaxAmt"/>
                    <xsl:with-param name="BackupName">IRS1040AWithholdingTaxAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <!--End Line 36 -->
              <!-- Line 37 -->
              <div class="sty1040ALongLine" style="margin-left:10px;border-bottom-width:0">
                <div class="styLNLeftNumBox" style="width:4mm;">37</div>
                <div style="width:85mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                  <span style="float:left;clear:none;">
                    2011 estimated tax payments and amount applied<br/>
                    from 2010 return.
                  </span>
                  <div style="float:left;clear:none;padding-left:1mm">
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Line 37 - Divorced Spouse SSN</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@divorcedSpouseSSN"/>
                    </xsl:call-template>
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Line 37 - Divorced Literal Code</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@divorcedLiteralCd"/>
                    </xsl:call-template>
                    <xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt"/>
                    </xsl:call-template>
                  </div>
                </div>
                <div class="styLNRightNumBox" style="border:none;font-weight:normal;padding-top:3mm;">37</div>
                <div class="styLNAmountBox" style="border:none;padding-top:3mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt"/>
                    <xsl:with-param name="BackupName">IRS1040AEstimatedTaxPaymentsAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <!--End Line 37 -->
              <!-- Line 38a -->
              <div class="sty1040ALongLine" style="width:165mm;border-top:1px solid black;background-color:white">
				<div class="styGenericDiv" style="width:9px"/>
                <div class="styLNLeftNumBox" style="width:4mm;">38a</div>
                <div style="width:84.3mm;padding-top:.5mm;padding-left:1mm;float:left;clear:none;">
                  <span style="float:left;clear:none;">
                    <b>Earned income credit (EIC).</b>
                  </span>
                  <div style="float:left;clear:none;padding-left:1mm">
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/EarnedIncomeCreditAmt"/>
                    </xsl:call-template>
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Line 38a - EIC Eligibility Literal Code</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$FormData/EICEligibilityLiteralCd"/>
                    </xsl:call-template>
                  </div>
                </div>
                <div class="styLNRightNumBox" style="border:none;font-weight:normal;">38a</div>
                <div class="styLNAmountBox" style="border:none;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/EarnedIncomeCreditAmt"/>
                    <xsl:with-param name="BackupName">IRS1040AEarnedIncomeCreditAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <!--End Line 38a -->
              <!-- Line 38b -->
              <div style="width:162.5mm;margin-left:10px">
                <div class="sty1040AShortLine" style="width:4mm;padding-left:4.25mm;font-weight:bold;">b</div>
                <div class="sty1040AShortLine" style="width:50mm;padding-left:1.5mm;">
                  <span style="float:left;clear:none;">
                    Nontaxable combat pay election.
                  </span>
                </div>
                <div class="sty1040AShortLine" style="width:8mm;padding-left:1.5mm;">38b</div>
                <div class="sty1040AShortLine" style="width:32mm;padding-left:1.5mm;border-right:0px solid black;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/NontxCombatPayElectionAmt"/>
                    <xsl:with-param name="BackupName">IRS1040ANontxCombatPayElectionAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="sty1040AShortLine" style="width:8.3mm;"/>
              </div>
              <!--End Line 38b -->
              <!-- Line 39 -->
              <div class="sty1040ALongLine" style="margin-left:10px;border-top-width:0">
                <div class="styLNLeftNumBox" style="width:4mm;">39</div>
                <div style="width:85mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                  <span style="float:left;clear:none;">
                    Additional child tax credit. Attach Form 8812.
                  </span>
                  <div style="float:left;clear:none;padding-left:1mm">
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/AdditionalChildTaxCreditAmt"/>
                    </xsl:call-template>
                  </div>
                </div>
                <div class="styLNRightNumBox" style="border:none;font-weight:normal;">39</div>
                <div class="styLNAmountBox" style="border:none;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/AdditionalChildTaxCreditAmt"/>
                    <xsl:with-param name="BackupName">IRS1040AAdditionalChildTaxCreditAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <!--End Line 39 -->
              <!-- Line 40 -->
              <div class="sty1040ALongLine" style="margin-left:10px">
                <div class="styLNLeftNumBox" style="width:4mm;">40</div>
                <div style="width:85mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                  <span style="float:left;clear:none;">
                    American opportunity credit from Form 8863, line 14.
                  </span>
                  <div style="float:left;clear:none;padding-left:1mm">
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/RefundableAmerOppCreditAmt"/>
                    </xsl:call-template>
                  </div>
                </div>
                <div class="styLNRightNumBox" style="border:none;font-weight:normal;">40</div>
                <div class="styLNAmountBox" style="border:none;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/RefundableAmerOppCreditAmt"/>
                    <xsl:with-param name="BackupName">IRS1040ARefundableAmerOppCreditAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <!--End Line 40 -->
              <!-- Line 41 -->
              <div class="sty1040ALongLine" style="border-bottom:none;margin-left:10px">
                <div class="styLNLeftNumBox" style="width:4mm;">41</div>
                <div style="width:117.5mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                  <span style="float:left;clear:none;">
                    Add lines 36, 37, 38a, 39, and 40. These are your <b>total payments.</b>
                  </span>
                  <div style="float:left;clear:none;padding-left:1mm">
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Line 41 - Request for Extension Code</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$FormData/RequestForExtensionAmt/@requestForExtensionCd"/>
                    </xsl:call-template>
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Line 41 - Request for Extension Amount</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$FormData/RequestForExtensionAmt"/>
                    </xsl:call-template>
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Line 41 - Excess Social Security and Tier 1 RRTA Tax Code</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$FormData/ExcessSocSecAndTier1RRTATaxAmt/@excessSocSecAndTier1RRTATaxCd"/>
                    </xsl:call-template>
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Line 41 - Excess Social Security and Tier 1 RRTA Tax Amount</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$FormData/ExcessSocSecAndTier1RRTATaxAmt"/>
                    </xsl:call-template>
                  </div>
                  <img alt="bullet" src="{$ImagePath}/1040A_Bullet.gif" style="float:right;margin-right:1mm;"/>
                </div>
                <div class="styLNRightNumBox" style="border:none;font-weight:normal;">41</div>
                <div class="styLNAmountBox" style="border:none;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt"/>
                    <xsl:with-param name="BackupName">IRS1040ATotalPaymentsAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <!-- End Line 41 -->
            </div>
            <!-- END Right Column -->
          </div>
          <!-- END Tax, credits, payments section -->
          
          <!-- BEGIN Refund section -->
          <div style="width:187mm;border-bottom:1px solid black;">
            <!-- BEGIN Left Column -->
            <div style="width:24.5mm;float:left;clear:none;">
              <div style="margin:2mm 0mm;">
                <span class="styMainTitle" style="font-size:11pt;">Refund</span>
              </div>
              <div style="margin:3mm 0mm;">
                 Direct deposit? See instructions and fill in 43b, 43c, and 43d or Form 8888.
              </div>
            </div>
            <!-- END Left Column -->
            <!-- BEGIN Right Column -->
            <div style="width:162.5mm;float:left;clear:none;">
              <!-- Line 42 -->
              <div class="sty1040ALongLine">
                <div class="styLNLeftNumBox" style="width:4mm;">42</div>
                <div style="width:117.5mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                  <span style="float:left;clear:none;">
                    If line 41 is more than line 35, subtract line 35 from line 41.<br/>
                    This is the amount you <b>overpaid.</b>
                  </span>
                  <div style="float:left;clear:none;padding-left:1mm">
                    <!-- Form to Form Link -->
                  </div>
                </div>
                <div class="styLNRightNumBox" style="border:none;font-weight:normal;padding-top:3mm;">42</div>
                <div class="styLNAmountBox" style="border:none;padding-top:3mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/OverpaidAmt"/>
                    <xsl:with-param name="BackupName">IRS1040AOverpaidAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <!-- End Line 42 -->
              <!-- Line 43a -->
              <div style="width:162.5mm;">
                <div class="sty1040AShortLine" style="width:4mm;border-bottom:none;font-weight:bold;padding-left:1mm;">43a</div>
                <div class="sty1040AShortLine" style="width:114.5mm;margin-left:1.5mm;">
                  <span style="float:left;clear:none;font-size:6pt;padding-top:.5mm;">
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$FormData/Form8888Ind"/>
                        <xsl:with-param name="BackupName">IRS1040AForm8888Ind</xsl:with-param>
                      </xsl:call-template>
                      Amount of line 42 you want <b>refunded to you.</b> If Form 8888 is attached, check here
                    </label>
                   </span>
                  <div style="float:left;clear:none;padding-left:1mm">
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/Form8888Ind"/>
                    </xsl:call-template>
                  </div>
                  <input type="checkbox" class="styCkbox" style="float:right;padding:0;margin:0;height:15px;width:15px;">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$FormData/Form8888Ind"/>
                      <xsl:with-param name="BackupName">IRS1040AForm8888Ind</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <img alt="bullet" src="{$ImagePath}/1040A_Bullet.gif" style="float:right;clear:none;margin-right:1mm;"/>
                </div>
                <div class="styLNRightNumBox" style="border:none;font-weight:normal;padding-top:1mm;">43a</div>
                <div class="styLNAmountBox" style="border:none;padding-top:1mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/RefundAmt"/>
                    <xsl:with-param name="BackupName">IRS1040ARefundAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <!--End Line 43a -->
              <!-- Line 43b -->
              <div style="width:162.5mm;">
                <div class="styLNLeftNumBox" style="width:9.3mm;">
                  <img src="{$ImagePath}/1040A_Bullet.gif" alt="Right pointing arrowhead image" style="margin-right:1mm;"/>b
                </div>
                <div style="width:116mm;padding-top:.5mm;padding-left:1mm;float:left;clear:none;">
                  <span style="float:left;clear:none;">
                     Routing number
                  </span>
                  <span style="width:3mm;float:left;clear:none;"/>  
                  <span class="styLNCtrNumBox" style="width:34mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/RoutingTransitNumber"/>
                      <xsl:with-param name="BackupName">IRS1040ARoutingTransitNumber</xsl:with-param>
                    </xsl:call-template>
                  </span>
                  <span style="width:7px;"/>
                  <img src="{$ImagePath}/1040A_Bullet.gif" alt="Right pointing arrowhead image"/>
                  <span style="width:4px;"/>
                  <span class="styBoldText">c</span> Type:
                    <span style="width:4px;"/>
                  <input type="checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateEnumeratedCheckbox">
                      <xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
                      <xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
                      <xsl:with-param name="BackupName">IRS1040ABankAccountTypeCd[1]</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
                      <xsl:with-param name="DisplayedCheckboxValue" select="1"/>
                      <xsl:with-param name="BackupName">IRS1040ABankAccountTypeCd[1]</xsl:with-param>
                    </xsl:call-template>
                    Checking
                  </label>
                  <input type="checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateEnumeratedCheckbox">
                      <xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
                      <xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
                      <xsl:with-param name="BackupName">IRS1040ABankAccountTypeCd[2]</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
                      <xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
                      <xsl:with-param name="BackupName">IRS1040ABankBankAccountTypeCd[2]</xsl:with-param>
                    </xsl:call-template>
                    Savings
                  </label>
                </div>
              </div>
              <!--End Line 43b -->
              <!-- Line 43d -->
              <div style="width:162.5mm;">
                <div class="styLNLeftNumBox" style="width:9.3mm;">
                  <img src="{$ImagePath}/1040A_Bullet.gif" alt="Right pointing arrowhead image" style="margin-right:1mm;"/>d
                </div>
                <div style="width:116mm;padding-top:.5mm;padding-left:1mm;float:left;clear:none;">
                  <span style="float:left;clear:none;">
                     Account number
                    </span>
                  <span style="width:7px;float:left;clear:none;"/>
                  <span class="styLNCtrNumBox" style="width:84mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/DepositorAccountNumber"/>
                      <xsl:with-param name="BackupName">IRS1040ADepositorAccountNumber</xsl:with-param>
                    </xsl:call-template>
                  </span>
                </div>
              </div>
              <!--End Line 43d -->
              <!-- Line 44 -->
              <div class="sty1040ALongLine" style="border-bottom:none;">
                <div class="styLNLeftNumBox" style="width:4mm;">44</div>
                <div style="width:85mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                  <span style="float:left;clear:none;">
                     Amount of line 42 you want <b>applied to your<br/>2012 estimated tax.</b>
                  </span>
                  <div style="float:left;clear:none;padding-left:1mm">
                    <!-- Form to Form Link -->
                    <xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$FormData/AppliedToEsTaxAmt"/>
                    </xsl:call-template>
                  </div>
                </div>
                <div class="styLNRightNumBox" style="border:none;font-weight:normal;padding-top:3mm;">44</div>
                <div class="styLNAmountBox" style="border:none;padding-top:3mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/AppliedToEsTaxAmt"/>
                    <xsl:with-param name="BackupName">IRS1040AAppliedToEsTaxAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <!--End Line 44 -->
            </div>
            <!-- END Right Column -->
          </div>
          <!-- END Refund section -->
          <!-- BEGIN Amt Owed section -->
          <div style="width:187mm;border-bottom:2px solid black;padding-top:1mm;">
            <!-- BEGIN Left Column -->
            <div style="width:24.5mm;float:left;clear:none;">
              <div style="margin:1mm 0mm;">
                <span class="styMainTitle" style="font-size:11pt;">Amount<br/>you owe</span>
              </div>
            </div>
            <!-- END Left Column -->
            <!-- BEGIN Right Column -->
            <div style="width:162.5mm;float:left;clear:none;">
              <!-- Line 45 -->
              <div class="sty1040ALongLine">
                <div class="styLNLeftNumBox" style="width:4mm;">45</div>
                <div style="width:117.5mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                  <span style="float:left;clear:none;">
                    <b>Amount you owe.</b> Subtract line 41 from line 35. For details on how to pay,<br/>see instructions.
                  </span>
                  <div style="float:left;clear:none;padding-left:1mm">
                    <!-- Form to Form Link -->
                  </div>
                  <img alt="bullet" src="{$ImagePath}/1040A_Bullet.gif" style="float:right;margin-right:1mm;margin-top:3mm;"/>
                </div>
                <div class="styLNRightNumBox" style="border:none;font-weight:normal;padding-top:3mm;">45</div>
                <div class="styLNAmountBox" style="border:none;padding-top:3mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/AmountOwedAmt"/>
                    <xsl:with-param name="BackupName">IRS1040AAmountOwedAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <!-- End Line 45 -->
              <!-- Line 46 -->
              <div class="sty1040ALongLine" style="border-bottom:none;">
                <div class="styLNLeftNumBox" style="width:4mm;">46</div>
                <div style="width:85mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
                  <span style="float:left;clear:none;">
                    Estimated tax penalty (see instructions).
                  </span>
                  <div style="float:left;clear:none;padding-left:1mm">
                    <!-- Form to Form Link -->
                  </div>
                </div>
                <div class="styLNRightNumBox" style="border:none;font-weight:normal;">46</div>
                <div class="styLNAmountBox" style="border:none;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/EsPenaltyAmt"/>
                    <xsl:with-param name="BackupName">IRS1040AEsPenaltyAmt</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
              <!--End Line 46 -->
            </div>
            <!-- END Right Column -->
          </div>
          <!-- END Amt Owed section -->
          <!-- BEGIN 3rd party designee -->
          <div style="width:187mm;padding-top:1mm;border-bottom:1px solid black">
            <!-- BEGIN Left Column -->
            <div style="width:22mm;float:left;clear:none;">
              <div style="padding-top:1mm;padding-bottom:0mm;">
                <span class="styMainTitle" style="font-size:11pt;">
                   Third Party
                   Designee                
                </span>
              </div>
            </div>
            <!-- END Left Column -->
            <!-- BEGIN Right Column -->
            <xsl:variable name="TPDesignee" select="$FormData"/>
            <div style="float:left;clear:none;width:165mm;">
              <div style="font-size:6.3pt;float:left;clear:none;padding-left:2mm;">Do you want to allow another person to discuss this return with the IRS
                (see instructions) ?
              </div>
              <div style="float:left;clear:none;padding-left:1mm;">
                <!-- Checkbox -->
                <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$TPDesignee/ThirdPartyDesigneeInd"/>
                    <xsl:with-param name="BackupName">TPDesigneeThirdPartyDesigneeInd</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$TPDesignee/ThirdPartyDesigneeInd"/>
                    <xsl:with-param name="BackupName">TPDesigneeThirdPartyDesigneeInd</xsl:with-param>
                  </xsl:call-template>
                  <span class="styBoldText" style="padding-left:1mm;">Yes.</span> 
                   Complete the following.
                </label>
              </div>
              <div style="float:left;clear:none;padding-left:1mm;">
                <!-- Checkbox -->
                <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$TPDesignee/ThirdPartyDesigneeInd"/>
                    <xsl:with-param name="BackupName">TPDesigneeThirdPartyDesigneeInd</xsl:with-param>
                  </xsl:call-template>
                  <!-- To Do: insert populate code and uncomment -->
                </input>
                <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$TPDesignee/ThirdPartyDesigneeInd"/>
                    <xsl:with-param name="BackupName">TPDesigneeThirdPartyDesigneeInd</xsl:with-param>
                  </xsl:call-template>
                  <span class="styBoldText" style="padding-left:1mm;">No</span>
                </label>
              </div>
            </div>
            <div style="height:9mm;float:left;clear:none;width:165mm;padding-top:2mm;">
              <div style="height:7mm;float:left;clear:none;width:18mm;padding-left:2mm;">Designee's name
                <span style="width:18px;"/>
                <img src="{$ImagePath}/1040A_Bullet.gif" alt="Right pointing arrowhead image"/>
              </div>
              <div style="width:46mm;float:left;clear:none;padding-top:3mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$TPDesignee/ThirdPartyDesigneeName"/>
                <xsl:with-param name="BackupName">TPDesigneeThirdPartyDesigneeName</xsl:with-param>
              </xsl:call-template>
              </div>
              <div style="float:left;clear:none;width:13mm;padding-left:.5mm;">
                Phone<br/>
                no.
                <span style="width:18px;"/>
                <img src="{$ImagePath}/1040A_Bullet.gif" alt="Right pointing arrowhead image"/>
              </div>
              <div style="float:left;clear:none;width:29mm;padding-top:3mm;">
                <xsl:call-template name="PopulatePhoneNumber">
                  <xsl:with-param name="TargetNode" select="$TPDesignee/ThirdPartyDesigneePhone"/>
                  <xsl:with-param name="BackupName">TPDesigneeThirdPartyDesigneePhone</xsl:with-param>
                </xsl:call-template>
              </div>
              <div style="float:left;clear:none;width:35mm;padding-left:.5mm;">
                Personal identification number (PIN)
                <span style="width:12mm;"/>
                <img src="{$ImagePath}/1040A_Bullet.gif" alt="Right pointing arrowhead image"/>
              </div>
              <div style="height:5mm;width:24mm;float:left;clear:none;">
                <div class="styLNCtrNumBox" style="float:right;width:23mm;border-top-width:1px;padding-top:1mm;">
                  <xsl:call-template name="PopulatePin">
                    <xsl:with-param name="TargetNode" select="$TPDesignee/ThirdPartyDesigneePIN"/>
                    <xsl:with-param name="BackupName">TPDesigneeThirdPartyDesigneePIN</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- END Right Column -->
          </div>
          <!-- END 3rd party designee -->
          <!-- BEGIN Signature -->
          <div style="width:187mm;padding-top:1mm;border-bottom:1px solid black">
            <!-- BEGIN Left Column -->
            <div style="width:18mm;float:left;">
              <div class="styMainTitle" style="font-size:11pt;">Sign<br/>Here</div>
              <div style="margin-top:1mm;">
                Joint return?<br/>
                See page 13.<br/>
                Keep a copy<br/>
                for your<br/>
                records.
              </div>
            </div>
            <!-- END Left Column -->
            <!-- BEGIN Right Column -->
            <div style="float:left;clear:none;width:169mm;">
              <div style="width:169mm;font-size:7pt;font-family:Arial-Narrow;margin-bottom:1mm;">
                Under penalties of perjury, I declare that I have examined this return and accompanying schedules and statements, and to the best of my knowledge
                and belief, they are true, correct, and accurately list all amounts and sources of income I received during the tax year. Declaration of preparer (other
                than the taxpayer) is based on all information of which the preparer has any knowledge.
              </div>
              <div style="width:169mm;">
                <img src="{$ImagePath}/1040_Bullet_SuperLg.gif" alt="Right pointing arrowhead image" style="float:left;margin-top:1mm;"/>
                <div style="width:163mm;height:6mm;border-bottom:1px solid black;float:left;clear:none;">
                  <div style="width:71mm;float:left;clear:none;">
                    <div class="styFNBox" style="width:71mm;float:left;clear:none;">
                      Your signature
                    </div>
                    <div class="styFNBox" style="height:8mm;width:71mm;padding-top:1.5mm;float:left;clear:none;">
                      <xsl:call-template name="PopulatePin">
                        <xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignature"/>
                        <xsl:with-param name="BackupName">$RtnHdrDataPrimarySignature</xsl:with-param>
                      </xsl:call-template>
                    </div>
                  </div>
                  <div class="styFNBox" style="width:18mm;float:left;clear:none;">
                    <div style="width:16mm;padding-left:2mm;float:left;clear:none;">
                    Date
                    </div>
                    <div style="height:8mm;width:18mm;padding-top:.5mm;text-align:center;float:left;clear:none;">
                      <xsl:call-template name="PopulateMonthDayYear">
                        <xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignatureDate"/>
                        <xsl:with-param name="BackupName">$RtnHdrDataPrimarySignatureDate</xsl:with-param>
                      </xsl:call-template>
                    </div>
                  </div>
                  <div class="styFNBox" style="width:36mm;height:6mm;float:left;clear:none;">
                    <div style="width:36.8mm;padding-left:2mm;float:left;clear:none;">
                      Your occupation
                    </div>
                    <div style="height:8mm;width:36mm;padding-top:1.5mm;padding-left:2mm;float:left;clear:none;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/PrimaryOccupation"/>
                        <xsl:with-param name="BackupName">IRS1040APrimaryOccupation</xsl:with-param>
                      </xsl:call-template>
                    </div>
                  </div>
                  <div class="" style="width:35mm;float:left;clear:none;height:9mm;">
                    <div style="width:35mm;padding-left:2mm;float:left;clear:none;">
                      Daytime phone number
                    </div>
                    <div style="height:8mm;width:35mm;padding-top:1.5mm;padding-left:2mm;float:left;clear:none;">
                      <!-- Taxpayer Daytime Telephone Number -->
                      <xsl:call-template name="PopulatePhoneNumber">
                        <xsl:with-param name="TargetNode" select="$FormData/DaytimePhoneNumber"/>
                        <xsl:with-param name="BackupName">IRS1040ADaytimePhoneNumber</xsl:with-param>
                      </xsl:call-template>
                      <!-- Optional Foreign Telephone Number -->
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/OptionalForeignTelephoneNumber"/>
                        <xsl:with-param name="BackupName">IRS1040AForeignTelephoneNumber</xsl:with-param>
                      </xsl:call-template>
                    </div>
                  </div>
                </div>
                <div style="width:163mm;float:left;clear:none;">
                  <div style="width:71mm;float:left;clear:none;">
                    <div class="styFNBox" style="width:71mm;float:left;clear:none;">
                    Spouse's signature. If a joint return,<span class="styBoldText"> both</span> must sign.
                    </div>
                    <div class="styFNBox" style="height:9.2mm;width:71mm;padding-top:1.5mm;float:left;clear:none;">
                      <xsl:call-template name="PopulatePin">
                        <xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignature"/>
                        <xsl:with-param name="BackupName">$RtnHdrDataSpouseSignature</xsl:with-param>
                      </xsl:call-template>
                    </div>
                  </div>
                  <div class="styFNBox" style="width:18mm;float:left;clear:none;">
                    <div style="width:16mm;padding-left:2mm;float:left;clear:none;">
                    Date
                  </div>
                    <div style="height:9.2mm;width:18mm;padding-top:1.5mm;text-align:center;float:left;clear:none;">
                      <xsl:call-template name="PopulateMonthDayYear">
                        <xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignatureDate"/>
                        <xsl:with-param name="BackupName">$RtnHdrDataSpouseSignatureDate</xsl:with-param>
                      </xsl:call-template>
                    </div>
                  </div>
                  <div class="styFNBox" style="width:36mm;float:left;clear:none;border-right-width:0;">
                    <div style="width:36.8mm;padding-left:2mm;float:left;clear:none;">
                    Spouse's occupation
                  </div>
                    <div style="height:8mm;width:36mm;padding-top:1.5mm;padding-left:2mm;float:left;clear:none;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/SpouseOccupation"/>
                        <xsl:with-param name="BackupName">IRS1040ASpouseOccupation</xsl:with-param>
                      </xsl:call-template>
                    </div>
                  </div>
                  <div class="styFNBox" style="width:34mm;float:left;border-right-width:0;clear:none;border-left:1px solid black">
                    <div style="width:34mm;padding-left:2mm;float:left;clear:none;">
                    Identity Protection PIN (see inst.)
                  </div>
                    <div style="width:34mm;padding-top:0.5mm;height:6.2mm;padding-left:2mm;float:left;clear:none;">
                      <xsl:call-template name="PopulatePin">
                        <xsl:with-param name="TargetNode" select="$RtnHdrData/IdentityProtectionPIN"/>
                        <xsl:with-param name="BackupName">RtnHdrDataIdentityProtectionPIN</xsl:with-param>
                      </xsl:call-template>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- END Right Column -->
          </div>
          <!-- END Signature -->
          <!-- BEGIN paid preparer -->
          <div class="styBB" style="width:187mm;font-size:6pt;">
            <div style="width:22.75mm;padding-top:4mm;float:left;clear:none;">
              <span class="styMainTitle" style="font-size:11pt;">
                  Paid
                  preparer
                  use only
                  </span>
            </div>
            <div style="width:164mm;float:left;clear:none;">
              <div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
                <div class="styLNDesc" style="height:6mm;width:46.8mm;padding-top:0mm;border-right:1 solid black;">
                Print/type preparer's name<br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformation/PreparerPersonName"/>
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
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformation/SelfEmployed"/>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
                    </xsl:call-template>
                    Check 
                    <input class="styCkbox" type="checkbox" style="width:4mm;">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformation/SelfEmployed"/>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
                      </xsl:call-template>
                    </input>
                    <span style="width:4px;"/>if<br/>self-employed
                  </label>
                </div>
                <div class="styLNDesc" style="height:6mm;width:16mm;padding-top:0mm;padding-left:1mm;">PTIN
                             <br/>
                  <xsl:if test="$RtnHdrData/PaidPreparerInformation/PreparerSSN">
                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                      <xsl:with-param name="TargetNode">PreparerSSN</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerSSN</xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="$RtnHdrData/PaidPreparerInformation/PTIN">
                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                      <xsl:with-param name="TargetNode">PTIN</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPTIN</xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="$RtnHdrData/PaidPreparerInformation/STIN">
                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                      <xsl:with-param name="TargetNode">STIN</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSTIN</xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>
                </div>
              </div>
              <div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
                <div class="styLNDesc" style="height:6mm;width:108.5mm;border-right:1 solid black;">
                  <span class="styGenericDiv" style="">Firm's name 
                  <span style="width:2.2mm;"/>
                    <img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
                    <span style="width:4px;"/>
                  </span>
                  <div class="styGenericDiv" style="padding-right:.5mm;">
                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                      <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName1</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                      <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName2</xsl:with-param>
                    </xsl:call-template>
                  </div>
                </div>
                <div class="styLNDesc" style="height:6mm;width:32mm;padding-left:1mm;">Firm's EIN
                <img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
                  <span style="width:4px;"/>
                  <xsl:if test="$RtnHdrData/PaidPreparerInformation/PreparerFirmIDNumber">
                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                      <xsl:with-param name="TargetNode">PreparerFirmIDNumber</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerFirmIDNumber</xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="$RtnHdrData/PaidPreparerInformation/MissingEINReason">
                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                      <xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationMissingEINReason</xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>
                </div>
              </div>
              <div style="width:164mm;float:left;clear:none;">
                <div class="styLNDesc" style="width:108.5mm;border-right:1 solid black;">
                  <div class="styGenericDiv" style="padding-right:.5mm;">Firm's address 
                  <img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
                  </div>
                  <div class="styGenericDiv" style="padding-right:.5mm;">
                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                      <xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine1</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                      <xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine2</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                    <xsl:if test="$RtnHdrData/PaidPreparerInformation/PreparerUSAddress">
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">City</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressCity</xsl:with-param>
                      </xsl:call-template>,
                      <span style="width:2px;"/>
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">State</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressState</xsl:with-param>
                      </xsl:call-template>,
                      <span style="width:2px;"/>
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">ZIPCode</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressZip</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="$RtnHdrData/PaidPreparerInformation/PreparerForeignAddress">
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">City</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignAddressCity</xsl:with-param>
                      </xsl:call-template>,
                      <span style="width:2px;"/>
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">ProvinceOrState</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignProvinceOrState</xsl:with-param>
                      </xsl:call-template>,
                      <span style="width:2px;"/>
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">PostalCode</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPostalCode</xsl:with-param>
                      </xsl:call-template>,
                      <span style="width:2px;"/>
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">Country</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignCountry</xsl:with-param>
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
          <!-- END paid preparer -->
          <!--Page Footer-->
          <div class="pageEnd" style="width:187mm; font-size:7pt;border-top:1 solid black; padding-top:0.5mm;text-align:right;">
            Form <b style="font-size:7pt">1040A</b> (2011)
          </div>
          <!--END Page Footer-->
          <!-- Additonal Data Title Bar and Button -->
          <div class="styLeftOverTitleLine" id="LeftoverData">
            <div class="styLeftOverTitle">
              Additional Data        
            </div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
            </div>
          </div>
          <!-- Additional Data Table -->
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$FormData"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Top Right Margin - Primary Date Of Death</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/PrimaryDateOfDeath"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Top Right Margin - Spouse Date Of Death</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/SpouseDateOfDeath"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:choose>
              <xsl:when test="$FormData/SpecialProcessingLiteralCd">
                <xsl:call-template name="PopulateLeftoverRow">
                  <xsl:with-param name="Desc">Top Right Margin - Special Processing Literal Code</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$FormData/SpecialProcessingLiteralCd"/>
                  <xsl:with-param name="DescWidth" select="100"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:when test="$FormData/SpecialProcessingLiteralCd2">
                <xsl:call-template name="PopulateLeftoverRow">
                  <xsl:with-param name="Desc">Top Right Margin - Special Processing Literal</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$FormData/SpecialProcessingLiteralCd2"/>
                  <xsl:with-param name="DescWidth" select="100"/>
                </xsl:call-template>
                <xsl:call-template name="PopulateLeftoverRow">
                  <xsl:with-param name="Desc">Top Right Margin - Combat Zone Date</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$FormData/SpecialProcessingLiteralCd2/@combatZoneDate"/>
                  <xsl:with-param name="DescWidth" select="100"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:when test="$FormData/SpecialProcessingCodeTxt">
                <xsl:call-template name="PopulateLeftoverRow">
				  <xsl:with-param name="TargetNode" select="$FormData/SpecialProcessingCodeTxt"/>
                  <xsl:with-param name="Desc">Top Right Margin - Special Processing Code Text</xsl:with-param>
                  <xsl:with-param name="DescWidth" select="100"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise/>
            </xsl:choose>
            <xsl:call-template name="PopulateLeftoverRow">
				<xsl:with-param name="Desc">Top Right Margin - Protective Section 108i ELC Record Indicator</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$FormData/ProtectiveSec108iELCRecordInd"/>
				<xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Top Right Margin - Signed by Power Of Attorney Checkbox</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneySignedBy"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Top Right Margin - Power Of Attorney Name</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneyName"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Top Right Margin - Non Paid Preparer Code</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/NonPaidPreparerCd"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Top Right Margin - Refund Anticipation Loan Code</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/RefundAnticipationLoanCd"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Top Right Margin - Community Property Return Indicator</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/CommPropStateRtnInd"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Top Right Margin - Surviving Spouse Indicator</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/SurvivingSpouseInd"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Top Right Margin - Personal Representative</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/PersonalRepresentativeInd"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
				<xsl:with-param name="Desc">Header Area - Primary Name Control</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNameControl"/>
				<xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
				<xsl:with-param name="Desc">Header Area - Spouse Name Control</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseNameControl"/>
				<xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 4 - Qualifying HOH SSN</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/QualifyingHOHSSN"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
				<xsl:with-param name="Desc">Line 6b - Exempt Spouse Name Control</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseNameControl"/>
				<xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:if test="($Print != $Separated) or (count($FormData/DependentInformations) &lt;= 6)">
				<xsl:for-each select="$FormData/DependentInformations">
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Line 6c - Dependent <xsl:number value="position()"/> Name Control</xsl:with-param>
						<xsl:with-param name="TargetNode" select="DependentNameControl"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
				</xsl:for-each>
            </xsl:if>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 7 - Wages Not Shown Literal Only Code</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/WagesSalariesAndTipsAmt/@wagesNotShownLitOnlyCd"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 11b - IRS Distributions Literal Code</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/IRADistributionsLiteralCd"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 12b - Foreign Employer Pension Code</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/ForeignEmployerPensionCd"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRowAmount">
              <xsl:with-param name="Desc">Line 12b - Taxable Foreign Pensions Total</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/TaxableForeignPensionsTotalAmt"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 12b - Pensions and Annuities Literal Code</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/TotalTaxablePensionsAmt/@pensionsAnnuitiesLiteralCd"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 13 - Repayment Code</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/UnemploymentCompAmt/@repaymentCd"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRowAmount">
              <xsl:with-param name="Desc">Line 13 - Repayment Amount</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/UnemploymentCompAmt/@repaymentAmt"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 14a - Social Security Benefit Code</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/SocSecBnftAmt/@socSecBnftCd"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 17 - IRA Deduction Code</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/IRADeductionCd"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 24 - Modified Standard Deduction Indicator</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/TotalItemizedOrStandardDedAmt/@modifiedStandardDeductionInd"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 28 - Alternative Minimum Tax Code</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/AlternativeMinimumTaxAmt/@alternativeMinimumTaxCd"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRowAmount">
              <xsl:with-param name="Desc">Line 28 - Alternative Minimum Tax Amount</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/AlternativeMinimumTaxAmt"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 37 - Divorced Spouse SSN</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@divorcedSpouseSSN"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 37 - Divorced Literal Code</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@divorcedLiteralCd"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 38a - EIC Eligibility Code</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/EICEligibilityLiteralCd"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 41 - Request for Extension Code</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/RequestForExtensionAmt/@requestForExtensionCd"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRowAmount">
              <xsl:with-param name="Desc">Line 41 - Request for Extension Amount</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/RequestForExtensionAmt"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 41 - Excess Social Security and Tier 1 RRTA Tax Code</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/ExcessSocSecAndTier1RRTATaxAmt/@excessSocSecAndTier1RRTATaxCd"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRowAmount">
              <xsl:with-param name="Desc">Line 41 - Excess Social Security and Tier 1 RRTA Tax Amount</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/ExcessSocSecAndTier1RRTATaxAmt"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
          <br/>
          <xsl:if test="($Print = $Separated) and (count($FormData/DependentInformations) &gt; 6)">
            <span class="styRepeatingDataTitle">Form 1040A Line 6c - Dependents</span>
            <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th class="styDepTblCell" scope="col" rowspan="2" style="text-align:left;width:74.4mm;">
                    <span style="font-weight:bold;">Dependents:</span>
                    <br/>
                    <br/>
                    <br/>
                    <span class="styNormalText">
                           (1) First name
                              <span style="width:32px;"/> 
                              Last name
                              <span style="width:27px;"/> 
                              Name Control
                           </span>
                  </th>
                  <th class="styDepTblCell" scope="col" rowspan="2" style="width:30.2mm;">
                    <br/>
                    <span style="font-weight:bold;">(2)</span>
                    <span class="styNormalText">
                           Dependent's
                           social security number
                           </span>
                  </th>
                  <th class="styDepTblCell" scope="col" rowspan="2" style="width:20.6mm;">
                    <span style="font-weight:bold;">(3)</span>
                    <span class="styNormalText">
                           Dependent's
                           relationship to
                           you
                           </span>
                  </th>
                  <th class="styDepTblCell" scope="col" rowspan="2" style="width:18.6mm;">
                    <span style="font-weight:bold;">(4)</span>
                    <span class="styNormalText">
                           if child under age 17 qualifying for child tax credit (see instructions)
                           </span>
                  </th>
                </tr>
              </thead>
              <tbody>
                <xsl:for-each select="$FormData/DependentInformations">
                  <tr style="border-color:black;height:6mm;">
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <td class="styTableCellText" style="width:75.4mm;">
                      <div style="float:left;clear:none;width:5mm;">
                        <span style="text-align:right;float:left;width:4.25mm;font-weight:bold;" class="styGenericDiv">
                          <xsl:number value="position()" format="1"/>
                        </span>
                      </div>
                      <div style="padding-left:1mm;float:left;clear:none;width:70mm;">
                        <span style="width:22mm;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="DependentFirstName"/>
                            <xsl:with-param name="BackupName">IRS1040ADependentInformationsDependentFirstName</xsl:with-param>
                          </xsl:call-template>
                        </span>
                        <span style="width:5px;"/>
                        <span style="width:25mm;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="DependentLastName"/>
                            <xsl:with-param name="BackupName">IRS1040ADependentInformationsDependentLastName</xsl:with-param>
                          </xsl:call-template>
                        </span>
                        <span style="width:5px;"/>
                        <span style="width:5mm;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="DependentNameControl"/>
                            <xsl:with-param name="BackupName">IRS1040ADependentInformationsDependentNameControl</xsl:with-param>
                          </xsl:call-template>
                        </span>
                        
                      </div>
                    </td>
                    <td class="styTableCellText" style="text-align:center;width:30.2mm;">
                      <xsl:call-template name="PopulateSSN">
                        <xsl:with-param name="TargetNode" select="DependentSSN"/>
                        <xsl:with-param name="BackupName">IRS1040ADependentInformationsDependentSSN</xsl:with-param>
                      </xsl:call-template>
                      <xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="DiedLiteralCd"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellText" style="width:20.6mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="DependentRelationship"/>
                        <xsl:with-param name="BackupName">IRS1040ADependentInformationsDependentRelationship</xsl:with-param>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellText" style="text-align:center;width:18.6mm;">
                      <!-- Checkbox -->
                      <input type="Checkbox" class="styCkbox">
                        <xsl:call-template name="PopulateCheckbox">
                          <xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
                          <xsl:with-param name="BackupName">IRS1040ADependentInformationsEligibleForChildTaxCreditInd</xsl:with-param>
                        </xsl:call-template>
                      </input>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:if>
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
