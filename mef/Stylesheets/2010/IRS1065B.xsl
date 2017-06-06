<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by James Ganzy on 8/11/2010 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1065BStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form1065BData" select="$RtnDoc/IRS1065B"/>
	<xsl:param name="Form1065BScheduleA" select="$Form1065BData/IRS1065BScheduleA"/>
	<xsl:param name="Form1065BScheduleB" select="$Form1065BData/IRS1065BScheduleB"/>
	<xsl:param name="Form1065BScheduleD" select="$Form1065BData/IRS1065BScheduleD"/>
	<xsl:param name="Form1065BScheduleK" select="$Form1065BData/IRS1065BScheduleK"/>
	<xsl:param name="Form1065BScheduleL" select="$Form1065BData/IRS1065BScheduleL"/>
	<xsl:param name="Form1065BScheduleM1" select="$Form1065BData/IRS1065BScheduleM1"/>
	<xsl:param name="Form1065BScheduleM2" select="$Form1065BData/IRS1065BScheduleM2"/>
	<xsl:template match="/">
		<html lang="EN-US">
			<head>
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
						<div class="styFNBox" style="width:35mm;height:19mm;">Form 
                        <span class="styFormNumber">1065-B</span>
							<br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BData"/>
							</xsl:call-template>
							<span style="width:3px;"/>
							<xsl:if test="$Form1065BData/SpecialConditionDescription">
                               <xsl:call-template name="LinkToLeftoverDataTableInline">
                                 <xsl:with-param name="Desc">Special Condition Description</xsl:with-param>
                                 <xsl:with-param name="TargetNode" select="$Form1065BData/SpecialConditionDescription"/>
                              </xsl:call-template>
							</xsl:if>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1065B, Top Left Margin - Section 761(a) election</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1065BData/Section761aElection"/>
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
								<xsl:with-param name="TargetNode" select="$Form1065BData/CommonTrust"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1065-B, Top Left Margin - Nominee</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1065BData/Nominee"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1065-B, Top Left Margin - IRC 6114</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRC6114"/>
							</xsl:call-template>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:121mm;height:19mm;">
							<div class="styMainTitle" style="width:90mm;height:10mm;">U .S. Return of Income for <br/>Electing Large Partnerships</div>
							<div class="styFST" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;">
        For calendar year 
                            <span style="width: 14mm;">
									<xsl:call-template name="PopulateReturnHeaderTaxYear"/>
								</span>
        or tax year beginning
                            <span style="width: 18mm;border-bottom:1 solid black;">
									<!-- No need to send the parameters -->
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
								</span>,
        ending 
                            <span style="width: 18mm;border-bottom:1 solid black;">
									<!-- No need to send the parameters -->
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
								</span>
								<br/>
								<span style="text-align:center;">
									<img src="{$ImagePath}/1065B_Bullet_Md.gif" alt="MediumBullet"/> 
         See separate instructions.
                            </span>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:19mm;">
							<div class="styOMB" style="height:2mm;">OMB No. 1545-1626</div>
							<div class="styTY" style="height:11mm;">20<span class="styTYColor">10</span>
							</div>
						</div>
					</div>
					<div style="width:187mm;float:left;clear:left;">
						<div style="width:37mm;height:25.5mm;float:left;clear:left;">
							<div class="styEINDateAssets" style="width:37mm;height:11mm;">
								<span class="styBoldText">A</span> Principal business activity
                            <br/>
								<span class="styEINFld">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065BData/PrincipalBusinessActivity"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styEINDateAssets" style="width:37mm;height:11mm;">
								<span class="styBoldText">B</span> Principal product or service
                            <br/>
								<span class="styEINFld">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065BData/PrincipalProductOrService"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styEINDateAssets" style="width:37mm;height:8.5mm;border-bottom-width:1px;">
								<span class="styBoldText">C </span>Business code no. (see instructions)<br/>
								<span class="styEINFld">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065BData/BusinessCodeNumber"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- return header address box -->
						<div class="styLblNameAddr" style="width:106mm;height:29mm;">
							<div class="styUseLbl" style="width:12mm;height:29mm;border-right-width:0px;">Use IRS label. Other-wise, print or type.</div>
							<div class="styNameAddr" style="width:92mm;height:8mm;border-left-width:1px;padding-left:1px;">
        Name of partnership<br/>
								<span class="stySmallText" style="padding-left:2mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">InCareOfName</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div class="styNameAddr" style="width:92mm;height:10mm;border-left-width:1px;">
        Number, street, and room or suite no. If a P.O. box, see instructions.<br/>
								<span class="stySmallText" style="padding-left:2mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div class="styNameAddr" style="border-bottom-width:0px;width:92mm;height:9mm;border-left-width:1px;">
        City or town, state, and ZIP code<br/>
								<span class="stySmallText" style="width:90mm;padding-left:2mm;">
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
						<div class="styEINDateAssets" style="width:44mm;height:11mm;">
							<span class="styBoldText">D Employer identification number</span>
							<br/>
							<br/>
							<br/>
							<span class="styEINFld">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="EINChanged">true</xsl:with-param>
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<!--	<div class="styEINDateAssets" style="width:44mm;height:11mm;">
							<span class="styBoldText">D Employer identification number</span>
							<br/>
							<br/>
							<br/>
							<span class="styEINFld">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$Form1065BData/PartnershipIDNumber"/>
								</xsl:call-template>
							</span>
						</div>-->
						<div class="styEINDateAssets" style="width:44mm;height:11mm;">
							<span class="styBoldText">E </span>
      Date business started
                        <br/>
							<br/>
							<br/>
							<span class="styEINFld">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form1065BData/DateBusinessStarted"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styEINDateAssets" style="width:44mm;height:8.5mm;border-bottom-width:1px;">
							<span class="styBoldText">F </span>Total assets (see instructions)<br/>
							<br/>$
                        <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/TotalAssets"/>
							</xsl:call-template>
						</div>
						<br/>
					</div>
					<div class="styNBB" style="width:187mm;">
						<div class="styBoldText" style="width:6mm;float:left;clear:none;padding-left:3mm;">G</div>
						<div class="styGenericDiv" style="width:178mm;">
      Check applicable boxes: <span style="width:4mm;"/>
							<span class="styBoldText">(1)</span>
							<span style="width:3px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065BData/FinalReturn"/>
									<xsl:with-param name="BackupName">IRS1065BFinalReturn</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065BData/FinalReturn"/>
									<xsl:with-param name="BackupName">IRS1065BFinalReturn</xsl:with-param>
								</xsl:call-template>
         Final return
                        </label>
							<span style="width:4px"/>
							<span class="styBoldText">(2)</span>
							<span style="width:3px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065BData/NameChange"/>
									<xsl:with-param name="BackupName">IRS1065BNameChange</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065BData/NameChange"/>
									<xsl:with-param name="BackupName">IRS1065BNameChange</xsl:with-param>
								</xsl:call-template>
        Name Change
                        </label>
							<span style="width:4px"/>
							<span class="styBoldText">(3)</span>
							<span style="width:3px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065BData/AddressChange"/>
									<xsl:with-param name="BackupName">IRS1065BAddressChange</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065BData/AddressChange"/>
									<xsl:with-param name="BackupName">IRS1065BAddressChange</xsl:with-param>
								</xsl:call-template>
        Address Change
                        </label>
							<span style="width:3px"/>
							<span class="styBoldText">(4)</span>
							<span style="width:1px;"/>		
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065BData/AmendedReturn"/>
									<xsl:with-param name="BackupName">IRS1065BAmendedReturn</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065BData/AmendedReturn"/>
									<xsl:with-param name="BackupName">IRS1065BAmendedReturn</xsl:with-param>
								</xsl:call-template>
									 Amended Return
							</label>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BData/AmendedReturn"/>
							</xsl:call-template>
							
						<xsl:if test="$Form1065BData/SupersededReturn" >
                               <xsl:call-template name="LinkToLeftoverDataTableInline">
                                 <xsl:with-param name="Desc">G(5) Superseded Returns</xsl:with-param>
                                 <xsl:with-param name="TargetNode" select="$Form1065BData/SupersededReturn"/>
                              </xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<div  style="width:187mm;">
						<div class="styBoldText" style="width:6mm;float:left;clear:none;padding-left:3mm;">H</div>
						<div class="styGenericDiv" style="width:125mm;">
      Check accounting method: 
                        <span style="width:1mm;"/>
							<span class="styBoldText">(1)</span>
							<span style="width:3px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065BData/MethodOfAccountingCash"/>
									<xsl:with-param name="BackupName">IRS1065BMethodOfAccountingCash</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065BData/MethodOfAccountingCash"/>
									<xsl:with-param name="BackupName">IRS1065BMethodOfAccountingCash</xsl:with-param>
								</xsl:call-template>
         Cash
                        </label>
							<span style="width:9.3mm;"/>
							<span class="styBoldText">(2)</span>
							<span style="width:3px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065BData/MethodOfAccountingAccrual"/>
									<xsl:with-param name="BackupName">IRS1065BMethodOfAccountingAccrual</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065BData/MethodOfAccountingAccrual"/>
									<xsl:with-param name="BackupName">IRS1065BMethodOfAccountingAccrual</xsl:with-param>
								</xsl:call-template>
         Accrual
                        </label>
						
							<span style="width:9.3mm;"/>
							<span class="styBoldText">(3)</span>
							<span style="width:3px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065BData/MethodOfAccountingOther"/>
									<xsl:with-param name="BackupName">IRS1065BMethodOfAccountingOther</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065BData/MethodOfAccountingOther"/>
									<xsl:with-param name="BackupName">IRS1065BMethodOfAccountingOther</xsl:with-param>
								</xsl:call-template>
         Other (specify)
                        </label>
							<img src="{$ImagePath}/1065B_Bullet_Sm.gif" alt="MidSizeBullet"/>
						</div>
						<div class="styFixedUnderline" style="width:55mm;padding-top:0mm;padding-bottom:0mm;border-style: dotted;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1065BData/MethodOfAccountingOther/@note"/>
							</xsl:call-template>
						</div>
