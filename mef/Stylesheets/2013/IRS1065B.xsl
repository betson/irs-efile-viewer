<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by James Ganzy on 09/18/2015 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1065BStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form1065BData" select="$RtnDoc/IRS1065B"/>
	<xsl:param name="Form1065BScheduleB" select="$Form1065BData/IRS1065BScheduleB"/>
	<xsl:param name="Form1065BScheduleD" select="$Form1065BData/IRS1065BScheduleD"/>
	<xsl:param name="Form1065BScheduleK" select="$Form1065BData/IRS1065BScheduleK"/>
	<xsl:param name="Form1065BScheduleL" select="$Form1065BData/IRS1065BScheduleL"/>
	<xsl:param name="Form1065BScheduleM1" select="$Form1065BData/IRS1065BScheduleM1"/>
	<xsl:param name="Form1065BScheduleM2" select="$Form1065BData/IRS1065BScheduleM2"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form1065BData)"/>
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
				<meta name="Description" content="IRS Form 1065B"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1065BStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form1065B">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:33mm;height:20mm;">Form 
                        <span class="styFormNumber">1065-B</span>
							<br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BData"/>
							</xsl:call-template>
							<span style="width:3px;"/>
							<xsl:if test="$Form1065BData/SpecialConditionDesc">
                               <xsl:call-template name="LinkToLeftoverDataTableInline">
                                 <xsl:with-param name="Desc">Special Condition Description</xsl:with-param>
                                 <xsl:with-param name="TargetNode" select="$Form1065BData/SpecialConditionDesc"/>
                              </xsl:call-template>
							</xsl:if>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1065B, Top Left Margin - Section 761(a) election</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1065BData/Section761aElectionInd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1065B, Top Left Margin - Section 1291 Interest Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1065BData/@section1291InterestIndicator"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1065B, Top Left Margin - Section 1291 Interest Amount</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1065BData/@section1291InterestAmount"/>
								<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1065B, Top Left Margin - Section 1294 Interest Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1065BData/@section1294InterestIndicator"/>
								<xsl:with-param name="Style">padding-left:6mm;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1065B, Top Left Margin - Section 1294 Interest Amount</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1065BData/@section1294InterestAmount"/>
								<xsl:with-param name="Style">padding-left:9mm;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1065B, Top Left Margin - Section 501d Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1065BData/@section501dIndicator"/>
								<xsl:with-param name="Style">padding-left:12mm;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1065B, Top Left Margin - Subchapter T Cooperative Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1065BData/@subchapterTCoopIndicator"/>
								<xsl:with-param name="Style">padding-left:12mm;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1065-B, Top Left Margin - Common Trust</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1065BData/CommonTrustInd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1065-B, Top Left Margin - Nominee</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1065BData/NomineeInd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1065-B, Top Left Margin - IRC 6114</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRC6114Ind"/>
							</xsl:call-template>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:117mm;height:20mm;">
							<div class="styMainTitle" style="width:91mm;height:10mm;">U .S. Return of Income for <br/>Electing Large Partnerships</div>
							<div class="styFST" style="width:117mm;height:5mm;font-size:7pt;text-align:center;">For calendar year 
                            <span style="width:9mm;">
									<xsl:call-template name="PopulateReturnHeaderTaxYear"/>,
							</span>  or tax year beginning
                            <span style="width:16.5mm;border-bottom:1 solid black;">
									<!-- No need to send the parameters -->
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
								</span>,and ending 
                            <span style="width:16.5mm;border-bottom:1 solid black;">
									<!-- No need to send the parameters -->
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
								</span>
								<br/>
								<span style="text-align:center;">
									<img src="{$ImagePath}/1065B_Bullet_Md.gif" alt="MediumBullet"/>Information about Form 1065-B and its separate instructions is at 
                            
                               <a href="http://www.irs.gov/form1065b" title="Link to IRS.gov"><i>www.irs.gov/form1065b</i></a>.</span>
							</div>
						</div>
						<div class="styTYBox" style="width:35mm;height:20mm;">
							<div class="styOMB" style="width:35mm;">OMB No. 1545-1626</div>
							<div class="styTY" style="height:11mm;padding-top:3mm;">20<span class="styTYColor">13</span>
							</div>
						</div>
					</div>
					<div style="width:187mm;float:left;clear:left;">
						<div style="width:32.7mm;height:25mm;float:left;clear:left;">
							<div class="styEINDateAssets" style="width:33mm;height:13mm;padding-left:0mm;">
								<b>A </b> Principal business activity
                            <br/>
								<span class="styGenericDiv" style="padding-left:2mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065BData/PrincipalBusinessActivityDesc"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styEINDateAssets" style="width:32.7mm;height:13mm;padding-left:0mm;">
								<b>B </b> Principal product or service
                            <br/>
								<span class="styGenericDiv" style="padding-left:2mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065BData/PrincipalProductDesc"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styEINDateAssets" style="width:32.7mm;height:12mm;padding-left:0mm;border-bottom-width:1px;">
								<b>C </b> Business code no.<br/>
								<span class="styGenericDiv" style="padding-left:2mm;">(see instructions)</span><br/>
								<span class="styGenericDiv" style="padding-left:2mm;padding-top:3mm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065BData/PrincipalBusinessActivityCd"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- return header address box -->
						<div class="styLblNameAddr" style="width:117.5mm;height:auto;">
							<div class="styUseLbl" style="width:12mm;height:32mm;padding-top:13mm;border-right-width:0px;">TYPE<br/>or<br/>PRINT</div>
							<div class="styNameAddr" style="width:103.9mm;height:12mm;border-left-width:1px;padding-left:1px;">Name of partnership<br/>
								<span class="stySmallText" style="padding-left:2mm;padding-top:.5mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div class="styNameAddr" style="width:103.9mm;height:13mm;border-left-width:1px;">
        Number, street, and room or suite no. If a P.O. box, see instructions.<br/>
								<span class="stySmallText" style="padding-left:2mm;padding-top:.5mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div class="styNameAddr" style="height:12mm;border-bottom-width:0px;width:103.9mm;border-left-width:1px;">
        City or town, state or province, country, and ZIP or foreign postal code<br/>
								<span class="stySmallText" style="width:103.9mm;padding-left:2mm;padding-top:.5mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">Country</xsl:with-param>
										<xsl:with-param name="MainForm">true</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Since this is a main form, we must check for and display an updated EIN.  To do this, we use the EINChanged parameter PopulateReturnHeaderFiler.-->
						<div class="styEINDateAssets" style="width:36mm;height:13mm;padding-left:.5mm;">
							<b>D Employer identification number</b>
							<br/>							
							<span class="styGenericDiv" style="padding-left:2mm;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="EINChanged">true</xsl:with-param>
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div class="styEINDateAssets" style="width:36mm;height:13mm;padding-left:.5mm;">
							<b>E </b>Date business started
                        <br/>
							<span class="styGenericDiv" style="padding-top:4mm;padding-left:2mm;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form1065BData/BusinessOperationStartDt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styEINDateAssets" style="width:36mm;height:12mm;padding-left:.5mm;border-bottom-width:1px;">
							<div class="styLNDesc" style="width:36mm;"><b>F </b>Total assets (see instructions)</div>
							<div class="styLNDesc" style="width:36mm;padding-bottom:0mm;padding-top:4mm;">
								<div class="styLNDesc" style="width:2mm;padding-bottom:0mm;">$</div>
								<div class="styLNAmountBox" style="width:34mm;padding-bottom:0mm;border-left-width:0mm;border-bottom-width:0mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/TotalAssetsAmt"/>
									</xsl:call-template>
								</div>
							</div>		
						</div>
						<br/>
					</div>
					<div class="styNBB" style="height:auto;width:187mm;">
						<div class="styBoldText" style="width:6mm;float:left;clear:none;padding-top:2mm;padding-left:3mm;">G</div>
						<div class="styLNDesc" style="width:178mm;">
      Check applicable boxes: <span style="width:4mm;"/>
							<span class="styBoldText">(1)</span>
							<span style="width:3px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065BData/FinalReturnInd"/>
									<xsl:with-param name="BackupName">IRS1065BFinalReturn</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065BData/FinalReturnInd"/>
									<xsl:with-param name="BackupName">IRS1065BFinalReturn</xsl:with-param>
								</xsl:call-template>
         Final return
                        </label>
							<span style="width:4px"/>
							<span class="styBoldText">(2)</span>
							<span style="width:3px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065BData/NameChangeInd"/>
									<xsl:with-param name="BackupName">IRS1065BNameChange</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065BData/NameChangeInd"/>
									<xsl:with-param name="BackupName">IRS1065BNameChange</xsl:with-param>
								</xsl:call-template>
        Name Change
                        </label>
							<span style="width:4px"/>
							<span class="styBoldText">(3)</span>
							<span style="width:3px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065BData/AddressChangeInd"/>
									<xsl:with-param name="BackupName">IRS1065BAddressChange</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065BData/AddressChangeInd"/>
									<xsl:with-param name="BackupName">IRS1065BAddressChange</xsl:with-param>
								</xsl:call-template>
        Address Change
                        </label>
							<span style="width:3px"/>
							<span class="styBoldText">(4)</span>
							<span style="width:3px;"/>		
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065BData/AmendedReturnInd"/>
									<xsl:with-param name="BackupName">IRS1065BAmendedReturn</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065BData/AmendedReturnInd"/>
									<xsl:with-param name="BackupName">IRS1065BAmendedReturn</xsl:with-param>
								</xsl:call-template>
									 Amended Return
							</label>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BData/AmendedReturnInd"/>
							</xsl:call-template>
							
						<xsl:if test="$Form1065BData/SupersededReturnInd">
                               <xsl:call-template name="LinkToLeftoverDataTableInline">
                                 <xsl:with-param name="Desc">G(5) Superseded Returns</xsl:with-param>
                                 <xsl:with-param name="TargetNode" select="$Form1065BData/SupersededReturnInd"/>
                              </xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styBoldText" style="width:6mm;float:left;clear:none;padding-top:2mm;padding-left:3mm;">H</div>
						<div class="styLNDesc" style="width:126mm;">
      Check accounting method: 
                        <span style="width:1mm;"/>
							<span class="styBoldText">(1)</span>
							<span style="width:3px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065BData/MethodOfAccountingCashInd"/>
									<xsl:with-param name="BackupName">IRS1065BMethodOfAccountingCash</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065BData/MethodOfAccountingCashInd"/>
									<xsl:with-param name="BackupName">IRS1065BMethodOfAccountingCash</xsl:with-param>
								</xsl:call-template>
         Cash
                        </label>
							<span style="width:9.3mm;"/>
							<span class="styBoldText">(2)</span>
							<span style="width:3px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065BData/MethodOfAccountingAccrualInd"/>
									<xsl:with-param name="BackupName">IRS1065BMethodOfAccountingAccrual</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065BData/MethodOfAccountingAccrualInd"/>
									<xsl:with-param name="BackupName">IRS1065BMethodOfAccountingAccrual</xsl:with-param>
								</xsl:call-template>
         Accrual
                        </label>
							<span style="width:9.3mm;"/>
							<span class="styBoldText">(3)</span>
							<span style="width:3px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065BData/MethodOfAccountingOtherInd"/>
									<xsl:with-param name="BackupName">IRS1065BMethodOfAccountingOther</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065BData/MethodOfAccountingOtherInd"/>
									<xsl:with-param name="BackupName">IRS1065BMethodOfAccountingOther</xsl:with-param>
								</xsl:call-template>
         Other (specify)
                        </label>
							<img src="{$ImagePath}/1065B_Bullet_Sm.gif" alt="MidSizeBullet"/>
						</div>
						<div class="styFixedUnderline" style="width:55mm;padding-top:2mm;padding-bottom:0mm;border-style: dotted;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1065BData/MethodOfAccountingOtherInd/@otherDesc"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styLNDesc" style="width:187mm;">
						<div class="styBoldText" style="width:6mm;float:left;clear:none;padding-top:.8mm;padding-left:3mm;">I</div>
						<div class="styLNDesc" style="width:125mm;font-size:6pt;">
      Number of Schedules K-1. Attach one for each person who was a partner at any time during the tax year 
                        <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BData/K1SchedulesNum"/>
							</xsl:call-template>
							<span style="width:3.8mm;"/>
							<img src="{$ImagePath}/1065B_Bullet_Sm.gif" alt="MidSizeBullet"/>
						</div>
						<div class="styUnderlineAmount" style="width:55mm;border-style: dotted;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/K1SchedulesNum"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;padding-bottom:.5mm;padding-top:.5mm">
						<div class="styBoldText" style="width:6mm;float:left;clear:none;padding-top:1.5mm;padding-left:3mm;">J</div>
						<div class="styLNDesc" style="width:150mm;font-size:7pt;">
      Check if Schedule M-3 (Form 1065) is attached
                        <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BData/ScheduleM3RequiredInd"/>
							</xsl:call-template>
							<span style="width:1mm;"/>
							<span class="styDotLn" style="float:none;clear:none;padding-left:0mm;">..............</span>
							<span style="width:1mm;"/>
								<img src="{$ImagePath}/1065B_Bullet_Sm.gif" alt="MidSizeBullet"/>
							<span style="width:8mm;"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065BData/ScheduleM3RequiredInd"/>
										<xsl:with-param name="BackupName">IRS1065BScheduleM3Required</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1065BData/ScheduleM3RequiredInd"/>
										<xsl:with-param name="BackupName">IRS1065BScheduleM3Required</xsl:with-param>
									</xsl:call-template>
								</label>
						</div>
					</div>
					<!--BEGIN Main Form Income Section-->
					<!--James-border-style:solid;border-color:black;border-width:1px 1px 1px 1px;-->
					<!--Part I-->
					<div class="styBB" style="width:187mm;border-top:1px black solid;">
						<div class="styBB" style="width:187mm;">
							<div class="styPartName" style="height:4mm;width:13mm;">Part I</div>
							<div class="styPartDesc" style="width:164mm;">Taxable Income or Loss From Passive Loss Limitation Activities</div>
						</div>
						<div class="styIRS1065BVTImageBox" style="height:46.5mm;padding-top:20mm;">
							<img src="{$ImagePath}/1065B_Income.gif" alt="VerticalIncome"/>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-bottom:0mm;">
								<span class="styBoldText" style="font-size:7pt;padding-left: 1.25mm">1a</span>
							</div>
							<!--line 1-->
							<div class="styLNDesc" style="width:25mm;padding-bottom:0mm;">
								<span class="font-size:6pt; font-family:arial;font-size:7pt;">Gross receipts or<br/> sales
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065BData/GrossReceiptsOrSalesAmt"/>
								</xsl:call-template>
								</span>
							</div>
							<!--Box 1a-->
							<div class="styLNAmountBox" style="height:6.5mm;border-right-width: 1px;padding-top:3mm;padding-bottom:0mm;">
								<span style="text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/GrossReceiptsOrSalesAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- 1b-->
							<div class="styLNDesc" style="width:30mm;padding-left:2mm;padding-top:.8mm;padding-bottom:0mm;">
								<span class="styBoldText" style="width:3mm;float:left;clear:none;">b</span>
								<span class="width:26mm;font-size:6pt; font-family:Arial" style="float:left;clear:none;">Less returns and<br/>allowances</span>
							</div>
							<!--Box 1b-->
							<div class="styLNAmountBox" style="height:6.5mm;border-right-width: 1px;padding-top:3mm;padding-bottom:0mm;">
								<span style="text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/ReturnsAndAllowancesAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNDesc" style="width:13.1mm;padding-left:3mm;padding-top:3mm;padding-bottom:0mm;">
								<span class="styBoldText">c</span> Bal <img src="{$ImagePath}/1065B_Bullet_Sm.gif" alt="MidSizeBullet"/>
							</div>
							<!-- Box 1c-->
							<div class="styLNRightNumBox" style="height:6.5mm;padding-top:3mm;padding-bottom:0mm;">1c</div>
							<div class="styLNAmountBox" style="height:6.5mm;padding-top:3mm;padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/NetGrossReceiptsOrSalesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left: 2.25mm;padding-bottom:0mm;">2</div>
							<div class="styLNDesc" style="width:132mm;padding-bottom:0mm;">
								<span style="float:left;clear:none;">Cost of goods sold (attach Form 1125-A)</span>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065BData/CostOfGoodsSoldAmt"/>
								</xsl:call-template>
        <!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">.................</span>
							</div>
							<div class="styLNRightNumBox" style="padding-bottom:0mm;">2</div>
							<div class="styLNAmountBox" style="padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/CostOfGoodsSoldAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left: 2.25mm;padding-bottom:0mm;">3</div>
							<div class="styLNDesc" style="width:132mm;padding-bottom:0mm;">
								<span style="float:left;clear:none;">Gross profit. Subtract line 2 from line 1c</span>
        <!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...................</span>
							</div>
							<div class="styLNRightNumBox" style="padding-bottom:0mm;">3</div>
							<div class="styLNAmountBox" style="padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/GrossProfitAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left: 2.25mm;padding-bottom:0mm;">4</div>
							<div class="styLNDesc" style="width:132mm;padding-bottom:0mm;">
								<span style="float:left;clear:none;">Net rental real estate income (loss) (attach Form 8825)
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/NetIncomeLossAmt"/>
									</xsl:call-template>
								</span>	
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.............</span>
							</div>
							<div class="styLNRightNumBox" style="padding-bottom:0mm;">4</div>
							<div class="styLNAmountBox" style="padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/NetIncomeLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left: 2.25mm;padding-bottom:0mm;">5</div>
							<div class="styLNDesc" style="width:132mm;padding-bottom:0mm;">
								<span style="float:left;clear:none;">Net income (loss) from other rental activities (attach statement)
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/NetRentalIncomeOrLossAmt"/>
									</xsl:call-template>
								</span>	
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..........</span>
							</div>
							<div class="styLNRightNumBox" style="padding-bottom:0mm;">5</div>
							<div class="styLNAmountBox" style="padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/NetRentalIncomeOrLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left: 2.25mm;padding-bottom:0mm;">6</div>
							<div class="styLNDesc" style="width:132mm;padding-bottom:0mm;">
								<span style="float:left;clear:none;">Ordinary income (loss) from other partnerships, estates, and trusts (attach statement)
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/OrdinaryIncomeLossAmt"/>
									</xsl:call-template>
								</span>	
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>
							</div>
							<div class="styLNRightNumBox" style="padding-bottom:0mm;">6</div>
							<div class="styLNAmountBox" style="padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/OrdinaryIncomeLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left: 2.25mm;padding-bottom:0mm;">7</div>
							<div class="styLNDesc" style="width:132mm;padding-bottom:0mm;">
								<span style="float:left;clear:none;">Net farm profit (loss) (attach Schedule F (Form 1040))
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/NetFarmProfitLossAmt"/>
									</xsl:call-template>
								</span>	
							<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.............</span>
							</div>
							<div class="styLNRightNumBox" style="padding-bottom:0mm;">7</div>
							<div class="styLNAmountBox" style="padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/NetFarmProfitLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left: 2.25mm;padding-bottom:0mm;">8</div>
							<div class="styLNDesc" style="width:132mm;padding-bottom:0mm;">
								<span style="float:left;clear:none;">Excess of net short-term capital gain over net long-term capital loss (Schedule D, line 20)</span>
							<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>
							</div>
							<div class="styLNRightNumBox" style="padding-bottom:0mm;">8</div>
							<div class="styLNAmountBox" style="padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/ExcNetSTGainOverNetLTLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left: 2.25mm;padding-bottom:0mm;">9</div>
							<div class="styLNDesc" style="width:132mm;padding-bottom:0mm;">
								<span style="float:left;clear:none;">Net gain (loss) from Form 4797, Part II, line 17 (attach Form 4797)
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/TotalOrdinaryGainLossAmt"/>
									</xsl:call-template>
								</span>	
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.........</span>
							</div>
							<div class="styLNRightNumBox" style="padding-bottom:0mm;">9</div>
							<div class="styLNAmountBox" style="padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/TotalOrdinaryGainLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-bottom:0mm;">10</div>
							<div class="styLNDesc" style="width:132mm;padding-bottom:0mm;">
								<span style="float:left;clear:none;">Other income (loss) (see instructions)<!--(attach schedule)-->
									<span class="styItalicText"> (attach statement)</span>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/OtherIncomeOrLossAmt"/>
									</xsl:call-template>
								</span>	
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.............</span>
							</div>
							<div class="styLNRightNumBox" style="padding-bottom:0mm;">10</div>
							<div class="styLNAmountBox" style="padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/OtherIncomeOrLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-bottom:0mm;">11</div>
							<div class="styLNDesc" style="width:132mm;padding-bottom:0mm;">
								<span style="float:left;clear:none;"><b>Total income (loss).</b> Combine lines 3 through 10</span>
							<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...............</span>
							</div>
							<div class="styLNRightNumBoxNBB" style="padding-bottom:0mm;">11</div>
							<div class="styLNAmountBoxNBB" style="padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/TotalIncomeOrLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--END Main Form Income Section-->
					<!--BEGIN Main Form Deduction Section-->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS1065BVTImageBox" style="height:60mm;padding-top:22mm;">
							<img src="{$ImagePath}/1065B_Deductions.gif" alt="VertDeductions"/>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-bottom:0mm;">12</div>
							<div class="styLNDesc" style="width:132mm;padding-bottom:0mm;">
								<span style="float:left;clear:none;">Salaries and wages (other than to partners) (less employment credits)
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/SalariesAndWagesAmt"/>
									</xsl:call-template>
								</span>	
							<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.........</span>
							</div>
							<div class="styLNRightNumBox" style="padding-bottom:0mm;">12</div>
							<div class="styLNAmountBox" style="padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/SalariesAndWagesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-bottom:0mm;">13</div>
							<div class="styLNDesc" style="width:132mm;padding-bottom:0mm;">
								<span style="float:left;clear:none;">Guaranteed payments to partners</span>
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">....................</span>
							</div>
							<div class="styLNRightNumBox" style="padding-bottom:0mm;">13</div>
							<div class="styLNAmountBox" style="padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/GuaranteedPaymentsToPrtnrAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-bottom:0mm;">14</div>
							<div class="styLNDesc" style="width:132mm;padding-bottom:0mm;">
								<span style="float:left;clear:none;">Repairs and maintenance</span>
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.......................</span>
							</div>
							<div class="styLNRightNumBox" style="padding-bottom:0mm;">14</div>
							<div class="styLNAmountBox" style="padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/RepairsAndMaintenanceAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-bottom:0mm;">15</div>
							<div class="styLNDesc" style="width:132mm;padding-bottom:0mm;">
								<span style="float:left;clear:none;">Bad debts</span>
					  <!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">............................</span>  
							</div>
							<div class="styLNRightNumBox" style="padding-bottom:0mm;">15</div>
							<div class="styLNAmountBox" style="padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/BadDebtsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-bottom:0mm;">16</div>
							<div class="styLNDesc" style="width:132mm;padding-bottom:0mm;">
								<span style="float:left;clear:none;">Rent
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/TotalRentOrLeaseExpenseAmt"/>
									</xsl:call-template>
								</span>	
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">............................</span>
							</div>
							<div class="styLNRightNumBox" style="padding-bottom:0mm;">16</div>
							<div class="styLNAmountBox" style="padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/TotalRentOrLeaseExpenseAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-bottom:0mm;">17</div>
							<div class="styLNDesc" style="width:132mm;padding-bottom:0mm;">
								<span style="float:left;clear:none;">Taxes and licenses
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/TaxesAndLicensesAmt"/>
									</xsl:call-template>
								</span>	
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.........................</span>
							</div>
							<div class="styLNRightNumBox" style="padding-bottom:0mm;">17</div>
							<div class="styLNAmountBox" style="padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/TaxesAndLicensesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-bottom:0mm;">18</div>
							<div class="styLNDesc" style="width:132mm;padding-bottom:0mm;">
								<span style="float:left;clear:none;">Interest
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/InterestDeductionAmt"/>
									</xsl:call-template>
								</span>
					   <!--Dotted Line-->
							    <span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...........................</span>
							</div>
							<div class="styLNRightNumBox" style="padding-bottom:0mm;">18</div>
							<div class="styLNAmountBox" style="padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/InterestDeductionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-bottom:0mm;">19a</div>
							<div class="styLNDesc" style="width:92mm;font-size:6.3pt;padding-bottom:0mm;">Depreciation and section 179 expense deduction (see instructions)
                            <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065BData/DepreciationAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="padding-bottom:0mm;">19a</div>
							<div class="styLNAmountBox" style="padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/DepreciationAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="width:8.3mm;background-color:lightgrey;border-bottom-width:0px;border-right-width:1px;"/>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftLtrBox" style="padding-bottom:0mm;">
								<span style="width:4px;"/>b</div>
							<div class="styLNDesc" style="width:92mm;font-size:6.3pt;padding-bottom:0mm;">Less: depreciation reported on Form 1125-A and elsewhere 
                        on return
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/LessDepreciationAmt"/>
									</xsl:call-template>
                        </div>
							<div class="styLNRightNumBox" style="padding-bottom:0mm;">19b</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/LessDepreciationAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="padding-bottom:0mm;">19c</div>
							<div class="styLNAmountBox" style="padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/TotalDepreciationAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-bottom:0mm;">20</div>
							<div class="styLNDesc" style="width:132mm;padding-bottom:0mm;">
								<span style="float:left;clear:none;">Depletion
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/DepletionAmt"/>
									</xsl:call-template>
								</span>	
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...........................</span>	
							</div>
							<div class="styLNRightNumBox" style="padding-bottom:0mm;">20</div>
							<div class="styLNAmountBox" style="padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/DepletionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-bottom:0mm;">21</div>
							<div class="styLNDesc" style="width:132mm;padding-bottom:0mm;">
								<span style="float:left;clear:none;">Retirement plans, etc.</span>
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........................</span>
							</div>
							<div class="styLNRightNumBox" style="padding-bottom:0mm;">21</div>
							<div class="styLNAmountBox" style="padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/PensionProfitSharingPlansAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-bottom:0mm;">22</div>
							<div class="styLNDesc" style="width:132mm;padding-bottom:0mm;">
								<span style="float:left;clear:none;">Employee benefit programs</span>
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">......................</span>
							</div>
							<div class="styLNRightNumBox" style="padding-bottom:0mm;">22</div>
							<div class="styLNAmountBox" style="padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/EmployeeBenefitProgramAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-bottom:0mm;">23</div>
							<div class="styLNDesc" style="width:132mm;padding-bottom:0mm;">
								<span style="float:left;clear:none;">Other deductions (attach statement)
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/OtherDeductionsAmt"/>
									</xsl:call-template>
								</span>	
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...................</span>
							</div>
							<div class="styLNRightNumBox" style="padding-bottom:0mm;">23</div>
							<div class="styLNAmountBox" style="padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/OtherDeductionsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-bottom:0mm;">24</div>
							<div class="styLNDesc" style="width:132mm;padding-bottom:0mm;">
								<span style="float:left;clear:none;"><b>Total deductions.</b> Add the amounts shown in the far right column for lines 12 through 23</span>
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">....</span>
							</div>
							<div class="styLNRightNumBox" style="padding-bottom:0mm;">24</div>
							<div class="styLNAmountBox" style="padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/TotalDeductionsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-bottom:0mm;">
                            25</div>
							<div class="styLNDesc" style="width:132mm;padding-bottom:0mm;">
                                <span style="float:left;clear:none;"><b>Taxable income (loss) from passive loss limitation activities.</b> Subtract line 24 from line 11</span>
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..</span>
							</div>
							<div class="styLNRightNumBox" style="border-bottom-width:0px;padding-bottom:0mm;">25</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/TaxableIncomeOrLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--END Main Form Deductions Section-->
					<!--BEGIN Main Form Tax and Payment Section-->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS1065BVTImageBox" style="height:16mm;padding-top:2.5mm;">
							<img src="{$ImagePath}/1065B_TaxAndPayment.gif" alt="VertTaxAndPayment"/>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-bottom:0mm;">26</div>
							<div class="styLNDesc" style="width:132mm;padding-bottom:0mm;">
								<span style="width:54mm;float:left;clear:none;">Tax (see instructions). Check if from: 
                            <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065BData/TaxesAmt"/>
								</xsl:call-template></span>
								<span style="width:30mm;float:left;clear:none;">
								<span class="styBoldText" style="width:5mm;padding-left:2mm;">a</span>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065BData/Form4255Ind"/>
										<xsl:with-param name="BackupName">IRS1065BTaxForm4255</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1065BData/Form4255Ind"/>
										<xsl:with-param name="BackupName">IRS1065BTaxForm4255</xsl:with-param>
									</xsl:call-template>
        Form 4255
                                <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/Form4255Ind"/>
									</xsl:call-template>
								</label></span>
								<span style="float:left;clear:none;">
								<span class="styBoldText" style="width:5mm;padding-left:2mm;">b</span>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065BData/Form8611Ind"/>
										<xsl:with-param name="BackupName">IRS1065BTaxForm8611</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1065BData/Form8611Ind"/>
										<xsl:with-param name="BackupName">IRS1065BTaxForm8611</xsl:with-param>
									</xsl:call-template>
        Form 8611
                                <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/Form8611Ind"/>
									</xsl:call-template>
								</label>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I  Line 26 - Section 453I3 Interest</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1065BData/TaxesAmt/@section453I3InterestTxt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I  Line 26 - Section 453AC Intrest</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1065BData/TaxesAmt/@section453ACInterestTxt"/>
								</xsl:call-template>
							</span>	
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..</span>
							</div>
							<div class="styLNRightNumBox" style="padding-bottom:0mm;">26</div>
							<div class="styLNAmountBox" style="padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/TaxesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-bottom:0mm;">27</div>
							<div class="styLNDesc" style="width:132mm;padding-bottom:0mm;">
								<span style="width:54mm;float:left;clear:none;">Other payments. Check if from:</span>
								<span style="width:30mm;float:left;clear:none;">
                            <span class="styBoldText" style="width:5mm;padding-left:2mm;">a</span>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065BData/Form2439Ind"/>
										<xsl:with-param name="BackupName">IRS1065BOtherPaymentsForm2439</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1065BData/Form2439Ind"/>
										<xsl:with-param name="BackupName">IRS1065BOtherPaymentsForm2439</xsl:with-param>
									</xsl:call-template>
       Form 2439
                              </label></span>
                            <span style="float:left;clear:none;">
								<span class="styBoldText" style="width:5mm;padding-left:2mm;">b</span>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065BData/Form4136Ind"/>
										<xsl:with-param name="BackupName">IRS1065BOtherPaymentsForm4136</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1065BData/Form4136Ind"/>
										<xsl:with-param name="BackupName">IRS1065BOtherPaymentsForm4136</xsl:with-param>
									</xsl:call-template>
        Form 4136
                                <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/Form4136Ind"/>
									</xsl:call-template>
								</label>
							</span>	
						<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>		
							</div>
							<div class="styLNRightNumBox" style="padding-bottom:0mm;">27</div>
							<div class="styLNAmountBox" style="padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/OtherPaymentsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-bottom:0mm;">28</div>
							<div class="styLNDesc" style="width:132mm;padding-bottom:0mm;">
								<span style="float:left;clear:none;">Amount owed. Enter the excess of line 26 over line 27</span>
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..............</span>
							</div>
							<div class="styLNRightNumBox" style="padding-bottom:0mm;">28</div>
							<div class="styLNAmountBox" style="padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/TaxOwedAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-bottom:0mm;">29</div>
							<div class="styLNDesc" style="width:132mm;padding-bottom:0mm;">
								<span style="float:left;clear:none;">Overpayment. Enter the excess of  line 27 over line 26
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/OverpaymentAmt"/>
									</xsl:call-template>
								</span>	
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..............</span>
							</div>
							<div class="styLNRightNumBox" style="border-bottom-width:0;padding-bottom:0mm;">29</div>
							<div class="styLNAmountBox" style="border-bottom-width:0;padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/OverpaymentAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--END Main Form Tax and Payment Section-->
					
					<!-- BEGIN Signature Section -->
					<!-- Implementing the signature section as a table -->
					<div class="styBB" style="width:187mm;font-size:6pt;">
							<div class="styMainTitle"  style="height:20mm;width:12mm;font-size:11pt;font-weight:bold;padding-top:7mm;padding-bottom:5mm;border-style:solid;border-color:black;border-width:0px 1px 0px 0px;float:left;clear:none;">Sign Here</div>
					<div class="styLNDesc" style="height;auto;width:175mm;">
						<div class="styLNDesc" style="height:7mm;width:175mm;padding-left:1mm;padding-bottom:1mm;">
								  Under penalties of perjury, I declare that I have examined this return, including 
								  accompanying schedules and statements, and to the best of my knowledge
								  and belief, it is true, correct, and complete. Declaration of preparer (other than 
								  general partner or limited liability company member manager) is based on all information 
								  of which preparer has any knowledge.
                        </div><br/> 
                        <div class="styLNDesc" style="height:9mm;width:175mm;padding-left:1mm;">
							<div  style="width:101mm;padding-top:2mm;">
								<div  style="height:auto;with:5mm;padding-left:1mm;padding-right:2mm;float:left; clear: none;">
									<img src="{$ImagePath}/1065B_Bullet_Lg.gif" alt="LargeBullet"/>
								</div>
								<div style="width:90mm;">	
									<div class="styFixedUnderline" style="width:95mm;float:left; clear: none;">
										<xsl:call-template name="PopulateReturnHeaderPartner">
											<xsl:with-param name="TargetNode">Name</xsl:with-param>
										</xsl:call-template>
									</div><br/>
									<div class="styLNDesc" style="height:auto;border-bottom:1 solid black;vertical-align:top;">Signature of general partner or limited liability company member manager</div>
								</div>
							</div>
							<div  style="width:32mm;padding-top:2mm;">
								<div  style="height:auto;with:5mm;padding-left:1mm;padding-right:2mm;float:left; clear: none;">
									<img src="{$ImagePath}/1065B_Bullet_Lg.gif" alt="LargeBullet"/>
								</div>
								<div  style="width:25mm;">
									<div class="styFixedUnderline" style="width:25mm;float:left; clear: none;">
										<xsl:call-template name="PopulateReturnHeaderPartner">
											<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
										</xsl:call-template>
									</div><br/>
									<div class="styLNDesc" style="height:auto;">Date</div>
								</div>
							</div>
							<div class="styLNDesc" style="width:40mm;float:right;clear:none;padding-top:0mm">
								<div class="styGenericDiv" style="width:2px;"/>
								<div style="height:auto;border-style:solid;border-color:black;border-width:3px 3px 3px 3px;float:right;clear:none;">    
										May the IRS discuss this return<br/> with the preparer shown below <br/>(see instructions)?
									<input class="styCkbox" type="checkbox" name="Checkbox" id="dummyidyes" style="width:3mm;">
										<xsl:call-template name="PopulateReturnHeaderPartner">
											<xsl:with-param name="TargetNode">AuthorizeThirdPartyYesCheckbox</xsl:with-param>
											<xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
										</xsl:call-template>
									</input>
									<span class="styBoldText">
										<label for="dummyidyes">
											<xsl:call-template name="PopulateReturnHeaderPartner">
												<xsl:with-param name="TargetNode">AuthorizeThirdPartyYesLabel</xsl:with-param>
												<xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
											</xsl:call-template>
          Yes
                                     </label>
									</span>
									<input class="styCkbox" type="checkbox" name="Checkbox" id="dummyidno" style="width:2.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPartner">
											<xsl:with-param name="TargetNode">AuthorizeThirdPartyNoCheckbox</xsl:with-param>
											<xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
										</xsl:call-template>
									</input>
									<span class="styBoldText">
										<label for="dummyidno">
											<xsl:call-template name="PopulateReturnHeaderPartner">
												<xsl:with-param name="TargetNode">AuthorizeThirdPartyNoLabel</xsl:with-param>
												<xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
											</xsl:call-template>
          No
										</label>
									</span>
								</div>
							</div>
						</div>
						</div>
					</div>
					<!-- END Signature Section -->
					<!-- BEGIN PREPARER SIGNATURE SECTION -->
				<div class="styBB" style="height:auto;width:187mm;font-size:6pt;">
						   <div style="height:auto;width:18mm;vertical-align:middle;padding-top:5.5mm;float:left;clear:none;">
									<span class="styMainTitle" style="font-size:11pt;">
									Paid
									Preparer
									Use Only
									</span>                
						   </div>
				   <div style="height:auto;width:168mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 0px 1px;">
 						<div style="width:168mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
							<div class="styLNDesc" style="height:8mm;width:50mm;padding-left:.5mm;border-style:solid;border-color:black;border-width:0px 1px 0px 0px;">
								Print/Type preparer's name<br/>
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">Name</xsl:with-param>
									</xsl:call-template>
							</div>
							<div class="styLNDesc" style="height:8mm;width:62.3mm;padding-left:.5mm;border-style:solid;border-color:black;border-width:0px 1px 0px 0px;">
								Preparer's signature
							</div>
							<div class="styLNDesc" style="height:8mm;width:15mm;border-style:solid;border-color:black;border-width:0px 1px 0px 0px;padding-left:.5mm;">Date <br/>
								<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="height:8mm;width:18mm;border-style:solid;border-color:black;border-width:0px 1px 0px 0px;padding-left:.5mm;">
									<label for="dummyid1">Check 
										<xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">SelfEmployedLabel</xsl:with-param>
											<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
										</xsl:call-template>
										<input class="styCkbox" type="checkbox" id="dummyid1" style="width:4mm;">
											<xsl:call-template name="PopulateReturnHeaderPreparer">
												<xsl:with-param name="TargetNode">SelfEmployedCheckbox</xsl:with-param>
												<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
											</xsl:call-template>
										</input><span style="width:4px;"/>if<br/>self-employed
									</label>
							</div>
							<div class="styLNDesc" style="height:6mm;width:19mm;padding-left:.5mm;">PTIN
                             <br/>
								<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">SSN</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
 						<div style="width:168mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">	
							<div class="styLNDesc" style="height:6mm;width:127.3mm;border-style:solid;border-color:black;border-width:0px 1px 0px 0px;">
								<span class="styGenericDiv" style="padding-left:.5mm;">Firm's name 
									<span style="width:2.2mm;padding-right:2mm;"/>
									<img src="{$ImagePath}/1065B_Bullet_Md.gif" alt="MediumBullet"/>
								</span>
								<span style="padding-right:.5mm;"/>									
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
								</xsl:call-template>
								<br/>
								<span style="padding-right:.5mm;"/>
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="height:6mm;width:33mm;padding-left:.5mm;">Firm's EIN
								<img src="{$ImagePath}/1065B_Bullet_Md.gif" alt="MediumBullet"/>
								<span style="width:4px;"/>
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:168mm;float:left;clear:none;">	
							<div class="styLNDesc" style="height:auto;width:127.3mm;border-style:solid;border-color:black;border-width:0px 1px 0px 0px;">
								<div class="styGenericDiv" style="padding-left:.5mm;">Firm's address 
									<img src="{$ImagePath}/1065B_Bullet_Md.gif" alt="MediumBullet"/>
								</div>
								<div class="styGenericDiv" style="padding-left:.5mm;">
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
								</xsl:call-template>
								<br/>
									<xsl:if test="$RtnHdrData/PreparerFirmGrp/PreparerForeignAddress">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">City</xsl:with-param>
										</xsl:call-template><br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">ProvinceOrState</xsl:with-param>
										</xsl:call-template>
										<span style="width:2px;"/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">PostalCode</xsl:with-param>
										</xsl:call-template>
										<span style="width:2px;"/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">Country</xsl:with-param>
										</xsl:call-template>
									</xsl:if>	
									<xsl:if test="$RtnHdrData/PreparerFirmGrp/PreparerUSAddress">
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div class="styLNDesc" style="width:33mm;padding-left:.5mm;"> Phone no. 
                            <xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">Phone</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
					</div>	
				</div>
					<!-- END PREPARER SIGNATURE SECTION -->
					<!-- Page Break and Footer-->
					<div style="width:187mm;">
						<div style="float:left;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions.</span>
							<span style="width:25mm;"/>                        
      Cat. No. 26265H
                    </div>
						<div style="float:right;">
							<span style="width:30px;"/>  
      Form <span class="styBoldText" style="font-size:8pt;">1065-B</span> (2013)
                    </div>
					</div>
					<p style="page-break-before: always"/> 
					<!-- END Page Break and Footer-->
					<!--Begin Page 2 -->
					<!-- Page Header -->
					<div class="styBB" style="width:187mm;">
						<div style="float:left;">Form 1065-B (2013)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!--Part II-->
					<div class="styBB" style="width:187mm;">
						<div class="styBB" style="width:187mm;">
							<div class="styPartName" style="height:4mm;width:14mm;padding-top:.5mm;">Part II</div>
							<div class="styPartDesc" style="height:4mm;width:163mm;padding-top:.5mm;">Taxable Income or Loss From Other Activities</div>
						</div>
						<div style="width:187mm">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-left: 2.25mm;">1</div>
							<div class="styLNDesc" style="height:4.5mm;width:138mm;">
								<span style="float:left;clear:none;">Interest</span>
					<!--Dotted Line-->
						<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..............................</span>		
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">1</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/InterestAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-left: 2.25mm;">2a</div>
							<div class="styLNDesc" style="height:4.5mm;width:98mm;">
								<span style="float:left;clear:none;">Total ordinary dividends</span>
  					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">2a</div>
							<div class="styLNAmountBox" style="height:4.5mm;padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/TotalOrdinaryDividendsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:8.3mm;background-color:lightgrey;border-bottom-width:0px;border-right-width:1px;"/>
							<div class="styLNAmountBoxNBB" style="height:4.5mm;border-left-width:0px;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftLtrBox" style="height:4.5mm;padding-left: 4.3mm;">b</div>
							<div class="styLNDesc" style="height:4.5mm;width:98mm;">
								<span style="float:left;clear:none;">Qualified dividends</span>
  					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">2b</div>
							<div class="styLNAmountBox" style="height:4.5mm;padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/QualifiedDividendsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:8.3mm;background-color:lightgrey;border-bottom-width:0px;border-right-width:1px;"/>
							<div class="styLNAmountBoxNBB" style="height:4.5mm;border-left-width:0px;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:4.3mm;">c</div>
							<div class="styLNDesc" style="width:138mm;height:4.5mm;">
								<span style="float:left;clear:none;">Nonqualified dividends (subtract line 2b from 2a)</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;padding-left:1mm;">2c</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/NonqualifiedDividendsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm;">3</div>
							<div class="styLNDesc" style="width:138mm;height:4mm;">
								<span style="float:left;clear:none;">Gross royalties</span>
					<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">............................</span>	
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">3</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/GrossRoyaltiesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm;">4</div>
							<div class="styLNDesc" style="width:138mm;height:4mm;">
								<span style="float:left;clear:none;">Excess of net short-term capital gain over net long-term capital loss (Schedule D, line 23)</span>
      				<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">....</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">4</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/NetSTGainOverNetLTLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm;">5</div>
							<div class="styLNDesc" style="width:138mm;height:4mm;">
								<span style="float:left;clear:none;">Other income (loss) (see instructions) (attach statement)
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/OtherIncomeLossAmt"/>
									</xsl:call-template>
								</span>	
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">5</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/OtherIncomeLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm;">6</div>
							<div class="styLNDesc" style="width:138mm;height:4mm;">
								<span style="float:left;clear:none;"><b>Total income (loss).</b> Add lines 1, 2c, 3, 4, and 5</span>
 						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">6</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/TotalIncomeLoss2Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm;">7</div>
							<div class="styLNDesc" style="width:138mm;height:4mm;">
								<span style="float:left;clear:none;">Interest expense on investment debts (attach Form 4952)</span>
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">7</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/InterestExpenseOnInvstDbAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm;">8</div>
							<div class="styLNDesc" style="width:138mm;height:4mm;">
								<span style="float:left;clear:none;">State and local income taxes (see instructions)</span>
						  <!--Dotted Line-->
								 <span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">8</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/StateIncomeTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-left: 2.25mm;">9</div>
							<div class="styLNDesc" style="height:4.5mm;width:138mm;">
								<span style="float:left;clear:none;">Charitable contributions (see instructions for limitations and required attachment)
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/CharitableContributionAmt"/>
									</xsl:call-template>
								</span>	
					    <!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">......</span> 
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">9</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/CharitableContributionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;">10a</div>
							<div class="styLNDesc" style="height:mm;width:98mm;">
								<span style="float:left;clear:none;">Total miscellaneous itemized deductions</span>
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..........</span> 
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">10a</div>
							<div class="styLNAmountBox" style="height:4.5mm;padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/MiscItemizedDeductionsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:8.3mm;background-color:lightgrey;border-bottom-width:0px;border-right-width:1px;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftLtrBox" style="height:4.5mm;">
								<span style="width:1mm"/>b
                        </div>
							<div class="styLNDesc" style="width:138mm;height:4.5mm;">
								<span style="float:left;clear:none;">Deductible amount. Multiply line 10a by 30%</span>
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...................</span> 
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">10b</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/DeductibleAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">11</div>
							<div class="styLNDesc" style="width:138mm;height:4mm;">
								<span style="float:left;clear:none;">Other deductions (attach statement)
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/PartIIOtherDeductionsAmt"/>
									</xsl:call-template>
								</span>	
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">....................</span>	
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">11</div>
							<div class="styLNAmountBox" style="height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/PartIIOtherDeductionsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">12</div>
							<div class="styLNDesc" style="width:138mm;height:4mm;">
								<span style="float:left;clear:none;"><b>Total deductions.</b> Add lines 7, 8, 9 , 10b, and 11</span>
					    <!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.................</span>	
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">12</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/TotalDeductions2Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;;">
							<div class="styLNLeftNumBox" style="height:4mm;">13</div>
							<div class="styLNDesc" style="width:138mm;height:4mm;">
								<span style="float:left;clear:none;"><b>Taxable income (loss) from other activities. </b>Subtract line 12 from line 6</span>
					    <!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom:0">13</div>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/TaxableIncomeOrLoss2Amt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>

					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="height:4mm;width:23mm;">Schedule B</div>
						<div class="styPartDesc" style="height:4mm;width:164mm;">Other Information <span style="font-weight:normal;">(see instructions)</span></div>
					</div>
					<div style="width:187mm;">
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">1</div>
							<div class="styLNDesc" style="height:4mm;width:167mm;">
		  What type of entity is filing this return? Check the applicable box:
						</div>
							<div class="styIRS1065BLNYesNoBox" style="font-weight:bold;">Yes</div>
							<div class="styIRS1065BLNYesNoBox" style="font-weight:bold;">No</div>
						</div>
						<div style="width:187mm">
						<div class="styLNLeftLtrBox" style="padding-top:2mm;">a</div>
						<div class="styLNDesc" style="width:65mm">
							<input class="styCkBox" type="checkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/DomesticGeneralPartnershipInd"/>
									<xsl:with-param name="BackupName">IRS1065BDomesticGeneralPartnership</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<label for="DomesticGeneralPartnershipInd">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/DomesticGeneralPartnershipInd"/>
									<xsl:with-param name="BackupName">IRS1065BDomesticGeneralPartnership</xsl:with-param>
								</xsl:call-template>
        Domestic general partnership
                        </label>
						</div>
						<div class="styLNLeftLtrBox" style="padding-top:2mm;">b</div>
						<div class="styLNDesc" style="width:94mm">
							<input class="styCkBox" type="checkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/DomesticLimitedPartnershipInd"/>
									<xsl:with-param name="BackupName">IRS1065BDomesticLimitedPartnership</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<label for="DomesticLimitedPartnershipInd">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/DomesticLimitedPartnershipInd"/>
									<xsl:with-param name="BackupName">IRS1065BDomesticLimitedPartnership</xsl:with-param>
								</xsl:call-template>
        Domestic limited partnership
                        </label>
						</div>
						<div class="styIRS1065BLNYesNoBox" style="background:lightgrey;border-bottom:0"/>
						<div class="styIRS1065BLNYesNoBox" style="background:lightgrey;border-bottom:0"/>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftLtrBox" style="padding-top:2mm;">c</div>
						<div class="styLNDesc" style="width:65mm">
							<input class="styCkBox" type="checkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/DomesticLimitedLiabilityCoInd"/>
									<xsl:with-param name="BackupName">IRS1065BDomesticLimitedLiabilityCo</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<label for="DomesticLimitedLiabilityCoInd">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/DomesticLimitedLiabilityCoInd"/>
									<xsl:with-param name="BackupName">IRS1065BDomesticLimitedLiabilityCo</xsl:with-param>
								</xsl:call-template>
        Domestic limited liability company
                        </label>
						</div>
						<div class="styLNLeftLtrBox" style="padding-top:2mm;">d</div>
						<div class="styLNDesc" style="width:94mm">
							<input class="styCkBox" type="checkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/DomesticLimitedLiabPrtshpInd"/>
									<xsl:with-param name="BackupName">IRS1065BDomesticLimitedLiabilityPrtshp</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<label for="DomesticLimitedLiabPrtshpInd">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/DomesticLimitedLiabPrtshpInd"/>
									<xsl:with-param name="BackupName">IRS1065BDomesticLimitedLiabilityPrtshp</xsl:with-param>
								</xsl:call-template>
        Domestic limited liability partnership
                        </label>
						</div>
						<div class="styIRS1065BLNYesNoBox" style="background:lightgrey;border-bottom:0"/>
						<div class="styIRS1065BLNYesNoBox" style="background:lightgrey;border-bottom:0"/>
					</div>
					<div style="width:187mm,padding-bottom:2mm;">
						<div class="styLNLeftLtrBox" style="padding-top:2mm;">e</div>
						<div class="styLNDesc" style="width:65mm">
							<input class="styCkBox" type="checkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/ForeignPartnershipInd"/>
									<xsl:with-param name="BackupName">IRS1065BForeignPartnership</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<label for="ForeignPartnershipInd">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/ForeignPartnershipInd"/>
									<xsl:with-param name="BackupName">IRS1065BForeignPartnership</xsl:with-param>
								</xsl:call-template>
        Foreign partnership
                        </label>
						</div>
						<div class="styLNLeftLtrBox" style="padding-top:2mm;">f</div>
						<div class="styLNDesc" style="width:94mm">
							<input class="styCkBox" type="checkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/OtherInd"/>
									<xsl:with-param name="BackupName">IRS1065BTypeOfEntityOther</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<label for="OtherInd">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/OtherInd"/>
									<xsl:with-param name="BackupName">IRS1065BTypeOfEntityOther</xsl:with-param>
								</xsl:call-template>
        Other 
                        </label>
							<span style="width:1mm;"/>
							<img src="{$ImagePath}/1065B_Bullet_Sm.gif" alt="SmallBullet"/>
							
							<span class="styFixedUnderline" style="width:70mm;float:none;padding-right:2mm;border-style:dotted;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/OtherInd/@otherDesc"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styIRS1065BLNYesNoBox" style="height:5.5mm;background:lightgrey;border-left-width:1;border-right:1;"/>
						<div class="styIRS1065BLNYesNoBox" style="height:5.5mm;background:lightgrey;"/>
					</div>	
						<div style="width:187mm">
							<div class="styLNLeftNumBox" style="height:4mm">2</div>
							<div class="styLNDesc" style="width:167mm;">
								<span style="float:left;clear:none;">Are any partners in this partnership also partnerships?</span>
						<!--Dotted Line-->
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.......................</span>
							</div>
							<div class="styIRS1065BLNYesNoBox" style="">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/AnyPartnershipsAlsoPartnersInd"/>
								</xsl:call-template>
							</div>
							<div class="styIRS1065BLNYesNoBox" style="">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/AnyPartnershipsAlsoPartnersInd"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm">
							<div class="styLNLeftNumBox" style="height:4mm">3</div>
							<div class="styLNDesc" style="width:167mm">
								During the partnership's tax year, did the partnership own any interest in another partnership or in any foreign entity that was<br/>
								 disregarded as an entity separate from its owner under Regulations sections 301.7701-2 and 301.7701-3?  If "Yes", see<br/>
								  instructions for required attachment
 									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/IntPrtshpUndReg301_7701_2_3Ind"/>
									</xsl:call-template>
								
						<!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">...........................</span>			
							</div>
							<div class="styIRS1065BLNYesNoBox" style="height:10.5mm;padding-top:6.5mm;">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/IntPrtshpUndReg301_7701_2_3Ind"/>
								</xsl:call-template>
							</div>
							<div class="styIRS1065BLNYesNoBox" style="height:10.5mm;padding-top:6.5mm;">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/IntPrtshpUndReg301_7701_2_3Ind"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm">
							<div class="styLNLeftNumBox" style="height:4mm">4</div>
							<div class="styLNDesc" style="width:167mm">
								Does this partnership have any foreign partners? If "Yes," the partnership may have to file Forms 8804, 8805,
