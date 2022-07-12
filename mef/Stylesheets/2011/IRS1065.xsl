<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Eugenia McDonald on 01/18/2012 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1065Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form1065Data" select="$RtnDoc/IRS1065"/>
	<xsl:param name="Form1065ScheduleA" select="$RtnDoc/IRS1065/IRS1065ScheduleA"/>
	<xsl:param name="Form1065ScheduleB" select="$RtnDoc/IRS1065/IRS1065ScheduleB"/>
	<xsl:param name="Form1065ScheduleK" select="$RtnDoc/IRS1065/IRS1065ScheduleK"/>
	<xsl:param name="Form1065ScheduleL" select="$RtnDoc/IRS1065/IRS1065ScheduleL"/>
	<xsl:param name="Form1065ScheduleM1" select="$RtnDoc/IRS1065/IRS1065ScheduleM1"/>
	<xsl:param name="Form1065ScheduleM2" select="$RtnDoc/IRS1065/IRS1065ScheduleM2"/>
	<xsl:template match="/">
		<html lang="EN-US">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form1065Data)"/>
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
				<meta name="Description" content="IRS Form 1065"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1065Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form1065">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:31mm;height:19mm;">
      Form 
            <span class="styFormNumber">1065</span>
							<br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065Data"/>
							</xsl:call-template>
							<span style="width:3px;"/>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1065, Top Left Margin - Special Condition Description
								</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1065Data/SpecialConditionDescription"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1065, Top Left Margin - Section 761(a) election</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1065Data/Section761aElection"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1065, Top Left Margin - Common Trust</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1065Data/CommonTrust"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1065, Top Left Margin - Nominee</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1065Data/Nominee"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1065, Top Left Margin - IRC 6114</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1065Data/IRC6114"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1065, Top Left Margin - Three And One Half Pct
								  Gross Income Tax</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1065Data/ThreeAndOneHalfPctGrsIncomeTax"/>
							</xsl:call-template>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:125mm;height:19mm;">
							<div class="styMainTitle" style="height:8mm;">U.S. Return of Partnership Income</div>
							<div class="styFST" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;">
        For calendar year 2011, 
                <!--<span style="width: 18mm;">
									<xsl:call-template name="PopulateReturnHeaderTaxYear"/>
								</span>-->
        or tax year beginning
                <span style="width: 17mm;border-bottom:1 solid black;">
									<!-- No need to send the parameters -->
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
								</span>,  
        ending 
                <span style="width: 17mm;border-bottom:1 solid black;">
									<!-- No need to send the parameters -->
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
								</span>
								<br/>
								<span style="text-align:center;">
									<img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MediumBullet"/> 
          See separate instructions.
                </span>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:19mm;">
							<div class="styOMB" style="height:2mm;">OMB No. 1545-0099</div>
							<div class="styTY" style="height:11mm;">20<span class="styTYColor">11</span>
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
										<xsl:with-param name="TargetNode" select="$Form1065Data/PrincipalBusinessActivity"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styEINDateAssets" style="width:37mm;height:11mm;">
								<span class="styBoldText">B</span> Principal product or service
                <br/>
								<span class="styEINFld">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065Data/PrincipalProductOrService"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styEINDateAssets" style="width:37mm;height:8.5mm;border-bottom-width:1px;border-right-width:1px;">
								<span class="styBoldText">C </span>Business code number<br/>
								<br/>
								<span class="styEINFld">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065Data/BusinessCodeNumber"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- return header address box -->
						<div class="styLblNameAddr" style="width:106mm;height:29mm;">
							<div class="styUseLbl" style="width:15mm;height:29mm;border-right-width:0px;font-size:6pt;
							  padding-top:3mm">
							   <br/><br/><br/><span style="width:3.5mm"/>Print<br/><span style="width:5.5mm"/>or 
							   <br/><span style="width:3.5mm"/>type.
                            </div>
							<div class="styNameAddr" style="width:89mm;height:10mm;font-size:8px;border-left-width:1px;padding-left:1px;">
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
							<div class="styNameAddr" style="width:89mm;height:10mm;border-left-width:1px;">
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
							<div class="styNameAddr" style="border-bottom-width:0px;width:89mm;height:9mm;border-left-width:1px;">
        City or town, state, and ZIP code<br/>
								<span class="stySmallText" style="width:87mm;padding-left:2mm;">
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
						<div class="styEINDateAssets" style="width:44mm;height:11mm;">
							<span class="styBoldText">E </span>
      Date business started
            <br/>
							<br/>
							<br/>
							<span class="styEINFld">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form1065Data/DateBusinessStarted"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styEINDateAssets" style="width:44mm;height:8.5mm;border-bottom-width:1px;">
							<span class="styBoldText">F </span>Total assets (see the instructions)<br/>
							<br/><span style="float:left;padding-left:2mm">$</span>
							<span style="float:right">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/TotalAssets"/>
								</xsl:call-template>
							</span>
						</div>
						<br/>
					</div>
					<div class="styNBB" style="width:187mm;">
						<div class="styBoldText" style="width:6mm;float:left;clear:none;padding-left:2mm;">G</div>
						<div class="styGenericDiv" style="width:178mm;">
      Check applicable boxes: <span style="width:5px;"/>
							<span class="styBoldText">(1)</span>
							<span style="width:1px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065Data/InitialReturn"/>
									<xsl:with-param name="BackupName">IRS1065InitialReturn</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065Data/InitialReturn"/>
									<xsl:with-param name="BackupName">IRS1065InitialReturn</xsl:with-param>
								</xsl:call-template>
         Initial return
            </label>
							<span style="width:1px"/>
							<span class="styBoldText">(2)</span>
							<span style="width:1px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065Data/FinalReturn"/>
									<xsl:with-param name="BackupName">IRS1065FinalReturn</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065Data/FinalReturn"/>
									<xsl:with-param name="BackupName">IRS1065FinalReturn</xsl:with-param>
								</xsl:call-template>
         Final return
            </label>
							<span style="width:1px"/>
							<span class="styBoldText">(3)</span>
							<span style="width:3px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065Data/NameChange"/>
									<xsl:with-param name="BackupName">IRS1065NameChange</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065Data/NameChange"/>
									<xsl:with-param name="BackupName">IRS1065NameChange</xsl:with-param>
								</xsl:call-template>
         Name Change
            </label>
							<span style="width:1px"/>
							<span class="styBoldText">(4)</span>
							<span style="width:1px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065Data/AddressChange"/>
									<xsl:with-param name="BackupName">IRS1065AddressChange</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065Data/AddressChange"/>
									<xsl:with-param name="BackupName">IRS1065AddressChange</xsl:with-param>
								</xsl:call-template>
         Address Change
            </label>
							<span style="width:1px"/>
							<span class="styBoldText">(5)</span>
							<span style="width:1px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065Data/AmendedReturn"/>
									<xsl:with-param name="BackupName">IRS1065AmendedReturn</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065Data/AmendedReturn"/>
									<xsl:with-param name="BackupName">IRS1065AmendedReturn</xsl:with-param>
								</xsl:call-template>
         Amended return
            </label>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065Data/AmendedReturn"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styNBB" style="width:187mm;">
						<div class="styBoldText" style="width:6mm;float:left;clear:none;padding-left:3mm;"/>
						<div class="styGenericDiv" style="width:178mm;">
							<span style="width:32mm;"/>
							<span class="styBoldText">(6)</span>
							<span style="width:1px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065Data/TechTermination"/>
									<xsl:with-param name="BackupName">IRS1065TechTermination</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065Data/TechTermination"/>
									<xsl:with-param name="BackupName">IRS1065TechTermination</xsl:with-param>
								</xsl:call-template>
       Technical termination - also check (1) or (2)
                            </label>
                            <span style="width:2mm;"/>
							<span class="styBoldText">(7)</span>
							<span style="width:1px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065Data/SupersededReturn"/>
									<xsl:with-param name="BackupName">IRS1065SupersededReturn</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065Data/SupersededReturn"/>
									<xsl:with-param name="BackupName">IRS1065SupersededReturn</xsl:with-param>
								</xsl:call-template>
       Superseeded Return
                            </label>
						</div>
					</div>
					<div class="styNBB" style="width:187mm;">
						<div class="styBoldText" style="width:6mm;float:left;clear:none;padding-left:2mm;">H</div>
						<div class="styGenericDiv" style="width:82mm;">
      Check accounting method: 
            <!--<span style="width:1mm;"/>-->
							<span class="styBoldText">(1)</span>
							<span style="width:1px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065Data/MethodOfAccountingCash"/>
									<xsl:with-param name="BackupName">IRS1065MethodOfAccountingCash</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065Data/MethodOfAccountingCash"/>
									<xsl:with-param name="BackupName">IRS1065MethodOfAccountingCash</xsl:with-param>
								</xsl:call-template>
         Cash
            </label>
							<span style="width:8mm;"/>
							<span class="styBoldText">(2)</span>
							<span style="width:1px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065Data/MethodOfAccountingAccrual"/>
									<xsl:with-param name="BackupName">IRS1065MethodOfAccountingAccrual</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065Data/MethodOfAccountingAccrual"/>
									<xsl:with-param name="BackupName">IRS1065MethodOfAccountingAccrual</xsl:with-param>
								</xsl:call-template>
         Accrual
            </label>
						</div>
						<div class="styGenericDiv" style="width:33mm;">
							<span class="styBoldText">(3)</span>
							<span style="width:1px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065Data/MethodOfAccountingOther"/>
									<xsl:with-param name="BackupName">IRS1065MethodOfAccountingOther</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065Data/MethodOfAccountingOther"/>
									<xsl:with-param name="BackupName">IRS1065MethodOfAccountingOther</xsl:with-param>
								</xsl:call-template>
         Other (specify)
            </label>
							<img src="{$ImagePath}/1065_Bullet_Sm.gif" alt="MidSizeBullet"/>
						</div>
						<div class="styBB" style="width:66mm;float:right;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065Data/MethodOfAccountingOther/@note"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- I -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styBoldText" style="width:6mm;float:left;clear:none;padding-left:2mm;">I</div>
						<div class="styGenericDiv" style="width:181mm;font-size:6pt;">
      Number of Schedules K-1. Attach one for each person who was a partner at any time during the tax year 
                               <span style="width:2.5mm;"/>
							<img src="{$ImagePath}/1065_Bullet_Sm.gif" alt="MidSizeBullet"/>
							<span style="width:2mm"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065Data/NumberOfSchedulesK1"/>
							</xsl:call-template>
							<span style="width:2.5mm"/>
							<span style="width:54mm;font-size:7pt;text-align:right;border-bottom:solid black 1px">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/NumberOfSchedulesK1"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- J -->
					<div class="styBB" style="width:187mm;height:6mm">
						<div class="styBoldText" style="width:6mm;float:left;clear:none;padding-left:2mm;">J</div>
						<div class="styGenericDiv" style="width:175mm;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" 
									  select="$Form1065Data/ScheduleCAndScheduleM3Attached"/>
									<xsl:with-param name="BackupName">IRS1065SScheduleCAndScheduleM3Attached
									</xsl:with-param>
								</xsl:call-template>
                                  Check if Schedules C and M-3 are attached 
                                <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" 
									  select="$Form1065Data/ScheduleCAndScheduleM3Attached"/>
								</xsl:call-template>
							</label>
							<!--Dotted Line-->
							<span style="width:1.8mm"/>
							<span style=" letter-spacing:3.2mm; font-weight:bold; ">............................</span>
						</div>
						<div class="styGenericDiv" style="width:5mm;float:right;text-align:right;">
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" 
									  select="$Form1065Data/ScheduleCAndScheduleM3Attached"/>
									<xsl:with-param name="BackupName">IRS1065ScheduleCAndScheduleM3Attached
									</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!-- Caution -->
					<div class="styBB" style="width:187mm;height:4mm;padding-top:0mm;">
						<span class="styBoldText">Caution.</span>
						<span class="styItalicText"> Include 
							<span class="styBoldText">only</span> 
						trade or business income and expenses on lines 1a through 22 below. See the instructions for more
						information.
						</span>
					</div>
					<!--BEGIN Main Form Income Section-->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS1065VTImageBox" style="height:59.96mm;padding-top:25mm;">
							<img src="{$ImagePath}/1065_Income.gif" alt="VerticalIncome"/>
						</div>
						<div style="width:181mm;float:right;clear:none">
							<div class="styLNLeftNumBox" style="padding-left: 2.25mm;height:3mm;">1a</div>
							<div class="styLNDesc" style="width:92mm;height:3mm;">
						      Merchant card and third-party payments (including amounts reported<br/>
						      on Form(s) 1099-K). For 2011 enter -0- 
						        <!--Dotted Line-->
								<span style="width:1.8mm;"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">.........</span>
							</div>
							<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm">1a</div>
							<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									  select="$Form1065Data/MerchantCardAndThirdPartyPymt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="background-color:lightgrey;height:7.3mm;
							  border-bottom-width:0px"/>
							<div class="styLNAmountBoxNBB" style="height:7.3mm;"/>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftLtrBox" style="height:4mm;">
								<span style="width:4px;"/>b
							</div>
							<div class="styLNDesc" style="width:92mm;height:4mm;">
							  Gross receipts or sales not reported on line 1a (see instructions) 
							    <!-- Form to Form Link -->
								<span style="width:1mm"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065Data/GrossReceiptsOrSales"/>
								</xsl:call-template>   
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">1b</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/GrossReceiptsOrSales"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;
							  border-bottom-width:0px"></div>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px"></div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftLtrBox" style="height:4mm;">
								<span style="width:4px;"/>c
							</div>
							<div class="styLNDesc" style="width:92mm;height:4mm;">
							  Total. Add lines 1a and 1b    
								<!--Dotted Line-->
								<span style="width:1mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">..............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">1c</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/Total"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;
							  border-bottom-width:0px"></div>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px"></div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftLtrBox" style="height:4mm;">
								<span style="width:4px;"/>d
							</div>
							<div class="styLNDesc" style="width:92mm;height:3mm;">
							  Returns and allowances plus any other adjustments to line 1a
							  <br/>(see instructions)    
								<!--Dotted Line-->
								<span style="width:.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">.................</span>
							</div>
							<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm">1d</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:7mm;padding-top:3.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/ReturnsAndAllowances"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:7.3mm;background-color:lightgrey;
							  border-bottom-width:0px"></div>
							<div class="styLNAmountBox" style="height:7.3mm;border-bottom-width:0px"></div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftLtrBox" style="height:4mm;">
								<span style="width:4px;"/>e
							</div>
							<div class="styLNDesc" style="width:92mm;height:4mm;">
							  Subtract line 1d from line 1c    
								<!--Dotted Line-->
								<span style="width:2.5mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">.............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">1e</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/SubtractLine1dFromLine1c"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;
							  border-bottom-width:0px"></div>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px"></div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">2</div>
							<div class="styLNDesc" style="width:92mm;height:4mm;">Cost of goods sold (attach Form 1125-A)
							<!-- Form to Form Link -->
								<span style="width:1mm"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065Data/CostOfGoodsSold"/>
								</xsl:call-template>
								<!--Dotted Line-->
								<span style="width:.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">2</div>
							<div class="styLNAmountBox" style="height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/CostOfGoodsSold"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.4mm;background-color:lightgrey;
							  border-bottom-width:0px"></div>
							<div class="styLNAmountBox" style="height:4.4mm;border-bottom-width:0px;"></div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">3</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Gross profit. Subtract line 2 from line 1e
								<!--Dotted Line-->
								<!--<span style="width:1.8mm"/>-->
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">....................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">3</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/GrossProfit"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">4</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
							  Ordinary income (loss) from other partnerships, estates, and trusts (attach statement)
								<span style="width:2px"/>
								<!-- Form to Form Link -->
								<span style="width:.5mm"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065Data/OrdinaryIncomeLoss"/>
								</xsl:call-template>
								<!--Dotted Line-->
								<span style="width:2mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">...</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">4</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/OrdinaryIncomeLoss"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">5</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
							  Net farm profit (loss) (attach Schedule F (Form 1040))
								<span style="width:2px"/>
								<!-- Form to Form Link -->
								<span style="width:.5mm"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065Data/NetFarmProfitLoss"/>
								</xsl:call-template>
								<!--Dotted Line-->
								<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">..............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">5</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/NetFarmProfitLoss"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">6</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
							  Net gain (loss) from Form 4797, Part II, line 17 (attach Form 4797)
								<span style="width:2px;"/>
								<!-- Form to Form Link -->
								<span style="width:.5mm"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065Data/NetGainLoss"/>
								</xsl:call-template>
								<!--Dotted Line-->
								<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">.........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">6</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/NetGainLoss"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left: 2.25mm;height:4mm;">7</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
							  Other income (loss) (attach statement)
								<span style="width:2px;"/>
								<!-- Form to Form Link -->
								<span style="width:.5mm"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065Data/OtherIncomeLoss"/>
								</xsl:call-template>
								<!--Dotted Line-->
								<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">...................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">7</div>
							<div class="styLNAmountBox" style="height:4mm;border-bottom-width:1;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/OtherIncomeLoss"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left: 2.25mm;height:4.5mm;">8</div>
							<div class="styLNDesc" style="width:132mm;height:4.5mm;">
								<span class="styBoldText">Total income (loss).</span> Combine lines 3 through 7
								<!--Dotted Line-->
								<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">.................</span>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4.89mm;padding-bottom:0mm;
							  padding-top:1mm">8</div>
							<div class="styLNAmountBoxNBB" style="height:4.89mm;padding-bottom:0mm;
							  padding-top:1mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/TotalIncomeLoss"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--END Main Form Income Section-->
					<!--BEGIN Main Form Deduction Section-->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS1065VTImageBox" style="height:66.30mm;padding-top:3mm;">
							<img src="{$ImagePath}/1065_DeductionsLong.gif" alt="VertDeductions"/>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left: 2.25mm;height:4mm;">9</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
							  Salaries and wages (other than to partners) (less employment credits)
								<!--Dotted Line-->
								<!--<span style="width:1.8mm"/>-->
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">..........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">9</div>
							<div class="styLNAmountBox" style="height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/SalariesAndWages"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">10</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Guaranteed payments to partners
								<!--Dotted Line-->
								<span style="width:1mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">.....................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">10</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									  select="$Form1065Data/GuaranteedPaymentsToPartners"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">11</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Repairs and maintenance
								<!--Dotted Line-->
								<!--<span style="width:1.8mm"/>-->
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">11</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/RepairsAndMaintenance"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">12</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Bad debts
								<!--Dotted Line-->
								<!--<span style="width:1.8mm"/>-->
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">.............................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">12</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/BadDebts"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">13</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Rent
								<!--Dotted Line-->
								<!--<span style="width:1.8mm"/>-->
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">...............................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">13</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/Rent"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">14</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Taxes and licenses
								<!--Dotted Line-->
								<!--<span style="width:1.8mm"/>-->
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">..........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">14</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/TaxesAndLicenses"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">15</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Interest
								<span style="width:2px;"/>
								<!-- Form to Form Link -->
								<span style="width:.5mm"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065Data/Interest"/>
								</xsl:call-template>
								<!--Dotted Line-->
								<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">............................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">15</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/Interest"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4.5mm;">16a</div>
							<div class="styLNDesc" style="width:92mm;height:4.5mm;">
							  Depreciation (if required, attach Form 4562)
								<span style="width:2px;"/>
								<!-- Form to Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065Data/Depreciation"/>
								</xsl:call-template>
								<!--Dotted Line-->
								<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">.......</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">16a</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/Depreciation"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="background-color:lightgrey;height:4.5mm;
							  border-bottom-width:0px"/>
							<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftLtrBox" style="height:3mm;">
								<span style="width:4px;"/>b
							</div>
							<div class="styLNDesc" style="width:92mm;height:3mm;">
							  Less depreciation reported on Form 1125-A and elsewhere on return
							   <br/>
							   <!-- Form to Form Link -->
								<span style="width:1mm"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065Data/LessDepreciation"/>
								</xsl:call-template>   
							</div>
							<div class="styLNRightNumBox" style="height:7.8mm;padding-top:3.5mm">16b</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:7.8mm;
							  padding-top:3.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/LessDepreciation"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:7.8mm;padding-top:3.5mm">16c</div>
							<div class="styLNAmountBox" style="height:7.8mm;padding-top:3.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/TotalDepreciation"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">17</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Depletion 
								<span class="styBoldText"> (Do not deduct oil and gas depletion.)</span>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065Data/Depletion"/>
								</xsl:call-template>
								<!--Dotted Line-->
								<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">...............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">17</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/Depletion"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">18</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Retirement plans, etc.
								<!--Dotted Line-->
								<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">.........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">18</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/RetirementPlansEtc"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">19</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Employee benefit programs
								<!--Dotted Line-->
								<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">19</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/EmployeeBenefitPrograms"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">20</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
							  Other deductions (attach statement)
								<span style="width:2px;"/>
								<!-- Form to Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065Data/OtherDeductions"/>
								</xsl:call-template>
								<!--Dotted Line-->
								<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">....................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">20</div>
							<div class="styLNAmountBox" style="height:4mm;border-bottom-width:1;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/OtherDeductions"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">21</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span class="styBoldText">Total deductions.</span> 
								  Add the amounts shown in the far right column for lines 9 through 20
								<!--Dotted Line-->
								<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">....</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.75mm;border-bottom-width:0;
							  padding-top:1mm; padding-bottom:0mm">21</div>
							<div class="styLNAmountBox" style="height:4.75mm;border-bottom-width:0;
							  padding-top:1mm; padding-bottom:0mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/TotalDeductions"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--END Main Form Deductions Section-->
					<!--BEGIN Main Form Tax and Payment Section-->
					<div class="styBB" style="width:187mm;border-bottom-width:0;">
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">22</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span class="styBoldText" style="font-size:7pt;">Ordinary business income (loss).</span> 
								  Subtract line 21 from line 8     
									<!--Dotted Line-->
									<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;border-bottom-width:1;">22</div>
							<div class="styLNAmountBox" style="height:4mm;border-bottom-width:1;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/OrdinaryBusinessIncomeLoss"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styBB" style="width:187mm; height:4.5mm;"/>
					</div>
					<!--END Main Form Tax and Payment Section-->
					<!-- BEGIN Signature Section -->
					<!-- Implementing the signature section as a table -->
					<table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:6pt;">
						<tr>
							<td rowspan="3" style="width:10mm;font-size: 8pt;font-weight:bold;
							  border-right:1 solid black;border-bottom:1 solid black;text-align:left;">Sign Here</td>
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
								<img src="{$ImagePath}/1065_Bullet_Lg.gif" alt="LargeBullet"/>
							</td>
							<td class="styBB" style="width:112mm;vertical-align:bottom;">
								<xsl:call-template name="PopulateReturnHeaderPartner">
									<xsl:with-param name="TargetNode">Name</xsl:with-param>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<td rowspan="2" style="border-bottom:1 solid black;padding-left:1mm;">
								<img src="{$ImagePath}/1065_Bullet_Lg.gif" alt="LargeBullet"/>
							</td>
							<td style="width:20mm;border-bottom:1 solid black;vertical-align:bottom;">
								<xsl:call-template name="PopulateReturnHeaderPartner">
									<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
								</xsl:call-template>
							</td>
							<td rowspan="2" style="width:40mm;border-bottom:1 solid black;padding-bottom:1mm;">
								<div class="styGenericDiv" style="width:2px;"/>
								<div style="border-right:3 solid black;border-left:3 solid black;border-bottom:3 solid black;
								  border-top:3 solid black;float:right;text-align:center;" class="styGenericDiv">    
								  May the IRS discuss this return<br/> with the preparer shown below<br/>(see instructions)?
									<input class="styCkbox" alt="alt" type="checkbox" name="Checkbox" id="dummyidyes" 
									  style="width:3mm;">
										<xsl:call-template name="PopulateReturnHeaderPartner">
											<xsl:with-param name="TargetNode">AuthorizeThirdPartyYesCheckbox</xsl:with-param>
											<xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep
											</xsl:with-param>
										</xsl:call-template>
									</input>
									<span class="styBoldText">
										<label for="dummyidyes">
											<xsl:call-template name="PopulateReturnHeaderPartner">
												<xsl:with-param name="TargetNode">AuthorizeThirdPartyYesLabel</xsl:with-param>
												<xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep
												</xsl:with-param>
											</xsl:call-template>
										  Yes
										</label>
									</span>
									<input class="styCkbox" alt="alt" type="checkbox" name="Checkbox" id="dummyidno" 
									  style="width:2.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPartner">
											<xsl:with-param name="TargetNode">AuthorizeThirdPartyNoCheckbox</xsl:with-param>
											<xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep
											</xsl:with-param>
										</xsl:call-template>
									</input>
									<span class="styBoldText">
										<label for="dummyidno">
											<xsl:call-template name="PopulateReturnHeaderPartner">
												<xsl:with-param name="TargetNode">AuthorizeThirdPartyNoLabel</xsl:with-param>
												<xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep
												</xsl:with-param>
											</xsl:call-template>
										  No
										</label>
									</span>
								</div>
							</td>
						</tr>
						<tr>
							<td style="border-bottom:1 solid black;vertical-align:top;">
							 Signature of general partner or limited liability company member manager</td>
							<td style="border-bottom:1 solid black;vertical-align:top;">Date</td>
						</tr>
					</table>
					<!-- END Signature Section -->
					<!-- BEGIN PREPARER SIGNATURE SECTION -->
					<!-- Implementing the Preparer section in table -->
					<table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:6pt;border-color:black;">
						<tr>
							<td rowspan="3" style="width:13mm;font-size:10pt;font-weight:bold;font-family:'arial narrow';
							  border-right:1 solid black;vertical-align:center;border-bottom:1 solid black;">
							  Paid Preparer<br/> Use Only</td>
							<td style="width:35mm;border-bottom:1 solid black;padding-left:1mm;">
							  Print/Type Preparer's Name<br/>
							   <xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">Name</xsl:with-param>
							   </xsl:call-template>
							</td>
							<td style="width:15mm;border-right:1 solid black;border-bottom:1 solid black;">
								<span style="width:2px;"/>
							</td>
							<td style="width:30mm;border-bottom:1 solid black;padding-top:0mm;
							  vertical-align:top;padding-left:1mm">Preparer's signature
							</td>
							<td style="width:25mm;border-bottom:1 solid black;border-right:1 solid black">
								<span style="width:2px;"/>
							</td>
							<td style="width:20mm;border-right:1 solid black;border-bottom:1 solid black;padding-left:1mm;">
							    Date <br/>
								<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
								</xsl:call-template>
							</td>
							<td style="width:37mm;border-bottom:1 solid black;padding-left:.5mm;">
							    <span style="width:18mm;border-right:1 solid black;padding-left:.5mm;
							      vertical-align:bottom;padding-bottom:.5mm;">
								   <nobr>
									  <label for="dummyid1">
										 <xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">SelfEmployedLabel</xsl:with-param>
											<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
										  </xsl:call-template><span style="width:.5mm"/>Check  
									      <input class="styCkbox" type="checkbox" id="dummyid1" style="width:4mm;">
									         <xsl:call-template name="PopulateReturnHeaderPreparer">
										        <xsl:with-param name="TargetNode">SelfEmployedCheckbox</xsl:with-param>
										        <xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
									         </xsl:call-template>
								          </input><span style="width:.5mm"/>if
								      </label>
								   </nobr>
								   <br/> self-employed
							   </span>
							   <span style="width:19mm;padding-left:1mm;">
							     PTIN<br/>
								  <xsl:call-template name="PopulateReturnHeaderPreparer">
								     <xsl:with-param name="TargetNode">SSN</xsl:with-param>
								  </xsl:call-template>
								  <xsl:call-template name="PopulateReturnHeaderPreparer">
									 <xsl:with-param name="TargetNode">PTIN</xsl:with-param>
								  </xsl:call-template>
								  <xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								  </xsl:call-template>
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="5" style="border-right:1 solid black;border-bottom:1 solid black;
							  padding-left:.5mm;padding-top:.5mm">Firm's name <span style="width:2.6mm"/>
							  	<img src="{$ImagePath}/1065_Bullet_Sm.gif" alt="SmallBullet"/>
								<span style="width:.8mm"/>
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
								</xsl:call-template>
								<br/>
								<span style="width:19.2mm"/>
								    <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
								       <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
								    </xsl:call-template>
							</td>
							<td style="border-bottom:1 solid black;padding-left:1mm;vertical-align:top;
							  padding-top:.5mm">Firm's EIN 
							    <img src="{$ImagePath}/1065_Bullet_Sm.gif" alt="SmallBullet"/>
								<span style="padding-right:1mm;"/>
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<td colspan="5" style="border-bottom:1 solid black;border-right:1 solid black;
							  padding-left:.5mm;padding-top:.5mm;padding-bottom:.5mm">Firm's address
							    <span style="width:.5mm"/>
							  	<img src="{$ImagePath}/1065_Bullet_Sm.gif" alt="SmallBullet"/>
								<span style="width:.5mm"/>
								<xsl:choose>
									<xsl:when test="$RtnHdrData/PreparerFirm/PreparerFirmUSAddress">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
										</xsl:call-template>
										<xsl:if test="$RtnHdrData/PreparerFirm/PreparerFirmUSAddress/AddressLine2">
											<br/><span style="width:19.2mm"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<br/><span style="width:19.2mm"/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
										</xsl:call-template>
										<xsl:if test="$RtnHdrData/PreparerFirm/PreparerFirmUSAddress/Country">
										   <br/><span style="width:19.2mm"/>
										   <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">Country</xsl:with-param>
										   </xsl:call-template>
										</xsl:if>
									</xsl:when>
									<xsl:when test="$RtnHdrData/PreparerFirm/PreparerFirmForeignAddress">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
										</xsl:call-template>
										<xsl:if test="$RtnHdrData/PreparerFirm/PreparerFirmForeignAddress/AddressLine2">
											<br/><span style="width:19.2mm"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<br/><span style="width:19.2mm"/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
										</xsl:call-template>
										<xsl:if test="$RtnHdrData/PreparerFirm/PreparerFirmForeignAddress/Country">
											<br/><span style="width:19.2mm"/>
										    <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">Country</xsl:with-param>
										    </xsl:call-template>
										</xsl:if>
									</xsl:when>
								</xsl:choose>
							</td>
							<td style="border-bottom:1 solid black;padding-left:1mm;vertical-align:top;
							  padding-top:.5mm"> Phone no. 
                                <xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">Phone</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<!-- END PREPARER SIGNATURE SECTION -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:left;">
							<span class="styBoldText">
							  For Paperwork Reduction Act Notice, see separate instructions.</span>
							<span style="width:13mm;"/>Cat. No. 11390Z
						</div>
						<div style="float:right;">
							<span style="width:40px;"/>  
							  Form <span class="styBoldText" style="font-size:8pt;">1065</span> (2011)
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<!--Begin Page 2 -->
					<!-- Page Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 1065 (2011)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!--br class="pageEnd"/-->
					<!--span style="width:1px;"></span-->
					<!-- BEGIN Schedule B Line Items -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="width:23mm;">Schedule B</div>
						<div class="styPartDesc" style="width:164mm;">Other Information</div>
					</div>
					<!-- SCHEDULE B Line 1-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm; padding-left:1.5mm;">1</div>
						<div class="styLNDesc" style="height:4mm;width:167mm;">
						  What type of entity is filing this return? Check the applicable box:</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1;
						  border-right-width:1;">Yes</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;border-left-width:0;">No</div>
					</div>
					<!--SCHEDULE B Line 1a-->
					<div style="width:187mm">
						<div class="styLNLeftLtrBox" style="height:4mm">a</div>
						<div class="styLNDesc" style="width:65mm">
							<input class="styCkBox" type="checkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" 
									  select="$Form1065ScheduleB/DomesticGeneralPartnership"/>
									<xsl:with-param name="BackupName">IRS1065DomesticGeneralPartnership
									</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<label for="DomesticGeneralPartnership">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" 
									  select="$Form1065ScheduleB/DomesticGeneralPartnership"/>
									<xsl:with-param name="BackupName">IRS1065DomesticGeneralPartnership
									</xsl:with-param>
								</xsl:call-template>
							  Domestic general partnership
							</label>
						</div>
						<!-- SCHEDULE B Line 1b-->
						<div class="styLNLeftLtrBox" style="height:4mm">b</div>
						<div class="styLNDesc" style="width:94mm">
							<input class="styCkBox" type="checkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" 
									  select="$Form1065ScheduleB/DomesticLimitedPartnership"/>
									<xsl:with-param name="BackupName">IRS1065DomesticLimitedPartnership
									</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<label for="DomesticLimitedPartnership">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" 
									  select="$Form1065ScheduleB/DomesticLimitedPartnership"/>
									<xsl:with-param name="BackupName">IRS1065DomesticLimitedPartnership
									</xsl:with-param>
								</xsl:call-template>
							  Domestic limited partnership
							</label>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
					</div>
					<!-- SCHEDULE B Line 1c-->
					<div style="width:187mm">
						<div class="styLNLeftLtrBox" style="height:4mm">c</div>
						<div class="styLNDesc" style="height:4mm; width:65mm">
							<input class="styCkBox" type="checkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" 
									  select="$Form1065ScheduleB/DomesticLimitedLiabilityCo"/>
									<xsl:with-param name="BackupName">IRS1065DomesticLimitedLiabilityCo
									</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<label for="DomesticLimitedLiabilityCo">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" 
									  select="$Form1065ScheduleB/DomesticLimitedLiabilityCo"/>
									<xsl:with-param name="BackupName">IRS1065DomesticLimitedLiabilityCo
									</xsl:with-param>
								</xsl:call-template>
							  Domestic limited liability company
							</label>
						</div>
						<!-- SCHEDULE B Line 1d-->
						<div class="styLNLeftLtrBox" style="height:4mm">d</div>
						<div class="styLNDesc" style="height:4mm; width:94mm">
							<input class="styCkBox" type="checkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" 
									  select="$Form1065ScheduleB/DomesticLimitedLiabilityPrtshp"/>
									<xsl:with-param name="BackupName">IRS1065DomesticLimitedLiabilityPrtshp
									</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<label for="DomesticLimitedLiabilityPrtshp">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" 
									  select="$Form1065ScheduleB/DomesticLimitedLiabilityPrtshp"/>
									<xsl:with-param name="BackupName">IRS1065DomesticLimitedLiabilityPrtshp
									</xsl:with-param>
								</xsl:call-template>
							  Domestic limited liability partnership
							</label>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; background:gray;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; background:gray;border-bottom:0"/>
					</div>
					<!-- SCHEDULE B Line 1e-->
					<div style="width:187mm">
						<div class="styLNLeftLtrBox" style="height:4mm;">e</div>
						<div class="styLNDesc" style="width:65mm;height:4mm;">
							<input class="styCkBox" type="checkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/ForeignPartnership"/>
									<xsl:with-param name="BackupName">IRS1065ForeignPartnership</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<label for="ForeignPartnership">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/ForeignPartnership"/>
									<xsl:with-param name="BackupName">IRS1065ForeignPartnership</xsl:with-param>
								</xsl:call-template>
							   Foreign partnership
							</label>
						</div>
						<!-- SCHEDULE B Line 1f-->
						<div class="styLNLeftLtrBox" style="height:4mm;">f</div>
						<div class="styLNDesc" style="height:4mm;width:94mm;">
							<input class="styCkBox" type="checkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/TypeOfEntityOther"/>
									<xsl:with-param name="BackupName">IRS1065TypeOfEntityOther</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<label for="TypeOfEntityOther">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/TypeOfEntityOther"/>
									<xsl:with-param name="BackupName">IRS1065TypeOfEntityOther</xsl:with-param>
								</xsl:call-template>
							  Other 
							</label>
							<span style="width:2mm;"/>
							<img src="{$ImagePath}/1065_Bullet_Sm.gif" alt="SmallBullet"/>
							<span style="width:2mm;"/>
							<span style="height:4mm;width:74mm;border-bottom:1 solid black;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" 
									  select="$Form1065ScheduleB/TypeOfEntityOther/@note"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:5mm;background:gray;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:5mm;background:gray;border-bottom:0"/>
					</div>
					<!-- SCHEDULE B Line 2-->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm; padding-left:1.5mm;">2</div>
						<div class="styLNDesc" style="height:4mm;width:167mm;">
						  At any time during the tax year, was any partner in the partnership a disregarded entity, a
						  partnership (including an entity<br/> treated as a partnership), a trust, an S corporation, an estate
						  (other than an estate of a deceased partner), or a nominee<br/> or similar person?
							<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">...................................</span>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:5mm;border-bottom-width:0;"/>
						<div class="styIRS1065LNYesNoBox" style="height:5mm;border-bottom-width:0;"/>
						<div class="styIRS1065LNYesNoBox" style="height:5.5mm; border-left-width:1;
						  border-bottom-width:1;font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065ScheduleB/PrtnerInPrtshpOfAnotherEntity"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:5.5mm; border-left-width:1;
						  border-bottom-width:1;font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065ScheduleB/PrtnerInPrtshpOfAnotherEntity"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCHEDULE B Line 3-->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm; padding-left:1.5mm;">3</div>
						<div class="styLNDesc" style="width:167mm">At the end of the tax year:</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;;background:gray;border-bottom-width:0;"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;;background:gray;border-bottom-width:0;"/>
					</div>
					<!-- SCHEDULE B Line 3a-->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm; padding-left:3.5mm;">a</div>
						<div class="styLNDesc" style="width:167mm">
                          Did any foreign or domestic corporation, partnership (including any entity treated as a partnership),
                          trust, or tax-exempt organization, or any foreign government own, directly or indirectly, an interest 
                          of 50% or more in the profit, loss, or capital of the partnership?  For rules of constructive ownership, 
                          see instructions.  If "Yes," attach Schedule B-1, Information on Partners Owning 50% or More of the
                          Partnership.
                          <xsl:call-template name="SetFormLinkInline">
						     <xsl:with-param name="TargetNode" 
						       select="$Form1065ScheduleB/EntityOwnIntOf50PercentOrMore"/>
						  </xsl:call-template>
						  <span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">...........................</span>
				         </div>
						<div class="styIRS1065LNYesNoBox" style="height:4.5mm;background:gray;
						  border-bottom-width:0;"/>
						<div class="styIRS1065LNYesNoBox" style="height:4m;background:gray;border-bottom-width:0;"/>
						<div class="styIRS1065LNYesNoBox" style="height:4m;border-bottom-width:0; border-left-width:1"/>
                                        <div class="styIRS1065LNYesNoBox" style="height:4m;border-bottom-width:0;"/>
						<div class="styIRS1065LNYesNoBox" style="height:5mm; border-left-width:1; border-bottom-width:1;
						  font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065ScheduleB/EntityOwnIntOf50PercentOrMore"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:5mm; border-left-width:1; border-bottom-width:1;
						  font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065ScheduleB/EntityOwnIntOf50PercentOrMore"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCHEDULE B Line 3b-->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm; padding-left:3.5mm;">b</div>
						<div class="styLNDesc" style="width:167mm">
                                          Did any individual or estate own, directly or indirectly, an interest of 50% or 
                                          more in the profit, loss, or capital of the <br/>partnership? For rules of 
                                          constructive ownership, see instructions.  If "Yes," attach Schedule B-1, 
                                          Information on Partners Owning 50% or More of the Partnership.
                            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065ScheduleB/IndivOrEstateOwnIntOfThePrtshp"/>
						    </xsl:call-template>
						    <span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">...........................</span>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4m;border-bottom-width:0; border-left-width:1"/>
                        <div class="styIRS1065LNYesNoBox" style="height:4m;border-bottom-width:0;"/>
						<div class="styIRS1065LNYesNoBox" style="height:6.3mm; border-left-width:1; border-bottom-width:1;
						  font-weight:normal;padding-top:2mm">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065ScheduleB/IndivOrEstateOwnIntOfThePrtshp"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:6.3mm; border-left-width:1; border-bottom-width:1;
						  font-weight:normal;padding-top:2mm">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065ScheduleB/IndivOrEstateOwnIntOfThePrtshp"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCHEDULE B Line 4-->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm; padding-left:1.5mm;">4</div>
						<div class="styLNDesc" style="width:167mm">At the end of the tax year, did the partnership:</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;;background:gray;border-bottom-width:0;"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;;background:gray;border-bottom-width:0;"/>
					</div>
					<!--SCHEDULE B Line 4-->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm; padding-left:3.5mm;">a</div>
						<div class="styLNDesc" style="width:167mm">
                          Own directly 20% or more, or own, directly or indirectly, 50% or more of the total voting power of all
                          classes of stock entitled <br/>to vote of any foreign or domestic corporation? For rules of
                          constructive ownership, see instructions. If "Yes," complete (i) <br/>through (iv) below 
                            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065ScheduleB/PctTotalVotingPowerOwnGrp"/>
							</xsl:call-template>
							<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">...................................</span>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom-width:0;"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom-width:0;"/>
						<div class="styIRS1065LNYesNoBox" style="height:5mm; border-left-width:1; border-bottom-width:1;
						  font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065ScheduleB/PctTotalVotingPowerOwnOfStock"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:5mm; border-left-width:1; border-bottom-width:1;
						  font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065ScheduleB/PctTotalVotingPowerOwnOfStock"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styGenericDiv" style="width:3.2mm;float:right;" align="right">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065ScheduleB/PctTotalVotingPowerOwnGrp"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="containerID" select=" 'REPtbl4a' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styTableContainer" id="REPtbl4a">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" style="width:78mm;vertical-align:top;font-size:6.5pt;" 
									  scope="col">
										<span class="styBoldText">(i)
                                            <span class="styNormalText"> Name of Corporation</span>
										</span>
									</th>
									<th class="styTableCellHeader" style="width:46mm;vertical-align:top;font-size:6.5pt;"
									  scope="col">
										<span class="styBoldText">(ii) 
                                            <span class="styNormalText"> Employer Identification <br/>Number (if any)</span>
										</span>
									</th>
									<th class="styTableCellHeader" style="width:29mm;vertical-align:top;font-size:6.5pt;" 
								      scope="col">
										<span class="styBoldText">(iii)
                                            <span class="styNormalText"> Country of <br/>Incorporation</span>
										</span>
									</th>
									<th class="styTableCellHeader" style="width:33mm;vertical-align:top;font-size:6.5pt;"
									  scope="col">
										<span class="styBoldText">(iv) 
                                            <span class="styNormalText"> Percentage <br/>Owned in Voting<br/>Stock</span>
										</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1065ScheduleB/PctTotalVotingPowerOwnGrp">
									<xsl:if test="($Print != $Separated) or
									 (count($Form1065ScheduleB/PctTotalVotingPowerOwnGrp) &lt;=2)">
										<tr style="font-size: 6.5pt;">
											<td class="styTableCellText" style="width:78mm;height:1mm;text-align:left;">
												<xsl:if test="NameOfCorp">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="NameOfCorp"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellText" style="width:46mm;text-align:center;">
												<xsl:choose>
													<xsl:when test="SSN">
														<xsl:call-template name="PopulateSSN">
															<xsl:with-param name="TargetNode" select="SSN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:when test="EIN">
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="EIN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingEINReason"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellText" style="width:29mm;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryOfIncorp"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellText" style="width:33mm;text-align:center;">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="MaxPctOwnInVotingStk"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<!-- Table Filler Rows -->
								<xsl:if test="count($Form1065ScheduleB/PctTotalVotingPowerOwnGrp) &lt; 1
								  or ((count($Form1065ScheduleB/PctTotalVotingPowerOwnGrp) &gt;2) and 
								  ($Print = $Separated))">
									<tr>
										<td class="styTableCellText" style="width:78mm;height:1mm;font-size:6.5pt;">
											<span style="width:4px"/>
											<xsl:if test="((count($Form1065ScheduleB/PctTotalVotingPowerOwnGrp) &gt;2) 
											  and ($Print = $Separated))">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" 
													  select="$Form1065ScheduleB/PctTotalVotingPowerOwnGrp"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellText" style="width:46mm;height:1mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:29mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:33mm;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065ScheduleB/PctTotalVotingPowerOwnGrp) &lt; 2 
								  or ((count($Form1065ScheduleB/PctTotalVotingPowerOwnGrp) &gt;2) and 
								  ($Print = $Separated))">
									<tr>
										<td class="styTableCellText" style="width:78mm;height:1mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:46mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:29mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:33mm;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065ScheduleB/PctTotalVotingPowerOwnGrp) &lt; 3 
								  or ((count($Form1065ScheduleB/PctTotalVotingPowerOwnGrp) &gt;2) and 
								  ($Print = $Separated))">
									<tr>
										<td class="styTableCellText" style="width:78mm;height:1mm;">
										<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:46mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:29mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:33mm;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065ScheduleB/PctTotalVotingPowerOwnGrp) &lt; 4
								  or ((count($Form1065ScheduleB/PctTotalVotingPowerOwnGrp) &gt;2) and 
								  ($Print = $Separated))">
									<tr>
										<td class="styTableCellText" style="width:78mm;height:1mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:46mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:29mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:33mm;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065ScheduleB/PctTotalVotingPowerOwnGrp) &lt; 5 
								  or ((count($Form1065ScheduleB/PctTotalVotingPowerOwnGrp) &gt;2) and 
								  ($Print = $Separated))">
									<tr>
										<td class="styTableCellText" style="width:78mm;height:1mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:46mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:29mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:33mm;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/PctTotalVotingPowerOwnGrp"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="containerID" select=" 'REPtbl4a' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					
					<!-- SCHEDULE B Line 4b-->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm; padding-left:3.5mm;">b</div>
						<div class="styLNDesc" style="width:167mm">
                          Own directly an interest of 20% or more, or own, directly or indirectly, an interest of 50% or more
                          in the profit, loss, or capital <br/>in any foreign or domestic partnership (including an entity treated
                          as a partnership) or in the beneficial interest of a trust? For <br/>rules of constructive ownership,
                          see instructions.  If "Yes," complete (i) through (v) below
                            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065ScheduleB/OwnForeignOrDomesticGrp"/>
							</xsl:call-template>
							<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">............</span>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:5mm;background:gray;border-bottom-width:0;"/>
						<div class="styIRS1065LNYesNoBox" style="height:5mm;background:gray;border-bottom-width:0;"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1; border-bottom-width:1;
						  font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065ScheduleB/OwnForeignOrDomesticPrtshp"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1; border-bottom-width:1;
						  font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065ScheduleB/OwnForeignOrDomesticPrtshp"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styGenericDiv" style="width:3.2mm;float:right;" align="right">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" 
							      select="$Form1065ScheduleB/OwnForeignOrDomesticGrp"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="containerID" select=" 'REPtbl4b' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styTableContainer" id="REPtbl4b">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" style="width:76mm;vertical-align:top;font-size:6.5pt;" 
									  scope="col">
										<span class="styBoldText">(i)
                                            <span class="styNormalText"> Name of Entity</span>
										</span>
									</th>
									<th class="styTableCellHeader" style="width:26mm;vertical-align:top;font-size:6.5pt;"
									  scope="col">
										<span class="styBoldText">(ii) 
                                            <span class="styNormalText"> Employer <br/>Identification <br/>Number (if any)
                                            </span>
										</span>
									</th>
									<th class="styTableCellHeader" style="width:26mm;vertical-align:top;font-size:6.5pt;" 
									  scope="col">
										<span class="styBoldText">(iii)
                                            <span class="styNormalText"> Type of <br/>Entity</span>
										</span>
									</th>
									<th class="styTableCellHeader" style="width:29mm;vertical-align:top;font-size:6.5pt;"
									  scope="col">
										<span class="styBoldText">(iv) 
                                                      <span class="styNormalText"> Country of <br/>Organization</span>
										</span>
									</th>
									<th class="styTableCellHeader" style="width:33mm;vertical-align:top;font-size:6.5pt;" 
									  scope="col">
										<span class="styBoldText">(v)
                                            <span class="styNormalText"> Maximum <br/>Percentage Owned in <br/>Profit,
                                              Loss, or Capital</span>
										</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1065ScheduleB/OwnForeignOrDomesticGrp">
									<xsl:if test="($Print != $Separated) or
									 (count($Form1065ScheduleB/OwnForeignOrDomesticGrp) &lt;=2)">
										<tr style="font-size: 6.5pt;">
											<td class="styTableCellText" style="width:76mm;height:1mm;text-align:left;
											  vertical-align:top;">
												<xsl:if test="NameOfEntity">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="NameOfEntity"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellText" style="width:26mm;text-align:center;">
												<xsl:choose>
													<xsl:when test="EIN">
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="EIN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingEINReason"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellText" style="width:26mm;text-align:left;height:1mm;
											  vertical-align:top;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TypeOfEntity"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellText" style="width:29mm;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryOfOrganization"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellText" style="width:29mm;text-align:center;">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="MaximumPctOwned"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<!-- Table Filler Rows -->
								<xsl:if test="count($Form1065ScheduleB/OwnForeignOrDomesticGrp) &lt; 1 
								  or ((count($Form1065ScheduleB/OwnForeignOrDomesticGrp) &gt;2) and
								  ($Print = $Separated))">
									<tr>
										<td class="styTableCellText" style="width:76mm;height:1mm;font-size:6.5pt;">
											<span style="width:4px"/>
											<xsl:if test="((count($Form1065ScheduleB/OwnForeignOrDomesticGrp) &gt;2) 
											  and ($Print = $Separated))">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" 
													  select="$Form1065ScheduleB/OwnForeignOrDomesticGrp"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellText" style="width:26mm;height:1mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:26mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:29mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:29mm;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065ScheduleB/OwnForeignOrDomesticGrp) &lt; 2
								  or ((count($Form1065ScheduleB/OwnForeignOrDomesticGrp) &gt;2) and 
								  ($Print = $Separated))">
									<tr>
										<td class="styTableCellText" style="width:76mm;height:1mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:26mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:26mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:29mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:29mm;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065ScheduleB/OwnForeignOrDomesticGrp) &lt; 3 
								  or ((count($Form1065ScheduleB/OwnForeignOrDomesticGrp) &gt;2) and
								  ($Print = $Separated))">
									<tr>
										<td class="styTableCellText" style="width:76mm;height:1mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:26mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:26mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:29mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:29mm;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065ScheduleB/OwnForeignOrDomesticGrp) &lt; 4
								  or ((count($Form1065ScheduleB/OwnForeignOrDomesticGrp) &gt;2) and
								  ($Print = $Separated))">
									<tr>
										<td class="styTableCellText" style="width:76mm;height:1mm;">
										<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:26mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:26mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:29mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:29mm;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065ScheduleB/OwnForeignOrDomesticGrp) &lt; 5
								  or ((count($Form1065ScheduleB/OwnForeignOrDomesticGrp) &gt;2) and 
								  ($Print = $Separated))">
									<tr>
										<td class="styTableCellText" style="width:76mm;height:1mm;">
										<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:26mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:26mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:29mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:29mm;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/OwnForeignOrDomesticGrp"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="containerID" select=" 'REPtbl4b' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:right;">
							<span style="width:80px;"/> 
							      Form <span class="styBoldText" style="font-size:8pt;">1065</span> (2011)
                        </div>
					</div>
					<!-- END Page Break and Footer-->
					<!--Begin Page 3 -->
					<!-- Page Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 1065 (2011)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- SCHEDULE B Line 5-->
					<div class="styBB" style="width:187mm">
						<div class="styIRS1065LNYesNoBox" style="float:right;height:3mm;border-left-width:0;">No</div>
						<div class="styIRS1065LNYesNoBox" style="float:right;height:3mm; border-left-width:1; 
						       border-right-width:1;">Yes</div>
						<br/>
					   	<div class="styLNLeftNumBox" style="height:4mm; padding-left:1.5mm;">5</div>
						<div class="styLNDesc" style="height:4mm;width:167mm;">
						       Did the partnership file the Form 8893, Election of Partnership Level Tax Treatment,
                               or an election statement under <br/>section 6231(a)(1)(B)(ii) for partnership-level tax treatment,
                               that is in effect for this tax year?  See Form 8893 for more<br/>details
                               <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065ScheduleB/ElectionPrtshpLevelTaxTrtmnt"/>
							</xsl:call-template>
							<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">......................................</span>
						</div>
			       		<div class="styIRS1065LNYesNoBox" style="height:5.5mm;background:gray;
			       		  border-bottom-width:0;"/>
						<div class="styIRS1065LNYesNoBox" style="height:5.5mm;background:gray;
						  border-bottom-width:0;"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1; border-bottom-width:0;
						  font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode"
								  select="$Form1065ScheduleB/ElectionPrtshpLevelTaxTrtmnt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1; border-bottom-width:0;
						  font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065ScheduleB/ElectionPrtshpLevelTaxTrtmnt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCHEDULE B Line 6-->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm; padding-left:1.5mm;">6</div>
						<div class="styLNDesc" style="height:4mm; width:167mm">Does the partnership satisfy 
							<span class="styBoldText">all four </span> of the following conditions?</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:3.5mm">a</div>
						<div class="styLNDesc" style="height:4mm;width:167mm">
						  The partnership's total receipts for the tax year were less than $250,000.</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:3.5mm">b</div>
						<div class="styLNDesc" style="height:4mm;width:167mm">
						  The partnership's total assets at the end of the tax year were less than $1 million.</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:3.5mm">c</div>
						<div class="styLNDesc" style="height:4mm;width:167mm">
						  Schedules K-1 are filed with the return and furnished to the partners on or before the due date
						  (including extensions) <br/>for the partnership return.
                        </div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
						<div style="width:187mm">
							<div class="styLNLeftLtrBox" style="height:4mm;padding-left:3.5mm">d</div>
							<div class="styLNDesc" style="height:4mm;width:167mm">
							  The partnership is not filing and is not required to file Schedule M-3
                                <span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">...................</span>
							</div>
							<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1;
							  border-bottom-width:1;font-weight:normal;">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" 
									  select="$Form1065ScheduleB/SchK1FiledAndFurnishedToPrtnr"/>
								</xsl:call-template>
							</div>
							<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1;
							  border-bottom-width:1;font-weight:normal;">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode"
									  select="$Form1065ScheduleB/SchK1FiledAndFurnishedToPrtnr"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styBB" style="width:187mm">
							<div class="styLNLeftLtrBox" style="height:4mm"/>
							<div class="styLNDesc" style="height:4mm;width:167mm">
                              If “Yes,” the partnership is not required to complete Schedules L, M-1, and M-2; Item F on page 1 
                              of Form 1065;<br/>or Item L on Schedule K-1.</div>
							<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
							<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
							<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
							<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
						</div>
					</div>
					<!--SCHEDULE B Line 7-->
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm; padding-left:1.5mm;">7</div>
						<div class="styLNDesc" style="height:4mm;width:167mm">
						  Is this partnership a publicly traded partnership as defined in section 469(k)(2)?
						   <span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">..............</span>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1; border-bottom-width:0;
						  font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065ScheduleB/IsPartnershipPubliclyTraded"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1; border-bottom-width:0;
						  font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065ScheduleB/IsPartnershipPubliclyTraded"/>
							</xsl:call-template>
						</div>
					</div>
					<!--SCHEDULE B Line 8-->
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm; padding-left:1.5mm;">8</div>
						<div class="styLNDesc" style="height:4mm;width:167mm">
						  During the tax year, did the partnership have any debt that was cancelled, was forgiven, or had the 
						  terms<br/> modified so as to reduce the principal amount of the debt?
                            <span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">......................</span> 
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1; border-bottom-width:0;
						  font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065ScheduleB/DidPartnershipHaveAnyDebt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1; border-bottom-width:0;
						  font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065ScheduleB/DidPartnershipHaveAnyDebt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--SCHEDULE B Line 9-->
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm; padding-left:1.5mm;">9</div>
						<div class="styLNDesc" style="height:4mm;width:167mm">
						  Has this partnership filed, or is it required to file, Form 8918, Material Advisor Disclosure
						  Statement, to provide<br/> information on any reportable transaction?
                            <span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">...........................</span> 
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1; border-bottom-width:0;
						  font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/ReportableTransaction"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1; border-bottom-width:0;
						  font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/ReportableTransaction"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCHEDULE B Line 10-->
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:1.0mm;">10</div>
						<div class="styLNDesc" style="height:4mm;width:167mm">At any time during calendar year 2011, 
						   did the partnership have an interest in or a signature or other authority over a <br/>financial account
						   in a foreign country (such as a bank account, securities account, or other financial account)? See
						   the<br/>instructions for exceptions and filing requirements for Form TD F 90-22.1, Report of
						   Foreign Bank and Financial Accounts. If "Yes," enter the name of the foreign country.
                           <span style="width:8px"/>
						   <img src="{$ImagePath}/1065_Bullet_Sm.gif" alt="MidSizeBullet"/>
						   <span style="width:1mm;"/>
						   <xsl:call-template name="SetFormLinkInline">
							  <xsl:with-param name="TargetNode" select="$Form1065ScheduleB/AnyForeignAccounts"/>
						   </xsl:call-template>
						   <span style="width:1mm;"/>
						   <span style="width:35mm;border-bottom:dotted 1px">
							  <xsl:call-template name="PopulateText">
                                 <xsl:with-param name="TargetNode" 
                                   select="$Form1065ScheduleB/AnyForeignAccounts/@NameOfForeignCountry"/>
                                 </xsl:call-template>
                           </span> 
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-bottom:0; 
						  padding-bottom:0mm; padding-top:.0mm;"/>
						<div class="styIRS1065LNYesNoBox" style="border-bottom:0;height:4mm;
						  padding-bottom:0mm;padding-top:0mm;"/>
						<div class="styIRS1065LNYesNoBox" style="border-bottom:0;height:5mm;"/>
						<div class="styIRS1065LNYesNoBox" style="border-bottom:0;height:5mm;"/>
						<div class="styIRS1065LNYesNoBox" style="height:5mm; border-left-width:1; 
						  border-bottom-width:0;font-weight:normal;">
						   <xsl:call-template name="PopulateYesBoxText">
							  <xsl:with-param name="TargetNode"
							    select="$Form1065ScheduleB/AnyForeignAccounts"/>
							  </xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:5mm; border-left-width:1;
						  border-bottom-width:0;font-weight:normal;">
						   <xsl:call-template name="PopulateNoBoxText">
							  <xsl:with-param name="TargetNode" select="$Form1065ScheduleB/AnyForeignAccounts"/>
						   </xsl:call-template>
						</div>
					</div>
					<!-- SCHEDULE B Line 11-->
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:1.0mm">11</div>
						<div class="styLNDesc" style="height:4mm; width:167mm">
						  At any time during the tax year, did the partnership receive a distribution from, or was it the grantor
						  of, or transferor<br/>to, a foreign trust? If "Yes," the partnership may have to file Form 3520,
						  Annual Return To Report Transactions With <br/>Foreign Trusts and Receipt of Certain Foreign
						  Gifts.  See instructions
                            <xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">
								  Form 1065, Schedule B, Line 10 - Form 3520 Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode"
							 select="$Form1065ScheduleB/ReceivedDistriFromForeignTrust/@form3520Indicator"/>
							</xsl:call-template>
							<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">..................</span>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:6mm;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:6mm;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:5mm; border-left-width:1; border-bottom-width:0;
						  font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065ScheduleB/ReceivedDistriFromForeignTrust"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:5mm; border-left-width:1; border-bottom-width:0;
						  font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065ScheduleB/ReceivedDistriFromForeignTrust"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCHEDULE B Line 12a-->
					<div style="width:187mm">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:1mm">12a</div>
						<div class="styLNDesc" style="height:4mm;width:167mm">
						  Is the partnership making, or had it previously made (and not revoked), a section 754 election?
						  <span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">..........</span>
                          <br/>See instructions for details regarding a section 754 election.
                            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/Section754ElectionMade"/>
							</xsl:call-template>
							<!-- <xsl:call-template name="LinkToLeftoverDataTableInline">
                                <xsl:with-param name="Desc">
                                  Form 1065, Schedule B, Line 12a - Section 754 Election</xsl:with-param>
                                <xsl:with-param name="TargetNode" 		
                                  select="$Form1065ScheduleB/Section754ElectionMade/@referenceDocumentId"/>
                            </xsl:call-template>-->
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1; border-bottom-width:0;
						  font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/Section754ElectionMade"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1; border-bottom-width:0;
						  font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/Section754ElectionMade"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom-width:1"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom-width:1"/>
					</div>
					<!-- SCHEDULE B Line 12b-->
					<div style="width:187mm">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:4mm">b</div>
						<div class="styLNDesc" style="height:4mm;width:167mm">
						  Did the partnership make for this tax year an optional basis adjustment under section 743(b) or
						  734(b)? If "Yes,"<br/>attach a statement showing the computation and allocation of the basis
						  adjustment.  See instructions
                            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065ScheduleB/OptionalBasisAdjustment"/>
							</xsl:call-template>
							<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">.......</span>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1; border-bottom-width:1;
						  font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065ScheduleB/OptionalBasisAdjustment"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1; border-bottom-width:1;
						  font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065ScheduleB/OptionalBasisAdjustment"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCHEDULE B Line 12c-->
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:4mm">c</div>
						<div class="styLNDesc" style="height:4mm;width:167mm">
						  Is the partnership required to adjust the basis of partnership assets under section 743(b) or 734(b)
						  because of a <br/>substantial built-in loss (as defined under section 743(d)) or substantial basis
						  reduction (as defined under section 734(d))? <br/> If "Yes," attach a statement showing the
						  computation and allocation of the basis adjustment.  See instructions 
                            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065ScheduleB/PrtshipRequiredToAdjustBasis"/>
							</xsl:call-template>
							<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">....</span>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:6mm;background:gray;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:6mm;background:gray;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:5mm; border-left-width:1; border-bottom-width:0;
						  font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065ScheduleB/PrtshipRequiredToAdjustBasis"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:5mm; border-left-width:1; border-bottom-width:0;
						  font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065ScheduleB/PrtshipRequiredToAdjustBasis"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCHEDULE B Line 13-->
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">13</div>
						<div class="styLNDesc" style="height:4mm; width:167mm">
						  Check this box if, during the current or prior tax year, the partnership distributed any property 
						  received in a like-kind <br/>exchange or contributed such property to another entity (other than 
						  disregarded entities wholly-owned by the partnership throughout the tax year)
                           <span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">..............................</span>  
							<span style="width:4mm"/>
							<img src="{$ImagePath}/1065_Bullet_Sm.gif" alt="MidSizeBullet"/>
							<span style="width:4mm"/>
							<input class="styCkBox" alt="alt" type="checkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/LikeKindExchange"/>
									<xsl:with-param name="BackupName">IRS1065LikeKindExchange</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:11mm;background:gray;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:11mm;background:gray;border-bottom:0"/>
					</div>
					<!-- SCHEDULE B Line 14-->
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">14</div>
						<div class="styLNDesc" style="height:4mm; width:167mm">
						  At any time during the tax year, did the partnership distribute to any partner a tenancy-in-common
						  or other <br/> undivided interest in partnership property?
                          <span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">...........................</span>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1; border-bottom-width:0;
						  font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/TenancyInCommon"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1; border-bottom-width:0;
						  font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/TenancyInCommon"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCHEDULE B Line 15-->
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">15</div>
						<div class="styLNDesc" style="height:4mm; width:167mm">
						  If the partnership is required to file Form 8858, Information Return of U.S. Persons With Respect To
						  Foreign<br/>Disregarded Entities, enter the number of Forms 8858 attached.  See instructions
                            <span style="width:4mm"/>
							<img src="{$ImagePath}/1065_Bullet_Sm.gif" alt="MidSizeBullet"/>
							<span style="width:1mm"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/NumberOfF8858"/>
							</xsl:call-template>
							<span style="width:45mm;border-bottom:dotted 1px;text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/NumberOfF8858"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:8mm;background:gray;border-bottom-width:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:8mm;background:gray;border-bottom-width:0"/>
					</div>
					<!-- SCHEDULE B Line 16-->
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">16</div>
						<div class="styLNDesc" style="height:4mm; width:167mm">
						  Does the partnership have any foreign partners? If "Yes," enter the number of Forms 8805, Foreign
						  Partner's<br/>Information Statement of Section 1446 Withholding Tax, filed for this partnership.
                            <span style="width:4mm"/>
							<img src="{$ImagePath}/1065_Bullet_Sm.gif" alt="MidSizeBullet"/>
							<span style="width:1mm;"/>
							<span style="width:48mm;border-bottom:dotted 1px;text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/NumberOfF8805"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1; border-bottom-width:0;
						  font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode"
								  select="$Form1065ScheduleB/PrtshpHasAnyForeignPartners"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1; border-bottom-width:0;
						  font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode"
								  select="$Form1065ScheduleB/PrtshpHasAnyForeignPartners"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCHEDULE B Line 17-->
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm">17</div>
						<div class="styLNDesc" style="height:4mm;width:167mm">
						  Enter the number of Forms 8865, Return of U.S. Persons With Respect to Certain Foreign
						  Partnerships, attached to this<br/>return
                            <span style="height:4mm;width:1mm;"/>
							<img src="{$ImagePath}/1065_Bullet_Sm.gif" alt="MidSizeBullet"/>
							<span style="width:1mm;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065ScheduleB/NumberOfForms8865Attached"/>
							</xsl:call-template>
							<span style="height:4mm;width:30mm;border-bottom:dotted 1px;text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									  select="$Form1065ScheduleB/NumberOfForms8865Attached"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:8.2mm;right-border-width:0;background:gray;
						  border-bottom-width:0;"/>
						<div class="styIRS1065LNYesNoBox" style="height:8.2mm;background:gray;
						  border-bottom-width:0;"/>
					</div>
					<!-- SCHEDULE B Line 18a-->
					<div style="width:187mm">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:1mm">18a</div>
						<div class="styLNDesc" style="height:4mm;width:167mm">
						  Did you make any payments in 2011 that would require you to file Form(s) 1099? See instructions
							<span style="width:1.8mm"/>
						    <span style=" letter-spacing:3.2mm; font-weight:bold; ">........</span>
                            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065ScheduleB/DidYouMakeAnyPayments"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:5mm; border-left-width:1; border-bottom-width:1;
						  font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065ScheduleB/DidYouMakeAnyPayments"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:5mm; border-left-width:1; border-bottom-width:1;
						  font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" 
							      select="$Form1065ScheduleB/DidYouMakeAnyPayments"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCHEDULE B Line 18b-->
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:4mm">b</div>
						<div class="styLNDesc" style="height:4mm;width:167mm">
						  If "Yes," did you or will you file all required Forms(s) 1099?
						    <span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">......................</span>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1; border-bottom-width:0;
						  font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065ScheduleB/DidYouOrWillYouFileF1099"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1; border-bottom-width:0;
						  font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065ScheduleB/DidYouOrWillYouFileF1099"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCHEDULE B Line 19-->
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm">19</div>
						<div class="styLNDesc" style="height:4mm;width:167mm">
						  Enter the number of Form(s) 5471, Information Return of U.S. Persons With Respect to Certain
							<br/>Foreign Corporations, attached to this return.
                            <span style="height:4mm;width:1mm;"/>
							<img src="{$ImagePath}/1065_Bullet_Sm.gif" alt="MidSizeBullet"/>
							<span style="width:1mm;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" 
								  select="$Form1065ScheduleB/NumberOfForms5471Attached"/>
							</xsl:call-template>
							<span style="height:4mm;width:30mm;border-bottom:dotted 1px;text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									  select="$Form1065ScheduleB/NumberOfForms5471Attached"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:8.2mm;right-border-width:0;background:gray;
						  border-bottom-width:0;"/>
						<div class="styIRS1065LNYesNoBox" style="height:8.2mm;background:gray;
						  border-bottom-width:0;"/>
					</div>
					<!-- Designation Of Tax Matters Partners -->
					<div style="height:4mm;width:187mm;font-size:8pt;">
						<span class="styBoldText">Designation of Tax Matters Partner</span>
						  (see instructions)
					</div>
					<div style="width:187mm;height:4mm;">
					  Enter below the general partner designated as the tax matters partner (TMP) for the tax year of this return:
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styGenericDiv" style="width:23mm;">
                          Name of <br/>designated TMP</div>
						<div class="styGenericDiv" style="width:5mm;">
							<img src="{$ImagePath}/1065_Bullet_Lg.gif" alt="LargeBullet"/>
						</div>
						<div class="styGenericDiv" style="width:95mm;padding-top:1mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/TMPName"/>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="width:23mm;">
                          Identifying <br/>number of TMP</div>
						<div class="styGenericDiv" style="width:5mm;">
							<img src="{$ImagePath}/1065_Bullet_Lg.gif" alt="LargeBullet"/>
						</div>
						<div class="styGenericDiv" style="width:35mm;padding-top:1mm;">
							<xsl:choose>
								<xsl:when test="not($Form1065ScheduleB/TMPNumberEIN) or $Form1065ScheduleB/TMPNumberEIN=''">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/TMPNumberSSN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/TMPNumberEIN"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
                    <div class="styBB" style="width:187mm;height:5mm;padding-top:1mm">
  					    <div class="styGenericDiv" style="width:123mm;">
                          If the TMP is an entity, name of TMP representative<span style="width:1mm"/>
                            <img src="{$ImagePath}/1065_Bullet_Sm.gif" alt="MidSizeBullet"/>
                            <span style="width:45mm;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/TMPRepresentative"/>
								</xsl:call-template>
							</span>
					    </div>
                        <div class="styGenericDiv" style="width:60mm;">
                          Phone number of TMP <span style="width:1mm"/>
                            <img src="{$ImagePath}/1065_Bullet_Sm.gif" alt="MidSizeBullet"/>
                            <span style="width:.5mm"/>
                            <span style="width:25mm;border-bottom:1px solid black;">
                                <xsl:call-template name="PopulatePhoneNumber">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/PhoneNumber"/>
								</xsl:call-template></span>
                        </div>
                    </div>                      
					<div class="styBB" style="width:187mm;">
						<div class="styGenericDiv" style="width:23mm;height:6mm;padding-top:2mm;">
						  Address of <br/>designated TMP</div>
						<div class="styGenericDiv" style="width:5mm;height:6mm;padding-top:2mm;">
							<img src="{$ImagePath}/1065_Bullet_Lg.gif" alt="LargeBullet"/>
						</div>
						<div class="styGenericDiv" style="width:158mm;">
							<xsl:choose>
								<xsl:when test="$Form1065ScheduleB/TMPUSAddress">
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/TMPUSAddress"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateForeignAddressTemplate">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/TMPForeignAddress"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:right;">
							<span style="width:80px;"/>  
							  Form <span class="styBoldText" style="font-size:8pt;">1065</span> (2011)
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<!--Begin Page 4-->
					<!-- Page Header-->
					<div class="styBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 1065 (2011)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">4</span>
						</div>
					</div>
					<!--END Page Header -->
					<!-- BEGIN Schedule K Title -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="width:21mm;height:4mm;">Schedule K</div>
						<div class="styPartDesc" style="width:121.5mm;height:4mm;">Partners' Distributive Share Items
                            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleK"/>
							</xsl:call-template>
						</div>
						<span class="styBoldText" style="width:40mm;height:4mm;border-left:1 solid black;padding-left:13mm;">
						  Total Amount</span>
					</div>
					<!-- END Schedule K Title -->
					<!-- BEGIN Schedule K Line Items -->
					<!-- BEGIN Schedule K Income (Loss) Line Items -->
					<div class="styBB" style="width:187mm;">
						<table class="styTable" style="height:4mm; width:187mm ;font-size:7pt;" 
						  cellspacing="0" cellpadding="0" id="schK">
							<thead/>
							<tfoot/>
							<tbody>
								<!-- Begin Schedule K section "Income (Loss)", Line 1-11 -->
								<!-- Schedule K, Line 1-11 Column Label -->
								<tr>
									<td class="styIRS1065VTImageBox" style="width:7.5mm;height:54mm;padding-left:2mm;
									  border-bottom:1px solid black;" rowspan="16">
										<img src="{$ImagePath}/1065_IncomeLoss.gif" alt="VertIncomeLoss"/>
									</td>
									<td>
										<span class="styLNLeftNumBoxSD" style="height:4mm;padding-left:3mm;">1</span>
										<span class="styIRS1065LNDesc" style="height:4mm;">
										  Ordinary business income (loss) (page 1, line 22)</span>
										<span style="float:right;height:4mm;">
											<span class="styIRS1065DotLn">.............</span>
										</span>
									</td>
									<td>
										<span class="styLNRightNumBox" style="width:11.5mm;height:4.8mm;">1</span>
										<span class="styLNAmountBox" style="height:4.8mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												  select="$Form1065ScheduleK/OrdinaryBusinessIncomeLoss"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<!-- Schedule K, Line 2 -->
								<tr>
									<td>
										<span class="styLNLeftNumBoxSD" style="height:4mm;padding-left:3mm;">2</span>
										<span class="styIRS1065LNDesc" style="height:4mm;">Net rental real estate income (loss)
										 (attach Form 8825)
											<span style="width:2px;"/>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode"
												 select="$Form1065ScheduleK/NetRentalRealEstateIncomeLoss"/>
											</xsl:call-template>
										</span>
										<span style="float:right;height:4mm;">
											<span class="styIRS1065DotLn">..........</span>
										</span>
									</td>
									<td>
										<span class="styLNRightNumBox" style="width:11.5mm;height:5.2mm;">2</span>
										<span class="styLNAmountBox" style="height:5.2mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
											     select="$Form1065ScheduleK/NetRentalRealEstateIncomeLoss"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<!-- Schedule K, Line 3a -->
								<tr>
									<td>
										<span class="styLNLeftNumBoxSD" style="height:4mm;padding-left:3mm;">3a</span>
										<span class="styIRS1065LNDesc" style="height:4mm;">Other gross rental income (loss)
									    <!-- Form to Form Link -->
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" 
												select="$Form1065ScheduleK/OtherGrossRentalIncomeLoss"/>
											</xsl:call-template>
										</span>
										<span style="float:right;">
											<span class="styIRS1065DotLn">.........</span>
											<span class="styLNRightNumBox" style="height:4.5mm;">3a</span>
											<span class="styLNAmountBox" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode"
													 select="$Form1065ScheduleK/OtherGrossRentalIncomeLoss"/>
												</xsl:call-template>
											</span>
										</span>
									</td>
									<td>
										<div class="styLNRightNumBoxNBB" style="width:11.5mm;background-color:lightgrey;
										  height:4.5mm;border-bottom-width:0px;"/>
										<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
									</td>
								</tr>
								<!-- Schedule K, Line 3b -->
								<tr>
									<td>
										<span class="styIRS1065LNLeftLtrBoxTD" style="height:4mm;">b</span>
										<span class="styIRS1065LNDesc" style="height:4mm;">
										  Expenses from other rental activities (attach statement)
											<span style="width:2px;"/>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" 
											    select="$Form1065ScheduleK/ExpensesFromOtherRentalActy"/>
											</xsl:call-template>
										</span>
										<span style="float:right;">
											<!--<span class="styIRS1065DotLn" style="padding-right:2mm;">..</span>-->
											<span class="styLNRightNumBox" style="height:4mm;">3b</span>
											<span class="styLNAmountBox" style="height:4mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form1065ScheduleK/ExpensesFromOtherRentalActy"/>
												</xsl:call-template>
											</span>
										</span>
									</td>
									<td>
										<span class="styLNRightNumBoxNBB" style="width:11.5mm; background-color:lightgrey;
										  height:4.4mm; border-bottom-width:0px;"/>
										<span class="styLNAmountBoxNBB" style="height:4.4mm;"/>
									</td>
								</tr>
								<!-- Schedule K, Line 3c -->
								<tr>
									<td>
										<span class="styIRS1065LNLeftLtrBoxTD" style="height:4mm;">c</span>
										<span class="styIRS1065LNDesc" style="height:4mm;">Other net rental income (loss). 
										  Subtract line 3b from line 3a</span>
										<span style="float:right;">
											<span class="styIRS1065DotLn">...........</span>
										</span>
									</td>
									<td>
										<span class="styLNRightNumBox" style="width:11.5mm;height:4mm;">3c</span>
										<span class="styLNAmountBox" style="height:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												 select="$Form1065ScheduleK/OtherNetRentalIncomeLoss"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<!-- Schedule K, Line 4 -->
								<tr>
									<td>
										<span class="styLNLeftNumBoxSD" style="height:4mm;padding-left:3mm">4</span>
										<span class="styIRS1065LNDesc" style="height:4mm;">Guaranteed payments</span>
										<span style="float:right;">
											<span class="styIRS1065DotLn">.......................</span>
										</span>
									</td>
									<td>
										<span class="styLNRightNumBox" style="width:11.5mm;height:4mm;">4</span>
										<span class="styLNAmountBox" style="height:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												  select="$Form1065ScheduleK/GuaranteedPayments"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<!-- Schedule K, Line 5 -->
								<tr>
									<td>
										<span class="styLNLeftNumBoxSD" style="height:4mm;padding-left:3mm;">5</span>
										<span class="styIRS1065LNDesc" style="height:4mm;">Interest income</span>
										<span style="float:right;">
											<span class="styIRS1065DotLn">.........................</span>
										</span>
									</td>
									<td>
										<span class="styLNRightNumBox" style="width:11.5mm;height:4mm;">5</span>
										<span class="styLNAmountBox" style="height:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/InterestIncome"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<!-- Schedule K, Line 6a -->
								<tr>
									<td>
										<span class="styLNLeftNumBoxSD" style="height:4mm;padding-left:3mm;">6</span>
										<span class="styIRS1065LNDesc" style="height:4mm;">
                                            Dividends: <b>a</b> Ordinary dividends</span>
										<span style="float:right;">
											<span class="styIRS1065DotLn">...................</span>
										</span>
									</td>
									<td>
										<span class="styLNRightNumBox" style="width:11.5mm;height:4mm;">6a</span>
										<span class="styLNAmountBox" style="height:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												  select="$Form1065ScheduleK/OrdinaryDividends"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<!-- Schedule K, Line 6b -->
								<tr>
									<td>
										<span class="styLNLeftNumBoxSD"/>
										<span class="styIRS1065LNDesc">
											<span style="width:15.5mm;"/>
											<b>b</b> Qualified dividends</span>
										<span style="float:right;">
											<span class="styIRS1065DotLn">.........</span>
											<span class="styLNRightNumBox" style="height:4mm;">6b</span>
											<span class="styLNAmountBox" style="height:4mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode"
													  select="$Form1065ScheduleK/QualifiedDividends"/>
												</xsl:call-template>
											</span>
										</span>
									</td>
									<td>
										<span class="styLNRightNumBoxNBB" style="width:11.5mm; background-color:lightgrey; 
										  height:4.5mm; border-bottom-width:0px;"/>
										<span class="styLNAmountBoxNBB" style="height:4.5mm;"/>
									</td>
								</tr>
								<!-- Schedule K, Line 7 -->
								<tr>
									<td>
										<span class="styLNLeftNumBoxSD" style="height:4mm;padding-left:3mm;">7</span>
										<span class="styIRS1065LNDesc" style="height:4mm;">Royalties</span>
										<span style="float:right;">
											<span class="styIRS1065DotLn">...........................</span>
										</span>
									</td>
									<td>
										<span class="styLNRightNumBox" style="width:11.5mm;height:4.5mm;">7</span>
										<span class="styLNAmountBox" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/Royalties"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<!-- Schedule K, Line 8 -->
								<tr>
									<td>
										<span class="styLNLeftNumBoxSD" style="height:4mm;padding-left:3mm;">8</span>
										<span class="styIRS1065LNDesc" style="height:4mm;">Net short-term capital gain (loss)
										(attach Schedule D (Form 1065))
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" 
											      select="$Form1065ScheduleK/NetSTCapitalGainLoss"/>
											</xsl:call-template>
										</span>
										<span style="float:right;">
											<span class="styIRS1065DotLn">........</span>
										</span>
									</td>
									<td>
										<span class="styLNRightNumBox" style="width:11.5mm;height:5mm;">8</span>
										<span class="styLNAmountBox" style="height:5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												  select="$Form1065ScheduleK/NetSTCapitalGainLoss"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<!-- Schedule K, Line 9a -->
								<tr>
									<td>
										<span class="styLNLeftNumBoxSD" style="height:4mm;padding-left:3mm;">9a</span>
										<span class="styIRS1065LNDesc" style="height:4mm;">Net long-term capital gain (loss)
										 (attach Schedule D (Form 1065))
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode"
												  select="$Form1065ScheduleK/NetLTCapitalGainLoss"/>
											</xsl:call-template>
										</span>
										<span style="float:right;">
											<span class="styIRS1065DotLn">........</span>
										</span>
									</td>
									<td>
										<span class="styLNRightNumBox" style="width:11.5mm;height:4mm;">9a</span>
										<span class="styLNAmountBox" style="height:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												  select="$Form1065ScheduleK/NetLTCapitalGainLoss"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<!-- Schedule K, Line 9b -->
								<tr>
									<td>
										<span class="styIRS1065LNLeftLtrBoxTD" style="height:4mm;">b</span>
										<span class="styIRS1065LNDesc" style="height:4mm;">Collectibles (28%) gain (loss)
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode"
												  select="$Form1065ScheduleK/CollectiblesGainLoss"/>
											</xsl:call-template>
										</span>
										<span style="float:right;">
											<span class="styIRS1065DotLn">..........</span>
											<span class="styLNRightNumBox" style="height:4.5mm;">9b</span>
											<span class="styLNAmountBox" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode"
													  select="$Form1065ScheduleK/CollectiblesGainLoss"/>
												</xsl:call-template>
											</span>
										</span>
									</td>
									<td>
										<span class="styLNRightNumBoxNBB" style="width:11.5mm;background-color:lightgrey;
										  height:4.5mm;border-bottom-width:0px;"/>
										<span class="styLNAmountBoxNBB" style="height:4.5mm;"/>
									</td>
								</tr>
								<!-- Schedule K, Line 9c -->
								<tr>
									<td>
										<span>
											<span class="styIRS1065LNLeftLtrBoxTD" style="height:4mm;">c</span>
											<span class="styIRS1065LNDesc" style="height:4mm;">Unrecaptured section 1250 gain 
											 (attach statement)
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" 
													 select="$Form1065ScheduleK/UnrecapturedSection1250Gain"/>
												</xsl:call-template>
											</span>
											<span style="float:right;">
												<span class="styIRS1065DotLn" style="padding-top:1mm;">...</span>
												<span class="styLNRightNumBox" style="height:4mm;">9c</span>
												<span class="styLNAmountBox" style="height:4mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" 
														 select="$Form1065ScheduleK/UnrecapturedSection1250Gain"/>
													</xsl:call-template>
												</span>
											</span>
										</span>
									</td>
									<td>
										<span class="styLNRightNumBoxNBB" style="width:11.5mm;background-color:lightgrey;
										  height:4.5mm;border-bottom-width:0px;"/>
										<span class="styLNAmountBoxNBB" style="height:4.5mm;"/>
									</td>
								</tr>
								<!-- Schedule K, Line 10 -->
								<tr>
									<td>
										<span class="styLNLeftNumBox" style="height:4mm;">10</span>
										<span class="styIRS1065LNDesc" style="height:4mm;">Net section 1231 gain (loss)
										  (attach Form 4797)
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode"
												  select="$Form1065ScheduleK/NetSection1231GainLoss"/>
											</xsl:call-template>
										</span>
										<span style="float:right;">
											<span class="styIRS1065DotLn">..............</span>
										</span>
									</td>
									<td>
										<span class="styLNRightNumBox" style="width:11.5mm;height:4mm;">10</span>
										<span class="styLNAmountBox" style="height:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												  select="$Form1065ScheduleK/NetSection1231GainLoss"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<!-- Schedule K, Line 11 -->
								<tr>
								  <td style="border-bottom:1px solid black;">
									<span class="styLNLeftNumBox" style="height:4mm;">11</span>
									<span class="styIRS1065LNDesc" style="height:4mm;">
									  Other income (loss) (see instructions) 
									  <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherIncomeLoss"/>
									  </xsl:call-template>
									</span>
									<span style="float:left;padding-right:1mm;padding-left:2mm;vertical-align:top;">
									  <span style="float:left;">
                                        Type <img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
									  </span>
									  <span style="width:32mm;padding-left:1mm;">
										<xsl:call-template name="PopulateText">
										  <xsl:with-param name="TargetNode" 
										    select="$Form1065ScheduleK/OtherIncomeLoss/@note"/>
										</xsl:call-template>
									  </span>
									</span>
								  </td>
								  <td style="height:4mm;border-bottom:1px solid black;">
									<span class="styLNRightNumBoxNBB" style="width:11.5mm;height:100%;">11
										<span style="vertical-align:baseline;height:100%;"/>
									</span>
									<span class="styLNAmountBoxNBB" style="height:100%;">
									  <xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherIncomeLoss"/>
									  </xsl:call-template>
									  <span style="vertical-align:baseline;height:100%;"/>
									</span>
								  </td>
								</tr>
								<!-- End Schedule K section "Income (Loss)", Line 1-11 -->
								<!-- Schedule K, Line 12-13d Column Label -->
								<tr>
									<td class="styIRS1065VTImageBox" rowspan="5" style="width:7.5mm;height:16mm;
									  padding-left:2mm;
									  border-bottom:1px solid black;">
										<img src="{$ImagePath}/1065_Deductions.gif" alt="VertDeductions"/>
									</td>
									<td>
										<span class="styLNLeftNumBox">12</span>
										<span class="styIRS1065LNDesc">Section 179 deduction (attach Form 4562)
											<span style="width:2px;"/>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode"
												  select="$Form1065ScheduleK/Section179Deduction"/>
											</xsl:call-template>
										</span>
										<span style="float:right;">
											<span class="styIRS1065DotLn">................</span>
										</span>
									</td>
									<td>
										<span class="styLNRightNumBox" style="width:11.5mm;height:4.5mm;">12</span>
										<span class="styLNAmountBox" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												  select="$Form1065ScheduleK/Section179Deduction"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<!-- Schedule K, Line 13a -->
								<tr>
									<td>
										<span class="styLNLeftNumBox">13a</span>
										<span class="styIRS1065LNDesc">Contributions
											<span style="width:2px;"/>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/Contributions"/>
											</xsl:call-template>
										</span>
										<span style="float:right;">
											<span class="styIRS1065DotLn">.........................</span>
										</span>
									</td>
									<td>
										<span class="styLNRightNumBox" style="width:11.5mm;height:4mm;">13a</span>
										<span class="styLNAmountBox" style="height:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/Contributions"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<!-- Schedule K, Line 13b -->
								<tr>
									<td>
										<span class="styIRS1065LNLeftLtrBoxTD">b</span>
										<span class="styIRS1065LNDesc">Investment interest expense</span>
										<span style="float:right;">
											<span class="styIRS1065DotLn">.....................</span>
										</span>
									</td>
									<td>
										<span class="styLNRightNumBox" style="width:11.5mm;height:4mm;">13b</span>
										<span class="styLNAmountBox" style="height:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												  select="$Form1065ScheduleK/InvestmentInterestExpense"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<!-- Schedule K, Line 13c -->
								<tr>
								  <td>
									<span class="styIRS1065LNLeftLtrBoxTD">c</span>
									<span class="styIRS1065LNDesc" style="width:58mm;height:4mm;">
									  Section 59(e)(2) expenditures:
                                      <span class="styBoldText">(1)</span> Type <img src="{$ImagePath}/1065_Bullet_Md.gif"
                                        alt="MidSizeBullet"/>
									</span>
									<span class="styIRS1065BBText" style="width:40mm;height:4mm;">
									  <xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode"
										  select="$Form1065ScheduleK/Section59e2ExpendituresType"/>
									  </xsl:call-template>
									</span>
									<span class="styLNDesc" style="width:25mm;height:4mm;text-align:center;">
									  <span class="styBoldText">
									    (2)</span> Amount <img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
									  <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode"
										  select="$Form1065ScheduleK/Section59e2ExpendituresAmount"/>
									  </xsl:call-template>
									</span>
								  </td>
								  <td style="height:4mm;">
									<span class="styLNRightNumBox" style="width:11.5mm;height:100%">
									  13c(2)<span style="vertical-align:baseline;height:100%;"/> 
									</span>
									<span class="styLNAmountBox" style="height:100%;">
									  <xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
									      select="$Form1065ScheduleK/Section59e2ExpendituresAmount"/>
									  </xsl:call-template>
									  <span style="vertical-align:baseline;height:100%;"/> 
									</span>
								  </td>
								</tr>
								<!-- Schedule K, Line 13d -->
								<tr>
								  <td style="border-bottom:1px solid black;">
									<span class="styIRS1065LNLeftLtrBoxTD">d</span>
								    <span class="styIRS1065LNDesc" style="padding-bottom:0mm;padding-top:0mm;">
									  Other deductions (see instructions)
									  <span style="width:2px;"/>
									  <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherDeductions"/>
										  <xsl:with-param name="IDstring">1065SchKLine10</xsl:with-param>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<span style="float:left;padding-left:2mm;">
									  <span style="float:left;">
                                        Type <img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
									  </span>
									  <span style="width:32mm;padding-left:1mm;">
										<xsl:call-template name="PopulateText">
										  <xsl:with-param name="TargetNode" 
											select="$Form1065ScheduleK/OtherDeductions/@note"/>
										</xsl:call-template>
									  </span>
									</span>
								  </td>
								  <td style="border-bottom:1px solid black;height:4.8mm;">
									<span class="styLNRightNumBoxNBB" style="width:11.5mm;height:100%;">13d
										<span style="vertical-align:baseline;height:100%;"/>
									</span>
									<span class="styLNAmountBoxNBB" style="height:100%;">
									  <xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherDeductions"/>
									  </xsl:call-template>
									  <span style="vertical-align:baseline;height:100%;"/> 
									</span>
							      </td>
								</tr>
								<!-- End Schedule K section "Other Deductions", line 11-13d -->
								<!-- Schedule K, Line 14a-14c Column Label -->
								<tr>
									<td class="styIRS1065VTImageBox" rowspan="3" style="width:7.5mm;height:11mm;
									  padding-left:2mm;border-bottom:1px solid black;">
										<img src="{$ImagePath}/1065_SelfEmp.gif" alt="VertSelfEmp"/>
									</td>
									<td>
										<span class="styLNLeftNumBox">14a</span>
										<span class="styIRS1065LNDesc">Net earnings (loss) from self-employment</span>
										<span style="float:right;">
											<span class="styIRS1065DotLn">.................</span>
										</span>
									</td>
									<td>
										<span class="styLNRightNumBox" style="width:11.5mm;height:4mm;">14a</span>
										<span class="styLNAmountBox" style="height:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" 
												select="$Form1065ScheduleK/NetEarningsLossFromSelfEmplmn"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<tr>
									<td>
										<span class="styIRS1065LNLeftLtrBoxTD">b</span>
										<span class="styIRS1065LNDesc">Gross farming or fishing income</span>
										<span style="float:right;">
											<span class="styIRS1065DotLn">....................</span>
										</span>
									</td>
									<td>
										<span class="styLNRightNumBox" style="width:11.5mm;height:4mm;">14b</span>
										<span class="styLNAmountBox" style="height:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												  select="$Form1065ScheduleK/GrossFarmingOrFishingIncome"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<tr>
									<td style="border-bottom:1px solid black;">
										<span class="styIRS1065LNLeftLtrBoxTD">c</span>
										<span class="styIRS1065LNDesc">Gross nonfarm income</span>
										<span style="float:right;">
											<span class="styIRS1065DotLn">.......................</span>
										</span>
									</td>
									<td>
										<span class="styLNRightNumBox" style="width:11.5mm;height:4.5mm;
										  padding-top:1mm;padding-bottom:0mm">14c</span>
										<span class="styLNAmountBox" style="height:4.5mm;padding-top:1mm;
										  padding-bottom:0mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												  select="$Form1065ScheduleK/GrossNonfarmIncome"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<!-- Begin Schedule K section "Credit and Credit Recapture", Line 15a-f -->
								<tr>
									<td class="styIRS1065VTImageBox" rowspan="7" style="width:7.5mm;height:26mm;
									  padding-left:2mm;border-bottom:1px solid black;">
										<img src="{$ImagePath}/1065_Recapture.gif" alt="Credits and Credit Recapture"/>
									</td>
								</tr>
								<!-- Schedule K, Line 15a -->
								<tr>
									<td>
										<span class="styLNLeftNumBox">15a</span>
										<span class="styIRS1065LNDesc">Low-income housing credit (section 42(j)(5))
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode"
												  select="$Form1065ScheduleK/LowIncomeHousingCredit"/>
											</xsl:call-template>
										</span>
										<span style="float:right;">
											<span class="styIRS1065DotLn">...............</span>
										</span>
									</td>
									<td>
										<span class="styLNRightNumBox" style="width:11.5mm;height:4.8mm;">15a</span>
										<span class="styLNAmountBox" style="height:4.8mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												  select="$Form1065ScheduleK/LowIncomeHousingCredit"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<!-- Schedule K, Line 15b -->
								<tr>
									<td>
										<span class="styIRS1065LNLeftLtrBoxTD">b</span>
										<span class="styIRS1065LNDesc">Low-income housing credit (other)
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode"
												  select="$Form1065ScheduleK/LowIncomeHousingCreditOther"/>
											</xsl:call-template>
										</span>
										<span style="float:right;">
											<span class="styIRS1065DotLn">...................</span>
										</span>
									</td>
									<td>
										<span class="styLNRightNumBox" style="width:11.5mm;height:4.8mm;">15b</span>
										<span class="styLNAmountBox" style="height:4.8mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												  select="$Form1065ScheduleK/LowIncomeHousingCreditOther"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<!-- Schedule K, Line 15c -->
								<tr>
									<td>
										<span class="styIRS1065LNLeftLtrBoxTD">c</span>
										<span class="styIRS1065LNDesc">
										  Qualified rehabilitation expenditures (rental real estate) (attach Form 3468)
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode"
												  select="$Form1065ScheduleK/QualifiedRehabilitationExpend"/>
											</xsl:call-template>
										</span>
										<span style="float:right;">
											<span class="styIRS1065DotLn">....</span>
										</span>
									</td>
									<td>
										<span class="styLNRightNumBox" style="width:11.5mm;height:4.5mm;">15c</span>
										<span class="styLNAmountBox" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												  select="$Form1065ScheduleK/QualifiedRehabilitationExpend"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<!-- Schedule K, Line 15d -->
								<tr>
								  <td>
									<span class="styIRS1065LNLeftLtrBoxTD">d</span>
									<span class="styIRS1065LNDesc">
									  Other rental real estate credits (see instructions)
									  <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" 
									      select="$Form1065ScheduleK/OtherRentalRealEstateCredits"/>
									  </xsl:call-template>
									</span>
									<span style="float:left;">
										<span class="styIRS1065DotLn"> ..</span>
										<span style="float:left;padding-left:2mm;">
                                        Type <img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
										</span>
										<span style="width:32mm;border-bottom:1 solid black;padding-left:1mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" 
										    select="$Form1065ScheduleK/OtherRentalRealEstateCredits/@note"/>
											</xsl:call-template>
										</span>
									</span>
								  </td>
								  <td style="height:4mm;">
									<span class="styLNRightNumBox" style="width:11.5mm;height:100%;">15d
										<span style="vertical-align:baseline;height:100%;"/>
									</span>
									<span class="styLNAmountBox" style="height:100%;">
									  <xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
									      select="$Form1065ScheduleK/OtherRentalRealEstateCredits"/>
									  </xsl:call-template>
									  <span style="vertical-align:baseline;height:100%;"/>
									</span>
								  </td>
								</tr>
								<!-- Schedule K, Line 15e -->
								<tr>
								  <td>
									<span class="styIRS1065LNLeftLtrBoxTD">e</span>
									<span class="styIRS1065LNDesc">Other rental credits (see instructions)
									  <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherRentalCredits"/>
									  </xsl:call-template>
									</span>
									<span style="float:left;">
									  <span class="styBoldText" style="float:left">
										<span style="width:16px"/>.
                                        <span style="width:16px"/>.
                                        <span style="width:16px"/>.
                                        <span style="width:14px"/>.
                                      </span>
									  <span style="float:left;padding-left:2mm;">
                                        Type <img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
									  </span>
									  <span style="width:32mm;border-bottom:1 solid black;padding-left:1mm;">
									    <xsl:call-template name="PopulateText">
										  <xsl:with-param name="TargetNode" 
									 	    select="$Form1065ScheduleK/OtherRentalCredits/@note"/>
									    </xsl:call-template>
									  </span>
								    </span>
								  </td>
								  <td style="height:4mm">
									<span class="styLNRightNumBox" style="width:11.5mm;height:100%;">
									  15e<span style="vertical-align:baseline;height:100%;"/>
									</span>
									<span class="styLNAmountBox" style="height:100%;">
									  <xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherRentalCredits"/>
									  </xsl:call-template>
									  <span style="vertical-align:baseline;height:100%;"/>
									</span>
								  </td>
								</tr>
								<!-- Schedule K, Line 15f -->
								<tr>
								  <td style="border-bottom:1px solid black;">
									<span class="styIRS1065LNLeftLtrBoxTD">f</span>
									<span class="styIRS1065LNDesc">Other credits (see instructions)
									  <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" 
									      select="$Form1065ScheduleK/OtherCreditsAndCreditRecapture "/>
									  </xsl:call-template>
									</span>
									<span style="float:left;">
									  <span class="styBoldText" style="float:left">
										<span style="width:14px"/>.
                                        <span style="width:14px"/>.
                                        <span style="width:14px"/>.
                                        <span style="width:14px"/>.
                                        <span style="width:13px"/>.
                                        <span style="width:13px"/>.
                                      </span>
									  <span style="float:left;padding-left:2mm;">
                                        Type <img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
									  </span>
									  <span style="width:32mm;padding-left:1mm;border-bottom:1 solid black;">
									    <xsl:call-template name="PopulateText">
										  <xsl:with-param name="TargetNode" 
									        select="$Form1065ScheduleK/OtherCreditsAndCreditRecapture/@note "/>
									    </xsl:call-template>
									  </span>
								    </span>
								  </td>
								  <td style="border-bottom:1px solid black;height:4mm;">
								    <span class="styLNRightNumBoxNBB" style="width:11.5mm;height:100%;">
								      15f<span style="vertical-align:baseline;height:100%;"/>
								    </span>
									<span class="styLNAmountBoxNBB" style="height:100%;">
									  <xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
										  select="$Form1065ScheduleK/OtherCreditsAndCreditRecapture "/>
									  </xsl:call-template>
									  <span style="vertical-align:baseline;height:100%;"/>
									</span>
								  </td>
								</tr>
								<!-- End Schedule K section "Credit and Credit Recapture", line 15a-f -->
								<!-- Begin Schedule K section "Foreign Transactions", Line 16a-n -->
								<xsl:choose>
									<xsl:when test="count($Form1065ScheduleK/ForeignTransactions) &gt; 0">
										<xsl:for-each select="$Form1065ScheduleK/ForeignTransactions">
											<xsl:call-template name="FrnTran"/>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="FrnTran"/>
									</xsl:otherwise>
								</xsl:choose>
								<!-- Begin Schedule K section "Alternative Minimum Tax (AMT) Items", Line 17a-f -->
								<tr>
									<td class="styIRS1065VTImageBox" rowspan="7" style="width:7.5mm;height:27mm;
									  padding-top:5mm;border-bottom:1px solid black;">
										<img src="{$ImagePath}/1065_Items.gif" alt="Alternative Minimum Tax AMT Items"/>
									</td>
								</tr>
								<!-- Schedule K, Line 17a -->
								<tr>
									<td>
										<span class="styLNLeftNumBox">17a</span>
										<span class="styIRS1065LNDesc">Post-1986 depreciation adjustment</span>
										<span style="float:right;">
											<span class="styIRS1065DotLn">...................</span>
										</span>
									</td>
									<td>
										<span class="styLNRightNumBox" style="width:11.5mm;height:4.5mm;">17a</span>
										<span class="styLNAmountBox" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												  select="$Form1065ScheduleK/Post1986DepreciationAdjustment"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<!-- Schedule K, Line 17b -->
								<tr>
									<td>
										<span class="styIRS1065LNLeftLtrBoxTD">b</span>
										<span class="styIRS1065LNDesc">Adjusted gain or loss 
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">
												  Form 1065, Schedule K, Line 17b - Adjusted gain or loss</xsl:with-param>
												<xsl:with-param name="TargetNode"
												  select="$Form1065ScheduleK/AdjustedGainOrLoss/@note"/>
											</xsl:call-template>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode"
												  select="$Form1065ScheduleK/AdjustedGainOrLoss"/>
											</xsl:call-template>
										</span>
										<span style="float:right;">
											<span class="styIRS1065DotLn">......................</span>
										</span>
									</td>
									<td>
										<span class="styLNRightNumBox" style="width:11.5mm;height:4.5mm;">17b</span>
										<span class="styLNAmountBox" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												  select="$Form1065ScheduleK/AdjustedGainOrLoss"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<!-- Schedule K, Line 17c -->
								<tr>
									<td>
										<span class="styIRS1065LNLeftLtrBoxTD">c</span>
										<span class="styIRS1065LNDesc">Depletion (other than oil and gas) </span>
										<span style="float:right;">
											<span class="styIRS1065DotLn">...................</span>
										</span>
									</td>
									<td>
										<span class="styLNRightNumBox" style="width:11.5mm;height:4.5mm;">17c</span>
										<span class="styLNAmountBox" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												  select="$Form1065ScheduleK/DepletionOtherThanOilAndGas"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<!-- Schedule K, Line 17d -->
								<tr>
									<td>
										<span class="styIRS1065LNLeftLtrBoxTD">d</span>
										<span class="styIRS1065LNDesc">
										  Oil, gas, and geothermal properties—gross income </span>
										<span style="float:right;">
											<span class="styIRS1065DotLn">..............</span>
										</span>
									</td>
									<td>
										<span class="styLNRightNumBox" style="width:11.5mm;height:4.5mm;">17d</span>
										<span class="styLNAmountBox" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												  select="$Form1065ScheduleK/OilGasGthrmlPropertiesGroIncm"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<!-- Schedule K, Line 17e -->
								<tr>
									<td>
										<span class="styIRS1065LNLeftLtrBoxTD">e</span>
										<span class="styIRS1065LNDesc">
										  Oil, gas, and geothermal properties—deductions </span>
										<span style="float:right;">
											<span class="styIRS1065DotLn">...............</span>
										</span>
									</td>
									<td>
										<span class="styLNRightNumBox" style="width:11.5mm;height:4.5mm;">17e</span>
										<span class="styLNAmountBox" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												  select="$Form1065ScheduleK/OilGasGthrmlPropertiesDed"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<!-- Schedule K, Line 17f -->
								<tr>
									<td style="border-bottom:1px solid black;">
										<span class="styIRS1065LNLeftLtrBoxTD" style="height:4mm;">f</span>
										<span class="styIRS1065LNDesc">Other AMT items (attach statement)
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherAMTItems"/>
											</xsl:call-template>
										</span>
										<span style="float:right;">
											<span class="styIRS1065DotLn">..................</span>
										</span>
									</td>
									<td style="border-bottom:1px solid black;">
										<span class="styLNRightNumBoxNBB" style="width:11.5mm;height:4.5mm;">17f</span>
										<span class="styLNAmountBoxNBB" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherAMTItems"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<!-- End Schedule K section "Alternative Minimum Tax (AMT) Items", Line 17a-f -->
								<!-- Begin Schedule K section "Other Information", Line 18a-20c -->
								<tr>
									<td class="styIRS1065VTImageBox" rowspan="9" style="width:7.5mm;height:22.5mm;
									  padding-left:2mm;">
										<img src="{$ImagePath}/1065_Information.gif" alt="Other information" 
										  style="height:28.5mm;"/>
									</td>
								</tr>
								<!-- Schedule K, Line 18a -->
								<tr>
									<td>
										<span class="styLNLeftNumBox">18a</span>
										<span class="styIRS1065LNDesc">Tax-exempt interest income</span>
										<span style="float:right;">
											<span class="styIRS1065DotLn">.....................</span>
										</span>
									</td>
									<td>
										<span class="styLNRightNumBox" style="width:11.5mm;height:4.5mm;">18a</span>
										<span class="styLNAmountBox" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												  select="$Form1065ScheduleK/TaxExemptInterestIncome"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<!-- Schedule K, Line 18b -->
								<tr>
									<td>
										<span class="styIRS1065LNLeftLtrBoxTD">b</span>
										<span class="styIRS1065LNDesc">Other tax-exempt income</span>
										<span style="float:right;">
											<span class="styIRS1065DotLn">......................</span>
										</span>
									</td>
									<td>
										<span class="styLNRightNumBox" style="width:11.5mm;height:4.5mm;">18b</span>
										<span class="styLNAmountBox" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												  select="$Form1065ScheduleK/OtherTaxExemptIncome"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<!-- Schedule K, Line 18c -->
								<tr>
									<td>
										<span class="styIRS1065LNLeftLtrBoxTD">c</span>
										<span class="styIRS1065LNDesc">Nondeductible expenses</span>
										<span style="float:right;">
											<span class="styIRS1065DotLn">......................</span>
										</span>
									</td>
									<td>
										<span class="styLNRightNumBox" style="width:11.5mm;height:4.5mm;">18c</span>
										<span class="styLNAmountBox" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												  select="$Form1065ScheduleK/NondeductibleExpenses"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<!-- Schedule K, Line 19a -->
								<tr>
									<td>
										<span class="styLNLeftNumBox">19a</span>
										<span class="styIRS1065LNDesc">Distributions of cash and marketable securities
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode"
												  select="$Form1065ScheduleK/DistributionsOfCashMrktblSec"/>
											</xsl:call-template>
										</span>
										<span style="float:right;">
											<span class="styIRS1065DotLn">.............</span>
										</span>
									</td>
									<td>
										<span class="styLNRightNumBox" style="width:11.5mm;height:4.5mm;">19a</span>
										<span class="styLNAmountBox" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												  select="$Form1065ScheduleK/DistributionsOfCashMrktblSec"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<!-- Schedule K, Line 19b -->
								<tr>
									<td>
										<span class="styIRS1065LNLeftLtrBoxTD">b</span>
										<span class="styIRS1065LNDesc">Distributions of other property
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode"
												  select="$Form1065ScheduleK/DistributionsOfOtherProperty"/>
											</xsl:call-template>
										</span>
										<span style="float:right;">
											<span class="styIRS1065DotLn">....................</span>
										</span>
									</td>
									<td>
										<span class="styLNRightNumBox" style="width:11.5mm;height:4.5mm;">19b</span>
										<span class="styLNAmountBox" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												  select="$Form1065ScheduleK/DistributionsOfOtherProperty"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<!-- Schedule K, Line 20a -->
								<tr>
									<td>
										<span class="styLNLeftNumBox">20a</span>
										<span class="styIRS1065LNDesc">Investment income</span>
										<span style="float:right;">
											<span class="styIRS1065DotLn">........................</span>
										</span>
									</td>
									<td>
										<span class="styLNRightNumBox" style="width:11.5mm;height:4.5mm;">20a</span>
										<span class="styLNAmountBox" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												  select="$Form1065ScheduleK/InvestmentIncome"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<!-- Schedule K, Line 20b -->
								<tr>
									<td>
										<span class="styIRS1065LNLeftLtrBoxTD">b</span>
										<span class="styIRS1065LNDesc">Investment expenses</span>
										<span style="float:right;">
											<span class="styIRS1065DotLn">.......................</span>
										</span>
									</td>
									<td>
										<span class="styLNRightNumBox" style="width:11.5mm;height:4.5mm;">20b</span>
										<span class="styLNAmountBox" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode"
												  select="$Form1065ScheduleK/InvestmentExpenses"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<!-- Schedule K, Line 20c -->
								<tr>
									<td valign="top">
										<span class="styIRS1065LNLeftLtrBoxTD">c</span>
										<span class="styIRS1065LNDesc">Other items and amounts (attach statement)
										</span>
										<span style="float:right;">
											<span class="styIRS1065DotLn">................</span>
										</span>
									</td>
									<td valign="top">
										<span class="styLNRightNumBoxNBB" style="width:11.5mm;height:4.5mm;
										  border-bottom-width: 0px;background-color:lightgrey"/>
										<span class="styLNAmountBoxNBB" style="height:4.5mm;border-bottom-width: 0px;
										  background-color:lightgrey">
											<!-- No element in the schema correspond to this line -->
										</span>
									</td>
								</tr>
								<!-- End Schedule K section "Foreign Transactions", Line 18a-20c -->
							</tbody>
						</table>
					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:right;">
							<span style="width:80px;"/>  
							  Form <span class="styBoldText" style="font-size:8pt;">1065</span> (2011)
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<!--Begin Page 5 -->
					<!-- Page Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 1065 (2011)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">5</span>
						</div>
					</div>
					<!-- END Page Header -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartDesc" style="width:187mm;padding-left:0mm;">Analysis of Net Income (Loss)</div>
					</div>
					<!--  Line 1 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">1</div>
						<div class="styLNDesc">
						 Net income (loss). Combine Schedule K, lines 1 through 11. From the result, subtract the sum of
						    <br/>Schedule K, lines 12 through 13d, and 16l
						    <span class="styBoldText">
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
						        <span style="width:16px"/>.
							    <span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:15px"/>.
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:8mm;padding-top:4mm;">1</div>
						<div class="styLNAmountBoxNBB" style="height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode"
								  select="$Form1065Data/AnalysisOfNetIncomeLoss/NetIncomeLoss"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 1 -->
					<!--  Line 2 -->
					<div style="width:187mm;">
						<table class="styTable" cellspacing="0" style="width:187mm;">
							<thead class="styTableThead">
								<tr>
									<td class="styLNLeftNumBox" style="width:5mm;font-size:7pt;vertical-align:top;">2</td>
									<td style="width:29mm;font-size:7pt;">Analysis by <br/>partner type:</td>
									<th class="styTableCellHeader" style="width:25mm;border-color:black;border-top-width:1px;
									  border-left-width:1px;font-size:7pt;" scope="col">
            (i)<span class="styNormalText"> Corporate</span>
									</th>
									<th class="styTableCellHeader" style="width:25mm;border-color:black;border-top-width:1px;
									  font-size:7pt;" scope="col">
            (ii)<span class="styNormalText"> Individual <br/>(active)</span>
									</th>
									<th class="styTableCellHeader" style="width:25mm;border-color:black;border-top-width:1px;
									  font-size:7pt;" scope="col">
            (iii)<span class="styNormalText"> Individual <br/>(passive)</span>
									</th>
									<th class="styTableCellHeader" style="width:25mm;border-color:black;border-top-width:1px;
									  font-size:7pt;" scope="col">
            (iv)<span class="styNormalText"> Partnership</span>
									</th>
									<th class="styTableCellHeader" style="width:25mm;border-color:black;border-top-width:1px;
									  font-size:7pt;" scope="col">
            (v)<span class="styNormalText"> Exempt <br/>organization</span>
									</th>
									<th class="styTableCellHeader" style="width:25mm;border-color:black;border-top-width:1px;
									  font-size:7pt;" scope="col">
            (vi)<span class="styNormalText" style="font-size:6pt;"> Nominee/Other</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!-- Begin Schedule AnalysisPartner Type Gen -->
								<xsl:choose>
									<xsl:when test="count($Form1065Data/AnalysisOfNetIncomeLoss/AnalysisPartnerTypeGenPartners) &gt; 0">
										<xsl:for-each select="$Form1065Data/AnalysisOfNetIncomeLoss/AnalysisPartnerTypeGenPartners">
											<xsl:call-template name="GenPart"/>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="GenPart"/>
									</xsl:otherwise>
								</xsl:choose>
								<!-- Begin Schedule AnalysisPartner Type Ltd -->
								<xsl:choose>
									<xsl:when test="count($Form1065Data/AnalysisOfNetIncomeLoss/AnalysisPartnerTypeLtdPartners) &gt; 0">
										<xsl:for-each select="$Form1065Data/AnalysisOfNetIncomeLoss/AnalysisPartnerTypeLtdPartners">
											<xsl:call-template name="LtdPart"/>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="LtdPart"/>
									</xsl:otherwise>
								</xsl:choose>
							</tbody>
						</table>
					</div>
					<!--  Line 2 -->
					<!-- BEGIN Schedule L Title -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="width:19.9mm;height:4mm;">Schedule L</div>
						<div class="styPartDesc" style="width:54mm;font-size:8pt;">Balance Sheets per Books</div>
						<div class="styLNAmountBox" style="text-align:center;border-bottom-width:0px;width:56mm;height:4mm;">
						  Beginning of tax year</div>
						<div class="styLNAmountBox" style="text-align:center;border-bottom-width:0px;width:56mm;height:4mm;">
						  End of tax year</div>
					</div>
					<!-- END Schedule L Title -->
					<!-- BEGIN Schedule L Line Items -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;"/>
						<div class="styGenericDiv" style="width:66mm;height:4.5mm;text-align:center;font-weight:bold;">Assets</div>
						<div class="styLNAmountBox" style="width:28mm;height:4.5mm;text-align:center;font-weight:bold;">(a)</div>
						<div class="styLNAmountBox" style="width:28mm;height:4.5mm;text-align:center;font-weight:bold;">(b)</div>
						<div class="styLNAmountBox" style="width:28mm;height:4.5mm;text-align:center;font-weight:bold;">(c)</div>
						<div class="styLNAmountBox" style="width:28mm;height:4.5mm;text-align:center;font-weight:bold;">(d)</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">1</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;">Cash
						<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
							</span>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-size:7pt;font-family:arial;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/CashBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-size:7pt;font-family:arial;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/CashEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-left:3mm;">2a</div>
						<div class="styLNDesc" style="width:66mm;height:5mm;">Trade notes and accounts receivable
							<span class="styBoldText">
								<span style="width:16px"/>.
								<span style="width:16px"/>.
							</span>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-size:7pt;font-family:arial;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/TradeNotesAcctReceivableBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-size:7pt;font-family:arial;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/TradeNotesAcctReceivableEOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBoxDD" style="height:4.5mm;">b</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;">Less allowance for bad debts
						<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
							</span>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-size:7pt;font-family:arial;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/BadDebtAllowanceBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-size:7pt;font-family:arial;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/BadDebtAllowanceBOY2"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-size:7pt;font-family:arial;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/BadDebtAllowanceEOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-size:7pt;font-family:arial;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/BadDebtAllowanceEOY2"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">3</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;">Inventories
						<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
							</span>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-size:7pt;font-family:arial;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/InventoriesBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-size:7pt;font-family:arial;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/InventoriesEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">4</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;">U.S. government obligations
						<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
						   </span>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-size:7pt;font-family:arial;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/USGovernmentObligationsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-size:7pt;font-family:arial;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/USGovernmentObligationsEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">5</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;font-size7pt;padding-top:1mm;">
							<span>Tax-exempt securities </span>
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
								<span style="width:16px"/>.
							</span>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-size:7pt;font-family:arial;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/TaxExemptSecuritiesBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-size:7pt;font-family:arial;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/TaxExemptSecuritiesEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5.5mm;padding-left:3mm;">6</div>
						<div class="styLNDesc" style="width:66mm;height:5.5mm;padding-top:1mm;font-size7pt;">
							<span>Other current assets (attach statement)</span>
							<span class="styBoldText">
								<span style="width:16px"/>.
							</span>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:.7px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherCurrentAssetsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="width:23mm;height:5.5mm; font-family:arial;
						  font-size:7pt;padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherCurrentAssetsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:.7px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherCurrentAssetsEOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="width:23mm;height:5.5mm; font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherCurrentAssetsEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">7a</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;">
							<span style="font-family:arial; font-size:7pt;">Loans to partners (or persons related to partners)</span>
							<span class="styBoldText">
								<span style="width:16px"/>.
							</span>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-size:7pt;font-family:arial;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/LoansToPartnersBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-size:7pt;font-family:arial;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/LoansToPartnersEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">7b</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;">Mortgage and real estate loans
						<span class="styBoldText">
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
							</span>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-size:7pt;font-family:arial;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/MortgageRealEstateLoansBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-size:7pt;font-family:arial;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/MortgageRealEstateLoansEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5.5mm;padding-left:3mm;">8</div>
						<div class="styLNDesc" style="width:66mm;height:5.5mm;font-size:7pt;">
						  Other investments (attach statement)
							<span class="styBoldText">
								<span style="width:16px"/>.
							</span>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:.7px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherInvestmentsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="width:23mm;height:5.5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherInvestmentsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5.5mm;font-family:arial;font-size:7pt;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:.7px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherInvestmentsEOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="width:23mm;height:5.5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherInvestmentsEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">9a</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;padding-top:1mm;">
							<span>Buildings and other depreciable assets</span>
							<span class="styBoldText">
								<span style="width:16px"/>.
							</span>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/BldgOtherDepreciableAssetsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/BldgOtherDepreciableAssetsEOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBoxDD" style="height:4.5mm;">b</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;">Less accumulated depreciation
						<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
								<span style="width:16px"/>.
							</span>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/AccumulatedDepreciationBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/AccumulatedDepreciationBOY2"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/AccumulatedDepreciationEOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/AccumulatedDepreciationEOY2"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">10a</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;">Depletable assets
						<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
							</span>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/DepletableAssetsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/DepletableAssetsEOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBoxDD" style="height:4.5mm;">b</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;">Less accumulated depletion
						<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							</span>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:4.5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/AccumulatedDepletionBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:4.5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/AccumulatedDepletionBOY2"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:4.5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/AccumulatedDepletionEOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:4.5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/AccumulatedDepletionEOY2"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">11</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;">Land (net of any amortization)
						<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
						    </span>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/LandBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/LandEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">12a</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;">Intangible assets (amortizable only)
						<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
						    </span>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/IntangibleAssetsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/IntangibleAssetsEOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBoxDD" style="height:4.5mm;">b</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;">Less accumulated amortization
						<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
								<span style="width:16px"/>.
						    </span>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:4.5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/AccumulatedAmortizationBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:4.5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/AccumulatedAmortizationBOY2"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:4.5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/AccumulatedAmortizationEOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:4.5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/AccumulatedAmortizationEOY2"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5.5mm;">13</div>
						<div class="styLNDesc" style="width:66mm;height:5.5mm;">Other assets (attach statement)
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
						    </span>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:.7px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherAssetsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="width:23mm;height:5.5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
						    <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherAssetsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:.7px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherAssetsEOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="width:23mm;height:5.5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherAssetsEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">14</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;">Total assets
						<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
								<span style="width:16px"/>.
							</span>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/TotalAssetsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/TotalAssetsEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;"/>
						<div class="styGenericDiv" style="width:66mm;height:5mm;text-align:center;">
							<span class="styBoldText">Liabilities and Capital</span>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">15</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;">Accounts payable
						<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							</span>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/AccountsPayableBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/AccountsPayableEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;">16</div>
						<div class="styLNDesc" style="width:66mm;height:5mm;">
							<span>Mortgages, notes, bonds payable in less than 1 <br/>year</span>
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
							</span>-->
						</div>
						<div class="styShadingCell" style="width:28mm;height:8mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:8mm;padding-top:2mm;font-family:arial;
						  font-size:7pt;padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/ShortTermPayableBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:8mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:8mm;padding-top:2mm;font-family:arial;
						  font-size:7pt;padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/ShortTermPayableEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5.5mm;">17</div>
						<div class="styLNDesc" style="width:66mm;height:5.5mm;font-size:7pt;padding-top:1mm;">
							<span>Other current liabilities (attach statement)
							</span>
							<span class="styBoldText">
								<span style="width:16px"/>.
							</span>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:.7px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherCurrentLiabilitiesBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="width:23mm;height:5.5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherCurrentLiabilitiesBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:.7px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherCurrentLiabilitiesEOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="width:23mm;height:5.5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherCurrentLiabilitiesEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">18</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;">All nonrecourse loans
						<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							</span>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/NonrecourseLoansBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/NonrecourseLoansEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">19a</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;">
							<span style="font-family:arial; font-size:7pt;">Loans from partners (or persons related to partners)
							</span>
							<span class="styBoldText">
								<span style="width:16px"/>.
							</span>
						</div>
						<!--Schedule L line 19a (b)-->
						<div class="styShadingCell" style="width:28mm;height:4.5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:4.5mm;padding-top:0mm;font-family:arial;
						  font-size:7pt;padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/LoansFromPartnersBOY"/>
							</xsl:call-template>
						</div>
						<!--Schedule L line 19a (d)-->
						<div class="styShadingCell" style="width:28mm;height:4.5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:4.5mm;padding-top:0mm;font-family:arial;
						  font-size:7pt;padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/LoansFromPartnersEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">19b</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;">
							<span style="font-family:arial; font-size:7pt;">Mortgages, notes, bonds payable in 1 year or more
							</span>
							<span class="styBoldText">
								<span style="width:16px"/>.
							</span>
						</div>
						<!--Schedule L line 19b (b)-->
						<div class="styShadingCell" style="width:28mm;height:4.5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:4.5mm;padding-top:0mm;font-family:arial;
						  font-size:7pt;padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/LongTermPayableBOY"/>
							</xsl:call-template>
						</div>
						<!--Schedule L line 19b (d)-->
						<div class="styShadingCell" style="width:28mm;height:4.5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:4.5mm;padding-top:0mm;font-family:arial;
						  font-size:7pt;padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/LongTermPayableEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5.5mm;">20</div>
						<div class="styLNDesc" style="width:66mm;height:5.5mm;">Other liabilities (attach statement)
							<span class="styBoldText">
								<span style="width:16px"/>.
								<span style="width:16px"/>.
							</span>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:.7px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherLiabilitiesBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="width:23mm;height:5.5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherLiabilitiesBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:.7px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherLiabilitiesEOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="width:23mm;height:5.5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherLiabilitiesEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">21</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;">Partners' capital accounts
						<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
						    </span>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/PartnersCapitalAccountsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/PartnersCapitalAccountsEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">22</div>
						<div class="styGenericDiv" style="width:66mm;height:4.5mm;padding-top:1mm;">Total liabilities and capital
						<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
						    </span>
						</div>
						<div class="styShadingCell" style="width:28mm;height:4.5mm;"/>
						<div class="styLNAmountBoxNBB" style="width:28mm;height:4.5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/TotalLiabilitiesCapitalBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:4.5mm;"/>
						<div class="styLNAmountBoxNBB" style="width:28mm;height:4.5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/TotalLiabilitiesCapitalEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END Schedule L Line Items -->
					<br style="page-break-after:always;"/>
					<!-- BEGIN Schedule M-1 Title -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="width:28mm;">Schedule M-1</div>
						<div class="styPartDesc" style="width:158mm;">
						  Reconciliation of Income (Loss) per Books With Income (Loss) per Return
							<br/>Note. <span style="font-weight:normal">
							 Schedule M-3 may be required instead of Schedule M-1 (see instructions).</span>
						</div>
					</div>
					<!-- END Schedule M-1 Title -->
					<!-- BEGIN Schedule M-1 Line Items -->
					<div class="styBB" style="width:187mm;clear:both;">
						<!-- BEGIN Left Side Table of Schedule M-1-->
						<table class="styTable" style="width:93mm;float:left;clear:none;font-size:7pt;" cellspacing="0">
							<thead/>
							<tfoot/>
							<tbody>
								<tr>
									<td class="styLNLeftNumBox" style="height:4.5mm;">1</td>
									<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">Net income (loss) per books
									    <!--Dotted Line-->
										<span class="styBoldText">
											<span style="width:16px"/>.
										</span>
									</td>
									<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;width:31mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleM1/NetIncomeLoss"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="vertical-align:top;">2</td>
									<td class="styGenericDiv" style="width:52mm;" colspan="2">
									  Income included on Schedule K, lines <br/>1, 2, 3c, 5, 6a, 7, 8, 9a, 10, and 11, 
										<br/>not recorded on books this year 
									</td>
									<td class="styLNAmountBoxNBB" style="border-right-width:1px;width:31mm;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="height:4.5mm;">
										<span style="width:3mm;"/>
									</td>
									<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
										<div class="styGenericDiv" style="width:23.5mm;">
                    (itemize):
                  <xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" 
												 select="$Form1065ScheduleM1/TotalTaxableIncomeNotRecOnBks"/>
											</xsl:call-template>
											<span style="width:1.5mm;"/>
										</div>
										<div class="styIRS1065BBText" style="width:23mm;float:left;text-align:right;font-size:6pt;">
											<span style="width:1px;"/>
										</div>
									</td>
									<td class="styLNAmountBox" style="border-bottom-width:0px;border-right-width:1px;width:31mm;">
										<xsl:attribute name="style">border-right-width:1px;width:31mm;</xsl:attribute>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleM1/TotalTaxableIncomeNotRecOnBks"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="vertical-align:top;">3</td>
									<td class="styGenericDiv" style="width:52mm;" colspan="2">
									  Guaranteed payments (other than <br/>health insurance)
									    <!--Dotted Line-->
										<span class="styBoldText">
											<span style="width:16px"/>.
											<span style="width:16px"/>.
											<span style="width:16px"/>.
									    </span>
									</td>
									<td class="styLNAmountBox" style="border-right-width:1px;width:31mm;padding-top:3mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleM1/GuaranteedPayments"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="vertical-align:top;">4</td>
									<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
									  Expenses recorded on books this year not
									  included on Schedule K, lines 1 through 13d, and 16l (itemize):
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleM1/ExpensesRecOnBksNotIncluded"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxNBB" style="border-right-width:1px;width:31mm;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="height:4.5mm;">
										<span style="width:3mm;"/>a</td>
									<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
										<div class="styGenericDiv" style="width:23.5mm;">
										  Depreciation<span style="width:1.5mm;"/>$</div>
										<div class="styIRS1065BBText" style="width:23mm;float:left;text-align:right;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleM1/Depreciation"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</div>
									</td>
									<td class="styLNAmountBoxNBB" style="border-right-width:1px;width:31mm;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="vertical-align:top;">
										<span style="width:3mm;"/>b</td>
									<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
										<div class="styGenericDiv" style="width:23.5mm;">
										  Travel and entertainment<span style="width:1.5mm;font-size:6pt;"/>$</div>
										<div class="styIRS1065BBText" style="width:23mm;float:left;text-align:right;font-size:6pt;padding-top:3mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleM1/TravelEntertainment"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</div>
									</td>
									<td class="styLNAmountBoxNBB" style="border-right-width:1px;width:31mm;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv" style="height:4.5mm;">
									<td class="styLNLeftNumBox" style="height:4.5mm;"/>
									<td class="styGenericDiv" style="width:52mm;height:4.5mm;padding-right:.5mm;" colspan="2"/>
									<td class="styLNAmountBoxNBB" style="border-right-width:1px;width:31mm;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv" style="height:4.5mm;">
									<td class="styLNLeftNumBox" style="height:4.5mm;"/>
									<td class="styGenericDiv" style="width:50mm;height:4.5mm;padding-right:.5mm;" colspan="2">
										<div class="styIRS1065BBText" style="width:50mm;height:4.5mm;text-align:right;font-size:6pt;"/>
									</td>
									<td class="styLNAmountBox" style="border-bottom-width:0px;border-right-width:1px;width:31mm;">
										<xsl:attribute name="style">padding-left:1mm;border-right-width:1px;width:31mm;</xsl:attribute>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleM1/ExpensesRecOnBksNotIncluded"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="height:4.5mm;">5</td>
									<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">Add lines 1 through 4
									    <!--Dotted Line-->
										<span class="styBoldText">
											<span style="width:16px"/>.
											<span style="width:16px"/>.
											<span style="width:16px"/>.
										</span>
									</td>
									<td class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:1px;width:31.5mm;
									  padding-top:1.5mm;padding-bottom:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleM1/LossTotal"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
							</tbody>
						</table>
						<!-- END Left Side table of Schedule M-1-->
						<!-- BEGIN Right Side table of Schedule M-1-->
						<table class="styTable" style="width:94mm;float:left;clear:none;font-size:7pt;" cellspacing="0">
							<thead/>
							<tfoot/>
							<tbody>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBox" style="height:4.5mm;width:7.5mm;vertical-align:top;">6</td>
									<td class="styGenericDiv" style="width:51.5mm;height:4.5mm;" colspan="2">
									  Income recorded on books this year not included
									  on Schedule K, lines 1 through 11 (itemize):
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleM1/TotalIncomeRecordedNotIncluded"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxNBB" style="width:31mm;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv" style="width:51.5mm;">
									<td class="styLNLeftLtrBox" style="height:4.5mm;">a</td>
									<td class="styGenericDiv" style="width:29mm;height:4.5mm;">
										<span class="stySmallText">Tax-exempt interest 
											<span style="width:4px;"/>$</span>
									</td>
									<td class="styIRS1065BBText" style="width:23mm;font-size:6pt;text-align:right;font-family:verdana;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleM1/TaxExemptInterest"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBoxNBB" style="width:31mm;height:9mm;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv" style="height:4.5mm;">
									<td class="styLNLeftNumBox" style="height:4.5mm;"/>
									<td class="styGenericDiv" style="width:52mm;height:4.5mm;padding-right:.5mm;" colspan="2">
										<div class="styIRS1065BBText" style="width:50mm;height:4.5mm;text-align:right;font-size:6pt;"/>
									</td>
									<td class="styLNAmountBox" style="border-bottom-width:0px;width:31mm;">
										<xsl:attribute name="style">width:31mm;</xsl:attribute>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleM1/TotalIncomeRecordedNotIncluded"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBox" style="height:4.5mm;width:7.5mm;vertical-align:top;">7</td>
									<td class="styGenericDiv" style="width:51.5mm;height:4.5mm;" colspan="2">
									  Deductions included on Schedule K, lines 1
									  through 13d, and 16l, not <br/>charged against
									  book income this year (itemize):
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleM1/TotalDeductionsNotCharged"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxNBB" style="width:31mm;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv" style="width:51.5mm;">
									<td class="styLNLeftNumBox" style="height:4.5mm;">
										<span style="width:3mm;"/>a</td>
									<td class="styGenericDiv" style="width:29mm;height:4.5mm;">
									  Depreciation<span style="width:4px;"/>$</td>
									<td class="styIRS1065BBText" style="width:23mm;font-size:6pt;text-align:right;font-family:verdana;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleM1/DepreciationDeduction"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxNBB" style="width:31mm;height:9mm;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv" style="height:4.5mm;">
									<td class="styLNLeftNumBox" style="height:4.5mm;"/>
									<td class="styGenericDiv" style="width:52mm;height:4.5mm;padding-right:.5mm;" colspan="2">
										<div class="styIRS1065BBText" style="width:50mm;height:4.5mm;text-align:right;font-size:6pt;"/>
									</td>
									<td class="styLNAmountBox" style="border-bottom-width:0px;width:31mm;">
										<xsl:attribute name="style">width:31mm;</xsl:attribute>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleM1/TotalDeductionsNotCharged"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBox" style="height:5.5mm;">8</td>
									<td class="styGenericDiv" style="width:52mm;height:5.5mm;" colspan="2">Add lines 6 and 7
										<!--Dotted Line-->
										<span class="styBoldText">
											<span style="width:15px"/>.
											<span style="width:15px"/>.
											<span style="width:15px"/>.
										    <span style="width:15px"/>.
										</span>
									</td>
									<td class="styLNAmountBox" style="height:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleM1/TotalIncomeDeductions"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBox" style="height:5mm;vertical-align:top;">9</td>
									<td class="styGenericDiv" style="width:52mm;height:5mm;font-size:6pt;" colspan="2">
									  Income (loss) (Analysis of Net Income (Loss), line 1). Subtract line 8 from line 5</td>
									<td class="styLNAmountBox" style="height:5mm;border-bottom-width: 0px; padding-top:1mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleM1/NetIncome"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
							</tbody>
						</table>
						<!-- END Right Side Table of Schedule M-1-->
					</div>
					<!--br style="page-break-after:always;"/-->
					<!-- BEGIN Schedule M-2 Title -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="width:28mm;">Schedule M-2</div>
						<div class="styPartDesc" style="width:158mm;height:">
						  Analysis of Partners' Capital Accounts
						    <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleM2"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END Schedule M-2 Title -->
					<!-- BEGIN Schedule M-2 Line Items -->
					<div style="width:187mm;clear:both;" class="styBB">
						<!-- BEGIN Left Side Table of Schedule M-2-->
						<table class="styTable" style="width:93mm;float:left;clear:none;font-size:7pt;" cellspacing="0">
							<tr class="styGenericDiv">
								<td class="styLNLeftNumBox" style="height:4.5mm;">1</td>
								<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">Balance at beginning of year
								<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:16px"/>.
										<span style="width:16px"/>.
									</span>
								</td>
								<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM2/BalanceBOY"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr class="styGenericDiv">
								<td class="styLNLeftNumBox" style="height:4.5mm;">2</td>
								<td class="styGenericDiv" style="width:20mm;height:4.5mm;font-size:5pt;">
								 Capital Contributed:
								</td>
								<td class="styGenericDiv" style="width:32mm;height:4.5mm;">
									<span class="styBoldText">a</span>
									<span style="width:4px"/>Cash
								<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:16px"/>.
									    <span style="width:16px"/>.
									    <span style="width:16px"/>.
									</span>
								</td>
								<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM2/CashCapitalContributed"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr class="styGenericDiv">
								<td class="styLNLeftNumBox" style="height:4.5mm;"/>
								<td class="styGenericDiv" style="width:20mm;height:4.5mm;"/>
								<td class="styGenericDiv" style="width:32mm;height:4.5mm;">
									<span class="styBoldText">b</span>
									<span style="width:4px"/>Property
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:16px"/>.
										<span style="width:16px"/>.
									</span>
								</td>
								<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM2/PropertyCapitalContributed"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr class="styGenericDiv">
								<td class="styLNLeftNumBox" style="height:4.5mm;">3</td>
								<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">Net income (loss) per books
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:16px"/>.
									    <span style="width:16px"/>.
									</span>
								</td>
								<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM2/NetIncomeLossPerBooks"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr class="styGenericDiv">
								<td class="styLNLeftNumBox" style="height:4.5mm;">4</td>
								<td class="styLNDesc" style="width:52mm;height:4.5mm;vertical-align:bottom;padding-top:1.5mm;" colspan="2">
									<div class="styGenericDiv" style="width:40mm;">Other increases (itemize):
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleM2/TotalOtherIncreases"/>
										</xsl:call-template>
									</div>
									<div class="styIRS1065BBText" style="width:9mm;float:left;"/>
								</td>
								<td class="styLNAmountBoxNBB" style="width:31mm;border-right-width:1px;">
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr class="styGenericDiv" style="height:4.5mm;">
								<td class="styLNLeftNumBox" style="height:4.5mm;"/>
								<td class="styGenericDiv" style="width:52mm;height:4.5mm;padding-right:2mm;" colspan="2">
									<div class="styIRS1065BBText" style="width:49mm;text-align:right;height:4.5mm;padding-right:3mm;"/>
								</td>
								<td class="styLNAmountBox" style="border-bottom-width:0px;border-right-width:1px;width:31mm;">
									<xsl:attribute name="style">border-right-width:1px;width:31mm;</xsl:attribute>
									<span style="width:1px;"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM2/TotalOtherIncreases"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr class="styGenericDiv">
								<td class="styLNLeftNumBox" style="height:4.5mm;">5</td>
								<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
								  Add lines 1 through 4
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:16px"/>.
									    <span style="width:16px"/>.
									    <span style="width:16px"/>.
									</span>
								</td>
								<td class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM2/BalanceIncomeOtherIncreases"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
						</table>
						<!-- END Left Side Table of Schedule M-2-->
						<!-- BEGIN Right Side Table of Schedule M-2-->
						<table class="styTable" style="width:94mm;float:left;clear:none;font-size:7pt;" cellspacing="0">
							<tr class="styGenericDiv">
								<td class="styLNLeftNumBox" style="height:4.5mm;">6</td>
								<td class="styGenericDiv" style="width:20mm;height:4.5mm;">
								 Distributions:</td>
								<td class="styGenericDiv" style="width:32mm;height:4.5mm;">
									<span class="styBoldText">a</span>
									<span style="width:4px"/>Cash
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:16px"/>.
									    <span style="width:16px"/>.
										<span style="width:16px"/>.
									</span>
								</td>
								<td class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM2/CashDistribution"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr class="styGenericDiv">
								<td class="styLNLeftNumBox" style="height:4.5mm;"/>
								<td class="styGenericDiv" style="width:20mm;height:4.5mm;"/>
								<td class="styGenericDiv" style="width:32mm;height:4.5mm;">
									<span class="styBoldText">b</span>
									<span style="width:4px"/>Property
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:16px"/>.
										<span style="width:16px"/>.
									</span>
								</td>
								<td class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM2/PropertyDistribution"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr class="styGenericDiv">
								<td class="styLNLeftNumBox" style="height:4.5mm;">7</td>
								<td class="styLNDesc" style="width:52mm;height:4.5mm;vertical-align:bottom;padding-top:1.5mm;" colspan="2">
									<div class="styGenericDiv" style="width:40mm;">Other decreases (itemize):
									   <xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleM2/TotalOtherDecreases"/>
										</xsl:call-template>
									</div>
									<div class="styIRS1065BBText" style="width:9mm;float:left;"/>
								</td>
								<td class="styLNAmountBoxNBB" style="width:31mm;">
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr class="styGenericDiv" style="height:4.5mm;">
								<td class="styLNLeftNumBox" style="height:4.5mm;"/>
								<td class="styGenericDiv" style="width:52mm;height:4.5mm;padding-right:2mm;" colspan="2">
									<div class="styIRS1065BBText" style="width:49mm;text-align:right;height:4.5mm;padding-right:3mm;"/>
								</td>
								<td class="styLNAmountBox" style="border-bottom-width:0px;width:31mm;">
									<xsl:attribute name="style">width:31mm;</xsl:attribute>
									<span style="width:1px;"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM2/TotalOtherDecreases"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr class="styGenericDiv">
								<td class="styLNLeftNumBox" style="height:5mm;">8</td>
								<td class="styGenericDiv" style="width:52mm;height:5mm;" colspan="2">Add lines 6 and 7
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:16px"/>.
									    <span style="width:16px"/>.
									    <span style="width:16px"/>.
									    <span style="width:16px"/>.
									</span>
								</td>
								<td class="styLNAmountBox" style="height:5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM2/Total"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr class="styGenericDiv">
								<td class="styLNLeftNumBox" style="vertical-align:top;height:9mm;">9</td>
								<td class="styGenericDiv" style="width:52mm;font-size:7pt;height:9mm;" colspan="2">
								  Balance at end of year. Subtract line 8 from line 5</td>
								<td class="styLNAmountBox" style="border-bottom-width:0px;height:9mm;">
									<span style="vertical-align:baseline;height:100%;"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM2/BalanceEOY"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
						</table>
						<!-- END Right Side Table of Schedule M-2-->
					</div>
					<!-- END Schedule M-2 Line Items -->
					<!--div class="styBB" style="width:187mm;">
					</div-->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="width:100mm;float:left;">
							<span style="width:90mm;"/>
						</div>
						<div style="float:right;">
							<span style="width:80px;"/>  
							  Form <span class="styBoldText" style="font-size:8pt;">1065</span> (2011)
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">Additional Data</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" 
							  onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form1065Data"/>
							<xsl:with-param name="DescWidth" select="130"/>
						</xsl:call-template>
						<!-- Had to hardcode the table as a checkbox has to be represented.
							  There is no predefined template to represent the checkbox -->
						<xsl:if test="$Form1065Data/Section761aElection">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:130mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1065Data/Section761aElection"/>
											<xsl:with-param name="BackupName">Section761aElection</xsl:with-param>
										</xsl:call-template>
									  Form 1065, Top Left Margin - Section 761(a) election:</label>
								</td>
								<td class="styLeftOverTableRowAmount" style="width:57mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1065Data/Section761aElection"/>
											<xsl:with-param name="BackupName">Section764Election</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="$Form1065Data/CommonTrust">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:130mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1065Data/CommonTrust"/>
											<xsl:with-param name="BackupName">CommonTrust</xsl:with-param>
										</xsl:call-template>
									  Form 1065, Top Left Margin - Common Trust:</label>
								</td>
								<td class="styLeftOverTableRowAmount" style="width:57mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1065Data/CommonTrust"/>
											<xsl:with-param name="BackupName">CommonTrust</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="$Form1065Data/Nominee">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:130mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1065Data/Nominee"/>
											<xsl:with-param name="BackupName">Nominee</xsl:with-param>
										</xsl:call-template>
									  Form 1065, Top Left Margin - Nominee:</label>
								</td>
								<td class="styLeftOverTableRowAmount" style="width:57mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1065Data/Nominee"/>
											<xsl:with-param name="BackupName">Nominee</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="$Form1065Data/IRC6114">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:130mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1065Data/IRC6114"/>
											<xsl:with-param name="BackupName">IRC6114</xsl:with-param>
										</xsl:call-template>
									  Form 1065, Top Left Margin - IRC 6114:</label>
								</td>
								<td class="styLeftOverTableRowAmount" style="width:57mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1065Data/IRC6114"/>
											<xsl:with-param name="BackupName">IRC6114</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="$Form1065Data/ThreeAndOneHalfPctGrsIncomeTax">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:130mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode"
											  select="$Form1065Data/IThreeAndOneHalfPctGrsIncomeTax"/>
											<xsl:with-param name="BackupName">ThreeAndOneHalfPctGrsIncomeTax
											</xsl:with-param>
										</xsl:call-template>
                                          Form 1065, Top Left Margin - Three And One Half Pct Gross Income Tax:
                                    </label>
								</td><br/>
								<td class="styLeftOverTableRowAmount" style="width:57mm;">
								    <input type="checkbox" alt="alt" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode"
											  select="$Form1065Data/ThreeAndOneHalfPctGrsIncomeTax"/>
											<xsl:with-param name="BackupName">ThreeAndOneHalfPctGrsIncomeTax
											</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRow">
						   <xsl:with-param name="Desc">Form 1065, Schedule B, Line 11 - Form 3520 Indicator
						   </xsl:with-param>
						   <xsl:with-param name="TargetNode" 
						     select="$Form1065ScheduleB/ReceivedDistriFromForeignTrust/@form3520Indicator"/>
						   <xsl:with-param name="DescWidth" select="130"/>
						</xsl:call-template>
						<!--<xsl:call-template name="PopulateLeftoverRow">
                           <xsl:with-param name="Desc">Form 1065, Schedule B, Line 12a - Section 754 Election
                           </xsl:with-param>
                           <xsl:with-param name="TargetNode"    
                             select="$Form1065ScheduleB/Section754ElectionMade/@referenceDocumentId"/>
                           <xsl:with-param name="DescWidth" select="100"/>
                        </xsl:call-template>
                        <xsl:call-template name="PopulateLeftoverRow">
                           <xsl:with-param name="Desc">Form 1065, Schedule B, Line 15 - Number of Forms 8858
                           </xsl:with-param>
                           <xsl:with-param name="TargetNode"
                             select="$Form1065ScheduleB/NumberOfF8858/@referenceDocumentId"/>
                           <xsl:with-param name="DescWidth" select="101"/>
                        </xsl:call-template>-->
						<xsl:call-template name="PopulateLeftoverRowAmount">
						   <xsl:with-param name="Desc">Form 1065, Schedule K, Line 17b - Adjusted gain or loss
						   </xsl:with-param>
						   <xsl:with-param name="TargetNode" 
						     select="$Form1065ScheduleK/AdjustedGainOrLoss/@note"/>
						   <xsl:with-param name="DescWidth" select="130"/>
						</xsl:call-template>
					</table>
					<br/>
					<table id="SpecialConditionDescriptionTbl" class="styDepTbl">
        	          <thead class="styTableThead">
        		        <tr class="styDepTblHdr">
           		          <th class="styDepTblCell"  scope="col" style="width: 60mm;text-align:left">
           		            Special Condition Description</th>
           		        </tr>
					  </thead>
      	              <xsl:for-each select="$Form1065Data/SpecialConditionDescription">
        		        <tr>
          		          <xsl:attribute name="class">
          			        <xsl:choose>
             				  <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             				  <xsl:otherwise>styDepTblRow2</xsl:otherwise>
         				    </xsl:choose>
         			      </xsl:attribute>
         			      <td class="styDepTblCell" style="text-align:left;" >
            			    <xsl:call-template name="PopulateText">          
                		      <xsl:with-param name="TargetNode" select="." />
           			        </xsl:call-template>
         			      </td>   
         			   	</tr>
     	              </xsl:for-each>
    	            </table>
					<!-- END Left Over Table -->
					<!-- Additional Data Table -->
					<!-- Separated Data for Schedule B, Line 3a  -->
					<xsl:if test="($Print = $Separated) and  (count($Form1065ScheduleB/EntityOwnIntGrp) &gt;2)">
						<br/>
						<span class="styRepeatingDataTitle">Form 1065 Schedule B, Line 3a</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<thead class="styTableThead">
								<!-- Label the Column Headers -->
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" valign="middle">(i) Name of Entity</th>
									<th class="styDepTblCell" scope="col" valign="middle">(ii) Employer Identification Number (if any)</th>
									<th class="styDepTblCell" scope="col" valign="middle">(iii) Type of Entity</th>
									<th class="styDepTblCell" scope="col" valign="middle">(iv) Country of Organization</th>
									<th class="styDepTblCell" scope="col" align="center" valign="middle">
									  (v) Maximum Percentage Owned in Profit, Loss, or Capital</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1065ScheduleB/EntityOwnIntGrp">
									<tr style="border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose>
										<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
										<xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!-- First Column -->
										<td class="styTableCellText" align="left">
											<div style="width:76mm;">
												<span style="float:left;">
													<xsl:if test="NameOfEntity">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="NameOfEntity"/>
														</xsl:call-template>
													</xsl:if>
												</span>
											</div>
										</td>
										<!-- Second Column -->
										<td class="styTableCellText">
											<div style="width:26mm;" align="center">
												<span style="">
													<xsl:choose>
														<xsl:when test="EIN">
															<xsl:call-template name="PopulateEIN">
																<xsl:with-param name="TargetNode" select="EIN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="MissingEINReason"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</span>
											</div>
										</td>
										<!-- Third Column -->
										<td class="styTableCellText">
											<div style="width:26mm;" align="left">
												<span style="">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="TypeOfEntity"/>
													</xsl:call-template>
												</span>
											</div>
										</td>
										<!-- Fourth Column -->
										<td class="styTableCellText">
											<div style="width:29mm;" align="center">
												<span style="">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="CountryOfOrganization"/>
													</xsl:call-template>
												</span>
											</div>
										</td>
										<!-- Fifth Column -->
										<td class="styTableCellCtr">
											<div style="width:33mm;" align="center">
												<span style="">
													<xsl:call-template name="PopulatePercent">
														<xsl:with-param name="TargetNode" select="MaxPctOwned"/>
													</xsl:call-template>
												</span>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- End Separated Data for Schedule B, Line 3a -->
					<!-- Separated Data for Schedule B, Line 3b  -->
					<xsl:if test="($Print = $Separated) and  (count($Form1065ScheduleB/IndivOrEstateOwnIntGrp) &gt;2)">
						<br/>
						<span class="styRepeatingDataTitle">Form 1065 Schedule B, Line 3b</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<thead class="styTableThead">
								<!-- Label the Column Headers -->
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" valign="middle">(i) Name of Individual or Estate</th>
									<th class="styDepTblCell" scope="col" valign="middle">
									  (ii) Social Security Number or Employer Identification Number (if any)</th>
									<th class="styDepTblCell" scope="col" valign="middle">(iii) Country of Citizenship 
										<br/>(see instructions)</th>
									<th class="styDepTblCell" scope="col" align="center" valign="middle">
									  (iv) Maximum Percentage Owned in Profit, Loss, or Capital</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1065ScheduleB/IndivOrEstateOwnIntGrp">
									<tr style="border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose>
										<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
										<xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!-- First Column -->
										<td class="styTableCellText" align="left">
											<div style="width:78mm;">
												<span style="float:left;">
													<xsl:if test="NameOfIndivOrEstate">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="NameOfIndivOrEstate"/>
														</xsl:call-template>
													</xsl:if>
												</span>
											</div>
										</td>
										<!-- Second Column -->
										<td class="styTableCellText">
											<div style="width:46mm;" align="center">
												<span style="">
													<xsl:choose>
														<xsl:when test="SSN">
															<xsl:call-template name="PopulateSSN">
																<xsl:with-param name="TargetNode" select="SSN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:when test="EIN">
															<xsl:call-template name="PopulateEIN">
																<xsl:with-param name="TargetNode" select="EIN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="MissingEINReason"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</span>
											</div>
										</td>
										<!-- Third Column -->
										<td class="styTableCellText">
											<div style="width:29mm;" align="center">
												<span style="">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="CountryOfCitizenship"/>
													</xsl:call-template>
												</span>
											</div>
										</td>
										<!-- Fourth Column -->
										<td class="styTableCellCtr">
											<div style="width:33mm;" align="center">
												<span style="">
													<xsl:call-template name="PopulatePercent">
														<xsl:with-param name="TargetNode" select="MaxPctOwn"/>
													</xsl:call-template>
												</span>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- End Separated Data for Schedule B, Line 3b -->
					<!-- Separated Data for Schedule B, Line 4a  -->
					<xsl:if test="($Print = $Separated) and  (count($Form1065ScheduleB/PctTotalVotingPowerOwnGrp) &gt;2)">
						<br/>
						<span class="styRepeatingDataTitle">Form 1065 Schedule B, Line 4a</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<thead class="styTableThead">
								<!-- Label the Column Headers -->
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" valign="middle">(i) Name of Corporation</th>
									<th class="styDepTblCell" scope="col" valign="middle">(ii) Employer Identification Number (if any)</th>
									<th class="styDepTblCell" scope="col" valign="middle">(iii) Country of Incorporation</th>
									<th class="styDepTblCell" scope="col" align="center" valign="middle">
									  (iv) Percentage Owned in Voting Stock</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1065ScheduleB/PctTotalVotingPowerOwnGrp">
									<tr style="border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose>
										<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
										<xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!-- First Column -->
										<td class="styTableCellText" align="left">
											<div style="width:78mm;">
												<span style="float:left;">
													<xsl:if test="NameOfCorp">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="NameOfCorp"/>
														</xsl:call-template>
													</xsl:if>
												</span>
											</div>
										</td>
										<!-- Second Column -->
										<td class="styTableCellText">
											<div style="width:46mm;" align="center">
												<span style="">
													<xsl:choose>
														<xsl:when test="SSN">
															<xsl:call-template name="PopulateSSN">
																<xsl:with-param name="TargetNode" select="SSN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:when test="EIN">
															<xsl:call-template name="PopulateEIN">
																<xsl:with-param name="TargetNode" select="EIN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="MissingEINReason"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</span>
											</div>
										</td>
										<!-- Third Column -->
										<td class="styTableCellText">
											<div style="width:29mm;" align="center">
												<span style="">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="CountryOfIncorp"/>
													</xsl:call-template>
												</span>
											</div>
										</td>
										<!-- Fourth Column -->
										<td class="styTableCellCtr">
											<div style="width:33mm;" align="center">
												<span style="">
													<xsl:call-template name="PopulatePercent">
														<xsl:with-param name="TargetNode" select="MaxPctOwnInVotingStk"/>
													</xsl:call-template>
												</span>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- End Separated Data for Schedule B, Line 4a -->
					<!-- Separated Data for Schedule B, Line 4b  -->
					<xsl:if test="($Print = $Separated) and  (count($Form1065ScheduleB/OwnForeignOrDomesticGrp) &gt;2)">
						<br/>
						<span class="styRepeatingDataTitle">Form 1065 Schedule B, Line 4b</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<thead class="styTableThead">
								<!-- Label the Column Headers -->
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" valign="middle">(i) Name of Entity</th>
									<th class="styDepTblCell" scope="col" valign="middle">(ii) Employer Identification Number (if any)</th>
									<th class="styDepTblCell" scope="col" valign="middle">(iii) Type of Entity</th>
									<th class="styDepTblCell" scope="col" valign="middle">(iv) Country of Organization</th>
									<th class="styDepTblCell" scope="col" align="center" valign="middle">
									  (v) Maximum Percentage Owned in Profit, Loss, or Capital</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1065ScheduleB/OwnForeignOrDomesticGrp">
									<tr style="border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose>
										<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
										<xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!-- First Column -->
										<td class="styTableCellText" align="left">
											<div style="width:76mm;">
												<span style="float:left;">
													<xsl:if test="NameOfEntity">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="NameOfEntity"/>
														</xsl:call-template>
													</xsl:if>
												</span>
											</div>
										</td>
										<!-- Second Column -->
										<td class="styTableCellText">
											<div style="width:26mm;" align="center">
												<span style="">
													<xsl:choose>
														<xsl:when test="EIN">
															<xsl:call-template name="PopulateEIN">
																<xsl:with-param name="TargetNode" select="EIN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="MissingEINReason"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</span>
											</div>
										</td>
										<!-- Third Column -->
										<td class="styTableCellText">
											<div style="width:26mm;" align="left">
												<span style="">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="TypeOfEntity"/>
													</xsl:call-template>
												</span>
											</div>
										</td>
										<!-- Fourth Column -->
										<td class="styTableCellText">
											<div style="width:29mm;" align="center">
												<span style="">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="CountryOfOrganization"/>
													</xsl:call-template>
												</span>
											</div>
										</td>
										<!-- Fifth Column -->
										<td class="styTableCellCtr">
											<div style="width:33mm;" align="center">
												<span style="">
													<xsl:call-template name="PopulatePercent">
														<xsl:with-param name="TargetNode" select="MaximumPctOwned"/>
													</xsl:call-template>
												</span>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- End Separated Data for Schedule B, Line 4b -->
				</form>
			</body>
		</html>
	</xsl:template>
	<!-- Begin Foreign Transaction Schedule K -->
	<xsl:template name="FrnTran">
		<tr>
			<td class="styIRS1065VTImageBox" rowspan="13" style="width:7.5mm;height:43mm;
			  border-bottom:1px solid black;padding-left:2mm;">
				<img src="{$ImagePath}/1065_Transactions.gif" alt="Foreign Transactions"/>
			</td>
		</tr>
		<!-- Schedule K, Line 16a -->
		<tr>
			<td>
				<span class="styLNLeftNumBox" style="padding-top:1mm;height:4mm;">16a
                </span>
				<span class="styIRS1065LNDesc" style="height:4mm;">Name of country or U.S. possession
                    <xsl:if test="ForeignCountryOrUSPossession">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossession"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="ForeignCountryOrUSPossVARIOUS">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossVARIOUS"/>
						</xsl:call-template>
					</xsl:if>
					<span style="width:10px;"/>
					<img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
					<span style="width:4px;"/>
					<span style="width:65mm;height:4mm;border-bottom:1 solid black;">
						<xsl:if test="ForeignCountryOrUSPossession">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossession"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="ForeignCountryOrUSPossVARIOUS">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossVARIOUS"/>
							</xsl:call-template>
						</xsl:if>
					</span>
				</span>
			</td>
			<td>
				<span class="styLNRightNumBoxNBB" style="width:11.5mm;height:5mm;background-color:lightgrey;"/>
				<span class="styLNAmountBoxNBB" style="height:5mm;"/>
			</td>
		</tr>
		<!-- Schedule K, Line 16b -->
		<tr>
			<td>
				<span class="styIRS1065LNLeftLtrBoxTD" style="height:4mm;">b</span>
				<span class="styIRS1065LNDesc" style="height:4mm;">Gross income from all sources</span>
				<span style="float:right;">
					<span class="styIRS1065DotLn">.....................</span>
				</span>
			</td>
			<td>
				<span class="styLNRightNumBox" style="width:11.5mm;height:4mm;">16b</span>
				<span class="styLNAmountBox" style="height:4mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="GrossIncomeFromAllSources"/>
					</xsl:call-template>
				</span>
			</td>
		</tr>
		<!-- Schedule K, Line 16c -->
		<tr>
			<td>
				<span class="styIRS1065LNLeftLtrBoxTD" style="height:4mm;">c</span>
				<span class="styIRS1065LNDesc" style="height:4mm;">Gross income sourced at partner level
                    <xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="GrossIncmSrcdAtPartnerLevel"/>
					</xsl:call-template>
				</span>
				<span style="float:right;">
					<span class="styIRS1065DotLn">.................</span>
				</span>
			</td>
			<td>
				<span class="styLNRightNumBox" style="width:11.5mm;height:4mm;">16c</span>
				<span class="styLNAmountBox" style="height:4mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="GrossIncmSrcdAtPartnerLevel"/>
					</xsl:call-template>
				</span>
			</td>
		</tr>
		<!-- Schedule K - Line 16c expla -->
		<tr>
			<td>
				<span class="styIRS1065LNLeftLtrBoxTD" style="height:4mm;"/>
				<span class="styIRS1065LNDesc" style="height:4mm;">
					Foreign gross income sourced at partnership level
				</span>
			</td>
			<td>
				<span class="styLNRightNumBoxNBB" style="width:11.5mm;height:5mm;background-color:lightgrey;"/>
				<span class="styLNAmountBoxNBB" style="height:5mm;"/>
			</td>
		</tr>
		<!-- Schedule K, Line 16d,e,f -->
		<tr>
			<td>
				<span class="styIRS1065LNLeftLtrBoxTD" style="height:4mm;padding-top:1mm">d</span>
				<span class="styIRS1065LNDesc" style="height:4mm;">Passive category
                          <img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
					<span style="width:22mm;font-family:arial; font-size:7pt; text-align:right; border-bottom:1 solid black; height:4mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="FrgnGroIncmSrcdPrtShpLvlPssv"/>
						</xsl:call-template>
					</span>
				</span>
				<span style="font-size:7pt;font-weight:bold; padding-left:3mm; height:4mm; padding-top:1.2mm;">e</span>
				<span style="width=1mm;"/>
				<span style="font-size:7pt; height:4mm; vertical-align:bottom;">General category
                          <img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
					<span style="width:22mm;font-family:arial; font-size:7pt; text-align:right; border-bottom:1 solid black; height:4mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="ForeignGroIncmSrcdPrtshpLvlGC"/>
						</xsl:call-template>
					</span>
				</span>
				<span style="font-size:7pt; font-weight:bold; padding-left:3mm; height:4mm; padding-top:1.2mm;">f</span>
				<span style="width:1mm;"/>
				<span style="font-size:7pt; height:4mm; vertical-align:bottom;padding-top:1.2mm;">Other 
                    <xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="ForeignGroIncmSrcdPrtshpLvlOth"/>
					</xsl:call-template>
					<span style="width:1mm;"/>
					<img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
				</span>
			</td>
			<td>
				<span class="styLNRightNumBox" style="width:11.5mm;height:5.5mm;">16f</span>
				<span class="styLNAmountBox" style="height:5.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="ForeignGroIncmSrcdPrtshpLvlOth"/>
					</xsl:call-template>
				</span>
			</td>
		</tr>
		<!-- Schedule K - Line 16d expla -->
		<tr>
			<td>
				<span class="styIRS1065LNLeftLtrBoxTD" style="height:4mm;"/>
				<span class="styGenericDiv" style="height:4mm;font-size:7pt;">
					Deductions allocated and apportioned at partner level
				</span>
			</td>
			<td>
				<span class="styLNRightNumBoxNBB" style="width:11.5mm;height:5mm;background-color:lightgrey;"/>
				<span class="styLNAmountBoxNBB" style="height:5mm;"/>
			</td>
		</tr>
		<!-- Schedule K, Line 16g and 16h-->
		<tr>
			<td>
				<span class="styIRS1065LNLeftLtrBoxTD" style="height:4mm; padding-top:1.3mm;">g</span>
				<span class="styIRS1065LNDesc" style="height:4mm;">Interest expense
                          <img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
					<span style="width:32mm;text-align:right; border-bottom:1 solid black; height:4mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="DedAllocApprtnPartnerLvlIntExp"/>
						</xsl:call-template>
					</span>
					<span style="width:2mm;"/>
					<span style="font-weight:bold;height:4mm;padding-left:1.5mm;padding-top:1.2mm">h</span>
                    Other
                </span>
				<span style="float:right;padding-top:1.5mm;padding-left:.8mm">
					<span class="styIRS1065DotLn">............</span>
					<img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
					<span style="width:2mm;"/>
				</span>
			</td>
			<td>
				<span class="styLNRightNumBox" style="width:11.5mm;height:5.6mm;">16h</span>
				<span class="styLNAmountBox" style="height:5.6mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="DedAllocApprtnPartnerLvlOther"/>
					</xsl:call-template>
				</span>
			</td>
		</tr>
		<!-- Schedule K - Line 16h Lien exp-->
		<tr>
			<td>
				<span class="styIRS1065LNLeftLtrBoxTD" style="height:4mm;"/>
				<span class="styGenericDiv" style="height:4mm;">
					Deductions allocated and apportioned at partnership level to foreign source income
				</span>
			</td>
			<td>
				<span class="styLNRightNumBoxNBB" style="width:11.5mm;height:5.3mm;background-color:lightgrey;"/>
				<span class="styLNAmountBoxNBB" style="height:5.3mm;"/>
			</td>
		</tr>
		<!-- Schedule K, Line 16i,16j,16k -->
		<tr>
			<td>
				<span class="styIRS1065LNLeftLtrBoxTD" style="height:4mm;padding-top:1.2mm">i</span>
				<span class="styIRS1065LNDesc" style="height:4mm;padding-top:1mm">Passive category
                          <img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
					<span style="width:22mm; font-family:arial ;font-size:7pt; text-align:right; border-bottom:1 solid black; height:4mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="DedAllocAndApprtnPrtshpLvlPssv"/>
						</xsl:call-template>
					</span>
				</span>
				<span style="font-size:7pt;font-weight:bold; padding-left:3mm; height:4mm; padding-top:1.2mm;">j</span>
				<span style="width=1mm;"/>
				<span style="font-size:7pt; height:4mm; vertical-align:bottom;">General category
                          <img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
					<span style="width:22mm;font-family:arial; font-size:7pt; text-align:right; border-bottom:1 solid black; height:4mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="DedAllocAndApprtnPrtshpLvlGC"/>
						</xsl:call-template>
					</span>
				</span>
				<span style="font-size:7pt; font-weight:bold; padding-left:3mm; height:4mm; padding-top:1.2mm;">k</span>
				<span style="width:1mm;"/>
				<span style="font-size:7pt; height:4mm; vertical-align:bottom;padding-top:1.2mm;">Other
                    <xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="DedAllocAndApprtnPrtshpLvlOth"/>
					</xsl:call-template>
					<span style="width:1mm;"/>
					<img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
				</span>
			</td>
			<td>
				<span class="styLNRightNumBox" style="width:11.5mm;height:5.5mm;">16k</span>
				<span class="styLNAmountBox" style="height:5.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="DedAllocAndApprtnPrtshpLvlOth"/>
					</xsl:call-template>
				</span>
			</td>
		</tr>
		<!-- Schedule K, Line 16l -->
		<tr>
			<td>
				<span class="styIRS1065LNLeftLtrBoxTD" style="height:4mm;padding-top:2.8mm;">l</span>
				<span class="styIRS1065LNDesc" style="height:4mm;">Total foreign taxes (check one): 
                          <img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="TotalForeignTaxes"/>
					</xsl:call-template>
					<span style="width:8px"/>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="TotalForeignTaxesPaid"/>
							<xsl:with-param name="BackupName">IRS1065ScheduleKTotalForeignTaxesPaid
                                         </xsl:with-param>
						</xsl:call-template>
						<span style="padding-top:1.5mm;padding-bottom:0mm;height:4mm;"> Paid</span>
					</label>
					<span style="width:1mm"/>
					<input type="checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="TotalForeignTaxesPaid"/>
							<xsl:with-param name="BackupName">IRS1065ScheduleKTotalForeignTaxesPaid</xsl:with-param>
						</xsl:call-template>
					</input>
					<span style="width:12px"/>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="TotalForeignTaxesAccrued"/>
							<xsl:with-param name="BackupName">IRS1065ScheduleKTotalForeignTaxesAccrued</xsl:with-param>
						</xsl:call-template>
						<span style="padding-top:2mm;padding-bottom:0mm;height:4mm;">Accrued</span>
					</label>
					<span style="width:1mm"/>
					<input type="checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="TotalForeignTaxesAccrued"/>
							<xsl:with-param name="BackupName">IRS1065ScheduleKTotalForeignTaxesAccrued</xsl:with-param>
						</xsl:call-template>
					</input>
				</span>
				<span class="styIRS1065DotLn" style="float:right;padding-top:3mm;">...........</span>
			</td>
			<td>
				<span class="styLNRightNumBox" style="width:11.5mm; height:7mm; padding-top:2mm;">16l</span>
				<span class="styLNAmountBox" style="height:7mm;padding-top:2mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="TotalForeignTaxes"/>
					</xsl:call-template>
				</span>
			</td>
		</tr>
		<!-- Schedule K, Line 16m -->
		<tr>
			<td>
				<span class="styIRS1065LNLeftLtrBoxTD" style="height:4mm;">m</span>
				<span class="styIRS1065LNDesc" style="height:4mm;">Reduction in taxes available for credit (attach statement)
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="ReductionInTaxesAvailableForCr"/>
					</xsl:call-template>
				</span>
				<span style="float:right;">
					<span class="styIRS1065DotLn">...........</span>
				</span>
			</td>
			<td>
				<span class="styLNRightNumBox" style="width:11.5mm;height:5.5mm;">16m</span>
				<span class="styLNAmountBox" style="height:5.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="ReductionInTaxesAvailableForCr"/>
					</xsl:call-template>
				</span>
			</td>
		</tr>
		<!-- Schedule K, Line 16n -->
		<tr>
			<td style="border-bottom:1px solid black;">
				<span class="styIRS1065LNLeftLtrBoxTD" style="height:4mm;">n</span>
				<span class="styIRS1065LNDesc" style="height:4mm;">Other foreign tax information (attach statement)
				</span>
				<span style="float:right;">
					<span class="styIRS1065DotLn">...............</span>
				</span>
			</td>
			<td style="border-bottom:1px solid black;">
				<span class="styLNRightNumBoxNBB" style="width:11.5mm;height:4.5mm;background-color:lightgrey;"/>
				<span class="styLNAmountBoxNBB" style="height:4.5mm;background-color:lightgrey;">
					<span style="width:2mm;"/>
				</span>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="GenPart">
		<tr>
			<td class="styLNLeftLtrBox" style="width:5mm;font-size:7pt;vertical-align:top;">a</td>
			<td style="width:29mm;font-size:7pt;">General partners</td>
			<td class="styTableCellSmall" style="border-color:black;border-left-width:1px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="Corporate"/>
				</xsl:call-template>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="IndividualActive"/>
				</xsl:call-template>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="IndividualPassive"/>
				</xsl:call-template>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="Partnership"/>
				</xsl:call-template>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="ExemptOrganization"/>
				</xsl:call-template>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="NomineeOther"/>
				</xsl:call-template>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="LtdPart">
		<tr>
			<td class="styLNLeftLtrBox" style="width:5mm;font-size:7pt;vertical-align:top;">
				<xsl:if test="position()=last()">
					<xsl:attribute name="style">width:5mm;font-size:7pt;vertical-align:top;border-bottom:1 solid black;</xsl:attribute>
				</xsl:if>
              b
            </td>
			<td style="width:29mm;font-size:7pt;">
				<xsl:if test="position()=last()">
					<xsl:attribute name="style">width:29mm;font-size:7pt;border-bottom:1 solid black;</xsl:attribute>
				</xsl:if>
              Limited partners
            </td>
			<td class="styTableCellSmall" style="border-color:black;border-left-width:1px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="Corporate"/>
				</xsl:call-template>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="IndividualActive"/>
				</xsl:call-template>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="IndividualPassive"/>
				</xsl:call-template>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="Partnership"/>
				</xsl:call-template>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="ExemptOrganization"/>
				</xsl:call-template>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="NomineeOther"/>
				</xsl:call-template>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>