</div>
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styBoldText" style="width:6mm;float:left;clear:none;padding-left:3mm;">I</div>
						<div class="styGenericDiv" style="width:125mm;font-size:6pt;">
      Number of Schedules K-1. Attach one for each person who was a partner at any time during the tax year 
                        <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BData/NumberOfSchedulesK1"/>
							</xsl:call-template>
							<span style="width:3.8mm;"/>
							<img src="{$ImagePath}/1065B_Bullet_Sm.gif" alt="MidSizeBullet"/>
						</div>
						<div class="styUnderlineAmount" style="width:55mm;border-style: dotted;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/NumberOfSchedulesK1"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;padding-bottom:2mm;">
						<div class="styBoldText" style="width:6mm;float:left;clear:none;padding-left:3mm;">J</div>
						<div class="styGenericDiv" style="width:136mm;font-size:7pt;">
      Check if Schedule M-3 (Form 1065) is attached
                        <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BData/ScheduleM3Required"/>
							</xsl:call-template>
							<span style="width:1mm;"/>
							<span class="styDotLn" style="float:none;clear:none;padding-left:0mm;">..............</span>
							<span style="width:1mm;"/>
								<img src="{$ImagePath}/1065B_Bullet_Sm.gif" alt="MidSizeBullet"/>
							<span style="width:8mm;"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065BData/ScheduleM3Required"/>
										<xsl:with-param name="BackupName">IRS1065BScheduleM3Required</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1065BData/ScheduleM3Required"/>
										<xsl:with-param name="BackupName">IRS1065BScheduleM3Required</xsl:with-param>
									</xsl:call-template>
								</label>
						</div>
					</div>
					<!--BEGIN Main Form Income Section-->
					<!--Part I-->
					<div class="styBB" style="width:187mm;border-top:1px black solid;">
						<div class="styBB" style="width:187mm;">
							<div class="styPartName" style="width:13mm;">Part I</div>
							<div class="styPartDesc" style="width:164mm;">Taxable Income or Loss From Passive Loss Limitation Activities</div>
						</div>
						<div class="styIRS1065BVTImageBox" style="height:52.5mm;padding-top:20mm;">
							<img src="{$ImagePath}/1065B_Income.gif" alt="VerticalIncome"/>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">
								<span class="styBoldText" style="font-size:7pt;padding-left: 1.25mm">1a</span>
							</div>
							<!--line 1-->
							<div class="styLNDesc" style="width:25mm;height:4mm;">
								<span class="font-size:6pt; font-family:Arial;">Gross receipts or sales</span>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065BData/GrossReceiptsOrSales"/>
								</xsl:call-template>
							</div>
							<!--Box 1a-->
							<div class="styLNAmountBox" style="border-right-width: 1px;height:7mm;padding-top:3mm">
								<span style="text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/GrossReceiptsOrSales"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- 1b-->
							<div class="styLNDesc" style="width:30mm;height:4mm;padding-left:2mm;">
								<span class="styBoldText" style="width:3mm;float:left;clear:none;">b</span>
								<span class="font-size:6pt; font-family:Arial" style="float:left;clear:none;">Less returns and allowances					</span>
							</div>
							<!--Box 1b-->
							<div class="styLNAmountBox" style="border-right-width: 1px;height:7mm;padding-top:3mm">
								<span style="text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/ReturnsAndAllowances"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNDesc" style="width:13.3mm;height:4mm;padding-left:3mm;padding-top:3.5mm;">
								<span class="styBoldText">c</span> Bal <img src="{$ImagePath}/1065B_Bullet_Sm.gif" alt="MidSizeBullet"/>
							</div>
							<!-- Box 1c-->
							<div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm">1c</div>
							<div class="styLNAmountBox" style="height:7.5mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/GrossReceiptsOrSalesBalance"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">2</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span  style="float:left;clear:none;">Cost of goods sold (Schedule A, line 8)</span>
        <!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">....................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">2</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/CostOfGoodsSold"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">3</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span  style="float:left;clear:none;">Gross profit. Subtract line 2 from line 1c</span>
        <!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">3</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/GrossProfit"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">4</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span  style="float:left;clear:none;">Net rental real estate income (loss) <span class="styItalicText"> (attach Form 8825)</span></span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">4</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/NetIncomeLoss"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">5</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span  style="float:left;clear:none;">Net income (loss) from other rental activities <span class="styItalicText">(attach schedule)</span>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/OtherRentalActivity"/>
									</xsl:call-template>
								</span>	
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">5</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/OtherRentalActivity"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">6</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span  style="float:left;clear:none;">Ordinary income (loss) from other partnerships, estates, and trusts <span class="styItalicText">(attach schedule)</span>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/OrdinaryIncomeLoss"/>
									</xsl:call-template>
								</span>	
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">....</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">6</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/OrdinaryIncomeLoss"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">7</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span  style="float:left;clear:none;">Net farm profit (loss) <span class="styItalicText">(attach Schedule F (Form 1040))</span>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/NetFarmProfitLoss"/>
									</xsl:call-template>
								</span>	
							<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">7</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/NetFarmProfitLoss"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">8</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span  style="float:left;clear:none;">Excess of net short-term capital gain over net long-term capital loss (Schedule D, line 16)</span>
							<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">8</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/ExcessShortGainOverLongLoss"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left: 2.25mm;height:4.5mm;">9</div>
							<div class="styLNDesc" style="width:132mm;height:4.5mm;">
								<span  style="float:left;clear:none;">Net gain (loss) from Form 4797, Part II, line 17<span class="styItalicText">(attach Form 4797)</span>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/NetGainLoss"/>
									</xsl:call-template>
								</span>	
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">9</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/NetGainLoss"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4.5mm;">10</div>
							<div class="styLNDesc" style="width:132mm;height:4.5mm;">
								<span  style="float:left;clear:none;">Other income (loss) (see instructions)<!--(attach schedule)-->
									<span class="styItalicText"> (attach schedule)</span>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/OtherIncomeOrLoss"/>
									</xsl:call-template>
								</span>	
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">10</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/OtherIncomeOrLoss"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:3mm;padding-bottom:0mm">11</div>
							<div class="styLNDesc" style="width:132mm;height:3mm;padding-bottom:0mm">
								<span  style="float:left;clear:none;"><b>Total income (loss).</b> Combine lines 3 through 10</span>
							<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.................</span>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:2.3mm;">11</div>
							<div class="styLNAmountBoxNBB" style="height:2.3mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/TotalIncomeLoss"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--END Main Form Income Section-->
					<!--BEGIN Main Form Deduction Section-->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS1065BVTImageBox" style="height:67mm;padding-top:25mm;">
							<img src="{$ImagePath}/1065B_Deductions.gif" alt="VertDeductions"/>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4.5mm;">12</div>
							<div class="styLNDesc" style="width:132mm;height:4.5mm;">
								<span  style="float:left;clear:none;">Salaries and wages (other than to partners) (less employment credits)
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/SalariesAndWages"/>
									</xsl:call-template>
								</span>	
							<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">12</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/SalariesAndWages"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">13</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span  style="float:left;clear:none;">Guaranteed payments to partners</span>
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">......................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">13</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/GuaranteedPaymentsToPartners"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">14</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span  style="float:left;clear:none;">Repairs and maintenance</span>
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">14</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/RepairsAndMaintenance"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">15</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span  style="float:left;clear:none;">Bad debts</span>
					  <!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.............................</span>  
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">15</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/BadDebts"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">16</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span  style="float:left;clear:none;">Rent
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/Rent"/>
									</xsl:call-template>
								</span>	
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..............................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">16</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/Rent"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">17</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span  style="float:left;clear:none;">Taxes and licenses
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/TaxesAndLicenses"/>
									</xsl:call-template>
								</span>	
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">17</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/TaxesAndLicenses"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">18</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span  style="float:left;clear:none;">Interest
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/InterestDeductions"/>
									</xsl:call-template>
								</span>
					   <!--Dotted Line-->
							    <span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.............................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">18</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/InterestDeductions"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="">19a</div>
							<div class="styLNDesc" style="width:92mm;font-size:6.3pt;">Depreciation and section 179 expense deduction (see instructions)
                            <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065BData/Depreciation"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="">19a</div>
							<div class="styLNAmountBox" style="">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/Depreciation"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:8.3mm;background-color:lightgrey;border-bottom-width:0px;border-right-width:1px;"/>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftLtrBox" style="">
								<span style="width:4px;"/>b</div>
							<div class="styLNDesc" style="width:92mm;">Less: depreciation reported on Schedule A and elsewhere 
                        on return
                        </div>
							<div class="styLNRightNumBox" style="">19b</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/LessDepreciation"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="">19c</div>
							<div class="styLNAmountBox" style="">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/TotalDepreciation"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">20</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span  style="float:left;clear:none;">Depletion
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/Depletion"/>
									</xsl:call-template>
								</span>	
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">............................</span>	
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">20</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/Depletion"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">21</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span  style="float:left;clear:none;">Retirement plans, etc.</span>
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">21</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/RetirementPlansEtc"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">22</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span  style="float:left;clear:none;">Employee benefit programs</span>
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">22</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/EmployeeBenefitPrograms"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4.5mm;">23</div>
							<div class="styLNDesc" style="width:132mm;height:4.5mm;">
								<span  style="float:left;clear:none;">Other deductions <span class="styItalicText"> (attach schedule)</span>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/OtherDeductions"/>
									</xsl:call-template>
								</span>	
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.....................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">23</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/OtherDeductions"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4.5mm;">24</div>
							<div class="styLNDesc" style="width:132mm;height:4.5mm;">
								<span  style="float:left;clear:none;"><b>Total deductions.</b> Add the amounts shown in the far right column for lines 12 through 23</span>
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">....</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">24</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/TotalDeductions"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="">
                            25</div>
							<div class="styLNDesc" style="width:132mm;">
                                <span  style="float:left;clear:none;"><b>Taxable income (loss) from passive loss limitation activities.</b> Subtract line 24 from line 11</span>
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>
							</div>
							<div class="styLNRightNumBox" style="border-bottom-width:0px;">25</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/TaxableIncomeLoss"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--END Main Form Deductions Section-->
					<!--BEGIN Main Form Tax and Payment Section-->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS1065BVTImageBox" style="height:18mm;padding-top:4mm;">
							<img src="{$ImagePath}/1065B_TaxAndPayment.gif" alt="VertTaxAndPayment"/>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4.5mm;">26</div>
							<div class="styLNDesc" style="width:132mm;height:4.5mm;">
								<span  style="float:left;clear:none;">Tax (see instructions). Check if from: 
                            <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065BData/Taxes"/>
								</xsl:call-template>
								<span class="styBoldText" style="width:5mm;padding-left:2mm;">a</span>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065BData/TaxForm4255"/>
										<xsl:with-param name="BackupName">IRS1065BTaxForm4255</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1065BData/TaxForm4255"/>
										<xsl:with-param name="BackupName">IRS1065BTaxForm4255</xsl:with-param>
									</xsl:call-template>
        Form 4255
                                <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/TaxForm4255"/>
									</xsl:call-template>
								</label>
								<span class="styBoldText" style="width:5mm;padding-left:2mm;">b</span>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065BData/TaxForm8611"/>
										<xsl:with-param name="BackupName">IRS1065BTaxForm8611</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1065BData/TaxForm8611"/>
										<xsl:with-param name="BackupName">IRS1065BTaxForm8611</xsl:with-param>
									</xsl:call-template>
        Form 8611
                                <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/TaxForm8611"/>
									</xsl:call-template>
								</label>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I  Line 26 - Section 453I3 Interest</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1065BData/Taxes/@section453I3Interest"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I  Line 26 - Section 453AC Intrest</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1065BData/Taxes/@section453ACIntrest"/>
								</xsl:call-template>
							</span>	
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">....</span>
								<!--<span class="styBoldText">
									<span style="width:16px"/>.
									<span style="width:16px"/>.
								</span>-->
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">26</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/Taxes"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4.5mm;">27</div>
							<div class="styLNDesc" style="width:132mm;height:4.5mm;">
								<span  style="float:left;clear:none;">Other payments. Check if from:
                            <span class="styBoldText" style="width:5mm;padding-left:13.5mm;padding-right:1.3mm;">a</span>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065BData/OtherPaymentsForm2439"/>
										<xsl:with-param name="BackupName">IRS1065BOtherPaymentsForm2439</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1065BData/OtherPaymentsForm2439"/>
										<xsl:with-param name="BackupName">IRS1065BOtherPaymentsForm2439</xsl:with-param>
									</xsl:call-template>
       Form 2439
       
                            </label>
								<span class="styBoldText" style="width:5mm;padding-left:5.5mm;padding-right:1mm;">b</span>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065BData/OtherPaymentsForm4136"/>
										<xsl:with-param name="BackupName">IRS1065BOtherPaymentsForm4136</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1065BData/OtherPaymentsForm4136"/>
										<xsl:with-param name="BackupName">IRS1065BOtherPaymentsForm4136</xsl:with-param>
									</xsl:call-template>
        Form 4136
                                <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/OtherPaymentsForm4136"/>
									</xsl:call-template>
								</label>
							</span>	
						<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">......</span>		
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">27</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/OtherPayments"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4.5mm;">28</div>
							<div class="styLNDesc" style="width:132mm;height:4.5mm;">
								<span  style="float:left;clear:none;">Amount owed. Enter the excess of line 26 over line 27</span>
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">28</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/AmountOwed"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4.5mm;">29</div>
							<div class="styLNDesc" style="width:132mm;height:4.5mm;">
								<span  style="float:left;clear:none;">Overpayment. Enter the excess of line 27 over line 26
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/Overpayment"/>
									</xsl:call-template>
								</span>	
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0;">29</div>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/Overpayment"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--END Main Form Tax and Payment Section-->
					<br class="pageEnd"/>
					<!-- BEGIN Signature Section -->
					<!-- Implementing the signature section as a table -->
					<table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:6pt;">
						<tr>
							<td rowspan="3" style="width:10mm;font-size: 11pt;font-weight:bold;border-right:1 solid black;border-bottom:1 solid black;">Sign Here</td>
							<td colspan="5" style="padding-left:1mm;padding-bottom:1mm;">
      Under penalties of perjury, I declare that I have examined this return, including 
      accompanying schedules and statements, and to the best of my knowledge
      and belief, it is true, correct, and complete. Declaration of preparer (other than 
      general partner or limited liability company member manager) is based on all information 
      of which preparer has any knowledge.
                        </td>
						</tr>
						<tr>
							<td rowspan="2" style="border-bottom:1 solid black;padding-left:1mm;">
								<img src="{$ImagePath}/1065B_Bullet_Lg.gif" alt="LargeBullet"/>
							</td>
							<td class="styBB" style="width:112mm;vertical-align:bottom;">
								<xsl:call-template name="PopulateReturnHeaderPartner">
									<xsl:with-param name="TargetNode">Name</xsl:with-param>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<td rowspan="2" style="border-bottom:1 solid black;padding-left:1mm;">
								<img src="{$ImagePath}/1065B_Bullet_Lg.gif" alt="LargeBullet"/>
							</td>
							<td style="width:20mm;border-bottom:1 solid black;vertical-align:bottom;">
								<xsl:call-template name="PopulateReturnHeaderPartner">
									<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
								</xsl:call-template>
							</td>
							<td rowspan="2" style="width:40mm;border-bottom:1 solid black;padding-bottom:1mm;">
								<div class="styGenericDiv" style="width:2px;"/>
								<div style="border-right:3 solid black;border-left:3 solid black;border-bottom:3 solid black;border-top:3 solid black;float:right;" class="styGenericDiv">    
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
							</td>
						</tr>
						<tr>
							<td style="border-bottom:1 solid black;vertical-align:top;">Signature of general partner or limited liability company member manager</td>
							<td style="border-bottom:1 solid black;vertical-align:top;">Date</td>
						</tr>
					</table>
					<!-- END Signature Section -->
					<!-- BEGIN PREPARER SIGNATURE SECTION -->
				<div class="styBB" style="width:187mm;font-size:6pt;">
						   <div style="width:19mm;padding-top:4mm;float:left;clear:none;">
									<span class="styMainTitle" style="font-size:11pt;">
									Paid
									Preparer
									Use Only
									</span>                
						   </div>
				   <div style="width:168mm;float:left;clear:none;">
 						<div  style="width:168mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 1px;">
							<div class="styLNDesc" style="height:6mm;width:50mm;padding-top:0mm;border-right:1 solid black;">
								Print/Type preparer's name<br/>
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">Name</xsl:with-param>
									</xsl:call-template>
							</div>
							<div class="styLNDesc" style="height:6mm;width:65mm;padding-top:0mm;border-right:1 solid black;">
								Preparer's signature
							</div>
							<div class="styLNDesc" style="height:6mm;width:15mm;border-right:1 solid black;padding-top:0mm;">Date <br/>
								<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="height:6mm;width:18mm;border-right:1 solid black;padding-top:.5mm;padding-bottom:0mm;">
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
							<div class="styLNDesc" style="height:6mm;width:19mm;padding-top:0mm;">PTIN
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
 						<div  style="width:168mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 1px;">	
							<div class="styLNDesc" style="height:6mm;width:130.3mm;border-right:1 solid black;">
								<span class="styGenericDiv" style="">Firm's name 
									<span style="width:2.2mm;"/>
									<img src="{$ImagePath}/1065B_Bullet_Md.gif" alt="MediumBullet"/>
								</span>									
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="height:6mm;width:33mm;">Firm's EIN
								<img src="{$ImagePath}/1065B_Bullet_Md.gif" alt="MediumBullet"/>
								<span style="width:4px;"/>
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>

						<div  style="width:168mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 0px 1px;">	
							<div class="styLNDesc" style="width:130.3mm;border-right:1 solid black;">
								<div class="styGenericDiv" style="padding-right:.5mm;">Firm's address 
									<img src="{$ImagePath}/1065B_Bullet_Md.gif" alt="MediumBullet"/>
								</div>
								<div class="styGenericDiv" style="padding-right:.5mm;">
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
								</xsl:call-template>,
								
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">Country</xsl:with-param>
								</xsl:call-template>
								</div>
							</div>
							<div class="styLNDesc" style="width:33mm;"> Phone no. 
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
					<div class="pageEnd" style="width:187mm;">
						<div style="float:left;">
							<span class="styBoldText">For Privacy Act and Paperwork Reduction Act Notice, see separate instructions.</span>
							<span style="width:13mm;"/>                        
      Cat. No. 26265H
                    </div>
						<div style="float:right;">
							<span style="width:40px;"/>  
      Form <span class="styBoldText" style="font-size:8pt;">1065-B</span> (2010)
                    </div>
					</div>
					<!-- END Page Break and Footer-->
					<!--Begin Page 2 -->
					<!-- Page Header -->
					<div class="styBB" style="width:187mm;">
						<div style="float:left;">Form 1065-B (2010)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!--Part II-->
					<div class="styBB" style="width:187mm;">
						<div class="styBB" style="width:187mm;">
							<div class="styPartName" style="width:23mm;">Part II</div>
							<div class="styPartDesc" style="width:164mm;">Taxable Income or Loss From Other Activities</div>
						</div>
						<div style="width:187mm">
							<div class="styLNLeftNumBox" style="height:4mm;">1</div>
							<div class="styLNDesc" style="width:138mm;height:4mm;">
								<span  style="float:left;clear:none;">Interest</span>
					<!--Dotted Line-->
						<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...............................</span>		
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">1</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/Interest"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;">2a</div>
							<div class="styLNDesc" style="width:98.25mm;height:4.5mm;">
								<span  style="float:left;clear:none;">Total ordinary dividends</span>
  					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">2a</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/TotalOrdinaryDividends"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="background-color:lightgrey;height:4.5mm;border-bottom-width:0px"/>
							<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftLtrBox" style="height:4mm;">b</div>
							<div class="styLNDesc" style="width:98.25mm;height:4mm;">
								<span  style="float:left;clear:none;">Qualified dividends</span>
  					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">2b</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/QualifiedDividends"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="background-color:lightgrey;height:4.5mm;border-bottom-width:0px"/>
							<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftLtrBox" style="height:4.5mm;">c</div>
							<div class="styLNDesc" style="width:138mm;height:4.5mm;">
								<span  style="float:left;clear:none;">Nonqualified dividends (subtract line 2b from 2a)</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">2c</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/NonqualifiedDividends"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">3</div>
							<div class="styLNDesc" style="width:138mm;height:4mm;">
								<span  style="float:left;clear:none;">Gross royalties</span>
					<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.............................</span>	
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">3</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/GrossRoyalties"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">4</div>
							<div class="styLNDesc" style="width:138mm;height:4mm;">
								<span  style="float:left;clear:none;">Excess of net short-term capital gain over net long-term capital loss (Schedule D, line 19)</span>
      				<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">....</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">4</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/NetShortGainOverNetLongLoss"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">5</div>
							<div class="styLNDesc" style="width:138mm;height:4mm;">
								<span  style="float:left;clear:none;">Other income (loss) (see instructions)<span class="styItalicText"> (attach schedule)</span>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/OtherIncomeLoss"/>
									</xsl:call-template>
								</span>	
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">5</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/OtherIncomeLoss"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">6</div>
							<div class="styLNDesc" style="width:138mm;height:4mm;">
								<span  style="float:left;clear:none;"><b>Total income (loss).</b> Add lines 1, 2c, 3, 4, and 5</span>
 						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">6</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/TotalIncomeLoss2"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">7</div>
							<div class="styLNDesc" style="width:138mm;height:4mm;">
								<span  style="float:left;clear:none;">Interest expense on investment debts<span class="styItalicText">(attach Form 4952)</span></span>
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">7</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/InterestExpenseOnInvstDebts"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">8</div>
							<div class="styLNDesc" style="width:138mm;height:4mm;">
								<span  style="float:left;clear:none;">State and local income taxes (see instructions)</span>
						  <!--Dotted Line-->
								 <span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">8</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/StateAndLocalIncomeTax"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">9</div>
							<div class="styLNDesc" style="width:138mm;height:4mm;">
								<span  style="float:left;clear:none;">Charitable contributions (see instructions for limitations and required attachment)
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/CharitableContributions"/>
									</xsl:call-template>
								</span>	
					    <!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">......</span> 
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">9</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/CharitableContributions"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;">10a</div>
							<div class="styLNDesc" style="width:98.25mm;height:4.5mm;">
								<span  style="float:left;clear:none;">Total miscellaneous itemized deductions</span>
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...........</span> 
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">10a</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/TotalMiscItemizedDeductions"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="width:8.3mm;background-color:lightgrey;height:4.5mm;border-right-width:1px;border-bottom-width:0px;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftLtrBox" style="height:4.5mm;">
								<span style="width:1mm"/>b
                        </div>
							<div class="styLNDesc" style="width:138mm;height:4.5mm;">
								<span  style="float:left;clear:none;">Deductible amount. Multiply line 10a by 30%</span>
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...................</span> 
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">10b</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/DeductableAmount"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">11</div>
							<div class="styLNDesc" style="width:138mm;height:4mm;">
								<span  style="float:left;clear:none;">Other deductions <span class="styItalicText">(attach schedule)</span>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/PartIIOtherDeductions"/>
									</xsl:call-template>
								</span>	
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">......................</span>	
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">11</div>
							<div class="styLNAmountBox" style="height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/PartIIOtherDeductions"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">12</div>
							<div class="styLNDesc" style="width:138mm;height:4mm;">
								<span  style="float:left;clear:none;"><b>Total deductions.</b> Add lines 7, 8, 9 , 10b, and 11</span>
					    <!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..................</span>	
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">12</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/TotalDeductions2"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;;">
							<div class="styLNLeftNumBox" style="height:4mm;">13</div>
							<div class="styLNDesc" style="width:138mm;height:4mm;">
								<span  style="float:left;clear:none;"><b>Taxable income (loss) from other activities. </b>Subtract line 12 from line 6</span>
					    <!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom:0">13</div>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/TaxableIncomeLoss2"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styBB" style="width:187mm;">
							<div class="styPartName" style="width:23mm;">Schedule A</div>
							<div class="styPartDesc" style="width:164mm;">
								Cost of Goods Sold <span class="styNormalText">(see instructions)</span>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">1</div>
							<div class="styLNDesc" style="width:138mm;height:4mm;">
								<span  style="float:left;clear:none;">Inventory at beginning of year
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/InventoryAtBeginningOfYear"/>
									</xsl:call-template>
								</span>	
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.......................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">1</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/InventoryAtBeginningOfYear"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">2</div>
							<div class="styLNDesc" style="width:138mm;height:4mm;">
								<span  style="float:left;clear:none;">Purchases less cost of items withdrawn for personal use
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/Purchases"/>
									</xsl:call-template>
								</span>	
					    <!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">2</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/Purchases"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">3</div>
							<div class="styLNDesc" style="width:138mm;height:4mm;">
								<span  style="float:left;clear:none;">Cost of labor</span>
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..............................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">3</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/CostOfLabor"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">4</div>
							<div class="styLNDesc" style="width:138mm;height:4mm;">
								<span  style="float:left;clear:none;">Additional section 263A costs<!--(attach schedule)-->
									<span class="styItalicText">(attach schedule)</span>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/AdditionalSection263ACosts"/>
									</xsl:call-template>
								</span>	
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">4</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/AdditionalSection263ACosts"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">5</div>
							<div class="styLNDesc" style="width:138mm;height:4mm;">
								<span  style="float:left;clear:none;">Other costs <!--(attach schedule)-->
									<span class="styItalicText">(attach schedule)</span>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/OtherCosts"/>
									</xsl:call-template>
								</span>	
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">5</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/OtherCosts"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">6</div>
							<div class="styLNDesc" style="width:138mm;height:4mm;">
								<span  style="float:left;clear:none;"><b>Total.</b> Add lines 1 through 5</span>
					    <!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">6</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/TotalCosts"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">7</div>
							<div class="styLNDesc" style="width:138mm;height:4mm;">
								<span  style="float:left;clear:none;">Inventory at end of year</span>
					    <!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">7</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/InventoryAtEndOfYear"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">8</div>
							<div class="styLNDesc" style="width:138mm;height:4mm;">
								<span  style="float:left;clear:none;"><b>Cost of goods sold.</b> Subtract line 7 from line 6. Enter here and on page 1, line 2</span>
					    <!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">8</div>
							<div class="styLNAmountBox" style="height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/CostOfGoodsSold"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:3mm;padding-top:1.5mm;">9a</div>
							<div class="styLNDesc" style="width:178mm;height:3mm;padding-top:1.5mm;">Check all methods used for valuing closing inventory:
                        </div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;"/>
							<div class="styLNDesc" style="width:178mm;height:4mm;vertical-align:baseline;">
								<span class="styBoldText">(i)</span>
								<span style="width:3px"/>
								<span style="width:3px"/>
								<input type="checkbox" name="Checkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/CostAsDescribedInSection14713"/>
										<xsl:with-param name="BackupName">IRS1065ScheduleACostAsDescribedInSection14713</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/CostAsDescribedInSection14713"/>
										<xsl:with-param name="BackupName">IRS1065ScheduleACostAsDescribedInSection14713</xsl:with-param>
									</xsl:call-template>
         Cost as described in Regulations section 1.471-3
                            </label>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;"/>
							<div class="styLNDesc" style="width:178mm;height:4.5mm;vertical-align:baseline;">
								<span class="styBoldText">(ii)</span>
								<span style="width:3px"/>
								<input type="checkbox" name="Checkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/LowerOfCostOrMrktAsInSect14714"/>
										<xsl:with-param name="BackupName">IRS1065ScheduleALowerOfCostOrMrktAsInSect14714</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/LowerOfCostOrMrktAsInSect14714"/>
										<xsl:with-param name="BackupName">IRS1065ScheduleALowerOfCostOrMrktAsInSect14714</xsl:with-param>
									</xsl:call-template>
        Lower of cost or market as described in Regulations section 1.471-4
                            </label>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;"/>
							<div class="styLNDesc" style="width:91mm;height:4.5mm;vertical-align:baseline;">
								<span class="styBoldText">(iii)</span>
								<input type="checkbox" name="Checkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/OtherMethodUsedBox"/>
										<xsl:with-param name="BackupName">IRS1065ScheduleAOtherMethodUsedBox</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/OtherMethodUsedBox"/>
										<xsl:with-param name="BackupName">IRS1065ScheduleAOtherMethodUsedBox</xsl:with-param>
									</xsl:call-template>
        Other (specify method used and attach explanation.)
                            </label>
								<span style="width:2px;"/>
								<img src="{$ImagePath}/1065B_Bullet_Sm.gif" alt="SmallBullet"/>
								<span style="width:2px;"/>
								<!-- Form to Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/OtherMethodUsedBox"/>
								</xsl:call-template>
							</div>
							<div  class="styFixedUnderline" style="width:87mm;height:4.5mm;border-style: dotted;clear:none">
								<span style="width:3px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/OtherMethodUsedBox/@otherMethodUsed"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftLtrBox" style="height:4mm;">
								<span style="width:4px;"/>b</div>
							<div class="styLNDesc" style="width:179mm;height:4mm;float:right;clear:none;">
							  <span  style="float:left;clear:none;">	
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/SubnormalGoods"/>
										<xsl:with-param name="BackupName">IRS1065BScheduleASubnormalGoods</xsl:with-param>
									</xsl:call-template>
        Check this box if there was a writedown of “subnormal” goods as described in Regulations section 1.471-2(c)
								</label>
							  </span>	
					    <!--Dotted Line-->
								<span class="styDotLn" style="clear:none;padding-left:2mm;">.....</span>
									<span style="width:2.5mm;"/>
									<img src="{$ImagePath}/1065B_Bullet_Sm.gif" alt="SmallBullet"/>
									<span style="width:2.5mm;"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/SubnormalGoods"/>
										<xsl:with-param name="BackupName">IRS1065BScheduleASubnormalGoods</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftLtrBox" style="height:4mm;padding-left:4mm;">c</div>
							<div class="styLNDesc" style="width:179mm;weight:4mm;">
							  <span  style="float:left;clear:none;">	
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/LIFOAdopted"/>
										<xsl:with-param name="BackupName">IRS1065BScheduleALIFOAdopted</xsl:with-param>
									</xsl:call-template>
        Check this box if the LIFO inventory method was adopted this tax year for any goods <span class="styItalicText">(if checked, attach Form 970) </span>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/LIFOAdopted"/>
									</xsl:call-template>
								</label>
							  </span>	
						    <!--Dotted Line-->
									<span class="styDotLn" style="clear:none;padding-left:1mm;">....</span>
									<img src="{$ImagePath}/1065B_Bullet_Sm.gif" alt="SmallBullet"/>
									<span style="width:1mm;"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/LIFOAdopted"/>
										<xsl:with-param name="BackupName">IRS1065BScheduleALIFOAdopted</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
						</div>
						<div style="width:187mm;float:right;clear:none;">
							<div class="styLNLeftLtrBox" style="height:4mm;">
								<span style="width:4px;"/>d</div>
							<div class="styLNDesc" style="width:150mm;height:4mm;">
          Do the rules of section 263A (for property produced or acquired for resale) apply to the partnership?
                        </div>
							<div class="styLNDesc" style="width:13mm;height:4.5mm;padding-top:1.5mm;text-align:right;">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/Section263ARulesApply"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" name="Checkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/Section263ARulesApply"/>
											<xsl:with-param name="BackupName">IRS1065BScheduleASection263ARulesApply</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/Section263ARulesApply"/>
										<xsl:with-param name="BackupName">IRS1065BScheduleASection263ARulesApply</xsl:with-param>
									</xsl:call-template>
          Yes
                            </label>
							</div>
							<div class="styLNDesc" style="width:15mm;height:4.5mm;padding-top:1.5mm;text-align:right;">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/Section263ARulesApply"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" name="Checkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/Section263ARulesApply"/>
											<xsl:with-param name="BackupName">IRS1065BScheduleASection263ARulesApply</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/Section263ARulesApply"/>
										<xsl:with-param name="BackupName">IRS1065BScheduleASection263ARulesApply</xsl:with-param>
									</xsl:call-template>
          No
                            </label>
							</div>
						</div>
						<div style="width:187mm;float:right;clear:none;">
							<div class="styLNLeftLtrBox" style="height:4mm;">
								<span style="width:4px;"/>e</div>
							<div class="styLNDesc" style="width:150mm;height:4mm;">
    Was there any change in determining quantities, cost, or valuations between opening and closing inventory?<br/>
