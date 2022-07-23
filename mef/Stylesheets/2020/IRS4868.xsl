<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="IRS4868Style.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS4868"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)"/>
					</xsl:call-template>
				</title>
				<!--  No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<meta http-equiv="Content-Type" content="text/html"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<meta name="Description" content="Form IRS 4868"/>
				<xsl:call-template name="InitJS"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS4868Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form4868">
					<xsl:call-template name="DocumentHeader"/>
					<!--Title of Form -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:30mm;font-size: 7pt;height:19mm;">
							<div style="height:12mm">
            Form<span class="styFormNumber"> 4868</span>
							</div>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service (99)</span>
						</div>
						<div class="styFTBox" style="height:19mm;width:122mm;padding-top:1mm;">
							<div class="styMainTitle" style="">Application for Automatic Extension of Time<br/>
      To File U.S. Individual Income Tax Return
      </div>
							<div class="styFST" style="width:122mm;height:5mm;padding-top:4mm;font-size:6pt;margin-left:2mm;text-align:left;">
        For calendar year 2020, or other tax year beginning
					<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
						ending 
					<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
								<span style="width:0mm;"/>.
            </div>
						</div>
						<div class="styTYBox" style="width:30mm;height:19mm; border-left-width: 1px;">
							<div class="styOMB" style="font-size:7pt;">OMB No. 1545-0074</div>
							<br/>
							<div class="styTaxYear" style="height:10mm">20<span class="styTYColor">20</span>
							</div>
						</div>
					</div>
					<!--  End title of Form  -->
					<!-- BEGIN Part I Title -->
					<div class="styBB" style="width:187mm;border-bottom: 1px solid black;">
						<table width="186mm" border="0" cellpadding="0" cellspacing="0" style="font-family: Verdana; font-size: 7pt;">
							<!-- Inner table - Header, Part I -->
							<tr>
								<!--identification-->
								<td>
									<table style="width:95mm" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td style="width: 95mm;font-size:7pt;border-bottom:1px solid black;">
												<div class="styBB" style="width: 95mm;border-top:1px solid black;">
													<div class="styPartName" style="width:10mm;text-align:top;">Part I</div>
													<span class="styPartDesc" style="width:85mm;background-color:lightgrey;">Identification
                                    </span>
												</div>
											</td>
										</tr>
										<tr>
											<!--Name-->
											<td>
												<div style="width: 95mm;border-bottom: 1px solid black;border-right: 1px solid black;">
													<span class="styLNLeftNumBox" style="width:4mm;padding-left: 1.0mm;height:8mm;font-size:7pt;">1</span>
													<span class="styLNDesc" style="width:89mm;height:8mm;font-size:7pt;">Your name(s) (see instructions)
                                    <br/>
														<span style="height:4.5mm;padding-top:1mm;">
															<xsl:call-template name="PopulateReturnHeaderFiler">
																<xsl:with-param name="TargetNode">Name</xsl:with-param>
															</xsl:call-template>
															<br/>
														</span>
													</span>
												</div>
											</td>
										</tr>
										<tr>
											<!--Address-->
											<td>
												<div style="width: 95mm;border-bottom: 1px solid black;border-right: 1px solid black;">
													<div class="styLNLeftNumBox" style="width:4mm;padding-left: 1.0mm;height:14mm;font-size:7pt;"/>
													<div class="styLNDesc" style="width:74mm;height:6mm;font-size:7pt;">Address (see instructions)
                                        <br/>
														<span style="height:6mm;padding-top:1mm;">
															<xsl:call-template name="PopulateReturnHeaderFiler">
																<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
															</xsl:call-template>
															<br/>
															<xsl:call-template name="PopulateReturnHeaderFiler">
																<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
															</xsl:call-template>
														</span>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<!--City,State-->
											<td>
												<div style="width: 95mm;border-bottom:1px  solid black;border-right: 1px solid black;height:12.4mm;">
													<div class="styLNLeftNumBox" style="width:4mm;padding-left: 1.0mm;height:10mm;font-size:7pt;"/>
													<div class="styLNDesc" style="width:58mm;height:12.4mm;font-size:7pt;border-right: 1px solid black;">City, town, or post office
                                            <br/>
														<br/>
														<xsl:if test="$RtnHdrData/Filer/USAddress">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/CityNm"/>
															</xsl:call-template>
														</xsl:if>
														<xsl:if test="AppData/SubmissionHeaderAndDocument/ReturnHeader/Filer/ForeignAddress">
															<div style="font-size:6pt;">
																<xsl:call-template name="PopulateReturnHeaderFiler">
																	<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
																</xsl:call-template>
																<br/>
															<!--	<xsl:call-template name="PopulateReturnHeaderFiler">
																	<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
																</xsl:call-template>-->
															</div>
														</xsl:if>
													</div>
													<div class="styLNDesc" style="width:12mm;height:100%;font-size:7pt;text-align:center;border-right: 1px solid black;">
                                        State
                                            <br/>
														<br/>
														<xsl:if test="$RtnHdrData/Filer/USAddress">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/StateAbbreviationCd"/>
															</xsl:call-template>
														</xsl:if>
														<xsl:if test="AppData/SubmissionHeaderAndDocument/ReturnHeader/Filer/ForeignAddress">
															<xsl:call-template name="LinkToLeftoverDataTableInline">
																<xsl:with-param name="Desc">Part I, line 1 - State - Province or State Name</xsl:with-param>
																<xsl:with-param name="TargetNode" select="AppData/SubmissionHeaderAndDocument/ReturnHeader/Filer/ForeignAddress/ProvinceOrStateNm"/>
															</xsl:call-template>
															<xsl:call-template name="LinkToLeftoverDataTableInline">
																<xsl:with-param name="Desc">Part I, line 1 - State - Country Code</xsl:with-param>
																<xsl:with-param name="TargetNode" select="AppData/SubmissionHeaderAndDocument/ReturnHeader/Filer/ForeignAddress/CountryCd"/>
															</xsl:call-template>
															<!--<xsl:call-template name="PopulateReturnHeaderFiler">
																<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
															</xsl:call-template>-->
														</xsl:if>
													</div>
													<div class="styLNDesc" style="width:20mm;height:100%;font-size:7pt;text-align:center;">
														<span align="left" style="text-align:left;margin-right:6mm;padding-left:1mm">			
                                        ZIP code</span>
														<br/>
														<br/>
														<xsl:if test="$RtnHdrData/Filer/USAddress">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/ZIPCd"/>
															</xsl:call-template>
														</xsl:if>
														<xsl:if test="AppData/SubmissionHeaderAndDocument/ReturnHeader/Filer/ForeignAddress">
															<xsl:call-template name="LinkToLeftoverDataTableInline">
																<xsl:with-param name="Desc">Part I, line 1 - Zip Code - Postal Code</xsl:with-param>
																<xsl:with-param name="TargetNode" select="AppData/SubmissionHeaderAndDocument/ReturnHeader/Filer/ForeignAddress/ForeignPostalCd"/>
															</xsl:call-template>
														</xsl:if>
													</div>
													<br/>
													<br/>
												</div>
											</td>
										</tr>
										<tr>
											<!--SSN-->
											<td>
												<div style="width: 95mm;border-bottom-width: 0px;border-right: 1px solid black;">
													<span class="styLNLeftNumBox" style="width:4mm;padding-left: mm;height:8mm;font-size:7pt;">2</span>
													<span class="styLNDesc" style="width:42mm;height:10mm;font-size:7pt;border-right: 1px solid black;text-align:center">
														<span style="margin-right:2mm">
													Your social security number
													</span>
														<br/>
														<br/>
														<xsl:call-template name="PopulateSSN">
															<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
														</xsl:call-template>
													</span>
													<span class="styLNLeftNumBox" style="padding-left: 1mm;width:5mm;height:10mm;font-size:7pt;">3</span>
													<span class="styLNDesc" style="width:43mm;height:10mm;font-size:7pt;text-align:center">Spouse's social security number
                                            <br/>
														<br/>
														<xsl:call-template name="PopulateSSN">
															<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseSSN"/>
														</xsl:call-template>
													</span>
												</div>
											</td>
										</tr>
									</table>
								</td>
								<!--Part II-->
								<td width="92mm" style="width=89mm;" valign="top">
									<table style="width: 92mm;" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<!--Title-->
											<td style="width: 92mm;font-size:7pt;border-bottom:1px solid black;">
												<div class="styBB" style="width: 92mm;border-top:1px solid black;">
													<div class="styPartName" style="width:11mm;">Part II</div>
													<div class="styPartDesc" style="width:81mm;background-color:lightgrey;">Individual Income Tax
                                    </div>
												</div>
											</td>
										</tr>
										<tr>
											<!--Line 4-->
											<td style="width: 92mm;font-size:8pt;">
												<div style="width:92mm; padding-top:.5mm;">
													<span class="styLNLeftNumBox" style="width:5mm;padding-left: 1.25mm;height:5mm; font-size:7pt;">4</span>
													<span class="styLNDesc" style="width:57mm;height:auto;font-size:7pt;">Estimate of total tax liability for 2020
														<div class="styDotLn" style="float:none;padding-right:0mm;">..</div>$
													</span>
													<span class="styLNAmountBox" style="width:30mm;border-left-width:0px;text-align:right;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/TotalTaxLiabilityAmt"/>
														</xsl:call-template>
													</span>
												</div>
											</td>
										</tr>
										<tr>
											<!--Line 5-->
											<td style="width: 92mm;font-size:8pt;">
												<div style="width: 92mm;padding-top:.1mm; padding-bottom:.1mm;">
													<span class="styLNLeftNumBox" style="width:5mm;padding-left:1.25mm;height:4mm; font-size:7pt;">5</span>
													<span class="styLNDesc" style="width:57mm;height:auto;font-size:7pt;">Total 2020 payments
													    <div class="styDotLn" style="float:none;padding-right:0mm;">.......</div>
													</span>
												    <span class="styLNAmountBox" style="width:30mm;border-left-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt"/>
														</xsl:call-template>
													</span>
												</div>
											</td>
										</tr>
										<tr>
											<!--Line 6-->
											<td style="width: 92mm;font-size:8pt;">
												<div style="width: 92mm; padding-top: .5mm;">
													<span class="styLNLeftNumBox" style="width:5mm;padding-left: 1.25mm;height:4mm; font-size:7pt;">6</span>
													<span class="styLNDesc" style="width:57mm;height:auto;font-size:7pt;">
														<b>Balance due.</b> Subtract line 5 from line 4<br/>(see instructions)  
														<div class="styDotLn" style="float:none;padding-right:0.5mm;">........</div>
													</span>	
													<span class="styLNAmountBox" style="height:7mm;width:30mm;padding-top:3mm;border-left-width:0px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/BalanceDueAmt"/>
														</xsl:call-template>
													</span>
												</div>
											</td>
										</tr>
										<tr>
											<!--line 7-->
											<td style="width: 92mm;padding-top: .5mm;font-size:8pt;">
												<div style="width: 92mm; padding-top: .5mm;border-bottom:1px  solid black">
													<span class="styLNLeftNumBox" style="width:5mm;padding-left: 1.25mm;height:4mm; font-size:7pt;">7</span>
													<span class="styLNDesc" style="width:57mm;height:auto;font-size:7pt;">Amount you're paying (see instructions)
														<div class="styDotLn" style="float:none;padding-right:1mm;">.</div>
															<img src="{$ImagePath}/4868_Bullet.gif" width="4" height="7" alt="Right arrow image" border="0"/>
													</span>	
 													<span class="styLNAmountBoxNBB" style="width:30mm;border-left-width:0px;text-align:right;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/TaxpayerIsPayingAmt"/>
														</xsl:call-template>
													</span>
												</div>
											</td>
										</tr>
										<tr>
											<!--Line 8-->
											<td style="width:92mm;font-size:8pt;padding-top:.5mm;">
												<!--<div style="width:92mm;">-->
													<div class="styLNLeftNumBox" style="width:5mm;padding-left: 1.25mm;height:4mm; font-size:7pt;">8</div>
													<div class="styLNDesc" style="width:86mm;font-size:7pt;">
														<div style="width:80mm;float:none;clear:none;">
															Check here if you're "out of the country" and a U.S.<br/>
															citizen or resident (see instructions)
															<span class="styDotLn" style="float:none;padding-right:0mm;">........</span>
															<img src="{$ImagePath}/4868_Bullet.gif" alt="Right arrow image" border="0"/>
														</div>
														<div style="width:4mm;float:none;clear:none;">	
															<input type="checkbox" class="styckbox" alt="Taxpayer Abroad Indicator">
																<xsl:call-template name="PopulateCheckbox">
																	<xsl:with-param name="TargetNode" select="$FormData/TaxpayerAbroadInd"/>
																	<xsl:with-param name="BackupName">IRS4868TaxpayerAbroadInd</xsl:with-param>
																</xsl:call-template>
															</input>
															<label>
																<xsl:call-template name="PopulateLabel">
																	<xsl:with-param name="TargetNode" select="$FormData/TaxpayerAbroadInd"/>
																	<xsl:with-param name="BackupName">IRS4868TaxpayerAbroadInd</xsl:with-param>
																</xsl:call-template>
															</label>
														</div>	
													<!--</div>-->
												</div>
											</td>
										</tr>
										<tr>
											<!--Line 9-->
											<td style="height:12mm;width:92mm;font-size:8pt;">
												<!--<div style="width: 92mm; padding-top: .1mm;">-->
													<div class="styLNLeftNumBox" style="width:5mm;padding-left:1.25mm;height:4mm; font-size:7pt;">9</div>
													<div class="styLNDesc" style="width:86mm;height:4mm;font-size:7pt;">
														<div style="width:80mm;float:none;clear:none;">
															Check here if you file Form 1040-NR and didn't receive <br/>
															wages as an employee subject to U.S. income tax <br/>
															withholding 
															<span class="styDotLn" style="float:none;padding-right:0mm;
															letter-spacing:3.0mm;">................</span>
															<img src="{$ImagePath}/4868_Bullet.gif" alt="Right arrow image" border="0"/>
														</div>
														<div style="width:4mm;float:none;clear:none;">	
															<input type="checkbox" class="styckbox" alt="Nonresident With No Wages Subject To Withholding Indicator">
																<xsl:call-template name="PopulateCheckbox">
																	<xsl:with-param name="TargetNode" select="$FormData/NonresWithNoWagesSubjToWhInd"/>
																	<xsl:with-param name="BackupName">IRS4868NonresWithNoWagesSubjToWhInd</xsl:with-param>
																</xsl:call-template>
															</input>
															<label>
																<xsl:call-template name="PopulateLabel">
																	<xsl:with-param name="TargetNode" select="$FormData/NonresWithNoWagesSubjToWhInd"/>
																	<xsl:with-param name="BackupName">IRS4868NonresWithNoWagesSubjToWhInd</xsl:with-param>
																</xsl:call-template>
															</label>
														</div>	
													</div>
												<!--</div>-->
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>
					<div style="width: 187mm;font-size:7pt;">
						<span style="float:left;">
							<b>For Privacy Act and Paperwork Reduction Act Notice, later.</b>
							<span style=" width:21mm;"/>Cat. No. 13141W</span>
						<span style="font-size:7 pt;float:right;">Form <b>4868 </b>(2020)</span>
					</div>
					<!-- END Part I Part ll Title -->
					<!-- From 1065 form -->
					<!-- BEGIN Left Over Table -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
          Additional Data        
          </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<td class="styLeftOverTableRowAmount" style="width:100mm;" scope="row">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Part I, line 1 - State - Province or State Name</xsl:with-param>
								<xsl:with-param name="TargetNode" select="AppData/SubmissionHeaderAndDocument/ReturnHeader/Filer/ForeignAddress/ProvinceOrStateNm"/>
								<xsl:with-param name="BackupName">AppData/SubmissionHeaderAndDocument/ReturnHeader/Filer/ForeignAddress/ProvinceOrStateNm</xsl:with-param>
							</xsl:call-template>
						</td>
						<td class="styLeftOverTableRowAmount" style="width:100mm;" scope="row">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Part I, line 1 - State - Country Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="AppData/SubmissionHeaderAndDocument/ReturnHeader/Filer/ForeignAddress/CountryCd"/>
								<xsl:with-param name="BackupName">AppData/SubmissionHeaderAndDocument/ReturnHeader/Filer/ForeignAddress/CountryCd</xsl:with-param>
							</xsl:call-template>
						</td>
						<td class="styLeftOverTableRowAmount" style="width:100mm;" scope="row">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Part I, line 1 - Zip Code - Postal Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="AppData/SubmissionHeaderAndDocument/ReturnHeader/Filer/ForeignAddress/ForeignPostalCd"/>
								<xsl:with-param name="BackupName">AppData/SubmissionHeaderAndDocument/ReturnHeader/Filer/ForeignAddress/ForeignPostalCd</xsl:with-param>
							</xsl:call-template>
						</td>						
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