and 8813. (See instructions.)
						<!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">...................................</span>			
							</div>
							<div class="styIRS1065BLNYesNoBox" style="height:7mm;padding-top:3.5mm;">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/PrtshpHasForeignPartnersInd"/>
								</xsl:call-template>
							</div>
							<div class="styIRS1065BLNYesNoBox" style="height:7mm;padding-top:3.5mm;">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/PrtshpHasForeignPartnersInd"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm">
							<div class="styLNLeftNumBox" style="height:4mm">5</div>
							<div class="styLNDesc" style="width:167mm">
								<span style="float:left;clear:none;">Is this partnership a publicly traded partnership as defined in section 469(k)(2)?</span>     
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...............</span>			 
							</div>
							<div class="styIRS1065BLNYesNoBox" style="">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/PubliclyTradedPartnershipInd"/>
								</xsl:call-template>
							</div>
							<div class="styIRS1065BLNYesNoBox" style="">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/PubliclyTradedPartnershipInd"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm">
							<div class="styLNLeftNumBox" style="height:4mm">6</div>
							<div class="styLNDesc" style="width:167mm;height:auto;font-size:7pt;">Has this partnership filed, or is it required to file, Form 8918, Material Advisor Disclosure Statement, to provide
																			 information on any reportable transaction?
								
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-left:2mm;">................................</span>			 
							</div>
							<div class="styIRS1065BLNYesNoBox" style="height:7.5mm;padding-top:3.5mm">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/HasThisPrtshpFldUndSect6111Ind"/>
								</xsl:call-template>
							</div>
							<div class="styIRS1065BLNYesNoBox" style="height:7.5mm;padding-top:3.5mm">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/HasThisPrtshpFldUndSect6111Ind"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm">
							<div class="styLNLeftNumBox" style="height:4mm">7</div>
							<div class="styLNDesc" style="width:167mm">At any time during calendar year 2013, did the partnership have an interest in or a signature or other authority over a financial account in a foreign country (such as a bank account, securities account, or other financial account)? See instructions for exceptions and filing requirements for FinCEN Form 114, Report of Foreign Bank and Financial Accounts (FBAR) (formerly Form TD F 90-22.1). <br/>If "Yes," enter the
										name of the foreign country.   
								<span style="width:1mm;"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/ForeignFinancialAccountInd"/>
								</xsl:call-template>
								<span style="width:1mm;"/>
								<img src="{$ImagePath}/1065B_Bullet_Sm.gif" alt="SmallBullet"/>
								
								<span class="styFixedUnderline" style="width:95mm;border-style:dotted;float:none;padding-right:2mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/ForeignFinancialAccountInd/@foreignCountryNm"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styIRS1065BLNYesNoBox" style="height:14mm;padding-top:10.5mm;">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/ForeignFinancialAccountInd"/>
								</xsl:call-template>
							</div>
							<div class="styIRS1065BLNYesNoBox" style="height:14mm;padding-top:10.5mm;">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/ForeignFinancialAccountInd"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm">
							<div class="styLNLeftNumBox" style="height:4mm">8</div>
							<div class="styLNDesc" style="width:167mm">
								During the tax year, did the partnership receive a distribution from, or was it the grantor to, or transferor to, a foreign trust?
								If "Yes," the partnership may have to file Form 3520 
						<!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">..........................</span>			 
							</div>
							<div class="styIRS1065BLNYesNoBox" style="height:7.5mm;padding-top:3.5mm;">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/ForeignTrustQuestionInd"/>
								</xsl:call-template>
							</div>
							<div class="styIRS1065BLNYesNoBox" style="height:7.5mm;padding-top:3.5mm;">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/ForeignTrustQuestionInd"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styBB" style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:3.5mm">9</div>
							<div class="styLNDesc" style="width:167mm">Enter the number of 
                            <span class="styBoldText">Forms 8865</span>, Return of U.S. Persons With Respect to Certain Foreign Partnerships, attached
    to this return.
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/Form8865Cnt"/>
								</xsl:call-template>
								<span style="width:1mm;"/>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">SchB Line 9 - Number of IRS8865 Forms attached</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/Form8865Cnt"/>
								</xsl:call-template>
								<span style="width:1mm;"/>
								<img src="{$ImagePath}/1065B_Bullet_Sm.gif" alt="MidSizeBullet"/>
							</div>
							<div class="styIRS1065BLNYesNoBox" style="height:8mm;border-bottom-width:0;background:lightgrey;">
							</div>
							<div class="styIRS1065BLNYesNoBox" style="height:8mm;border-left-width:0;border-bottom-width:0;background:lightgrey;">
							</div>
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div  style="width:187mm;">
						<div style="float:right;">
							<span style="width:40px;"/> Form 
                        <span class="styBoldText" style="font-size:8pt;">1065-B</span> (2013)
                    </div>
					</div>
					<p style="page-break-before: always"/> 
					<!-- END Page Break and Footer-->
					<!-- Page Header -->
					<div class="styBB" style="width:187mm;">
						<div style="float:left;">Form 1065-B (2013)<span style="width:148mm;"/>
					</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span>
						</div>
					</div>
					<!-- END Page Header -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="height:4mm;width:19mm">Schedule D</div>
						<div class="styPartDesc" style="height:4mm;float:left;width:167mm;"> Capital Gains and Losses
						<span style="font-weight: normal;">
						(Use Form 8949 to list your transactions for lines 1b, 2, 3, 8b, 9, and 10.)</span>
						</div>
					</div>
					<div class="styBB" style="width:187mm; ">
						<div class="styPartDesc" style="height:4mm;width:180mm;text-align:center;padding-top:.5mm;">
									Part I—Short-Term Capital Gains and Losses—Assets Held One Year or Less
						</div>
					</div>
					<div class="styBB" style="width:187mm;overflow-y:visible">
						<!-- BEGIN PART I TABLE -->
								<div class="" style="width:187mm">
									<div class="styLNDesc" style="height:17mm;width:57mm;font-weight:normal;text-align:left;">
											See instructions for how to figure the amounts to enter on the lines below.<br/> This form may be easier to  complete if you round off cents to whole dollars.</div>
									<div class="styLNDesc" style="height:17mm;width:31mm;padding-left:1mm;font-weight:normal;text-align:center;border-style:solid;border-color:black;border-width:0px 0px 0px 1px;">
											<b>(d)</b><br/>Proceeds<br/>(sales price)</div>
									<div class="styLNDesc" style="height:17mm;width:36mm;padding-left:1mm;font-weight:normal;text-align:center;border-style:solid;border-color:black;border-width:0px 0px 0px 1px;">
											<b>(e)</b><br/>Cost<br/>(or other basis)</div>
									<div class="styLNDesc" style="height:17mm;width:32mm;padding-left:1mm;font-weight:normal;text-align:left;border-style:solid;border-color:black;border-width:0px 0px 0px 1px;">
											<b>(g)</b> Adjustments to<br/>gain or loss from<br/> Form(s) 8949, Part I<br/>line 2, column (g)</div>
									<div class="styLNDesc" style="height:17mm;width:30mm;padding-left:1mm;font-weight:normal;text-align:left;border-style:solid;border-color:black;border-width:0px 0px 0px 1px;">
											<b>(h) Gain or (loss).</b><br/>Subtract column (e)<br/>from column (d) and<br/>combine the result<br/>with column (g)</div>
								</div>	
					</div>
						<!-- END PART I TABLE -->
						<div class="" style="width:187mm">
							<div class="styBB" style="width:187mm">
								<div class="styLNLeftNumBox" style="height:24mm;padding-top:0mm;padding-bottom:0mm;width:5mm;padding-left:1.5mm;">1a</div>
								<div class="styLNDesc" style="height:24mm;padding-top:0mm;padding-bottom:0mm;width:52mm;padding-left:.5mm;">
										Totals for all short-term transactions<br/> 
										reported on Form 1099-B for which<br/> 
										basis was reported to the IRS and for<br/>
										which you have no adjustments (see<br/>
										instructions). However, if you choose<br/>
										to report all these transactions on<br/>
										Form 8949, leave this line blank and<br/>
										<span style="float:left;clear:none;">go to line 1b</span>
								<!--Dotted Line-->
										<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........</span>
								</div>
								<div class="styLNAmountBoxNBB" style="height:24mm;padding-top:21mm;padding-bottom:0mm;width:31mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/TotalSTCGL1099BBssRptNoAdjGrp/TotalProceedsSalesPriceAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBoxNBB" style="height:24mm;padding-top:21mm;padding-bottom:0mm;width:36mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/TotalSTCGL1099BBssRptNoAdjGrp/TotalCostOrOtherBasisAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBoxNBB" style="height:24mm;padding-top:21mm;padding-bottom:0mm;width:32mm;background-color:lightgrey;">
								</div>
								<div class="styLNAmountBoxNBB" style="height:24mm;padding-top:21mm;padding-bottom:0mm;width:31mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/TotalSTCGL1099BBssRptNoAdjGrp/TotalGainOrLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div class="styBB" style="width:187mm">
								<div class="styLNLeftNumBox" style="height:6mm;padding-top:0mm;padding-bottom:0mm;width:5mm;padding-left:1.5mm;">1b</div>
								<div class="styLNDesc" style="height:6mm;padding-top:0mm;padding-bottom:0mm;width:52mm;padding-left:.5mm;">
								Totals for all transactions reported on 
								<span style="float:left;clear:none;">Form(s) 8949 with <b>Box A </b>checked</span> 
                        <!--Dotted Line-->
								<span class="styDotLn" style="letter-spacing:2mm;float:right;clear:none;padding-right:2mm;">..</span>			 
								</div>
								<div class="styLNAmountBoxNBB" style="height:6mm;padding-top:3mm;padding-bottom:0mm;width:31mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/TotalSTCGL1099BShowsBasisGrp/TotalProceedsSalesPriceAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBoxNBB" style="height:6mm;padding-top:2.5mm;padding-bottom:0mm;width:36mm;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/TotalSTCGL1099BShowsBasisGrp/TotalCostOrOtherBasisAmt"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/TotalSTCGL1099BShowsBasisGrp/TotalCostOrOtherBasisAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBoxNBB" style="height:6mm;padding-top:3mm;padding-bottom:0mm;width:32mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/TotalSTCGL1099BShowsBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBoxNBB" style="height:6mm;padding-top:3mm;padding-bottom:0mm;width:31mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/TotalSTCGL1099BShowsBasisGrp/TotalGainOrLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div class="styBB" style="width:187mm">
								<div class="styLNLeftNumBox" style="height:6mm;padding-top:0mm;padding-bottom:0mm;width:5mm;padding-left:1.5mm;">2</div>
								<div class="styLNDesc" style="height:6mm;padding-top:0mm;padding-bottom:0mm;width:52mm;padding-left:.5mm;">
									Totals for all transactions reported on 
									<span style="float:left;clear:none;">Form(s) 8949 with <b>Box B </b>checked</span> 
                        <!--Dotted Line-->
								<span class="styDotLn" style="letter-spacing:2mm;float:right;clear:none;padding-right:2mm;">..</span>			 			 
								</div>
								<div class="styLNAmountBoxNBB" style="height:6mm;padding-top:3mm;padding-bottom:0mm;width:31mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/TotalSTCGL1099BNotShowBasisGrp/TotalProceedsSalesPriceAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBoxNBB" style="height:6mm;padding-top:2.5mm;padding-bottom:0mm;width:36mm;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/TotalSTCGL1099BNotShowBasisGrp/TotalCostOrOtherBasisAmt"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/TotalSTCGL1099BNotShowBasisGrp/TotalCostOrOtherBasisAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBoxNBB" style="height:6mm;padding-top:3mm;padding-bottom:0mm;width:32mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/TotalSTCGL1099BNotShowBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBoxNBB" style="height:6mm;padding-top:3mm;padding-bottom:0mm;width:31mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/TotalSTCGL1099BNotShowBasisGrp/TotalGainOrLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div class="styBB" style="width:187mm">
								<div class="styLNLeftNumBox" style="height:6mm;padding-top:0mm;padding-bottom:0mm;width:5mm;padding-left:1.5mm;">3</div>
								<div class="styLNDesc" style="height:6mm;padding-top:0mm;padding-bottom:0mm;width:52mm;padding-left:.5mm;">
									Totals for all transactions reported on 
									<span style="float:left;clear:none;">Form(s) 8949 with <b>Box C </b>checked</span> 
                        <!--Dotted Line-->
								<span class="styDotLn" style="letter-spacing:2mm;float:right;clear:none;padding-right:2mm;">..</span>			 			 
								</div>
								<div class="styLNAmountBoxNBB" style="height:6mm;padding-top:3mm;padding-bottom:0mm;width:31mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/TotalSTCGL1099BNotReceivedGrp/TotalProceedsSalesPriceAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBoxNBB" style="height:6mm;padding-top:2.5mm;padding-bottom:0mm;width:36mm;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/TotalSTCGL1099BNotReceivedGrp/TotalCostOrOtherBasisAmt"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/TotalSTCGL1099BNotReceivedGrp/TotalCostOrOtherBasisAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBoxNBB" style="height:6mm;padding-top:3mm;padding-bottom:0mm;width:32mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/TotalSTCGL1099BNotReceivedGrp/TotAdjustmentsToGainOrLossAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBoxNBB" style="height:6mm;padding-top:3mm;padding-bottom:0mm;width:31mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/TotalSTCGL1099BNotReceivedGrp/TotalGainOrLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
						<div class="styBB" style="width:187mm">
							<div style="width:187mm">
								<div class="styLNLeftNumBox" style="height:4mm;padding-bottom:0mm;width:5mm;padding-left:1mm;">4</div>
								<div class="styLNDesc" style="width:143.1mm;height:4mm;padding-bottom:0mm;">
									<span style="float:left;clear:none;">Short-term capital gain from installment sales from Form 6252, line 26 or 37</span>
                        <!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..........</span>			 
								</div>
								<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;">4</div>
								<div class="styLNAmountBox" style="height:4mm;padding-bottom:0mm;width:30.8mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/STCapGainInstalSlsAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:187mm">
								<div class="styLNLeftNumBox" style="height:4mm;padding-bottom:0mm;width:5mm;padding-left:1mm;">5</div>
								<div class="styLNDesc" style="width:143.1mm;height:4mm;padding-bottom:0mm;">
									<span style="float:left;clear:none;">Short-term capital gain or (loss) from like-kind exchanges from Form 8824</span>
						    <!--Dotted Line-->
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...........</span>			 
								</div>
								<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;">5</div>
								<div class="styLNAmountBox" style="height:4mm;padding-bottom:0mm;width:30.8mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/STCapGainLossLikeKindExchAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:187mm;">
								<div class="styLNLeftNumBox" style="padding-bottom:0mm;width:5mm;padding-left:1mm;">6</div>
								<div class="styLNDesc" style="width:143.1mm;padding-bottom:0mm;">
									<span style="float:left;clear:none;">Partnership's share of net short-term capital gain (loss) from other partnerships, estates, and trusts</span>
									
							<!--Dotted Line-->
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>			
								</div>
								<div class="styLNRightNumBox" style="padding-bottom:0mm;">6</div>
								<div class="styLNAmountBox" style="padding-bottom:0mm;width:30.8mm;border-bottom-width:1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/PartnershipShareNetSTCGLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:187mm;">
								<div class="styLNLeftNumBox" style="padding-bottom:0mm;width:5mm;padding-left:1mm;">7</div>
								<div class="styLNDesc" style="width:143.1mm;padding-bottom:0mm;">
									<span style="float:left;clear:none;"><b>Net short-term capital gain or (loss).</b> Combine lines 1a through 6 in column (h)</span>
						    <!--Dotted Line-->
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........</span>	
								</div>
								<div class="styLNRightNumBox" style="padding-bottom:0mm;border-bottom-width:0">7</div>
								<div class="styLNAmountBox" style="padding-bottom:0mm;width:30.8mm;border-bottom-width:0;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/NetSTCapitalGainLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--<div class="styBB" style="width:187mm;">-->
						<div style="width:187mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
							<div class="styPartDesc" style="height4mm;width:180mm;text-align:center;">
									Part II—Long-Term Capital Gains and Losses—Assets Held More Than One Year
							</div>
						</div>
						<!-- BEGIN PART II TABLE -->
							<div class="styBB" style="width:187mm">
								<div class="" style="width:187mm">
									<div class="styLNDesc" style="height:17mm;width:57mm;font-weight:normal;text-align:left;">
											See instructions for how to figure the amounts to enter on the lines below.<br/> This form may be easier to  complete if you round off cents to whole dollars.</div>
									<div class="styLNDesc" style="height:17mm;width:31mm;padding-left:1mm;font-weight:normal;text-align:center;border-style:solid;border-color:black;border-width:0px 0px 0px 1px;">
											<b>(d)</b><br/>Proceeds<br/>(sales price)</div>
									<div class="styLNDesc" style="height:17mm;width:36mm;padding-left:1mm;font-weight:normal;text-align:center;border-style:solid;border-color:black;border-width:0px 0px 0px 1px;">
											<b>(e)</b><br/>Cost<br/>(or other basis)</div>
									<div class="styLNDesc" style="height:17mm;width:32mm;padding-left:1mm;font-weight:normal;text-align:left;border-style:solid;border-color:black;border-width:0px 0px 0px 1px;">
											<b>(g)</b> Adjustments to<br/>gain or loss from<br/> Form(s) 8949, Part II,<br/>line 2, column (g)</div>
									<div class="styLNDesc" style="height:17mm;width:30mm;padding-left:1mm;font-weight:normal;text-align:left;border-style:solid;border-color:black;border-width:0px 0px 0px 1px;">
											<b>(h) Gain or (loss).</b><br/>Subtract column (e)<br/>from column (d) and<br/>combine the result<br/>with column (g)</div>
								</div>	
							</div>	
					</div>
						<!-- END PART I TABLE -->
						<div class="styBB" style="width:187mm">
							<div class="styBB" style="width:187mm">
								<div class="styLNLeftNumBox" style="height:24mm;padding-top:0mm;padding-bottom:0mm;width:5mm;padding-left:1mm;">8a</div>
								<div class="styLNDesc" style="height:24mm;padding-top:0mm;padding-bottom:0mm;width:52mm;padding-left:.5mm;">								
									Totals for all short-term transactions<br/> 
									reported on Form 1099-B for which<br/> 
									basis was reported to the IRS and for<br/>
									which you have no adjustments (see<br/>
									instructions). However, if you choose<br/>
									to report all these transactions on<br/>
									Form 8949, leave this line blank and<br/>
									<span style="float:left;clear:none;">go to line 8b</span>
							<!--Dotted Line-->
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........</span>			 
								</div>
								<div class="styLNAmountBoxNBB" style="height:24mm;padding-top:21mm;padding-bottom:0mm;width:31mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/TotalLTCGL1099BBssRptNoAdjGrp/TotalProceedsSalesPriceAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBoxNBB" style="height:24mm;padding-top:21mm;padding-bottom:0mm;width:36mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/TotalLTCGL1099BBssRptNoAdjGrp/TotalCostOrOtherBasisAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBoxNBB" style="height:24mm;padding-top:21mm;padding-bottom:0mm;width:32mm;background-color:lightgrey;">
								</div>
								<div class="styLNAmountBoxNBB" style="height:24mm;padding-top:21mm;padding-bottom:0mm;width:31mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/TotalLTCGL1099BBssRptNoAdjGrp/TotalGainOrLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div class="styBB" style="width:187mm">
								<div class="styLNLeftNumBox" style="height:6mm;padding-top:0mm;padding-bottom:0mm;width:5mm;padding-left:1.5mm;">8b</div>
								<div class="styLNDesc" style="height:6mm;padding-top:0mm;padding-bottom:0mm;width:52mm;padding-left:.5mm;">
									Totals for all transactions reported on 
									<span style="float:left;clear:none;">Form(s) 8949 with <b>Box D </b>checked</span> 
                        <!--Dotted Line-->
								<span class="styDotLn" style="letter-spacing:2mm;float:right;clear:none;padding-right:2mm;">..</span>			 			 
								</div>
								<div class="styLNAmountBoxNBB" style="height:6mm;padding-bottom:0mm;padding-top:3mm;width:31mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/TotalLTCGL1099BShowsBasisGrp/TotalProceedsSalesPriceAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBoxNBB" style="height:6mm;padding-bottom:0mm;padding-top:2.5mm;width:36mm;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/TotalLTCGL1099BShowsBasisGrp/TotalCostOrOtherBasisAmt"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/TotalLTCGL1099BShowsBasisGrp/TotalCostOrOtherBasisAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBoxNBB" style="height:6mm;padding-bottom:0mm;padding-top:3mm;width:32mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/TotalLTCGL1099BShowsBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBoxNBB" style="height:6mm;padding-bottom:0mm;padding-top:3mm;width:31mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/TotalLTCGL1099BShowsBasisGrp/TotalGainOrLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div class="styBB" style="width:187mm">
								<div class="styLNLeftNumBox" style="height:6mm;padding-top:0mm;padding-bottom:0mm;width:5mm;padding-left:1mm;">9</div>
								<div class="styLNDesc" style="height:6mm;padding-top:0mm;padding-bottom:0mm;width:52mm;padding-left:.5mm;">
									Totals for all transactions reported on 
									<span style="float:left;clear:none;">Form(s) 8949 with <b>Box E </b>checked</span> 
                        <!--Dotted Line-->
								<span class="styDotLn" style="letter-spacing:2mm;float:right;clear:none;padding-right:2mm;">..</span>			 			 
								</div>
								<div class="styLNAmountBoxNBB" style="height:6mm;padding-bottom:0mm;padding-top:3mm;width:31mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/TotalLTCGL1099BNotShowBasisGrp/TotalProceedsSalesPriceAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBoxNBB" style="height:6mm;padding-bottom:0mm;padding-top:2.5mm;width:36mm;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/TotalLTCGL1099BNotShowBasisGrp/TotalCostOrOtherBasisAmt"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/TotalLTCGL1099BNotShowBasisGrp/TotalCostOrOtherBasisAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBoxNBB" style="height:6mm;padding-bottom:0mm;padding-top:3mm;width:32mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/TotalLTCGL1099BNotShowBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBoxNBB" style="height:6mm;padding-bottom:0mm;padding-top:3mm;width:31mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/TotalLTCGL1099BNotShowBasisGrp/TotalGainOrLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div class="styBB" style="width:187mm">
								<div class="styLNLeftNumBox" style="height:6mm;padding-top:0mm;padding-bottom:0mm;width:5mm;padding-left:0mm;">10</div>
								<div class="styLNDesc" style="height:6mm;padding-top:0mm;padding-bottom:0mm;width:52mm;padding-left:.5mm;">
									Totals for all transactions reported on 
									<span style="float:left;clear:none;">Form(s) 8949 with <b>Box F </b>checked</span> 
                        <!--Dotted Line-->
								<span class="styDotLn" style="letter-spacing:2mm;float:right;clear:none;padding-right:2mm;">..</span>			 			 
								</div>
								<div class="styLNAmountBoxNBB" style="height:6mm;padding-top:3mm;padding-bottom:0mm;width:31mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/TotalLTCGL1099BNotReceivedGrp/TotalProceedsSalesPriceAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBoxNBB" style="height:6mm;padding-top:2.5mm;padding-bottom:0mm;width:36mm;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/TotalLTCGL1099BNotReceivedGrp/TotalCostOrOtherBasisAmt"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/TotalLTCGL1099BNotReceivedGrp/TotalCostOrOtherBasisAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBoxNBB" style="height:6mm;padding-top:3mm;padding-bottom:0mm;width:32mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/TotalLTCGL1099BNotReceivedGrp/TotAdjustmentsToGainOrLossAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBoxNBB" style="height:6mm;padding-top:3mm;padding-bottom:0mm;width:31mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/TotalLTCGL1099BNotReceivedGrp/TotalGainOrLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
						<!-- END PART II TABLE -->
							<div style="width:187mm;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-bottom:0mm;width:5mm;padding-left:0mm;">11</div>
								<div class="styLNDesc" style="height:4mm;padding-bottom:0mm;width:143.1mm;">
									<span style="float:left;clear:none;">Enter gain from Form 4797, Part I</span>
					    <!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.......................</span>
								</div>
								<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;">11</div>
								<div class="styLNAmountBox" style="height:4mm;padding-bottom:0mm;width:30.8mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/Form4797GainOrLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:187mm;float:right;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-bottom:0mm;width:5mm;padding-left:0mm;">12</div>
								<div class="styLNDesc" style="height:4mm;padding-bottom:0mm;width:143.1mm;">
									<span style="float:left;clear:none;">Long-term capital gain from installment sales from Form 6252, line 26 or 37</span>
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..........</span>
								</div>
								<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;">12</div>
								<div class="styLNAmountBox" style="height:4mm;padding-bottom:0mm;width:30.8mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/LTCapGainInstalSlsAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:187mm;float:right;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-bottom:0mm;width:5mm;padding-left:0mm;">13</div>
								<div class="styLNDesc" style="width:143.1mm;height:4mm;padding-bottom:0mm;">
									<span style="float:left;clear:none;">Long-term capital gain (loss) from like-kind exchanges from Form 8824</span>
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">............</span>
								</div>
								<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;">13</div>
								<div class="styLNAmountBox" style="height:4mm;padding-bottom:0mm;width:30.8mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/LTCapGainLossLikeKindExchAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:187mm;">
								<div class="styLNLeftNumBox" style="padding-top:0mm;padding-bottom:0mm;width:5mm;padding-left:0mm;">14</div>
								<div class="styLNDesc" style="width:143.1mm;padding-top:0mm;padding-bottom:0mm;">
									<span style="float:left;clear:none;">Partnership's share of net long-term capital gain (loss) from other partnerships, estates, and trusts</span>
									
							<!--Dotted Line-->
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>			 
								</div>
								<div class="styLNRightNumBox" style="padding-bottom:0mm;">14</div>
								<div class="styLNAmountBox" style="padding-bottom:0mm;width:30.8mm;border-bottom-width:1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/PartnershipShareNetLTCGLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:187mm;float:right;clear:none;">
								<div class="styLNLeftNumBox" style="padding-bottom:0mm;width:5mm;padding-left:0mm;">15</div>
								<div class="styLNDesc" style="width:143.1mm;padding-bottom:0mm;">
									<span style="float:left;clear:none;"><b>Net long-term capital gain or (loss).</b> Combine lines 8a through 14 in column (h)</span>       
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........</span>
								</div>
								<div class="styLNRightNumBox" style="padding-bottom:0mm;border-bottom-width:0">15</div>
								<div class="styLNAmountBox" style="width:30.8mm;padding-bottom:0mm;border-bottom-width:0">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/NetLTCapitalGainLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<div class="styBB" style="width:187mm">
							<div class="styBB" style="width:187mm;">
								<div class="styPartDesc" style="height:4mm;width:182mm;text-align:center;">
									<b>Part III—Summary of Parts I and II</b>
								</div>
							</div>
							<div style="width:187mm;float:right;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-bottom:0mm;width:5mm;padding-left:0mm;">16</div>
								<div class="styLNDesc" style="width:143.1mm;height:4mm;padding-bottom:0mm;">
									<span style="float:left;clear:none;">Combine lines 7 and 15 and enter the net gain (loss)</span>
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.................</span>
								</div>
								<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;">16</div>
								<div class="styLNAmountBox" style="height:4mm;padding-bottom:0mm;width:30.8mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/NetGainOrLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:187mm;float:right;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-bottom:0mm;width:5mm;padding-left:0mm;">17</div>
								<div class="styLNDesc" style="width:143.1mm;height:4mm;padding-bottom:0mm;">
									<span style="float:left;clear:none;">Enter excess of net short-term capital gain (line 7) over net long-term capital loss (line 15)</span>
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.....</span>
								</div>
								<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;">17</div>
								<div class="styLNAmountBox" style="height:4mm;padding-bottom:0mm;width:30.8mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/ExNetSTGainOverNetLTLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:187mm;float:right;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-bottom:0mm;width:5mm;padding-left:0mm;">18</div>
								<div class="styLNDesc" style="width:143.1mm;height:4mm;padding-bottom:0mm;">
									<span style="float:left;clear:none;"><b>Net capital gain or (loss).</b> Subtract line 17 from line 16</span>
					    <!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">................</span>
								</div>
								<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom-width:0">18</div>
								<div class="styLNAmountBox" style="height:4mm;padding-bottom:0mm;width:30.8mm;border-bottom-width:0">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/NetCapitalGainOrLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<div class="styBB" style="width:187mm">
							<div class="styBB" style="width:187mm;">
								<div class="styPartDesc" style="height:4mm;width:182mm;text-align:center;">
									<b>Part IV—Net Capital Gain (Loss) From Passive Loss Limitation Activities</b>
								</div>
							</div>
							<div style="width:187mm;float:right;clear:none;">
								<div class="styLNLeftNumBox" style="height:7mm;width:5mm;padding-left:0mm;">19</div>
								<div class="styLNDesc" style="width:143.1mm;height:7mm;">
									Redetermine the amount on line 17 by taking into account only gains and losses from passive	loss limitation activities
									
						<!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">..............................</span>
								</div>
								<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm;">19</div>
								<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm;width:30.8mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/GainsLossesFromPssvLossLmtAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:187mm;float:right;clear:none;">
								<div class="styLNLeftNumBox" style="height:7mm;padding-top:0mm;padding-bottom:0mm;width:5mm;padding-left:0mm;">20</div>
								<div class="styLNDesc" style="width:143.1mm;height:7mm;padding-top:0mm;padding-bottom:0mm;">
									<b>Excess of net short-term capital gain over net long-term capital loss. </b> Enter the <b>smaller</b> of the<br/>
									amount on line 17 or line 19. Enter here and on page 1, Part I, line 8
						<!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:.5mm;">.............</span>
								</div>
								<div class="styLNRightNumBox" style="height:7mm;padding-bottom:0mm;padding-top:3.5mm;">20</div>
								<div class="styLNAmountBox" style="height:7mm;padding-bottom:0mm;width:30.8mm;padding-top:3.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/ExcessGainLossPssvLossLmtAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:187mm;float:right;clear:none;">
								<div class="styLNLeftNumBox" style="height:7mm;padding-top:0mm;padding-bottom:0mm;width:5mm;padding-left:0mm;">21</div>
								<div class="styLNDesc" style="height:7mm;padding-top:0mm;padding-bottom:0mm;width:143.1mm;">Redetermine the amount on line 18 by taking into account only gains and losses from passive loss limitation activities
						<!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">..............................</span>
								</div>								
								<div class="styLNRightNumBox" style="height:7mm;padding-bottom:0mm;padding-top:3.5mm;">21</div>
								<div class="styLNAmountBox" style="height:7mm;padding-bottom:0mm;width:30.8mm;padding-top:3.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/PassiveActivityLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:187mm;float:right;clear:none;">
								<div class="styLNLeftNumBox" style="height:10mm;width:5mm;padding-left:0mm;">22</div>
								<div class="styLNDesc" style="height:10mm;width:143.1mm;">
									<b>Net capital gain or (loss) from passive loss limitation activities. </b> If lines 18 and 21 are both<br/>
									  positive or both negative, enter the <b>smaller</b> of line 18 or line 21. Otherwise, enter -0-. Enter here<br/>
									  and on Schedule K, line 4a
						<!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:.5mm;">.........................</span>
								</div>
								<div class="styLNRightNumBox" style="height:10mm;padding-top:7mm;">22</div>
								<div class="styLNAmountBox" style="height:10mm;width:30.8mm;padding-top:7mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/NetPssvLossLimitationActyAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:187mm;float:right;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-top:0mm;padding-bottom:0mm;width:5mm;padding-left:0mm;"/>
								<div class="styLNDesc" style="width:143.1mm;height:4mm;padding-top:0mm;padding-bottom:0mm;">
									<b>Note. </b>
									<!--<span class="styBoldText">Note.</span>-->
									<span class="styItalicText">When figuring whether line 18 or line 21 is <b>smaller</b>, treat both numbers as positive.</span>
									<!--Dotted Line-->
								</div>
								<div class="styLNRightNumBox" style="height:4mm;padding-top:0mm;padding-bottom:0mm;border-bottom-width:0;background:lightgrey"/>
								<div class="styLNAmountBox" style="height:4mm;padding-top:0mm;padding-bottom:0mm;width:30.8mm;border-left-width:0;border-bottom-width:0;background:lightgrey"/>
							</div>
						</div>
						<div class="styBB" style="width:187mm;">
							<div class="styPartDesc" style="height:4mm;width:182mm;text-align:center;">
								<b>   Part V—Net Capital Gain (Loss) From Other Activities</b>
							</div>
						</div>
					<div class="" style="width:187mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">	
						<div style="width:187mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:7mm;width:5mm;padding-left:0mm;padding-top:0mm;padding-bottom:0mm;">23</div>
							<div class="styLNDesc" style="width:143.1mm;height:7mm;padding-top:0mm;padding-bottom:0mm;">
								<b>Excess of net short-term capital gain over net long-term capital loss. </b>  Subtract line 20 from line 17. Enter here and on page 2, Part II, line 4
						<!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">.......................</span>
							</div>
							<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm;padding-bottom:0mm;">23</div>
							<div class="styLNAmountBox" style="height:7mm;width:30.8mm;padding-top:3.5mm;padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/ExGainsLossesFromOthActyAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:7mm;width:5mm;padding-left:0mm;padding-top:0mm;padding-bottom:0mm;">24</div>
							<div class="styLNDesc" style="width:143.1mm;height:7mm;padding-top:0mm;padding-bottom:0mm;">
								<b>Net capital gain or (loss) from other activities. </b> Subtract line 22 from line 18. Enter here and on Schedule K, line 4b       
					    <!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:.5mm;">...............................</span>
							</div>
							<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm;padding-bottom:0mm;border-bottom-width:0">24</div>
							<div class="styLNAmountBox" style="height:7mm;width:30.8mm;padding-top:3.5mm;padding-bottom:0mm;border-bottom-width:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/NetGainsLossesFromOtherActyAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div style="width:187mm;">
						<div style="float:right;">
							<span style="width:40px;"/>  
      Form
                        <span class="styBoldText" style="font-size:8pt;">1065-B</span> (2013)
                    </div>
					</div>
					<p style="page-break-before: always"/> 
					<!-- END Page Break and Footer-->
					<!-- Page Header -->
					<div class="styBB" style="width:187mm;">
						<div style="float:left;">Form 1065-B (2013)
                        <span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page 
                        <span style="font-weight:bold;font-size:8pt;">4</span>
						</div>
					</div>
					<!-- END Page Header -->
					<div class="styBB" style="width:187mm;height:3.75mm;">
						<div class="styPartName" style="height:4mm;width:19mm">Schedule K</div>
						<div class="styPartDesc" style="height:4mm;float:left;width:167mm;"> 
							Partners’ Shares of Income, Credits, Deductions, etc.
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK"/>
								</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styPartDesc" style="height:4.5mm;width:148.5mm;border-right:1px solid black;text-align:center;"> (a) Distributive share items. </div>
						<div class="styPartDesc" style="height:4.5mm;width:38mm;text-align:center;"> (b) Total amount</div>
					</div>
					<!--Line 1a-->
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4.5mm;width:6mm;padding-left:1.5mm;">1a</div>
						<div class="styLNDesc" style="height:4.5mm;width:142.1mm;">
							<span style="float:left;clear:none;">Taxable income (loss) from passive loss limitation activities (Part I, line 25)</span>
 					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">1a</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:30.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/TxblIncmLossPssvLossLmtActyAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4.5mm;width:6mm;padding-left:3mm;">b</div>
						<div class="styLNDesc" style="height:4.5mm;width:142.1mm;">
							Amount on line 1a allocated to general partners as:
                        <span style="width:2px;"/>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:8.3mm;background:lightgrey;border-bottom-width:0;border-right-width:1px"/>
				
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4.5mm;width:6mm;text-align:right;"/>
						<div class="styLNDesc" style="height:4.5mm;width:100.1mm;">
							<span style="float:left;clear:none;"><b>(1)  </b> Taxable income (loss) from trade or business activities</span>
 					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:10mm">1b(1)</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/TaxableIncomeLossTrdBusActyAmt"/>
							</xsl:call-template>
						</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:8.3mm;background-color:lightgrey;border-bottom-width:0px;border-right-width:1px;"/>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4.5mm;width:6mm;text-align:right;"/>
						<div class="styLNDesc" style="height:4.5mm;width:100.1mm;">
							<span style="float:left;clear:none;"><b>(2)  </b> Taxable income (loss) from rental real estate activities</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:10mm">1b(2)</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/TaxableIncomeLossRntlREActyAmt"/>
							</xsl:call-template>
						</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:8.3mm;background-color:lightgrey;border-bottom-width:0px;border-right-width:1px;"/>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4.5mm;width:6mm;text-align:right;"/>
						<div class="styLNDesc" style="height:4.5mm;width:100.1mm;">
							<span style="float:left;clear:none;"><b>(3) </b>	Taxable income (loss) from other rental activities</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:10mm">1b(3)</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/TaxableIncmLossOthRntlActyAmt"/>
							</xsl:call-template>
						</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:8.3mm;background-color:lightgrey;border-bottom-width:0px;border-right-width:1px;"/>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4.5mm;width:6mm;padding-left:3mm;">c</div>
						<div class="styLNDesc" style="width:142.1mm;height:4mm;">
							<span style="float:left;clear:none;">Total amount on line 1a allocated to general partners. Combine lines 1b(1) through 1b(3)</span>
 					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">1c</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:30.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/TotalAllocatedGeneralPrtnrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;width:6mm;padding-left:3mm;">d</div>
						<div class="styLNDesc" style="width:142.1mm;padding-bottom:0mm;">
					  Taxable income (loss) from passive loss limitation activities allocated to limited partners. Subtract
                    </div>
							<div class="styLNRightNumBox" style="height:4.3mm;width:8.3mm;background-color:lightgrey;border-bottom-width:0px;border-right-width:1px;"/>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;width:6mm;text-align:right;"/>
						<div class="styLNDesc" style="width:142.1mm;">
							<span style="float:left;clear:none;">line 1c from line 1a (report on Schedules K-1, box 1)</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.................</span>	
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">1d</div>
						<div class="styLNAmountBox" style="height:4mm;width:30.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/TaxableIncomeLossPssvActyAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4.5mm;width:6mm;padding-left:1.5mm;">2</div>
						<div class="styLNDesc" style="width:142.1mm;height:4mm;">
							<span style="float:left;clear:none;">Taxable income (loss) from other activities (Part II, line 13)</span>
 					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">2</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:30.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/TaxableIncomeLossOtherActyAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4.5mm;width:6mm;padding-left:1.5mm;">3</div>
						<div class="styLNDesc" style="width:142.1mm;height:4mm;">
							<span style="float:left;clear:none;">Qualified dividends from other activities (Part II, line 2b)</span>
 					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">3</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:30.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/QualifiedDividendsOtherActyAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4.5mm;width:6mm;padding-left:1.5mm;">4a</div>
						<div class="styLNDesc" style="width:142.1mm;height:4mm;">
							<span style="float:left;clear:none;">Net capital gain (loss) from passive loss limitation activities (Schedule D, line 22)</span>
  					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">4a</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:30.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/NetCapitalGainLossPssvActyAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4.5mm;width:6mm;padding-left:3mm;">b</div>
						<div class="styLNDesc" style="width:142.1mm;height:4mm;">
							<span style="float:left;clear:none;">Net capital gain (loss) from other activities (Schedule D, line 24)</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">4b</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:30.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/NetCapitalGainLossOtherActyAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;width:6mm;padding-left:1.5mm;">5</div>
						<div class="styLNDesc" style="width:142.1mm;height:4mm;">
							<span style="float:left;clear:none;">Net passive alternative minimum tax adjustment</span>
 					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">5</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:30.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/NetPassiveAMTAdjustmentAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;width:6mm;padding-left:1.5mm;">6</div>
						<div class="styLNDesc" style="width:142.1mm;height:4mm;">
							<span style="float:left;clear:none;">Net other alternative minimum tax adjustment</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">6</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:30.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/NetOtherAMTAdjustmentAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;width:6mm;padding-left:1.5mm;">7</div>
						<div class="styLNDesc" style="width:142.1mm;height:4mm;">
							<span style="float:left;clear:none;">Guaranteed payments</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">7</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:30.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/GuaranteedPaymentsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;width:6mm;padding-left:1.5mm;">8</div>
						<div class="styLNDesc" style="width:142.1mm;height:4mm;">
							<span style="float:left;clear:none;">Income from discharge of indebtedness</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">8</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:30.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/TotalDischargedIndebtednessAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;width:6mm;padding-left:1.5mm;">9</div>
						<div class="styLNDesc" style="width:142.1mm;height:4mm;">
							<span style="float:left;clear:none;">Tax-exempt interest income</span>
 					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">9</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:30.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/TaxExemptInterestIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;width:6mm;padding-left:0mm;">10</div>
						<div class="styLNDesc" style="width:142.1mm;height:4mm;">
							<span style="float:left;clear:none;">General credits (see instructions)
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/GeneralBusinessCreditAmt"/>
								</xsl:call-template>
							</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">......................</span>	
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">10</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:30.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/GeneralBusinessCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;width:6mm;padding-left:0mm;">11</div>
						<div class="styLNDesc" style="width:142.1mm;height:4mm;">
							<span style="float:left;clear:none;">Low-income housing credit (see instructions)
 								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/LowIncomeHousingCreditAmt"/>
								</xsl:call-template>
							</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...................</span>	
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">11</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:30.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/LowIncomeHousingCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 12-->
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;width:6mm;padding-left:0mm;">12</div>
						<div class="styLNDesc" style="width:142.1mm;height:4mm;">
							<span style="float:left;clear:none;">Rehabilitation credit from rental real estate activities
                    <!--(attach Form 3468)-->
							<span class="styItalicText"> (attach Form 3468)</span>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/RehabilitationCreditAmt"/>
								</xsl:call-template>
							</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">......</span>	
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">12</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:30.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/RehabilitationCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 13-->
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4.5mm;width:6mm;padding-left:0mm;">13a</div>
						<div class="styLNDesc" style="width:142.1mm;height:4mm;">
							<span style="float:left;clear:none;">Net earnings (loss) from self-employment</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">13a</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:30.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/NetSelfEmploymentEarningsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;width:6mm;">b</div>
						<div class="styLNDesc" style="width:142.1mm;height:4mm;">
							<span style="float:left;clear:none;">Gross nonfarm income</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">13b</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:30.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/GrossNonfarmIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 14-->
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;width:6mm;padding-left:0mm;">14a</div>
						<div class="styLNDesc" style="width:142.1mm;height:4mm;">
        Name of foreign country or U.S. possession
                        <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactionsSchKDetail/ForeignCountryOrUSPossessionCd"/>
							</xsl:call-template>
								<span style="width:2mm;"/>
								<img src="{$ImagePath}/1065B_Bullet_Sm.gif" alt="SmallBullet"/>
								<span style="width:2mm;"/>
										<span class="styFixedUnderline" style="width:75mm;border-style:dotted;float:none;padding-right:2mm;">
								<xsl:if test="$Form1065BData/IRS1065BScheduleK/ForeignTransactionsSchKDetail/ForeignCountryOrUSPossessionCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactionsSchKDetail/ForeignCountryOrUSPossessionCd"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form1065BData/IRS1065BScheduleK/ForeignTransactionsSchKDetail/FrgnCountryOrUSPossVariousCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactionsSchKDetail/FrgnCountryOrUSPossVariousCd"/>
									</xsl:call-template>
								</xsl:if>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:8.3mm;background-color:lightgrey;border-bottom-width:0px;border-right-width:1px;"/>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;width:6mm;">b</div>
						<div class="styLNDesc" style="width:142.1mm;height:4mm;">
							<span style="float:left;clear:none;">Gross income from all sources</span>
 					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">14b</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:30.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactionsSchKDetail/GrossIncomeFromAllSourcesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;width:6mm;">c</div>
						<div class="styLNDesc" style="width:142.1mm;height:4mm;">
							<span style="float:left;clear:none;">Gross income sourced at partner level (attach statement)
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactionsSchKDetail/GrossIncomeSourcedPrtshpLvlAmt"/>
								</xsl:call-template>
							</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">14c</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:30.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactionsSchKDetail/GrossIncomeSourcedPrtshpLvlAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;width:6mm;">d</div>
						<div class="styLNDesc" style="width:142.1mm;height:4mm;">Foreign gross income sourced at partnership level:
                        <span style="width:2px;"/>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:8.3mm;background-color:lightgrey;border-bottom-width:0px;border-right-width:1px;"/>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;width:6mm;text-align:right;"/>
						<div class="styLNDesc" style="width:142.1mm;height:4mm;">
							<span style="float:left;clear:none;"><b>(1) </b> Passive category</span>
             		<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;font-size:5pt">14d(1)</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:30.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactionsSchKDetail/FrgnGroIncmSrcPrtshpLvlPssvAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;width:6mm;text-align:right;"/>
						<div class="styLNDesc" style="width:142.1mm;height:4mm;">
							<span style="float:left;clear:none;"><b>(2) </b> General category</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;font-size:5pt">14d(2)</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:30.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactionsSchKDetail/FrgnGroIncmSrcPrtshpLvlGenAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;width:6mm;text-align:right;"/>
						<div class="styLNDesc" style="width:142.1mm;height:4mm;">
							<span style="float:left;clear:none;"><b>(3) </b> Other (attach statement)
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactionsSchKDetail/FrgnGroIncmSrcPrtshpLvlOthAmt"/>
								</xsl:call-template>
							</span>
 					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;font-size:5pt">14d(3)</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:30.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactionsSchKDetail/FrgnGroIncmSrcPrtshpLvlOthAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;width:6mm;">e</div>
						<div class="styLNDesc" style="width:142.1mm;height:4mm;">Deductions allocated and apportioned at partner level:
                        <span style="width:2px;"/>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:8.3mm;background-color:lightgrey;border-bottom-width:0px;border-right-width:1px;"/>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;width:6mm;text-align:right;"/>
						<div class="styLNDesc" style="width:142.1mm;height:4mm;">
							<span style="float:left;clear:none;"><b>(1) </b> Interest expense</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;font-size:5pt">14e(1)</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:30.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactionsSchKDetail/DedAllocApprtnPrtnrLvlIntAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;width:6mm;text-align:right;"/>
						<div class="styLNDesc" style="width:142.1mm;height:4mm;">
							<span style="float:left;clear:none;"><b>(2) </b> Other</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;font-size:5pt">14e(2)</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:30.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactionsSchKDetail/DedAllocApprtnPrtnrLvlOthAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;width:6mm;">f</div>
						<div class="styLNDesc" style="width:142.1mm;height:4mm;">Deductions allocated and apportioned at partnership level to foreign source income:
                        <span style="width:2px;"/>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:8.3mm;background-color:lightgrey;border-bottom-width:0px;border-right-width:1px;"/>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;width:6mm;text-align:right;"/>
						<div class="styLNDesc" style="width:142.1mm;height:4mm;">
							<span style="float:left;clear:none;"><b>(1) </b> Passive category</span>
     				<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;font-size:5pt">14f(1)</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:30.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactionsSchKDetail/DedAllocApprtnPrtshpLvlPssvAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;width:6mm;text-align:right;"/>
						<div class="styLNDesc" style="width:142.1mm;height:4mm;">
							<span style="float:left;clear:none;"><b>(2) </b> General category</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;font-size:5pt">14f(2)</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:30.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactionsSchKDetail/DedAllocApprtnPrtshpLvlGenAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;width:6mm;text-align:right;"/>
						<div class="styLNDesc" style="width:142.1mm;height:4mm;">
							<span style="float:left;clear:none;"><b>(3) </b> Other (attach statement)
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactionsSchKDetail/DedAllocApprtnPrtshpLvlOthAmt"/>
								</xsl:call-template>
							</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;font-size:5pt">14f(3)</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:30.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactionsSchKDetail/DedAllocApprtnPrtshpLvlOthAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;width:6mm;">g</div>
						<div class="styLNDesc" style="width:142.1mm;height:4mm;">Total foreign taxes (check one):
                        <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactionsSchKDetail/TotalForeignTaxesAmt"/>
							</xsl:call-template>
							<span style="width:2px;"/>
							<img src="{$ImagePath}/1065B_Bullet_Sm.gif" alt="SmallBullet"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactionsSchKDetail/TotalForeignTaxesPaidInd"/>
									<xsl:with-param name="BackupName">IRS1065BSchKTotalForeignTaxesPaid</xsl:with-param>
								</xsl:call-template>
        Paid
                        </label>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactionsSchKDetail/TotalForeignTaxesPaidInd"/>
									<xsl:with-param name="BackupName">IRS1065BSchKTotalForeignTaxesPaid</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1px"/>
							<span style="width:3px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactionsSchKDetail/TotalForeignTaxesAccruedInd"/>
									<xsl:with-param name="BackupName">IRS1065BSchKTotalForeignTaxesAccrued</xsl:with-param>
								</xsl:call-template>
         Accrued   
                        </label>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactionsSchKDetail/TotalForeignTaxesAccruedInd"/>
									<xsl:with-param name="BackupName">IRS1065BSchKTotalForeignTaxesAccrued</xsl:with-param>
								</xsl:call-template>
							</input>
							<!--Dotted Line-->

						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">14g</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:30.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactionsSchKDetail/TotalForeignTaxesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;width:6mm;">h</div>
						<div class="styLNDesc" style="width:142.1mm;height:4mm;">
							<span style="float:left;clear:none;">Reduction in taxes available for credit (attach statement)
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactionsSchKDetail/ReductionInTaxesAvlblForCrAmt"/>
								</xsl:call-template>
							</span>
 					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">14h</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:30.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactionsSchKDetail/ReductionInTaxesAvlblForCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm">
						<div style="width:187mm;float:left;">
							<div class="styLNLeftNumBox" style="height:4mm;width:6mm;padding-left:0mm;">15</div>
							<div class="styLNDesc" style="width:142.1mm;height:4mm;">
								<span style="float:left;clear:none;">Other items and amounts required to be reported separately to partners (attach statement)</span>
						<!--Dotted Line-->
								<!--<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>-->
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;background:lightgrey;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:30.8mm;background:lightgrey;border-bottom-width:0px;border-left-width:0px;"/>
						</div>
					</div>
					<div class="styBB" style="width:187mm">
						<div class="styPartDesc" style="height:4mm;width:187mm;padding-left:0mm;">Analysis of Net Income (Loss)</div>
					</div>
					<div class="styBB" style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;width:6mm;padding-left:1.5mm;">1</div>
						<div class="styLNDesc" style="width:142.1mm;height:4mm;">
						<span style="float:left;clear:none;">Net income (loss). In column (b), add lines 1c through 4b, 7, and 8. From the result, subtract line 14g</span>
                        	<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0">1</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:30.8mm;border-bottom-width:0">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/AnalysisOfNetIncomeLoss/NetIncomeLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm;float:left;border-bottom-width: 0px">
						<!--<div class="styBB" style="width:187mm;float:left;">-->
						<div class="styLNLeftNumBox" style="height:4mm;width:6mm;padding-left:1.5mm;">2</div>
						<div class="styLNDesc" style="width:23mm;height:8mm;border-bottom-width:0">Analysis by partner type:				</div>
						<div class="styLNAmountBox" style="text-align:center;width:25.5mm;height:8mm">
							<span class="styBoldText">(i)</span> Corporate
                    </div>
						<div class="styLNAmountBox" style="text-align:center;width:25.5mm;height:8mm;">
							<span class="styBoldText">(ii)</span> Individual (active)
                    </div>
						<div class="styLNAmountBox" style="text-align:center;width:25.5mm;height:8mm;">
							<span class="styBoldText">(iii)</span> Individual (passive)
                    </div>
						<div class="styLNAmountBox" style="text-align:center;width:25.5mm;height:8mm;">
							<span class="styBoldText">(iv)</span> Partnership
                    </div>
						<div class="styLNAmountBox" style="text-align:center;width:25.5mm;height:8mm;">
							<span class="styBoldText">(v)</span> Exempt organization
                    </div>
						<div class="styLNAmountBox" style="text-align:center;width:30mm;height:8mm;">
							<span class="styBoldText">(vi)</span> Nominee/Other
                    </div>
					</div>
					<!--				<xsl:for-each select="$Form1065BData/AnalysisOfNetIncomeLoss/AnalysisPartnerTypeGenPartners"> -->
					<div class="styBB" style="width:187mm;float:left;border-bottom-width:0">
						<div class="styLNLeftLtrBox" style="height:4.5mm;width:6mm;padding-left:3mm;">a</div>
						<div class="styLNDesc" style="width:23mm;">General partners</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:right;width:25.5mm;border-bottom-width:1;padding-top:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/AnalysisOfNetIncomeLoss/AnalysisPartnerGeneralPrtnrGrp/CorporateAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:right;width:25.5mm;border-bottom-width:1;padding-top:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/AnalysisOfNetIncomeLoss/AnalysisPartnerGeneralPrtnrGrp/IndividualActiveAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:right;width:25.5mm;border-bottom-width:1;padding-top:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/AnalysisOfNetIncomeLoss/AnalysisPartnerGeneralPrtnrGrp/IndividualPassiveAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:right;width:25.5mm;border-bottom-width:1;padding-top:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/AnalysisOfNetIncomeLoss/AnalysisPartnerGeneralPrtnrGrp/PartnershipAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:right;width:25.5mm;border-bottom-width:1;padding-top:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/AnalysisOfNetIncomeLoss/AnalysisPartnerGeneralPrtnrGrp/ExemptOrganizationAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:right;width:30mm;border-bottom-width:1;padding-top:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/AnalysisOfNetIncomeLoss/AnalysisPartnerGeneralPrtnrGrp/NomineeOtherAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm;float:left;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;width:6mm;padding-left:3mm;">b</div>
						<div class="styLNDesc" style="width:23mm;border-bottom-width:0">Limited partners</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:right;width:25.5mm;border-bottom-width:0;padding-top:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/AnalysisOfNetIncomeLoss/AnalysisPartnerLimitedPrtnrGrp/CorporateAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:right;width:25.5mm;border-bottom-width:0;padding-top:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/AnalysisOfNetIncomeLoss/AnalysisPartnerLimitedPrtnrGrp/IndividualActiveAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:right;width:25.5mm;border-bottom-width:0;padding-top:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/AnalysisOfNetIncomeLoss/AnalysisPartnerLimitedPrtnrGrp/IndividualPassiveAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:right;width:25.5mm;border-bottom-width:0;padding-top:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/AnalysisOfNetIncomeLoss/AnalysisPartnerLimitedPrtnrGrp/PartnershipAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:right;width:25.5mm;border-bottom-width:0;padding-top:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/AnalysisOfNetIncomeLoss/AnalysisPartnerLimitedPrtnrGrp/ExemptOrganizationAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:right;width:30mm;border-bottom-width:0;padding-top:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/AnalysisOfNetIncomeLoss/AnalysisPartnerLimitedPrtnrGrp/NomineeOtherAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div style="width:187mm;">
						<div style="float:right;">
							<span style="width:40px;"/>  
      Form <span class="styBoldText" style="font-size:8pt;">1065-B</span> (2013)
                    </div>
					</div>
					<p style="page-break-before: always"/> 
					<!-- END Page Break and Footer-->
					<!-- Page Header -->
					<div class="styBB" style="width:187mm;">
						<div style="float:left;">Form 1065-B (2013)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">5</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- BEGIN Schedule L Title -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="width:21mm;height:4mm;">Schedule L</div>
						<div class="styPartDesc" style="width:166mm;">Balance Sheets per Books
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleL"/>
								</xsl:call-template>
						</div>
						
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styLNAmountBox" style="width:58mm;border-bottom-width:0px;border-left-width:0px"/>
						<div class="styLNAmountBox" style="text-align:center;border-bottom-width:0px;width:64mm;">Beginning of tax year</div>
						<div class="styLNAmountBox" style="text-align:center;border-bottom-width:0px;width:64mm;">End of tax year</div>
					</div>
					<!-- END Schedule L Title -->
					<!-- BEGIN Schedule L Line Items -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:50mm;text-align:center;font-weight:bold;border-top-width:0px">Assets</div>
						<div class="styLNAmountBox" style="text-align:center;font-weight:bold;">(a)</div>
						<div class="styLNAmountBox" style="text-align:center;font-weight:bold;">(b)</div>
						<div class="styLNAmountBox" style="text-align:center;font-weight:bold;">(c)</div>
						<div class="styLNAmountBox" style="text-align:center;font-weight:bold;">(d)</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-bottom:0mm;padding-left: 2.25mm;">1</div>
						<div class="styLNDesc" style="width:50mm;padding-bottom:0mm;">
							<span style="float:left;clear:none;">Cash</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..........</span>
						</div>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/CashBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/CashEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-bottom:0mm;padding-left: 2.25mm;">2a</div>
						<div class="styLNDesc" style="width:50mm;padding-bottom:0mm;">Trade notes and accounts receivable</div>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/TradeNotesAccountsRcvblBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/TradeNotesAccountsRcvblEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4mm;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="padding-bottom:0mm;padding-left:4.3mm;">b</div>
						<div class="styLNDesc" style="width:50mm;padding-bottom:0mm;">
							<span style="float:left;clear:none;">Less allowance for bad debts</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..</span>
						</div>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/BadDebtAllowanceBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/BadDebtAllowanceBOY2Amt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/BadDebtAllowanceEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/BadDebtAllowanceEOY2Amt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-bottom:0mm;padding-left: 2.25mm;">3</div>
						<div class="styLNDesc" style="width:50mm;padding-bottom:0mm;">
							<span style="float:left;clear:none;">Inventories</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........</span>
						</div>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/InventoriesBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/InventoriesEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-bottom:0mm;padding-left: 2.25mm;">4</div>
						<div class="styLNDesc" style="width:50mm;padding-bottom:0mm;">
							<span style="float:left;clear:none;">U.S. government obligations</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>
						</div>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/USGovernmentObligationsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/USGovernmentObligationsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-bottom:0mm;padding-left: 2.25mm;">5</div>
						<div class="styLNDesc" style="width:50mm;padding-bottom:0mm;">
							<span style="float:left;clear:none;">Tax-exempt securities</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">....</span>
						</div>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/TaxExemptSecuritiesBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/TaxExemptSecuritiesEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-bottom:0mm;padding-left: 2.25mm;">6</div>
						<div class="styLNDesc" style="width:50mm;padding-bottom:0mm;">
								Other current assets (<i>attach<br/> statement</i>)
					<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">.......</span>
						</div>
						<div class="styShadingCell" style="height:6.5mm;"/>
						<div class="styLNAmountBox" style="height:6.5mm;padding-top:3mm;padding-bottom:0mm;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherCurrentAssetsBOYAmt"/>
							</xsl:call-template>
							<span style="width:1mm;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherCurrentAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:6.5mm;"/>
						<div class="styLNAmountBox" style="height:6.5mm;padding-top:3mm;padding-bottom:0mm;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherCurrentAssetsEOYAmt"/>
							</xsl:call-template>
							<span style="width:1mm;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherCurrentAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 7a-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-bottom:0mm;padding-left: 2.25mm;">7a</div>
						<div class="styLNDesc" style="width:50mm;padding-bottom:0mm;">Loans to partners (or persons related<br/>to partners)
				    <!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;letter-spacing:3.1mm;padding-right:0mm;">........</span>
						</div>
					<!--Line 7a - b-->	
						<div class="styShadingCell" style="height:6.5mm;"/>
						<div class="styLNAmountBox" style="height:6.5mm;padding-top:3mm;padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/PartnerLoanBOYAmt"/>
							</xsl:call-template>
						</div>
					<!--Line 7a - d-->	
						<div class="styShadingCell" style="height:6.5mm;"/>
						<div class="styLNAmountBox" style="height:6.5mm;padding-top:3mm;padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/PartnerLoanEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 7b-->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="padding-bottom:0mm;padding-left:4.3mm;">b</div>
						<div class="styLNDesc" style="width:50mm;padding-bottom:0mm;">
							<span style="float:left;clear:none;">Mortgage and real estate loans</span>
				    <!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..</span>
						</div>
					<!--Line 7b - b-->	
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styLNAmountBox" style="height:4mm;padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/MortgageRealEstateLoansBOYAmt"/>
							</xsl:call-template>
						</div>
					<!--Line 7b - d-->	
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styLNAmountBox" style="height:4mm;padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/MortgageRealEstateLoansEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 8-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-bottom:0mm;padding-left: 2.25mm;">8</div>
						<div class="styLNDesc" style="width:50mm;padding-bottom:0mm;">Other investments
                       (<i>attach statement</i>)
                    </div>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styLNAmountBox" style="height:4mm;padding-bottom:0mm;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherInvestmentsBOYAmt"/>
							</xsl:call-template>
							<span style="width:1mm;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherInvestmentsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styLNAmountBox" style="height:4mm;padding-bottom:0mm;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherInvestmentsEOYAmt"/>
							</xsl:call-template>
							<span style="width:1mm;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherInvestmentsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 9a-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-bottom:0mm;padding-left: 2.5mm;">9a</div>
						<div class="styLNDesc" style="width:50mm;padding-bottom:0mm;">
							<span class="styLNDesc" style="width:50mm;padding-bottom:0mm;">
								Buildings and other depreciable<br/> assets
					<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:.8mm;">.........</span>
							</span>
						</div>
						<div class="styLNAmountBox" style="height:6.5mm;padding-top:3mm;padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/BuildingOtherDeprecAstBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:6.5mm;"/>
						<div class="styLNAmountBox" style="height:6.5mm;padding-top:3mm;padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/BuildingOtherDeprecAstEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:6.5mm;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="padding-bottom:0mm;padding-left:4.5mm;">b</div>
						<div class="styLNDesc" style="width:50mm;padding-bottom:0mm;">
							<span style="float:left;clear:none;">Less accumulated depreciation</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..</span>
						</div>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/AccumulatedDepreciationBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/NetDepreciableAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/AccumulatedDepreciationEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/NetDepreciableAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 10-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-bottom:0mm;">10a</div>
						<div class="styLNDesc" style="width:50mm;padding-bottom:0mm;">
							<span style="float:left;clear:none;">Depletable assets</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">......</span>
						</div>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/DepletableAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/DepletableAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4mm;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="padding-bottom:0mm;">
							<span style="width:1mm"/>b
                        </div>
						<div class="styLNDesc" style="width:50mm;padding-bottom:0mm;">
							<span style="float:left;clear:none;">Less accumulated depletion</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>
						</div>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/AccumulatedDepletionBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/NetDepletableAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/AccumulatedDepletionEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/NetDepletableAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 11-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-bottom:0mm;">11</div>
						<div class="styLNDesc" style="width:50mm;padding-bottom:0mm;">
							<span style="float:left;clear:none;">Land (net of any amortization)</span>
				    <!--Dotted Line-->
						    <span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..</span>
						</div>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/LandBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/LandEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 12-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-bottom:0mm;">12a</div>
						<div class="styLNDesc" style="width:50mm;padding-bottom:0mm;">Intangible assets (amortizable only)
                    </div>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/IntangibleAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/IntangibleAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4mm;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="padding-bottom:0mm;">
							<span style="width:1mm"/>b
                        </div>
						<div class="styLNDesc" style="width:50mm;padding-bottom:0mm;">
							<span style="float:left;clear:none;">Less accumulated amortization</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..</span>
						</div>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/AccumulatedAmortizationBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/NetIntangibleAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/AccumulatedAmortizationEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/NetIntangibleAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-bottom:0mm;">13</div>
						<div class="styLNDesc" style="width:50mm;padding-bottom:0mm;">
							<span style="float:left;clear:none;">Other assets
                        (<i>attach statement</i>)</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.</span>
						</div>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherAssetsBOYAmt"/>
							</xsl:call-template>
							<span style="width:1mm;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherAssetsEOYAmt"/>
							</xsl:call-template>
							<span style="width:1mm;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 14-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-bottom:0mm;">14</div>
						<div class="styLNDesc" style="width:50mm;padding-bottom:0mm;">
							<span style="float:left;clear:none;"><b>Total</b> assets</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.......</span>
						</div>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/TotalAssetsBOYAmt"/>
							</xsl:call-template>
							<span style="width:1mm;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/TotalAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styLNAmountBox" style=";padding-bottom:0mm;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/TotalAssetsEOYAmt"/>
							</xsl:call-template>
							<span style="width:1mm;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/TotalAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-bottom:0mm;"/>
						<div class="styLNDesc" style="width:50mm;text-align:center;padding-bottom:0mm;">
							<b>Liabilities and Capital</b>
						</div>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styShadingCell" style="height:4mm;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-bottom:0mm;">15</div>
						<div class="styLNDesc" style="width:50mm;padding-bottom:0mm;">
							<span style="float:left;clear:none;">Accounts payable</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">......</span>
						</div>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/AccountsPayableBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/AccountsPayableEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-bottom:0mm;">16</div>
						<div class="styLNDesc" style="width:50mm;padding-bottom:0mm;">
							Mortgages, notes, bonds payable in<br/> less than 1 year
					<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">......</span>
						</div>
						<div class="styShadingCell" style="height:6.5mm;"/>
						<div class="styLNAmountBox" style="height:6.5mm;padding-top:3mm;padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/STPayableBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:6.5mm;"/>
						<div class="styLNAmountBox" style="height:6.5mm;padding-top:3mm;padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/STPayableEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 17-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-bottom:0mm;">17</div>
						<div class="styLNDesc" style="width:50mm;padding-bottom:0mm;">
							Other current liabilities (<i>attach<br/> statement</i>)
					<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">.......</span>
						</div>
						<div class="styShadingCell" style="height:6.5mm;"/>
						<div class="styLNAmountBox" style="height:6.5mm;padding-top:3mm;padding-bottom:0mm;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherCurrentLiabilitiesBOYAmt"/>
							</xsl:call-template>
							<span style="width:1mm;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherCurrentLiabilitiesBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:6.5mm;"/>
						<div class="styLNAmountBox" style="height:6.5mm;padding-top:3mm;padding-bottom:0mm;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherCurrentLiabilitiesEOYAmt"/>
							</xsl:call-template>
							<span style="width:1mm;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherCurrentLiabilitiesEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-bottom:0mm;">18</div>
						<div class="styLNDesc" style="width:50mm;padding-bottom:0mm;">
							<span style="float:left;clear:none;">All nonrecourse loans</span>
				    <!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.....</span>
						</div>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/AllNonrecourseLoansBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/AllNonrecourseLoansEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-bottom:0mm;">19a</div>
						<div class="styLNDesc" style="width:50mm;padding-bottom:0mm;">Loans from partners (or persons<br/>related to partners)
				    <!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-right:0mm;">.....</span>
						</div>
						<div class="styShadingCell" style="height:6.5mm;"/>
						<div class="styLNAmountBox" style="height:6.5mm;padding-top:3mm;padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/LoansFromPartnersBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:6.5mm;"/>
						<div class="styLNAmountBox" style="height:6.5mm;padding-top:3mm;padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/LoansFromPartnersEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>

					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="padding-bottom:0mm;">
							<span style="width:1mm"/>b
                        </div>
						<div class="styLNDesc" style="width:50mm;padding-bottom:0mm;">
                        Mortgages, notes, bonds payable in 1<br/> year or more
				    <!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">.......</span>
						</div>
						<div class="styShadingCell" style="height:6.5mm;"/>
						<div class="styLNAmountBox" style="height:6.5mm;padding-top:3mm;padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/LTPayableBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:6.5mm;"/>
						<div class="styLNAmountBox" style="height:6.5mm;padding-top:3mm;padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/LTPayableEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-bottom:0mm;">20</div>
						<div class="styLNDesc" style="width:50mm;padding-bottom:0mm;">
							<span style="float:left;clear:none;">Other liabilities
                        (<i>attach statement</i>)</span>
				    <!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.</span>
						</div>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherLiabilitiesBOYAmt"/>
							</xsl:call-template>
							<span style="width:1mm;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherLiabilitiesBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherLiabilitiesEOYAmt"/>
							</xsl:call-template>
							<span style="width:1mm;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherLiabilitiesEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-bottom:0mm;">21</div>
						<div class="styLNDesc" style="width:50mm;padding-bottom:0mm;">
							<span style="float:left;clear:none;">Partners' capital accounts</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>
						</div>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/PartnersCapitalAccountsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styLNAmountBox" style="padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/PartnersCapitalAccountsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-bottom:0mm;">22</div>
						<div class="styLNDesc" style="width:50mm;padding-bottom:0mm;">
							<span style="float:left;clear:none;"><b>Total</b> liabilities and capital</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>
						</div>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styLNAmountBoxNBB" style="padding-bottom:0mm;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/TotalLiabilitiesCapitalBOYAmt"/>
							</xsl:call-template>
							<span style="width:1mm;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/TotalLiabilitiesCapitalBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styLNAmountBoxNBB" style="padding-bottom:0mm;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/TotalLiabilitiesCapitalEOYAmt"/>
							</xsl:call-template>
							<span style="width:1mm;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/TotalLiabilitiesCapitalEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END Schedule L Line Items -->
					
					<!-- BEGIN Schedule M-1 Title -->
					<div style="width:187mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px">
					  <div class="styLNDesc" style="width:28mm;height:7mm;padding-top:1.5mm;">
						<div class="styPartName" style="width:28mm;height:4mm;">Schedule M-1</div>
					  </div>	
						<div class="styPartDesc" style="width:158mm;">Reconciliation of Income (Loss) per Books With Income (Loss) per Return<br/>
							<span style="font-weight:normal">
								<b>Note.</b> The partnership may be required to file Schedule M-3 (see instructions).
                        </span>
						</div>
					</div>
					<!-- END Schedule M-1 Title -->
					<!-- BEGIN Schedule M-1 Line Items -->
					<div style="height:59mm;width:187mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px">
						<!-- BEGIN Left Side Table of Schedule M-1-->
						<table class="styTable" style="height:59mm;font-size:7pt;width:93.5mm;float:left;" cellspacing="0">
							<thead/>
							<tfoot/>
							<tbody>
								<tr>
									<td class="styLNLeftNumBoxSD" style="width:4mm;padding-top:1mm;padding-bottom:0mm;">1</td>
									<td class="styLNDesc" style="width:57mm;padding-left:4mm;padding-top:1mm;padding-bottom:0mm;" colspan="2">
										<span style="float:left;clear:none;">Net income (loss) per books</span>
							   <!--Dotted Line-->
									   <span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>
									</td>
									<td class="styLNAmountBox" style="border-right-width:1px;padding-top:1mm;padding-bottom:0mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM1/NetIncomeLossPerBooksAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBoxSD" style="height:12mm;width:4mm;vertical-align:top;padding-bottom:0mm;">2</td>
									<td class="styLNDesc" style="height:12mm;width:57mm;padding-left:4mm;padding-bottom:0mm;" colspan="2">
										 Income included on Schedule K, lines 1c through 4b, and 8, not recorded on books this year (itemize): 
										 <xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1065BScheduleM1/TotalTaxableIncmNotRecOnBksAmt"/>
										</xsl:call-template>
										<span style="width:2px;"/>
										<span class="styFixedUnderline" style="width:21mm;border-style:dotted;float:none;padding-right:2mm;"/>
										<span class="styFixedUnderline" style="width:50mm;border-style:dotted;float:none;padding-right:2mm;"/>
									</td>
									<td class="styLNAmountBox" style="height:12.5mm;border-bottom-width:1px;border-right-width:1px;padding-top:8.5mm;padding-bottom:0mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM1/TotalTaxableIncmNotRecOnBksAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBoxSD" style="height:4.5mm;width:4mm;vertical-align:center;padding-top:1mm;padding-bottom:0mm;">3</td>
									<td class="styLNDesc" style="height:4.5mm;width:57mm;padding-left:4mm;padding-top:1mm;padding-bottom:0mm;" colspan="2">
										<span style="float:left;clear:none;">Guaranteed payments</span>
							    <!--Dotted Line-->
									    <span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.....</span>
									</td>
									<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;padding-top:1mm;padding-bottom:0mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM1/GuaranteedPaymentsAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBoxSD" style="height:10mm;width:4mm;vertical-align:top;padding-bottom:0mm;">4</td>
									<td class="styLNDesc" style="width:57mm;padding-left:4mm;padding-bottom:0mm;" colspan="2">
										 Expenses recorded on books this year not
										 included on Schedule K, lines 1c through
										 4b, and 14g (itemize):
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM1/TotalExpensesNotDeductedAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxNBB" style="height:10mm;border-right-width:1px;padding-bottom:0mm;">
									</td>
								</tr>
								<tr>
									<td class="styLNLeftLtrBox" style="width:4mm;padding-left:3.5mm;padding-bottom:0mm;">a</td>
									<td class="styLNDesc" style="width:57mm;padding-left:4mm;padding-bottom:0mm;" colspan="2">
										<div class="styLNDesc" style="width:22mm;padding-bottom:0mm">Depreciation $
                                    </div>
										<div class="styIRS1065BBText" style="width:28mm;float:left;text-align:right;padding-top:1mm;padding-bottom:0mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065BScheduleM1/DepreciationExpensesAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="styLNAmountBoxNBB" style="border-right-width:1px;padding-bottom:0mm;">
									</td>
								</tr>
								<tr>
									<td class="styLNLeftLtrBox" style="width:4mm;padding-left:3.5mm;padding-bottom:0mm;">b</td>
									<td class="styLNDesc" style="width:57mm;padding-left:4mm;padding-bottom:0mm;" colspan="2">
									<div class="styLNDesc" style="height:6mm;width:22mm;padding-bottom:0mm;">Travel and entertainment $
                                    </div>
  										<div class="styIRS1065BBText" style="height:6.5mm;width:28mm;float:left;text-align:right;padding-top:3.5mm;padding-bottom:0mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065BScheduleM1/TravelEntertainmentAmt"/>
											</xsl:call-template>
										</div>
 										<span class="styFixedUnderline" style="width:50mm;border-style:dotted;float:none;padding-right:2mm;"/>										
										<span class="styFixedUnderline" style="width:50mm;border-style:dotted;float:none;padding-right:2mm;"/>
										<span class="styFixedUnderline" style="width:50mm;border-style:dotted;float:none;padding-right:2mm;"/>
										<span class="styFixedUnderline" style="width:50mm;border-style:dotted;float:none;padding-right:2mm;"/>
									</td>
									<td class="styLNAmountBox" style="height:18.5mm;border-bottom-width:1px;border-right-width:1px;padding-top:15mm;padding-bottom:0mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM1/TotalExpensesNotDeductedAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBoxSD" style="height:5.5mm;width:4mm;padding-top:2mm;padding-bottom:0mm;">5</td>
									<td class="styLNDesc" style="height:5.5mm;width:57mm;padding-left:4mm;padding-top:2mm;padding-bottom:0mm;" colspan="2">
										<span style="float:left;clear:none;">Add lines 1 through 4</span>
								    <!--Dotted Line-->
											<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.....</span>
									</td>
									<td class="styLNAmountBoxNBB" style="height:5.5mm;border-right-width:1px;padding-top:2mm;padding-bottom:0mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM1/IncomeExpensesSubtotalAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
						<!-- END Left Side table of Schedule M-1-->
						<!-- BEGIN Right Side table of Schedule M-1-->
						<table class="styTable" style="height:50mm;width:93.5mm;font-size:7pt;float:left;" cellspacing="0">
							<thead/>
							<tfoot/>
							<tbody>
								<tr>
									<td class="styLNLeftNumBoxSD" style="width:4mm;vertical-align:top;padding-bottom:0mm;">6</td>
									<td class="styLNDesc" style="height:10mm;width:57mm;padding-left:4mm;padding-bottom:0mm;" colspan="2">
											Income recorded on books this year not
											included on Schedule K, lines 1c through
											4b, and 8 (itemize):
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM1/TotalIncmNotRecordedOnBooksAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxNBB" style="height:10mm;">
									</td>
								</tr>
								<tr>
									<td class="styLNLeftLtrBox" style="width:4mm;padding-left:3.5mm;padding-top:1mm;padding-bottom:0mm;">a</td>
									<td class="styLNDesc" style="height:11mm;width:57mm;padding-left:4mm;padding-top:1mm;padding-bottom:0mm;" colspan="2">
										<div class="styLNDesc" style="width:29mm;padding-bottom:0mm;">
											Tax-exempt interest $
										</div>
										<div class="styIRS1065BBText" style="width:21mm;font-size:6.3pt;float:left;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065BScheduleM1/TaxExemptInterestAmt"/>
											</xsl:call-template>
										</div>
										<span class="styFixedUnderline" style="width:50mm;border-style:dotted;float:none;padding-right:2mm;"/>
										<span class="styFixedUnderline" style="width:50mm;border-style:dotted;float:none;padding-right:2mm;"/>											
									</td>
									<td class="styLNAmountBox" style="height:11mm;border-bottom-width:1px;padding-top:7.5mm;padding-bottom:0mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM1/TotalIncmNotRecordedOnBooksAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBoxSD" style="width:4mm;vertical-align:top;padding-bottom:0mm;">7</td>
									<td class="styLNDesc" style="height:12mm;width:57mm;padding-left:4mm;padding-bottom:0mm;" colspan="2">
											Deductions included on Schedule K, lines 1c
											through 4b, and 14g, not charged against book
											income this year (itemize):
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM1/TotalDeductionsNotChargedAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxNBB" style="height:12mm;">
									</td>
								</tr>
								<tr>
									<td class="styLNLeftLtrBox" style="width:4mm;padding-left:3.5mm;padding-top:1mm;padding-bottom:0mm;">a</td>
									<td class="styLNDesc" style="height:11mm;width:57mm;padding-left:4mm;padding-top:1mm;padding-bottom:0mm;" colspan="2">
										<div class="styLNDesc" style="width:19mm;padding-bottom:0mm;">Depreciation $</div>
										<div class="styIRS1065BBText" style="width:31mm;float:left;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065BScheduleM1/DepreciationDeductionAmt"/>
											</xsl:call-template>
										</div>	
										<span class="styFixedUnderline" style="width:50mm;border-style:dotted;float:none;padding-right:2mm;"/>
										<span class="styFixedUnderline" style="width:50mm;border-style:dotted;float:none;padding-right:2mm;"/>				
										<span class="styFixedUnderline" style="width:50mm;border-style:dotted;float:none;padding-right:2mm;"/>				
									</td>
									<td class="styLNAmountBoxNBB" style="">
									</td>
									<td class="styLNAmountBox" style="height:10mm;border-bottom-width:1px;padding-top:6.5mm;padding-bottom:0mm;">
										<!--<xsl:attribute name="style">width:31mm;</xsl:attribute>-->
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM1/TotalDeductionsNotChargedAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBoxSD" style="height:4.5;width:4mm;padding-bottom:0mm;">8</td>
									<td class="styLNDesc" style="height:4.5mm;width:57mm;padding-left:4mm;padding-bottom:0mm;" colspan="2">
										<span style="float:left;clear:none;">Add lines 6 and 7</span>
									<!--Dotted Line-->
											<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">......</span>
									</td>
									<td class="styLNAmountBox" style="height:4.5mm;padding-top:1mm;padding-bottom:0mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM1/IncomeDeductionsSubtotalAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBoxSD" style="width:4mm;vertical-align:top;padding-bottom:0mm;">9</td>
									<td class="styLNDesc" style="height:10mm;width:57mm;font-size:7pt;padding-left:4mm;padding-bottom:0mm;" colspan="2">
									    Income (loss). (Analysis of Net Income
										(Loss), line 1.) Subtract line 8 from line 5
									</td>
									<td class="styLNAmountBox" style="height:7.5mm;border-bottom-width:0px;padding-top:4mm;padding-bottom:0mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM1/IncomeLossAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
						<!-- END Right Side Table of Schedule M-1-->
					</div>
					<!-- BEGIN Schedule M-2 Title -->
					<div style="width:187mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px">
						<div class="styPartName" style="width:28mm;height:4mm;">Schedule M-2</div>
						<div class="styPartDesc" style="width:158mm;">
							  Analysis of Partners' Capital Accounts
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleM2"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END Schedule M-2 Title -->
					<!-- BEGIN Schedule M-2 Line Items -->
					<div style="width:187mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px">
						<!-- BEGIN Left Side Table of Schedule M-2-->
						<table class="styTable" style="width:93.5mm;font-size:7pt;float:left;" cellspacing="0">
							<thead/>
							<tfoot/>
							<tbody>
								<!--line 1-->
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBoxSD" style="width:4mm;padding-bottom:0mm;">1</td>
									<td class="styLNDesc" style="width:57mm;padding-left:4mm;padding-bottom:0mm;" colspan="2">
										<span style="float:left;clear:none;">Balance at beginning of year</span>
								<!--Dotted Line-->
										<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>
									</td>
									<td class="styLNAmountBox" style="border-right-width:1px;padding-bottom:0mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM2/BeginningYearBalanceAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBoxSD" style="width:4mm;padding-bottom:0mm;">2</td>
									<td class="styLNDesc" style="width:57mm;" colspan="2">
										<div class="styLNDesc" style="width:30mm;padding-left:4mm;">
											Capital Contributed:
										</div>
										<div class="styLNDesc" style="width:25mm;padding-bottom:0mm;">
											<span class="styBoldText">a</span>
											<span style="width:4px"/>Cash
									<!--Dotted Line-->
												<span class="styDotLn" style="float:none;padding-left:2mm;">..</span>
										</div>	
								</td>			
										<td class="styLNAmountBox" style="border-right-width:1px;padding-bottom:0mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM2/CapitalContributedDurYrCashAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBox" style="width:4mm;padding-bottom:0mm;"/>
									<td class="styLNDesc" style="width:57mm;padding-bottom:0mm;" colspan="2">
										<div class="styLNDesc" style="width:30mm;padding-bottom:0mm;"/>
										<div class="styLNDesc" style="width:25mm;padding-bottom:0mm;">
											<span class="styBoldText">b</span>
											<span style="width:4px"/>Property
									<!--Dotted Line-->
												<span class="styDotLn" style="float:none;padding-left:1.5mm;">..</span>
										</div>
									</td>
									<td class="styLNAmountBox" style="border-right-width:1px;padding-bottom:0mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM2/CapitalContributedDurYrPropAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBoxSD" style="width:4mm;padding-bottom:0mm;">3</td>
									<td class="styLNDesc" style="width:57mm;padding-left:4mm;padding-bottom:0mm;" colspan="2">
										<span style="float:left;clear:none;">Net income (loss) per books</span>
								<!--Dotted Line-->
										<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>
									</td>
									<td class="styLNAmountBox" style="border-right-width:1px;padding-bottom:0mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM2/NetIncomeLossPerBooksAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBoxSD" style="width:4mm;padding-top:2mm;padding-bottom:0mm;">4</td>
									<td class="styLNDesc" style="width:57mm;vertical-align:bottom;padding-left:4mm;padding-bottom:0mm;" colspan="2">
										<div class="styLNDesc" style="width:40mm;padding-bottom:0mm;">
											<span style="float:left;clear:none;">Other increases (itemize):
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$Form1065BScheduleM2/TotalOtherIncreasesAmt"/>
												</xsl:call-template>
											</span>	
										</div>
										<div class="styIRS1065BBText" style="width:10mm;float:left;"/>
									</td>
									<td class="styLNAmountBoxNBB" style="border-right-width:1px;">
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBoxSD" style="width:4mm;padding-bottom:0mm;"/>
									<td class="styLNDesc" style="height:9mm;width:57mm;padding-right:2mm;padding-left:4mm;padding-bottom:0mm;" colspan="2">
										<div class="styIRS1065BBText" style="width:50mm;text-align:left;"/>
										<div class="styIRS1065BBText" style="width:50mm;text-align:left;"/>
									</td>
									<td class="styLNAmountBox" style="height:9mm;border-bottom-width:1px;border-right-width:1px;padding-bottom:0mm;padding-top:5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM2/TotalOtherIncreasesAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBoxSD" style="width:4mm;padding-bottom:0mm;">5</td>
									<td class="styLNDesc" style="width:57mm;padding-left:4mm;padding-bottom:0mm;" colspan="2">
										<span style="float:left;clear:none;">Add lines 1 through 4</span>
									<!--Dotted Line-->
											<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.....</span>
									</td>
									<td class="styLNAmountBoxNBB" style="border-right-width:1px;padding-bottom:0mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM2/BalBOYCapNetIncmOtherTotalAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
						<!-- END Left Side Table of Schedule M-2-->
						<!-- BEGIN Right Side Table of Schedule M-2-->
						<table class="styTable" style="width:93.5mm;float:left;font-size:7pt;" cellspacing="0">
							<thead/>
							<tfoot/>
							<tbody>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBoxSD" style="width:4mm;padding-bottom:0mm;">6</td>
									<td class="styLNDesc" style="width:57mm;padding-bottom:0mm;" colspan="2">
									<div class="styLNDesc" style="width:27mm;padding-left:4mm;padding-bottom:0mm;">Distributions:</div>
										<div class="styLNDesc" style="width:26mm;">
											<span class="styBoldText">a</span>
											<span style="width:4px"/>Cash
									<!--Dotted Line-->
												<span class="styDotLn" style="float:none;padding-left:2mm;">...</span>
										</div>	
								</td>			
									<td class="styLNAmountBox" style="padding-bottom:0mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM2/DistributionsCashAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBoxSD" style="width:4mm;padding-bottom:0mm;"/>
									<td class="styLNDesc" style="width:57mm;padding-bottom:0mm;" colspan="2">
										<div class="styLNDesc" style="width:27mm;padding-bottom:0mm;"/>
										<div class="styLNDesc" style="width:26mm;padding-bottom:0mm;">
											<span class="styBoldText">b</span>
											<span style="width:4px"/>Property
									<!--Dotted Line-->
												<span class="styDotLn" style="float:none;padding-left:2mm;">..</span>
										</div>
									</td>
									<td class="styLNAmountBox" style="padding-bottom:0mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM2/DistributionsPropertyAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBoxSD" style="height:8mm;width:4mm;padding-top:6mm;padding-bottom:0mm;">7</td>
									<td class="styLNDesc" style="height:8mm;width:57mm;vertical-align:bottom;padding-top:5mm;padding-bottom:0mm;" colspan="2">
										<div class="styLNDesc" style="width:42mm;padding-left:4mm;padding-bottom:0mm;">
											<span style="float:left;clear:none;">Other decreases (itemize):
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$Form1065BScheduleM2/TotalOtherDecreasesAmt"/>
												</xsl:call-template>
											</span>	
										</div>
										<div class="styIRS1065BBText" style="width:12mm;float:left;"/>
									</td>
									<td class="styLNAmountBoxNBB" style="height:8mm;padding-bottom:0mm;">
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBoxSD" style="width:4mm;"/>
									<td class="styLNDesc" style="width:57mm;padding-right:2mm;padding-left:4mm;" colspan="2">
										<div class="styIRS1065BBText" style="width:50mm;text-align:left;"/>
									</td>
									<td class="styLNAmountBox" style="border-bottom-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM2/TotalOtherDecreasesAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBoxSD" style="height:6.5mm;width:4mm;padding-top:2mm;padding-bottom:0mm;">8</td>
									<td class="styLNDesc" style="height:6.5mm;width:57mm;padding-top:2mm;padding-left:4mm;padding-bottom:0mm;" colspan="2">
										<span style="float:left;clear:none;">Add lines 6 and 7</span>
								<!--Dotted Line-->
										<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">......</span>
									</td>
									<td class="styLNAmountBox" style="height:6.5mm;padding-top:3mm;padding-bottom:0mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM2/TotDistriAndOthDecreasesAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBoxSD" style="height:6.5mm;width:4mm;vertical-align:top;padding-top:1mm;padding-bottom:0mm;">9</td>
									<td class="styLNDesc" style="width:57mm;height:6.5mm;padding-left:4mm;padding-bottom:0mm;" colspan="2">Balance at end of year. Subtract line 8<br/><span style="float:left;clear:none;">from line 5</span>
								<!--Dotted Line-->
										<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........</span>									
									</td>
									<td class="styLNAmountBox" style="height:6.5mm;border-bottom-width:0px;padding-top:3mm;padding-bottom:0mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM2/EndYearBalanceAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
						<!-- END Right Side Table of Schedule M-2-->
					</div>
					<!-- END Schedule M-2 Line Items -->
					<!--div class="styBB" style="width:187mm;">
  </div-->
					<!-- Page Break and Footer-->
					<div style="width:187mm;">
						<div style="width:100mm;float:left;">
							<span style="width:90mm;"/>
						</div>
						<div style="float:right;">
							<span style="width:80px;"/> Form 
                        <span class="styBoldText" style="font-size:8pt;">1065-B</span> (2013)
                    </div>
					</div>
                    <p style="page-break-before: always"/> 
					<!-- END Page Break and Footer-->
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">Additional Data        
                    </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form1065BData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<!-- Had to hardcode the table as a checkbox has to be represented.  There is no predefined template to represent the checkbox -->

						<xsl:if test="$Form1065BData/Section761aElectionInd">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1065BData/Section761aElectionInd"/>
											<xsl:with-param name="BackupName">Section761aElection</xsl:with-param>
										</xsl:call-template>
              Form 1065-B, Top Left Margin - Section 761(a) election:
                                </label>
								</td>
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1065BData/Section761aElectionInd"/>
											<xsl:with-param name="BackupName">Section761aElection</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</xsl:if>
						
						<xsl:if test="$Form1065BData/CommonTrustInd">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1065BData/CommonTrustInd"/>
											<xsl:with-param name="BackupName">CommonTrust</xsl:with-param>
										</xsl:call-template>
              Form 1065-B, Top Left Margin - Common Trust:
                                </label>
								</td>
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1065BData/CommonTrustInd"/>
											<xsl:with-param name="BackupName">CommonTrust</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</xsl:if>
						
						<xsl:if test="$Form1065BData/NomineeInd">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1065BData/NomineeInd"/>
											<xsl:with-param name="BackupName">Nominee</xsl:with-param>
										</xsl:call-template>
              Form 1065-B, Top Left Margin - Nominee:
                                </label>
								</td>
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1065BData/NomineeInd"/>
											<xsl:with-param name="BackupName">Nominee</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</xsl:if>
						
						<xsl:if test="$Form1065BData/IRC6114Ind">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1065BData/IRC6114Ind"/>
											<xsl:with-param name="BackupName">IRC6114</xsl:with-param>
										</xsl:call-template>
              Form 1065-B, Top Left Margin - IRC 6114:
                                </label>
								</td>
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1065BData/IRC6114Ind"/>
											<xsl:with-param name="BackupName">IRC6114</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</xsl:if>
						
						<xsl:if test="$Form1065BData/SupersededReturnInd">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1065BData/SupersededReturnInd"/>
											<xsl:with-param name="BackupName">IRS1065BSupersededReturn</xsl:with-param>
										</xsl:call-template>
											 G(5) Superseded Returns:
									</label>
								</td>
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1065BData/SupersededReturnInd"/>
											<xsl:with-param name="BackupName">IRS1065BSupersededReturn</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</xsl:if>
						
						<xsl:if test="$Form1065BData/TaxesAmt/@section453ACInterestTxt">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1065BData/TaxesAmt/@section453ACInterestTxt"/>
											<xsl:with-param name="BackupName">SECTION 453AC Interest</xsl:with-param>
										</xsl:call-template>
											Part I  Line 26 - Section 453AC Interest:
                                </label>
								</td>
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065BData/TaxesAmt/@section453ACInterestTxt"/>
										<xsl:with-param name="BackupName">SECTION 453AC Interest</xsl:with-param>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						
						<xsl:if test="$Form1065BData/TaxesAmt/@section453I3InterestTxt">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1065BData/TaxesAmt/@section453I3InterestTxt"/>
											<xsl:with-param name="BackupName">SECTION 453I3 Interest</xsl:with-param>
										</xsl:call-template>
											Part I  Line 26 - Section 453I3 Interest:
                                </label>
								</td>
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065BData/TaxesAmt/@section453I3InterestTxt"/>
										<xsl:with-param name="BackupName">SECTION 453I3 Interest</xsl:with-param>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						
						<xsl:if test="$Form1065BData/IRS1065BScheduleB/Form8865Cnt">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleB/Form8865Cnt"/>
											<xsl:with-param name="BackupName">Number of Form 8865 attached</xsl:with-param>
										</xsl:call-template>
										SchB Line 9 - Number of IRS8865 Forms attached:
                                </label>
								</td>
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleB/Form8865Cnt"/>
										<xsl:with-param name="BackupName">Number of Form 8865 attached</xsl:with-param>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
					</table>

          <!-- Begin Separated Repeating data table for Special Condition Description-->
            <xsl:if test="$Form1065BData/SpecialConditionDesc">
               <span class="styRepeatingDataTitle">Special Condition Description</span>
               <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
                  <thead class="styTableThead">
                     <tr class="styDepTblHdr">
                        <th class="styDepTblCell" scope="col" rowspan="1" style="width:91.5mm;">
                           Special Condition Description
                        </th>
                     </tr>
                  </thead>
                  <tbody>
                     <xsl:for-each select="$Form1065BData/SpecialConditionDesc">
                        <tr style="border-color:black;height:6mm;">
                           <xsl:attribute name="class">
                              <xsl:choose>
                                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                              </xsl:choose>
                           </xsl:attribute>
                           <td class="styTableCellText" style="width:91.5mm;">
                              <div style="width:6.5mm;" class="styLNDesc">
                                 <div style="width:6mm;font-weight:bold;float:right;clear:none;">
                                    <span class="styBoldText" style="float:right;text-align:right;padding-right:2mm;">
                                       <xsl:value-of select="position()"/>
                                    </span>
                                 </div>
                              </div>
                              <div style="width:80mm;float:none;clear:none;">
                                   <xsl:variable name="pos" select="position()"/>
								   <xsl:call-template name="PopulateText">
										 <xsl:with-param name="TargetNode" select="$Form1065BData/SpecialConditionDesc[$pos]"/>
										 <xsl:with-param name="BackupName">IRS1065BSpecialConditionDescription</xsl:with-param>
                                 </xsl:call-template>
                              </div>
                           </td>
                        </tr>
                     </xsl:for-each>
                  </tbody>
               </table>
            </xsl:if>
          <!--End Separated Repeating data table for Special Condition Description-->