If “Yes,” attach explanation.  
                            <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/InventoryDeterminationChange"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="width:13mm;height:4.5mm;padding-top:1.5mm;text-align:right;">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/InventoryDeterminationChange"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" name="Checkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/InventoryDeterminationChange"/>
											<xsl:with-param name="BackupName">IRS1065BScheduleAInventoryDeterminationChange</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/InventoryDeterminationChange"/>
										<xsl:with-param name="BackupName">IRS1065BScheduleAInventoryDeterminationChange</xsl:with-param>
									</xsl:call-template>
          Yes
                            </label>
							</div>
							<div class="styLNDesc" style="width:15mm;height:4.5mm;padding-top:1.5mm;text-align:right;">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/InventoryDeterminationChange"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" name="Checkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/InventoryDeterminationChange"/>
											<xsl:with-param name="BackupName">IRS1065BScheduleAInventoryDeterminationChange</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleA/InventoryDeterminationChange"/>
										<xsl:with-param name="BackupName">IRS1065BScheduleAInventoryDeterminationChange</xsl:with-param>
									</xsl:call-template>
          No
                            </label>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="width:23mm;">Schedule B</div>
						<div class="styPartDesc" style="width:164mm;">Other Information (see instructions)</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">1</div>
						<div class="styLNDesc" style="height:4mm;width:167mm;">
      What type of entity is filing this return? Check the applicable box:
                    </div>
						<div class="styIRS1065BLNYesNoBox" style="font-weight:bold;">Yes</div>
						<div class="styIRS1065BLNYesNoBox" style="font-weight:bold;">No</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftLtrBox" style="height:4mm">a</div>
						<div class="styLNDesc" style="width:65mm">
							<input class="styCkBox" type="checkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/DomesticGeneralPartnership"/>
									<xsl:with-param name="BackupName">IRS1065BDomesticGeneralPartnership</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<label for="DomesticGeneralPartnership">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/DomesticGeneralPartnership"/>
									<xsl:with-param name="BackupName">IRS1065BDomesticGeneralPartnership</xsl:with-param>
								</xsl:call-template>
        Domestic general partnership
                        </label>
						</div>
						<div class="styLNLeftLtrBox" style="height:4mm">b</div>
						<div class="styLNDesc" style="width:94mm">
							<input class="styCkBox" type="checkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/DomesticLimitedPartnership"/>
									<xsl:with-param name="BackupName">IRS1065BDomesticLimitedPartnership</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<label for="DomesticLimitedPartnership">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/DomesticLimitedPartnership"/>
									<xsl:with-param name="BackupName">IRS1065BDomesticLimitedPartnership</xsl:with-param>
								</xsl:call-template>
        Domestic limited partnership
                        </label>
						</div>
						<div class="styIRS1065BLNYesNoBox" style="background:gray;border-bottom:0"/>
						<div class="styIRS1065BLNYesNoBox" style="background:gray;border-bottom:0"/>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftLtrBox" style="height:4mm">c</div>
						<div class="styLNDesc" style="width:65mm">
							<input class="styCkBox" type="checkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/DomesticLimitedLiabilityCo"/>
									<xsl:with-param name="BackupName">IRS1065BDomesticLimitedLiabilityCo</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<label for="DomesticLimitedLiabilityCo">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/DomesticLimitedLiabilityCo"/>
									<xsl:with-param name="BackupName">IRS1065BDomesticLimitedLiabilityCo</xsl:with-param>
								</xsl:call-template>
        Domestic limited liability company
                        </label>
						</div>
						<div class="styLNLeftLtrBox" style="height:4mm">d</div>
						<div class="styLNDesc" style="width:94mm">
							<input class="styCkBox" type="checkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/DomesticLimitedLiabilityPrtshp"/>
									<xsl:with-param name="BackupName">IRS1065BDomesticLimitedLiabilityPrtshp</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<label for="DomesticLimitedLiabilityPrtshp">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/DomesticLimitedLiabilityPrtshp"/>
									<xsl:with-param name="BackupName">IRS1065BDomesticLimitedLiabilityPrtshp</xsl:with-param>
								</xsl:call-template>
        Domestic limited liability partnership
                        </label>
						</div>
						<div class="styIRS1065BLNYesNoBox" style="background:gray;border-bottom:0"/>
						<div class="styIRS1065BLNYesNoBox" style="background:gray;border-bottom:0"/>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftLtrBox" style="height:4mm">e</div>
						<div class="styLNDesc" style="width:65mm">
							<input class="styCkBox" type="checkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/ForeignPartnership"/>
									<xsl:with-param name="BackupName">IRS1065BForeignPartnership</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<label for="ForeignPartnership">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/ForeignPartnership"/>
									<xsl:with-param name="BackupName">IRS1065BForeignPartnership</xsl:with-param>
								</xsl:call-template>
        Foreign partnership
                        </label>
						</div>
						<div class="styLNLeftLtrBox" style="height:4mm">f</div>
						<div class="styLNDesc" style="width:94mm">
							<input class="styCkBox" type="checkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/TypeOfEntityOther"/>
									<xsl:with-param name="BackupName">IRS1065BTypeOfEntityOther</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<label for="TypeOfEntityOther">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/TypeOfEntityOther"/>
									<xsl:with-param name="BackupName">IRS1065BTypeOfEntityOther</xsl:with-param>
								</xsl:call-template>
        Other 
                        </label>
							<span style="width:2mm;"/>
							<img src="{$ImagePath}/1065B_Bullet_Sm.gif" alt="SmallBullet"/>
							<span style="width:1mm;"/>
							<span style="width:74mm;border-bottom:1 dotted;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/TypeOfEntityOther/@note"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styIRS1065BLNYesNoBox" style="height:4mm;background:gray;border-left-width:1;border-right:1;"/>
						<div class="styIRS1065BLNYesNoBox" style="height:4mm;background:gray;"/>
						<div style="width:187mm">
							<div class="styLNLeftNumBox" style="height:4mm">2</div>
							<div class="styLNDesc" style="width:167mm;">
								<span  style="float:left;clear:none;">Are any partners in this partnership also partnerships?</span>
						<!--Dotted Line-->
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........................</span>
							</div>
							<div class="styIRS1065BLNYesNoBox" style="">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/AnyPartnershipsPartners"/>
								</xsl:call-template>
							</div>
							<div class="styIRS1065BLNYesNoBox" style="">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="$Form1065BScheduleB/AnyPartnershipsPartners"/>
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
										<xsl:with-param name="TargetNode" select="($Form1065BData)/IRS1065BScheduleB/OwnIntPrtshpUndReg301_7701_2_3"/>
									</xsl:call-template>
								
						<!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">............................</span>			
							</div>
							<div class="styIRS1065BLNYesNoBox" style="height:6.5mm;border-bottom-width:0"/>
							<div class="styIRS1065BLNYesNoBox" style="height:6.5mm;border-bottom-width:0"/>
							<div class="styIRS1065BLNYesNoBox" style="">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" select="($Form1065BData)/IRS1065BScheduleB/OwnIntPrtshpUndReg301_7701_2_3"/>
								</xsl:call-template>
							</div>
							<div class="styIRS1065BLNYesNoBox" style="">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="($Form1065BData)/IRS1065BScheduleB/OwnIntPrtshpUndReg301_7701_2_3"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm">
							<div class="styLNLeftNumBox" style="height:4mm">4</div>
							<div class="styLNDesc" style="width:167mm">
								Does this partnership have any foreign partners? If “Yes,” the partnership may have to file Forms 8804, 8805,
