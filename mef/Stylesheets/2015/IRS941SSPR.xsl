<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS941SSPRStyle.xsl"/>
  <xsl:param name="FormData" select="$RtnDoc/IRS941SSPR"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:template match="/">
    <xsl:if test="$Language='ENGLISH'">
		<xsl:call-template name="IRS941SS"/>
    </xsl:if>
    <xsl:if test="$Language='SPANISH'">
        <xsl:call-template name="IRS941PR"/>
    </xsl:if>
  </xsl:template>
  <!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
  <xsl:template name="IRS941SS">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($FormData)"/>
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
        <meta name="Description" content="IRS Form 941SSPR"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS941SSPRStyle"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass" style="width:187mm">
        <form name="IRS941SSPR" style="font-family:arial;">
          <!--  Begin Header-->
          <div class="styGenericDiv" style=" width:187mm;">
          <xsl:call-template name="DocumentHeader"/>
          </div>
          <div class="styBB" style="width:187mm;border-bottom-width:0px;">
			<xsl:call-template name="SetFormLinkInline">
				<xsl:with-param name="TargetNode" select="$FormData"/>
			</xsl:call-template>
			<xsl:call-template name="SetFormLinkInline">
				<xsl:with-param name="TargetNode" select="$RtnDoc/BinaryAttachment"/>
			</xsl:call-template>
			<xsl:call-template name="SetFormLinkInline">
				<xsl:with-param name="TargetNode" select="$RtnDoc/GeneralDependencySmall"/>
			</xsl:call-template>
			<xsl:call-template name="SetFormLinkInline">
				<xsl:with-param name="TargetNode" select="$RtnDoc/FinalPayrollInfoStatement"/>
			</xsl:call-template>
			<xsl:call-template name="SetFormLinkInline">
				<xsl:with-param name="TargetNode" select="$RtnDoc/TransferOfBusinessStatement"/>
			</xsl:call-template>
			<xsl:call-template name="SetFormLinkInline">
				<xsl:with-param name="TargetNode" select="$RtnDoc/IRS941ScheduleR"/>
			</xsl:call-template>
			<xsl:call-template name="SetFormLinkInline">
				<xsl:with-param name="TargetNode" select="$RtnDoc/IRS941ScheduleD"/>
			</xsl:call-template>
			<br/>
            <div class="styFNBox" style="width:51mm;height:12mm;border:0px;">
				Form
				<span class="styFormNumber" style="font-size:15pt;">
					<xsl:if test="/AppData/Parameters/SubmissionType='941SS'">941-SS</xsl:if>
					<xsl:if test="/AppData/Parameters/SubmissionType='941PR'"><xsl:attribute name="style">font-size:11pt;</xsl:attribute>941-PR (ENG)</xsl:if>
                     for 2015:
                </span>
                <br/>
				<span class="styAgency">(Rev. January 2015)</span>
				<br/>
				<span class="styAgency">Department of the Treasury — Internal Revenue Service</span>
            </div>
            <div class="styFTBox" style="width:92mm;">
				<div class="styMainTitle" style="font-size:11pt;text-align:center;">
					Employer’s QUARTERLY Federal Tax Return
				</div>
				<div class="styFST" style="height:5mm;font-size:7.5pt;margin-left:2mm;text-align:center;width:100%;">
					<span style="text-align:center;font-weight:bold;width:93%;">
						American Samoa, Guam, the Commonwealth of the Northern
						Mariana Islands, and the U.S. Virgin Islands
                    </span>
				</div>
            </div>
           <div class="styTYBox" style="width:43.7mm;height:11mm;border:0px;">
              <div class="styOMB" style="height:11mm;font-size:7pt;text-align:right;border:0px;padding-top:8mm;">OMB No. 1545-0029</div>
           </div>
         </div>
         <div style="width:187mm;float:none;clear:both;">
           <div class="styBB" style="width:124mm;float:left;border:black solid 1px; padding-top:2mm; padding-left:2mm; padding-right:2mm;">
				<div style="width:118mm;padding-top:0mm;">
					<span style="float:left;padding-top:2mm;"><b>Employer identification number</b> (EIN)</span>
					<span class="styLNCtrNumBox" style="width:72mm;border-top-width:1px;padding-top:2mm;float:right;height:6mm;">
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">EIN</xsl:with-param>
							<xsl:with-param name="EINChanged">true</xsl:with-param>
						</xsl:call-template>
					</span>
				</div>
				<div style="width:118mm;padding-bottom:2mm;padding-top:2mm;">
					<span style="float:left;padding-top:4mm;"><b>Name</b><i> (not your trade name)</i></span>
					<span class="styLNCtrNumBox" style="width:85mm;border-top-width:1px;float:right;height:auto;text-align:left;padding-left:1mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
						</xsl:call-template><br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt"/>
						</xsl:call-template>
					</span>
				</div>
				<div style="width:118mm;padding-bottom:2mm;">
					<span style="float:left;padding-top:4mm;"><b>Trade name</b><i> (if any)</i></span>
					<span class="styLNCtrNumBox" style="width:94mm;border-top-width:1px;float:right;height:auto;text-align:left;padding-left:1mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/TradeName/BusinessNameLine1Txt"/>
						</xsl:call-template><br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/TradeName/BusinessNameLine2Txt"/>
						</xsl:call-template>
					</span>
				</div>
				<div style="width:118mm;padding-bottom:0mm;">
					<span style="width:12mm;height:15mm;float:left;padding-top:4mm;font-weight:bold;">Address</span>
						<span class="styLNCtrNumBox" style="width:106mm;border-top-width:1px;height:8mm;text-align:left;padding-left:1mm;">
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param> 
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
							</xsl:call-template>
						</span>
						<span style="width:106mm;font-size:6pt;padding-left:1mm;padding-bottom:0.2mm;">
							Number<span style="width:10mm"/>Street<span style="width:60mm;"/>Suite or room number
						</span>
						<span class="styLNCtrNumBox" style="width:67mm;border-top-width:1px;padding-top:2mm;height:6mm;text-align:left;padding-left:1mm;">
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">CityNm</xsl:with-param> 
							</xsl:call-template>
						</span>
						<span class="styLNCtrNumBox" style="width:1.5mm;float:left;border:none"/>
						<span class="styLNCtrNumBox" style="width:13mm;border-top-width:1px;padding-top:2mm;height:6mm;">
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param> 
							</xsl:call-template>
						</span>
						<span class="styLNCtrNumBox" style="width:1.5mm;float:left;border:none"/>
						<span class="styLNCtrNumBox" style="width:23mm;border-top-width:1px;padding-top:2mm;height:6mm;">
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
							</xsl:call-template>
						</span>
						<span style="width:106mm;font-size:6pt;padding-left:12mm;padding-bottom:0.2mm;">
							City<span style="width:68.5mm"/>State<span style="width:7mm;"/>ZIP code
						</span>
						<span style="width:118mm;padding-left:12mm">
						<span class="styLNCtrNumBox" style="width:36mm;height:6mm;border-top-width:1px;padding-top:2mm;text-align:left;padding-left:1mm;">
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">CountryCd</xsl:with-param> 
							</xsl:call-template>
						</span>
						<span class="styLNCtrNumBox" style="width:1.5mm;float:left;border:none"/>
						<span class="styLNCtrNumBox" style="width:33mm;height:6mm;border-top-width:1px;padding-top:2mm;">
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
							</xsl:call-template>
						</span>
						<span class="styLNCtrNumBox" style="width:1.5mm;float:left;border:none"/>
						<span class="styLNCtrNumBox" style="width:33.8mm;height:6mm;border-top-width:1px;padding-top:2mm;">
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
							</xsl:call-template>
						</span>
						<span style="width:106mm;font-size:6pt;padding-bottom:0.2mm;">
							<span style="width:37mm;padding-left:1mm;">Foreign country name</span>
							<span style="width:34mm;padding-left:1mm;">Foreign province/county</span>
							<span style="width:30mm;padding-left:1mm;">Foreign postal code</span>
						</span>
					</span>
				</div>
			</div>
			<div style="float:right;padding-right:2mm;">
				<div class="styBB" style="width:58mm;height:48mm;border-left-width:1px;border-right-width:1px;border-top-width:1px;padding-left:2mm;padding-top:2mm;">
					<div class="styPartName" style="width:53mm;height:9mm;text-align:left;padding-left:1mm;font-size:9pt;padding-top:1mm;padding-bottom:1mm;">Report for this 
					Quarter of 2015<br/>
					<span style="font-size:7pt;">(Check one.)</span>
					</div>
					<xsl:variable name="Date">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
						</xsl:call-template>
					</xsl:variable>
					<div style="width:53mm;float:none;clear:both;">
						<div style="width:53mm;float:none;clear:both;">
							<div style="width:53mm;padding-top:2mm;float:none;clear:both;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
								</xsl:call-template>
								<input type="checkbox" alt="FirstQuarter" class="styCkbox">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '03')"/>
										<xsl:with-param name="BackupName">IRS941SSQuarterEndingDt[1]</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-size:8pt;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '03')"/>
										<xsl:with-param name="BackupName">IRS941SSQuarterEndingDt[1]</xsl:with-param>
									</xsl:call-template>
									<span style="width:1mm;"/><b>1:</b> January, February, March
								</label>
							</div>
							<div style="width:53mm;">
								<div style="float:left;clear:none;padding-top:2mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
									</xsl:call-template>
									<input type="checkbox" alt="SecondQuarter" class="styCkbox">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '06')"/>
											<xsl:with-param name="BackupName">IRS941SSQuarterEndingDt[2]</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="font-size:8pt;">
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '06')"/>
											<xsl:with-param name="BackupName">IRS941SSQuarterEndingDt[2]</xsl:with-param>
										</xsl:call-template>
										<span style="width:1mm;"/><b>2:</b> April, May, June
									</label>
								</div>
							</div>
							<div style="width:53mm;">
								<div style="float:left;clear:none;padding-top:2mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
									</xsl:call-template>
									<input type="checkbox" alt="ThirdQuarter" class="styCkbox">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '09')"/>
											<xsl:with-param name="BackupName">IRS941SSQuarterEndingDt[3]</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="font-size:8pt;">
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '09')"/>
											<xsl:with-param name="BackupName">IRS941SSQuarterEndingDt[3]</xsl:with-param>
										</xsl:call-template>
										<span style="width:1mm;"/><b>3:</b> July, August, September
									</label>
								</div>
							</div>
							<div style="width:53mm;">
								<div style="float:left;clear:none;padding-top:2mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
									</xsl:call-template>
									<input type="checkbox" alt="FourthQuarter" class="styCkbox">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '12')"/>
											<xsl:with-param name="BackupName">IRS941SSQuarterEndingDt[4]</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="font-size:8pt;">
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '12')"/>
											<xsl:with-param name="BackupName">IRS941SSQuarterEndingDt[4]</xsl:with-param>
										</xsl:call-template>
										<span style="width:1mm;"/><b>4:</b> October, November, December
									</label>
								</div>
							</div>
						</div>
					</div>
					<div style="width:53mm;padding-bottom:0mm;padding-top:4mm;float:none;clear:both;font-size:7pt;">
						Instructions and prior year forms are available at <i>www.irs.gov/form941ss</i>.
					</div>
				</div>
			</div>
			<div class="styLNDesc" style="width:187mm;font-size:8pt;padding-bottom:0mm;">
				Read the separate instructions before you complete Form 941-SS. Type or print within the boxes.
			</div>
			<div class="styBB" style="width:187mm;border-top-width:1px;">
				<div class="styPartName" style="width:13mm;text-align:center;height:4mm;font-size:9pt;">Part 1:</div>
				<div class="styPartDesc" style="width:173.9mm;text-align:left;height:4mm;padding-left:2mm;font-size:9pt;">Answer these questions for this quarter.</div>
			</div>
			<div style="width:187mm;padding-left:0mm;padding-top:2mm;padding-bottom:0px;font-size:8pt;float:none;clear:both;">
				<!--Line 1-->
				<div style="width:187mm;height:8mm;">
					<span style="float:left;">
						<div class="styLNLeftNumBoxSD" style="width:8mm;">1</div>
						<div class="styLNDesc" style="width:134mm;padding-left:1mm;font-weight:bold;">
							Number of employees who received wages, tips, or other compensation for the pay period including: <i>
							Mar. 12</i> (Quarter 1), <i>June 12</i> (Quarter 2), <i>Sept. 12</i> (Quarter 3), <i>or Dec. 12</i> 
							(Quarter 4)
						</div>
					</span>
					<span style="float:right;padding-top:1.4mm;">
						<div class="styIRS941RightNumBox">1</div>
						<div class="styLNCtrNumBox" style="width:39mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:left;padding-right:1mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/EmployeeCnt"/>
							</xsl:call-template>
						</div>
					</span>
				</div>
				<!--Line 2-->
				<div style="width:187mm;height:6mm;">
					<div class="styLNLeftNumBoxSD" style="width:8mm;height:6mm;padding-top:0mm;">2</div>
					<div class="styLNDesc" style="width:179mm;height:7mm;background-color:gray;"/>
				</div>
				<!--Line 3-->
				<div style="width:187mm;height:3mm;">
					<div class="styLNLeftNumBoxSD" style="width:8mm;height:3mm;padding-bottom:0mm;">3</div>
					<div class="styLNDesc" style="width:179mm;height:3mm;padding-bottom:0mm;background-color:gray;"/>
				</div>
				<!--Line 4-->
				<div style="width:187mm;height:6mm;padding-top:1mm;">
					<div class="styLNLeftNumBoxSD" style="width:8mm;">4</div>
					<div class="styLNDesc" style="width:134mm;padding-left:1mm;font-weight:bold;">
						If no wages, tips, and other compensation are subject to social security or Medicare tax
					</div>
					<div class="styIRS941RightNumBox"/>
					<input type="checkbox" alt="WagesTipsCompensationNotSubjectToSocialSecurityOrMedicareTax" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/WagesNotSubjToSSMedcrTaxInd"/>
							<xsl:with-param name="BackupName">941SSWagesNotSubjToSSMedcrTaxInd</xsl:with-param>
						</xsl:call-template>
					</input>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="$FormData/WagesNotSubjToSSMedcrTaxInd"/>
							<xsl:with-param name="BackupName">941SSWagesNotSubjToSSMedcrTaxInd</xsl:with-param>
						</xsl:call-template>
						<b><span style="width:1mm;"/>Check and go to line 6.</b><br/>
					</label>
				</div>
				<!--Line 5 Header-->
				<div style="width:187mm">
					<div class="styLNDesc" style="width:144mm;font-style:italic;text-align:right;padding-right:10mm;">
						Column 1<span style="width:34mm;"/>Column 2
					</div>
				</div>
				<span style="height:28mm;">
				<!--Line 5a-->
				<div style="width:187mm;height:6mm;">
					<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:2.6mm;">5a</div>
					<div class="styLNDesc" style="width:136mm;padding-left:1mm;font-weight:bold;">
						<span style="float:left;padding-top:2mm;padding-bottom:0mm;">Taxable social security wages</span>
						<span style="float:right;">
							<div class="styLNCtrNumBox" style="width:33mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityWageAndTaxGrp/SocialSecurityTaxCashWagesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="width:14mm;text-align:center;font-weight:normal;padding-top:2mm;padding-bottom:0mm;">
								x .124 =
							</div>
							<div class="styLNCtrNumBox" style="width:33mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityWageAndTaxGrp/SocialSecurityTaxAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
				</div>
				<!--Line 5b-->
				<div style="width:187mm;height:6mm;">
					<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:2.6mm;">5b</div>
					<div class="styLNDesc" style="width:136mm;padding-left:1mm;font-weight:bold;">
						<span style="float:left;padding-top:2mm;padding-bottom:0mm;">Taxable social security tips</span>
						<span style="float:right;padding-top:1mm;">
							<div class="styLNCtrNumBox" style="width:33mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityTipsAndTaxGrp/TaxableSocSecTipsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="width:14mm;text-align:center;font-weight:normal;padding-top:2mm;padding-bottom:0mm;">
								x .124 =
							</div>
							<div class="styLNCtrNumBox" style="width:33mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityTipsAndTaxGrp/TaxOnSocialSecurityTipsAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
				</div>
				<!--Line 5c-->
				<div style="width:187mm;height:6mm;">
					<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:2.6mm;">5c</div>
					<div class="styLNDesc" style="width:136mm;padding-left:1mm;font-weight:bold;">
						<span style="float:left;padding-top:2mm;padding-bottom:0mm;">Taxable Medicare wages &amp; tips</span>
						<span style="float:right;padding-top:2mm;">
							<div class="styLNCtrNumBox" style="width:33mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MedicareWageTipsAndTaxGrp/TaxableMedicareWagesTipsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="width:14mm;text-align:center;font-weight:normal;padding-top:2mm;padding-bottom:0mm;">
								x .029 =
							</div>
							<div class="styLNCtrNumBox" style="width:33mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MedicareWageTipsAndTaxGrp/TaxOnMedicareWagesTipsAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
				</div>
				<!--Line 5d-->
				<div style="width:187mm;height:6mm;">
					<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:2.6mm;">5d</div>
					<div class="styLNDesc" style="width:136mm;padding-left:1mm;font-weight:bold;">
						<span style="float:left;padding-top:2mm;padding-bottom:0mm;">Taxable wages &amp; tips subject to<br/> 
						Additional Medicare Tax withholding</span>
						<span style="float:right;padding-top:3mm;">
							<div class="styLNCtrNumBox" style="width:33mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AddnlMedicareWageTipsAndTaxGrp/TxblWageTipsSubjAddnlMedcrAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="width:14mm;text-align:center;font-weight:normal;padding-top:2mm;padding-bottom:0mm;">
								x .009 =
							</div>
							<div class="styLNCtrNumBox" style="width:33mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AddnlMedicareWageTipsAndTaxGrp/TaxOnWageTipsSubjAddnlMedcrAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
				</div>
				</span>		
				<!--Line 5e-->
				<div style="width:187mm;height:7mm;">
					<span style="float:left;">
						<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:2.6mm;">5e</div>
						<div class="styLNDesc" style="width:134mm;padding-left:1mm;font-weight:bold;padding-top:2.6mm;">
							<span style="float:left;">Add Column 2 from lines 5a, 5b, 5c, and 5d</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
						</div>
					</span>
					<span style="float:right;">
						<div class="styIRS941RightNumBox">5e</div>
						<div class="styLNCtrNumBox" style="width:39mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalSSMdcrTaxAmt"/>
							</xsl:call-template>
						</div>
					</span>
				</div>
				<!--Line 5f-->
				<div style="width:187mm;height:7mm;">
					<span style="float:left;">
						<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:2.6mm;">5f</div>
						<div class="styLNDesc" style="width:134mm;padding-left:1mm;padding-top:2.6mm;">
							<span style="float:left;"><b>Section 3121(q) Notice and Demand—Tax due on unreported tips</b> (see instructions) </span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
						</div>
					</span>
					<span style="float:right;">
						<div class="styIRS941RightNumBox">5f</div>
						<div class="styLNCtrNumBox" style="width:39mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxOnUnreportedTips3121qAmt"/>
							</xsl:call-template>
						</div>
					</span>
				</div>
				<!--Line 6-->
				<div style="width:187mm;height:7mm;">
					<span style="float:left;">
						<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:2.6mm;">6</div>
						<div class="styLNDesc" style="width:134mm;padding-left:1mm;padding-top:2.6mm;">
							<span style="float:left;"><b>Total taxes before adjustments</b>. Add lines 5e and 5f </span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
						</div>
					</span>
					<span style="float:right;">
						<div class="styIRS941RightNumBox">6</div>
						<div class="styLNCtrNumBox" style="width:39mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTaxBeforeAdjustmentAmt"/>
							</xsl:call-template>
						</div>
					</span>
				</div>
				<!--Line 7-->
				<div style="width:187mm;height:7mm;">
					<span style="float:left;">
						<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:2.6mm;">7</div>
						<div class="styLNDesc" style="width:134mm;padding-left:1mm;font-weight:bold;padding-top:2.6mm;">
							<span style="float:left;">Current quarter’s adjustment for fractions of cents </span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
						</div>
					</span>
					<span style="float:right;">
						<div class="styIRS941RightNumBox">7</div>
						<div class="styLNCtrNumBox" style="width:39mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
							<!-- 7/9/2015 AM: Per KISAM IM02060648, choose statement added to properly display negative numbers and cents only.-->
							<xsl:choose>
								<xsl:when test="starts-with($FormData/CurrentQtrFractionsCentsAmt,'-') or starts-with($FormData/CurrentQtrFractionsCentsAmt,'.')">
									<span style="color:darkblue;">
										<xsl:call-template name="PlaceCommas">
											<xsl:with-param name="TargetNode" select="$FormData/CurrentQtrFractionsCentsAmt"/>
										</xsl:call-template>
									</span>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CurrentQtrFractionsCentsAmt"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</span>
				</div>
				<!--Line 8-->
				<div style="width:187mm;height:7mm;">
					<span style="float:left;">
						<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:2.6mm;">8</div>
						<div class="styLNDesc" style="width:134mm;padding-left:1mm;font-weight:bold;padding-top:2.6mm;">
							<span style="float:left;">Current quarter’s adjustment for sick pay </span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
						</div>
					</span>
					<span style="float:right;">
						<div class="styIRS941RightNumBox">8</div>
						<div class="styLNCtrNumBox" style="width:39mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CurrentQuarterSickPaymentAmt"/>
							</xsl:call-template>
						</div>
					</span>
				</div>
				<!--Line 9-->
				<div style="width:187mm;height:7mm;">
					<span style="float:left;">
						<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:2.6mm;">9</div>
						<div class="styLNDesc" style="width:134mm;padding-left:1mm;font-weight:bold;padding-top:2.6mm;">
							<span style="float:left;">Current quarter’s adjustments for tips and group-term life insurance </span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
						</div>
					</span>
					<span style="float:right;">
						<div class="styIRS941RightNumBox">9</div>
						<div class="styLNCtrNumBox" style="width:39mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CurrQtrTipGrpTermLifeInsAdjAmt"/>
							</xsl:call-template>
						</div>
					</span>
				</div>
				<!--Line 10-->
				<div style="width:187mm;height:7mm;">
					<span style="float:left;">
						<div class="styLNLeftNumBox" style="width:8mm;padding-top:2.6mm;">10</div>
						<div class="styLNDesc" style="width:134mm;padding-left:1mm;padding-top:2.6mm;">
							<span style="float:left;"><b>Total taxes after adjustments.</b> Combine lines 6 through 9 </span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
						</div>
					</span>
					<span style="float:right;">
						<div class="styIRS941RightNumBox">10</div>
						<div class="styLNCtrNumBox" style="width:39mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAfterAdjustmentAmt"/>
							</xsl:call-template>
						</div>
					</span>
				</div>
				<!--Line 11-->
				<div style="width:187mm;height:9mm;">
					<span style="float:left;">
						<div class="styLNLeftNumBox" style="width:8mm;padding-top:1mm;">11</div>
						<div class="styLNDesc" style="width:134mm;padding-left:1mm;font-weight:bold;padding-top:1mm;">
							Total deposits for this quarter, including overpayment applied from a prior quarter and
							<span style="float:left;">overpayment applied from Form 941-X, 944-X, or 944-X (SP) filed in the current quarter </span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
						</div>
					</span>
					<span style="float:right;padding-top:2mm;">
						<div class="styIRS941RightNumBox">11</div>
						<div class="styLNCtrNumBox" style="width:39mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTaxDepositAmt"/>
							</xsl:call-template>
						</div>
					</span>
				</div>
				<!--Line 12-->
				<div style="width:187mm;height:7mm;">
					<span style="float:left;">
						<div class="styLNLeftNumBox" style="width:8mm;padding-top:2.6mm;">12</div>
						<div class="styLNDesc" style="width:134mm;padding-left:1mm;padding-top:2.6mm;">
							<span style="float:left;"><b>Balance due.</b> If line 10 is more than line 11, enter the difference and see instructions </span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
						</div>
					</span>
					<span style="float:right;">
						<div class="styIRS941RightNumBox">12</div>
						<div class="styLNCtrNumBox" style="width:39mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BalanceDueAmt"/>
							</xsl:call-template>
						</div>
					</span>
				</div>
				<!--Line 13-->
				<div style="width:187mm;height:7mm;">
					<span style="float:left;">
						<div class="styLNLeftNumBox" style="width:8mm;padding-top:2.6mm;">13</div>
						<div class="styLNDesc" style="width:auto;padding-left:1mm;font-size:7.5pt;padding-top:2.6mm;padding-right:1.8mm;">
							<b>Overpayment.</b> If line 11 is more than line 10, enter the difference
						</div>
						<div class="styLNCtrNumBox" style="width:31mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/OverpaidAmt"/>
							</xsl:call-template>
						</div>
					</span>
					<span style="float:right;">
						<div class="styLNDesc" style="width:14mm;text-align:center;padding-top:4mm;font-size:7.5pt;">
							Check one:
						</div>
						<div style="padding-top:2.6mm;float:left;">
							<input type="checkbox" alt="ApplyToNextReturn" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
									<xsl:with-param name="BackupName">941SSApplyOverpaymentNextReturnInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
									<xsl:with-param name="BackupName">941SSApplyOverpaymentNextReturnInd</xsl:with-param>
								</xsl:call-template>
								<span style="font-size:7.5pt;">Apply to next return.</span>
							</label>
							<input type="checkbox" alt="SendOverpaymentRefund" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
									<xsl:with-param name="BackupName">941SSRefundOverpaymentInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
									<xsl:with-param name="BackupName">941SSRefundOverpaymentInd</xsl:with-param>
								</xsl:call-template>
								<span style="font-size:7.5pt;">Send a refund.</span>
							</label>
						</div>
					</span>
				</div>
				<div style="width:187mm;padding-top:2mm;">
					<span style="float:left;">
						<div class="styLNLeftNumBox" style="width:8mm;text-align:center;"/>
						<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
							<img src="{$ImagePath}/941SSPR_Bullet.gif" alt="Bullet Image"/>
							You MUST complete both pages of Form 941-SS and SIGN it.
						</div>
					</span>
					<span style="float:right;">
						<div style="width:30mm;text-align:right;padding-bottom:0mm;padding-top:0mm;">
							<img src="{$ImagePath}/941SSPR_Next.gif" alt="Next Page Arrow Image"/>
						</div>
					</span>
				</div>					
			</div>
		<!-- Page boundary -->
		<div class="pageEnd" style="width:187mm;">
			<span style="float:left;clear:none;font-weight:bold;font-size:7pt;">For Privacy Act and Paperwork Reduction Act Notice, see the back of the Payment Voucher.</span>
			<span style="float:left;clear:none;padding-left:14mm;padding-top:0.4mm;font-size:7pt;">Cat. No. 17016Y</span>
			<span style="float:right;clear:none;">Form <span class="styBoldText" style="font-size:7pt;">
				<xsl:if test="/AppData/Parameters/SubmissionType='941SS'">941-SS</xsl:if>
				<xsl:if test="/AppData/Parameters/SubmissionType='941PR'">941-PR (ENG)</xsl:if>
			</span> (Rev. 1-2015)</span>
		</div>
		<p style="page-break-before: always"/>
		<!--Begin Page 2-->
		<div style="width:187mm;">
			<!--Name Shown on return-->
			<div class="styBB" style="width:187mm;font-size:7pt;border-top-width:2px;">
				<div class="styFNBox" style="width:126mm; height:8.5mm;">
					Name <i>(not your trade name)</i><br/>
					<xsl:call-template name="PopulateReturnHeaderFiler">
						<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param> 
					</xsl:call-template><br/>
					<xsl:call-template name="PopulateReturnHeaderFiler">
						<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param> 
					</xsl:call-template>
					<div style="line-height:100%; font-family:verdana;font-size:7pt"/>
				</div>
				<span style="padding-left:.5mm">
					<b>Employer identification number (EIN)</b>
                </span><br/>
                <div style="text-align:left;padding-top:2mm;padding-left:.5mm">
					<xsl:call-template name="PopulateReturnHeaderFiler">
						<xsl:with-param name="TargetNode">EIN</xsl:with-param> 
					</xsl:call-template>
				</div>
			</div>
		</div>
		<!--Part 2-->
		<div class="styBB" style="width:187mm;">			
			<div class="styPartName" style="width:13mm;text-align:center;height:4mm;font-size:9pt;">Part 2:</div>
			<div class="styPartDesc" style="width:173.9mm;text-align:left;height:4mm;padding-left:2mm;font-size:9pt;">Tell us about your deposit schedule and tax liability for this quarter.</div>
		</div>
		<div style="width:187mm;font-size:8pt;">
			<div class="styLNDesc" style="width:187mm;height:8mm;font-weight:bold;padding-left:2mm;">
				If you are unsure about whether you are a monthly schedule depositor or a semiweekly schedule depositor, 
				see Pub. 80 (Circular SS), section 8.
			</div>
			<!--Line 14-->
			<div style="width:187mm;padding-bottom:1mm;padding-top:1mm;">
				<div class="styLNLeftNumBox" style="width:8mm;">14</div>
				<div class="styLNDesc" style="width:20mm;height:28mm;padding-left:1mm;">
					<b>Check one:</b>
				</div>
				<input type="checkbox" alt="TotalTaxLessThanLimit" class="styCkbox">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/TotalTaxLessThanLimitAmtInd"/>
						<xsl:with-param name="BackupName">941SSTotalTaxLessThanLimitAmtInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<label style="padding-left:3mm;padding-bottom:2mm;width:155mm;vertical-align:top;">
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$FormData/TotalTaxLessThanLimitAmtInd"/>
						<xsl:with-param name="BackupName">941SSTotalTaxLessThanLimitAmtInd</xsl:with-param>
					</xsl:call-template>
					<span style="width:150mm;padding-top:1mm">
					<b>Line 10 on this return is less than $2,500 or line 
					10 on the return for the prior quarter was less than $2,500, and you did not incur a $100,000 next-day deposit 
					obligation during the current quarter.</b> If line 10 for the prior quarter was less than $2,500 but line 10 on this 
					return is $100,000 or more, you must provide a record of your federal tax liability. If you are a monthly schedule 
					depositor, complete the deposit schedule below; if you are a semiweekly schedule depositor, attach Schedule 
					B (Form 941). Go to Part 3.</span>
				</label><br/><br/>
				<input type="checkbox" alt="MonthlyScheduleDepositor" class="styCkbox">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorGrp/MonthlyScheduleDepositorInd"/>
						<xsl:with-param name="BackupName">941SSMonthlyScheduleDepositorInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<label style="padding-left:3mm;width:155mm;vertical-align:top;">
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorGrp/MonthlyScheduleDepositorInd"/>
						<xsl:with-param name="BackupName">941SSMonthlyScheduleDepositorInd</xsl:with-param>
					</xsl:call-template>
					<span style="width:150mm;padding-top:1mm"><b>You were a monthly schedule depositor for the entire quarter.</b> Enter your 
					tax liability for each month and total liability for the quarter, then go to Part 3.</span>
				</label>
			</div>
			<div style="width:187mm;padding-left:35mm;height:7mm;">
				<div class="styLNDesc" style="font-weight:bold;width:37mm;padding-top:2.5mm;padding-right:3mm;">
					<span style="float:left;">Tax liability:</span><span style="float:right;">Month 1</span>
				</div>
				<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorGrp/TaxLiabilityMonth1Amt"/>
					</xsl:call-template>
				</div>
			</div>
			<div style="width:187mm;padding-left:35mm;height:7mm;">
				<div class="styLNDesc" style="font-weight:bold;width:37mm;text-align:right;padding-top:2.5mm;padding-right:3mm;">
					Month 2
				</div>
				<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorGrp/TaxLiabilityMonth2Amt"/>
					</xsl:call-template>
				</div>
			</div>
			<div style="width:187mm;padding-left:35mm;height:7mm;">
				<div class="styLNDesc" style="font-weight:bold;width:37mm;text-align:right;padding-top:2.5mm;padding-right:3mm;">
					Month 3
				</div>
				<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorGrp/TaxLiabilityMonth3Amt"/>
					</xsl:call-template>
				</div>
			</div>
			<div style="width:187mm;padding-left:35mm;height:7mm;padding-top:1mm;">
				<div class="styLNDesc" style="font-weight:bold;width:37mm;padding-top:2.5mm;">
					Total liability for quarter
				</div>
				<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorGrp/TotalQuarterTaxLiabilityAmt"/>
					</xsl:call-template>
				</div>
				<div class="styLNDesc" style="font-weight:bold;width:40mm;padding-left:2mm;padding-top:2.5mm;">
					Total must equal line 10.
				</div>
			</div>
			<div style="width:187mm;padding-left:29mm; padding-bottom:3mm;">
				<input type="checkbox" alt="SemiweeklyScheduleDepositor" class="styCkbox">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/SemiweeklyScheduleDepositorInd"/>
						<xsl:with-param name="BackupName">941SSSemiweeklyScheduleDepositorInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<label style="padding-left:3mm;width:155mm;vertical-align:top;">
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$FormData/SemiweeklyScheduleDepositorInd"/>
						<xsl:with-param name="BackupName">941SSSemiweeklyScheduleDepositorInd</xsl:with-param>
					</xsl:call-template>
					<span style="width:148mm;padding-top:1mm"><b>You were a semiweekly schedule depositor for any part of this quarter.</b> 
					Complete Schedule B (Form 941), Report of Tax Liability for Semiweekly Schedule Depositors, and 
					attach it to Form 941-SS.</span>
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$FormData/SemiweeklyScheduleDepositorInd"/>
					</xsl:call-template>
				</label>
			</div>
		</div>
		<!--Part 3-->
		<div class="styBB" style="width:187mm;border-top-width:1px;">	
			<div class="styPartName" style="width:13mm;text-align:center;height:4mm;font-size:9pt;">Part 3:</div>
			<div class="styPartDesc" style="width:173.9mm;text-align:left;height:4mm;padding-left:2mm;font-size:9pt;">Tell us about your business. If a question does NOT apply to your business, leave it blank.</div>
		</div>
		<div style="width:187mm;font-size:8pt;">
			<!--Line 15-->
			<div style="width:187mm;padding-bottom:2mm;">
				<div style="width:187mm;padding-bottom:0mm;">
					<div class="styLNLeftNumBox" style="width:8mm;">15</div>
					<div class="styLNDesc" style="width:147mm;padding-left:1mm;font-weight:bold;">
						<span style="float:left;">If your business has closed or you stopped paying wages </span>
						<!--Dotted Line-->
						<span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
					</div>
					<input type="checkbox" alt="FutureFilingNotRequired" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/BusinessClosedGrp/FutureFilingNotRequiredInd"/>
							<xsl:with-param name="BackupName">941SSFutureFilingNotRequiredInd</xsl:with-param>
						</xsl:call-template>
					</input>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="$FormData/BusinessClosedGrp/FutureFilingNotRequiredInd"/>
							<xsl:with-param name="BackupName">941SSFutureFilingNotRequiredInd</xsl:with-param>
						</xsl:call-template>
						<span style="width:1mm;"/>Check here, and
					</label>
				</div>
				<div style="width:187mm;padding-top:1mm;padding-bottom:0mm;">
					<div class="styLNDesc" style="width:56mm;padding-left:9mm;padding-top:2.5mm;">
						enter the final date you paid wages
					</div>
					<div class="styLNCtrNumBox" style="width:31mm;border-top-width:1px;height:6mm;padding-top:1mm;">
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$FormData/BusinessClosedGrp/FinalWagesPaidDt"/>
						</xsl:call-template>
					</div>
					<div style="padding-top:2.5mm;padding-left:1mm;float:left;">.</div>
				</div>
			</div>
			<!--Line 16-->
			<div style="width:187mm;">
				<div class="styLNLeftNumBox" style="width:8mm;">16</div>
				<div class="styLNDesc" style="width:147mm;padding-left:1mm;font-weight:bold;">
					<span style="float:left;">If you are a seasonal employer and you do not have to file a return for every quarter of the year </span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
				</div>
				<input type="checkbox" alt="SeasonalEmployer" class="styCkbox">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/SeasonalEmployerInd"/>
						<xsl:with-param name="BackupName">941SSSeasonalEmployerInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$FormData/SeasonalEmployerInd"/>
						<xsl:with-param name="BackupName">941SSSeasonalEmployerInd</xsl:with-param>
					</xsl:call-template>
					<span style="width:1mm;"/>Check here.<br/>
				</label>
			</div>
		</div>
		<!--Part 4-->
		<div class="styBB" style="width:187mm;border-top-width:1px;">
			<div class="styPartName" style="width:13mm;text-align:center;height:4mm;font-size:9pt;">Part 4:</div>
			<div class="styPartDesc" style="width:173.9mm;text-align:left;height:4mm;padding-left:2mm;font-size:9pt;">May 
			we speak with your third-party designee?</div>
		</div>
		<div style="width:187mm;font-size:8pt;">
			<div class="styLNDesc" style="width:187mm;height:7mm;padding-left:14mm;padding-bottom:0.5mm;">
				<b>Do you want to allow an employee, a paid tax preparer, or another person to discuss this return with the IRS?</b> See the instructions for details.
			</div>
			<div style="width:187mm;float:none;clear:both;padding-bottom:2mm;">
				<div style="width:25mm;float:left;padding-top:2.5mm;padding-left:12mm;">
					<span>
						<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
						</xsl:call-template>
						<input type="checkbox" alt="DiscussWithThirdPartyYes" class="styCkbox">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
								<xsl:with-param name="BackupName">941SSDiscussWithThirdPartyYesInd</xsl:with-param>
							</xsl:call-template>
						</input>
					</span>
					<label>
						<xsl:call-template name="PopulateLabelYes">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
							<xsl:with-param name="BackupName">941SSDiscussWithThirdPartyYesInd</xsl:with-param>
						</xsl:call-template>
						Yes.
					</label>
					<br/><br/><br/><br/><br/>
					<span>
						<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
						</xsl:call-template>
						<input type="checkbox" alt="DiscussWithThirdPartyNo" class="styCkbox">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
								<xsl:with-param name="BackupName">941SSDiscussWithThirdPartyNoInd</xsl:with-param>
							</xsl:call-template>
						</input>
					</span>
					<label>
						<xsl:call-template name="PopulateLabelNo">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
							<xsl:with-param name="BackupName">941SSDiscussWithThirdPartyNoInd</xsl:with-param>
						</xsl:call-template>
						No.
					</label>
				</div>
				<div style="width:161mm;float:right;padding-top:1.5mm;padding-left:4mm;padding-right:3mm;">
					<div style="width:161mm;height:6mm;">
						<div class="styLNDesc" style="width:50mm;float:left;padding-top:2.5mm;">Designee’s name and phone number </div>
						<div style="float:left;">
							<div class="styLNCtrNumBox" style="width:62mm;height:7.5mm;border-top-width:1px;float:left;padding-top:1mm;text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeNm"/>
								</xsl:call-template>
							</div>
							<span class="styLNCtrNumBox" style="width:5mm;border:none"/>
							<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:7.5mm;word-wrap:break-word;">
								<xsl:if test="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePhoneNum">
									<xsl:call-template name="PopulatePhoneNumber">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePhoneNum"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeFrgnPhoneNum">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeFrgnPhoneNum"/>
									</xsl:call-template>
								</xsl:if>
							</div>
						</div>
					</div>
					<div style="height:6mm;padding-top:3mm;">
						<div class="styLNDesc" style="width:102mm;padding-top:2.5mm;float:left;">
							Select a 5-digit Personal Identification Number (PIN) to use when talking to IRS.
						</div>
						<div style="float:right;">
							<div class="styLNCtrNumBox" style="width:52mm;border-top-width:1px;height:6.5mm;padding-top:1mm;">
								<xsl:call-template name="PopulatePin">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePIN"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--Part 5-->
		<div class="styBB" style="width:187mm;border-top-width:1px;">
			<div class="styPartName" style="width:13mm;text-align:center;height:4mm;font-size:9pt;">Part 5:</div>
			<div class="styPartDesc" style="width:173.9mm;text-align:left;height:4mm;padding-left:2mm;font-size:9pt;">Sign here. You MUST complete both pages of Form 941-SS and SIGN it.</div>
		</div>
		<div style="width:187mm;font-size:8pt;">
			<div class="styLNDesc" style="width:187mm;padding-bottom:8mm;padding-left:2mm;font-size:7pt;">
				Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and 
				statements, and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer 
				(other than taxpayer) is based on all information of which preparer has any knowledge.
			</div>
			<div style="width:187mm;float:none;clear:both;">
				<div style="width:14mm;padding-left:2mm;float:left;">
					<img src="{$ImagePath}/941_Signature.GIF" alt="Signature Image"/>
				</div>
				<div style="width:20mm;height:15mm;padding-top:3mm;font-weight:bold;font-size:10pt;float:left;">
					Sign your name here
				</div>
				<div class="styLNCtrNumBox" style="width:75mm;border-top-width:1px;height:15mm;float:left;word-wrap:break-word;text-align:left;padding-right:1mm;padding-left:1mm;">
					<xsl:if test="$RtnHdrData/ReportingAgentPINGrp/PIN">
						<xsl:call-template name="PopulatePin">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/ReportingAgentPINGrp/PIN"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$RtnHdrData/PractitionerPINGrp/TaxpayerPIN">
						<xsl:call-template name="PopulatePin">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerPIN"/>
						</xsl:call-template>
					</xsl:if>
				</div>
				<div style="width:78mm;float:left;padding-left:10mm;padding-top:0mm;">
					<div style="height:100%">
						<div style="width:16mm;height:8mm;float:left;">Print your name here</div>
						<div style="height:8mm;padding-top:0mm;float:right;padding-right:3mm;">
							<div class="styLNCtrNumBox" style="width:49mm;border-top-width:1px;height:8mm;padding-top:1mm;text-align:left;padding-left:1mm;word-wrap:break-word;">
								<xsl:if test="$RtnHdrData/SignatureDocumentGrp/PersonNm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/PersonNm"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$RtnHdrData/PractitionerPINGrp/TaxpayerNm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerNm"/>
									</xsl:call-template>
								</xsl:if>
							</div>
						</div>
					</div>
					<div style="height: 100%">
						<div style="width:16mm;height:7mm;float:left;">Print your title here</div>
						<div style="height:7mm;padding-top:1mm;float:right;padding-right:3mm;">
							<div class="styLNCtrNumBox" style="width:49mm;border-top-width:1px;height:auto;padding-top:1mm;text-align:left;padding-left:1mm;">
								<xsl:if test="$RtnHdrData/SignatureDocumentGrp/PartnershipAuthorizationCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/PartnershipAuthorizationCd"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$RtnHdrData/SignatureDocumentGrp/CorporationAuthorizationCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/CorporationAuthorizationCd"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$RtnHdrData/SignatureDocumentGrp/ExemptOrgAuthorizationCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/ExemptOrgAuthorizationCd"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$RtnHdrData/SignatureDocumentGrp/EstateAuthorizationCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/EstateAuthorizationCd"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$RtnHdrData/SignatureDocumentGrp/IndividualAuthorizationCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/IndividualAuthorizationCd"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$RtnHdrData/PractitionerPINGrp/Title">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/Title"/>
									</xsl:call-template>
								</xsl:if>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="styBB" style="width:187mm;padding-bottom:3mm;padding-top:0.5mm;">
				<div class="styLNDesc" style="width:36.4mm;text-align:right;padding-right:4mm;">
					Date
				</div>
				<div class="styLNCtrNumBox" style="width:40mm;border-top-width:1px;height:6mm;padding-top:1mm;">
					<xsl:if test="$RtnHdrData/SignatureDocumentGrp/SignatureDt">
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/SignatureDt"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$RtnHdrData/PractitionerPINGrp/TaxpayerSignatureDt">
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerSignatureDt"/>
						</xsl:call-template>
					</xsl:if>
				</div>
				<div class="styLNDesc" style="width:70mm;padding-left:42mm;">
					Best daytime phone
				</div>
				<div style="float:right;padding-right:3mm;">
					<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:6mm;padding-top:1mm;">
						<xsl:if test="$RtnHdrData/SignatureDocumentGrp/DaytimePhoneNum">
							<xsl:call-template name="PopulatePhoneNumber">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/DaytimePhoneNum"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="$RtnHdrData/SignatureDocumentGrp/DaytimeForeignPhoneNum">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/DaytimeForeignPhoneNum"/>
							</xsl:call-template>
						</xsl:if>
					</div>
				</div>
			</div>
			</div>
			<div style="width:187mm;padding-bottom:4mm;">
				<div class="styLNDesc" style="width:46mm;font-size:9pt;font-weight:bold;float:left;padding-left:5mm;">
					Paid Preparer Use Only
				</div>
				<div class="styLNDesc" style="width:60mm;float:right;">
					<span style="float:left;">Check if you are self-employed </span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:left;padding-right:1mm;">....</span>
					<input type="checkbox" alt="SelfEmployed" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
							<xsl:with-param name="BackupName">941SSSelfEmployedInd</xsl:with-param>
						</xsl:call-template>
					</input>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
							<xsl:with-param name="BackupName">941SSSelfEmployedInd</xsl:with-param>
						</xsl:call-template>
					</label>
				</div>			
			</div>
			<div style="width:187mm;padding-bottom:3mm;">
				<div class="styLNDesc" style="width:24mm;padding-left:0mm;padding-right:1mm;padding-top:2.5mm;">
					Preparer's name
				</div>
				<div class="styLNCtrNumBox" style="width:102mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:left;padding-left:1mm;">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
					</xsl:call-template>
				</div>
				<div class="styLNDesc" style="width:18mm;padding-left:3mm;padding-top:2.5mm;">
					PTIN
				</div>
				<div class="styLNCtrNumBox" style="width:42mm;border-top-width:1px;height:6mm;padding-top:1mm;">
					<xsl:choose>
						<xsl:when test="$RtnHdrData/PaidPreparerInformationGrp/PTIN">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PTIN"/>
								</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="PopulateSSN">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerSSN"/>
								</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</div>
			<div style="width:187mm;padding-bottom:3mm;">
				<div class="styLNDesc" style="width:24mm;padding-left:0mm;padding-right:1mm;padding-top:2.5mm;">
					Preparer's signature
				</div>
				<div class="styLNCtrNumBox" style="width:102mm;border-top-width:1px;height:6mm;word-wrap:break-word;padding-top:1mm;text-align:left;padding-right:1mm;padding-left:1mm;">	
				</div>
				<div class="styLNDesc" style="width:15mm;padding-left:3mm;padding-top:2.5mm;">
					Date
				</div>
				<div style="float:right;padding-right:16mm;">
					<div class="styLNCtrNumBox" style="width:27mm;border-top-width:1px;height:6mm;padding-top:1mm;">
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SignatureDt"/>
						</xsl:call-template>
					</div>
				</div>
			</div>
			<div style="width:187mm;height:9mm;padding-bottom:0mm;">
				<div class="styLNDesc" style="width:24mm;padding-left:0mm;padding-right:1mm;padding-top:0mm;">
					Firm's name (or yours if self-employed)
				</div>
				<div class="styLNCtrNumBox" style="width:102mm;border-top-width:1px;height:auto;text-align:left;padding-left:1mm;">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine1Txt"/>
					</xsl:call-template><br/>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine2Txt"/>
					</xsl:call-template>
				</div>
				<div class="styLNDesc" style="width:18mm;padding-left:3mm;padding-top:2.5mm;">
					EIN
				</div>
				<div class="styLNCtrNumBox" style="width:42mm;border-top-width:1px;height:6mm;padding-top:1mm;">
					<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN">
						<xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReasonCd">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReasonCd"/>
						</xsl:call-template>
					</xsl:if>
				</div>
			</div>
			<div style="width:187mm;padding-bottom:3mm;">
				<div class="styLNDesc" style="width:24mm;padding-left:0mm;padding-right:1mm;padding-top:4mm;">
					Address
				</div>
				<div class="styLNCtrNumBox" style="width:102mm;border-top-width:1px;height:auto;text-align:left;padding-left:1mm;">
					<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/AddressLine1Txt"/>
						</xsl:call-template><br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/AddressLine2Txt"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/AddressLine1Txt"/>
						</xsl:call-template><br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/AddressLine2Txt"/>
						</xsl:call-template>
					</xsl:if>
				</div>
				<div class="styLNDesc" style="width:15mm;padding-left:3mm;padding-top:2.5mm;">
					Phone
				</div>
				<div style="float:right;padding-right:1mm;">
					<div class="styLNCtrNumBox" style="width:42mm;border-top-width:1px;height:7mm;padding-top:1mm;word-wrap:break-word;">
						<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PhoneNum">
							<xsl:call-template name="PopulatePhoneNumber">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PhoneNum"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/ForeignPhoneNum">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/ForeignPhoneNum"/>
							</xsl:call-template>
						</xsl:if>
					</div>
				</div>
			</div>
			<div class="styBB" style="width:187mm;padding-bottom:2mm;border-bottom-width:2px;">
				<div class="styLNDesc" style="width:24mm;padding-left:0mm;padding-right:1mm;padding-top:2.5mm;">
					City
				</div>
				<xsl:choose>
					<xsl:when test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
						<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:7mm;padding-top:1mm;text-align:left;padding-left:1mm;word-wrap:break-word;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/CityNm"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:11mm;padding-top:2.5mm;text-align:center;">
							Prov./St.
						</div>
						<div class="styLNCtrNumBox" style="width:24mm;border-top-width:1px;height:7mm;padding-top:1mm;word-wrap:break-word;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/ProvinceOrStateNm"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:11mm;padding-top:2.5mm;text-align:center;">
							Country
						</div>
						<div class="styLNCtrNumBox" style="width:10mm;border-top-width:1px;height:7mm;padding-top:1mm;word-wrap:break-word;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/CountryCd"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:18mm;padding-left:3mm;padding-top:2.5mm;">
							Postal code
						</div>
						<div class="styLNCtrNumBox" style="width:42mm;border-top-width:1px;height:7mm;padding-top:1mm;word-wrap:break-word;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/ForeignPostalCd"/>
							</xsl:call-template>
						</div>
					</xsl:when>
					<xsl:otherwise>
						<div class="styLNCtrNumBox" style="width:74mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:left;padding-left:1mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/CityNm"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:18mm;padding-left:8mm;padding-top:2.5mm;">
							State
						</div>
						<div class="styLNCtrNumBox" style="width:10mm;border-top-width:1px;height:6mm;padding-top:1mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/StateAbbreviationCd"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:18mm;padding-left:3mm;padding-top:2.5mm;">
							ZIP code
						</div>
						<div style="float:right;padding-right:3mm;">
							<div class="styLNCtrNumBox" style="width:40mm;border-top-width:1px;height:6mm;padding-top:1mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/ZIPCd"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:otherwise>
				</xsl:choose>
			</div>
		</div>					
		<!--Page Footer-->
		<div class="pageEnd" style="width:187mm;">
			<span style="float:left;clear:none;">Page <span class="styBoldText" style="font-size:9pt;">2</span></span>
			<span style="float:right;clear:none;">Form <span class="styBoldText" style="font-size:9pt;">
				<xsl:if test="/AppData/Parameters/SubmissionType='941SS'">941-SS</xsl:if>
				<xsl:if test="/AppData/Parameters/SubmissionType='941PR'">941-PR (ENG)</xsl:if>
			</span> (Rev. 1-2015)</span>
		</div>
        <!-- BEGIN Left Over Table -->
		<!-- Additonal Data Title Bar and Button -->
		<div class="styLeftOverTitleLine" id="LeftoverData">
			<div class="styLeftOverTitle" style="float:left;">
				Additional Data        
			</div>
			<div class="styLeftOverButtonContainer" style="float:right;">
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
  <!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<xsl:template name="IRS941PR">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="ES">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)"/>
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
				<meta name="Description" content="IRS Form 941PR"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS941SSPRStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<form name="IRS941PR" style="font-family:arial;">
					<!--  Begin Header section 1 -->
					<div class="styGenericDiv" style="width:187mm;">
						<xsl:call-template name="DocumentHeader"/>
					</div>
					<div class="styBB" style="width:187mm;border-bottom-width:0px;">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/BinaryAttachment"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/GeneralDependencySmall"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/FinalPayrollInfoStatement"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/TransferOfBusinessStatement"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/IRS941ScheduleR"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/IRS941ScheduleD"/>
						</xsl:call-template>
						<div class="styFNBox" style="width:187mm;height:10mm;border:0px;float:none;clear:both;">
							Formulario 
							<span class="styFormNumber" style="font-size:15pt;">
								<xsl:if test="/AppData/Parameters/SubmissionType='941SS'">941-SS</xsl:if>
								<xsl:if test="/AppData/Parameters/SubmissionType='941PR'">941-PR</xsl:if>
				 para 2015: <span class="styMainTitle" style="font-size:10pt;">Planilla para la Declaración 
								Federal TRIMESTRAL del Patrono</span>
							</span>
							<div style="width:187mm;padding-bottom:0mm;float:none;clear:both;">
								<span class="styAgency" style="float:left;padding-bottom:0mm;">(Rev. enero de 2015)<span style="width:13mm;"/>
								Department of the Treasury — Internal Revenue Service</span>
								<span class="styOMB" style="width:34mm;font-size:7pt;text-align:right;border:0px;float:right;padding-bottom:0mm;">OMB No. 1545-0029</span>
							</div>
						</div>
					</div>
					<!-- 5/19/2015 AM: Adjusted height of Filer Name and Trade name from 8mm to auto per Defect 43152 -->
					<div style="width:187mm;float:none;clear:both;">	
						<div class="styBB" style="width:122mm;height:auto;float:left;border:black solid 1px;padding-top:1mm;padding-left:2mm;padding-right:2mm;">
							<div style="width:118mm;padding-top:0mm;">
								<span style="float:left;padding-right:5mm;font-size:6pt;font-family:Arial Narrow;padding-top:2mm;"><b>Número de identificación patronal </b>
									<i><span style="font-size:7pt;">(EIN)</span></i></span>
								<span class="styLNCtrNumBox" style="width:78mm;border-top-width:1px;padding-top:2mm;float:right;height:6mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">EIN</xsl:with-param>
										<xsl:with-param name="EINChanged">true</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div style="width:118mm;padding-bottom:1mm;padding-top:1mm;">
								<span style="float:left;padding-top:4mm;"><b>Nombre</b> (el de usted, no el de su negocio)</span>
								<span class="styLNCtrNumBox" style="width:69mm;height:auto;border-top-width:1px;float:right;text-align:left;padding-left:1mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
									</xsl:call-template><br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</span>
							</div>
							<div style="width:118mm;padding-bottom:1mm;">
								<span style="float:left;padding-top:4mm;"><b>Nombre comercial</b> (si alguno)</span>
								<span class="styLNCtrNumBox" style="width:82mm;height:auto;border-top-width:1px;float:right;text-align:left;padding-left:1mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/TradeName/BusinessNameLine1Txt"/>
									</xsl:call-template><br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/TradeName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</span>
							</div>
							<div style="width:118mm;padding-bottom:0mm;">
								<span style="width:12mm;float:left;padding-top:4mm;font-weight:bold;">Dirección</span>
								<span style="width:104mm;float:right;">
								<span class="styLNCtrNumBox" style="width:104mm;border-top-width:1px;height:8mm;text-align:left;padding-left:1mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
									</xsl:call-template><br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
									</xsl:call-template>
								</span>
								<span style="width:104mm;font-size:6pt;padding-left:1mm;">
									Número<span style="width:20mm"/>Calle<span style="width:36mm;"/>Número de oficina o de habitación
								</span>
								<span class="styLNCtrNumBox" style="width:66mm;border-top-width:1px;padding-top:2mm;height:6mm;text-align:left;padding-left:1mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
									</xsl:call-template>
								</span>
								<span class="styLNCtrNumBox" style="width:1.5mm;float:left;border:none"/>
								<span class="styLNCtrNumBox" style="width:13mm;border-top-width:1px;padding-top:2mm;height:6mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
									</xsl:call-template>
								</span>
								<span class="styLNCtrNumBox" style="width:1.5mm;float:left;border:none"/>
								<span class="styLNCtrNumBox" style="width:22mm;border-top-width:1px;padding-top:2mm;height:6mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
									</xsl:call-template>
								</span>
								<span style="width:105mm;font-size:6pt;padding-left:1mm;">
									Ciudad<span style="width:61mm"/>Estado<span style="width:9mm;"/>Código postal <i>(ZIP)</i>
								</span>
									
								<span class="styLNCtrNumBox" style="width:33.8mm;border-top-width:1px;padding-top:2mm;height:6mm;text-align:left;padding-left:1mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
									</xsl:call-template>
								</span>
								<span class="styLNCtrNumBox" style="width:1.5mm;float:left;border:none"/>
								<span class="styLNCtrNumBox" style="width:34mm;border-top-width:1px;padding-top:2mm;height:6mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
									</xsl:call-template>
								</span>
								<span class="styLNCtrNumBox" style="width:1.5mm;float:left;border:none"/>
								<span class="styLNCtrNumBox" style="width:33mm;border-top-width:1px;padding-top:2mm;height:6mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
									</xsl:call-template>
								</span>
								<span style="width:105mm;font-size:6pt;">
									<span style="width:33mm;padding-left:1mm;">Nombre del país extranjero</span>
									<span style="width:36mm;text-align:center;">Provincia extranjera/condado</span>
									<span style="width:33mm;text-align:center;">Código postal extranjero</span>
								</span>
								</span>
							</div>
						</div>
						<div style="float:right;padding-right:2mm;">
							<div class="styBB" style="width:60mm;height:46mm;border-left-width:1px;border-right-width:1px;border-top-width:1px;padding-left:2mm;padding-top:2mm;">
								<div class="styPartName" style="width:55mm;height:8mm;text-align:left;padding-left:1mm;padding-top:1mm;padding-bottom:1mm;">Informe para este trimestre de 2015.<br/><span style="font-size:7pt;">(Marque uno).</span></div>
								<xsl:variable name="Date">
									<xsl:value-of select="$RtnHdrData/QuarterEndingDt"/>
								</xsl:variable>
								<div style="width:55mm;float:none;clear:both;font-size:8pt;">
									<div style="width:55mm;float:none;clear:both;">					
										<div style="width:55mm;padding-top:0.8mm;float:none;clear:both;">
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
											</xsl:call-template>
											<input type="checkbox" alt="PrimerTrimestre" class="styCkbox">
												<xsl:call-template name="PopulateEnumeratedCheckbox">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
													<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '03')"/>
													<xsl:with-param name="BackupName">IRS941PRQuarterEndingDt[1]</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
													<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '03')"/>
													<xsl:with-param name="BackupName">IRS941PRQuarterEndingDt[1]</xsl:with-param>
												</xsl:call-template>
												<span style="width:1mm;"/><b>1:</b> enero, febrero, marzo
											</label>
										</div>
										<div style="width:55mm;">
											<div style="float:left;clear:none;padding-top:2mm;">
												<xsl:call-template name="PopulateSpan">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
												</xsl:call-template>
												<input type="checkbox" alt="SegundoTrimestre" class="styCkbox">
													<xsl:call-template name="PopulateEnumeratedCheckbox">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
														<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '06')"/>
														<xsl:with-param name="BackupName">IRS941PRQuarterEndingDt[2]</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
														<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '06')"/>
														<xsl:with-param name="BackupName">IRS941PRQuarterEndingDt[2]</xsl:with-param>
													</xsl:call-template>
													<span style="width:1mm;"/><b>2:</b> abril, mayo, junio
												</label>
											</div>
										</div>
										<div style="width:55mm;">
											<div style="float:left;clear:none;padding-top:2mm;">
												<xsl:call-template name="PopulateSpan">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
												</xsl:call-template>
												<input type="checkbox" alt="TercerTrimestre" class="styCkbox">
													<xsl:call-template name="PopulateEnumeratedCheckbox">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
														<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '09')"/>
														<xsl:with-param name="BackupName">IRS941PRQuarterEndingDt[3]</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
														<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '09')"/>
														<xsl:with-param name="BackupName">IRS941PRQuarterEndingDt[3]</xsl:with-param>
													</xsl:call-template>
													<span style="width:1mm;"/><b>3:</b> julio, agosto, septiembre
												</label>
											</div>
										</div>
										<div style="width:55mm;">
											<div style="float:left;clear:none;padding-top:2mm;">
												<xsl:call-template name="PopulateSpan">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
												</xsl:call-template>
												<input type="checkbox" alt="CuartoTrimestre" class="styCkbox">
													<xsl:call-template name="PopulateEnumeratedCheckbox">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
														<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '12')"/>
														<xsl:with-param name="BackupName">IRS941PRQuarterEndingDt[4]</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
														<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '12')"/>
														<xsl:with-param name="BackupName">IRS941PRQuarterEndingDt[4]</xsl:with-param>
													</xsl:call-template>
													<span style="width:1mm;"/><b>4:</b> octubre, noviembre, diciembre
												</label>
											</div>
										</div>
									</div>
								</div>
								<div style="width:53mm;padding-bottom:0mm;float:none;clear:both;font-size:7pt;">
									<br/>Puede encontrar instrucciones y formularios de años anteriores en <i>www.irs.gov/form941pr</i>.
								</div>
							</div>
						</div>
					</div>
				<div style="width:187mm;float:left;clear:both;">		
				<div class="styLNDesc" style="width:187mm;font-size:8pt;padding-bottom:0mm;padding-top:0mm;float:none;clear:both;">
					Lea las instrucciones por separado antes de completar el Formulario 941-PR. Escriba a maquinilla o en letra de molde dentro de los encasillados.
				</div>
				<div class="styBB" style="width:187mm;border-top-width:1px;float:none;clear:both;">
					<div class="styPartName" style="width:13mm;text-align:center;height:4mm;font-size:9pt;">Parte 1:</div>
					<div class="styPartDesc" style="width:173.9mm;text-align:left;height:4mm;padding-left:2mm;font-size:9pt;">Conteste las preguntas a continuación para este trimestre.</div>
				</div>
				<div style="width:187mm;padding-left:0mm;padding-bottom:0mm;font-size:8pt;float:none;clear:both;">
					<!--Line 1-->
					<div style="width:187mm;padding-bottom:0mm;float:none;clear:both;">
						<span style="float:left;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;">1</div>
							<div class="styLNDesc" style="width:122mm;padding-left:1mm;font-weight:bold;">
								Número de empleados que recibieron salarios, propinas u otras remuneraciones<br/>
								durante el período de pago que incluye: el 12 de marzo (1er trimestre), 12 de junio<br/>
								(2do trimestre), 12 de septiembre (3er trimestre) o 12 de diciembre (4to trimestre)
							</div>
						</span>
						<span style="float:right;padding-top:4.4mm;">
							<div class="styIRS941RightNumBox" style="width:10mm;">1</div>
							<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/EmployeeCnt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					<!--Line 2-->
					<div style="width:187mm;padding-bottom:1mm;float:none;clear:both;">
						<div class="styLNLeftNumBoxSD" style="width:8mm;">2</div>
						<div class="styLNDesc" style="width:179mm;background-color:gray;"/>
					</div>
					<!--Line 3-->
					<div style="width:187mm;padding-bottom:0mm;float:none;clear:both;">
						<div class="styLNLeftNumBoxSD" style="width:8mm;">3</div>
						<div class="styLNDesc" style="width:179mm;background-color:gray;"/>
					</div>
					<!--Line 4-->
					<div style="width:187mm;padding-bottom:0mm;float:none;clear:both;">
						<div class="styLNLeftNumBoxSD" style="width:8mm;">4</div>
						<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
							Si los salarios, propinas y otras remuneraciones no están sujetos a las contribuciones al
							<span style="float:left;">Seguro Social y al <i>Medicare</i> </span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.....................</span>		
						</div>
						<div style="padding-top:4mm;float:left;">
							<input type="checkbox" alt="LosSalariosNoEstánSujetosAlSeguroSocialYAlMedicare" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/WagesNotSubjToSSMedcrTaxInd"/>
									<xsl:with-param name="BackupName">941PRWagesNotSubjToSSMedcrTaxInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/WagesNotSubjToSSMedcrTaxInd"/>
									<xsl:with-param name="BackupName">941PRWagesNotSubjToSSMedcrTaxInd</xsl:with-param>
								</xsl:call-template>
								<span style="width:1mm;"/>Marque aquí y pase a la línea <b>6.</b>
							</label>
						</div>
					</div>
					<!--Line 5 Header-->
					<div style="width:187mm;float:none;clear:both;">
						<span style="width:57mm;"/>
						<span style="width:35mm;font-weight:bold;text-align:center;">Columna 1</span>
						<span style="width:14mm;"/>
						<span style="width:35mm;font-weight:bold;text-align:center;">Columna 2</span>
					</div>
					<div style="width:160mm;float:left;">
						<!--Line 5a-->
						<div style="width:160mm;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:0mm;">5a</div>
							<div class="styLNDesc" style="width:49mm;padding-left:1mm;padding-top:0mm;font-weight:bold;">
								Salarios sujetos a la<br/>contribución al Seguro Social
							</div>
							<div style="padding-top:1.2mm;float:left;">
								<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityWageAndTaxGrp/SocialSecurityTaxCashWagesAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:14mm;text-align:center;padding-top:2.5mm;">
									x .124 =
								</div>
								<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityWageAndTaxGrp/SocialSecurityTaxAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Line 5b-->
						<div style="width:160mm;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:0mm;">5b</div>
							<div class="styLNDesc" style="width:49mm;padding-top:0mm;padding-left:1mm;font-weight:bold;">
								Propinas sujetas a la<br/>contribución al Seguro Social
							</div>
							<div style="padding-top:1mm;float:left;">
								<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityTipsAndTaxGrp/TaxableSocSecTipsAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:14mm;text-align:center;padding-top:2.5mm;">
									x .124 =
								</div>
								<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityTipsAndTaxGrp/TaxOnSocialSecurityTipsAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Line 5c-->
						<div style="width:160mm;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:0mm;">5c</div>
							<div class="styLNDesc" style="width:49mm;padding-top:0mm;padding-left:1mm;font-weight:bold;">
								Salarios y propinas sujetos a la<br/>contribución al <i>Medicare</i>
							</div>
							<div style="padding-top:1mm;float:left;">
								<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/MedicareWageTipsAndTaxGrp/TaxableMedicareWagesTipsAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:14mm;text-align:center;padding-top:2.5mm;">
									x .029 =
								</div>
								<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/MedicareWageTipsAndTaxGrp/TaxOnMedicareWagesTipsAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Line 5d-->
						<div style="width:160mm;padding-bottom:0mm;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:0mm;">5d</div>
							<div class="styLNDesc" style="width:49mm;padding-top:0mm;padding-left:1mm;font-weight:bold;">
								Salarios y propinas sujetos a la<br/>retención de la Contribución<br/>Adicional al <i>Medicare</i>
							</div>
							<div style="padding-top:3mm;float:left;">
								<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AddnlMedicareWageTipsAndTaxGrp/TxblWageTipsSubjAddnlMedcrAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:14mm;text-align:center;padding-top:2.5mm;">
									x .009 =
								</div>
								<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AddnlMedicareWageTipsAndTaxGrp/TaxOnWageTipsSubjAddnlMedcrAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!--Line 5e-->
					<div style="width:187mm;padding-bottom:0mm;float:none;clear:both;">
						<span style="float:left;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:2mm;">5e</div>
							<div class="styLNDesc" style="width:123mm;padding-left:1mm;font-weight:bold;padding-top:2mm;">
								<span style="float:left;">Sume la Columna 2 de las líneas 5a, 5b, 5c y 5d </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
							</div>
						</span>
						<span style="float:right;">
							<div class="styIRS941RightNumBox" style="width:10mm;">5e</div>
							<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSSMdcrTaxAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					<!--Line 5f-->
					<div style="width:187mm;padding-bottom:0mm;float:none;clear:both;">
						<span style="float:left;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:0mm;">5f</div>
							<div class="styLNDesc" style="width:123mm;padding-left:1mm;padding-top:0mm;">
								<b>Notificación y solicitud de pago conforme a la sección 3121(q): Contribución adeudada</b>
								<span style="float:left;"><b>por propinas no declaradas</b> (vea las instrucciones) </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
							</div>
						</span>
						<span style="float:right;padding-top:1.2mm;">
							<div class="styIRS941RightNumBox" style="width:10mm;">5f</div>
							<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxOnUnreportedTips3121qAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					<!--Line 6-->
					<div style="width:187mm;float:none;clear:both;">
						<span style="float:left;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:2.5mm;">6</div>
							<div class="styLNDesc" style="width:123mm;padding-left:1mm;padding-top:2.5mm;">
								<span style="float:left;"><b>Total de contribuciones antes de ajustes.</b> Sume las líneas <b>5e</b> y <b>5f</b> </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
							</div>
						</span>
						<span style="float:right;">
							<div class="styIRS941RightNumBox" style="width:10mm;">6</div>
							<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxBeforeAdjustmentAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					<!--Line 7-->
					<div style="width:187mm;float:none;clear:both;">
						<span style="float:left;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:2.5mm;">7</div>
							<div class="styLNDesc" style="width:123mm;padding-left:1mm;padding-top:2.5mm;font-weight:bold;">
								<span style="float:left;">Ajustes por fracciones de centavos del trimestre actual </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
							</div>
						</span>
						<span style="float:right;">
							<div class="styIRS941RightNumBox" style="width:10mm;">7</div>
							<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<!-- 7/9/2015 AM: Per KISAM IM02060648, choose statement added to properly display negative numbers and cents only.-->
								<xsl:choose>
									<xsl:when test="starts-with($FormData/CurrentQtrFractionsCentsAmt,'-') or starts-with($FormData/CurrentQtrFractionsCentsAmt,'.')">
										<span style="color:darkblue;">
											<xsl:call-template name="PlaceCommas">
												<xsl:with-param name="TargetNode" select="$FormData/CurrentQtrFractionsCentsAmt"/>
											</xsl:call-template>
										</span>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CurrentQtrFractionsCentsAmt"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</span>
					</div>
					<!--Line 8-->
					<div style="width:187mm;float:none;clear:both;">
						<span style="float:left;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:2.5mm;">8</div>
							<div class="styLNDesc" style="width:123mm;padding-left:1mm;padding-top:2.5mm;font-weight:bold;">
								<span style="float:left;">Ajustes por compensación por enfermedad del trimestre actual </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
							</div>
						</span>
						<span style="float:right;">
							<div class="styIRS941RightNumBox" style="width:10mm;">8</div>
							<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CurrentQuarterSickPaymentAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					<!--Line 9-->
					<div style="width:187mm;float:none;clear:both;">
						<span style="float:left;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:0mm;">9</div>
							<div class="styLNDesc" style="width:123mm;padding-left:1mm;padding-top:0mm;font-weight:bold;">
								Ajustes por propinas y por seguro temporal de vida colectivo a término fijo del trimestre
								<span style="float:left;"> actual </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">............................</span>
							</div>
						</span>
						<span style="float:right;padding-top:0.2mm;">
							<div class="styIRS941RightNumBox" style="width:10mm;">9</div>
							<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CurrQtrTipGrpTermLifeInsAdjAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					<!--Line 10-->
					<div style="width:187mm;float:none;clear:both;">
						<span style="float:left;">
							<div class="styLNLeftNumBox" style="width:8mm;padding-top:2.5mm;">10</div>
							<div class="styLNDesc" style="width:123mm;padding-left:1mm;padding-top:2.5mm;">
								<b>Total de contribuciones después de considerar los ajustes.</b> Combine las líneas <b>6</b> a <b>9</b>
							</div>
						</span>
						<span style="float:right;">
							<div class="styIRS941RightNumBox" style="width:9mm;padding-right:1mm;">10</div>
							<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAfterAdjustmentAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					<!--Line 11-->
					<div style="width:187mm;height:14mm;float:none;clear:both;">
						<span style="float:left;">
							<div class="styLNLeftNumBox" style="width:8mm;">11</div>
							<div class="styLNDesc" style="width:123mm;padding-left:1mm;font-weight:bold;">
								Total de depósitos para este trimestre, incluyendo toda cantidad pagada en exceso
								aplicada de un trimestre anterior, y toda cantidad pagada en exceso aplicada del
								Formulario 941-X (PR), 941-X, 944-X (SP), 944-X (PR) o 944-X radicado en el trimestre en
								<span style="float:left;"> curso </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">............................</span>
							</div>
						</span>
						<span style="float:right;padding-top:8mm;">
							<div class="styIRS941RightNumBox" style="width:10mm;">11</div>
							<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxDepositAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					<!--Line 12-->
					<div style="width:187mm;float:none;clear:both;">
						<span style="float:left;">
							<div class="styLNLeftNumBox" style="width:8mm;padding-top:0mm;">12</div>
							<div class="styLNDesc" style="width:123mm;padding-left:1mm;padding-top:0mm;">
								<b>Saldo adeudado.</b> Si la línea <b>10</b> es mayor que la línea <b>11</b>, anote la diferencia y vea las
								<span style="float:left;"> instrucciones </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">..........................</span>
							</div>
						</span>
						<span style="float:right;padding-top:1mm;">
							<div class="styIRS941RightNumBox" style="width:10mm;">12</div>
							<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/BalanceDueAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					<!--Line 13-->
					<div style="width:187mm;height:14mm;float:none;clear:both;">
						<div class="styLNLeftNumBox" style="width:8mm;">13</div>
						<div class="styLNDesc" style="width:98.5mm;padding-left:1mm;">
							<b>Contribución pagada en exceso.</b> Si la línea <b>11</b> es mayor que la línea
							<b>10</b>, <span style="float:left;">anote la diferencia </span>
							<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
						</div>
						<div class="styLNCtrNumBox" style="width:33mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/OverpaidAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:16mm;height:8mm;text-align:center;padding-top:2.5mm;">
							Marque uno
						</div>
						<div style="padding-top:2.5mm;float:left;">
							<input type="checkbox" alt="AplíqueseALaPróximaPlanilla" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
									<xsl:with-param name="BackupName">941PRApplyOverpaymentNextReturnInd</xsl:with-param>
								</xsl:call-template>
							</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
								<xsl:with-param name="BackupName">941PRApplyOverpaymentNextReturnInd</xsl:with-param>
							</xsl:call-template>
							<span style="font-size:8pt;">Aplíquese a la<br/>próxima planilla.</span>
						</label>
						</div>
						<div style="float:right;">
						<input type="checkbox" alt="EnvíeUnReembolso" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
								<xsl:with-param name="BackupName">941PRRefundOverpaymentInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
								<xsl:with-param name="BackupName">941PRRefundOverpaymentInd</xsl:with-param>
							</xsl:call-template>
							<span style="font-size:8pt;">Envíe un reembolso.</span>
						</label>
						</div>
					</div>
					<div style="width:187mm;padding-bottom:0mm;float:none;clear:both;">
						<span style="float:left;padding-bottom:0mm;">
							<div class="styLNLeftNumBox" style="width:8mm;padding-bottom:0mm;"/>		
							<div class="styLNDesc" style="width:130mm;padding-left:1mm;padding-bottom:0mm;">
								<img src="{$ImagePath}/941SSPR_Bullet.gif" alt="Bullet Image"/>
								<b>TIENE</b> que completar ambas páginas del Formulario 941-PR y luego <b>FIRMARLO.</b>
							</div>
						</span>
						<span style="float:right;padding-bottom:0mm;">
							<div style="width:30mm;text-align:right;padding-bottom:0mm;">
								<img src="{$ImagePath}/941SSPR_NextES.GIF" alt="Next Page Arrow Image (ES)"/>
							</div>
						</span>
					</div>					
				</div>
		<!-- Page boundary -->
		<div class="pageEnd" style="width:187mm;float:none;clear:both;">
			<span style="float:left;clear:none;font-weight:bold;width:117mm;padding-top:0mm;">Para el Aviso sobre la Ley de Confidencialidad de Información y la Ley de Reducción de Trámites, vea el dorso del Comprobante de Pago.</span>
			<span style="float:left;clear:none;margin-left:5mm;padding-top:1.2mm;">Cat. No. 17009J</span>
			<span style="float:right;clear:none;padding-top:0.4mm;">Formulario <span class="styBoldText" style="font-size:9pt;">
				<xsl:if test="/AppData/Parameters/SubmissionType='941SS'">941-SS</xsl:if>
				<xsl:if test="/AppData/Parameters/SubmissionType='941PR'">941-PR</xsl:if>
			</span> (Rev. 1-2015)</span>
		</div>
		<p style="page-break-before: always"/>
		<!--Begin Page 2-->
		<div style="width:187mm;float:none;clear:both;">
			<!--Name Shown on return-->
			<div class="styBB" style="width:187mm;font-size:7pt;border-top-width:2px;float:none;clear:both;">
				<div class="styFNBox" style="width:126mm; height:8.5mm;">
					<b>Nombre</b> (el de usted, no el de su negocio)<br/>
					<xsl:call-template name="PopulateReturnHeaderFiler">
						<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param> 
					</xsl:call-template><br/>
					<xsl:call-template name="PopulateReturnHeaderFiler">
						<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param> 
					</xsl:call-template>
					<div style="line-height:100%; font-family:verdana;font-size:7pt"/>
				</div>
                <span style="padding-left:.5mm">
					<b>Número de identificación patronal <i>(EIN)</i></b>
				</span><br/>
                <div style="text-align:center;padding-top:2mm;padding-left:.5mm">
					<xsl:call-template name="PopulateReturnHeaderFiler">
						<xsl:with-param name="TargetNode">EIN</xsl:with-param> 
					</xsl:call-template>
				</div>
			</div>
		</div>
		<!--Part 2-->
		<div class="styBB" style="width:187mm;float:none;clear:both;">			
			<div class="styPartName" style="width:13mm;text-align:center;height:6mm;padding-top:1mm;font-size:9pt;">Parte 2:</div>
			<div class="styPartDesc" style="width:173.9mm;text-align:left;height:6mm;padding-top:1mm;padding-left:2mm;font-size:9pt;">Infórmenos sobre su itinerario de depósitos y obligación contributiva para este trimestre.</div>
		</div>
		<div style="width:187;float:none;clear:both;">
			<div class="styLNDesc" style="width:187mm;font-weight:bold;padding-left:2mm;font-size:8pt;">
				Si no está seguro de si es depositante de itinerario mensual o de itinerario bisemanal, vea el apartado 11 de la Pub. 
				179 (Circular PR).
			</div>
			<!--Line 14-->
			<div style="width:187mm;padding-bottom:1mm;padding-top:1.4mm;mm;font-size:8pt;float:none;clear:both;">
				<div class="styLNLeftNumBox" style="width:8mm;">14</div>
				<div class="styLNDesc" style="width:20mm;padding-left:1mm;height:25mm">
					<b>Marque uno:</b>
				</div>
				<input type="checkbox" alt="TotalImpuestosMenosCantidadLímite" class="styCkbox">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/TotalTaxLessThanLimitAmtInd"/>
						<xsl:with-param name="BackupName">941PRTotalTaxLessThanLimitAmtInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<label style="padding-left:3mm;width:154.5mm;vertical-align:top;">
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$FormData/TotalTaxLessThanLimitAmtInd"/>
						<xsl:with-param name="BackupName">941PRTotalTaxLessThanLimitAmtInd</xsl:with-param>
					</xsl:call-template>
					<span style="width:150mm;padding-top:1mm;font-size:7pt;">
						<b>La línea 10 de esta planilla o de la planilla del trimestre anterior es menos de 
						$2,500 y usted no tuvo una obligación de depositar $100,000 el próximo día durante el trimestre en curso.</b> 
						Si la línea <b>10</b> del trimestre anterior era menos de $2,500 pero la línea <b>10</b> de la planilla en 
						curso es $100,000 o más, usted tiene que proveer un registro de su obligación contributiva. Si es depositante 
						de itinerario mensual, complete el itinerario de depósitos, a continuación; si es depositante de itineratio 
						bisemanal, adjunte el Anexo B (Formulario 941-PR). Pase a la Parte 3.</span>
				</label>
				<br/><br/>
				<input type="checkbox" alt="DepositanteMensualHorario" class="styCkbox">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorGrp/MonthlyScheduleDepositorInd"/>
						<xsl:with-param name="BackupName">941PRMonthlyScheduleDepositorInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<label style="padding-left:3mm;width:155mm;vertical-align:top;">
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorGrp/MonthlyScheduleDepositorInd"/>
						<xsl:with-param name="BackupName">941PRMonthlyScheduleDepositorInd</xsl:with-param>
					</xsl:call-template>
					<span style="width:150mm;padding-top:1mm;font-size:7pt;">
						<b>Era depositante de itinerario mensual para todo el trimestre.</b> Anote la obligación contributiva para cada mes y la 
						obligación contributiva para el trimestre, luego, pase a la Parte 3.</span>
				</label>
			</div>
			<div style="width:187mm;height:7mm;float:none;clear:both;">
				<div class="styLNDesc" style="font-weight:bold;width:83mm;padding-top:3mm;text-align:right;padding-right:4mm;padding-left:35mm;">
					<div style="float:left;text-align:left;">Obligación contributiva:</div>Mes 1
				</div>
				<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorGrp/TaxLiabilityMonth1Amt"/>
					</xsl:call-template>
				</div>
			</div>
			<div style="width:187mm;height:7mm;float:none;clear:both;">
				<div class="styLNDesc" style="font-weight:bold;width:83mm;padding-right:4mm;padding-top:3mm;text-align:right;">
					Mes 2
				</div>
				<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorGrp/TaxLiabilityMonth2Amt"/>
					</xsl:call-template>
				</div>
			</div>
			<div style="width:187mm;height:7mm;float:none;clear:both;">
				<div class="styLNDesc" style="font-weight:bold;width:83mm;padding-right:4mm;padding-top:3mm;text-align:right;">
					Mes 3
				</div>
				<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorGrp/TaxLiabilityMonth3Amt"/>
					</xsl:call-template>
				</div>
			</div>
			<div style="width:187mm;height:7mm;padding-bottom:3mm;float:none;clear:both;">
				<div class="styLNDesc" style="font-weight:bold;width:83mm;padding-top:3mm;padding-right:4mm;text-align:right;">
					Total para el trimestre
				</div>
				<div class="styLNCtrNumBox" style="width:46mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorGrp/TotalQuarterTaxLiabilityAmt"/>
					</xsl:call-template>
				</div>
				<div class="styLNDesc" style="font-weight:bold;width:50mm;padding-left:2mm;padding-top:3mm;">
					El total tiene que ser igual a la línea 10.
				</div>
			</div>
			<div style="width:187mm;padding-left:29mm;float:none;clear:both;">
				<input type="checkbox" alt="DepositanteBisemanalHorario" class="styCkbox">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/SemiweeklyScheduleDepositorInd"/>
						<xsl:with-param name="BackupName">941PRSemiweeklyScheduleDepositorInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<label style="padding-left:3mm;width:155mm;vertical-align:top;">
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$FormData/SemiweeklyScheduleDepositorInd"/>
						<xsl:with-param name="BackupName">941PRSemiweeklyScheduleDepositorInd</xsl:with-param>
					</xsl:call-template>
					<span style="width:148mm;padding-top:1mm;">
					<b>Era depositante de itinerario bisemanal durante cualquier parte de este trimestre.</b> Complete el Anexo B (Formulario 941-PR): Registro de la Obligación Contributiva
					 para los Depositantes de Itinerario Bisemanal, y adjúntelo al Formulario 941-PR. </span>
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$FormData/SemiweeklyScheduleDepositorInd"/>
					</xsl:call-template>
				</label>
			</div>
		</div>
		<!--Part 3-->
		<div class="styBB" style="width:187mm;border-top-width:1px;float:none;clear:both;">	
			<div class="styPartName" style="width:13mm;text-align:center;height:6mm;padding-top:1mm;font-size:9pt;">Parte 3:</div>
			<div class="styPartDesc" style="width:173.9mm;text-align:left;height:6mm;padding-top:1mm;padding-left:2mm;font-size:9pt;">Infórmenos sobre su negocio. Si cualquiera de las preguntas NO corresponde a su negocio, déjela en blanco.</div>
		</div>
		<div style="width:187mm;font-size:8pt;float:none;clear:both;">		
			<!--Line 15-->
			<div style="width:187mm;padding-bottom:1mm;padding-top:1mm;float:none;clear:both;">
				<div class="styLNLeftNumBox" style="width:8mm;">15</div>
				<div class="styLNDesc" style="width:147mm;padding-left:1mm;font-weight:bold;">
					<span style="float:left;">Si su negocio ha dejado de operar o si usted ha dejado de pagar salarios </span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
				</div>
				<input type="checkbox" alt="FuturoNoRequierePresentación" class="styCkbox">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/BusinessClosedGrp/FutureFilingNotRequiredInd"/>
						<xsl:with-param name="BackupName">941PRFutureFilingNotRequiredInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$FormData/BusinessClosedGrp/FutureFilingNotRequiredInd"/>
						<xsl:with-param name="BackupName">941PRFutureFilingNotRequiredInd</xsl:with-param>
					</xsl:call-template>
					<span style="width:1mm;"/>Marque aquí y<br/>
				</label>
				<div class="styLNDesc" style="width:74mm;padding-left:9mm;padding-top:2mm;">
					anote la última fecha en la que pagó salarios
				</div>
				<div class="styLNCtrNumBox" style="width:25mm;border-top-width:1px;height:6mm;padding-top:1mm;">
					<xsl:call-template name="PopulateMonthDayYear">
						<xsl:with-param name="TargetNode" select="$FormData/BusinessClosedGrp/FinalWagesPaidDt"/>
					</xsl:call-template>
				</div>
				<div style="padding-top:2mm;">.</div>
			</div>
			<!--Line 16-->
			<div style="width:187mm;float:none;clear:both;">
				<div class="styLNLeftNumBox" style="width:8mm;">16</div>
				<div class="styLNDesc" style="width:147mm;padding-left:1mm;font-weight:bold;">
					<span style="float:left;">Si es patrono estacional y no tiene que radicar planillas para cada trimestre del año </span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
				</div>
				<input type="checkbox" alt="EmpleadorDeTemporada" class="styCkbox">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/SeasonalEmployerInd"/>
						<xsl:with-param name="BackupName">941PRSeasonalEmployerInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$FormData/SeasonalEmployerInd"/>
						<xsl:with-param name="BackupName">941PRSeasonalEmployerInd</xsl:with-param>
					</xsl:call-template>
					<span style="width:1mm;"/>Marque aquí.<br/>
				</label>
			</div>
		</div>
		<!--Part 4-->
		<div class="styBB" style="width:187mm;border-top-width:1px;float:none;clear:both;">
			<div class="styPartName" style="width:13mm;text-align:center;height:6mm;padding-top:1mm;font-size:9pt;">Parte 4:</div>
			<div class="styPartDesc" style="width:173.9mm;text-align:left;height:6mm;padding-top:1mm;padding-left:2mm;font-size:9pt;">¿Podemos comunicarnos con su tercero autorizado?</div>
		</div>
		<div style="width:187mm;font-size:8pt;float:none;clear:both;">
			<div class="styLNDesc" style="width:187mm;height:8mm;padding-left:9mm;padding-top:2mm;">
				<b>¿Desea permitir que un empleado, preparador remunerado u otra persona hable sobre esta planilla con el <i>
				IRS?</i></b> Vea las instrucciones para más detalles.
			</div>
			<div style="width:187mm;float:none;clear:both;padding-bottom:1.6mm;">
				<div style="width:25mm;float:left;padding-left:10mm">
					<span>
						<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
						</xsl:call-template>
						<input type="checkbox" alt="DiscutirConTercerosSí" class="styCkbox">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
								<xsl:with-param name="BackupName">941PRDiscussWithThirdPartyYesInd</xsl:with-param>
							</xsl:call-template>
						</input>
					</span>
					<label>
						<xsl:call-template name="PopulateLabelYes">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
							<xsl:with-param name="BackupName">941PRDiscussWithThirdPartyYesInd</xsl:with-param>
						</xsl:call-template>
						Sí.
					</label>
					<br/><br/><br/><br/><br/>
					<span>
						<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
						</xsl:call-template>
						<input type="checkbox" alt="DiscutirConTercerosNo" class="styCkbox">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
								<xsl:with-param name="BackupName">941PRDiscussWithThirdPartyNoInd</xsl:with-param>
							</xsl:call-template>
						</input>
					</span>
					<label>
						<xsl:call-template name="PopulateLabelNo">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
							<xsl:with-param name="BackupName">941PRDiscussWithThirdPartyNoInd</xsl:with-param>
						</xsl:call-template>
						No.
					</label>
				</div>
				<div style="width:161mm;float:right;">
					<div style="width:161mm;height:6mm;">
						<div class="styLNDesc" style="width:25mm;float:left;padding-top:1.5mm;">
							Nombre y núm. de teléfono del tercero designado
						</div>
						<div style="padding-top:3mm;float:left;">
							<div class="styLNCtrNumBox" style="width:79mm;border-top-width:1px;height:6mm;float:left;padding-top:1mm;text-align:left;padding-left:1mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeNm"/>
								</xsl:call-template>
							</div>
							<span class="styLNCtrNumBox" style="width:5mm;border:none"/>
							<div class="styLNCtrNumBox" style="width:52mm;border-top-width:1px;height:6mm;padding-top:1mm;float:right;word-wrap:break-word;">
								<xsl:if test="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePhoneNum">
									<xsl:call-template name="PopulatePhoneNumber">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePhoneNum"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeFrgnPhoneNum">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeFrgnPhoneNum"/>
									</xsl:call-template>
								</xsl:if>
							</div>
						</div>
					</div>
					<div style="width:161mm;height:6mm;padding-top:5mm;">
						<div class="styLNDesc" style="width:131mm;padding-top:2mm;">
							Escoja un número de identificación personal <i>(PIN)</i> de 5 dígitos que se debe usar al hablar con el IRS.
						</div>
						<div style="float:right;">
							<div class="styLNCtrNumBox" style="width:30mm;float:left;border-top-width:1px;height:6mm;padding-top:1mm;">
								<xsl:call-template name="PopulatePin">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePIN"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--Part 5-->
		<div class="styBB" style="width:187mm;border-top-width:1px;float:none;clear:both;">
			<div class="styPartName" style="width:13mm;text-align:center;height:6mm;padding-top:1mm;font-size:9pt;">Parte 5:</div>
			<div class="styPartDesc" style="width:173.9mm;text-align:left;height:6mm;padding-top:1mm;padding-left:2mm;font-size:9pt;">Firme aquí. TIENE que completar ambas páginas del Formulario 941-PR y luego FIRMARLO.</div>
		</div>	
		<div style="width:187mm;font-size:8pt;">
			<div class="styLNDesc" style="width:187mm;height:10mm;padding-left:13.8mm;padding-top:2mm;font-family:Arial Narrow;">
				Bajo pena de perjurio, declaro que he examinado esta planilla, incluyendo los anexos e informes adjuntos, y que, a 
				mi leal saber y entender, es verídica, correcta y completa. La declaración del preparador (que no sea el 
				contribuyente) está basada en toda información de la cual el preparador tenga conocimiento.
			</div>
			<div style="width:187mm;float:none;clear:both;">
				<div style="width:14mm;padding-right:1mm;float:left;">
					<img src="{$ImagePath}/941_Signature.GIF" alt="Signature Image"/>
				</div>
				<div style="width:18mm;height:17mm;padding-top:1mm;font-weight:bold;font-size:10pt;float:left;">
					Firme su nombre aquí
				</div>
				<div class="styLNCtrNumBox" style="width:71mm;border-top-width:1px;height:17mm;float:left;word-wrap:break-word;padding-top:1mm;text-align:left;padding-left:1mm;">
					<xsl:if test="$RtnHdrData/ReportingAgentPINGrp/PIN">
						<xsl:call-template name="PopulatePin">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/ReportingAgentPINGrp/PIN"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$RtnHdrData/PractitionerPINGrp/TaxpayerPIN">
						<xsl:call-template name="PopulatePin">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerPIN"/>
						</xsl:call-template><br/>
					</xsl:if>
					<xsl:if test="$RtnHdrData/PractitionerPINGrp/PINEnteredByCd">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/PINEnteredByCd"/>
						</xsl:call-template><br/>
					</xsl:if>
					<xsl:if test="$RtnHdrData/PractitionerPINGrp/EFIN">
						<xsl:call-template name="PopulatePin">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/EFIN"/>
						</xsl:call-template><br/>
					</xsl:if>
					<xsl:if test="$RtnHdrData/PractitionerPINGrp/PracitionerPIN">
						<xsl:call-template name="PopulatePin">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/PractitionerPIN"/>
						</xsl:call-template><br/>
					</xsl:if>
					<xsl:if test="$RtnHdrData/PractitionerPINGrp/JuratDisclosureCd">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/JuratDisclosureCd"/>
						</xsl:call-template>
					</xsl:if>
				</div>
				<div style="width:84mm;height:auto;float:left;padding-left:2mm;">
					<div style="width:28mm;height:9mm;float:left;">Escriba su nombre en letra de molde aquí</div>
					<div style="width:52mm;height:9mm;padding-top:4px;padding-left:1mm;">
						<div class="styLNCtrNumBox" style="width:53mm;border-top-width:1px;height:8mm;padding-top:1mm;text-align:left;padding-left:1mm;">
							<xsl:if test="$RtnHdrData/SignatureDocumentGrp/PersonNm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/PersonNm"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PractitionerPINGrp/TaxpayerNm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerNm"/>
								</xsl:call-template>
							</xsl:if><br/>
							<xsl:if test="$RtnHdrData/ReportingAgentPINGrp/RAPINEnteredByCd">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/ReportingAgentPINGrp/RAPINEnteredByCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<div style="width:28mm;height:8mm;float:left;">Escriba su cargo en letra de molde aquí</div>
					<div style="height:8mm;padding-top:4px;padding-bottom:0mm;float:right;">
						<div class="styLNCtrNumBox" style="width:53mm;border-top-width:1px;height:auto;padding-top:1mm;text-align:left;padding-left:1mm;">
							<xsl:if test="$RtnHdrData/SignatureDocumentGrp/PartnershipAuthorizationCd">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/PartnershipAuthorizationCd"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/SignatureDocumentGrp/CorporationAuthorizationCd">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/CorporationAuthorizationCd"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/SignatureDocumentGrp/ExemptOrgAuthorizationCd">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/ExemptOrgAuthorizationCd"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/SignatureDocumentGrp/EstateAuthorizationCd">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/EstateAuthorizationCd"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/SignatureDocumentGrp/IndividualAuthorizationCd">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/IndividualAuthorizationCd"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PractitionerPINGrp/Title">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/Title"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/ReportingAgentPINGrp/JuratDisclosureCd">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/ReportingAgentPINGrp/JuratDisclosureCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
				</div>
			</div>
			<div class="styBB" style="width:187mm;padding-bottom:1mm;padding-top:4mm;float:none;clear:both;">
				<div class="styLNDesc" style="width:31.5mm;text-align:right;padding-right:3mm;padding-top:4mm;">
					Fecha
				</div>
				<div style="padding-top:4px;float:left;">
					<div class="styLNCtrNumBox" style="width:26mm;border-top-width:1px;height:6mm;padding-top:1mm;">
						<xsl:if test="$RtnHdrData/SignatureDocumentGrp/SignatureDt">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/SignatureDt"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="$RtnHdrData/PractitionerPINGrp/TaxpayerSignatureDt">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerSignatureDt"/>
							</xsl:call-template>
						</xsl:if>
					</div>
				</div>
				<div class="styLNDesc" style="width:87mm;padding-left:47mm;padding-right:2mm;padding-top:2mm">
					Mejor núm. de teléfono donde llamarlo durante el día
				</div>
				<div style="padding-top:2mm;float:right;">
					<div class="styLNCtrNumBox" style="width:42.5mm;border-top-width:1px;height:6mm;padding-top:1mm;">
						<xsl:if test="$RtnHdrData/SignatureDocumentGrp/DaytimePhoneNum">
							<xsl:call-template name="PopulatePhoneNumber">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/DaytimePhoneNum"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="$RtnHdrData/SignatureDocumentGrp/DaytimeForeignPhoneNum">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/DaytimeForeignPhoneNum"/>
							</xsl:call-template>
						</xsl:if>
					</div>
				</div>
			</div>
			</div>		
			<div style="width:187mm;padding-bottom:3mm;float:none;clear:both;">
				<div class="styLNDesc" style="width:80mm;font-size:9pt;font-weight:bold;float:left;padding-left:1mm;">
					Para uso exclusivo del preparador remunerado
				</div>
				<div class="styLNDesc" style="width:78mm;float:right;font-size:9pt;">
					<span style="float:left;">Marque aquí si usted trabaja por cuenta propia </span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:left;padding-left:2mm;padding-right:1mm;">.</span>
					<input type="checkbox" alt="Autónomos" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
							<xsl:with-param name="BackupName">941PRSelfEmployedInd</xsl:with-param>
						</xsl:call-template>
					</input>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
							<xsl:with-param name="BackupName">941PRSelfEmployedInd</xsl:with-param>
						</xsl:call-template>
					</label>
				</div>			
			</div>		
			<div style="width:187mm;padding-bottom:3mm;float:none;clear:both;">
				<div class="styLNDesc" style="width:22mm;padding-left:2mm;padding-right:7mm;font-size:7pt;">
					Nombre del preparador
				</div>
				<div class="styLNCtrNumBox" style="width:102mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:left;padding-left:1mm;">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
					</xsl:call-template>
				</div>
				<div class="styLNDesc" style="width:17mm;padding-left:3mm;padding-top:2mm;">
					<i>PTIN</i>
				</div>
				<div class="styLNCtrNumBox" style="width:44.8mm;border-top-width:1px;height:6mm;padding-top:1mm;float:right;">
					<xsl:choose>
							<xsl:when test="$RtnHdrData/PaidPreparerInformationGrp/PTIN">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PTIN"/>
									</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerSSN"/>
									</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
				</div>
			</div>		
			<div style="width:187mm;float:none;clear:both;">
				<div class="styLNDesc" style="width:22mm;padding-left:2mm;padding-right:9mm;font-size:7pt;">
					Firma del preparador
				</div>
				<div class="styLNCtrNumBox" style="width:102mm;border-top-width:1px;height:6mm;word-wrap:break-word;padding-top:1mm;text-align:left;padding-right:1mm;padding-left:1mm;">
				</div>
				<div class="styLNDesc" style="width:17mm;padding-left:3mm;padding-top:2mm;">
					Fecha
				</div>
				<div class="styLNCtrNumBox" style="width:44.8mm;border-top-width:1px;height:6mm;padding-top:1mm;float:right;">
					<xsl:call-template name="PopulateMonthDayYear">
						<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SignatureDt"/>
					</xsl:call-template>
				</div>
			</div>		
			<div style="width:187mm;padding-bottom:2mm;float:none;clear:both;">
				<div class="styLNDesc" style="width:22mm;padding-left:2mm;padding-right:2.5mm;padding-top:4mm;font-size:7pt;">
					Nombre de la empresa (o el suyo, si trabaja por cuenta propia)
				</div>
				<div style="padding-top:12px;float:left;">
					<div class="styLNCtrNumBox" style="width:102mm;border-top-width:1px;height:auto;text-align:left;padding-left:1mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine1Txt"/>
						</xsl:call-template><br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine2Txt"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styLNDesc" style="width:17mm;padding-left:3mm;padding-top:5mm">
					<i>EIN</i>
				</div>
				<div style="padding-top:12px;float:right;">
					<div class="styLNCtrNumBox" style="width:44.8mm;border-top-width:1px;height:6mm;padding-top:1mm;">
						<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN">
							<xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReasonCd">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReasonCd"/>
							</xsl:call-template>
						</xsl:if>
					</div>
				</div>
			</div>		
			<div style="width:187mm;padding-bottom:2mm;float:none;clear:both;">
				<div class="styLNDesc" style="width:22mm;padding-left:2mm;padding-right:1mm;padding-top:8mm;font-size:7pt;">
					Dirección
				</div>
				<div style="padding-top:15px;float:left;">
					<div class="styLNCtrNumBox" style="width:102mm;border-top-width:1px;height:8mm;text-align:left;padding-left:1mm;">
						<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/AddressLine1Txt"/>
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/AddressLine2Txt"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/AddressLine1Txt"/>
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/AddressLine2Txt"/>
							</xsl:call-template>
						</xsl:if>
					</div>
				</div>						
				<div class="styLNDesc" style="width:17mm;padding-left:3mm;padding-top:4mm;padding-right:2mm;">
					Núm. de teléfono
				</div>
				<div style="padding-top:15px;float:right;">
					<div class="styLNCtrNumBox" style="width:44.8mm;border-top-width:1px;height:7mm;padding-top:1mm;word-wrap:break-word;">
						<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PhoneNum">
							<xsl:call-template name="PopulatePhoneNumber">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PhoneNum"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/ForeignPhoneNum">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/ForeignPhoneNum"/>
							</xsl:call-template>
						</xsl:if>
					</div>
				</div>
			</div>		
			<div class="styBB" style="width:187mm;border-bottom-width:2px;padding-bottom:0.6mm;float:none;clear:both;">
				<div class="styLNDesc" style="width:22mm;padding-left:2mm;padding-right:1mm;padding-top:4mm;font-size:7pt;">
					Ciudad
				</div>
				<xsl:choose>
					<xsl:when test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
						<div style="padding-top:5px;float:left;">
							<div class="styLNCtrNumBox" style="width:49.8mm;border-top-width:1px;height:7mm;padding-top:1mm;text-align:left;padding-left:1mm;word-wrap:break-word;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/CityNm"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNDesc" style="width:10mm;padding-top:4mm;font-size:7pt;text-align:center;">
							Estado
						</div>
						<div style="padding-top:5px;float:left;">
							<div class="styLNCtrNumBox" style="width:25mm;border-top-width:1px;height:7mm;padding-top:1mm;word-wrap:break-word;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/ProvinceOrStateNm"/>
								</xsl:call-template>	
							</div>
						</div>
						<div class="styLNDesc" style="width:10mm;padding-top:4mm;font-size:7pt;text-align:center;">
							País
						</div>
						<div style="padding-top:5px;float:left;">
							<div class="styLNCtrNumBox" style="width:8mm;border-top-width:1px;height:7mm;padding-top:1mm;word-wrap:break-word;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/CountryCd"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNDesc" style="width:17mm;padding-top:2mm;padding-left:3mm;padding-right:0mm;">
							Código<br/>postal <i>(ZIP)</i>
						</div>
						<div style="padding-top:5px;float:right;">
							<div class="styLNCtrNumBox" style="width:44.8mm;border-top-width:1px;height:7mm;padding-top:1mm;word-wrap:break-word;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/ForeignPostalCd"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:when>
					<xsl:otherwise>
						<div style="padding-top:5px;float:left;">
							<div class="styLNCtrNumBox" style="width:65mm;border-top-width:1px;height:7mm;padding-top:1mm;text-align:left;padding-left:1mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/CityNm"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNDesc" style="width:15mm;padding-left:5mm;padding-top:4mm;font-size:7pt;">
							Estado
						</div>
						<div style="padding-top:5px;float:left;">
							<div class="styLNCtrNumBox" style="width:10mm;border-top-width:1px;height:6mm;padding-top:1mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/StateAbbreviationCd"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNDesc" style="width:19.8mm;padding-left:2mm;padding-right:0mm;">
							Código<br/>postal <i>(ZIP)</i>
						</div>
						<div style="padding-top:5px;float:right;">
							<div class="styLNCtrNumBox" style="width:44.8mm;border-top-width:1px;height:6mm;padding-top:1mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/ZIPCd"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:otherwise>
				</xsl:choose>
			</div>
		</div>
		<!--Page Footer-->
		<div class="pageEnd" style="width:187mm;">
			<span style="float:left;clear:none;">Página <span class="styBoldText" style="font-size:9pt;">2</span></span>
			<span style="float:right;clear:none;">Formulario <span class="styBoldText" style="font-size:9pt;">
				<xsl:if test="/AppData/Parameters/SubmissionType='941SS'">941-SS</xsl:if>
				<xsl:if test="/AppData/Parameters/SubmissionType='941PR'">941-PR</xsl:if>
			</span> (Rev. 1-2015)</span>
		</div>
    <!-- BEGIN Left Over Table -->
		<!-- Additonal Data Title Bar and Button -->
		<div class="styLeftOverTitleLine" id="LeftoverData">
			<div class="styLeftOverTitle" style="float:left;">
				Additional Data        
			</div>
			<div class="styLeftOverButtonContainer" style="float:right;">
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
</xsl:stylesheet>