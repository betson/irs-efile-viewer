<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Eugenia McDonald on 01/13/2021 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1040NRScheduleOIStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS1040NRScheduleOI"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
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
				<meta name="Description" content="IRS Form 1040NRScheduleOI"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1040NRScheduleOIStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="Form1040NRScheduleOI">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styTBB" style="width:187mm;height:19mm;
						border-bottom-width:1.5px">
						<div class="styFNBox" style="width:28mm;height:19mm;">
							<div style="height:8mm;">
								<!-- Ampersand code (&#38;)-->
								<span class="styFormNumber" style="font-size:9pt;
									padding-top:1.5mm">
									SCHEDULE OI
								</span>
								<br/>
								<span class="styFormNumber" style="font-size:9pt;">
									(Form 1040-NR)
									<span style="width:1mm"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
								</span>
							</div> 
							<br/><br/>
							<div style="height:6mm;padding-top:1.5mm;">
								<span class="styAgency">Department of the Treasury
								</span>
								<span class="styAgency" style="width:28mm;">Internal Revenue Service 
									<span style="padding-left:0.2mm;"> (99)</span>
								</span>
							</div>
						</div>         
						<div class="styFTBox" style="width:126.5mm;height:19mm;">
							<div class="styMainTitle">
								Other Information
							</div>
							<div class="styFBT" style="width:126.5mm;font-size:7pt;
								margin-top:.5mm;font-weight:normal">         
								<img src="{$ImagePath}/1040SchA_Bullet.gif" alt="Right Arrow"/>
								<b>Go to <a style="text-decoration:none;color:black;" href="www.irs.gov/Form1040NR " title="Link to IRS.gov"><i>www.irs.gov/Form1040NR </i>
								</a> for instructions and the latest information.</b><br/>
								<span style="padding-top:1.5mm;">
									<img src="{$ImagePath}/1040SchA_Bullet.gif" alt="Right Arrow"/> <b>Attach to Form 1040-NR.</b>
								</span> <br/>   
								<span style="padding-top:1.5mm;">				  
									<img src="{$ImagePath}/1040SchA_Bullet.gif" alt="Right Arrow"/>Answer all questions.
				                </span>                  
                            </div>
                        </div>           
                        <div class="styTYBox" style="width:32mm;height:19mm;">
                            <br/>
                            <div class="styOMB" style="height:2mm;padding-top:0mm;
                                padding-left:3mm;line-height: 0px;">
                                OMB No. 1545-0074
                            </div>
                            <div class="styTY" style="height:6mm;font-size:18pt;
                                padding-top:0mm;padding-bottom:0mm;line-height:100%;
                                padding-left:0mm">
                                20<span class="styTYColor">20</span>
                            </div>
                            <div class="styOMB" style="padding-top:1mm;text-align:left;
                                padding-left:5mm;border-bottom-width:0px;line-height:10px">
                                Attachment <br/>
                                Sequence No. <span class="styBoldText">7C</span>
                            </div>
                        </div>
                    </div>
                    <div style="width:187mm;height:8mm;" class="styBB">
                        <div style="width:151.75mm;height:8mm;font-weight:normal;
							font-size:7pt;"
               class="styNameBox">
			   Name shown on Form 1040-NR<br/>
                            <div style="padding-top:1.5mm">
                                <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
                                    <xsl:with-param name="BackupName">$RtnHdrDataFilerName</xsl:with-param>
                                </xsl:call-template>
                            </div>
                        </div>
                        <div style="width:35mm;height:8mm;padding-left:.3mm;font-size:6.2pt;font-weight:bold;" class="styEINBox">Your Identifying Number<br/>
                            <span style="width:9.5mm;"/>
                            <span style="font-weight:normal;font-size:6.4pt;padding-top:2mm">
                                <xsl:call-template name="PopulateReturnHeaderFiler">
                                    <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
                                </xsl:call-template>
                            </span>
                        </div>
                    </div>
					<!-- Page 1 -->
					<div style="display:inline">
						<!-- Sch OI Line A -->
						<div class="styStdDiv" style="margin-bottom:.5mm;">
							<div class="styLNLeftNumBox">A</div>
							<div class="sty1040NRScheduleOILongDesc">
							Of what country or countries were you a citizen or national during the tax year? 
							<span style="border-bottom:1px dashed black;width:78mm;">
									<xsl:for-each select="$FormData/CitizenCountryCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
										<span style="width:12px;"/>
									</xsl:for-each>
								</span>
							</div>
						</div>
						<!-- Sch OI Line B -->
						<div class="styStdDiv" style="margin-bottom:.5mm;">
							<div class="styLNLeftNumBox">B</div>
							<div class="sty1040NRScheduleOILongDesc">
							In what country did you claim residence for tax purposes during the tax year? 
							<span style="border-bottom:1px dashed black;width:80mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxResidenceCountryCd"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Sch OI Line C -->
						<div class="styStdDiv" style="margin-bottom:.5mm;">
							<div class="styLNLeftNumBox">C</div>
							<div class="sty1040NRScheduleOILongDesc" style="width:174mm;">
								<span>Have you ever applied to be a green card holder (lawful permanent resident) of the United States?
									<span style="width:8px"/><span class="sty1040NRScheduleOIDotLn">.......</span>
								</span>
								<span style="float:right;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/AppLawfulPermanentResidentInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkboxNM" alt="App Lawful Permanent Resident Ind Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AppLawfulPermanentResidentInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/AppLawfulPermanentResidentInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:3px;padding-right:2mm;font-weight:bold;">
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/AppLawfulPermanentResidentInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/AppLawfulPermanentResidentInd</xsl:with-param>
										</xsl:call-template>Yes</label>
									<input type="checkbox" class="styCkboxNM" alt="App Lawful Permanent Resident Ind No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AppLawfulPermanentResidentInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/AppLawfulPermanentResidentInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:3px;font-weight:bold;">
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/AppLawfulPermanentResidentInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/AppLawfulPermanentResidentInd</xsl:with-param>
										</xsl:call-template>No</label>
								</span>
							</div>
						</div>
						<!-- Sch OI Line D -->
						<div class="styStdDiv" style="margin-bottom:.5mm;">
							<div class="styLNLeftNumBox">D</div>
							<div class="sty1040NRScheduleOILongDesc" style="width:174mm;">
							Were you ever: <br/>
								<span style="margin-left:-4mm"><strong>1. </strong> <span style="width:.3mm"/> A U.S. citizen?<span style="width:14px"/><span class="sty1040NRScheduleOIDotLn">.................................</span>
								</span>
								<span style="float:right;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/USCitizenInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkboxNM" alt="US Citizen Ind Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/USCitizenInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/USCitizenInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:3px;padding-right:2mm;font-weight:bold;">
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/USCitizenInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/USCitizenInd</xsl:with-param>
										</xsl:call-template>Yes</label>
									<input type="checkbox" class="styCkboxNM" alt="US Citizen Ind No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/USCitizenInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/USCitizenInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:3px;font-weight:bold;">
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/USCitizenInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/USCitizenInd</xsl:with-param>
										</xsl:call-template>No</label>
								</span>
								<span style="height:3mm;"/>
								<br/>
								<span style="padding-top:6px;margin-left:-4mm">
									<strong>2. </strong><span style="width:.2mm"/> A green card holder (lawful permanent resident) of the United States?
									<span style="width:6px"/><span class="sty1040NRScheduleOIDotLn">................</span>
								</span>
								<span style="float:right;padding-top:6px">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/LawfulPermanentResidentInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkboxNM" alt="Lawful Permanent Resident Ind Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/LawfulPermanentResidentInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/LawfulPermanentResidentInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:3px;padding-right:2mm;font-weight:bold;">
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/LawfulPermanentResidentInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/LawfulPermanentResidentInd</xsl:with-param>
										</xsl:call-template>Yes</label>
									<input type="checkbox" class="styCkboxNM" alt="Lawful Permanent Resident Ind No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/LawfulPermanentResidentInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/LawfulPermanentResidentInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:3px;font-weight:bold;">
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/LawfulPermanentResidentInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/LawfulPermanentResidentInd</xsl:with-param>
										</xsl:call-template>No</label>
								</span>
								<br/>
								<span style="padding-top:6px;padding-left:.5mm">
									If you answer "Yes" to (1) or (2), see Pub. 519, chapter 4, for expatriation rules that apply to you.
								</span>
							</div>
						</div>
						<!-- Sch OI Line E -->
						<div class="styStdDiv" style="margin-bottom:.5mm;">
							<div class="styLNLeftNumBox">E</div>
							<div class="sty1040NRScheduleOILongDesc">
							If you had a visa on the last day of the tax year, enter your visa type. If you did not have a visa, enter your U.S. <br/>
							<span style="padding-top:6px">immigration status on the last day of the tax year.</span>
							<span style="width:4px"/><span style="border-bottom:1px dashed black;width:87mm;padding-top:6px">
									<xsl:choose>
										<xsl:when test="$FormData/NonImmigrantVisaTypeCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/NonImmigrantVisaTypeCd"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="$FormData/ImmigrantVisaTypeCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/ImmigrantVisaTypeCd"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/USImmigrationStatusDesc"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</div>
						</div>
						<!-- Sch OI Line F -->
						<div class="styStdDiv" style="margin-bottom:.5mm;">
							<div class="styLNLeftNumBox">F</div>
							<div class="sty1040NRScheduleOILongDesc" style="width:174mm">
								<span>
									Have you ever changed your visa type (nonimmigrant status) or U.S. immigration status?
									<span style="width:6px"/><span class="sty1040NRScheduleOIDotLn">..........</span>
								</span>
								<span style="float:right;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/USImmigrationStatVisaTypChgInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkboxNM" alt="US Immigration Stat Visa Typ Chg Ind Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/USImmigrationStatVisaTypChgInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/USImmigrationStatVisaTypChgInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:3px;padding-right:2mm;font-weight:bold;">
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/USImmigrationStatVisaTypChgInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/USImmigrationStatVisaTypChgInd</xsl:with-param>
										</xsl:call-template>Yes</label>
									<input type="checkbox" class="styCkboxNM" alt="US Immigration Stat Visa Typ Chg Ind No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/USImmigrationStatVisaTypChgInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/USImmigrationStatVisaTypChgInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:3px;font-weight:bold;">
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/USImmigrationStatVisaTypChgInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/USImmigrationStatVisaTypChgInd</xsl:with-param>
										</xsl:call-template>No</label>
								</span>
								<br/>
								<span style="padding-top:6px">If you answered "Yes," indicate the date and nature of the change. 
								<img src="{$ImagePath}/1040EZ_Bullet_Sm.gif" alt="Right Arrow"/>
								</span>
							<span style="border-bottom:1px dashed black;width:65mm;padding-top:6px;padding-left:.5mm">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$FormData/VisaChangeDt"/>
									</xsl:call-template>
									<span style="width:12px;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/VisaChangeDesc"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Sch OI Line G -->
						<div class="styStdDiv" style="margin-bottom:.5mm;">
							<div class="styLNLeftNumBox">G</div>
							<div class="sty1040NRScheduleOILongDesc">
								List all dates you entered and left the United States during 2020. See instructions. <br/>
								<span style="padding-top:6px">
									<strong>Note: </strong> If you are a resident of Canada or Mexico AND commute to work in the United States at frequent intervals, <br/>
								</span>
								<span style="padding-top:6px">
									<strong>check the box for Canada or Mexico </strong> and skip to item H
								</span>
								<span style="letter-spacing:13px;font-weight:bold;padding-left:2mm;padding-right:1mm;padding-top:6px">.........</span>
									<input type="checkbox" class="styCkboxNM" alt="Canada Resident Work In US Ind ">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CanadaResidentWorkInUSInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/CanadaResidentWorkInUSInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:3px;padding-right:4mm;">
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/CanadaResidentWorkInUSInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/CanadaResidentWorkInUSInd</xsl:with-param>
										</xsl:call-template>Canada</label>
									<input type="checkbox" class="styCkboxNM" alt="Mexico Resident Work In US Ind">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/MexicoResidentWorkInUSInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/MexicoResidentWorkInUSInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:3px;">
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/MexicoResidentWorkInUSInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/MexicoResidentWorkInUSInd</xsl:with-param>
										</xsl:call-template>Mexico</label>
									<span style="float:right;">
										<xsl:call-template name="SetDynamicTableToggleRowCount">
										<!--<xsl:with-param name="TargetNode" select="$FormData/EnteredDepartedUSGrp"/>-->
											<xsl:with-param name="DataRowCount" select="count($FormData/EnteredDepartedUSGrp) div 2"/>
											<xsl:with-param name="containerHeight" select="4"/>
											<xsl:with-param name="headerHeight" select="1"/>
											<xsl:with-param name="containerID" select=" 'enterexitContainerId' "/>
										</xsl:call-template>
									</span>
							</div>
						</div>
						<!-- EnteredDepartedUSGrp table -->
						<div class="styStdDiv" style="margin-bottom:.5mm;">
							<div class="styLNLeftNumBox"/>
							<div class="sty1040NRScheduleOITableContainerG" id="enterexitContainerId">
								<xsl:call-template name="SetInitialState"/>
								<table class="styTable" style="display:table;border-collapse:collapse;font-size:7pt;">
									<thead class="styTableThead">
										<tr>
											<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;border-top:1px solid black;padding-bottom:3px;">
											Date entered United States <br/> mm/dd/yy
										</th>
											<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;border-top:1px solid black;padding-bottom:3px;">
											Date departed United States <br/> mm/dd/yy
										</th>
											<th scope="col" style="width:19mm;border-right:1px solid black;border-top:0px;"/>
											<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;border-top:1px solid black;padding-bottom:3px;">
											Date entered United States <br/> mm/dd/yy
										</th>
											<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;border-top:1px solid black;padding-bottom:3px;">
											Date departed United States <br/> mm/dd/yy
										</th>
										</tr>
									</thead>
									<tbody>
										<xsl:if test="not(($Print = $Separated) and (count($FormData/EnteredDepartedUSGrp) &gt; 8))">
											<xsl:for-each select="$FormData/EnteredDepartedUSGrp[position() mod 2 = 1]">
												<xsl:variable name="RightNode" select="./following-sibling::EnteredDepartedUSGrp[1]"/>
												<tr>
													<td class="sty1040NRScheduleOITableCellCenter">
														<xsl:call-template name="PopulateMonthDayYear">
															<xsl:with-param name="TargetNode" select="EnteredUSDt"/>
														</xsl:call-template>
													</td>
													<td class="sty1040NRScheduleOITableCellCenter">
														<xsl:call-template name="PopulateMonthDayYear">
															<xsl:with-param name="TargetNode" select="DepartedUSDt"/>
														</xsl:call-template>
													</td>
													<td style="border-right:1px solid black;">&#8194;</td>
													<td class="sty1040NRScheduleOITableCellCenter">
														<xsl:call-template name="PopulateMonthDayYear">
															<xsl:with-param name="TargetNode" select="$RightNode/EnteredUSDt"/>
														</xsl:call-template>
													</td>
													<td class="sty1040NRScheduleOITableCellCenter">
														<xsl:call-template name="PopulateMonthDayYear">
															<xsl:with-param name="TargetNode" select="$RightNode/DepartedUSDt"/>
														</xsl:call-template>
													</td>
												</tr>
											</xsl:for-each>
										</xsl:if>
										<xsl:variable name="EDUG" select="count($FormData/EnteredDepartedUSGrp)"/>
										<xsl:if test="($EDUG &lt; 1) or (($Print = $Separated) and ($EDUG &gt; 8))">
											<tr>
												<td class="sty1040NRScheduleOITableCellCenter">
													<xsl:call-template name="PopulateAdditionalDataTableMessage">
														<xsl:with-param name="TargetNode" select="$FormData/EnteredDepartedUSGrp"/>
													</xsl:call-template>
												</td>
												<td class="sty1040NRScheduleOITableCellCenter">&#8194;</td>
												<td style="border-right:1px solid black;">&#8194;</td>
												<td class="sty1040NRScheduleOITableCellCenter">&#8194;</td>
												<td class="sty1040NRScheduleOITableCellCenter">&#8194;</td>
											</tr>
										</xsl:if>
										<xsl:if test="($EDUG &lt; 3) or (($Print = $Separated) and ($EDUG &gt; 8))">
											<tr>
												<td class="sty1040NRScheduleOITableCellCenter">&#8194;</td>
												<td class="sty1040NRScheduleOITableCellCenter">&#8194;</td>
												<td style="border-right:1px solid black;">&#8194;</td>
												<td class="sty1040NRScheduleOITableCellCenter">&#8194;</td>
												<td class="sty1040NRScheduleOITableCellCenter">&#8194;</td>
											</tr>
										</xsl:if>
										<xsl:if test="($EDUG &lt; 5) or (($Print = $Separated) and ($EDUG &gt; 8))">
											<tr>
												<td class="sty1040NRScheduleOITableCellCenter">&#8194;</td>
												<td class="sty1040NRScheduleOITableCellCenter">&#8194;</td>
												<td style="border-right:1px solid black;">&#8194;</td>
												<td class="sty1040NRScheduleOITableCellCenter">&#8194;</td>
												<td class="sty1040NRScheduleOITableCellCenter">&#8194;</td>
											</tr>
										</xsl:if>
										<xsl:if test="($EDUG &lt; 7) or (($Print = $Separated) and ($EDUG &gt; 8))">
											<tr>
												<td class="sty1040NRScheduleOITableCellCenter">&#8194;</td>
												<td class="sty1040NRScheduleOITableCellCenter">&#8194;</td>
												<td style="border-right:1px solid black;">&#8194;</td>
												<td class="sty1040NRScheduleOITableCellCenter">&#8194;</td>
												<td class="sty1040NRScheduleOITableCellCenter">&#8194;</td>
											</tr>
										</xsl:if>
									</tbody>
								</table>
							</div>
						</div>
						<xsl:call-template name="SetInitialDynamicTableHeightRowCount">
							<!--<xsl:with-param name="TargetNode" select="$FormData/EnteredDepartedUSGrp"/>-->
							<xsl:with-param name="DataRowCount" select="count($FormData/EnteredDepartedUSGrp) div 2"/>
							<xsl:with-param name="containerHeight" select="4"/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerID" select=" 'enterexitContainerId' "/>
						</xsl:call-template>
						<!-- Sch OI Line H -->
						<div class="styStdDiv" style="margin-bottom:3mm;">
							<div class="styLNLeftNumBox">H</div>
							<div class="sty1040NRScheduleOILongDesc">
							Give the number of days (including vacation, nonworkdays, and partial days) you were present in the United States during: <br/>
							2018
							<span style="border-bottom:1px dashed black;width:30mm;text-align:center;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PhysicallyPresUSPYLess2DayCnt"/>
									</xsl:call-template>
								</span>
							, 2019
							<span style="border-bottom:1px dashed black;width:30mm;text-align:center;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PhysicallyPresUSPYLess1DayCnt"/>
									</xsl:call-template>
								</span>
							, and 2020
							<span style="border-bottom:1px dashed black;width:30mm;text-align:center;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PhysicallyPresUSPYDayCnt"/>
									</xsl:call-template>
								</span>.
						</div>
						</div>
						<!-- Sch OI Line I -->
						<div class="styStdDiv" style="margin-bottom:.5mm;">
							<div class="styLNLeftNumBox">I</div>
							<div class="sty1040NRScheduleOILongDesc" style="width:174mm">
								<span>
									Did you file a U.S. income tax return for any prior year?
									<span style="width:2px"/><span class="sty1040NRScheduleOIDotLn">.....................</span>
								</span>
								<span style="float:right;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/USTaxRetFiledForAnyPYInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkboxNM" alt="US Tax Ret Filed For Any PY Ind Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/USTaxRetFiledForAnyPYInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/USTaxRetFiledForAnyPYInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:3px;padding-right:2mm;font-weight:bold;">
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/USTaxRetFiledForAnyPYInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/USTaxRetFiledForAnyPYInd</xsl:with-param>
										</xsl:call-template>Yes</label>
									<input type="checkbox" class="styCkboxNM" alt="US Tax Ret Filed For Any PY Ind No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/USTaxRetFiledForAnyPYInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/USTaxRetFiledForAnyPYInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:3px;font-weight:bold;">
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/USTaxRetFiledForAnyPYInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/USTaxRetFiledForAnyPYInd</xsl:with-param>
										</xsl:call-template>No</label>
								</span>
								<br/>
								<span style="padding-top:6px">If "Yes," give the latest year and form number you filed 
									<img src="{$ImagePath}/1040EZ_Bullet_Sm.gif" alt="Right Arrow"/>
									<span style="width:.5mm"/>
								</span>
								<span style="border-bottom:1px dashed black;width:80mm;padding-top:6px">
									<xsl:call-template name="PopulateYear">
										<xsl:with-param name="TargetNode" select="$FormData/ReturnFiledYr"/>
									</xsl:call-template>
									<span style="width:12px;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/FormTypeCd"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Sch OI Line J -->
						<div class="styStdDiv" style="margin-bottom:.5mm;">
							<div class="styLNLeftNumBox">J</div>
							<div class="sty1040NRScheduleOILongDesc" style="width:174mm;">
								<span>
									Are you filing a return for a trust?
									<span style="width:2px"/><span class="sty1040NRScheduleOIDotLn">............................</span>
								</span>
								<span style="float:right;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/FilingReturnForTrustInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkboxNM" alt="Filing Return For Trust Ind Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/FilingReturnForTrustInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/FilingReturnForTrustInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:3px;padding-right:2mm;font-weight:bold;">
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/FilingReturnForTrustInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/FilingReturnForTrustInd</xsl:with-param>
										</xsl:call-template>Yes</label>
									<!-- Note that for release 10, business has specified that this checkbox must be always marked No -->
									<input type="checkbox" class="styCkboxNM" alt="Filing Return For Trust Ind No" checked="checked">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/FilingReturnForTrustInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/FilingReturnForTrustInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:3px;font-weight:bold;">
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/FilingReturnForTrustInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/FilingReturnForTrustInd</xsl:with-param>
										</xsl:call-template>No</label>
								</span>
								<br/>
								<span style="padding-top:6px">
									If "Yes," did the trust have a U.S. or foreign owner under the grantor trust rules, make a distribution or loan to a <br/>
								</span>
								<span style="padding-top:6px">
									U.S. person, or receive a contribution from a U.S. person?
									<span style="width:7px"/><span class="sty1040NRScheduleOIDotLn">....................</span>
								</span>
								<span style="float:right;padding-top:6px">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/GrantorTrDistriLoanOrContriInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkboxNM" alt="Grantor Tr Distri Loan Or Contri Ind Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/GrantorTrDistriLoanOrContriInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/GrantorTrDistriLoanOrContriInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:3px;padding-right:2mm;font-weight:bold;">
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/GrantorTrDistriLoanOrContriInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/GrantorTrDistriLoanOrContriInd</xsl:with-param>
										</xsl:call-template>Yes</label>
									<input type="checkbox" class="styCkboxNM" alt="Grantor Tr Distri Loan Or Contri Ind No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/GrantorTrDistriLoanOrContriInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/GrantorTrDistriLoanOrContriInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:3px;font-weight:bold;">
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/GrantorTrDistriLoanOrContriInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/GrantorTrDistriLoanOrContriInd</xsl:with-param>
										</xsl:call-template>No</label>
								</span>
							</div>
						</div>
						<!-- Sch OI Line K -->
						<div class="styStdDiv" style="margin-bottom:.5mm;">
							<div class="styLNLeftNumBox">K</div>
							<div class="sty1040NRScheduleOILongDesc" style="width:174mm">
								<span>
									Did you receive total compensation of $250,000 or more during the tax year?
									<span style="width:6px"/><span class="sty1040NRScheduleOIDotLn">..............</span>
								</span>
								<span style="float:right;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/TotalComp250KOrMoreInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkboxNM" alt="Total Comp 250K Or More Ind Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TotalComp250KOrMoreInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/TotalComp250KOrMoreInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:3px;padding-right:2mm;font-weight:bold;">
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/TotalComp250KOrMoreInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/TotalComp250KOrMoreInd</xsl:with-param>
										</xsl:call-template>Yes</label>
									<input type="checkbox" class="styCkboxNM" alt="Total Comp 250K Or More Ind No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TotalComp250KOrMoreInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/TotalComp250KOrMoreInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:3px;font-weight:bold;">
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/TotalComp250KOrMoreInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/TotalComp250KOrMoreInd</xsl:with-param>
										</xsl:call-template>No</label>
								</span>
								<span style="height:3mm;"/>
								<br/>
								<span style="padding-top:6px">
									If "Yes," did you use an alternative method to determine the source of this compensation?
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AltBasisCompensationSourceInd"/>
									</xsl:call-template>
									<span style="width:8px"/><span class="sty1040NRScheduleOIDotLn">.........</span>
								</span>
								<span style="float:right;padding-top:6px">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/AltBasisCompensationSourceInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkboxNM" alt="Alt Basis Compensation Source Ind Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AltBasisCompensationSourceInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/AltBasisCompensationSourceInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:3px;padding-right:2mm;font-weight:bold;">
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/AltBasisCompensationSourceInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/AltBasisCompensationSourceInd</xsl:with-param>
										</xsl:call-template>Yes</label>
									<input type="checkbox" class="styCkboxNM" alt="Alt Basis Compensation Source Ind No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AltBasisCompensationSourceInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/AltBasisCompensationSourceInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:3px;font-weight:bold;">
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/AltBasisCompensationSourceInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/AltBasisCompensationSourceInd</xsl:with-param>
										</xsl:call-template>No</label>
								</span>
								<span style="height:3mm;"/>
							</div>
						</div>
						<!-- Sch OI Line L -->
						<!-- $L1Data is a way to conglomerate all of the different line L(1) schema groups into a single XPath grouping. 
							The second part is to exclude IndiaStandardDedTaxTreatyGrp (line 38), if present -->
						<xsl:variable name="L1Data" select="$FormData/*[contains(local-name(),'TreatyGrp') and not(contains(local-name(),'Tax'))]"/>
						<xsl:variable name="CL1" select="count($L1Data)"/>
						<div class="styStdDiv" style="margin-bottom:1mm;">
							<div class="styLNLeftNumBox">L</div>
							<div class="sty1040NRScheduleOILongDesc">
								Income Exempt from Tax &#8212; If you are claiming exemption from income tax under a U.S. income tax treaty with a 
								foreign country, <br/>
								<span style="padding-top:6px">complete (1) through (3) below. See Pub. 901 for more information on tax treaties.</span><br/>
								<span style="font-weight:bold;height:5mm;width:4mm;float:left;padding-top:6px;margin-left:-4mm">1. </span>
								<span style="padding-top:6px">Enter the name of the country, the applicable tax treaty article, the number of months in prior years you claimed the treaty benefit, and the<br/></span>
								<span style="padding-top:6px"> amount of exempt income in the columns below. Attach Form 8833 if required. See instructions.</span>
								<span style="float:right;">
									<xsl:call-template name="SetDynamicTableToggleButton">
										<xsl:with-param name="TargetNode" select="$L1Data"/>
										<xsl:with-param name="headerHeight" select="1"/>
										<xsl:with-param name="containerHeight" select="3"/>
										<xsl:with-param name="containerID" select=" 'treatyContainerId' "/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Table for L-1 -->
						<div class="sty1040NRScheduleOITableContainerL" style="width:175mm;margin-left:8mm" id="treatyContainerId">
							<xsl:call-template name="SetInitialState"/>
							<table class="styTable" style="display:table;border-collapse:collapse;font-size:7pt;">
								<thead class="styTableThead">
									<tr>
										<th class="styTableCellHeader" scope="col" style="width:47mm;font-weight:normal;padding-bottom:3px;">
											<strong>(a)</strong> Country
									</th>
										<th class="styTableCellHeader" scope="col" style="width:55mm;font-weight:normal;padding-bottom:3px;">
											<strong>(b)</strong> Tax treaty <br/> article
									</th>
										<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;padding-bottom:3px;">
											<strong>(c)</strong> Number of months <br/> claimed in prior tax years
									</th>
										<th class="styTableCellHeader" scope="col" style="width:45mm;font-weight:normal;padding-bottom:3px;border-right:none;">
											<strong>(d)</strong> Amount of exempt <br/> income in current tax year
									</th>
									</tr>
								</thead>
								<tbody>
									<xsl:if test="not(($Print = $Separated) and ($CL1 &gt; 3))">
										<xsl:for-each select="$L1Data">
											<tr style="min-height:7mm;">
												<td class="sty1040NRScheduleOITableCellCenter">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="CountryCd"/>
													</xsl:call-template>
												</td>
												<td class="sty1040NRScheduleOITableCellText">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="TaxTreatyArticleCd"/>
													</xsl:call-template>
												</td>
												<td class="sty1040NRScheduleOITableCellCenter">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="MnthExemptClmPriorTYNum"/>
													</xsl:call-template>
												</td>
												<td class="sty1040NRScheduleOITableCellAmt">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="ExemptIncomeCurrentTYAmt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="($CL1 &lt; 1) or (($Print = $Separated) and ($CL1 &gt; 3))">
										<tr style="min-height:7mm;">
											<td class="sty1040NRScheduleOITableCellCenter">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$L1Data"/>
												</xsl:call-template>
											</td>
											<td class="sty1040NRScheduleOITableCellText">&#8194;</td>
											<td class="sty1040NRScheduleOITableCellCenter">&#8194;</td>
											<td class="sty1040NRScheduleOITableCellAmt">&#8194;</td>
										</tr>
									</xsl:if>
									<xsl:if test="($CL1 &lt; 2) or (($Print = $Separated) and ($CL1 &gt; 3))">
										<tr style="min-height:7mm;">
											<td class="sty1040NRScheduleOITableCellCenter">&#8194;</td>
											<td class="sty1040NRScheduleOITableCellText">&#8194;</td>
											<td class="sty1040NRScheduleOITableCellCenter">&#8194;</td>
											<td class="sty1040NRScheduleOITableCellAmt">&#8194;</td>
										</tr>
									</xsl:if>
									<xsl:if test="($CL1 &lt; 3) or (($Print = $Separated) and ($CL1 &gt; 3))">
										<tr style="min-height:7mm;">
											<td class="sty1040NRScheduleOITableCellCenter">&#8194;</td>
											<td class="sty1040NRScheduleOITableCellText">&#8194;</td>
											<td class="sty1040NRScheduleOITableCellCenter">&#8194;</td>
											<td class="sty1040NRScheduleOITableCellAmt">&#8194;</td>
										</tr>
									</xsl:if>
								</tbody>
							</table>
						</div>
						<div class="styStdDiv" style="margin-bottom:2px;">
							<div class="styLNDesc" style="width:140mm;height:4.5mm;float:left;border-bottom:0px;font-size:7pt;">
								<span style="width:8mm"/>
								<strong>(e)<span style="width:.3mm;"/> Total. </strong> 
								Enter this amount on Form 1040-NR, line 1c. Do not enter it on line 1a or line 1b
							<span class="sty1040NRScheduleOIDotLn" style="padding-right:8px;">..<span style="width:2px"/>
								<img src="{$ImagePath}/1040EZ_Bullet_Sm.gif" alt="Right Arrow"/></span>
							</div>
							<div class="styLNAmountBox" style="width:43.1mm;height:4.5mm;">
								<span style="float:left;padding-left:1mm">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/TreatyTaxExemptUSIncomeAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TreatyTaxExemptUSIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$L1Data"/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerHeight" select="3"/>
							<xsl:with-param name="containerID" select=" 'treatyContainerId' "/>
						</xsl:call-template>
						<div class="styStdDiv">
							<div class="styLNLeftNumBox" style="height:9mm;"/>
							<span style="font-weight:bold;width:4mm;float:left;padding-top:4px;margin-left:-4mm">2. </span>
							<div class="sty1040NRScheduleOILongDesc" style="width:174.1mm;">
								<span>
									Were you subject to tax in a foreign country on any of the income shown in 1(d) above?
									<span style="width:2px"/><span class="sty1040NRScheduleOIDotLn">...........</span>
								</span>
								<span style="float:right;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/TxFrgnCntryExemptIncmCurrTYInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkboxNM" alt="Tx Frgn Cntry Exempt Incm Curr TY Ind Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TxFrgnCntryExemptIncmCurrTYInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/TxFrgnCntryExemptIncmCurrTYInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:3px;padding-right:2mm;font-weight:bold;">
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/TxFrgnCntryExemptIncmCurrTYInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/TxFrgnCntryExemptIncmCurrTYInd</xsl:with-param>
										</xsl:call-template>Yes</label>
									<input type="checkbox" class="styCkboxNM" alt="Tx Frgn Cntry Exempt Incm Curr TY Ind No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TxFrgnCntryExemptIncmCurrTYInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/TxFrgnCntryExemptIncmCurrTYInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:3px;font-weight:bold;">
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/TxFrgnCntryExemptIncmCurrTYInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/TxFrgnCntryExemptIncmCurrTYInd</xsl:with-param>
										</xsl:call-template>No</label>
								</span>
								<span style="height:3mm;"/>
							</div>
							<br/>
							<div class="sty1040NRScheduleOILongDesc" style="width:174mm">	
								<span style="margin-left:-4mm">
									<span style="font-weight:bold">3.</span><span style="width:7px"/>Are you claiming treaty benefits pursuant to a Competent Authority determination?
									<span style="width:8px"/><span class="sty1040NRScheduleOIDotLn">............</span>
								</span>
								<span style="float:right;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/CompetentAuthorityDetermInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkboxNM" alt="Competent Authority Determ Ind Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CompetentAuthorityDetermInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/CompetentAuthorityDetermInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:3px;padding-right:2mm;font-weight:bold;">
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/CompetentAuthorityDetermInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/CompetentAuthorityDetermInd</xsl:with-param>
										</xsl:call-template>Yes</label>
									<input type="checkbox" class="styCkboxNM" alt="Competent Authority Determ Ind No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CompetentAuthorityDetermInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/CompetentAuthorityDetermInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:3px;font-weight:bold;">
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/CompetentAuthorityDetermInd"/>
											<xsl:with-param name="BackupName">IRS1040NRScheduleOI/CompetentAuthorityDetermInd</xsl:with-param>
										</xsl:call-template>No</label>
								</span>
								<span style="height:3mm;"/>
								<br/>
								<span style="font-weight:bold;width:4mm;float:left;">&#8201;</span>
								<span style="width:2px;padding-top:6px;margin-left:-4mm"/>If "Yes," attach a copy of the Competent Authority determination letter to your return.
							</div>
						</div>
					</div>
					<div class="styStdDiv" style="margin-top:.5mm;">
						<div class="styLNLeftNumBox">M</div>
						<div class="sty1040NRScheduleOILongDesc" style="">
							Check the applicable box if:
						</div>
						<div class="styStdDiv">
							<span class="styLNLeftNumBox" style="width:11mm;padding-left:4mm">1.</span>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/Section871dElectionInd"/>
									<xsl:with-param name="BackupName">IRS1040NRScheduleOI/Section871dElectionInd</xsl:with-param>
								</xsl:call-template>
								<span class="sty1040NRScheduleOILongDesc" style="width:172mm;margin-left:-3mm">This the first year you are making
									 an election to treat income from real property located in the United States as effectively connected</span>
								<span class="sty1040NRScheduleOILongDesc" style="padding-left:12mm;width:183mm;margin-left:-4mm;">with a U.S. trade or business under section 871(d).  See instructions
									<span class="sty1040NRScheduleOIDotLn">....................<span style="width:2px"/>
									<img src="{$ImagePath}/1040EZ_Bullet_Sm.gif" alt="Right Arrow"/></span>
								</span>
							</label>
							<span style="float:left;padding-top:2px">
								<input type="checkbox" class="sty1040NRScheduleOICkbox" alt="Section871d Election Ind">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Section871dElectionInd"/>
										<xsl:with-param name="BackupName">IRS1040NRScheduleOI/Section871dElectionInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span> 
						</div>
						<div class="styStdDiv">
							<span class="styLNLeftNumBox" style="width:11mm;padding-left:4mm">2.</span>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/PYSection871dElectionNotRvkInd"/>
									<xsl:with-param name="BackupName">IRS1040NRScheduleOI/PYSection871dElectionNotRvkInd</xsl:with-param>
								</xsl:call-template>
								<span class="sty1040NRScheduleOILongDesc" style="width:172mm;margin-left:-3mm">You have made an election in a previous year that has not been revoked, to treat income from real property located in the United</span>
								<span class="sty1040NRScheduleOILongDesc" style="padding-left:12mm;width:183mm;margin-left:-4mm">States as effectively connected with a U.S. trade or business under section 871(d).  See instructions
									<span class="sty1040NRScheduleOIDotLn">..........<span style="width:2px"/>
									<img src="{$ImagePath}/1040EZ_Bullet_Sm.gif" alt="Right Arrow"/></span>
								</span>	
							</label>
							<span style="float:left;">
								<input type="checkbox" class="sty1040NRScheduleOICkbox" alt="PY Section871d Election Not Rvk Ind">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PYSection871dElectionNotRvkInd"/>
										<xsl:with-param name="BackupName">IRS1040NRScheduleOI/PYSection871dElectionNotRvkInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<div style="width:100mm;font-weight:bold;font-size:6.5pt;" class="styGenericDiv">
							For Paperwork Reduction Act Notice, see the 
							<span style="font-family:Arial">I</span>nstructions for Form 1040-NR.
						</div>
						<div style="width:44mm;text-align:center;font-size:6pt;
							padding-left:0mm;" class="styGenericDiv">Cat. No. 72756T
						</div>
						<div style="width:42mm;font-size:6pt;" class="styGenericDiv">
							<span class="styBoldText">Schedule OI (Form 1040-NR) 2020
							</span>
						</div>
					</div>
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
					</table>	
					<xsl:if test="($Print = $Separated) and (count($FormData/EnteredDepartedUSGrp) &gt; 8)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Schedule OI, Line G - Other Miscellaneous Deductions</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:91.5mm;">Entered U.S. date</th>
									<th class="styDepTblCell" scope="col" style="width:91.5mm;">Departed U.S. date</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/EnteredDepartedUSGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:91.5mm;text-align:center;">
											<div style="width:6.5mm;font-weight:bold;text-align:right;padding-right:2mm;" class="styGenericDiv">
												<xsl:value-of select="position()"/>
											</div>
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="EnteredUSDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:91.5mm;text-align:center;">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="DepartedUSDt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- $L1Data is a way to conglomerate all of the different line L(1) schema groups into a single XPath grouping. 
							The second part is to exclude IndiaStandardDedTaxTreatyGrp (line 38), if present -->
					<xsl:variable name="SepL1Data" select="$FormData/*[contains(local-name(),'TreatyGrp') and not(contains(local-name(),'Tax'))]"/>
					<xsl:variable name="SepCL1" select="count($SepL1Data)"/>
					<xsl:if test="($Print = $Separated) and ($SepCL1 &gt; 3)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Schedule OI, Line L(1) - Income Exempt From Income Tax Under U.S. Income Tax Treaty</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:35mm;">Country</th>
									<th class="styDepTblCell" scope="col" style="width:39mm;">Tax treaty article</th>
									<th class="styDepTblCell" scope="col" style="width:39mm;">Number of months claimed in prior tax years</th>
									<th class="styDepTblCell" scope="col" style="width:39mm;">Amount of exempt income in current tax year</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$SepL1Data">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:35mm;text-align:center;">
											<div style="width:6.5mm;font-weight:bold;text-align:right;padding-right:2mm;" class="styGenericDiv">
												<xsl:value-of select="position()"/>
											</div>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CountryCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="width:39mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TaxTreatyArticleCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="width:39mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="MnthExemptClmPriorTYNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:39mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExemptIncomeCurrentTYAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<br/>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