and 8813. (See instructions.)
						<!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">...................................</span>			
							</div>
							<div class="styIRS1065BLNYesNoBox" style="height:4mm;border-bottom-width:0"/>
							<div class="styIRS1065BLNYesNoBox" style="height:4mm;border-bottom-width:0"/>
							<div class="styIRS1065BLNYesNoBox" style="">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" select="($Form1065BData)/IRS1065BScheduleB/PrtshpHasAnyForeignPartners"/>
								</xsl:call-template>
							</div>
							<div class="styIRS1065BLNYesNoBox" style="">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="($Form1065BData)/IRS1065BScheduleB/PrtshpHasAnyForeignPartners"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm">
							<div class="styLNLeftNumBox" style="height:4mm">5</div>
							<div class="styLNDesc" style="width:167mm">
								<span  style="float:left;clear:none;">Is this partnership a publicly traded partnership as defined in section 469(k)(2)?</span>     
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...............</span>			 
							</div>
							<div class="styIRS1065BLNYesNoBox" style="">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" select="($Form1065BData)/IRS1065BScheduleB/IsPartnershipPubliclyTraded"/>
								</xsl:call-template>
							</div>
							<div class="styIRS1065BLNYesNoBox" style="">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="($Form1065BData)/IRS1065BScheduleB/IsPartnershipPubliclyTraded"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm">
							<div class="styLNLeftNumBox" style="height:4mm">6</div>
							<div class="styLNDesc" style="width:167mm;">
								<span style="font-size:7pt;">Has this partnership filed, or is it required to file, Form 8918, Material Advisor Disclosure Statement, to provide
																			 information on any reportable transaction?</span>
								
						<!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">...............................</span>			 
							</div>
							<div class="styIRS1065BLNYesNoBox" style="height:7.5mm;padding-top:3.5mm">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" select="($Form1065BData)/IRS1065BScheduleB/HasThisPrtshpFiledUnderSec6111"/>
								</xsl:call-template>
							</div>
							<div class="styIRS1065BLNYesNoBox" style="height:7.5mm;padding-top:3.5mm">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="($Form1065BData)/IRS1065BScheduleB/HasThisPrtshpFiledUnderSec6111"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm">
							<div class="styLNLeftNumBox" style="height:4mm">7</div>
							<div class="styLNDesc" style="width:167mm">At any time during calendar year 2010, did the partnership have an interest in or a signature or other authority
										over a financial account in a foreign country (such as a bank account, securities account, or other financial
										account)? See instructions for exceptions and filing requirements for Form TD F 90-22.1. If “Yes,” enter the
										name of the foreign country.   
                            <span style="width:2mm;"/>
								<br/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleB/AnyForeignAccounts"/>
								</xsl:call-template>
								<span style="width:2mm;"/>
								<img src="{$ImagePath}/1065B_Bullet_Sm.gif" alt="SmallBullet"/>
								<span style="width:1mm;"/>
								<span style="width:156mm;border-bottom:1 dotted;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleB/AnyForeignAccounts/@NameOfForeignCountry"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styIRS1065BLNYesNoBox" style="height:9.5mm;border-bottom-width:0;"/>
							<div class="styIRS1065BLNYesNoBox" style="height:9.5mm;border-bottom-width:0;"/>
							<div class="styIRS1065BLNYesNoBox" style="">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" select="($Form1065BData)/IRS1065BScheduleB/AnyForeignAccounts"/>
								</xsl:call-template>
							</div>
							<div class="styIRS1065BLNYesNoBox" style="">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="($Form1065BData)/IRS1065BScheduleB/AnyForeignAccounts"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm">
							<div class="styLNLeftNumBox" style="height:4mm">8</div>
							<div class="styLNDesc" style="width:167mm">
								During the tax year, did the partnership receive a distribution from, or was it the grantor to, or transferor to, a foreign trust?
								If “Yes,” the partnership may have to file Form 3520 
						<!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">.........................</span>			 
							</div>
							<!-- <div class="styIRS1065BLNYesNoBox" style="height:3mm;border-bottom-width:0;"/>
                        <div class="styIRS1065BLNYesNoBox" style="height:3mm;border-bottom-width:0;"/>-->
							<div class="styIRS1065BLNYesNoBox" style="height:7.5mm;padding-top:3.5mm;">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" select="($Form1065BData)/IRS1065BScheduleB/ReceivedDistriFromForeignTrust"/>
								</xsl:call-template>
							</div>
							<div class="styIRS1065BLNYesNoBox" style="height:7.5mm;padding-top:3.5mm;">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="($Form1065BData)/IRS1065BScheduleB/ReceivedDistriFromForeignTrust"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;border-bottom:1 solid black;">
							<div class="styLNLeftNumBox" style="height:3.5mm">9</div>
							<div class="styLNDesc" style="font-size:6.5pt;width:167mm">Enter the number of 
                            <span class="styBoldText">Forms 8865</span>, Return of U.S. Persons With Respect to Certain Foreign Partnerships, attached
    to this return.
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleB/NumberOfForms8865Attached"/>
								</xsl:call-template>
								<span style="width:1mm;"/>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">SchB Line 9 - Number of IRS8865 Forms attached</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleB/NumberOfForms8865Attached"/>
								</xsl:call-template>
								<span style="width:1mm;"/>
								<img src="{$ImagePath}/1065B_Bullet_Sm.gif" alt="MidSizeBullet"/>
								<!--<span style="width:3mm"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleB/NumberOfForms8865Attached"/>
								</xsl:call-template>-->
							</div>
							<div class="styIRS1065BLNYesNoBox" style="height:8mm;border-bottom-width:0;background:gray;">
								<!--       <xsl:call-template name="PopulateYesBoxText">
      <xsl:with-param name="TargetNode" select="($Form1065BData)/IRS1065BScheduleB/ReceivedDistriFromForeignTrust"></xsl:with-param>
    </xsl:call-template></div> -->
							</div>
							<div class="styIRS1065BLNYesNoBox" style="height:8mm;border-left-width:0;border-bottom-width:0;background:gray;">
								<!-- <xsl:call-template name="PopulateNoBoxText">
      <xsl:with-param name="TargetNode" select="($Form1065BData)/IRS1065BScheduleB/ReceivedDistriFromForeignTrust"></xsl:with-param>
    </xsl:call-template>  -->
							</div>
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;">
						<div style="float:right;">
							<span style="width:40px;"/> Form 
                        <span class="styBoldText" style="font-size:8pt;">1065-B</span> (2010)
                    </div>
					</div>
					<!-- END Page Break and Footer-->
					<!-- Page Header -->
					<div class="styBB" style="width:187mm;">
						<div style="float:left;">Form 1065-B (2010)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span>
						</div>
					</div>
					<!-- END Page Header -->
					<div class="styBB" style="width:187mm;height:3.75mm;">
						<div class="styPartName" style="height:3.75mm;width:19mm">Schedule D</div>
						<div class="styPartDesc" style="float:left;width:167mm;"> Capital Gains and Losses
						<span  style="font-weight: normal;">
						(Use Schedule D-1 (Form 1065) to list additional transactions for lines 1 and 6)</span>
						</div>
					</div>
					<div class="styBB" style="width:187mm;height: 3mm; ">
						<div class="styPartDesc" style="width:180mm;text-align:center;padding-top:.5mm;">
            Part I—Short-Term Capital Gains and Losses—Assets Held 1 Year or Less
                    </div>
						<div style="width:5mm;float:right;text-align:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/AssetsHeld1YearOrLess"/>
								<xsl:with-param name="containerHeight" select="4"/>
								<xsl:with-param name="containerID" select="'CADOYOLctn'"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm;overflow-y:visible">
						<!-- BEGIN PART I TABLE -->
						<div class="styTableContainer" id="CADOYOLctn">
							<!-- print logic -->
							<xsl:call-template name="SetInitialState"/>
							<!-- end -->
							<table class="styTable" cellspacing="0">
								<thead class="styTableThead" style="font-size:7pt">
									<tr>
										<th class="styTableCellHeader" style="width:3mm;border-right-width:0px;" scope="col"/><span class="styTableCellPad"/>
										<th class="styTableCellHeader" style="width:2mm;border-right-width:0px;" scope="col"/><span class="styTableCellPad"/>
										<th class="styTableCellHeader" style="width:40mm;font-weight:normal;" scope="col">
											<b>(a)</b> Description of property<br/>(e.g., 100 shares<br/> of "Z" Co.)</th>
										<th class="styTableCellHeader" style="width:20mm;font-weight:normal;" scope="col">
											<b>(b)</b> Date acquired<br/>(month, day, year)</th>
										<th class="styTableCellHeader" style="width:20mm;font-weight:normal;" scope="col">
											<b>(c)</b> Date sold<br/>(month, day, year)</th>
										<th class="styTableCellHeader" style="width:32mm;font-weight:normal;" scope="col">
											<b>(d)</b> Sales price<br/>(see instructions)</th>
										<th class="styTableCellHeader" style="width:37mm;font-weight:normal;" scope="col" colspan="2">
											<b>(e)</b> Cost or other basis<br>(see instructions)</br>
										</th>
										<th class="styTableCellHeader" style="width:32mm;font-weight:normal;" scope="col">
											<b>(f)</b> Gain or (loss)<br/> Subtract (e) from (d)</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody style="font-size:7pt">
									<xsl:if test="($Print != $Separated) or (count($Form1065BData/IRS1065BScheduleD/AssetsHeld1YearOrLess) &lt;= 4) ">
										<xsl:for-each select="$Form1065BData/IRS1065BScheduleD/AssetsHeld1YearOrLess">
											<tr>
												<td class="styTableCell" style="width:3mm;text-align:left;border-right-width:0px;font-weight:bold;vertical-align:top;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/AssetsHeld1YearOrLess"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:2mm;text-align:left;border-right-width:0px;font-weight:bold;vertical-align:top;">
													<xsl:if test="position() = 1">1</xsl:if>
												</td>
												<td class="styTableCell" style="text-align:left;width:40mm;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DescriptionOfProperty"/>
													</xsl:call-template>
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="DescriptionOfProperty"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCellText" style="width:20mm;text-align:center;">
													<span style="width:1px;"/>
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="DateAcquired"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellText" style="width:20mm;text-align:center;">
													<span style="width:1px;"/>
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="DateSold"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:32mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="SalesPrice"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="width:5mm;border-right-width:0px;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:32mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="width:32mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="GainOrLoss"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="count($Form1065BData/IRS1065BScheduleD/AssetsHeld1YearOrLess) &lt; 1 or ((count($Form1065BData/IRS1065BScheduleD/AssetsHeld1YearOrLess) &gt; 4) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:3mm;text-align:right;border-right-width:0px;font-weight:bold;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:2mm;text-align:right;border-right-width:0px;font-weight:bold;" scope="col">
												<xsl:if test="position() = 1">1</xsl:if>
											</td>
											<td class="styTableCell" style="text-align:left;width:40mm;">
												<xsl:if test="$Print = $Separated">
													<span class="styTableCellPad"/> See Additional Data Table
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:20mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:20mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:32mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:37mm;" colspan="2">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:32mm;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form1065BData/IRS1065BScheduleD/AssetsHeld1YearOrLess) &lt; 2 or ((count($Form1065BData/IRS1065BScheduleD/AssetsHeld1YearOrLess) &gt; 4) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:3mm;text-align:right;border-right-width:0px;font-weight:bold;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:2mm;text-align:right;border-right-width:0px;font-weight:bold;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:left;width:40mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:20mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:20mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:32mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:37mm;" colspan="2">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:32mm;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form1065BData/IRS1065BScheduleD/AssetsHeld1YearOrLess) &lt; 3 or ((count($Form1065BData/IRS1065BScheduleD/AssetsHeld1YearOrLess) &gt; 4) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:3mm;text-align:right;border-right-width:0px;font-weight:bold;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:2mm;text-align:right;border-right-width:0px;font-weight:bold;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:left;width:40mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:20mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:20mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:32mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:37mm;" colspan="2">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:32mm;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form1065BData/IRS1065BScheduleD/AssetsHeld1YearOrLess) &lt; 4 or ((count($Form1065BData/IRS1065BScheduleD/AssetsHeld1YearOrLess) &gt; 4) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:3mm;text-align:right;border-right-width:0px;font-weight:bold;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:2mm;text-align:right;border-right-width:0px;font-weight:bold;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:left;width:40mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:20mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:20mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:32mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:37mm;" colspan="2">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:32mm;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
								</tbody>
							</table>
						</div>
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/AssetsHeld1YearOrLess"/>
							<xsl:with-param name="containerHeight" select="4"/>
							<xsl:with-param name="containerID" select="'CADOYOLctn'"/>
						</xsl:call-template>
						<!-- END PART I TABLE -->
						<div class="styBB" style="width:187mm">
							<div style="width:187mm">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">2</div>
								<div class="styLNDesc" style="width:138mm;height:4mm;">
									<span  style="float:left;clear:none;">Enter short-term gain or (loss), if any, from Schedule D-1 (Form 1065), line 2</span>
                        <!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.........</span>			 
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">2</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/ShortTermGainOrLoss"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:187mm">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">3</div>
								<div class="styLNDesc" style="width:138mm;height:4mm;">
									<span  style="float:left;clear:none;">Short-term capital gain from installment sales from Form 6252, line 26 or 37</span>
						    <!--Dotted Line-->
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.........</span>			 
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">3</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/ShortTermCapitalGainInstalSls"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:187mm;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">4</div>
								<div class="styLNDesc" style="width:138mm;height:4mm;">
									<span  style="float:left;clear:none;">Short-term capital gain (loss) from like-kind exchanges from Form 8824</span>
							<!--Dotted Line-->
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...........</span>			 
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">4</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/STCGLossLikeKindExchs"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:187mm;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">5</div>
								<div class="styLNDesc" style="width:138mm;height:4mm;">
									<span  style="float:left;clear:none;"><b>Net short-term capital gain or (loss).</b> Combine lines 1 through 4 in column (f)</span>
						    <!--Dotted Line-->
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.........</span>	
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0">5</div>
								<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/NetShortTermCapitalGainLoss"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--<div class="styBB" style="width:187mm;">-->
						<div style="width:187mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
							<div class="styPartDesc" style="width:180mm;text-align:center;">
             Part II—Long-Term Capital Gains and Losses—Assets Held More Than 1 Year
                        </div>
							<div style="width:5mm;float:right;text-align:right;">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/AssetsHeldMoreThan1Year"/>
									<xsl:with-param name="containerHeight" select="4"/>
									<xsl:with-param name="containerID" select="'CADOYOMctn'"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- BEGIN PART II TABLE -->
						<div class="styTableContainer" id="CADOYOMctn">
							<!-- print logic -->
							<xsl:call-template name="SetInitialState"/>
							<!-- end -->
							<table class="styTable" cellspacing="0">
								<thead class="styTableThead" style="font-size:7pt">
									<tr>
										<th class="styTableCellHeader" style="width:5mm;border-right-width:0px;" scope="col">
											<span class="styTableCellPad"/>
										</th>
										<th class="styTableCellHeader" style="width:40mm;font-weight:normal;" scope="col">
											<b>(a)</b> Description of property<br/>(e.g., 100 shares<br/> of "Z" Co.)</th>
										<th class="styTableCellHeader" style="width:20mm;font-weight:normal;" scope="col">
											<b>(b)</b> Date acquired<br/>(month, day, year)</th>
										<th class="styTableCellHeader" style="width:20mm;font-weight:normal;" scope="col">
											<b>(c)</b> Date sold<br/>(month, day, year)</th>
										<th class="styTableCellHeader" style="width:32mm;font-weight:normal;" scope="col">
											<b>(d)</b> Sales price<br/>(see instructions)</th>
										<th class="styTableCellHeader" style="width:37mm;font-weight:normal;" scope="col" colspan="2">
											<b>(e)</b> Cost or other basis<br>(see instructions)</br>
										</th>
										<th class="styTableCellHeader" style="width:32mm;font-weight:normal;" scope="col">
											<b>(f)</b> Gain or (loss)<br/> Subtract (e) from (d)</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody style="font-size:7pt">
									<xsl:if test="($Print != $Separated) or (count($Form1065BData/IRS1065BScheduleD/AssetsHeldMoreThan1Year) &lt;= 4) ">
										<xsl:for-each select="$Form1065BData/IRS1065BScheduleD/AssetsHeldMoreThan1Year">
											<tr>
												<td class="styTableCell" style="width:5mm;text-align:right;border-right-width:0px;font-weight:bold;vertical-align:top;" scope="col">
													<xsl:if test="position() = 1">6<br/>
													</xsl:if>
												</td>
												<td class="styTableCell" style="text-align:left;width:40mm;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="DescriptionOfProperty"/>
													</xsl:call-template>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DescriptionOfProperty"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCellText" style="width:20mm;text-align:center;">
													<span style="width:1px;"/>
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="DateAcquired"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellText" style="width:20mm;text-align:center;">
													<span style="width:1px;"/>
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="DateSold"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:32mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="SalesPrice"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="width:5mm;border-right-width:0px;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:32mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="width:32mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="GainOrLoss"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="count($Form1065BData/IRS1065BScheduleD/AssetsHeldMoreThan1Year) &lt; 1 or ((count($Form1065BData/IRS1065BScheduleD/AssetsHeldMoreThan1Year) &gt; 4) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;text-align:right;border-right-width:0px;font-weight:bold;" scope="col">
												<xsl:if test="position() = 1">6<br/>
													</xsl:if>
                                        </td>
											<td class="styTableCell" style="text-align:left;width:40mm;">
												<xsl:if test="$Print = $Separated">
													<span class="styTableCellPad"/> See Additional Data Table
												</xsl:if>
												<span class="styTableCellPad"/>
                                        </td>
											<td class="styTableCell" style="width:20mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:20mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:32mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:37mm;" colspan="2">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:32mm;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form1065BData/IRS1065BScheduleD/AssetsHeldMoreThan1Year) &lt; 2 or ((count($Form1065BData/IRS1065BScheduleD/AssetsHeldMoreThan1Year) &gt; 4) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;text-align:left;border-right-width:0px;font-weight:bold;" scope="col">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:left;width:40mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:20mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:20mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:32mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:37mm;" colspan="2">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:32mm;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form1065BData/IRS1065BScheduleD/AssetsHeldMoreThan1Year) &lt; 3 or ((count($Form1065BData/IRS1065BScheduleD/AssetsHeldMoreThan1Year) &gt; 4) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;text-align:left;border-right-width:0px;font-weight:bold;" scope="col">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:left;width:40mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:20mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:20mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:32mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:37mm;" colspan="2">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:32mm;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form1065BData/IRS1065BScheduleD/AssetsHeldMoreThan1Year) &lt; 4 or ((count($Form1065BData/IRS1065BScheduleD/AssetsHeldMoreThan1Year) &gt; 4) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;text-align:left;border-right-width:0px;font-weight:bold;" scope="col">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:left;width:40mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:20mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:20mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:32mm;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:37mm;" colspan="2">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:32mm;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
								</tbody>
							</table>
						</div>
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/AssetsHeldMoreThan1Year"/>
							<xsl:with-param name="containerHeight" select="4"/>
							<xsl:with-param name="containerID" select="'CADOYOMctn'"/>
						</xsl:call-template>
						<!-- END PART II TABLE -->
						<div class="styBB" style="width:187mm">
							<div style="width:187mm;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">7</div>
								<div class="styLNDesc" style="width:137mm;height:4mm;">
									<span  style="float:left;clear:none;">Enter long-term gain or (loss), if any, from Schedule D-1 (Form 1065), line 8</span>
					    <!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.........</span>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">7</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/LongTermGainOrLoss"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:187mm;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">8</div>
								<div class="styLNDesc" style="width:137mm;height:4mm;">
									<span  style="float:left;clear:none;">Enter gain from Form 4797, Part I</span>
					    <!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.......................</span>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">8</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/GainOrLossForm4797"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:187mm;float:right;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">9</div>
								<div class="styLNDesc" style="width:137mm;height:4mm;">
									<span  style="float:left;clear:none;">Long-term capital gain from installment sales from Form 6252, line 26 or 37</span>
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.........</span>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">9</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/LongTermCapGainInstalSales"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:187mm;float:right;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm">10</div>
								<div class="styLNDesc" style="width:137mm;height:4mm;">
									<span  style="float:left;clear:none;">Long-term capital gain (loss) from like-kind exchanges from Form 8824</span>
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..........</span>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">10</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/LongTermGainLossFromLikeKind"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:187mm;float:right;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm">11</div>
								<div class="styLNDesc" style="width:137mm;height:4mm;">
									<span  style="float:left;clear:none;"><b>Net long-term capital gain or (loss).</b> Combine lines 6 through 10 in column (f)</span>       
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........</span>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0">11</div>
								<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/NetLongTermCapitalGainLoss"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<div class="styBB" style="width:187mm">
							<div class="styBB" style="width:187mm;">
								<div class="styPartDesc" style="width:182mm;text-align:center;">
									<b>   Part III—Summary of Parts I and II</b>
								</div>
							</div>
							<div style="width:187mm;float:right;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">12</div>
								<div class="styLNDesc" style="width:137mm;height:4mm;">
									<span  style="float:left;clear:none;">Combine lines 5 and 11 and enter the net gain (loss)</span>
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.................</span>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">12</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/NetGainLoss"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:187mm;float:right;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">13</div>
								<div class="styLNDesc" style="width:137mm;height:4mm;">
									<span  style="float:left;clear:none;">Enter excess of net short-term capital gain (line 5) over net long-term capital loss (line 11)</span>
						<!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">....</span>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">13</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/ExcessNetSTCGOverLTCapitalLoss"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:187mm;float:right;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">14</div>
								<div class="styLNDesc" style="width:137mm;height:4mm;">
									<span  style="float:left;clear:none;"><b>Net capital gain or (loss).</b> Subtract line 13 from line 12</span>
					    <!--Dotted Line-->
								<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">................</span>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0">14</div>
								<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/NetCapitalGainLoss"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<div class="styBB" style="width:187mm">
							<div class="styBB" style="width:187mm;">
								<div class="styPartDesc" style="width:182mm;text-align:center;">
									<b>      Part IV—Net Capital Gain (Loss) From Passive Loss Limitation Activities</b>
								</div>
							</div>
							<div style="width:187mm;float:right;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">15</div>
								<div class="styLNDesc" style="width:137mm;height:4mm;">
									Redetermine the amount on line 13 by taking into account only gains and losses from passive	loss<br/>
									limitation activities
									
						<!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">...........................</span>
								</div>
								<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">15</div>
								<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/GainsLossesFromPssvLossLmtActy"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:187mm;float:right;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">16</div>
								<div class="styLNDesc" style="width:137mm;height:4mm;">
									<b>Excess of net short-term capital gain over net long-term capital loss. </b> Enter the <b>smaller</b> of the<br/>
									amount on line 13 or line 15. Enter here and on page 1, Part I, line 8
						<!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:.5mm;">...........</span>
								</div>
								<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">16</div>
								<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/ExcessGainLossPssvLossLmtActy"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:187mm;float:right;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">17</div>
								<div class="styLNDesc" style="width:137mm;height:4mm;">Redetermine the amount on line 14 by taking into account only gains and losses from passive loss<br/>
								limitation activities
						<!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">...........................</span>
								</div>
								<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">17</div>
								<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/PassiveLossLimitationActy"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:187mm;float:right;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">18</div>
								<div class="styLNDesc" style="width:137mm;height:4mm;">
									<b>Net capital gain or (loss) from passive loss limitation activities. </b> If lines 14 and 17 are both<br/>
									  positive or both negative, enter the <b>smaller</b> of line 14 or line 17. Otherwise, enter -0-. Enter here<br/>
									  and on Schedule K, line 4a
						<!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:.5mm;">.........................</span>
								</div>
								<div class="styLNRightNumBox" style="height:10.5mm;padding-top:6.5mm;">18</div>
								<div class="styLNAmountBox" style="height:10.5mm;padding-top:6.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/NetPassiveLossLimitationActy"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:187mm;float:right;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm"/>
								<div class="styLNDesc" style="width:137mm;height:4mm;">
									<b>Note. </b>
									<!--<span class="styBoldText">Note.</span>-->
									<span class="styItalicText">When figuring whether line 14 or line 17 is <b>smaller</b>, treat both numbers as positive.</span>
									<!--Dotted Line-->
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0;background:gray"/>
								<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0;background:gray"/>
							</div>
						</div>
						<div class="styBB" style="width:187mm;">
							<div class="styPartDesc" style="width:182mm;text-align:center;">
								<b>   Part V—Net Capital Gain (Loss) From Other Activities</b>
							</div>
						</div>
						<div style="width:187mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">19</div>
							<div class="styLNDesc" style="width:137mm;height:4mm;">
								<b>Excess of net short-term capital gain over net long-term capital loss. </b>  Subtract line 16 from<br/>
								line 13. Enter here and on page 2, Part II, line 4
						<!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">..................</span>
							</div>
							<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">19</div>
							<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/ExcessGainsLossesFromOtherActy"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:7.5mm;padding-left: 2.25mm">20</div>
							<div class="styLNDesc" style="width:137mm;height:7.5mm;">
								<b>Net capital gain or (loss) from other activities. </b> Subtract line 18 from line 14. Enter here and on<br/>
								Schedule K, line 4b       
					    <!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:.5mm;">............................</span>
							</div>
							<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;border-bottom-width:0">20</div>
							<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;border-bottom-width:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/NetGainsLossesFromOtherActy"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;">
						<div style="float:right;">
							<span style="width:40px;"/>  
      Form
                        <span class="styBoldText" style="font-size:8pt;">1065-B</span> (2010)
                    </div>
					</div>
					<!-- END Page Break and Footer-->
					<!-- Page Header -->
					<div class="styBB" style="width:187mm;">
						<div style="float:left;">Form 1065-B (2010)
                        <span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page 
                        <span style="font-weight:bold;font-size:8pt;">4</span>
						</div>
					</div>
					<!-- END Page Header -->
					<div class="styBB" style="width:187mm;height:3.75mm;">
						<div class="styPartName" style="height:3.75mm;width:19mm">Schedule K</div>
						<div class="styPartDesc" style="float:left;width:167mm;"> 
							Partners’ Shares of Income, Credits, Deductions, etc.
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK"/>
								</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm;height:3.75mm;">
						<div class="styPartDesc" style="width:145.3mm;border-right:1px solid black;text-align:center;"> (a) Distributive share items. </div>
						<div class="styPartDesc" style="width:41mm;text-align:center;"> (b) Total amount</div>
					</div>
					<!--Line 1a-->
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">1a
                        <span style="width:2px;"/>
						</div>
						<div class="styLNDesc" style="width:137mm;height:4mm;">
							<span  style="float:left;clear:none;">Taxable income (loss) from passive loss limitation activities (Part I, line 25)</span>
 					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">1a</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/TaxableIncmLossPssvLossLmtActy"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">
							<span style="width:1.5mm;"/>b
                    </div>
						<div class="styLNDesc" style="width:137mm;height:4mm;">
							Amount on line 1a allocated to general partners as:
                        <span style="width:2px;"/>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:8.3mm;background:gray;border-bottom-width:0;border-right-width:1px"/>
				
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;text-align:right;">
							<span style="width:2px;"/>
						</div>
						<div class="styLNDesc" style="width:95mm;height:4mm;">
							<span  style="float:left;clear:none;"><b>(1)  </b> Taxable income (loss) from trade or business activities</span>
 					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">....</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:10mm">1b(1)</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/TaxableIncmLossTradeBusActy"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:8.3mm;background:gray;border-bottom-width:0;border-right-width:1px;"/>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;text-align:right;">
							<span style="width:2px;"/>
						</div>
						<div class="styLNDesc" style="width:95mm;height:4mm;">
							<span  style="float:left;clear:none;"><b>(2)  </b> Taxable income (loss) from rental real estate activities</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">....</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:10mm">1b(2)</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/TaxableIncmLossRntlREActy"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:8.3mm;background:gray;border-bottom-width:0;border-right-width:1px;"/>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;text-align:right;">
							<span style="width:2px;"/>
						</div>
						<div class="styLNDesc" style="width:95mm;height:4mm;">
							<span  style="float:left;clear:none;"><b>(3) </b>	Taxable income (loss) from other rental activities</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:10mm">1b(3)</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/TaxableIncmLossOtherRntlActy"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:8.3mm;background:gray;border-bottom-width:0;border-right-width:1px;"/>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4.5mm;;">
							<span style="width:1.5mm"/>c
                    </div>
						<div class="styLNDesc" style="width:137mm;height:4mm;">
							<span  style="float:left;clear:none;">Total amount on line 1a allocated to general partners. Combine lines 1b(1) through 1b(3)</span>
 					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">1c</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/TotalAmtAllocatedToGenPartners"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;">
							<span style="width:1.5mm"/>d
                    </div>
						<div class="styLNDesc" style="width:137mm;padding-bottom:0mm;">
					  Taxable income (loss) from passive loss limitation activities allocated to limited partners. Subtract
                    </div>
						<div class="styLNRightNumBox" style="height:4.3mm;width:8.3mm;border-bottom-width:0;background:gray;border-right-width:1px;"/>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;text-align:right;"/>
						<div class="styLNDesc" style="width:137mm;">
							<span  style="float:left;clear:none;">line 1c from line 1a (report on Schedules K-1, box 1)</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.................</span>	
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">1d</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/TaxableIncomeLossPssvLossLmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">2
                     <span style="width:2px;"/>
						</div>
						<div class="styLNDesc" style="width:137mm;height:4mm;">
							<span  style="float:left;clear:none;">Taxable income (loss) from other activities (Part II, line 13)</span>
 					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">2</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/TaxableIncomeFromOtherActy"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">3 
                    <span style="width:2px;"/>
						</div>
						<div class="styLNDesc" style="width:137mm;height:4mm;">
							<span  style="float:left;clear:none;">Qualified dividends from other activities (Part II, line 2b)</span>
 					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">3</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/QualifiedDividendsOtherActy"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">4a 
                    <span style="width:2px;"/>
						</div>
						<div class="styLNDesc" style="width:137mm;height:4mm;">
							<span  style="float:left;clear:none;">Net capital gain (loss) from passive loss limitation activities (Schedule D, line 18)</span>
  					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">4a</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/NetCapitalGainLossPssvLossLmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">
							<span style="width:1.5mm;"/>b</div>
						<div class="styLNDesc" style="width:137mm;height:4mm;">
							<span  style="float:left;clear:none;">Net capital gain (loss) from other activities (Schedule D, line 20)</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">4b</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/NetCapitalGainLossOtherActy"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;">5 
                    <span style="width:2px;"/>
						</div>
						<div class="styLNDesc" style="width:137mm;height:4mm;">
							<span  style="float:left;clear:none;">Net passive alternative minimum tax adjustment</span>
 					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">5</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/NetPassiveAlternativeMinTaxAdj"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;">6 
                    <span style="width:2px;"/>
						</div>
						<div class="styLNDesc" style="width:137mm;height:4mm;">
							<span  style="float:left;clear:none;">Net other alternative minimum tax adjustment</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">6</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/NetOtherAlternativeMinTaxAdj"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;">7 
                    <span style="width:2px;"/>
						</div>
						<div class="styLNDesc" style="width:137mm;height:4mm;">
							<span  style="float:left;clear:none;">Guaranteed payments</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">7</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/GuaranteedPayments"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;">8 
                    <span style="width:2px;"/>
						</div>
						<div class="styLNDesc" style="width:137mm;height:4mm;">
							<span  style="float:left;clear:none;">Income from discharge of indebtedness</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">8</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/IncomeDischargeOfIndebtedness"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;">9 
                    <span style="width:2px;"/>
						</div>
						<div class="styLNDesc" style="width:137mm;height:4mm;">
							<span  style="float:left;clear:none;">Tax-exempt interest income</span>
 					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">9</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/TaxExemptInterestIncome"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;">10 
                   <span style="width:2px;"/>
						</div>
						<div class="styLNDesc" style="width:137mm;height:4mm;">
							<span  style="float:left;clear:none;">General credits (see instructions)
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/GeneralCredits"/>
								</xsl:call-template>
							</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">......................</span>	
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">10</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/GeneralCredits"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;">11 
                    <span style="width:2px;"/>
						</div>
						<div class="styLNDesc" style="width:137mm;height:4mm;">
							<span  style="float:left;clear:none;">Low-income housing credit (see instructions)
 								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/LowIncomeHousingCredit"/>
								</xsl:call-template>
							</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..................</span>	
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">11</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/LowIncomeHousingCredit"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 12-->
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;">12 
                    <span style="width:2px;"/>
						</div>
						<div class="styLNDesc" style="width:137mm;height:4mm;">
							<span  style="float:left;clear:none;">Rehabilitation credit from rental real estate activities
                    <!--(attach Form 3468)-->
							<span class="styItalicText"> (attach Form 3468)</span>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/RehabilitationCreditRntlREActy"/>
								</xsl:call-template>
							</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..........</span>	
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">12</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/RehabilitationCreditRntlREActy"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 13-->
					<!--<div class="styLNLeftNumBox" style="height:4mm;text-align:right;">12 <span style="width:6px;"/>-->
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">13a
                        <span style="width:2px;"/>
						</div>
						<div class="styLNDesc" style="width:137mm;height:4mm;">
							<span  style="float:left;clear:none;">Net earnings (loss) from self-employment</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">13a</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/NetEarningsLossSelfEmplmn"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;">
							<span style="width:1mm"/>b
                    </div>
						<div class="styLNDesc" style="width:137mm;height:4mm;">
							<span  style="float:left;clear:none;">Gross nonfarm income</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">13b</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/GrossNonfarmIncome"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 14-->
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;">14a<span style="width:2px;"/>
						</div>
						<div class="styLNDesc" style="width:137mm;height:4mm;">
        Name of foreign country or U.S. possession
                        <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactions/ForeignCountryOrUSPossession"/>
							</xsl:call-template>
							<span style="width:2px;"/>
							<img src="{$ImagePath}/1065B_Bullet_Sm.gif" alt="SmallBullet"/>
							<span style="border-bottom:1 dotted;width:70mm">
								<xsl:if test="$Form1065BData/IRS1065BScheduleK/ForeignTransactions/ForeignCountryOrUSPossession">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactions/ForeignCountryOrUSPossession"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form1065BData/IRS1065BScheduleK/ForeignTransactions/ForeignCountryOrUSPossVARIOUS">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactions/ForeignCountryOrUSPossVARIOUS"/>
									</xsl:call-template>
								</xsl:if>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:8.3mm;background:gray;border-bottom-width:0px;border-right-width:1px;"/>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;">
							<span style="width:1mm"/>b
                    </div>
						<div class="styLNDesc" style="width:137mm;height:4mm;">
							<span  style="float:left;clear:none;">Gross income from all sources</span>
 					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">14b</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactions/GrossIncomeFromAllSources"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;">
							<span style="width:1mm"/>c
                    </div>
						<div class="styLNDesc" style="width:137mm;height:4mm;">
							<span  style="float:left;clear:none;">Gross income sourced at partner level (attach schedule)
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactions/GrossIncmSrcdAtPartnerLevel"/>
								</xsl:call-template>
							</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">14c</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactions/GrossIncmSrcdAtPartnerLevel"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;">
							<span style="width:1mm"/>d
                    </div>
						<div class="styLNDesc" style="width:137mm;height:4mm;">Foreign gross income sourced at partnership level:
                        <span style="width:2px;"/>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:8.3mm;background:gray;border-bottom-width:0px;border-right-width:1px;"/>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;text-align:right;">
							<span style="width:2px;"/>
						</div>
						<div class="styLNDesc" style="width:137mm;height:4mm;">
							<span  style="float:left;clear:none;"><b>(1) </b> Passive category</span>
             		<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;font-size:5pt">14d(1)</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactions/FrgnGroIncmSrcdPrtShpLvlPssv"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;text-align:right;">
							<span style="width:2px;"/>
						</div>
						<div class="styLNDesc" style="width:137mm;height:4mm;">
							<span  style="float:left;clear:none;"><b>(2) </b> General category</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;font-size:5pt">14d(2)</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactions/ForeignGroIncmSrcdPrtshpLvlGC"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;text-align:right;">
							<span style="width:2px;"/>
						</div>
						<div class="styLNDesc" style="width:137mm;height:4mm;">
							<span  style="float:left;clear:none;"><b>(3) </b> Other (attach schedule)
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactions/ForeignGroIncmSrcdPrtshpLvlOth"/>
								</xsl:call-template>
							</span>
 					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;font-size:5pt">14d(3)</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactions/ForeignGroIncmSrcdPrtshpLvlOth"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;">
							<span style="width:1mm"/>e
                    </div>
						<div class="styLNDesc" style="width:137mm;height:4mm;">Deductions allocated and apportioned at partner level:
                        <span style="width:2px;"/>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:8.3mm;border-bottom-width:0px;border-right-width:1px;background:gray"/>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;text-align:right;">
							<span style="width:2px;"/>
						</div>
						<div class="styLNDesc" style="width:137mm;height:4mm;">
							<span  style="float:left;clear:none;"><b>(1) </b> Interest expense</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;font-size:5pt">14e(1)</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactions/DedAllocApprtnPartnerLvlIntExp"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;text-align:right;">
							<span style="width:2px;"/>
						</div>
						<div class="styLNDesc" style="width:137mm;height:4mm;">
							<span  style="float:left;clear:none;"><b>(2) </b> Other</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;font-size:5pt">14e(2)</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactions/DedAllocApprtnPartnerLvlOther"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;">
							<span style="width:1mm"/>f
                    </div>
						<div class="styLNDesc" style="width:137mm;height:4mm;">Deductions allocated and apportioned at partnership level to foreign source income:
                        <span style="width:2px;"/>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:8.3mm;border-bottom-width:0px;border-right-width:1px;background:gray"/>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;text-align:right;">
							<span style="width:2px;"/>
						</div>
						<div class="styLNDesc" style="width:137mm;height:4mm;">
							<span  style="float:left;clear:none;"><b>(1) </b> Passive category</span>
     				<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;font-size:5pt">14f(1)</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactions/DedAllocAndApprtnPrtshpLvlPssv"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;text-align:right;">
							<span style="width:2px;"/>
						</div>
						<div class="styLNDesc" style="width:137mm;height:4mm;">
							<span  style="float:left;clear:none;"><b>(2) </b> General category</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;font-size:5pt">14f(2)</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactions/DedAllocAndApprtnPrtshpLvlGC"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;text-align:right;">
							<span style="width:2px;"/>
						</div>
						<div class="styLNDesc" style="width:137mm;height:4mm;">
							<span  style="float:left;clear:none;"><b>(3) </b> Other (attach schedule)
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactions/DedAlocAndApprtnPrtshpLvlOther"/>
								</xsl:call-template>
							</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;font-size:5pt">14f(3)</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactions/DedAlocAndApprtnPrtshpLvlOther"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;">
							<span style="width:1mm"/>g
                    </div>
						<div class="styLNDesc" style="width:137mm;height:4mm;">Total foreign taxes (check one):
                        <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactions/TotalForeignTaxes"/>
							</xsl:call-template>
							<span style="width:2px;"/>
							<img src="{$ImagePath}/1065B_Bullet_Sm.gif" alt="SmallBullet"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactions/TotalForeignTaxesPaid"/>
									<xsl:with-param name="BackupName">IRS1065BSchKTotalForeignTaxesPaid</xsl:with-param>
								</xsl:call-template>
        Paid
                        </label>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactions/TotalForeignTaxesPaid"/>
									<xsl:with-param name="BackupName">IRS1065BSchKTotalForeignTaxesPaid</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1px"/>
							<span style="width:3px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactions/TotalForeignTaxesAccrued"/>
									<xsl:with-param name="BackupName">IRS1065BSchKTotalForeignTaxesAccrued</xsl:with-param>
								</xsl:call-template>
         Accrued   
                        </label>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactions/TotalForeignTaxesAccrued"/>
									<xsl:with-param name="BackupName">IRS1065BSchKTotalForeignTaxesAccrued</xsl:with-param>
								</xsl:call-template>
							</input>
							<!--Dotted Line-->
							<!--<span class="styBoldText">
								<span style="width:16px"/>.
                            <span style="width:16px"/>.
                            <span style="width:16px"/>.
                            <span style="width:16px"/>.
                            <span style="width:16px"/>.
                            <span style="width:16px"/>.
                            <span style="width:16px"/>.
                            <span style="width:16px"/>.
                            <span style="width:16px"/>.
                            <span style="width:16px"/>.
                        </span>-->
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">14g</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactions/TotalForeignTaxes"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;float:left;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;">
							<span style="width:1mm"/>h
                    </div>
						<div class="styLNDesc" style="width:137mm;height:4mm;">
							<span  style="float:left;clear:none;">Reduction in taxes available for credit (attach schedule)
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactions/ReductionInTaxesAvailableForCr"/>
								</xsl:call-template>
							</span>
 					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">14h</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK/ForeignTransactions/ReductionInTaxesAvailableForCr"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm">
						<div style="width:187mm;float:left;">
							<div class="styLNLeftNumBox" style="height:4mm;">15<span style="width:2px;"/>
							</div>
							<div class="styLNDesc" style="width:137mm;height:4mm;">
								<span  style="float:left;clear:none;">Other items and amounts required to be reported separately to partners (attach schedule)
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleK"/>
									</xsl:call-template>
								</span>
						<!--Dotted Line-->
								<!--<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>-->
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;background:gray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;background:gray;border-bottom-width:0px;border-left-width:0px;"/>
						</div>
					</div>
					<div class="styBB" style="width:187mm">
						<div class="styPartDesc" style="width:187mm;">Analysis of Net Income (Loss)</div>
					</div>
					<div class="styBB" style="width:187mm;float:left;">
						<div class="styLNLeftNumBox" style="height:4mm;">1
                        <span style="width:6px;"/>
						</div>
						<div class="styLNDesc" style="width:137mm;height:4mm;">Net income (loss). In column (b), add lines 1c through 4b, 7, and 8. From the result, subtract line 14g
                        <span style="width:2px;"/>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0">1</div>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/AnalysisOfNetIncomeLoss/NetIncomeLoss"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm;float:left;border-bottom-width: 0px">
						<!--<div class="styBB" style="width:187mm;float:left;">-->
						<div class="styLNLeftNumBox" style="height:4mm;">2<span style="width:6px;"/>
						</div>
						<div class="styLNDesc" style="width:23mm;height:8mm;border-bottom-width:0">Analysis by partner type:				</div>
						<div class="styLNAmountBox" style="text-align:center;width:25mm;height:8mm">
							<span class="styBoldText">(i)</span> Corporate
                    </div>
						<div class="styLNAmountBox" style="text-align:center;width:25mm;height:8mm;">
							<span class="styBoldText">(ii)</span> Individual (active)
                    </div>
						<div class="styLNAmountBox" style="text-align:center;width:25mm;height:8mm;">
							<span class="styBoldText">(iii)</span> Individual (passive)
                    </div>
						<div class="styLNAmountBox" style="text-align:center;width:25mm;height:8mm;">
							<span class="styBoldText">(iv)</span> Partnership
                    </div>
						<div class="styLNAmountBox" style="text-align:center;width:25mm;height:8mm;">
							<span class="styBoldText">(v)</span> Exempt organization
                    </div>
						<div class="styLNAmountBox" style="text-align:center;width:31mm;height:8mm;">
							<span class="styBoldText">(vi)</span> Nominee/Other
                    </div>
					</div>
					<!--				<xsl:for-each select="$Form1065BData/AnalysisOfNetIncomeLoss/AnalysisPartnerTypeGenPartners"> -->
					<div class="styBB" style="width:187mm;float:left;border-bottom-width:0">
						<div class="styLNLeftLtrBox" style="height:4.5mm;">
							<span style="width:1mm"/>a
                        </div>
						<div class="styLNDesc" style="width:23mm;">General partners</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:right;font-size:6pt;width:25mm;border-bottom-width:1;padding-top:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/AnalysisOfNetIncomeLoss/AnalysisPartnerTypeGenPartners/Corporate"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:right;font-size:6pt;width:25mm;border-bottom-width:1;padding-top:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/AnalysisOfNetIncomeLoss/AnalysisPartnerTypeGenPartners/IndividualActive"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:right;font-size:6pt;width:25mm;border-bottom-width:1;padding-top:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/AnalysisOfNetIncomeLoss/AnalysisPartnerTypeGenPartners/IndividualPassive"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:right;font-size:6pt;width:25mm;border-bottom-width:1;padding-top:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/AnalysisOfNetIncomeLoss/AnalysisPartnerTypeGenPartners/Partnership"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:right;font-size:6pt;width:25mm;border-bottom-width:1;padding-top:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/AnalysisOfNetIncomeLoss/AnalysisPartnerTypeGenPartners/ExemptOrganization"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:right;font-size:6pt;width:31mm;border-bottom-width:1;padding-top:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/AnalysisOfNetIncomeLoss/AnalysisPartnerTypeGenPartners/NomineeOther"/>
							</xsl:call-template>
						</div>
					</div>
					<!--					</xsl:for-each>
					<xsl:for-each select="$Form1065BData/AnalysisOfNetIncomeLoss/AnalysisPartnerTypeLtdPartners"> -->
					<div class="styBB" style="width:187mm;float:left;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;">
							<span style="width:1mm"/>b
                        </div>
						<div class="styLNDesc" style="width:23mm;border-bottom-width:0">Limited partners</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:right;font-size:6pt;width:25mm;border-bottom-width:0;padding-top:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/AnalysisOfNetIncomeLoss/AnalysisPartnerTypeLtdPartners/Corporate"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:right;font-size:6pt;width:25mm;border-bottom-width:0;padding-top:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/AnalysisOfNetIncomeLoss/AnalysisPartnerTypeLtdPartners/IndividualActive"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:right;font-size:6pt;width:25mm;border-bottom-width:0;padding-top:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/AnalysisOfNetIncomeLoss/AnalysisPartnerTypeLtdPartners/IndividualPassive"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:right;font-size:6pt;width:25mm;border-bottom-width:0;padding-top:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/AnalysisOfNetIncomeLoss/AnalysisPartnerTypeLtdPartners/Partnership"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:right;font-size:6pt;width:25mm;border-bottom-width:0;padding-top:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/AnalysisOfNetIncomeLoss/AnalysisPartnerTypeLtdPartners/ExemptOrganization"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:right;font-size:6pt;width:31mm;border-bottom-width:0;padding-top:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BData/AnalysisOfNetIncomeLoss/AnalysisPartnerTypeLtdPartners/NomineeOther"/>
							</xsl:call-template>
						</div>
					</div>
					<!--				</xsl:for-each> -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;">
						<div style="float:right;">
							<span style="width:40px;"/>  
      Form <span class="styBoldText" style="font-size:8pt;">1065-B</span> (2010)
                    </div>
					</div>
					<!-- END Page Break and Footer-->
					<!-- Page Header -->
					<div class="styBB" style="width:187mm;">
						<div style="float:left;">Form 1065-B (2010)<span style="width:148mm;"/>
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
						<div class="styLNAmountBox" style="width:58mm;height:4.5mm;border-bottom-width:0px;border-left-width:0px"/>
						<div class="styLNAmountBox" style="text-align:center;border-bottom-width:0px;width:64mm;height:4.5mm;">Beginning of tax year</div>
						<div class="styLNAmountBox" style="text-align:center;border-bottom-width:0px;width:64mm;height:4.5mm;">End of tax year</div>
					</div>
					<!-- END Schedule L Title -->
					<!-- BEGIN Schedule L Line Items -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;"/>
						<div class="styGenericDiv" style="width:50mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:0px">Assets</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:center;font-weight:bold;">(a)</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:center;font-weight:bold;">(b)</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:center;font-weight:bold;">(c)</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:center;font-weight:bold;">(d)</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">1</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">
							<span  style="float:left;clear:none;">Cash</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...........</span>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/CashBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/CashEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;">2a</div>
						<div class="styLNDesc" style="width:50mm;height:5mm;">Trade notes and accounts receivable</div>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/TradeNotesAcctReceivableBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/TradeNotesAcctReceivableEOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;">b</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">
							<span  style="float:left;clear:none;">Less allowance for bad debts</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/BadDebtAllowanceBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/BadDebtAllowanceBOY2"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/BadDebtAllowanceEOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/BadDebtAllowanceEOY2"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">3</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">
							<span  style="float:left;clear:none;">Inventories</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........</span>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/InventoriesBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/InventoriesEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">4</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">
							<span  style="float:left;clear:none;">U.S. government obligations</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/USGovernmentObligationsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/USGovernmentObligationsEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">5</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;font-size:7pt;padding-top:1mm;">
							<span  style="float:left;clear:none;">Tax-exempt securities</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.....</span>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/TaxExemptSecuritiesBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/TaxExemptSecuritiesEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">6</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;padding-top:1mm;">
								Other current assets (<i>attach<br/> schedule</i>)
					<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">.........</span>
						</div>
						<div class="styShadingCell" style="height:8mm;"/>
						<div class="styLNFormLinkBox" style="height:8mm;padding-top:3.5mm">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherCurrentAssetsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:8mm;font-family:arial;font-size:8pt;padding-top:3.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherCurrentAssetsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:8mm;"/>
						<div class="styLNFormLinkBox" style="height:8mm;padding-top:3.5mm">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherCurrentAssetsEOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:8mm;font-family:arial;font-size:8pt;padding-top:3.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherCurrentAssetsEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 7-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="">7</div>
						<div class="styLNDesc" style="width:50mm;">
							<span  style="float:left;clear:none;">Mortgage and real estate loans</span>
				    <!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..</span>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/MortgageRealEstateLoansBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/MortgageRealEstateLoansEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 8-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5.5mm;">8</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">Other investments
                       (<i>attach schedule</i>)
                    </div>
						<div class="styShadingCell" style="height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;padding-top:1mm">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherInvestmentsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;padding-top:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherInvestmentsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5.5mm;font-family:arial;font-size:8pt;padding-top:1mm"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;padding-top:1mm">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherInvestmentsEOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;padding-top:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherInvestmentsEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 9a-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">9a</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;padding-top:1mm;">
							<span class="styLNDesc" style="width:50mm;height:4.5mm;">
								Buildings and other depreciable<br/> assets
					<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:.8mm;">..........</span>
							</span>
						</div>
						<div class="styLNAmountBox" style="height:9mm;font-family:arial;font-size:8pt;padding-top:4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/BldgOtherDepreciableAssetsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:9mm;"/>
						<div class="styLNAmountBox" style="height:9mm;font-family:arial;font-size:8pt;padding-top:4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/BldgOtherDepreciableAssetsEOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:9mm;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;">b</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">
							<span  style="float:left;clear:none;">Less accumulated depreciation</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/AccumulatedDepreciationBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/AccumulatedDepreciationBOY2"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/AccumulatedDepreciationEOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/AccumulatedDepreciationEOY2"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 10-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">10a</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">
							<span  style="float:left;clear:none;">Depletable assets</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">......</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/DepletableAssetsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/DepletableAssetsEOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;">
							<span style="width:1mm"/>b
                        </div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">
							<span  style="float:left;clear:none;">Less accumulated depletion</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/AccumulatedDepletionBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/AccumulatedDepletionBOY2"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/AccumulatedDepletionEOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/AccumulatedDepletionEOY2"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 11-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">11</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">
							<span  style="float:left;clear:none;">Land (net of any amortization)</span>
				    <!--Dotted Line-->
						    <span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..</span>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/LandBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/LandEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 12-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">12a</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">Intangible assets (amortizable only)
                    </div>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/IntangibleAssetsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/IntangibleAssetsEOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;">
							<span style="width:1mm"/>b
                        </div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">
							<span  style="float:left;clear:none;">Less accumulated amortization</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..</span>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/AccumulatedAmortizationBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/AccumulatedAmortizationBOY2"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/AccumulatedAmortizationEOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/AccumulatedAmortizationEOY2"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5.5mm;">13</div>
						<div class="styLNDesc" style="width:50mm;height:5.5mm;">
							<span  style="float:left;clear:none;">Other assets
                        (<i>attach schedule</i>)</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..</span>
						</div>
						<div class="styShadingCell" style="height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherAssetsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherAssetsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherAssetsEOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherAssetsEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 14-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">14</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">
							<span  style="float:left;clear:none;"><b>Total</b> assets</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........</span>
						</div>
						<div class="styShadingCell" style="height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/TotalAssetsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/TotalAssetsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/TotalAssetsEOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/TotalAssetsEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;"/>
						<div class="styGenericDiv" style="width:50mm;height:4.5mm;text-align:center;">
							<b>Liabilities and Capital</b>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styShadingCell" style="height:4.5mm;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">15</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">
							<span  style="float:left;clear:none;">Accounts payable</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">......</span>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/AccountsPayableBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/AccountsPayableEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7mm;">16</div>
						<div class="styLNDesc" style="width:50mm;height:7mm;">
							Mortgages, notes, bonds payable in<br/> less than 1 year
					<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.......</span>
						</div>
						<div class="styShadingCell" style="height:7.5mm;"/>
						<div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/ShortTermPayableBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:7.5mm;"/>
						<div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/ShortTermPayableEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 17-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5.5mm;">17</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">
							Other current liabilities (<i>attach<br/> schedule</i>)
					<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">.........</span>
						</div>
						<div class="styShadingCell" style="height:9mm;"/>
						<div class="styLNFormLinkBox" style="height:9mm;padding-top:4.5mm">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherCurrentLiabilitiesBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:9mm;font-family:arial;font-size:8pt;padding-top:4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherCurrentLiabilitiesBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:9mm;"/>
						<div class="styLNFormLinkBox" style="height:9mm;padding-top:4.5mm">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherCurrentLiabilitiesEOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:9mm;font-family:arial;font-size:8pt;padding-top:4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherCurrentLiabilitiesEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">18</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">
							<span  style="float:left;clear:none;">All nonrecourse loans</span>
				    <!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.....</span>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/NonrecourseLoansBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/NonrecourseLoansEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7mm;">19</div>
						<div class="styLNDesc" style="width:50mm;height:7mm;">
                        Mortgages, notes, bonds payable in 1<br/> year or more
				    <!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">........</span>
						</div>
						<div class="styShadingCell" style="height:7.5mm;"/>
						<div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/LongTermPayableBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:7.5mm;"/>
						<div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/LongTermPayableEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5.5mm;">20</div>
						<div class="styLNDesc" style="width:50mm;height:5.5mm;">
							<span  style="float:left;clear:none;">Other liabilities
                        (<i>attach schedule</i>)</span>
				    <!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..</span>
						</div>
						<div class="styShadingCell" style="height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherLiabilitiesBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherLiabilitiesBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherLiabilitiesEOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/OtherLiabilitiesEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">21</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">
							<span  style="float:left;clear:none;">Partners' capital accounts</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/PartnersCapitalAccountsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/PartnersCapitalAccountsEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">22</div>
						<div class="styGenericDiv" style="width:50mm;height:4.5mm;padding-top:1mm;">
							<span  style="float:left;clear:none;"><b>Total</b> liabilities and capital</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/TotalLiabilitiesCapitalBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065BScheduleL/TotalLiabilitiesCapitalEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END Schedule L Line Items -->
					<br style="page-break-after:always;"/>
					<!-- BEGIN Schedule M-1 Title -->
					<div class="styBB" style="width:187mm;">
					  <div class="styGenericDiv" style="width:28mm;height:7mm;padding-top:1.5mm;">
						<div class="styPartName" style="width:28mm;height:2mm;">Schedule M-1</div>
					  </div>	
						<div class="styPartDesc" style="width:158mm;">Reconciliation of Income (Loss) per Books With Income (Loss) per Return<br/>
							<span style="font-weight:normal">
								<b>Note.</b> Schedule M-3 may be required instead of Schedule M-1 (see instructions).
                        </span>
						</div>
					</div>
					<!-- END Schedule M-1 Title -->
					<!-- BEGIN Schedule M-1 Line Items -->
					<div class="styBB" style="width:187mm;clear:both;">
						<!-- BEGIN Left Side Table of Schedule M-1-->
						<table class="styTable" style="width:93mm;float:left;font-size:7pt;" cellspacing="0">
							<thead/>
							<tfoot/>
							<tbody>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBox" style="height:4.5mm;width:5mm;padding-left:.5mm;">1</td>
									<td class="styGenericDiv" style="width:54mm;height:4.5mm;" colspan="2">
										<span  style="float:left;clear:none;">Net income (loss) per books</span>
							   <!--Dotted Line-->
									   <span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>
									</td>
									<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM1/NetIncomeLossPerBooks"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBox" style="width:5mm;padding-left:.5mm;vertical-align:top;">2</td>
									<td class="styGenericDiv" style="width:54mm;" colspan="2">
										 Income included on Schedule K, lines 1c through 4b, and 8, not recorded on 
									</td>
									<td class="styLNAmountBoxNBB" style="border-right-width:1px;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBox" style="height:4.5mm;width:5mm;padding-left:.5mm;">
										
									</td>
									<td class="styGenericDiv" style="width:54mm;height:4.5mm;" colspan="2">
										<div class="styGenericDiv" style="width:42mm;">books this year (itemize):
                                       <xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1065BScheduleM1/TotalTaxableIncomeNotRecOnBks"/>
											</xsl:call-template>
											<span style="width:1.5mm;"/>
										</div>
										<div class="styIRS1065BBText" style="width:8mm;float:left;text-align:right;font-size:6pt;padding-top:0mm">
											<span style="width:1px;"/>
										</div>
										<div class="styIRS1065BBText" style="width:50mm;float:left;text-align:right;font-size:6pt;">
											<span style="width:1px;"/>
										</div>
									</td>
									<td class="styLNAmountBox" style="border-bottom-width:1px;border-right-width:1px;padding-top:2mm">
										<!--<xsl:attribute name="style">border-right-width:1px;width:30mm;</xsl:attribute>-->
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM1/TotalTaxableIncomeNotRecOnBks"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBox" style="width:5mm;padding-left:.5mm;vertical-align:center;">3</td>
									<td class="styGenericDiv" style="width:54mm;" colspan="2">
										<span  style="float:left;clear:none;">Guaranteed payments</span>
							    <!--Dotted Line-->
									    <span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.....</span>
									</td>
									<td class="styLNAmountBox" style="border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM1/GuaranteedPayments"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBox" style="width:5mm;padding-left:.5mm;vertical-align:top;">4</td>
									<td class="styGenericDiv" style="width:54mm;height:4.5mm;" colspan="2">
             Expenses recorded on books this year not
included on Schedule K, lines 1c through
4b, and 14g (itemize):
                                    <xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM1/ExpensesRecOnBksNotIncluded"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxNBB" style="border-right-width:1px;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width:5mm;padding-left:2mm;">a</td>
									<td class="styGenericDiv" style="width:54mm;height:4mm;" colspan="2">
										<div class="styGenericDiv" style="width:22mm;height:4mm;">Depreciation $
                                    </div>
										<div class="styIRS1065BBText" style="width:28mm;float:left;text-align:right;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065BScheduleM1/DepreciationExpenses"/>
											</xsl:call-template>

										</div>
									</td>
									<td class="styLNAmountBoxNBB" style="border-right-width:1px;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<!--<tr>-->
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBox" style="width:5mm;padding-left:2mm;">b</td>
									<td class="styGenericDiv" style="width:54mm;" colspan="2">
										<div class="styGenericDiv" style="width:22mm;height:5.5mm;">Travel and entertainment $
                                    </div>
										<div class="styIRS1065BBText" style="width:28mm;float:left;text-align:right;font-size:6pt;height:5.5mm;padding-top:2mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065BScheduleM1/TravelEntertainment"/>
											</xsl:call-template>

										</div>

									</td>
									<td class="styLNAmountBoxNBB" style="border-right-width:1px;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<!--                          <tr class="styGenericDiv" style="height:4.5mm;">
                                <td class="styLNLeftNumBox" style="height:4.5mm;">
                                    <span style="width:1px;"/>
                                </td>
                                <td class="styGenericDiv" style="width:52mm;height:4.5mm;padding-right:.5mm;" colspan="2">
                                    <div class="styIRS1065BBText" style="width:51.5mm;padding-right:3mm;height:4.5mm;">
                                        <span style="width:1px;"/>
                                    </div>
                                    <div class="styIRS1065BBText" style="width:51.5mm;padding-right:3mm;height:4.5mm;">
                                        <span style="width:1px;"/>
                                    </div>
                                </td>
                                <td class="styLNAmountBoxNBB" style="border-right-width:1px;width:31mm;">
                                    <span style="width:1px;"/>
                                </td>
                            </tr>-->
								<tr class="styGenericDiv" >
									<td class="styLNLeftNumBox" style="width:5mm;padding-left:.5mm;">
									</td>
									<td class="styGenericDiv" style="width:54mm;padding-right:.5mm;" colspan="2">
										<div class="styIRS1065BBText" style="width:51mm;text-align:right;font-size:6pt;"/>
										<div class="styIRS1065BBText" style="width:51mm;text-align:right;font-size:6pt;"/>
										<div class="styIRS1065BBText" style="width:51mm;text-align:right;font-size:6pt;"/>
										<div class="styIRS1065BBText" style="width:51mm;text-align:right;font-size:6pt;"/>
										<!--<xsl:attribute name="style">width:51.5mm;text-align:left;</xsl:attribute>-->
										
									</td>
									<td class="styLNAmountBox" style="border-bottom-width:1px;border-right-width:1px;padding-top:12mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM1/ExpensesRecOnBksNotIncluded"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!--<tr>-->
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBox" style="width:5mm;padding-left:.5mm;">5</td>
									<td class="styGenericDiv" style="height:4.5mm;width:54mm;" colspan="2">
										<span  style="float:left;clear:none;">Add lines 1 through 4</span>
								    <!--Dotted Line-->
											<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">......</span>
									</td>
									<td class="styLNAmountBoxNBB" style="border-right-width:1px;padding-top:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM1/LossTotal"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
							</tbody>
						</table>
						<!-- END Left Side table of Schedule M-1-->
						<!-- BEGIN Right Side table of Schedule M-1-->
						<table class="styTable" style="width:94mm;float:left;font-size:7pt;" cellspacing="0">
							<thead/>
							<tfoot/>
							<tbody>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBox" style="height:4.5mm;width:5mm;padding-left:.5mm;vertical-align:top;">6</td>
									<td class="styGenericDiv" style="width:54mm;height:4.5mm;" colspan="2">
            Income recorded on books this year not
included on Schedule K, lines 1c through
4b, and 8 (itemize):
                                    <xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM1/TotalIncomeRecordedNotIncluded"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxNBB" style="">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftLtrBox" style="width:5mm;padding-left:2mm;">a</td>
									<td class="styGenericDiv" style="width:54mm;height:4mm;" colspan="2">
										<div class="styGenericDiv" style="width:30mm;height:4mm;">
											<span class="stySmallText">Tax-exempt interest $
										</span>
										</div>
										<div class="styIRS1065BBText" style="width:22mm;font-size:6pt;float:left;text-align:right;font-family:verdana;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065BScheduleM1/TaxExemptInterest"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="styLNAmountBoxNBB" style="">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBox" style="width:5mm;padding-left:.5mm;"/>
									<td class="styGenericDiv" style="width:54mm;padding-right:.5mm;" colspan="2">
										<div class="styIRS1065BBText" style="width:51mm;text-align:left;font-size:6pt;"/>
										<div class="styIRS1065BBText" style="width:51mm;text-align:left;font-size:6pt;"/>
									</td>
									<td class="styLNAmountBox" style="border-bottom-width:1px;padding-top:2mm;">
										<!--<xsl:attribute name="style">width:31mm;</xsl:attribute>-->
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM1/TotalIncomeRecordedNotIncluded"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBox" style="height:4.5mm;width:5mm;padding-left:.5mm;vertical-align:top;">7</td>
									<td class="styGenericDiv" style="width:54mm;height:4.5mm;" colspan="2">
            Deductions included on Schedule K, lines 1c
through 4b, and 14g, not charged against book
income this year (itemize):
                                    <xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM1/TotalDeductionsNotCharged"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxNBB" style="">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBox" style="width:5mm;padding-left:2mm;">a</td>
									<td class="styGenericDiv" style="width:54mm;height:4mm;" colspan="2">
										<div class="styGenericDiv" style="width:20mm;height:4mm;">Depreciation $</div>
										<div class="styIRS1065BBText" style="width:32mm;font-size:6pt;float:left;text-align:right;font-family:verdana;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065BScheduleM1/DepreciationDeduction"/>
											</xsl:call-template>
										</div>	
									</td>
									<td class="styLNAmountBoxNBB" style="">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBox" style="width:5mm;padding-left:.5mm;"/>
									<td class="styGenericDiv" style="width:54mm;padding-right:.5mm;" colspan="2">
										<div class="styIRS1065BBText" style="width:51mm;text-align:left;font-size:6pt;"/>
										<div class="styIRS1065BBText" style="width:51mm;text-align:left;font-size:6pt;"/>
										<div class="styIRS1065BBText" style="width:51mm;text-align:left;font-size:6pt;"/>
										<div class="styIRS1065BBText" style="width:51mm;text-align:left;font-size:6pt;"/>
									</td>
									<td class="styLNAmountBox" style="border-bottom-width:1px;padding-top:4mm;">
										<!--<xsl:attribute name="style">width:31mm;</xsl:attribute>-->
										<br/>
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM1/TotalDeductionsNotCharged"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBox" style="width:5mm;padding-left:.5mm;">8</td>
									<td class="styGenericDiv" style="width:54mm;height:4mm;" colspan="2">
										<span  style="float:left;clear:none;">Add lines 6 and 7</span>
									<!--Dotted Line-->
											<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">......</span>
									</td>
									<td class="styLNAmountBox" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM1/IncomeDeductionsSubtotal"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBox" style="height:5mm;width:5mm;padding-left:.5mm;vertical-align:top;">9</td>
									<td class="styGenericDiv" style="width:54mm;height:5mm;font-size:6pt;" colspan="2">
									    Income (loss). (Analysis of Net Income
										(Loss), line 1.) Subtract line 8 from line 5
									</td>
									<td class="styLNAmountBox" style="height:5mm;border-bottom-width:0px;padding-top:2.3mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM1/NetIncome"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
							</tbody>
						</table>
						<!-- END Right Side Table of Schedule M-1-->
					</div>
					<!-- BEGIN Schedule M-2 Title -->
					<div class="styBB" style="width:187mm;">
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
					<div class="styBB" style="width:187mm;clear:both;">
						<!-- BEGIN Left Side Table of Schedule M-2-->
						<table class="styTable" style="width:93mm;float:left;font-size:7pt;" cellspacing="0">
							<thead/>
							<tfoot/>
							<tbody>
								<!--line 1-->
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBox" style="width:6.5mm;padding-left:.5mm;">1</td>
									<td class="styGenericDiv" style="width:54mm;height:4.5mm;" colspan="2">
										<span  style="float:left;clear:none;">Balance at beginning of year</span>
								<!--Dotted Line-->
										<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>
									</td>
									<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM2/BalanceBOY"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBox" style="width:6.5mm;padding-left:.5mm;">2</td>
									<td class="styGenericDiv" style="width:54mm;height:4.5mm;" colspan="2">
										<div class="styGenericDiv" style="width:28mm;height:4.5mm;font-size:7pt;">
											Capital Contributed:
										</div>
										<div class="styGenericDiv" style="width:22mm;height:4.5mm;">
											<span class="styBoldText">a</span>
											<span style="width:4px"/>Cash
									<!--Dotted Line-->
												<span class="styDotLn" style="float:none;padding-left:2mm;">...</span>
										</div>	
								</td>			
										<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM2/CashCapitalContributed"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBox" style="width:6.5mm;padding-left:.5mm;"/>
									<td class="styGenericDiv" style="width:54mm;height:4.5mm;" colspan="2">
										<div class="styGenericDiv" style="width:28mm;height:4.5mm;"/>
										<div class="styGenericDiv" style="width:22mm;height:4.5mm;">
											<span class="styBoldText">b</span>
											<span style="width:4px"/>Property
									<!--Dotted Line-->
												<span class="styDotLn" style="float:none;padding-left:1.8mm;">..</span>
										</div>
									</td>
									<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM2/PropertyCapitalContributed"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBox" style="width:6.5mm;padding-left:.5mm;">3</td>
									<td class="styGenericDiv" style="width:54mm;height:4.5mm;" colspan="2">
										<span  style="float:left;clear:none;">Net income (loss) per books</span>
								<!--Dotted Line-->
										<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>
									</td>
									<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM2/NetIncomeLossPerBooks"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBox" style="width:6.5mm;padding-left:.5mm;">4</td>
									<td class="styLNDesc" style="width:54mm;height:4.5mm;vertical-align:bottom;padding-top:1.5mm;" colspan="2">
										<div class="styGenericDiv" style="width:40mm;">
											<span  style="float:left;clear:none;">Other increases (itemize):
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$Form1065BScheduleM2/TotalOtherIncreases"/>
												</xsl:call-template>
											</span>	
										</div>
										<div class="styIRS1065BBText" style="width:10mm;float:left;"/>
									</td>
									<td class="styLNAmountBoxNBB" style="border-right-width:1px;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBox" style="width:6.5mm;padding-left:.5mm;"/>
									<td class="styGenericDiv" style="width:54mm;height:4.5mm;padding-right:2mm;" colspan="2">
										<div class="styIRS1065BBText" style="width:51mm;text-align:left;font-size:6pt;"/>
									</td>
									<td class="styLNAmountBox" style="border-bottom-width:1px;border-right-width:1px;">
										<!--<xsl:attribute name="style">border-right-width:1px;width:32mm;</xsl:attribute>-->
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM2/TotalOtherIncreases"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBox" style="width:6.5mm;padding-left:.5mm;">5</td>
									<td class="styGenericDiv" style="width:54mm;height:4.5mm;" colspan="2">
										<span  style="float:left;clear:none;">Add lines 1 through 4</span>
									<!--Dotted Line-->
											<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.....</span>
									</td>
									<td class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM2/BalanceIncomeOtherIncreases"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
							</tbody>
						</table>
						<!-- END Left Side Table of Schedule M-2-->
						<!-- BEGIN Right Side Table of Schedule M-2-->
						<table class="styTable" style="width:94mm;float:left;font-size:7pt;" cellspacing="0">
							<thead/>
							<tfoot/>
							<tbody>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBox" style="width:6.5mm;padding-left:.5mm;">6</td>
									<td class="styGenericDiv" style="width:54mm;height:4.5mm;" colspan="2">
									<div class="styGenericDiv" style="width:21mm;height:4.5mm;">Distributions:</div>
										<div class="styGenericDiv" style="width:30mm;height:4.5mm;">
											<span class="styBoldText">a</span>
											<span style="width:4px"/>Cash
									<!--Dotted Line-->
												<span class="styDotLn" style="float:none;padding-left:2mm;">.....</span>
										</div>	
								</td>			
									<td class="styLNAmountBox" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM2/CashDistribution"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBox" style="width:6.5mm;padding-left:.5mm;"/>
									<td class="styGenericDiv" style="width:54mm;height:4.5mm;" colspan="2">
										<div class="styGenericDiv" style="width:21mm;height:4.5mm;"/>
										<div class="styGenericDiv" style="width:30mm;height:4.5mm;">
											<span class="styBoldText">b</span>
											<span style="width:4px"/>Property
									<!--Dotted Line-->
												<span class="styDotLn" style="float:none;padding-left:1.8mm;">....</span>
										</div>
									</td>
									<td class="styLNAmountBox" style="height:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM2/PropertyDistribution"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBox" style="width:6.5mm;padding-left:.5mm;">7</td>
									<td class="styLNDesc" style="width:54mm;height:5mm;vertical-align:bottom;padding-top:1.5mm;" colspan="2">
										<div class="styGenericDiv" style="width:40mm;">
											<span  style="float:left;clear:none;">Other decreases (itemize):
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$Form1065BScheduleM2/TotalOtherDecreases"/>
												</xsl:call-template>
											</span>	
										</div>
										<div class="styIRS1065BBText" style="width:12mm;float:left;"/>
									</td>
									<td class="styLNAmountBoxNBB" style="">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv" style="height:5mm;">
									<td class="styLNLeftNumBox" style="width:6.5mm;padding-left:.5mm;"/>
									<td class="styGenericDiv" style="width:54mm;height:5mm;padding-right:2mm;" colspan="2">
										<div class="styIRS1065BBText" style="width:52mm;text-align:left;font-size:6pt;"/>
									</td>
									<td class="styLNAmountBox" style="border-bottom-width:1px;">
										<!--<xsl:attribute name="style">width:31mm;</xsl:attribute>-->
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM2/TotalOtherDecreases"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBox" style="width:6.5mm;padding-left:.5mm;">8</td>
									<td class="styGenericDiv" style="width:54mm;height:5mm;" colspan="2">
										<span  style="float:left;clear:none;">Add lines 6 and 7</span>
								<!--Dotted Line-->
										<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.......</span>
									</td>
									<td class="styLNAmountBox" style="height:5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM2/Total"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBox" style="width:6.5mm;padding-left:.5mm;vertical-align:top;">9</td>
									<td class="styGenericDiv" style="width:54mm;height:7mm;font-size:7pt;" colspan="2">Balance at end of year. Subtract line 8 from line 5</td>
									<td class="styLNAmountBox" style="height:7.5mm;border-bottom-width:0px;padding-top:3mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BScheduleM2/BalanceEOY"/>
										</xsl:call-template>
										<span style="width:1px;"/>
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
					<div class="pageEnd" style="width:187mm;">
						<div style="width:100mm;float:left;">
							<span style="width:90mm;"/>
						</div>
						<div style="float:right;">
							<span style="width:80px;"/> Form 
                        <span class="styBoldText" style="font-size:8pt;">1065-B</span> (2010)
                    </div>
					</div>
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

						<xsl:if test="$Form1065BData/Section761aElection">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1065BData/Section761aElection"/>
											<xsl:with-param name="BackupName">Section761aElection</xsl:with-param>
										</xsl:call-template>
              Form 1065-B, Top Left Margin - Section 761(a) election:
                                </label>
								</td>
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1065BData/Section761aElection"/>
											<xsl:with-param name="BackupName">Section761aElection</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</xsl:if>
						
						<xsl:if test="$Form1065BData/CommonTrust">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1065BData/CommonTrust"/>
											<xsl:with-param name="BackupName">CommonTrust</xsl:with-param>
										</xsl:call-template>
              Form 1065-B, Top Left Margin - Common Trust:
                                </label>
								</td>
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1065BData/CommonTrust"/>
											<xsl:with-param name="BackupName">CommonTrust</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</xsl:if>
						
						<xsl:if test="$Form1065BData/Nominee">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1065BData/Nominee"/>
											<xsl:with-param name="BackupName">Nominee</xsl:with-param>
										</xsl:call-template>
              Form 1065-B, Top Left Margin - Nominee:
                                </label>
								</td>
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1065BData/Nominee"/>
											<xsl:with-param name="BackupName">Nominee</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</xsl:if>
						
						<xsl:if test="$Form1065BData/IRC6114">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1065BData/IRC6114"/>
											<xsl:with-param name="BackupName">IRC6114</xsl:with-param>
										</xsl:call-template>
              Form 1065-B, Top Left Margin - IRC 6114:
                                </label>
								</td>
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1065BData/IRC6114"/>
											<xsl:with-param name="BackupName">IRC6114</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</xsl:if>
						
						<xsl:if test="$Form1065BData/SupersededReturn" >
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1065BData/SupersededReturn"/>
											<xsl:with-param name="BackupName">IRS1065BSupersededReturn</xsl:with-param>
										</xsl:call-template>
											 G(5) Superseded Returns:
									</label>
								</td>
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1065BData/SupersededReturn"/>
											<xsl:with-param name="BackupName">IRS1065BSupersededReturn</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</xsl:if>
						
						<xsl:if test="$Form1065BData/Taxes/@section453ACIntrest">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1065BData/Taxes/@section453ACIntrest"/>
											<xsl:with-param name="BackupName">SECTION 453AC Interest</xsl:with-param>
										</xsl:call-template>
											Part I  Line 26 - Section 453AC Interest:
                                </label>
								</td>
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065BData/Taxes/@section453ACIntrest"/>
										<xsl:with-param name="BackupName">SECTION 453AC Interest</xsl:with-param>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						
						<xsl:if test="$Form1065BData/Taxes/@section453I3Interest">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1065BData/Taxes/@section453I3Interest"/>
											<xsl:with-param name="BackupName">SECTION 453I3 Interest</xsl:with-param>
										</xsl:call-template>
											Part I  Line 26 - Section 453I3 Interest:
                                </label>
								</td>
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065BData/Taxes/@section453I3Interest"/>
										<xsl:with-param name="BackupName">SECTION 453I3 Interest</xsl:with-param>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						
						<xsl:if test="$Form1065BData/IRS1065BScheduleB/NumberOfForms8865Attached">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleB/NumberOfForms8865Attached"/>
											<xsl:with-param name="BackupName">Number of Form 8865 attached</xsl:with-param>
										</xsl:call-template>
										SchB Line 9 - Number of IRS8865 Forms attached:
                                </label>
								</td>
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleB/NumberOfForms8865Attached"/>
										<xsl:with-param name="BackupName">Number of Form 8865 attached</xsl:with-param>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
					</table>

          <!-- Begin Separated Repeating data table for Special Condition Description-->
            <xsl:if test="$Form1065BData/SpecialConditionDescription">
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
                     <xsl:for-each select="$Form1065BData/SpecialConditionDescription">
                        <tr style="border-color:black;height:6mm;">
                           <xsl:attribute name="class">
                              <xsl:choose>
                                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                              </xsl:choose>
                           </xsl:attribute>
                           <td class="styTableCellText" style="width:91.5mm;">
                              <div style="width:6.5mm;" class="styGenericDiv">
                                 <div style="width:6mm;font-weight:bold;float:right;clear:none;" >
                                    <span class="styBoldText" style="float:right;text-align:right;padding-right:2mm;">
                                       <xsl:value-of select="position()" />
                                    </span>
                                 </div>
                              </div>
                              <div style="width:80mm;float:none;clear:none;">
                                   <xsl:variable name="pos" select="position()"/>
								   <xsl:call-template name="PopulateText">
										 <xsl:with-param name="TargetNode" select="$Form1065BData/SpecialConditionDescription[$pos]" />
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

	<xsl:if test="((count($Form1065BData/IRS1065BScheduleD/AssetsHeld1YearOrLess) &gt; 4) or
					  (count($Form1065BData/IRS1065BScheduleD/AssetsHeldMoreThan1Year) &gt; 4)) 
					  and ($Print = $Separated)">
		   <div class="pageEnd" />
	</xsl:if>				
					<xsl:if test="(count($Form1065BData/IRS1065BScheduleD/AssetsHeld1YearOrLess) &gt; 4) and ($Print = $Separated)">
						<div class="styBB" style="width:187mm;">
							<div class="styPartDesc" style="width:182mm;text-align:left;">
             Part I—Short-Term Capital Gains and Losses—Assets Held 1 Year or Less
                        </div>
						</div>
						<table class="styDepTbl" cellspacing="0">
							<thead class="styTableThead" style="font-size:7pt">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:3mm;border-right-width:0px;" scope="col"/>
									<th class="styDepTblCell" style="width:2mm;border-right-width:0px;" scope="col"/>
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
								<xsl:for-each select="$Form1065BData/IRS1065BScheduleD/AssetsHeld1YearOrLess">
									<tr style="border-color:black">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCell" style="width:3mm;text-align:left;border-right-width:0px;font-weight:bold;vertical-align:top;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1065BData/IRS1065BScheduleD/AssetsHeld1YearOrLess"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:2mm;text-align:left;border-right-width:0px;font-weight:bold;vertical-align:top;">
											<xsl:if test="position() = 1">1<br/>
											</xsl:if>
										</td>
										<td class="styTableCell" style="text-align:left;width:40mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DescriptionOfProperty"/>
											</xsl:call-template>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="DescriptionOfProperty"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellText" style="width:20mm;text-align:center;">
											<span style="width:1px;"/>
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="DateAcquired"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="width:20mm;text-align:center;">
											<span style="width:1px;"/>
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="DateSold"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:32mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SalesPrice"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:5mm;border-right-width:0px;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:32mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GainOrLoss"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<br/>
					<xsl:if test="(count($Form1065BData/IRS1065BScheduleD/AssetsHeldMoreThan1Year) &gt; 4) and ($Print = $Separated)">
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
								<xsl:for-each select="$Form1065BData/IRS1065BScheduleD/AssetsHeldMoreThan1Year">
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
												<xsl:with-param name="TargetNode" select="DescriptionOfProperty"/>
											</xsl:call-template>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DescriptionOfProperty"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellText" style="width:20mm;text-align:center;">
											<span style="width:1px;"/>
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="DateAcquired"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="width:20mm;text-align:center;">
											<span style="width:1px;"/>
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="DateSold"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:32mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SalesPrice"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:5mm;border-right-width:0px;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:32mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GainOrLoss"/>
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