<br/>

	<xsl:if test="((count($Form1065BData/IRS1065BScheduleD/STCapitalGainAndLossGrp) &gt; 4) or        (count($Form1065BData/IRS1065BScheduleD/LTCapGainAndLossSalesAssetGrp) &gt; 4))         and ($Print = $Separated)">
		   <p style="page-break-before: always"/> 
	</xsl:if>				
					<xsl:if test="(count($Form1065BData/IRS1065BScheduleD/STCapitalGainAndLossGrp) &gt; 4) and ($Print = $Separated)">
						<div class="styBB" style="width:187mm;">
							<div class="styPartDesc" style="width:182mm;text-align:left;">
             Part I—Short-Term Capital Gains and Losses—Assets Held 1 Year or Less
                        </div>
						</div>
						<table class="styDepTbl" cellspacing="0">
							<thead class="styTableThead" style="font-size:7pt">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:3mm;border-right-width:0px;border-left-width:0px;" scope="col"/>
									<th class="styDepTblCell" style="width:2mm;border-right-width:0px;border-left-width:0px;" scope="col"/>
									<th class="styDepTblCell" style="width:40mm;font-weight:normal;border-left-width:0px;" scope="col">
										<b>(a)</b> Description of property<br/>(e.g., 100 shares<br/> of "Z" Co.)</th>
									<th class="styDepTblCell" style="width:20mm;font-weight:normal;" scope="col">
										<b>(b)</b> Date acquired<br/>(mo., day, yr.)</th>
									<th class="styDepTblCell" style="width:20mm;font-weight:normal;" scope="col">
										<b>(c)</b> Date sold<br/>(mo., day, yr.)</th>
									<th class="styDepTblCell" style="width:32mm;font-weight:normal;" scope="col">
										<b>(d)</b> Sales price<br/>(see instructions)</th>
									<th class="styDepTblCell" style="width:37mm;font-weight:normal;" scope="col" colspan="2">
										<b>(e)</b> Cost or other basis<br>(see instructions)</br>
									</th>
									<th class="styDepTblCell" style="width:32mm;font-weight:normal;" scope="col">
										<b>(f) Gain or (loss)</b>
										<br/> Subtract (e) from (d)</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody style="font-size:7pt">
								<xsl:for-each select="$Form1065BData/IRS1065BScheduleD/STCapitalGainAndLossGrp">
									<tr style="border-color:black">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCell" style="width:3mm;text-align:left;border-right-width:0px;font-weight:bold;vertical-align:top;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/STCapitalGainAndLossGrp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:2mm;text-align:left;border-right-width:0px;font-weight:bold;vertical-align:top;">
											<xsl:if test="position() = 1">1<br/>
											</xsl:if>
										</td>
										<td class="styTableCell" style="text-align:left;width:40mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PropertyDesc"/>
											</xsl:call-template>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="PropertyDesc"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellText" style="width:20mm;text-align:center;">
											<span style="width:1px;"/>
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="AcquiredDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="width:20mm;text-align:center;">
											<span style="width:1px;"/>
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="SoldDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:32mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SalesPriceAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:5mm;border-right-width:0px;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="TotalCostOrOtherBasisAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:32mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalCostOrOtherBasisAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalGainOrLossAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<br/>
					<xsl:if test="(count($Form1065BData/IRS1065BScheduleD/LTCapGainAndLossSalesAssetGrp) &gt; 4) and ($Print = $Separated)">
						<!--<div class="styBB" style="width:187mm;">-->
						<div style="width:187mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
							<div class="styPartDesc" style="width:182mm;text-align:left;">
              Part II—Long-Term Capital Gains and Losses—Assets Held More Than 1 Year
                        </div>
						</div>
						<table class="styDepTbl" cellspacing="0">
							<thead class="styTableThead" style="font-size:7pt">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:5mm;border-right-width:0px;padding-left:4mm" scope="col">
										<span class="styTableCellPad"/>
									</th>
									<th class="styDepTblCell" style="width:40mm;font-weight:normal;border-left-width:0px;" scope="col">
										<b>(a)</b> Description of property<br/>(e.g., 100 shares<br/> of "Z" Co.)</th>
									<th class="styDepTblCell" style="width:20mm;font-weight:normal;" scope="col">
										<b>(b)</b> Date acquired<br/>(mo., day, yr.)</th>
									<th class="styDepTblCell" style="width:20mm;font-weight:normal;" scope="col">
										<b>(c)</b> Date sold<br/>(mo., day, yr.)</th>
									<th class="styDepTblCell" style="width:32mm;font-weight:normal;" scope="col">
										<b>(d)</b> Sales price<br/>(see instructions)</th>
									<th class="styDepTblCell" style="width:37mm;font-weight:normal;" scope="col" colspan="2">
										<b>(e)</b> Cost or other basis<br>(see instructions)</br>
									</th>
									<th class="styDepTblCell" style="width:32mm;font-weight:normal;" scope="col">
										<b>(f) Gain or (loss)</b>
										<br/> Subtract (e) from (d)</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody style="font-size:7pt">
								<xsl:for-each select="$Form1065BData/IRS1065BScheduleD/LTCapGainAndLossSalesAssetGrp">
									<tr style="border-color:black">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCell" style="width:5mm;text-align:left;border-right-width:0px;font-weight:bold;vertical-align:top;padding-left:4mm" scope="col">
											<xsl:if test="position() = 1">6<br/>
											</xsl:if>
											<xsl:if test="position() != 1">
												<span style="width:1mm"/>
											</xsl:if>
										</td>
										<td class="styTableCell" style="text-align:left;width:40mm;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="PropertyDesc"/>
											</xsl:call-template>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PropertyDesc"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellText" style="width:20mm;text-align:center;">
											<span style="width:1px;"/>
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="AcquiredDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="width:20mm;text-align:center;">
											<span style="width:1px;"/>
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="SoldDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:32mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SalesPriceAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:5mm;border-right-width:0px;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="TotalCostOrOtherBasisAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:32mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalCostOrOtherBasisAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalGainOrLossAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
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