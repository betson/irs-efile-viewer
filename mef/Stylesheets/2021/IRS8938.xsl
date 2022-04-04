<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Iskilu Lawal 4/1/2021  UWR # 243365 Drop 1 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="IRS8938Style.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8938"/>
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
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<meta name="Description" content="Form IRS 8938"/>
				<meta name="GENERATOR" content="IBM WebSphere Studio"/>
				<link rel="stylesheet" type="text/css" href="{$CSSPath}/header.css"/>
				<link rel="stylesheet" type="text/css" href="{$CSSPath}/body.css"/>
				<link rel="stylesheet" type="text/css" href="{$CSSPath}/general.css"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
					<xsl:call-template name="IRS8938Style"/>
					<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
			</head>
			<body class="styBodyClass">
				<form name="Form8938" style="font-family:arial;width:187mm;">
					<xsl:call-template name="DocumentHeader"/>
					<!--Title of Form -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="height:20.5mm;width:29mm;font-size: 8pt;">
							<div class="" style="height:13.8mm;">
      Form <span class="styFormNumber">8938</span>
								<!--<br/>(December 2015)<br/>  -->
								<br/>
								<span class="styAgency">(Rev. November 2021)</span>
								<span>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
								</span>
							</div>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:127mm;padding-top:0mm;height:10mm;">
							<div class="styMainTitle">Statement of Specified Foreign Financial Assets</div>
							<div class="styFST" style="font-size:8pt;float:center;font-weight:bold;height:4mm;">
								<br/>
								<span style="font-size:8pt;text-align:center;">
									<span style=""/>
									<img src="{$ImagePath}/8938_Bullet.gif" alt="MediumBullet"/>  
			  Go to
								<a style="text-decoration:none;color:black;" href="http://www.irs.gov/Form1065" title="Link to IRS.gov">
										<i>www.irs.gov/Form8938</i> for instructions and the latest information.
								</a>
									<br/>
									<span style="text-align:center;"/>
									<img src="{$ImagePath}/8938_Bullet.gif" alt="MediumBullet"/>  
			  Attach to your tax return.
			  <br/>
			  			 For calendar year 
			 								<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/CalendarYr"/>
										<xsl:with-param name="BackupName">CalendarYear</xsl:with-param>
									</xsl:call-template>
								 
								or tax year beginning
								<span style="width: 17mm;border-bottom:1 solid black;">
										<!-- No need to send the parameters -->
										<!--<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>-->
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="$FormData/TaxYearBeginDt"/>
										</xsl:call-template>
									</span>,  
							 
								
								 and ending 
								<span style="width:18mm;border-bottom:1 solid black;">
										<!-- No need to send the parameters -->
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="$FormData/TaxYearEndDt"/>
										</xsl:call-template>
									</span>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="height:20.5mm;width:30mm;border-left-width: 1px;">
							<div class="styOMB" style="height:5.5mm;padding-top:1mm;font-size:8pt;border-bottom-width: 0px;">
        OMB No. 1545-2195</div>
							<!--<div class="styTaxYear">
          20<span class="styTYColor">21</span>
		</div>-->
							<div class="stySequence">
								<br/>
								<br/>
								<br/>Attachment<br/>Sequence No. <b>175</b>
							</div>
						</div>
					</div>
					<!--  End title of Form  -->
					<div class="styBB" style="width:187mm; font-size:8pt;">
						<div class="styLNDesc" style="height:8mm;width:107mm;padding-top:1mm;
		  padding-left:6mm;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/DummyInd"/>
									<xsl:with-param name="BackupName">IRS8938DummyInd</xsl:with-param>
								</xsl:call-template>
								<b>If you have attached additional statements, check here</b>
							</label>
							<span style="width:5px;"/>
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/DummyInd"/>
									<xsl:with-param name="BackupName">IRS8938DummyInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="styLNDesc" style="height:8mm;width:55mm;padding-top:2mm">
							<b>Number of additional statements</b>
						</div>
						<div class="styFixedUnderline" style="width:21mm;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DummyCnt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  Name and Employer identification number  -->
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftLtrBox" style="padding-left:4mm;font-size:9pt;padding-top:.0mm;">1</div>
						<div class="styNameBox" style="width:110mm;font-weight:normal;font-size:8pt;height:10mm">
      Name(s) shown on return
      <br/>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNLeftLtrBox" style="padding-left:4mm;font-size:9pt;padding-top:.0mm;">2</div>
						<div class="styEINBox" style="padding-left:1mm;font-size:8pt;font-weight:normal">
   Taxpayer Identification Number (TIN)
						<br/>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">EIN</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!--  End Name and Employer indentification number  -->
					<div class="styBB" style="width:187mm;">
						<!--  Line 3  Start of Type of filer-->
						<div style="width:187mm;font-size:9pt;">
							<div class="styLNLeftLtrBox" style="padding-left:4mm;">3</div>
							<div class="styLNDesc" style="width:170mm;padding-left:2mm;">Type of filer</div>
						</div>
						<!--PART   Line 3 (a)  Start of Specified individual-->
						<div class="styLNDesc" style="width:187mm;padding-left:10mm;font-size:9pt;height:5.1mm;">
							<div class="styLNDesc" style="width:45.3mm;">
								<b>a</b>
								<span style="width:5px;"/>
								<input type="Checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/SpcfdIndividualInd"/>
										<xsl:with-param name="BackupName">IRS8938OFA-ANSP0L3SpcfdIndividualInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:5px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/SpcfdIndividualInd"/>
										<xsl:with-param name="BackupName">IRS8938OFA-ANSP0L3SpcfdIndividualInd</xsl:with-param>
									</xsl:call-template>
							Specified individual
						</label>
							</div>
							<!--PART   Line 3 (a)  End of Specified individual-->
							<!--PART   Line 3 (b)  Start of Partnership-->
							<div class="styLNDesc" style="width:45.5mm;">
								<b>b</b>
								<span style="width:5px;"/>
								<input type="Checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PartnershipInd"/>
										<xsl:with-param name="BackupName">IRS8938OFA-ANSP0L3PartnershipInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:5px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/PartnershipInd"/>
										<xsl:with-param name="BackupName">IRS8938OFA-ANSP0L3PartnershipInd</xsl:with-param>
									</xsl:call-template>
							Partnership
						</label>
							</div>
							<!--PART  Line 3 (b)  End of Partnership-->
							<!--PART  Line 3 (c)  Start of Corporation-->
							<div class="styLNDesc" style="width:45mm;">
								<b>c</b>
								<span style="width:5px;"/>
								<input type="Checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CorporationInd"/>
										<xsl:with-param name="BackupName">IRS8938OFA-ANSP0L3CorporationInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:5px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/CorporationInd"/>
										<xsl:with-param name="BackupName">IRS8938OFA-ANSP0L3CorporationInd</xsl:with-param>
									</xsl:call-template>
							Corporation 
						</label>
							</div>
							<!--PART  Line 3 (c)  End of Corporation-->
							<!--PART   Line 3 (d)  Start of Trust-->
							<div class="styLNDesc" style="width:40mm;">
								<b>d</b>
								<span style="width:5px;"/>
								<input type="Checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/TrustInd"/>
										<xsl:with-param name="BackupName">IRS8938OFA-ANSP0L3TrustInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:5px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/TrustInd"/>
										<xsl:with-param name="BackupName">IRS8938OFA-ANSP0L3TrustInd</xsl:with-param>
									</xsl:call-template>
							Trust 
						</label>
							</div>
							<!--PART  Line 3 (d)  End of Trust-->
							<!--PART  Line 3  End of Type of filer-->
						</div>
					</div>
					<!--PART   Line 4 Start-->
					<!--PART VI  Line 4 Start-->
					<div class="styBB" style="width:187mm;">
						<div style="width:187mm;padding-bottom:1mm;">
							<div class="styLNLeftLtrBox" style="padding-left:4mm;font-size:8pt;font-weight:normal;">4</div>
							<div class="styLNDesc" style="width:178mm;font-weight:normal;font-size:8pt;height:auto;float:right">
			If you checked box 3a, skip this line 4. If you checked box 3b or 3c, enter the name and TIN of the specified individual who closely holds
the partnership or corporation. If you checked box 3d, enter the name and TIN of the specified person who is a current beneficiary of the
trust. (See instructions for definitions and what to do if you have more than one specified individual or specified person to list.)
					
			</div>
						</div>
						<xsl:if test=" (count($FormData/SpecifiedIndivOrPersonInfo ) &lt;1)">
							<div class="styLNDesc" style="width:120mm;">
								<div class="styLNLeftLtrBox" style="width:12mm;text-align:right;padding-left:4mm;font-size:8pt;">a</div>
								<div class="styLNDesc" style="padding-left:6mm;width:15mm;">Name</div>
								<div class="styLNLeftLtrBox" style="width:12mm;text-align:right;padding-left:4mm;font-size:8pt;font-weight:normal;"/>
								<div class="styLNDesc" style="padding-left:6mm;width:15mm;"/>
							</div>
							<div class="styLNDesc" style="width:66mm;">
								<div class="styLNLeftLtrBox" style="font-size:8pt;width:5mm;text-align:right;">b</div>
								<div class="styLNDesc" style="width:10mm;text-align:right">TIN</div>
								<div class="styLNLeftLtrBox" style="font-size:8pt;font-weight:normal;width:5mm;text-align:right;"/>
								<div class="styLNDesc" style="width:10mm;text-align:right"/>
							</div>
						</xsl:if>
						<!--Choice of Person Name vs Business Name -->
						<xsl:for-each select="$FormData/SpecifiedIndivOrPersonInfo ">
							<xsl:variable name="curPos">
								<xsl:value-of select="position()-1"/>
							</xsl:variable>
							<div style="width:187mm;padding-bottom:1mm;">
								<div style="width:140mm;">
									<xsl:choose>
										<xsl:when test="position() = 1">
											<div class="styLNLeftLtrBox" style="width:12mm;text-align:right;padding-left:4mm;font-size:8pt;">a</div>
											<div class="styLNDesc" style="padding-left:6mm;width:15mm;">Name</div>
										</xsl:when>
										<xsl:otherwise>
											<div class="styLNLeftLtrBox" style="width:12mm;text-align:right;padding-left:4mm;font-size:8pt;font-weight:normal;"/>
											<div class="styLNDesc" style="padding-left:6mm;width:15mm;"/>
										</xsl:otherwise>
									</xsl:choose>
									<div style="width:113mm;">
										<xsl:choose>
											<xsl:when test="PersonNm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SpecifiedIndivOrPersonInfo[$curPos +1]/PersonNm"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:when test="
						BusinessNm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SpecifiedIndivOrPersonInfo[$curPos +1]/BusinessNm/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="$FormData/SpecifiedIndivOrPersonInfo[$curPos +1]/BusinessNm/BusinessNameLine2Txt">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/SpecifiedIndivOrPersonInfo[$curPos +1]/BusinessNm/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:when>
										</xsl:choose>
									</div>
								</div>
								<div style="width:46mm;">
									<xsl:choose>
										<xsl:when test="position() = 1">
											<div class="styLNLeftLtrBox" style="font-size:8pt;width:5mm;text-align:right;">b</div>
											<div class="styLNDesc" style="width:10mm;text-align:right">TIN</div>
										</xsl:when>
										<xsl:otherwise>
											<div class="styLNLeftLtrBox" style="font-size:8pt;font-weight:normal;width:5mm;text-align:right;"/>
											<div class="styLNDesc" style="width:10mm;text-align:right"/>
										</xsl:otherwise>
									</xsl:choose>
									<!--Choice of Person SSN, EIN, vs MissingEIN -->
									<xsl:choose>
										<xsl:when test="BusinessNm">
											<div style="height:6mm;width:20mm;text-align:right;padding-top:.5mm;">
												<xsl:choose>
													<xsl:when test="EIN">
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="$FormData/SpecifiedIndivOrPersonInfo[$curPos +1]/EIN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:when test="MissingEINReasonCd">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/SpecifiedIndivOrPersonInfo[$curPos +1]/MissingEINReasonCd"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="$FormData/SpecifiedIndivOrPersonInfo[$curPos +1]/EIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</div>
										</xsl:when>
										<xsl:otherwise>
											<div style="width:20mm;text-align:right;padding-top:.5mm;">
												<xsl:choose>
													<xsl:when test="MissingEINReasonCd">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/SpecifiedIndivOrPersonInfo[$curPos +1]/MissingEINReasonCd"/>
														</xsl:call-template>
													</xsl:when>
													<!--<xsl:when test="$FormData/SpecifiedIndivOrPersonInfo/EIN">
								<xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="$FormData/SpecifiedIndivOrPersonInfo[$curPos +1]/EIN"/>
								</xsl:call-template>
							  </xsl:when>-->
													<xsl:otherwise>
														<xsl:call-template name="PopulateSSN">
															<xsl:with-param name="TargetNode" select="$FormData/SpecifiedIndivOrPersonInfo[$curPos +1]/SSN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</div>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</div>
						</xsl:for-each>
					</div>
					<!-- BEGIN PART I TITLE -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="font-size:10pt;padding-bottom:5mm;font-family:arial;
		  text-align:center;padding-top:.5mm">Part I</div>
						<div class="styPartDesc" style="font-size:10pt;padding-left:3mm;float:left;clear:none;
		  padding-bottom:.5mm;padding-top:.5mm;">
		  Foreign Deposit and Custodial Accounts Summary</div>
					</div>
					<!-- END PART I TITLE -->
					<!-- PART 1 START-->
					<!-- PART 1 LINE 5 -->
					<div class="styBB" style="width:187mm;font-size:8pt;">
						<div class="styLNLeftLtrBox" style="padding-left:4mm;width:3mm">5</div>
						<div class="styLNDesc" style="width:150.5mm;padding-left:4mm;height:auto;">
		  Number of Deposit Accounts (reported in Part V)
			<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">..............</span>
							<span style="width:2.5mm"/>
							<img src="{$ImagePath}/8938_Bullet.gif" alt="MediumBullet"/>
						</div>
						<div class="styLNAmountBoxNB" style="height:2mm;padding-top:.7mm;float:right;
				  padding-bottom:0mm;" valign="bottom">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignDepositAcctCnt"/>
								<xsl:with-param name="BackupName">IRS8938ForDepAcctCnt</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!-- PART 1 LINE 6 -->
					<div class="styBB" style="width:187mm;font-size:8pt;">
						<div class="styLNLeftLtrBox" style="padding-left:4mm;width:6mm;">6</div>
						<div class="styLNDesc" style="width:148mm;padding-left:2mm;">
		  Maximum Value of All Deposit Accounts
			<span class="styDotLn" style="float:none;clear:none;padding-left:.2mm;">.....................</span>
							<span style="width:2mm"/>$
		</div>
						<div class="styLNAmountBoxNB" style="height:2mm;padding-top:.7mm;
				  padding-bottom:0mm;" valign="bottom">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MaxAllFrgnDepositAcctValueAmt"/>
								<xsl:with-param name="BackupName">IRS8938MaxAllFrgDepAcctValAmt</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!-- PART 1 LINE 7 -->
					<div class="styBB" style="width:187mm;font-size:8pt;">
						<div class="styLNLeftLtrBox" style="padding-left:4mm;width:3mm">7</div>
						<div class="styLNDesc" style="width:150.5mm;padding-left:4mm;height:auto;">
		  Number of Custodial Accounts (reported in Part V)
			<span class="styDotLn" style="float:none;clear:none;padding-left:.3mm;">..............</span>
							<span style="width:2mm"/>
							<img src="{$ImagePath}/8938_Bullet.gif" alt="MediumBullet"/>
						</div>
						<div class="styLNAmountBoxNB" style="height:2mm;padding-top:.7mm;float:right;
				  padding-bottom:0mm;" valign="bottom">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignCustodialAcctCnt"/>
								<xsl:with-param name="BackupName">IRS8938ForCustAcctCnt</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!-- PART 1 LINE 8 -->
					<div class="styBB" style="width:187mm;font-size:8pt;">
						<div class="styLNLeftLtrBox" style="padding-left:4mm;width:3mm">8</div>
						<div class="styLNDesc" style="width:151mm;padding-left:4mm;height:auto;">
		  Maximum Value of All Custodial Accounts
			<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">...................</span>
							<span style="width:2mm"/>$
		</div>
						<div class="styLNAmountBoxNB" style="height:2mm;padding-top:.8mm;
				  padding-bottom:0mm;" valign="bottom">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MaxAllFrgnCstdAcctValueAmt"/>
								<xsl:with-param name="BackupName">IRS8938MaxAllFrgCstAcctValAmt</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!-- PART 1 LINE 9 -->
					<div class="styBB" style="width:187mm;font-size:8pt;">
						<div class="styLNLeftLtrBox" style="padding-left:4mm;width:3mm;padding-top:2mm">9</div>
						<div class="styLNDesc" style="width:180mm;padding-left:4mm;padding-bottom:5mm;">
		  Were any foreign deposit or custodial accounts closed during the tax year?
			<span class="styDotLn" style="float:none;clear:none;padding-left:2.5mm;">........<span style="width:1mm"/>
							</span>
							<!--PART 1 Line 9  Start "Yes" Checkbox-->
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/AnyDepOrCstdAcctClosedDurTYInd"/>
								</xsl:call-template>
								<input type="Checkbox" alt="Any Dep Or Cstd Acct Closed Dur TY Ind Yes" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/AnyDepOrCstdAcctClosedDurTYInd"/>
										<xsl:with-param name="BackupName">IRS8938AnyDepOrCstAcctCloDurTYInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/AnyDepOrCstdAcctClosedDurTYInd"/>
										<xsl:with-param name="BackupName">IRS8938AnyDepOrCstAcctCloDurTYInd</xsl:with-param>
									</xsl:call-template>
				Yes
			</label>
							</span>
							<span style="width:10mm;"/>
							<!-- PART 1 Line 9  End "Yes" Checkbox-->
							<!-- PART 1 Line 9  Start "No" Checkbox-->
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/AnyDepOrCstdAcctClosedDurTYInd"/>
								</xsl:call-template>
								<input type="Checkbox" alt="Any Dep Or Cstd Acct Closed Dur TY Ind No" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/AnyDepOrCstdAcctClosedDurTYInd"/>
										<xsl:with-param name="BackupName">IRS8938AnyDepOrCstAcctCloDurTYInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span>
								<span style="width:5px;"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/AnyDepOrCstdAcctClosedDurTYInd"/>
										<xsl:with-param name="BackupName">IRS8938AnyDepOrCstAcctCloDurTYInd</xsl:with-param>
									</xsl:call-template>
				No
			</label>
							</span>
							<span style="width:5px;"/>
							<!-- PART 1 LINE 9  End "No" Checkbox-->
						</div>
					</div>
					<!-- PART 1 END -->
					<!-- PART II START -->
					<!-- BEGIN PART II TITLE -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="font-size:10pt;padding-bottom:5mm;font-family:arial;
		  text-align:center;padding-top:.5mm;">Part II</div>
						<div class="styPartDesc" style="font-size:10pt;padding-left:3mm;float:left;clear:none;
		  padding-bottom:.5mm;padding-top:.5mm;height:auto;">
		  Other Foreign Assets Summary</div>
					</div>
					<!-- END PART II TITLE -->
					<!-- PART II LINE 10 -->
					<div class="styBB" style="width:187mm;font-size:8pt;">
						<div class="styLNLeftLtrBox" style="padding-right:2mm;padding-left:2.5mm;text-align:left;width:3mm;">10</div>
						<div class="styLNDesc" style="width:150.5mm;padding-left:3.5mm;height:auto;">
		  Number of Foreign Assets (reported in Part Vl)
			<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">...............</span>
							<span style="width:2.5mm"/>
							<img src="{$ImagePath}/8938_Bullet.gif" alt="MediumBullet"/>
						</div>
						<div class="styLNAmountBoxNB" style="height:2mm;padding-top:.7mm;float:right;
				  padding-bottom:0mm;" valign="bottom">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignAssetCnt"/>
								<xsl:with-param name="BackupName">IRS8938ForAssetCnt</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!-- PART II LINE 11 -->
					<div class="styBB" style="width:187mm;font-size:8pt;">
						<div class="styLNLeftLtrBox" style="padding-right:2mm;padding-left:2.5mm;width:3mm">11</div>
						<div class="styLNDesc" style="width:150.5mm;padding-left:3.5mm;height:auto;">
		  Maximum Value of All Assets (reported in Part Vl)
			<span class="styDotLn" style="float:none;clear:none;padding-left:2.9mm;">....................</span>
							<span style="width:1.6mm"/>$
		</div>
						<div class="styLNAmountBoxNB" style="height:2mm;padding-top:.8mm;
				  padding-bottom:0mm;" valign="bottom">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MaxAllFrgnAssetValueAmt"/>
								<xsl:with-param name="BackupName">IRS8938MaxAllFrgAssetValAmt</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!-- PART II LINE 12 -->
					<div class="styBB" style="width:187mm;font-size:8pt;padding-bottom:.25mm;">
						<div class="styLNLeftLtrBox" style="padding-right:2mm;padding-left:2.5mm;width:3mm;padding-top:2mm;">12</div>
						<div class="styLNDesc" style="width:182.5mm;padding-left:3.5mm;height:auto;">
		  Were any foreign assets acquired or sold during the tax year?
			<span class="styDotLn" style="float:none;clear:none;padding-left:0mm;">.............<span style="width:.6mm"/>
							</span>
							<!--PART II Line 12  Start "Yes" Checkbox-->
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/AnyFrgnAssetAcqOrSoldDurTYInd"/>
								</xsl:call-template>
								<input type="Checkbox" alt="Any Frgn Asset Acq Or Sold Dur TY Ind Yes" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/AnyFrgnAssetAcqOrSoldDurTYInd"/>
										<xsl:with-param name="BackupName">IRS8938AnyFrgnAssetAcqOrSoldDurTYInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/AnyFrgnAssetAcqOrSoldDurTYInd"/>
										<xsl:with-param name="BackupName">IRS8938AnyFrgnAssetAcqOrSoldDurTYInd</xsl:with-param>
									</xsl:call-template>
				Yes
			</label>
							</span>
							<span style="width:10mm;"/>
							<!-- PART II Line 12  End "Yes" Checkbox-->
							<!-- PART II Line 12  Start "No" Checkbox-->
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/AnyFrgnAssetAcqOrSoldDurTYInd"/>
								</xsl:call-template>
								<input type="Checkbox" alt="Any Frgn Asset Acq Or Sold Dur TY Ind No" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/AnyFrgnAssetAcqOrSoldDurTYInd"/>
										<xsl:with-param name="BackupName">IRS8938AnyFrgnAssetAcqOrSoldDurTYInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/AnyFrgnAssetAcqOrSoldDurTYInd"/>
										<xsl:with-param name="BackupName">IRS8938AnyFrgnAssetAcqOrSoldDurTYInd</xsl:with-param>
									</xsl:call-template>
				No
			</label>
							</span>
							<!-- PART II LINE 12  End "No" Checkbox-->
						</div>
					</div>
					<!-- PART II END -->
					<!-- PART III  START -->
					<!-- BEGIN PART III TITLE -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="font-size:10pt;padding-bottom:5mm;font-family:arial;
		  text-align:center;padding-top:.5mm;">Part III</div>
						<div class="styPartDesc" style="font-size:10pt;padding-left:0mm;float:left;clear:none;width:173mm;padding-top:1mm;">
			Summary of Tax Items Attributable to Specified Foreign Financial Assets
			<span style="font-weight:normal;"> (see instructions) </span>
						</div>
					</div>
					<!-- END PART IIl TITLE -->
					<div style="width:187mm;border-style:solid;border-color:black;
	  border-width: 0px 0px 1px 0px;font-size:8pt;">
						<div class="styLNDesc" style="height:7mm;width:40mm;text-align:center;
		  padding-top:4mm;border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">
							<b>(a)</b> Asset Category</div>
						<div class="styLNDesc" style="height:7mm;width:30mm;text-align:center;
		  padding-top:4mm;border-style:solid;border-color:black;border-width: 0px 1px 0px 1px;">
							<b>(b)</b> Tax item</div>
						<div class="styLNDesc" style="height:7mm;width:34.28mm;text-align:center;
		  border-style:solid;border-color:black;border-width: 0px 1px 0px 0px;font:8.5pt">
							<b>(c)</b> Amount reported<br/>on form or schedule</div>
						<div style="height:7mm;width:82mm;float:left;clear:none;">
							<div class="styLNDesc" style="width:82mm;text-align:center;padding-top:0mm;
			  padding-bottom:0mm;border-style:solid;border-color:black;
			  border-width: 0px 0px 1px 0px;">Where reported</div>
							<br/>
							<div style="width:82mm;">
								<div class="styLNDesc" style="width:41mm;text-align:center;padding-top:0mm;
				  height:4.7mm;padding-bottom:0mm;border-style:solid;border-color:black;
				  border-width: 0px 1px 0px 0px;">
									<b>(d)</b> Form and line</div>
								<div class="styLNDesc" style="width:40mm;text-align:center;padding-top:0mm;
				  padding-bottom:0mm;">
									<b>(e)</b> Schedule and line</div>
							</div>
						</div>
					</div>
					<!--PART III  Start of Foreign Deposit and Custodial Accounts -->
					<!--INTEREST-->
					<div style="width:187mm;font-size:8pt;height:auto;">
						<div class="styLNDesc" style="height:4mm;width:40mm;padding-left:4mm;
		padding-top:1mm;">
							<b>13</b>
							<span style="width:2mm"/>Foreign Deposit and<br/>
							<span style="width:5mm"/>Custodial Accounts</div>
						<div class="styLNDesc" style="width:30mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-width: 0px 1px 1px 1px;">
							<b>1a </b> Interest</div>
						<div class="styLNDesc" style="width:2mm;border-style:solid;
		  border-width: 0px 0px 1px 0px;">$</div>
						<div class="styLNAmountBox" style="border-left-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountSumGrp/InterestSumGrp/ReportedOnFormOrScheduleAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-width: 0px 1px 1px 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedFormAndLineTxt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-width: 0px 0px 1px 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedSchAndLineTxt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="height:0.1mm;width:40mm;padding-bottom:0mm;
		  padding-top:0mm;"/>
						<div class="styLNDesc" style="height:0mm;width:64mm;padding-left:3mm;
		  padding-top:0mm;"/>
						<!-- Interest Test Form <=1 and Schedule >1)-->
						<xsl:if test="     (count($FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedFormAndLineTxt) &lt;=1)
		  and    (count($FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedSchAndLineTxt) &gt;1) ">
							<div class="styLNDesc" style="width:41.1mm;text-align:left;padding-left:0mm;height;auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;padding-top:0mm">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Interest Test Form >1 and (Form > Sched)-->
						<xsl:if test="    ((count($FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedFormAndLineTxt) &gt;1)
		  and    ((count($FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedFormAndLineTxt)) &gt;
		            (count($FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 1px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Interest Test Form >1 and (Form <= Sched)-->
						<xsl:if test="    ((count($FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedFormAndLineTxt) &gt;1)
		  and    ((count($FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedFormAndLineTxt)) &lt;=
		            (count($FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.1mm;text-align:left;padding-left:0mm;height:auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Interest Test Schedule >1 and (Form = Schedule)-->
						<xsl:if test="     ((count($FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedSchAndLineTxt) &gt;1)
		  and    ((count($FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedFormAndLineTxt)) =
		            (count($FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Interest Test Schedule >1 and (Form < Schedule)-->
						<xsl:if test="     ((count($FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedSchAndLineTxt) &gt;1)
		  and     ((count($FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedFormAndLineTxt)) &lt;
		             (count($FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Interest Test Schedule >1 and (Form > Schedule)-->
						<xsl:if test="     ((count($FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedSchAndLineTxt) &gt;1)
		  and    ((count($FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedFormAndLineTxt)) &gt;
		            (count($FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
					</div>
					<!--DIVIDENDS-->
					<div style="width:187mm;font-size:8pt;height:auto;">
						<div class="styLNDesc" style="height:4mm;width:40mm;padding-bottom:0mm;
		padding-top:1mm;">
		   </div>
						<div class="styLNDesc" style="width:30mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-width: 0px 1px 1px 1px;">
							<b>1b </b> Dividends</div>
						<div class="styLNDesc" style="width:2mm;border-style:solid;
		  border-width: 0px 0px 1px 0px;">$</div>
						<div class="styLNAmountBox" style="border-left-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountSumGrp/DividendSumGrp/ReportedOnFormOrScheduleAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-width: 0px 1px 1px 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedFormAndLineTxt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-width: 0px 0px 1px 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedSchAndLineTxt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="height:0.1mm;width:40mm;padding-bottom:0mm;
		  padding-top:0mm;">
							<span style="width:2mm"/>
						</div>
						<div class="styLNDesc" style="height:0mm;width:64mm;padding-left:3mm;
		  padding-top:0mm;"/>
						<!-- Dividend Test Form <=1 and Schedule >1)-->
						<xsl:if test="     (count($FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedFormAndLineTxt) &lt;=1)
		  and    (count($FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedSchAndLineTxt) &gt;1) ">
							<div class="styLNDesc" style="width:41.1mm;text-align:left;padding-left:0mm;height;auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;padding-top:0mm">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Dividend Test Form >1 and (Form > Sched)-->
						<xsl:if test="    ((count($FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedFormAndLineTxt) &gt;1)
		  and    ((count($FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedFormAndLineTxt)) &gt;
		            (count($FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 1px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Dividend Test Form >1 and (Form <= Sched)-->
						<xsl:if test="    ((count($FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedFormAndLineTxt) &gt;1)
		  and    ((count($FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedFormAndLineTxt)) &lt;=
		            (count($FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.1mm;text-align:left;padding-left:0mm;height:auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Dividend Test Schedule >1 and (Form = Schedule)-->
						<xsl:if test="     ((count($FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedSchAndLineTxt) &gt;1)
		  and    ((count($FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedFormAndLineTxt)) =
		            (count($FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Dividend Test Schedule >1 and (Form < Schedule)-->
						<xsl:if test="     ((count($FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedSchAndLineTxt) &gt;1)
		  and     ((count($FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedFormAndLineTxt)) &lt;
		             (count($FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Dividend Test Schedule >1 and (Form > Schedule)-->
						<xsl:if test="     ((count($FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedSchAndLineTxt) &gt;1)
		  and    ((count($FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedFormAndLineTxt)) &gt;
		            (count($FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
					</div>
					<!-- ROYALTIES>-->
					<div style="width:187mm;font-size:8pt;height:auto;">
						<div class="styLNDesc" style="height:4mm;width:40mm;padding-bottom:0mm;
		padding-top:1mm;">
		  </div>
						<div class="styLNDesc" style="width:30mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-width: 0px 1px 1px 1px;">
							<b>1c </b> Royalties</div>
						<div class="styLNDesc" style="width:2mm;border-style:solid;
		  border-width: 0px 0px 1px 0px;">$</div>
						<div class="styLNAmountBox" style="border-left-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/ReportedOnFormOrScheduleAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-width: 0px 1px 1px 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedFormAndLineTxt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-width: 0px 0px 1px 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedSchAndLineTxt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="height:0.1mm;width:40mm;padding-bottom:0mm;
		  padding-top:0mm;">
							<span style="width:2mm"/>
						</div>
						<div class="styLNDesc" style="height:0mm;width:64mm;padding-left:3mm;
		  padding-top:0mm;"/>
						<!-- Royalty Test Form <=1 and Schedule >1)-->
						<xsl:if test="     (count($FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedFormAndLineTxt) &lt;=1)
		  and    (count($FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedSchAndLineTxt) &gt;1) ">
							<div class="styLNDesc" style="width:41.1mm;text-align:left;padding-left:0mm;height;auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;padding-top:0mm">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Royalty Test Form >1 and (Form > Sched)-->
						<xsl:if test="    ((count($FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedFormAndLineTxt) &gt;1)
		  and    ((count($FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedFormAndLineTxt)) &gt;
		            (count($FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 1px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Royalty Test Form >1 and (Form <= Sched)-->
						<xsl:if test="    ((count($FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedFormAndLineTxt) &gt;1)
		  and    ((count($FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedFormAndLineTxt)) &lt;=
		            (count($FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.1mm;text-align:left;padding-left:0mm;height:auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Royalty Test Schedule >1 and (Form = Schedule)-->
						<xsl:if test="     ((count($FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedSchAndLineTxt) &gt;1)
		  and    ((count($FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedFormAndLineTxt)) =
		            (count($FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Royalty Test Schedule >1 and (Form < Schedule)-->
						<xsl:if test="     ((count($FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedSchAndLineTxt) &gt;1)
		  and     ((count($FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedFormAndLineTxt)) &lt;
		             (count($FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Royalty Test Schedule >1 and (Form > Schedule)-->
						<xsl:if test="     ((count($FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedSchAndLineTxt) &gt;1)
		  and    ((count($FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedFormAndLineTxt)) &gt;
		            (count($FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
					</div>
					<!--OTHER INCOME-->
					<div style="width:187mm;font-size:8pt;height:auto;">
						<div class="styLNDesc" style="height:4mm;width:40mm;padding-bottom:0mm;
		padding-top:1mm;">
		  </div>
						<div class="styLNDesc" style="width:30mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-width: 0px 1px 1px 1px;">
							<b>1d </b>Other income</div>
						<div class="styLNDesc" style="width:2mm;border-style:solid;
		  border-width: 0px 0px 1px 0px;">$</div>
						<div class="styLNAmountBox" style="border-left-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/ReportedOnFormOrScheduleAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-width: 0px 1px 1px 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLineTxt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-width: 0px 0px 1px 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedSchAndLineTxt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="height:0.1mm;width:40mm;padding-bottom:0mm;
		  padding-top:0mm;">
							<span style="width:2mm"/>
						</div>
						<div class="styLNDesc" style="height:0mm;width:64mm;padding-left:3mm;
		  padding-top:0mm;"/>
						<!-- OtherIncome Test Form <=1 and Schedule >1)-->
						<xsl:if test="     (count($FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLineTxt) &lt;=1)
		  and    (count($FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedSchAndLineTxt) &gt;1) ">
							<div class="styLNDesc" style="width:41.1mm;text-align:left;padding-left:0mm;height;auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;padding-top:0mm">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- OtherIncome Test Form >1 and (Form > Sched)-->
						<xsl:if test="    ((count($FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLineTxt) &gt;1)
		  and    ((count($FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLineTxt)) &gt;
		            (count($FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 1px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- OtherIncome Test Form >1 and (Form <= Sched)-->
						<xsl:if test="    ((count($FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLineTxt) &gt;1)
		  and    ((count($FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLineTxt)) &lt;=
		            (count($FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.1mm;text-align:left;padding-left:0mm;height:auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- OtherIncome Test Schedule >1 and (Form = Schedule)-->
						<xsl:if test="     ((count($FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedSchAndLineTxt) &gt;1)
		  and    ((count($FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLineTxt)) =
		            (count($FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- OtherIncome Test Schedule >1 and (Form < Schedule)-->
						<xsl:if test="     ((count($FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedSchAndLineTxt) &gt;1)
		  and     ((count($FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLineTxt)) &lt;
		             (count($FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- OtherIncome Test Schedule >1 and (Form > Schedule)-->
						<xsl:if test="     ((count($FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedSchAndLineTxt) &gt;1)
		  and    ((count($FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLineTxt)) &gt;
		            (count($FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
					</div>
					<!--GAINLOSS-->
					<div style="width:187mm;font-size:8pt;height:auto;">
						<div class="styLNDesc" style="height:4mm;width:40mm;padding-bottom:0mm;
		padding-top:1mm;">
		  </div>
						<div class="styLNDesc" style="width:30mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-width: 0px 1px 1px 1px;">
							<b>1e </b>Gains (losses)</div>
						<div class="styLNDesc" style="width:2mm;border-style:solid;
		  border-width: 0px 0px 1px 0px;">$</div>
						<div class="styLNAmountBox" style="border-left-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/ReportedOnFormOrScheduleAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-width: 0px 1px 1px 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedFormAndLineTxt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-width: 0px 0px 1px 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedSchAndLineTxt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="height:0.1mm;width:40mm;padding-bottom:0mm;
		  padding-top:0mm;">
							<span style="width:2mm"/>
						</div>
						<div class="styLNDesc" style="height:0mm;width:64mm;padding-left:3mm;
		  padding-top:0mm;"/>
						<!-- GainLoss Test Form <=1 and Schedule >1)-->
						<xsl:if test="     (count($FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedFormAndLineTxt) &lt;=1)
		  and    (count($FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedSchAndLineTxt) &gt;1) ">
							<div class="styLNDesc" style="width:41.1mm;text-align:left;padding-left:0mm;height;auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;padding-top:0mm">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- GainLoss Test Form >1 and (Form > Sched)-->
						<xsl:if test="    ((count($FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedFormAndLineTxt) &gt;1)
		  and    ((count($FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedFormAndLineTxt)) &gt;
		            (count($FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 1px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- GainLoss Test Form >1 and (Form <= Sched)-->
						<xsl:if test="    ((count($FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedFormAndLineTxt) &gt;1)
		  and    ((count($FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedFormAndLineTxt)) &lt;=
		            (count($FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.1mm;text-align:left;padding-left:0mm;height:auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- GainLoss Test Schedule >1 and (Form = Schedule)-->
						<xsl:if test="     ((count($FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedSchAndLineTxt) &gt;1)
		  and    ((count($FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedFormAndLineTxt)) =
		            (count($FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- GainLoss Test Schedule >1 and (Form < Schedule)-->
						<xsl:if test="     ((count($FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedSchAndLineTxt) &gt;1)
		  and     ((count($FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedFormAndLineTxt)) &lt;
		             (count($FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- GainLoss Test Schedule >1 and (Form > Schedule)-->
						<xsl:if test="     ((count($FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedSchAndLineTxt) &gt;1)
		  and    ((count($FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedFormAndLineTxt)) &gt;
		            (count($FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
					</div>
					<!--DEDUCTION-->
					<div style="width:187mm;font-size:8pt;height:auto;">
						<div class="styLNDesc" style="height:4mm;width:40mm;padding-bottom:0mm;
		padding-top:1mm;">
		  </div>
						<div class="styLNDesc" style="width:30mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-width: 0px 1px 1px 1px;">
							<b>1f </b>Deductions</div>
						<div class="styLNDesc" style="width:2mm;border-style:solid;
		  border-width: 0px 0px 1px 0px;">$</div>
						<div class="styLNAmountBox" style="border-left-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/ReportedOnFormOrScheduleAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-width: 0px 1px 1px 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedFormAndLineTxt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-width: 0px 0px 1px 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedSchAndLineTxt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="height:0.1mm;width:40mm;padding-bottom:0mm;
		  padding-top:0mm;">
							<span style="width:2mm"/>
						</div>
						<div class="styLNDesc" style="height:0mm;width:64mm;padding-left:3mm;
		  padding-top:0mm;"/>
						<!-- Deduction Test Form <=1 and Schedule >1)-->
						<xsl:if test="     (count($FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedFormAndLineTxt) &lt;=1)
		  and    (count($FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedSchAndLineTxt) &gt;1) ">
							<div class="styLNDesc" style="width:41.1mm;text-align:left;padding-left:0mm;height;auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;padding-top:0mm">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Deduction Test Form >1 and (Form > Sched)-->
						<xsl:if test="    ((count($FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedFormAndLineTxt) &gt;1)
		  and    ((count($FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedFormAndLineTxt)) &gt;
		            (count($FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 1px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Deduction Test Form >1 and (Form <= Sched)-->
						<xsl:if test="    ((count($FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedFormAndLineTxt) &gt;1)
		  and    ((count($FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedFormAndLineTxt)) &lt;=
		            (count($FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.1mm;text-align:left;padding-left:0mm;height:auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Deduction Test Schedule >1 and (Form = Schedule)-->
						<xsl:if test="     ((count($FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedSchAndLineTxt) &gt;1)
		  and    ((count($FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedFormAndLineTxt)) =
		            (count($FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Deduction Test Schedule >1 and (Form < Schedule)-->
						<xsl:if test="     ((count($FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedSchAndLineTxt) &gt;1)
		  and     ((count($FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedFormAndLineTxt)) &lt;
		             (count($FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Deduction Test Schedule >1 and (Form > Schedule)-->
						<xsl:if test="     ((count($FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedSchAndLineTxt) &gt;1)
		  and    ((count($FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedFormAndLineTxt)) &gt;
		            (count($FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
					</div>
					<!--CREDIT-->
					<div style="width:187mm;font-size:8pt;height:auto;">
						<div class="styLNDesc" style="height:4mm;width:40mm;padding-bottom:0mm;
		padding-top:1mm;">
		  </div>
						<div class="styLNDesc" style="width:30mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-width: 0px 1px 1px 1px;">
							<b>1g </b>Credits</div>
						<div class="styLNDesc" style="width:2mm;border-style:solid;
		  border-width: 0px 0px 1px 0px;">$</div>
						<div class="styLNAmountBox" style="border-left-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountSumGrp/CreditSumGrp/ReportedOnFormOrScheduleAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-width: 0px 1px 1px 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedFormAndLineTxt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-width: 0px 0px 1px 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedSchAndLineTxt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="height:0.1mm;width:40mm;padding-bottom:0mm;
		  padding-top:0mm;">
							<span style="width:2mm"/>
						</div>
						<div class="styLNDesc" style="height:0mm;width:64mm;padding-left:3mm;
		  padding-top:0mm;"/>
						<!-- Credit Test Form <=1 and Schedule >1)-->
						<xsl:if test="     (count($FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedFormAndLineTxt) &lt;=1)
		  and    (count($FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedSchAndLineTxt) &gt;1) ">
							<div class="styLNDesc" style="width:41.1mm;text-align:left;padding-left:0mm;height;auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;padding-top:0mm">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Credit Test Form >1 and (Form > Sched)-->
						<xsl:if test="    ((count($FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedFormAndLineTxt) &gt;1)
		  and    ((count($FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedFormAndLineTxt)) &gt;
		            (count($FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 1px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Credit Test Form >1 and (Form <= Sched)-->
						<xsl:if test="    ((count($FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedFormAndLineTxt) &gt;1)
		  and    ((count($FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedFormAndLineTxt)) &lt;=
		            (count($FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.1mm;text-align:left;padding-left:0mm;height:auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Credit Test Schedule >1 and (Form = Schedule)-->
						<xsl:if test="     ((count($FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedSchAndLineTxt) &gt;1)
		  and    ((count($FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedFormAndLineTxt)) =
		            (count($FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Credit Test Schedule >1 and (Form < Schedule)-->
						<xsl:if test="     ((count($FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedSchAndLineTxt) &gt;1)
		  and     ((count($FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedFormAndLineTxt)) &lt;
		             (count($FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Credit Test Schedule >1 and (Form > Schedule)-->
						<xsl:if test="     ((count($FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedSchAndLineTxt) &gt;1)
		  and    ((count($FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedFormAndLineTxt)) &gt;
		            (count($FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
								<xsl:for-each select="$FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
					</div>
					<!--PART III  End of Foreign Deposit and Custodial Accounts-->
					<!--PART III  Start of Other Foreign Assets -->
					<!--OTHER INTEREST-->
					<div style="width:187mm;font-size:8pt;height:auto">
						<div class="styLNDesc" style="height:2mm;width:40mm;padding-left:4mm;
		  border-style:solid;border-color:black;border-width: 1px 0px 0px 0px;">
							<b>14</b>
							<span style="width:2mm"/>Other Foreign Assets</div>
						<div class="styLNDesc" style="width:30mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-color:black;border-width: 1px 1px 1px 1px;">
							<b>2a </b> Interest</div>
						<div class="styLNDesc" style="width:2mm;border-style:solid;border-color:black;
		  border-width: 1px 0px 1px 0px;">$</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top-width:1px;border-left-width:0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetSumGrp/InterestSumGrp/ReportedOnFormOrScheduleAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-color:black;border-width: 1px 1px 1px 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedFormAndLineTxt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:41mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-color:black;border-width: 1px 0px 1px 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedSchAndLineTxt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="height:0.1mm;width:40mm;padding-bottom:0mm;
		  padding-top:0mm;"/>
						<div class="styLNDesc" style="height:0mm;width:64mm;padding-left:3mm;
		  padding-top:0mm;"/>
						<!-- Other Interest Test Form <=1 and Schedule >1)-->
						<xsl:if test="     (count($FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedFormAndLineTxt) &lt;=1)         and    (count($FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedSchAndLineTxt) &gt;1) ">
							<div class="styLNDesc" style="width:41.1mm;text-align:left;padding-left:0mm;height:auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;
       		  padding-top:0mm">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Other Interest Test Form >1 and (Form > Sched)-->
						<xsl:if test="    ((count($FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedFormAndLineTxt) &gt;1)         and    ((count($FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedFormAndLineTxt)) &gt;    (count($FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;
       		  padding-top:0mm">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 1px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Other Interest Test Form >1 and (Form <= Sched)-->
						<xsl:if test="    ((count($FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedFormAndLineTxt) &gt;1)         and    ((count($FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedFormAndLineTxt)) &lt;=    (count($FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.1mm;text-align:left;padding-left:0mm;height:auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;
       		  padding-top:0mm;">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Other Interest Test Schedule >1 and (Form = Schedule)-->
						<xsl:if test="     ((count($FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedSchAndLineTxt) &gt;1)         and    ((count($FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedFormAndLineTxt)) =    (count($FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;
			  padding-top:0mm;">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Other Interest Test Schedule >1 and (Form < Schedule)-->
						<xsl:if test="     ((count($FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedSchAndLineTxt) &gt;1)         and     ((count($FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedFormAndLineTxt)) &lt;    (count($FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;
			  padding-top:0mm;">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Other Interest Test Schedule >1 and (Form > Schedule)-->
						<xsl:if test="     ((count($FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedSchAndLineTxt) &gt;1)         and    ((count($FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedFormAndLineTxt)) &gt;    (count($FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;
			  padding-top:0mm;">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
					</div>
					<!--OTHER DIVIDEND-->
					<div style="width:187mm;font-size:8pt;height:auto">
						<div class="styLNDesc" style="height:2mm;width:40mm;padding-bottom:0mm;
		  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">
							<br/>
							<span style="width:18mm"/>
						</div>
						<div class="styLNDesc" style="width:30mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-color:black;border-width: 0px 1px 1px 1px;">
							<b>2b </b> Dividends</div>
						<div class="styLNDesc" style="width:2mm;border-style:solid;border-color:black;
		  border-width: 0px 0px 1px 0px;">$</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top-width:0px;border-left-width:0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetSumGrp/DividendSumGrp/ReportedOnFormOrScheduleAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-color:black;border-width: 0px 1px 1px 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedFormAndLineTxt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:41mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedSchAndLineTxt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="height:0.1mm;width:40mm;padding-bottom:0mm;
		  padding-top:0mm;">
							<span style="width:2mm"/>
						</div>
						<div class="styLNDesc" style="height:0mm;width:64mm;padding-left:3mm;
		  padding-top:0mm;"/>
						<!-- Other Dividend Test Form <=1 and Schedule >1)-->
						<xsl:if test="     (count($FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedFormAndLineTxt) &lt;=1)         and    (count($FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedSchAndLineTxt) &gt;1) ">
							<div class="styLNDesc" style="width:41.1mm;text-align:left;padding-left:0mm;height:auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;
       		  padding-top:0mm">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Other Dividend Test Form >1 and (Form > Sched)-->
						<xsl:if test="    ((count($FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedFormAndLineTxt) &gt;1)         and    ((count($FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedFormAndLineTxt)) &gt;    (count($FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;
       		  padding-top:0mm">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 1px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Other Dividend Test Form >1 and (Form <= Sched)-->
						<xsl:if test="    ((count($FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedFormAndLineTxt) &gt;1)         and    ((count($FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedFormAndLineTxt)) &lt;=    (count($FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.1mm;text-align:left;padding-left:0mm;height:auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;
       		  padding-top:0mm;">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Other Dividend Test Schedule >1 and (Form = Schedule)-->
						<xsl:if test="     ((count($FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedSchAndLineTxt) &gt;1)         and    ((count($FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedFormAndLineTxt)) =    (count($FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;
			  padding-top:0mm;">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Other Dividend Test Schedule >1 and (Form < Schedule)-->
						<xsl:if test="     ((count($FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedSchAndLineTxt) &gt;1)         and     ((count($FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedFormAndLineTxt)) &lt;    (count($FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;
			  padding-top:0mm;">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Other Dividend Test Schedule >1 and (Form > Schedule)-->
						<xsl:if test="     ((count($FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedSchAndLineTxt) &gt;1)         and    ((count($FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedFormAndLineTxt)) &gt;    (count($FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;
			  padding-top:0mm;">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
					</div>
					<!-- OTHER ROYALTY-->
					<div style="width:187mm;font-size:8pt;height:auto">
						<div class="styLNDesc" style="height:2mm;width:40mm;padding-bottom:0mm;
		  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">
							<br/>
							<span style="width:18mm"/>
						</div>
						<div class="styLNDesc" style="width:30mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-color:black;border-width: 0px 1px 1px 1px;">
							<b>2c </b> Royalties</div>
						<div class="styLNDesc" style="width:2mm;border-style:solid;border-color:black;
		  border-width: 0px 0px 1px 0px;">$</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top-width:0px;border-left-width:0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/ReportedOnFormOrScheduleAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-color:black;border-width: 0px 1px 1px 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedFormAndLineTxt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:41mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedSchAndLineTxt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="height:0.1mm;width:40mm;padding-bottom:0mm;
		  padding-top:0mm;">
							<span style="width:2mm"/>
						</div>
						<div class="styLNDesc" style="height:0mm;width:64mm;padding-left:3mm;
		  padding-top:0mm;"/>
						<!-- Other Royalty Test Form <=1 and Schedule >1)-->
						<xsl:if test="     (count($FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedFormAndLineTxt) &lt;=1)         and    (count($FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedSchAndLineTxt) &gt;1) ">
							<div class="styLNDesc" style="width:41.1mm;text-align:left;padding-left:0mm;height:auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;
       		  padding-top:0mm">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Other Royalty Test Form >1 and (Form > Sched)-->
						<xsl:if test="    ((count($FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedFormAndLineTxt) &gt;1)         and    ((count($FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedFormAndLineTxt)) &gt;    (count($FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;
       		  padding-top:0mm">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 1px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Other Royalty Test Form >1 and (Form <= Sched)-->
						<xsl:if test="    ((count($FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedFormAndLineTxt) &gt;1)         and    ((count($FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedFormAndLineTxt)) &lt;=    (count($FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.1mm;text-align:left;padding-left:0mm;height:auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;
       		  padding-top:0mm;">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Other Royalty Test Schedule >1 and (Form = Schedule)-->
						<xsl:if test="     ((count($FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedSchAndLineTxt) &gt;1)         and    ((count($FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedFormAndLineTxt)) =    (count($FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;
			  padding-top:0mm;">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Other Royalty Test Schedule >1 and (Form < Schedule)-->
						<xsl:if test="     ((count($FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedSchAndLineTxt) &gt;1)         and     ((count($FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedFormAndLineTxt)) &lt;    (count($FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;
			  padding-top:0mm;">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Other Royalty Test Schedule >1 and (Form > Schedule)-->
						<xsl:if test="     ((count($FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedSchAndLineTxt) &gt;1)         and    ((count($FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedFormAndLineTxt)) &gt;    (count($FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;
			  padding-top:0mm;">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
					</div>
					<!--OTHER OTHER INCOME-->
					<div style="width:187mm;font-size:8pt;height:auto">
						<div class="styLNDesc" style="height:2mm;width:40mm;padding-bottom:0mm;
		  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">
							<br/>
							<span style="width:18mm"/>
						</div>
						<div class="styLNDesc" style="width:30mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-color:black;border-width: 0px 1px 1px 1px;">
							<b>2d </b> Other income</div>
						<div class="styLNDesc" style="width:2mm;border-style:solid;border-color:black;
		  border-width: 0px 0px 1px 0px;">$</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top-width:0px;border-left-width:0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/ReportedOnFormOrScheduleAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-color:black;border-width: 0px 1px 1px 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLineTxt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:41mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedSchAndLineTxt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="height:0.1mm;width:40mm;padding-bottom:0mm;
		  padding-top:0mm;">
							<span style="width:2mm"/>
						</div>
						<div class="styLNDesc" style="height:0mm;width:64mm;padding-left:3mm;
		  padding-top:0mm;"/>
						<!-- Other OtherIncome Test Form <=1 and Schedule >1)-->
						<xsl:if test="     (count($FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLineTxt) &lt;=1)         and    (count($FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedSchAndLineTxt) &gt;1) ">
							<div class="styLNDesc" style="width:41.1mm;text-align:left;padding-left:0mm;height:auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;
       		  padding-top:0mm">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Other OtherIncome Test Form >1 and (Form > Sched)-->
						<xsl:if test="    ((count($FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLineTxt) &gt;1)         and    ((count($FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLineTxt)) &gt;    (count($FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;
       		  padding-top:0mm">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 1px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Other OtherIncome Test Form >1 and (Form <= Sched)-->
						<xsl:if test="    ((count($FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLineTxt) &gt;1)         and    ((count($FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLineTxt)) &lt;=    (count($FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.1mm;text-align:left;padding-left:0mm;height:auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;
       		  padding-top:0mm;">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Other OtherIncome Test Schedule >1 and (Form = Schedule)-->
						<xsl:if test="     ((count($FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedSchAndLineTxt) &gt;1)         and    ((count($FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLineTxt)) =    (count($FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;
			  padding-top:0mm;">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Other OtherIncome Test Schedule >1 and (Form < Schedule)-->
						<xsl:if test="     ((count($FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedSchAndLineTxt) &gt;1)         and     ((count($FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLineTxt)) &lt;    (count($FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;
			  padding-top:0mm;">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Other OtherIncome Test Schedule >1 and (Form > Schedule)-->
						<xsl:if test="     ((count($FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedSchAndLineTxt) &gt;1)         and    ((count($FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLineTxt)) &gt;    (count($FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;
			  padding-top:0mm;">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
					</div>
					<!--OTHER GAIN LOSS-->
					<div style="width:187mm;font-size:8pt;height:auto">
						<div class="styLNDesc" style="height:2mm;width:40mm;padding-bottom:0mm;
		  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">
							<br/>
							<span style="width:18mm"/>
						</div>
						<div class="styLNDesc" style="width:30mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-color:black;border-width: 0px 1px 1px 1px;">
							<b>2e </b> Gains (losses)</div>
						<div class="styLNDesc" style="width:2mm;border-style:solid;border-color:black;
		  border-width: 0px 0px 1px 0px;">$</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top-width:0px;border-left-width:0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetSumGrp/GainLossSumGrp/ReportedOnFormOrScheduleAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-color:black;border-width: 0px 1px 1px 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedFormAndLineTxt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:41mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedSchAndLineTxt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="height:0.1mm;width:40mm;padding-bottom:0mm;
		  padding-top:0mm;">
							<span style="width:2mm"/>
						</div>
						<div class="styLNDesc" style="height:0mm;width:64mm;padding-left:3mm;
		  padding-top:0mm;"/>
						<!-- Other GainLoss Test Form <=1 and Schedule >1)-->
						<xsl:if test="     (count($FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedFormAndLineTxt) &lt;=1)         and    (count($FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedSchAndLineTxt) &gt;1) ">
							<div class="styLNDesc" style="width:41.1mm;text-align:left;padding-left:0mm;height:auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;
       		  padding-top:0mm">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Other GainLoss Test Form >1 and (Form > Sched)-->
						<xsl:if test="    ((count($FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedFormAndLineTxt) &gt;1)         and    ((count($FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedFormAndLineTxt)) &gt;    (count($FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;
       		  padding-top:0mm">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 1px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Other GainLoss Test Form >1 and (Form <= Sched)-->
						<xsl:if test="    ((count($FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedFormAndLineTxt) &gt;1)         and    ((count($FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedFormAndLineTxt)) &lt;=    (count($FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.1mm;text-align:left;padding-left:0mm;height:auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;
       		  padding-top:0mm;">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Other GainLoss Test Schedule >1 and (Form = Schedule)-->
						<xsl:if test="     ((count($FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedSchAndLineTxt) &gt;1)         and    ((count($FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedFormAndLineTxt)) =    (count($FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;
			  padding-top:0mm;">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Other GainLoss Test Schedule >1 and (Form < Schedule)-->
						<xsl:if test="     ((count($FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedSchAndLineTxt) &gt;1)         and     ((count($FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedFormAndLineTxt)) &lt;    (count($FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;
			  padding-top:0mm;">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Other GainLoss Test Schedule >1 and (Form > Schedule)-->
						<xsl:if test="     ((count($FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedSchAndLineTxt) &gt;1)         and    ((count($FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedFormAndLineTxt)) &gt;    (count($FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;
			  padding-top:0mm;">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
					</div>
					<!--OTHER DEDUCTIONS-->
					<div style="width:187mm;font-size:8pt;height:auto">
						<div class="styLNDesc" style="height:2mm;width:40mm;padding-bottom:0mm;
		  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">
							<br/>
							<span style="width:18mm"/>
						</div>
						<div class="styLNDesc" style="width:30mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-color:black;border-width: 0px 1px 1px 1px;">
							<b>2f </b> Deductions</div>
						<div class="styLNDesc" style="width:2mm;border-style:solid;border-color:black;
		  border-width: 0px 0px 1px 0px;">$</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top-width:0px;border-left-width:0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetSumGrp/DeductionSumGrp/ReportedOnFormOrScheduleAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-color:black;border-width: 0px 1px 1px 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedFormAndLineTxt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:41mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedSchAndLineTxt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="height:0.1mm;width:40mm;padding-bottom:0mm;
		  padding-top:0mm;">
							<span style="width:2mm"/>
						</div>
						<div class="styLNDesc" style="height:0mm;width:64mm;padding-left:3mm;
		  padding-top:0mm;"/>
						<!-- Other Deduction Test Form <=1 and Schedule >1)-->
						<xsl:if test="     (count($FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedFormAndLineTxt) &lt;=1)         and    (count($FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedSchAndLineTxt) &gt;1) ">
							<div class="styLNDesc" style="width:41.1mm;text-align:left;padding-left:0mm;height:auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;
       		  padding-top:0mm">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Other Deduction Test Form >1 and (Form > Sched)-->
						<xsl:if test="    ((count($FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedFormAndLineTxt) &gt;1)         and    ((count($FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedFormAndLineTxt)) &gt;    (count($FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;
       		  padding-top:0mm">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 1px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Other Deduction Test Form >1 and (Form <= Sched)-->
						<xsl:if test="    ((count($FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedFormAndLineTxt) &gt;1)         and    ((count($FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedFormAndLineTxt)) &lt;=    (count($FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.1mm;text-align:left;padding-left:0mm;height:auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;
       		  padding-top:0mm;">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Other Deduction Test Schedule >1 and (Form = Schedule)-->
						<xsl:if test="     ((count($FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedSchAndLineTxt) &gt;1)         and    ((count($FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedFormAndLineTxt)) =    (count($FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;
			  padding-top:0mm;">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Other Deduction Test Schedule >1 and (Form < Schedule)-->
						<xsl:if test="     ((count($FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedSchAndLineTxt) &gt;1)         and     ((count($FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedFormAndLineTxt)) &lt;    (count($FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;
			  padding-top:0mm;">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Other Deduction Test Schedule >1 and (Form > Schedule)-->
						<xsl:if test="     ((count($FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedSchAndLineTxt) &gt;1)         and    ((count($FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedFormAndLineTxt)) &gt;    (count($FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;
			  padding-top:0mm;">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
					</div>
					<!--OTHER CREDIT-->
					<div style="width:187mm;font-size:8pt;height:auto">
						<div class="styLNDesc" style="height:2mm;width:40mm;padding-bottom:0mm;
		  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">
							<br/>
							<span style="width:18mm"/>
						</div>
						<div class="styLNDesc" style="width:30mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-color:black;border-width: 0px 1px 1px 1px;">
							<b>2g </b>  Credits</div>
						<div class="styLNDesc" style="width:2mm;border-style:solid;border-color:black;
		  border-width: 0px 0px 1px 0px;">$</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;border-top-width:0px;border-left-width:0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetSumGrp/CreditSumGrp/ReportedOnFormOrScheduleAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-color:black;border-width: 0px 1px 1px 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedFormAndLineTxt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:41mm;text-align:left;padding-left:1mm;
		  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedSchAndLineTxt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="height:0.1mm;width:40mm;padding-bottom:0mm;
		  padding-top:0mm;">
							<span style="width:2mm"/>
						</div>
						<div class="styLNDesc" style="height:0mm;width:64mm;padding-left:3mm;
		  padding-top:0mm;"/>
						<!-- Other Credit Test Form <=1 and Schedule >1)-->
						<xsl:if test="     (count($FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedFormAndLineTxt) &lt;=1)         and    (count($FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedSchAndLineTxt) &gt;1) ">
							<div class="styLNDesc" style="width:41.1mm;text-align:left;padding-left:0mm;height:auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;
       		  padding-top:0mm">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Other Credit Test Form >1 and (Form > Sched)-->
						<xsl:if test="    ((count($FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedFormAndLineTxt) &gt;1)         and    ((count($FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedFormAndLineTxt)) &gt;    (count($FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;
       		  padding-top:0mm">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 1px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Other Credit Test Form >1 and (Form <= Sched)-->
						<xsl:if test="    ((count($FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedFormAndLineTxt) &gt;1)         and    ((count($FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedFormAndLineTxt)) &lt;=    (count($FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.1mm;text-align:left;padding-left:0mm;height:auto;
       		  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;
       		  padding-top:0mm;">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedFormAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Other Credit Test Schedule >1 and (Form = Schedule)-->
						<xsl:if test="     ((count($FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedSchAndLineTxt) &gt;1)         and    ((count($FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedFormAndLineTxt)) =    (count($FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;
			  padding-top:0mm;">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Other Credit Test Schedule >1 and (Form < Schedule)-->
						<xsl:if test="     ((count($FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedSchAndLineTxt) &gt;1)         and     ((count($FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedFormAndLineTxt)) &lt;    (count($FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;
			  padding-top:0mm;">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
						<!-- Other Credit Test Schedule >1 and (Form > Schedule)-->
						<xsl:if test="     ((count($FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedSchAndLineTxt) &gt;1)         and    ((count($FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedFormAndLineTxt)) &gt;    (count($FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedSchAndLineTxt))))">
							<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:0mm;height:auto;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;
			  padding-top:0mm;">
								<xsl:for-each select="$FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedSchAndLineTxt">
									<xsl:choose>
										<xsl:when test="position()&gt;1">
											<div class="styLNDesc" style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</div>
						</xsl:if>
					</div>
					<!--PART III  End of Other Foreign Assets )-->
					<!--PART IV  START -->
					<!-- BEGIN PART IV TITLE -->
					<div class="styBB" style="width:187mm;"/>
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="font-size:10pt;padding-bottom:5mm;
		  font-family:arial;text-align:center;padding-top:.5mm;">Part IV</div>
						<div class="styPartDesc" style="font-size:10pt;padding-left:3mm;float:left;
		  clear:none;padding-top:.5mm;padding-bottom:5mm;">
		  Excepted Specified Foreign Financial Assets
		  <span style="font-weight:normal;"> (see instructions)</span>
						</div>
					</div>
					<!-- END PART IV TITLE -->
					<div style="width:187mm;font-size:8pt;">
						<div class="styLNDesc" style="width:187mm;padding-bottom:3mm;padding-bottom:11mm;">
	      If you reported specified foreign financial assets on one or more of the following
	      forms, enter the number of such forms filed. You do not
	      need to include these assets on Form 8938 for the tax year.
		</div>
					</div>
					<div style="width:187mm;font-size:8pt;">
						<!-- NUMBER OF FORMS 3520 -->
						<div class="styLNDesc" style="width:60mm;">
							<div class="styLNLeftLtrBox" style="padding-left:0mm;width:6mm">15.</div>
							<div class="styLNDesc" style="width:34mm;">Number of Forms 3520</div>
							<div class="styFixedUnderline" style="width:15mm;font-size:8pt;text-align:right">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/Form3520Cnt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- NUMBER OF FORMS 3520-A -->
						<div class="styLNDesc" style="width:64mm;">
							<div class="styLNLeftLtrBox" style="padding-left:0mm;width:6mm">16.</div>
							<div class="styLNDesc" style="width:38mm;">Number of Forms 3520-A</div>
							<div class="styFixedUnderline" style="width:16mm;font-size:8pt;text-align:right">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/Form3520ACnt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- NUMBER OF FORMS 5471 -->
						<div class="styLNDesc" style="width:63mm;">
							<div class="styLNLeftLtrBox" style="padding-left:0mm;width:6mm">17.</div>
							<div class="styLNDesc" style="width:34mm;">Number of Forms 5471</div>
							<div class="styFixedUnderline" style="width:16mm;font-size:8pt;text-align:right">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/Form5471Cnt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div style="width:187mm;font-size:8pt;height:8mm">
						<!-- NUMBER OF FORMS 8621 -->
						<div class="styLNDesc" style="width:60mm;">
							<div class="styLNLeftLtrBox" style="padding-left:0mm;width:6mm">18.</div>
							<div class="styLNDesc" style="width:34mm;">Number of Forms 8621</div>
							<div class="styFixedUnderline" style="width:15mm;font-size:8pt;text-align:right">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/Form8621Cnt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- NUMBER OF FORMS 8865 -->
						<div class="styLNDesc" style="width:64mm;">
							<div class="styLNLeftLtrBox" style="padding-left:0mm;width:6mm">19.</div>
							<div class="styLNDesc" style="width:38mm;">Number of Forms 8865</div>
							<div class="styFixedUnderline" style="width:16mm;font-size:8pt;text-align:right">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/Form8865Cnt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- NUMBER OF FORMS 8891 -->
						<!--<div class="styLNDesc" style="width:63mm;">
							<div class="styLNLeftLtrBox" style="padding-left:0mm;width:3mm">6.</div>
							<div class="styLNDesc" style="width:34mm;">Number of Forms 8891</div>
							<div class="styFixedUnderline" style="width:16mm;font-size:8pt;text-align:right">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/Form8891Cnt"/>
								</xsl:call-template>
							</div>
						</div>-->
					</div>
					<span style="height:.3mm;"/>
					<!-- Page 1 Parts I-IV START OF FOOTER -->
					<div class="pageEnd" style="width:187mm;border-top:1px solid black;">
						<div style="width:187mm;font-size:8pt;">
							<span class="styBoldText" style="font-size:8pt;width:100mm;">
				  For Paperwork Reduction Act Notice, see the separate instructions.</span>
							<span style="width:15mm;"/>Cat. No. 37753A
					<span style="width:17mm;"/>Form 
					<span class="styBoldText" style="font-size:8pt;">8938</span> (Rev. 11-2021)
					</div>
					</div>
					<!-- Page 1 Parts I-IV END OF FOOTER -->					
					<!-- Page 2 Part V START OF HEADER-->						
					<div style="width:187mm;font-size:8pt;border-bottom:1px solid black">
						<span style="width:150mm;">Form 8938 (Rev. 11-2021)</span>
						<span style="width:27mm;"/>Page <span class="styBoldText" style="font-size:8pt">2</span>
					</div>
					<!-- Page 2 Part V END OF HEADER-->						
					
					<!--PART V  START OF FOREIGN DEPOSIT AND CUSTODIAL ACCOUNTS-->
					<xsl:if test="(count($FormData/ForeignFinclAccountGrp) &lt;1)">
						<!-- BEGIN PART V TITLE -->
						<span style="height:.3mm;"/>
						<!--<div class="styBB" style="width:187mm;"/>-->
						<div class="styBB" style="width:187mm;">
							<div class="styPartName" style="font-size:10pt;padding-top:.5mm;
				  font-family:arial;text-align:center;padding-bottom:5mm;heght:auto;">Part V</div>
							<div class="styPartDesc" style="font-size:10pt;padding-left:3mm;float:left;
				  clear:none;padding-bottom:.5mm;">Detailed Information for Each Foreign Deposit and Custodial
				  Account Included in the Part I Summary
				  <span style="font-weight:normal;">  (see instructions)</span>
							</div>
							<span style="height:7mm;"/>
						</div>
						<!-- END PART V TITLE -->
						<div class="styBB" style="width:187mm;">
							<div class="styLNDesc" style="width:187mm;font-size:8pt;">
				If you have more than one account to report in Part V, attach a separate statement
				  for each additional account (see instructions).
				  				  </div>
							<!--<span style="height:5mm;"/>-->
						</div>
						<div class="styBB" style="width:187mm;font-size:8pt;">
							<!-- Start Line 1, PART V  Type Of Account-->
							<div style="width:38mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="padding-left:2mm;">20</div>
								<div class="styLNDesc" style="width:25mm;padding-left:2mm;">
									Type of account
								</div>
							</div>
							<div style="width:65mm;float:left;clear:none;">
								<!--PART V  Start of Deposit Account Type Ind-->
								<b>a</b>
								<span style="padding-left:.5mm;">
								<!--<span>-->
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/DepositAccountTypeInd"/>
									</xsl:call-template>
									<input type="Checkbox" alt="Deposit Account Type Indicator" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/DepositAccountTypeInd"/>
											<xsl:with-param name="BackupName">IRS8938FFADepositAccountTypeInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="padding-left:.5mm;">
									<!--<span style="width:.25px;"/>-->
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/DepositAccountTypeInd"/>
											<xsl:with-param name="BackupName">IRS8938FFADepositAccountTypeInd</xsl:with-param>
										</xsl:call-template>
								Deposit 
								</label>
								</span>
								<!--PART V  End of Deposit Account Type Ind-->
								<span style="padding-left:8mm;">
									<!--<span style="width:8mm;"/>-->
									<!--PART V  Start of Custodial Account Type Ind-->
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/CustodialAccountTypeInd"/>
									</xsl:call-template>
									<b>b</b>
									<input type="Checkbox" alt="Custodial Account Type Indicator" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/CustodialAccountTypeInd"/>
											<xsl:with-param name="BackupName">IRS8938FFACustodialAccountTypeInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span>
									<span style="width:5px;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/CustodialAccountTypeInd"/>
											<xsl:with-param name="BackupName">IRS8938FFACustodialAccountTypeInd</xsl:with-param>
										</xsl:call-template>
									Custodial
								</label>
								</span>
								<!--PART V  End of Custodial Account Type Ind-->
							</div>
							<!--End Line 20, PART V Type Of Account-->
							<!--PART V  Line 21  Start of Identifying Designation Number-->
							<div style="width:70mm;float:left;clear:none;border-style:solid;border-color:black;
				  border-width: 0px 0px 0px 1px;height:6.5mm">
								<div class="styLNLeftNumBox" style="width:5mm;text-align:center;float:left;
					  padding-bottom:0mm;">21</div>
								<div class="styLNDesc" style="width:64mm;padding-left:2mm;
					  padding-bottom:0mm;">Account number or other designation</div>
								<div class="styLNDesc" style="width:64mm;padding-left:5.5mm;
					  padding-bottom:0mm;padding-top:1mm;" valign="bottom">
									<xsl:choose>
										<xsl:when test="$FormData/ForeignFinclAccountGrp/IdentifyingDesignationNum">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/IdentifyingDesignationNum"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/BankAccountNum"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</div>
							<!--PART V  Line 21  End of Identifying Designation Number-->
						</div>
						<!--PART V  Line 22  Start of Check all that apply-->
						<div class="styBB" style="width:187mm;font-size:8pt;padding-bottom:5.5mm;">
							<div style="width:187mm;">
								<div style="width:38mm;float:left;clear: none;">
									<div class="styLNLeftNumBox" style="padding-left:2mm;padding-top:2mm">22</div>
									<div class="styLNDesc" style="width:30mm;padding-left:2mm;float:left;padding-top:2mm">
							              Check all that apply
						          </div>
								</div>
								<div class="styLNDesc" style="width:149mm;">
									<!--PART V  Start of Account Opened During Tax Year Ind-->
									<div class="styLNDesc" style="width:61mm;">
										<b>a</b>
										<span style="width:.5mm;"/>
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/AccountOpenedDuringTaxYearInd"/>
											</xsl:call-template>
											<input type="Checkbox" alt="Account Opened During Tax Year Indicator" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/AccountOpenedDuringTaxYearInd"/>
													<xsl:with-param name="BackupName">IRS8938FFAAccountOpenedDuringTaxYearInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<span style="width:.5mm;"/>
										<span>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/AccountOpenedDuringTaxYearInd"/>
													<xsl:with-param name="BackupName">IRS8938FFAAccountOpenedDuringTaxYearIndLabel</xsl:with-param>
												</xsl:call-template>
												Account opened during tax year
										</label>
										</span>
									</div>
									<!--PART V  End of Account Opened During Tax Year Ind-->
									<!--PART V  Start of Account Closed During Tax Year Ind-->
									<div class="styLNDesc" style="width:87mm;">
										<b>b</b>
										<span style="width:.5mm;"/>
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/AccountClosedDuringTaxYearInd"/>
											</xsl:call-template>
											<input type="Checkbox" alt="Account Closed During Tax Year Ind" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/AccountClosedDuringTaxYearInd"/>
													<xsl:with-param name="BackupName">IRS8938FFAAccountClosedDuringTaxYearInd
										</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<span style="width:.5mm;"/>
										<span>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/AccountClosedDuringTaxYearInd"/>
													<xsl:with-param name="BackupName">IRS8938FFAAccountClosedDuringTaxYearIndLabel</xsl:with-param>
												</xsl:call-template>
													Account closed during tax year
										</label>
										</span>
									</div>
									<!--PART V  End of Account Closed During Tax Year Ind-->
									<!--PART V  Start of Jointly Owned With Spouse Ind-->
									<div class="styLNDesc" style="width:61mm;">
										<b>c</b>
										<span style="width:.5mm;"/>
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/JointlyOwnedWithSpouseInd"/>
											</xsl:call-template>
											<input type="Checkbox" alt="Jointly Owned With Spouse Ind" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/JointlyOwnedWithSpouseInd"/>
													<xsl:with-param name="BackupName">IRS8938FFAJointlyOwnedWithSpouseInd
											</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<span style="width:.5mm;"/>
										<span>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/JointlyOwnedWithSpouseInd"/>
													<xsl:with-param name="BackupName">IRS8938FFAJointlyOwnedWithSpouseIndLabel</xsl:with-param>
												</xsl:call-template>
													Account jointly owned with spouse
										</label>
										</span>
									</div>
									<!--PART V  End of Jointly Owned With Spouse Ind-->
									<!--PART V  Start of No Tax Item Reported Ind-->
									<div class="styLNDesc" style="width:86mm;">
										<b>d</b>
										<span style="width:.5mm;"/>
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/NoTaxItemReportedInd"/>
											</xsl:call-template>
											<input type="Checkbox" alt="No Tax Item Reported Ind" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/NoTaxItemReportedInd"/>
													<xsl:with-param name="BackupName">IRS8938FFANoTaxItemReportedInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<span style="width:.5mm;"/>
										<span>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/NoTaxItemReportedInd"/>
													<xsl:with-param name="BackupName">IRS8938FFANoTaxItemReportedIndLabel</xsl:with-param>
												</xsl:call-template>
												No tax item reported in Part III with respect to this asset
										</label>
										</span>
									</div>
									<!--PART V  End of No Tax Item Reported Ind-->
								</div>
							</div>
						</div>
						<!--PART V  Line 22  End of Check all that apply-->
						<!--PART V  Line 23  Start of Max. Account Value During TY Amount-->
						<div class="styBB" style="width:187mm;font-size:8pt;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;
				  padding-top:.7mm;padding-bottom:0mm;">23</div>
							<div class="styLNDesc" style="height:4mm;width:146mm;padding-left:2mm;
				  padding-top:.6mm;padding-bottom:0mm;">
				  Maximum value of account during tax year
					<!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;
					  padding-right:1mm;">......................</span>$</div>
							<div class="styLNAmountBoxNB" style="height:2mm;padding-top:.7mm;
				  padding-bottom:0mm;" valign="bottom">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/MaxAccountValueDurTYAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--PART V  Line 23  End of Max. Account Value During TY Amount-->
						<!--PART V  Line 24  Start of Exchange Rate Used Ind-->
						<div class="styBB" style="width:187mm;font-size:8pt;">
							<div class="styLNLeftNumBox" style="height:5mm;padding-left:2mm;padding-top:.7mm;
				  padding-bottom:0mm;">24</div>
							<div class="styLNDesc" style="height:5mm;width:178mm;padding-left:2mm;
				  padding-top:.0mm;padding-bottom:0mm;">
				  Did you use a foreign currency exchange rate to convert the value of the account into U.S.
				  dollars?
					<!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-right:10mm;">..</span>
								<!--PART V  Start of Exchange Rate Used Ind "Yes"-->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/ExchangeRateUsedInd"/>
									</xsl:call-template>
									<input type="Checkbox" alt="Exchange Rate Used Indicator Yes" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/ExchangeRateUsedInd"/>
											<xsl:with-param name="BackupName">IRS8938FFAExchangeRateUsedInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span>
									<span style="width:5px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/ExchangeRateUsedInd"/>
											<xsl:with-param name="BackupName">IRS8938FFAExchangeRateUsedInd</xsl:with-param>
										</xsl:call-template>
									Yes
									</label>
								</span>
								<!--PART V  End of Exchange Rate Used Ind "Yes"-->
								<span style="width:7px;"/>
								<!--PART V  Start of Exchange Rate Used Ind "No"-->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/ExchangeRateUsedInd"/>
									</xsl:call-template>
									<input type="Checkbox" alt="Exchange Rate Used Indicator No" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/ExchangeRateUsedInd"/>
											<xsl:with-param name="BackupName">IRS8938FFAExchangeRateUsedInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span>
									<span style="width:5px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/ExchangeRateUsedInd"/>
											<xsl:with-param name="BackupName">IRS8938FFAExchangeRateUsedIndl</xsl:with-param>
										</xsl:call-template>
									No
								</label>
								</span>
								<!--PART V  End of Exchange Rate Used Ind "No"-->
							</div>
						</div>
						<!--PART V  Line 24  End of Exchange Rate Used Ind-->
						<!--PART V  Line 25  Start of If you answered "yes" to line 5 complete all that apply-->
						<div class="styBB" style="width:187mm;font-size:8pt">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;padding-top:.7mm;
				  padding-bottom:0mm;">25</div>
							<div class="styLNDesc" style="height:4mm;width:178mm;padding-left:2mm;
				  padding-top:.7mm;padding-bottom:0mm;">
				  If you answered "Yes" to line 24, complete all that apply.</div>
						</div>
						<table class="styBB" id="IRS8938Table" summary="Foreign currency [header]" cellspacing="0" cellpadding="0" style="width:187mm;">
							<tr>
								<!--PART V  Line 25(1)  Start of Foreign Currency Description Text-->
								<th class="styLimitationHeading" style="width:52mm;padding-left:10mm;vertical-align:top;
					  border-right:solid black 1px;font-size:8pt;text-align:left" scope="col">
									<span style="font-weight:normal;">
										<b>(a)</b>
						  Foreign currency in which<br/>account is maintained
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/ForeignCurrencyDesc"/>
											<xsl:with-param name="BackupName">IRS8938FFAForeignCurrencyDescTxt</xsl:with-param>
										</xsl:call-template>
									</span>
								</th>
								<!--PART V  Line 25(1)  End of Foreign Currency Description Text-->
								<!--PART V  Line 25(2)  Start of Exchange Rate Used-->
								<th class="styLimitationHeading" style="width:67mm;font-size:8pt;
					  vertical-align:top;padding-left:2mm;text-align:left" scope="col">
									<span style="font-weight:normal;">
										<b>(b)</b>
						  Foreign currency exchange rate used<br/>to convert to U.S. dollars<br/>
										<span style="padding-left:.5mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/ExchangeRt"/>
												<xsl:with-param name="BackupName">IRS8938FFAExchangeRateUsed</xsl:with-param>
											</xsl:call-template>
										</span>
									</span>
								</th>
								<!--PART V  Line 25(2)  End of Exchange Rate Used-->
								<!--PART V  Line 25(3)  Start of Source  Of Exchange Rate Used Text-->
								<th class="styLimitationHeading" style="width:68mm;font-size:8pt;
					  border-left:solid black 1px;vertical-align:top;padding-left:2mm;text-align:left" scope="col">
									<span style="font-weight:normal">
										<span class="styBoldText">(c) </span>
						  Source of exchange rate used if not from<br/>
						  U.S. Treasury Department's Bureau of the Fiscal Service<br/>
										<span style="font-size:8pt">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/SourceOfExchangeRateUsedTxt"/>
												<xsl:with-param name="BackupName">IRS8938FFASourceOfExchangeRateUsedTxt
									</xsl:with-param>
											</xsl:call-template>
										</span>
									</span>
								</th>
								<!--PART V  Line 25(3)  End of Source Of Exchange Rate Used Text-->
							</tr>
						</table>
						<!--PART V  Line 25  End of If you answered "yes" to line 24 complete all that apply-->
						<!--PART V  Line 26a  Start of Foreign Deposit and Custodial Accounts Business Name-->
						<!--PART V  Line 26b  Start of Foreign Deposit and Custodial Accounts Business Name-->
						<div class="styBB" style="width:187mm;font-size:8pt;height:8mm;padding-left:1mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox">26a</div>
								<div class="styLNDesc" style="width:75mm;padding-left:1mm;">Name of financial institution in which account is maintained
									<br/>
									<span style="height:4mm;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/BusinessName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="$FormData/ForeignFinclAccountGrp/BusinessName/BusinessNameLine2Txt">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/BusinessName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div class="styLNRightNumBoxNBB" style="border-left-width:0px;width:12mm;padding-left:7mm;">b</div>
							<div class="styLNDesc" style="width:90mm;float:right;">Global Intermediary Identification Number (GIIN) (Optional) 

							</div>
							<div class="styFixedUnderline" style="width:53mm;text-align:right;background-color:back;border-bottom-width: 0px;"/>
						</div>
						<!--PART V  Line 26a  End of Foreign Deposit and Custodial Accounts Business Name-->
						<!--PART V  Line 26b  Start of Foreign Deposit and Custodial Accounts Business Name-->
						<!--PART V  Line 27  Start of Mailing Address-->
						<div class="styBB" style="width:187mm;font-size:8pt;height:7.5mm;">
							<div class="styLNLeftNumBox" style="padding-left:2mm;">27</div>
							<div class="styLNDesc" style="width:178mm;padding-left:2mm;">
								Mailing address of financial institution in which account is maintained. Number, street, and room or suite no.

								<br/>
								<span style="height:4mm;"/>
								<!--PART V  Start of Foreign Deposit and Custodial Accounts US Address-->
								<xsl:if test="$FormData/ForeignFinclAccountGrp/USAddress">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/USAddress/AddressLine1Txt"/>
										<xsl:with-param name="BackupName">IRS8938FFAUSAddressLine1</xsl:with-param>
									</xsl:call-template>
									<xsl:if test="$FormData/ForeignFinclAccountGrp/USAddress/AddressLine2Txt">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/USAddress/AddressLine2Txt"/>
											<xsl:with-param name="BackupName">IRS8938FFAUSAddressLine2</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</xsl:if>
								<!--PART V  End of Foreign Deposit and Custodial Accounts US Address-->
								<!--PART V  Start of Foreign Deposit and Custodial Accounts Foreign Address-->
								<xsl:if test="$FormData/ForeignFinclAccountGrp/ForeignAddress">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/ForeignAddress/AddressLine1Txt"/>
										<xsl:with-param name="BackupName">IRS8938FFAForeignAddressLine1</xsl:with-param>
									</xsl:call-template>
									<xsl:if test="$FormData/ForeignFinclAccountGrp/ForeignAddress/AddressLine2Txt">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/ForeignAddress/AddressLine2Txt"/>
											<xsl:with-param name="BackupName">IRS8938FFAForeignAddressLine2</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</xsl:if>
								<!--PART V  End of Foreign Deposit and Custodial Accounts Foreign Address-->
							</div>
						</div>
						<!--PART V  Line 27  End of Mailing Address-->
						<!--PART V  Line 28  Start of City, state and country-->
						<div class="styBB" style="width:187mm;font-size:8pt;height:6mm;">
							<div class="styLNLeftNumBox" style="padding-left:2mm;padding-top:0mm;
				  padding-bottom:0mm;">28</div>
							<div class="styLNDesc" style="width:178mm;padding-left:2mm;padding-top:0mm;
				  padding-bottom:0mm;">
					City or town, state or province, country and ZIP or foreign postal code
				</div>
							<div class="styLNDesc" style="width:186mm;padding-top:1mm;padding-left:10mm;">
								<!--PART V  Start of Foreign Deposit and Custodial Accounts US Address City, State,
                       and Zip Code-->
								<xsl:if test="$FormData/ForeignFinclAccountGrp/USAddress">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/USAddress/CityNm"/>
										<xsl:with-param name="BackupName">IRS8938FFAUSAddressCity</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/USAddress/StateAbbreviationCd"/>
										<xsl:with-param name="BackupName">IRS8938FFAUSAddressState</xsl:with-param>
									</xsl:call-template>,
								<span style="width:2px;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/USAddress/ZIPCd"/>
										<xsl:with-param name="BackupName">IRS8938FFAUSAddressZip</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<!--PART V  End of Foreign Deposit and Custodial Accounts US Address City, State, and 
							 Zip Code-->
								<xsl:if test="$FormData/ForeignFinclAccountGrp/ForeignAddress">
									<!--PART V  Start of Foreign Deposit and Custodial Accounts Foreign Address City,
                             ProvinceOrStateNm,ForeignPostalCd, and Country-->
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/ForeignAddress/CityNm"/>
										<xsl:with-param name="BackupName">IRS8938FFAForeignAddressCity</xsl:with-param>
									</xsl:call-template>
									<span style="width:2px;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/ForeignAddress/ProvinceOrStateNm"/>
										<xsl:with-param name="BackupName">IRS8938FFAForeignAddressProvinceOrStateNm
									</xsl:with-param>
									</xsl:call-template>,
								<span style="width:2px;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/ForeignAddress/CountryCd"/>
										<xsl:with-param name="BackupName">IRS8938FFAForeignAddressCountryCd
									</xsl:with-param>
									</xsl:call-template>,
								<span style="width:2px;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/ForeignAddress/ForeignPostalCd"/>
										<xsl:with-param name="BackupName">IRS8938FFAForeignAddressPostalCd
									</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<!--PART V  End of Foreign Deposit and Custodial Accounts Foreign Address City,
                             ProvinceOrStateNm,ForeignPostalCd, and Country-->
							</div>
						</div>
						<!--PART V  Line 28  End of City, state and country-->
					</xsl:if>
					<!--PART V REPEATING INFORMATION  Start of Foreign Deposit and Custodial Accounts-->
					<xsl:if test="(count($FormData/ForeignFinclAccountGrp) &gt;= 1) and ($Print != $Separated) or ((count($FormData/ForeignFinclAccountGrp) = 1) and ($Print = $Separated))">
						<xsl:for-each select="$FormData/ForeignFinclAccountGrp">
							<!-- PART V REPEATING INFORMATION  BEGIN TITLE -->
							<xsl:choose>
								<xsl:when test="position()=1">
									<div class="styBB" style="width:187mm;height:9mm;border-top-width: 0px;">
										<div class="styPartName" style="font-size:10pt;font-family:arial;padding-top:.5mm;height:5mm;
				  text-align:center;padding-bottom:.5mm;">Part V</div>
										<div class="styPartDesc" style="font-size:10pt;padding-left:3mm;float:left;
						  clear:none;">Detailed Information for Each Foreign Deposit and Custodial
						  Account Included in the Part I Summary
							<span style="font-weight:normal;">  (see instructions) </span>
										</div>
									</div>
									<!-- PART V REPEATING INFORMATION  END TITLE -->
									<div class="styBB" style="width:187mm;">
										<div class="styLNDesc" style="width:187mm;font-size:9pt">
				  If you have more than one account to report in Part V, attach a separate statement
				  for each additional account (see instructions).</div>
									</div>
								</xsl:when>
								<xsl:otherwise>
									<!--						</xsl:choose>-->
									<div class="styBB" style="width:187mm;height:8mm;border-top-width: 0px;">
										<div class="styPartName" style="font-size:10pt;padding-top:.5mm;height:5mm;
						  font-family:arial;text-align:center;padding-bottom:.5mm">Part V</div>
										<div class="styPartDesc" style="font-size:10pt;padding-left:3mm;float:left;
						  clear:none;">Detailed Information for Each Foreign Deposit and Custodial
						  Account Included in the Part I Summary
							<span style="font-weight:normal;">  (see instructions)</span>
										</div>
									</div>
									<!-- PART V REPEATING INFORMATION  END TITLE -->
									<!--							<div class="styBB" style="width:187mm;">
								<div class="styLNDesc" style="width:187mm;font-size:9pt">
				  If you have more than one account to report, attach a continuation statement for
				  each additional account (see instructions).</div>
							</div>-->
								</xsl:otherwise>
							</xsl:choose>
							<div class="styBB" style="width:187mm;font-size:8pt;">
								<!--PART V REPEATING INFORMATION  Start of Type Of Account-->
								<div style="width:38.0mm;float:left;clear:none;">
									<div class="styLNLeftNumBox" style="padding-left:2mm;">20</div>
									<div class="styLNDesc" style="width:25mm;padding-left:2mm;">
						Type of account
					</div>
								</div>
								<div style="width:65mm;float:left;clear:none;">
									<!--PART V REPEATING INFORMATION  Start of Deposit Account Type Ind-->
									<b>a</b>
									<input type="Checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="DepositAccountTypeInd"/>
											<xsl:with-param name="BackupName">IRS8938FFA-RDepositAccountTypeInd<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:5px;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="DepositAccountTypeInd"/>
											<xsl:with-param name="BackupName">IRS8938FFA-RDepositAccountTypeInd<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
							Deposit 
						</label>
									<!--PART V REPEATING INFORMATION  End of Deposit Account Type Ind-->
									<span style="width:8mm;"/>
									<!--PART V REPEATING INFORMATION  Start of Custodial Account Type Ind-->
									<b>b</b>
									<input type="Checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="CustodialAccountTypeInd"/>
											<xsl:with-param name="BackupName">IRS8938FFA-RCustodialAccountTypeInd<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:5px;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="CustodialAccountTypeInd"/>
											<xsl:with-param name="BackupName">IRS8938FFA-RCustodialAccountTypeInd<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
							Custodial
						</label>
									<!--PART V REPEATING INFORMATION  End of Custodial Account Type Ind-->
								</div>
								<!--PART V REPEATING INFORMATION  End of Type Of Account-->
								<!--PART V REPEATING INFORMATION  Start of Identifying Designation Number-->
								<div style="width:70mm;float:left;clear:none;border-style:solid;border-color:black;
				  border-width: 0px 0px 0px 1px;height:15mm;">
									<div class="styLNLeftNumBox" style="width:5mm;text-align:center;float:left;
					  padding-bottom:0mm;">21</div>
									<div class="styLNDesc" style="width:64mm;padding-left:2mm;
					  padding-bottom:0mm;">Account number or other designation</div>
									<div class="styLNDesc" style="width:64mm;padding-left:7.0mm;
					  padding-bottom:0mm;padding-top:1mm;" valign="bottom">
										<xsl:choose>
											<xsl:when test="IdentifyingDesignationNum">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="IdentifyingDesignationNum"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BankAccountNum"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</div>
								</div>
								<!--PART V REPEATING INFORMATION  End of Identifying Designation Number-->
							</div>
							<!--PART V REPEATING INFORMATION Start of Line 22-->
							<div class="styBB" style="width:187mm;font-size:8pt;padding-bottom:2mm;border-top:0px;height:12mm">
								<div style="width:187mm;">
									<div style="width:38mm;float:left;clear:none;padding-top:1mm;">
										<div class="styLNLeftNumBox" style="padding-left:2mm;font-weight:bold;">22</div>
										<div class="styLNDesc" style="width:30mm;padding-left:2mm;float:left;">
							Check all that apply
						</div>
									</div>
									<!--PART V REPEATING INFORMATION  Start of Line 22(a) 
                        Account Opened During Tax Year Ind-->
									<div class="styLNDesc" style="width:61mm;">
										<b>a</b>
										<!--		<span style="width:.5mm;"/>  -->
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="AccountOpenedDuringTaxYearInd"/>
												<xsl:with-param name="BackupName">IRS8938FFA-RAccountOpenedDuringTaxYearInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:.5mm;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="AccountOpenedDuringTaxYearInd"/>
												<xsl:with-param name="BackupName">IRS8938FFA-RAccountOpenedDuringTaxYearInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							Account opened during tax year
						</label>
									</div>
									<!--PART V REPEATING INFORMATION  End of Line 22(a)
                        Account Opened During Tax Year Ind-->
									<!--PART V REPEATING INFORMATION  Start of Line 22(b)
                        Account Closed During Tax Year Ind-->
									<div class="styLNDesc" style="width:87mm;">
										<b>b</b>
										<span style="width:.5mm;"/>
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="AccountClosedDuringTaxYearInd"/>
												<xsl:with-param name="BackupName">IRS8938FFA-RAccountClosedDuringTaxYearInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:1mm;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="AccountClosedDuringTaxYearInd"/>
												<xsl:with-param name="BackupName">IRS8938FFA-RAccountClosedDuringTaxYearInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							Account closed during tax year
						</label>
									</div>
									<!--PART V REPEATING INFORMATION  End of Line 22(b) 
                        Account Closed During Tax Year Ind-->
								</div>
								<div style="width:187mm;">
									<!--		<div style="width:100mm;float:left;clear:none;"/> -->
									<!--PART V REPEATING INFORMATION  Start of Line 22(c) 
                        Jointly Owned With Spouse Ind-->
									<div class="styLNDesc" style="width:95mm;">
										<span style="padding-right:38mm;"/>
										<b>c</b>
										<span style="width:0mm;"/>
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="JointlyOwnedWithSpouseInd"/>
												<xsl:with-param name="BackupName">IRS8938FFA-RJointlyOwnedWithSpouseInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:0mm;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="JointlyOwnedWithSpouseInd"/>
												<xsl:with-param name="BackupName">IRS8938FFA-RJointlyOwnedWithSpouseInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							Account jointly owned with spouse
						</label>
									</div>
									<!--PART V REPEATING INFORMATION  End of Line 22(c)
                         Jointly Owned With Spouse Ind-->
									<!--PART V REPEATING INFORMATION  Start of Line 22(d)
                         No Tax Item Reported Ind-->
									<div class="styLNDesc" style="width:90mm;">
										<span style="padding-right:4mm;"/>
										<b>d</b>
										<span style="width:.5mm;"/>
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="NoTaxItemReportedInd"/>
												<xsl:with-param name="BackupName">IRS8938FFA-RNoTaxItemReportedInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:.5mm;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="NoTaxItemReportedInd"/>
												<xsl:with-param name="BackupName">IRS8938FFA-RNoTaxItemReportedInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							No tax item reported in Part III with respect to this asset
						</label>
									</div>
									<!--PART V REPEATING INFORMATION  End of Line 22(d)
                        No Tax Item Reported Ind-->
								</div>
								<!--PART V REPEATING INFORMATION End of Line 22-->
							</div>
							<!--PART V REPEATING INFORMATION  Line 23  Start of Max. Account Value
                 During TY Amount-->
							<div class="styBB" style="width:187mm;font-size:8pt;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;
				  padding-top:.7mm;padding-bottom:0mm;">23</div>
								<div class="styLNDesc" style="height:4mm;width:146mm;padding-left:2mm;
				  padding-top:.7mm;padding-bottom:0mm;">
				  Maximum value of account during tax year
					<!--Dotted Line-->
									<span class="styDotLn" style="float:none;clear:none;
					  padding-right:1mm;">......................</span>$
				</div>
								<div class="styLNAmountBoxNB" style="height:2mm;padding-top:.7mm;
				  padding-bottom:0mm;" valign="bottom">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="MaxAccountValueDurTYAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--PART V REPEATING INFORMATION  End of Line 23 Max. Account Value During TY Amount-->
							<!--PART V REPEATING INFORMATION  Line 24  Start of Exchange Rate Used Ind-->
							<div class="styBB" style="width:187mm;font-size:8pt;height:6mm;">
								<div class="styLNLeftNumBox" style="height:5mm;padding-left:2mm;padding-top:1mm;
				  padding-bottom:0mm;">24</div>
								<div class="styLNDesc" style="height:5mm;width:178mm;padding-left:2mm;
				  padding-top:0mm;padding-bottom:0mm;">
				  Did you use a foreign currency exchange rate to convert the value of the account
				  into U.S. dollars?
					<!--Dotted Line-->
									<span class="styDotLn" style="float:none;clear:none;padding-right:10mm;">..</span>
									<!--PART V REPEATING INFORMATION  Start of Exchange Rate Used Ind "Yes"-->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
										</xsl:call-template>
										<input type="checkbox" alt="Exchange Rate Used Ind Yes" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
												<xsl:with-param name="BackupName">IRS8938FFA-RExchangeRateUsedInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
												<xsl:with-param name="BackupName">IRS8938FFA-RExchangeRateUsedInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							Yes
						</label>
									</span>
									<!--PART V REPEATING INFORMATION  End of Exchange Rate Used Ind "Yes"-->
									<span style="width:10px;"/>
									<!--PART V REPEATING INFORMATION  Start of Exchange Rate Used Ind "No"-->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
										</xsl:call-template>
										<input type="checkbox" alt="Exchange Rate Used Ind No" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
												<xsl:with-param name="BackupName">IRS8938FFA-RExchangeRateUsedInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
												<xsl:with-param name="BackupName">IRS8938FFA-RExchangeRateUsedInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							No
						</label>
									</span>
									<!--PART V REPEATING INFORMATION  End of Exchange Rate Used Ind "No"-->
								</div>
							</div>
							<!--PART V REPEATING INFORMATION  Line 24  End of Exchange Rate Used Ind-->
							<!--PART V REPEATING INFORMATION  Line 25  Start of If you answered yes to line 24,
                 complete all that apply-->
							<div class="styBB" style="width:187mm;font-size:8pt">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;padding-top:.7mm;
				  padding-bottom:0mm;">25</div>
								<div class="styLNDesc" style="height:4mm;width:178mm;padding-left:2mm;
				  padding-top:.7mm;padding-bottom:0mm;">
				  If you answered "Yes" to line 24, complete all that apply.
				</div>
							</div>
							<table class="styBB" id="IRS8938Table" summary="Foreign currency [header]" cellspacing="0" cellpadding="0" style="width:187mm;">
								<tr>
									<!--PART V REPEATING INFORMATION  Line 25(a)  Start of Foreign Currency
                         Description Text-->
									<th class="styLimitationHeading" style="width:52mm;padding-left:10mm;
					  border-right:solid black 1px;font-size:8pt;text-align:left;" scope="col">
										<span style="font-weight:normal;">
											<span class="styBoldText">(a)</span>
						  Foreign currency in which<br/>account is maintained<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignCurrencyDesc"/>
												<xsl:with-param name="BackupName">IRS8938FFA-RForeignCurrencyDescTxt</xsl:with-param>
											</xsl:call-template>
										</span>
									</th>
									<!--PART V REPEATING INFORMATION  Line 25(a)  End of Foreign Currency
                         Description Text-->
									<!--PART V REPEATING INFORMATION  Line 25(b)  Start of Exchange Rate Used-->
									<th class="styLimitationHeading" style="width:67mm;font-size:8pt;
					  vertical-align:top;padding-left:2mm;text-align:left" scope="col">
										<span style="font-weight:normal;">
											<b>(b)</b>
						  Foreign currency exchange rate used<br/>to convert to U.S. dollars<br/>
											<span style="padding-left:.5mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ExchangeRt"/>
													<xsl:with-param name="BackupName">IRS8938FFA-RExchangeRateUsed</xsl:with-param>
												</xsl:call-template>
											</span>
										</span>
									</th>
									<!--PART V REPEATING INFORMATION  Line 25(b)  End of Exchange Rate Used-->
									<!--PART V REPEATING INFORMATION  Line 25(c)  Start of Source  Of Exchange
                         Rate Used Text-->
									<th class="styLimitationHeading" style="width:68mm;font-size:8pt;
					  border-left:solid black 1px;vertical-align:top;padding-left:2mm;text-align:left" scope="col">
										<span style="font-weight:normal">
											<span class="styBoldText">(c) </span>
						  Source of exchange rate used if not from<br/>
						  U.S. Treasury Department's Bureau of the Fiscal Service<br/>
											<span style="font-size:8pt">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SourceOfExchangeRateUsedTxt"/>
													<xsl:with-param name="BackupName">IRS8938FFA-RSourceOfExchangeRateUsedTxt
									</xsl:with-param>
												</xsl:call-template>
											</span>
										</span>
									</th>
									<!--PART V REPEATING INFORMATION  Line 25(c)  End of Source Of Exchange
                         Rate Used Text-->
								</tr>
							</table>
							<!--PART V REPEATING INFORMATION  Line 26A  Start of Foreign Deposit and Custodial Accounts 
				 Business Name-->
							<div class="styBB" style="width:187mm;font-size:8pt;">
								<div class="styLNLeftNumBox" style="height:12mm;padding-left:2mm;padding-top:0mm;
				  padding-bottom:0mm;">26a</div>
								<div class="styLNDesc" style="width:90mm;height:18mm;padding-left:2mm;padding-top:0mm;
				  padding-bottom:0mm;">Name of financial institution in which account is maintained
							    <br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="BusinessName/BusinessNameLine2Txt">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
								</div>
								<div class="styLNRightNumBoxNBB" style="border-left-width:0px;width:12mm;padding-left:7mm;">b</div>
								<div class="styLNDesc" style="width:74mm;float:right;">Global Intermediary Identification Number (GIIN) (Optional) 
							<div class="styBB" style="width:187mm;font-size:8pt;border-top-width: 0px;         border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="GIIN"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styFixedUnderline" style="width:53mm;text-align:right;background-color:back;border-bottom-width: 0px;"/>
							</div>
							<!--PART V REPEATING INFORMATION  Line 26a  End of Foreign Deposit and Custodial Accounts 
				 Business Name-->
							<!--PART V REPEATING INFORMATION  Line 27  Mailing Address-->
							<div class="styBB" style="width:187mm;font-size:8pt;height:16mm;">
								<div class="styLNLeftNumBox" style="padding-left:2mm;padding-top:0mm;
				  padding-bottom:0mm;">27</div>
								<div class="styLNDesc" style="width:179mm;padding-left:2mm;padding-top:0mm;
				  padding-bottom:0mm;">
				Mailing address of financial institution in which account is maintained. Number, 
				street, and room or suite no.
				</div>
								<div class="styLNDesc" style="width:179mm;padding-top:1mm;padding-left:10mm;" valign="bottom">
									<!--PART V REPEATING INFORMATION  Start of Foreign Deposit and 
						 Custodial Accounts US Address-->
									<xsl:if test="USAddress">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="USAddress/AddressLine1Txt"/>
											<xsl:with-param name="BackupName">IRS8938FFA-RUSAddressLine1</xsl:with-param>
										</xsl:call-template>
										<xsl:if test="USAddress/AddressLine2Txt">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="USAddress/AddressLine2Txt"/>
												<xsl:with-param name="BackupName">IRS8938FFA-RUSAddressLine2</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</xsl:if>
									<!--PART V REPEATING INFORMATION  End of Foreign Deposit and Custodial
                         Accounts US Address-->
									<!--PART V REPEATING INFORMATION  Start of Foreign Deposit and Custodial 
                         Accounts Foreign Address-->
									<xsl:if test="ForeignAddress">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1Txt"/>
											<xsl:with-param name="BackupName">IRS8938FFA-RForeignAddressLine1</xsl:with-param>
										</xsl:call-template>
										<xsl:if test="ForeignAddress/AddressLine2Txt">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2Txt"/>
												<xsl:with-param name="BackupName">IRS8938FFA-RForeignAddressLine2
									</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</xsl:if>
									<!--PART V REPEATING INFORMATION  End of Foreign Deposit and Custodial
                         Accounts Foreign Address-->
								</div>
							</div>
							<!--PART V REPEATING INFORMATION  Line 27  End of Mailing Address-->
							<!--PART V REPEATING INFORMATION  Line 28  Start of City, State and Country-->
							<div class="styBB" style="width:187mm;font-size:8pt;height:16mm;">
								<div class="styLNLeftNumBox" style="padding-left:2mm;padding-top:0mm;
				  padding-bottom:0mm;">28</div>
								<div class="styLNDesc" style="width:178mm;padding-left:2mm;padding-top:0mm;
				  padding-bottom:0mm;">
				  City or town, state or province, country, and ZIP or foreign postal code
				</div>
								<div class="styLNDesc" style="width:186mm;padding-top:1mm;padding-left:10mm;">
									<!--PART V REPEATING INFORMATION  Start of Foreign Deposit and Custodial
                        Accounts US Address City, State, and Zip Code-->
									<xsl:if test="USAddress">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="USAddress/CityNm"/>
											<xsl:with-param name="BackupName">IRS8938FFA-RUSAddressCity</xsl:with-param>
										</xsl:call-template>,
										<span style="width:2px;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="USAddress/StateAbbreviationCd"/>
											<xsl:with-param name="BackupName">IRS8938FFA-RUSAddressState</xsl:with-param>
										</xsl:call-template>,
						<span style="width:2px;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="USAddress/ZIPCd"/>
											<xsl:with-param name="BackupName">IRS8938FFA-RUSAddressZip</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<!--PART V REPEATING INFORMATION  End of Foreign Deposit and Custodial
                         Accounts US Address City, State, and Zip Code-->
									<xsl:if test="ForeignAddress">
										<!--PART V REPEATING INFORMATION  Start of Foreign Deposit and Custodial
                         Accounts Foreign Address City, ProvinceOrStateNm, ForeignPostalCd, and Country-->
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ForeignAddress/CityNm"/>
											<xsl:with-param name="BackupName">IRS8938FFA-RForeignAddressCity</xsl:with-param>
										</xsl:call-template>,
										<span style="width:2px;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrStateNm"/>
											<xsl:with-param name="BackupName">IRS8938FFA-RForeignAddressProvinceOrStateNm
							</xsl:with-param>
										</xsl:call-template>,
						<span style="width:2px;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ForeignAddress/CountryCd"/>
											<xsl:with-param name="BackupName">IRS8938FFA-RForeignAddressCountryCd
							</xsl:with-param>
										</xsl:call-template>,
						<span style="width:2px;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ForeignAddress/ForeignPostalCd"/>
											<xsl:with-param name="BackupName">IRS8938FFA-RForeignAddressPostalCd
							</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<!--PART V REPEATING INFORMATION  End of  Foreign Deposit and Custodial Accounts
					    Foreign Address City, ProvinceOrStateNm, ForeignPostalCd, and Country-->
								</div>
							</div>
							<!--PART V REPEATING INFORMATION  Line 28  End of City, State and Country-->
						</xsl:for-each>
						<!--PART V REPEATING INFORMATION  FOOTER-->
						<div style="width:187mm;font-size:8pt;text-align:right;">
							<span style="width:20mm;"/>Form 
					<span class="styBoldText" style="font-size:8pt;">8938</span> (Rev. 11-2021)
					</div>
						<div class="pageEnd" style="width:187mm;border-top:0px solid black;"/>
					</xsl:if>
					<!--PART V REPEATING INFORMATION   End of Foreign Deposit and Custodial Accounts-->
					<!--SEE ADDITIONAL TABLE MESSAGE WHEN PART V REPEATING INFORMATION
        FOR FOREIGN DEPOSIT AND CUSTODIAL ACCOUNTS IS GREATER THAN 1 ITEM-->
					<xsl:if test="(count($FormData/ForeignFinclAccountGrp) &gt;= 2) and ($Print = $Separated)">
						<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
         Start of Foreign Deposit and Custodial Accounts-->
						<div style="font-size:8pt">
							<!-- PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                  BEGIN TITLE -->
							<div class="styBB" style="width:187mm;height:8mm;">
								<div class="styPartName" style="font-size:10pt;padding-bottom:.5mm;height:5mm;
				  font-family:arial;text-align:center;padding-top:.5mm">Part V</div>
								<div class="styPartDesc" style="font-size:10pt;padding-left:3mm;
				  float:left;clear:none;">
				  Detailed Information for Each Foreign Deposit and Custodial Account
				  Included in the Part I Summary
				  <span style="font-weight:normal;"> (see instructions)</span>
								</div>
							</div>
							<!-- PART V REPEATING ADDITIONAL TABLE MESSAGE  END TITLE -->
							<div class="styBB" style="width:187mm;font-size:8pt;height:4mm;">
								<div class="styLNDesc" style="width:187mm;">
				  If you have more than one account to report, attach a separate sheet
				  with the same information for each additional account (see instructions).</div>
							</div>
							<div class="styBB" style="width:187mm;font-size:8pt;height:10mm">
								<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                     Start of Type Of Account-->
								<div style="width:38mm;float:left;clear:none;">
									<div class="styLNLeftNumBox" style="padding-left:2mm;">20</div>
									<div class="styLNDesc" style="width:25mm;padding-left:2mm;">
						Type of account
						
									
					</div>
								</div>
								<div style="width:65mm;float:left;clear:none;">
									<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                     Start of  Deposit Account Type Ind-->
									<b>a</b>
									<span style="width:5px;"/>
									<input type="Checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="DepositAccountTypeInd"/>
											<xsl:with-param name="BackupName">IRS8938FFA-ATMDepositAccountTypeInd
								<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:5px;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="DepositAccountTypeInd"/>
											<xsl:with-param name="BackupName">IRS8938FFA-ATMDepositAccountTypeInd
							<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
						Deposit 
					</label>
									<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                         End of Deposit Account Type Ind-->
									<span style="width:8mm;"/>
									<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                         Start of Custodial Account Type Ind-->
									<b>b</b>
									<span style="width:5px;"/>
									<input type="Checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="CustodialAccountTypeInd"/>
											<xsl:with-param name="BackupName">IRS8938FFA-ATMCustodialAccountTypeInd
							<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:5px;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="CustodialAccountTypeInd"/>
											<xsl:with-param name="BackupName">IRS8938FFA-ATMCustodialAccountTypeInd
							<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
						Custodial
					</label>
									<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                         End of Custodial Account Type Ind-->
									<!--<br/>-->
									<div style="padding-top:2mm;">
										<xsl:call-template name="PopulateAdditionalDataTableMessage">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp"/>
										</xsl:call-template>
									</div>
								</div>
								<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                    End of Type Of Account-->
								<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                     Start of Identifying Designation Number-->
								<div style="width:70mm;float:left;clear:none;border-style:solid;border-color:black;
				  border-width: 0px 0px 0px 1px;height:10mm">
									<div class="styLNLeftNumBox" style="width:5mm;text-align:center;
					  float:left;padding-bottom:0mm;">21</div>
									<div class="styLNDesc" style="width:64mm;padding-left:2mm;
					  padding-bottom:0mm;">Account number or other designation</div>
									<div class="styLNDesc" style="width:64mm;padding-left:5.5mm;
					  padding-bottom:0mm;padding-top:1mm;" valign="bottom"/>
								</div>
								<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                     End of  Identifying Designation Number-->
							</div>
							<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                Start of Line 22 Check all that apply-->
							<div class="styBB" style="width:187mm;padding-bottom:2mm;font-size:8pt;height:10mm;">
								<div style="width:187mm;">
									<div style="width:38mm;float:left;clear: none;padding-top:1mm;">
										<div class="styLNLeftNumBox" style="padding-left:2mm;font-weight:bold;">22</div>
										<div class="styLNDesc" style="width:30mm;padding-left:2mm;float:left;">
							Check all that apply
						</div>
									</div>
									<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                         Start of Line 22(a) Account Opened During Tax Year Ind-->
									<div class="styLNDesc" style="width:60mm;">
										<b>a</b>
										<span style="width:5px;"/>
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="AccountOpenedDuringTaxYearInd"/>
												<xsl:with-param name="BackupName">IRS8938FFA-ATMAccountOpenedDuringTaxYearInd
								<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="AccountOpenedDuringTaxYearInd"/>
												<xsl:with-param name="BackupName">IRS8938FFA-ATMAccountOpenedDuringTaxYearInd
								<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							Account opened during tax year
						</label>
									</div>
									<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE 
                         End of Line 22(a) Account Opened During Tax Year Ind-->
									<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                         Start of Line 22(b) Account Closed During Tax Year Ind-->
									<div class="styLNDesc" style="width:87mm;">
										<b>b</b>
										<span style="width:.5mm;"/>
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="AccountClosedDuringTaxYearInd"/>
												<xsl:with-param name="BackupName">IRS8938FFA-ATMAccountClosedDuringTaxYearInd
								<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="AccountClosedDuringTaxYearInd"/>
												<xsl:with-param name="BackupName">IRS8938FFA-ATMAccountClosedDuringTaxYearInd
								<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							Account closed during tax year
						</label>
									</div>
									<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                         End of Line 22(b) Account Closed During Tax Year Ind-->
								</div>
								<div style="width:187mm;">
									<!--		<div style="width:41mm;float:left;clear: none;"/> -->
									<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                         Start of Line 22(c) Jointly Owned With Spouse Ind-->
									<div class="styLNDesc" style="width:95mm;">
										<span style="padding-right:38mm;"/>
										<b>c</b>
										<span style="width:1.25mm;"/>
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="JointlyOwnedWithSpouseInd"/>
												<xsl:with-param name="BackupName">IRS8938FFA-ATMJointlyOwnedWithSpouseInd
								<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:1.25mm;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="JointlyOwnedWithSpouseInd"/>
												<xsl:with-param name="BackupName">IRS8938FFA-ATMJointlyOwnedWithSpouseInd
								<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							Account jointly owned with spouse
						</label>
									</div>
									<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                         End of Line 22(c) Jointly Owned With Spouse Ind-->
									<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                         Start of Line 22(d) No Tax Item Reported Ind-->
									<div class="styLNDesc" style="width:87mm;">
										<span style="padding-right:3mm;"/>
										<b>d</b>
										<span style="width:.5mm;"/>
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="NoTaxItemReportedInd"/>
												<xsl:with-param name="BackupName">IRS8938FFA-ATMNoTaxItemReportedInd
								<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:1.25mm;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="NoTaxItemReportedInd"/>
												<xsl:with-param name="BackupName">IRS8938FFA-ATMNoTaxItemReportedInd
								<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							No tax item reported in Part III with respect to this asset
						</label>
									</div>
									<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                         End of Line 22(d) No Tax Item Reported Ind-->
								</div>
							</div>
							<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                End of  Line 22 Check all that apply-->
							<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                 Line 23  Start of Max.Account Value During TY Amount-->
							<div class="styBB" style="width:187mm;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;
				  padding-top:.7mm;padding-bottom:0mm;">23</div>
								<div class="styLNDesc" style="height:4mm;width:146mm;padding-left:2mm;
				  padding-top:.7mm;padding-bottom:0mm;">
				  Maximum value of account during tax year
					<!--Dotted Line-->
									<span class="styDotLn" style="float:none;clear:none;
					  padding-right:1mm;">......................</span>$</div>
								<div class="styLNAmountBoxNB" style="height:2mm;padding-top:.7mm;
				  padding-bottom:0mm;" valign="bottom"/>
							</div>
							<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                 End of Line 23 Max Account Value During TY Amount-->
							<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                 Line 24 Start of Exchange Rate Used Ind-->
							<div class="styBB" style="width:187mm;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;
				  padding-top:1.9mm;padding-bottom:0mm;">24</div>
								<div class="styLNDesc" style="height:5.5mm;width:178mm;padding-left:2mm;
				  padding-top:.7mm;padding-bottom:0mm;">
					Did you use a foreign currency exchange rate to convert the value of the
					account into U.S. dollars?
					<!--Dotted Line-->
									<span class="styDotLn" style="float:none;clear:none;
					  padding-right:1mm;">..</span>
									<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                             Start of Exchange Rate Used Ind "Yes"-->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
										</xsl:call-template>
										<input type="checkbox" alt="Exchange Rate Used Ind Yes" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
												<xsl:with-param name="BackupName">IRS8938FFA-ATMExchangeRateUsedInd
									<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
												<xsl:with-param name="BackupName">IRS8938FFA-ATMExchangeRateUsedInd
									<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							Yes
						</label>
									</span>
									<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                             End of Exchange Rate Used Ind "Yes"-->
									<span style="width:10px;"/>
									<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                             Start of Exchange Rate Used Ind "No"-->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
										</xsl:call-template>
										<input type="checkbox" alt="Exchange Rate Used Ind No" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
												<xsl:with-param name="BackupName">IRS8938FFA-ATMExchangeRateUsedInd
									<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
												<xsl:with-param name="BackupName">IRS8938FFA-ATMExchangeRateUsedInd
									<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							No
						</label>
									</span>
									<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                             End of Exchange Rate Used Ind "No"-->
								</div>
							</div>
							<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                 Line 24  End of Exchange Rate Used Ind-->
							<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                 Line 25  Start of If you answered yes to line 24, complete all that apply-->
							<div class="styBB" style="width:187mm;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;
				  padding-top:.7mm;padding-bottom:0mm;">25</div>
								<div class="styLNDesc" style="height:4mm;width:178mm;padding-left:2mm;
				  padding-top:.7mm;padding-bottom:0mm;">
					If you answered "Yes" to line 24, complete all that apply.
				</div>
							</div>
							<div class="styBB" style="width:187mm;padding-bottom:1mm;">
								<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  
                     Start of Foreign Currency Description Text-->
								<div style="width:60mm;float:left;clear:none;">
									<div class="styLNDesc" style="width:55mm;padding-left:10mm;">
										<b>(a) </b> Foreign currency in which<br/> account is maintained</div>
									<div class="styLNDesc" style="width:55mm;padding-top:1mm;
					  padding-left:9mm;padding-bottom:.5mm" valign="bottom"/>
								</div>
								<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                     End of Foreign Currency Description Text-->
								<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                     Start of Exchange Rate Used-->
								<div style="width:63mm;float:left;clear:none;border-style:solid;
				  border-color:black;border-width: 0px 1px 0px 1px;height:10mm;">
									<div class="styLNDesc" style="width:61mm;padding-left:2mm;
					  padding-bottom:.5mm;">
										<b>(b) </b> Foreign currency exchange rate used to convert to U.S. dollars
					</div>
									<div class="styLNDesc" style="width:61mm;padding-top:1mm;
					  text-align:right" valign="bottom"/>
								</div>
								<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                     End of Exchange Rate Used-->
								<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                     Start of Source Of Exchange Rate Used Text-->
								<div style="width:64mm;float:left;clear:none;border-style:solid;font-size:8pt;
				  border-color:black;border-width: 0px 0px 0px 0px;">
									<div class="styLNDesc" style="width:62mm;padding-left:2mm;
					  padding-bottom:1.5mm;">
										<b>(c) </b> Source of exchange rate used if not from <br/>
						U.S. Treasury Department's Bureau of the Fiscal Service
					</div>
									<div class="styLNDesc" style="width:62mm;padding-top:1mm;" valign="bottom"/>
								</div>
								<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                     End of Source Of Exchange Rate Used Text-->
							</div>
							<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE Line 25  End of If you answered yes to line 24, complete all that apply-->
						
							<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE blank line
                 Line 26a Start of Foreign Deposit and Custodial Accounts Business Name -->
							<div class="styBB" style="width:187mm;font-size:8pt;">
								<div class="styLNLeftNumBox" style="height:7mm;padding-top:0mm;
				  padding-bottom:0mm;">26a</div>
								<div class="styLNDesc" style="width:76mm;height:7mm;padding-left:2mm;padding-top:0mm;
				  padding-bottom:0mm;">Name of financial institution in which account is maintained</div>
								<div class="styLNRightNumBoxNBB" style="border-left-width:0px;width:12mm;padding-left:7mm;">b</div>
								<div class="styLNDesc" style="width:90mm;float:right;">Global Intermediary Identification Number (GIIN) (Optional) 

							</div>
							</div>
							<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                 Line 26a  End of Foreign Deposit and Custodial Accounts Business Name-->
							<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                 Line 27  Mailing Address-->
							<div class="styBB" style="width:187mm;height:8mm;">
								<div class="styLNLeftNumBox" style="padding-left:2mm;padding-top:0mm;
				  padding-bottom:0mm;">27</div>
								<div class="styLNDesc" style="width:178mm;padding-left:2mm;
				  padding-top:0mm;padding-bottom:0mm;">
				  Mailing address of financial institution in which account is maintained.
				  Number, street, and room or suite no.
							</div>
								<!--	<div class="styLNDesc" style="width:62mm;padding-top:1mm;
				  padding-left:10mm;" valign="bottom"/>-->
							</div>
							<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                 Line 27  End of Mailing Address-->
							<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                 Line 28  Start of City, State and Country-->
							<div class="styBB" style="width:187mm;height:8mm;">
								<div class="styLNLeftNumBox" style="padding-left:2mm;padding-top:0mm;
				  padding-bottom:0mm;">28</div>
								<div class="styLNDesc" style="width:178mm;padding-left:2mm;
				  padding-top:0mm;padding-bottom:0mm;">
				  City or town, state or province, country, and ZIP or foreign postal code
				</div>
								<!--<div class="styLNDesc" style="width:186mm;padding-top:1mm;
				  padding-left:10mm;">TEST</div>-->
							</div>
							<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
                 Line 28  End of City, State and Country-->
						</div>
					</xsl:if>
					<!--PART V REPEATING INFORMATION ADDITIONAL TABLE MESSAGE
         End of Foreign Deposit and Custodial Accounts-->
					<!--PART VI  Start of Other Foreign Assets Lines 29 thru 33-->
					<xsl:if test="(count($FormData/OtherForeignAssetGrp) &lt;1)">
						<!-- PART VI  BEGIN TITLE -->
						<div class="styBB" style="width:187mm;">
							<div class="styPartName" style="font-size:10pt;padding-bottom:5mm;
			  font-family:arial;text-align:center;height:4mm;padding-top:.5mm;">Part VI</div>
							<div class="styPartDesc" style="font-size:10pt;padding-left:3mm;
			  float:left;clear:none;padding-top:.5mm;padding-bottom:.5mm;width:173mm;">
			  Detailed Information for Each "Other Foreign Asset" Included in the
			  Part II Summary<span style="font-weight:normal;width:28mm;padding-left:1mm;"> (see instructions)</span>
							</div>
						</div>
						<!-- PART VI  END TITLE -->
						<div class="styBB" style="width:187mm;font-size:8pt;">
							<div class="styLNDesc" style="width:187mm;padding-left:2mm;padding-top:0mm;
			  padding-bottom:0mm;">If you have more than one asset to report in Part VI, attach a separate
				  statement for each additional asset (see instructions). 
				  
				  </div>
						</div>
						<table class="styBB" id="IRS8938Table2" summary="Asset [header]" cellspacing="0" cellpadding="0" style="width:187mm;">
							<tr>
								<!--PART VI  Line 29  Start of Asset Description-->
								<th class="styLimitationHeading" style="width:70mm;font-size:8pt;
					  border-right:solid black 1px;vertical-align:top;padding-left:2mm;text-align:left" scope="col">
									<div class="styLNLeftNumBox" style="width:6mm;padding-top:0mm;
						  padding-left:0mm;">29</div>
									<span style="font-weight:normal;text-align:left;width:60mm;padding-left:2mm;">
						  Description of asset<br/>
										<div style="padding-left:1mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/AssetDesc"/>
												<xsl:with-param name="BackupName">IRS8938OFAAssetDesc</xsl:with-param>
											</xsl:call-template>
										</div>
									</span>
								</th>
								<!--PART VI  Line 30  Start of Identifying Designation Number-->
								<th class="styLimitationHeading" style="width:70mm;font-size:8pt;
					  border-left:solid black 0px;vertical-align:top;padding-left:2mm;text-align:left" scope="col">
									<div class="styLNLeftNumBox" style="width:6mm;padding-top:0mm;
						  padding-left:0mm;">30</div>
									<span style="font-weight:normal;text-align:left;width:60mm;">
						  Identifying number or other designation<br/>
										<div style="padding-left:1mm;">
											<xsl:choose>
												<xsl:when test="$FormData/OtherForeignAssetGrp/IdentifyingDesignationNum">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/IdentifyingDesignationNum"/>
														<xsl:with-param name="BackupName">IRS8938OFAIdentifyingDesignationNum
											</xsl:with-param>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/BankAccountNum"/>
														<xsl:with-param name="BackupName">IRS8938OFABankAccountNum
											</xsl:with-param>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</div>
									</span>
								</th>
								<!--PART VI  Line 30  End of Identifying Designation Number-->
							</tr>
						</table>
						<!--PART VI  Line 30  End of Identifying Designation Number-->
						<!--PART VI  Line 31  Start of Complete all that apply-->
						<div class="styBB" style="width:187mm;font-size:8pt;">
							<div style="width:187mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="padding-left:2mm;">31</div>
								<div class="styLNDesc" style="width:146.5mm;padding-left:2mm;">
				      Complete all that apply. See instructions for reporting of multiple 
				      acquisition or disposition dates.</div>
							</div>
							<div style="width:187mm;">
								<!--PART VI  Line 31a  Start of Date Acquired-->
								<div class="styLNLeftLtrBox" style="padding-left:4mm;">a</div>
								<div class="styLNDesc" style="width:144mm;padding-left:2mm;">
						Date asset acquired during tax year, if applicable
					<span class="styDotLn" style="float:none;clear:none;
					  padding-left:2mm;">..................</span>
								</div>
								<div class="styFixedUnderline" style="height:4mm;padding-left:2mm;width:35mm">
									<xsl:if test="$FormData/OtherForeignAssetGrp/AcquiredDt">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/AcquiredDt"/>
											<xsl:with-param name="BackupName">IRS8938OFADateAcquiredMonth</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$FormData/OtherForeignAssetGrp/AcquiredDateVariousCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/AcquiredDateVariousCd"/>
											<xsl:with-param name="BackupName">IRS8938OFAAcquiredDateVariousCd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</div>
								<!--PART VI  Line 31a  End of Date Acquired-->
							</div>
							<div style="width:187mm;">
								<!--PART VI  Line 31b  Start of Disposed Of Date-->
								<div class="styLNLeftLtrBox" style="padding-left:4mm;">b</div>
								<div class="styLNDesc" style="width:144mm;padding-left:2mm;">
						Date asset disposed of during tax year, if applicable
					<span class="styDotLn" style="float:none;clear:none;
					  padding-left:2mm;">.................</span>
								</div>
								<div class="styFixedUnderline" style="height:4mm;padding-left:2mm;width:35mm">
									<xsl:if test="$FormData/OtherForeignAssetGrp/DisposedOfDt">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/DisposedOfDt"/>
											<xsl:with-param name="BackupName">IRS8938OFADisposedOfDtMonth</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$FormData/OtherForeignAssetGrp/DisposedOfDateVariousCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/DisposedOfDateVariousCd"/>
											<xsl:with-param name="BackupName">IRS8938OFADisposedOfDateVariousCd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</div>
								<!--PART VI  Line 31b  End of Disposed Of Date-->
							</div>
							<div style="width:187mm;">
								<div class="styLNLeftLtrBox" style="padding-left:4mm;">c</div>
								<div class="styLNDesc" style="width:76mm">
									<!--PART VI  Line 31c  Start of Jointly Owned With Spouse Ind-->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/JointlyOwnedWithSpouseInd"/>
										</xsl:call-template>
										<span style="width:1mm"/>
										<input type="Checkbox" alt="Jointly Owned With SpouseInd" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/JointlyOwnedWithSpouseInd"/>
												<xsl:with-param name="BackupName">IRS8938OFAJointlyOwnedWithSpouseInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/JointlyOwnedWithSpouseInd"/>
												<xsl:with-param name="BackupName">IRS8938OFAJointlyOwnedWithSpouseInd</xsl:with-param>
											</xsl:call-template>
							Check if asset jointly owned with spouse
						</label>
									</span>
								</div>
								<!--PART VI  Line 31c  End of Jointly Owned With Spouse Ind-->
								<!--PART VI  Line 31d  Start of No Tax Item Reported Ind-->
								<span style="height:5mm"/>
								<div class="styLNDesc" style="width:102mm;padding-left:2mm;">
									<b>d</b>
									<!--<span style="width:5px;"/>-->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/NoTaxItemReportedInd"/>
										</xsl:call-template>
										<input type="Checkbox" alt="No TaxItem Reported Ind" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/NoTaxItemReportedInd"/>
												<xsl:with-param name="BackupName">IRS8938OFANoTaxItemReportedInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:5px;"/>
									<span>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/NoTaxItemReportedInd"/>
												<xsl:with-param name="BackupName">IRS8938OFANoTaxItemReportedInd</xsl:with-param>
											</xsl:call-template>
							Check if no tax item reported in Part III with respect to this asset
						</label>
									</span>
								</div>
								<!--PART VI  Line 31d  End of No Tax Item Reported Ind-->
							</div>
						</div>
						<!--PART VI  Line 31  End of Complete all that apply-->
						<!--PART VI  Line 32  Start of Maximum value of asset during tax year-->
						<div class="styBB" style="width:187mm;font-size:8pt;">
							<div style="width:187mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="padding-left:2mm;">32</div>
								<div class="styLNDesc" style="width:146.5mm;padding-left:2mm;">
						Maximum value of asset during tax year (check box that applies)
					</div>
							</div>
							<div style="width:187mm;">
								<div class="styLNLeftLtrBox" style="padding-left:4mm;">a</div>
								<div class="styLNDesc" style="width:35mm;padding-left:1mm;">
									<!--PART VI  Line 32a  Start of Max. Value During TY 0 To 50000 Ind-->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/MaxValueDuringTY0To50000Ind"/>
										</xsl:call-template>
										<input type="Checkbox" alt="Max Value DuringTY 0 To 50000Ind" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/MaxValueDuringTY0To50000Ind"/>
												<xsl:with-param name="BackupName">IRS8938OFAMaxValueDuringTY0To50000Ind</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/MaxValueDuringTY0To50000Ind"/>
												<xsl:with-param name="BackupName">IRS8938OFAMaxValueDuringTY0To50000Ind</xsl:with-param>
											</xsl:call-template>
							$0 - $50,000
						</label>
									</span>
									<!--PART VI  Line 32a  End of Max. Value During TY 0 To 50000 Ind-->
								</div>
								<div class="styLNDesc" style="width:45mm;padding-left:2mm;">
									<b>b</b>
									<span style="width:5px;"/>
									<!--PART VI  Line 32b  Start of Max. Value During TY 50001 To 100000 Ind-->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/MaxValueDurTY50001To100000Ind"/>
										</xsl:call-template>
										<input type="Checkbox" alt="Max Value DurTY 50001 To 100000 Ind" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/MaxValueDurTY50001To100000Ind"/>
												<xsl:with-param name="BackupName">IRS8938OFAMaxValueDurTY50001To100000Ind</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/MaxValueDurTY50001To100000Ind"/>
												<xsl:with-param name="BackupName">IRS8938OFAMaxValueDurTY50001To100000Ind</xsl:with-param>
											</xsl:call-template>
							$50,001 - $100,000
						</label>
									</span>
									<!--PART VI  Line 32b  End of Max. Value During TY 50001 To 100000 Ind-->
								</div>
								<div class="styLNDesc" style="width:50mm;padding-left:2mm;">
									<b>c</b>
									<span style="width:5px;"/>
									<!--PART VI  Line 32c  Start of Max. Value During TY 100001 To 150000 Ind-->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/MaxValueDurTY100001To150000Ind"/>
										</xsl:call-template>
										<input type="Checkbox" alt="Max Value Dur TY 100001 To 150000 Ind" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/MaxValueDurTY100001To150000Ind"/>
												<xsl:with-param name="BackupName">IRS8938OFAMaxValueDurTY100001To150000Ind</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/MaxValueDurTY100001To150000Ind"/>
												<xsl:with-param name="BackupName">IRS8938OFAMaxValueDurTY100001To150000Ind</xsl:with-param>
											</xsl:call-template>
							$100,001 - $150,000
						</label>
									</span>
									<!--PART VI  Line 32c  End of Max. Value During TY 100001 To 150000 Ind-->
								</div>
								<div class="styLNDesc" style="width:45mm;padding-left:2mm;">
									<b>d</b>
									<span style="width:5px;"/>
									<!--PART VI  Line 32d  Start of Max. Value During TY 150001 To 200000 Ind-->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/MaxValueDurTY150001To200000Ind"/>
										</xsl:call-template>
										<input type="Checkbox" alt="Max Value DurTY 150001 To 200000 Ind" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/MaxValueDurTY150001To200000Ind"/>
												<xsl:with-param name="BackupName">IRS8938OFAMaxValueDurTY150001To200000Ind</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:5px;"/>
									<span>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/MaxValueDurTY150001To200000Ind"/>
												<xsl:with-param name="BackupName">IRS8938OFAMaxValueDurTY150001To200000Ind</xsl:with-param>
											</xsl:call-template>
							$150,001 - $200,000
						</label>
									</span>
									<!-- PART VI  Line 32d  End of Max. Value During TY 150001 To 200000 Ind-->
								</div>
							</div>
							<!--PART VI  Line 32e  Start of Max. Value During TY More Max. Amount-->
							<div style="width:187mm;font-size:8pt;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;
					 ">e</div>
								<div class="styLNDesc" style="width:146mm;padding-left:2mm;
					  ">
						If more than $200,000, list value
						<!--Dotted Line-->
									<span class="styDotLn" style="float:none;clear:none;
						  padding-right:1mm;">......................</span>$</div>
								<div class="styLNAmountBoxNB" style="height:2mm;padding-top:0mm;
					  padding-bottom:0mm;" valign="bottom">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/MaxValueDurTYMoreMaxAmt"/>
										<xsl:with-param name="BackupName">IRS8938OFAMaxValueDurTYMoreMaxAmt
							</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<span style="height:2mm"/>
							<!-- PART VI  Line 32e  End of Max. Value During TY More Max. Amount-->
						</div>
						<!--PART VI  Line 33  Start of Did you use a foreign currency exchange rate
                 to convert the value-->
						<div style="font-size:8pt;width:187mm;padding-bottom:1mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;
				  padding-top:1.2mm;padding-bottom:0mm;">33</div>
							<div class="styLNDesc" style="height:4mm;width:178mm;padding-left:2mm;
				  padding-top:0mm;padding-bottom:0mm;">Did you use a foreign currency
				  exchange rate to convert the value of the asset into U.S. dollars? 	

				  <!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;
					  padding-right:1mm;">...</span>
								<!--PART VI  Line 33  Start of Exchange Rate Used Ind "Yes"-->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/ExchangeRateUsedInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="Exchange Rate Used Ind Yes" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/ExchangeRateUsedInd"/>
											<xsl:with-param name="BackupName">IRS8938OFAExchangeRateUsedInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span>
									<span style="width:5px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/ExchangeRateUsedInd"/>
											<xsl:with-param name="BackupName">IRS8938OFAExchangeRateUsedInd</xsl:with-param>
										</xsl:call-template>
							Yes
						</label>
								</span>
								<!--PART VI  Line 33  End of Exchange Rate Used Ind "Yes"-->
								<span style="width:5px;"/>
								<!--PART VI  Line 33  Start of Exchange Rate Used Ind "No"-->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/ExchangeRateUsedInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="Exchange Rate Used Ind No" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/ExchangeRateUsedInd"/>
											<xsl:with-param name="BackupName">IRS8938OFAExchangeRateUsedInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span>
									<span style="width:1px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/ExchangeRateUsedInd"/>
											<xsl:with-param name="BackupName">IRS8938OFAExchangeRateUsedInd</xsl:with-param>
										</xsl:call-template>
							No
						</label>
								</span>
								<!--PART VI  Line 33  End of Exchange Rate Used Ind "No"-->
							</div>
						</div>
						<!--PART VI  Start of Other Foreign Assets (Continued)-->
						<xsl:if test="(count($FormData/OtherForeignAssetGrp) &lt;1)">
							<!--PART VI  Line 34  Start of If you answered "Yes" to line 33, complete all that apply-->
							<div style="width:187mm;float:left;clear:none;border-style:solid;border-color:black;
			  border-width: 1px 0px 1px 0px;font-size:8pt;">
								<div class="styLNLeftNumBox" style="padding-left:2mm;padding-top:.7mm;
				  height:5mm">34</div>
								<div class="styLNDesc" style="width:146.5mm;padding-left:2mm;
				  padding-top:.7mm;height:5mm">If you answered "Yes" to line 33, 
				  complete all that apply.</div>
							</div>
							<table class="styBB" id="IRS8938Table" summary="Foreign currency [header]" cellspacing="0" cellpadding="0" style="width:187mm;">
								<tr>
									<!--PART VI  Line 34(1)  Start of Foreign Currency Description Text-->
									<th class="styLimitationHeading" style="width:52mm;padding-left:10mm;vertical-align:top;
					  border-right:solid black 1px;font-size:8pt;text-align:left" scope="col">
										<span style="font-weight:normal;">
											<span class="styBoldText">(a)</span>
						  Foreign currency in which<br/>asset is denominated<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/ForeignCurrencyDesc"/>
												<xsl:with-param name="BackupName">IRS8938OFAForeignCurrencyDescTxt</xsl:with-param>
											</xsl:call-template>
										</span>
									</th>
									<!--PART VI  Line 34(1)  End of Foreign Currency Description Text-->
									<!--PART VI  Line 34(2)  Start of Exchange Rate Used-->
									<th class="styLimitationHeading" style="width:67mm;font-size:8pt;
					  vertical-align:top;padding-left:2mm;text-align:left" scope="col">
										<span style="font-weight:normal;">
											<b>(b)</b>
						  Foreign currency exchange rate used<br/>to convert to U.S. dollars<br/>
											<span style="padding-left:.5mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/ExchangeRt"/>
													<xsl:with-param name="BackupName">IRS8938OFAExchangeRateUsed</xsl:with-param>
												</xsl:call-template>
											</span>
										</span>
									</th>
									<!--PART VI  Line 34(2)  End of Exchange Rate Used-->
									<!--PART VI  Line 34(3)  Start of Source  Of Exchange Rate Used Text-->
									<th class="styLimitationHeading" style="width:68mm;font-size:8pt;
					  border-left:solid black 1px;vertical-align:top;padding-left:2mm;text-align:left" scope="col">
										<span style="font-weight:normal">
											<span class="styBoldText">(c) </span>
						  Source of exchange rate used if not from<br/>
						  U.S. Treasury Department's Bureau of the Fiscal Service<br/>
											<span style="font-size:8pt">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/SourceOfExchangeRateUsedTxt"/>
													<xsl:with-param name="BackupName">IRS8938OFASourceOfExchangeRateUsedTxt
									</xsl:with-param>
												</xsl:call-template>
											</span>
										</span>
									</th>
									<!--PART VI  Line 34(3)  End of Source Of Exchange Rate Used Text-->
								</tr>
							</table>
							<!--PART VI  Line 34(3)  End of Source Of Exchange Rate Used Text-->
							<!--PART VI  Line 35 Report information-->
							<div style="width:187mm;font-size:8pt;border-style:solid;border-color:black;border-width:0px 0px 0px 0px;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;
										  padding-top:0mm;padding-bottom:0mm;">35</div>
								<div class="styLNDesc" style="height:4mm;width:178mm;padding-left:2mm;
									  padding-top:0mm;padding-bottom:0mm;">If asset reported on line 29 is stock of a
									  foreign entity or an interest in a foreign entity, enter the following information for
									  the asset.
								</div>
							</div>
							<!--<span style="height:4mm;"/>-->
							<!--PART VI  Line 35a Start of Name of Foreign Entity-->
							<div style="height:10mm;width:187mm;font-size:8pt;">
								<div class="styLNLeftLtrBox" style="padding-left:4mm;">a</div>
								<div class="styLNDesc" style="width:178mm;height:20mm;">
									<div class="styLNDesc" style="width:30mm;padding-left:2mm;">
										Name of foreign entity</div>
									<!--<span style="height:4mm;"/>-->
									<div class="styFixedUnderline" style="width:80mm;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/EntityName/BusinessNameLine1Txt"/>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/EntityName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</div>
									<div class="styLNLeftNumBox" style="width:0mm;padding-right:4mm;">b</div>
									<div class="styLNDesc" style="width:20mm;">GIIN (Optional) </div>
									<div class="styFixedUnderline" style="width:42mm;text-align:center;padding-top:28px;"/>
								</div>
							</div>
							<span style="height:4mm;"/>
							<!--PART VI  Line 35c  Start of Type of Foreign Entity-->
							<div style="width:187mm;font-size:8pt;">
								<div class="styLNLeftLtrBox" style="padding-left:4mm;">c</div>
								<div class="styLNDesc" style="width:35mm;padding-left:2mm;">
				  Type of foreign entity</div>
								<!--PART VI  Line 35c (1)  Start of Partnership-->
								<div class="styLNDesc" style="width:35mm;">
									<b>(1)</b>
									<span style="width:5px;"/>
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/PartnershipInd"/>
										</xsl:call-template>
										<input type="Checkbox" alt="Partnership Ind" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/PartnershipInd"/>
												<xsl:with-param name="BackupName">IRS8938OFAPartnershipInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/PartnershipInd"/>
												<xsl:with-param name="BackupName">IRS8938OFAPartnershipInd</xsl:with-param>
											</xsl:call-template>
						Partnership
					</label>
									</span>
									<span style="width:5px;"/>
								</div>
								<!--PART VI  Line 35c (1)  End of Partnership-->
								<!--PART VI  Line 35c (2)  Start of Corporation-->
								<div class="styLNDesc" style="width:35mm;">
									<b>(2)</b>
									<span style="width:5px;"/>
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/CorporationInd"/>
										</xsl:call-template>
										<input type="Checkbox" alt="Corporation Ind" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/CorporationInd"/>
												<xsl:with-param name="BackupName">IRS8938OFACorporationInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/CorporationInd"/>
												<xsl:with-param name="BackupName">IRS8938OFACorporationInd</xsl:with-param>
											</xsl:call-template>
						Corporation 
					</label>
									</span>
									<span style="width:5px;"/>
								</div>
								<!--PART VI  Line 35c (2)  End of Corporation-->
								<!--PART VI  Line 35c (3)  Start of Trust-->
								<div class="styLNDesc" style="width:35mm;">
									<b>(3)</b>
									<span style="width:5px;"/>
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/TrustInd"/>
										</xsl:call-template>
										<input type="Checkbox" alt="Trust Ind" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/TrustInd"/>
												<xsl:with-param name="BackupName">IRS8938OFATrustInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/TrustInd"/>
												<xsl:with-param name="BackupName">IRS8938OFATrustInd</xsl:with-param>
											</xsl:call-template>
						Trust 
					</label>
									</span>
									<span style="width:5px;"/>
								</div>
								<!--PART VI  Line 35c (3)  End of Trust-->
								<!--PART VI  Line 35c (4)  Start of Estate-->
								<div class="styLNDesc" style="width:35mm;">
									<b>(4)</b>
									<span style="width:5px;"/>
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/EstateInd"/>
										</xsl:call-template>
										<input type="Checkbox" alt="Estate Ind" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/EstateInd"/>
												<xsl:with-param name="BackupName">IRS8938OFAEstateInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/EstateInd"/>
												<xsl:with-param name="BackupName">IRS8938OFAEstateInd</xsl:with-param>
											</xsl:call-template>
						Estate 
					</label>
									</span>
								</div>
							</div>
							<!--<span style="height:4mm;"/>-->
							<!--PART VI  Line 35c (4)  End of Estate-->
							<!--PART VI  Line 35d  Start of Mailing Address-->
							<div style="width:187mm;font-size:8pt">
								<div class="styLNLeftLtrBox" style="padding-left:4mm;padding-top:2mm;">d</div>
								<span style="height:2mm;"/>
								<div class="styLNDesc" style="width:178mm;padding-left:2mm;
				  padding-top:0mm;padding-bottom:0mm;height:1.5mm;padding-top:2mm;">
					Mailing address of foreign entity. Number, street, and room or suite no.
				</div>
								<div style="padding-left:8mm;">
									<div class="styFixedUnderline" style="height:5mm;width:178mm;padding-left:2mm;
					  padding-top:0mm;padding-bottom:0mm;">
										<xsl:if test="$FormData/OtherForeignAssetGrp/USAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/USAddress/AddressLine1Txt"/>
												<xsl:with-param name="BackupName">IRS8938OFAUSAddressLine1</xsl:with-param>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/USAddress/AddressLine2Txt"/>
												<xsl:with-param name="BackupName">IRS8938OFAUSAddressLine2</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$FormData/OtherForeignAssetGrp/ForeignAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/ForeignAddress/AddressLine1Txt"/>
												<xsl:with-param name="BackupName">IRS8938OFAForeignAddressLine1</xsl:with-param>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/ForeignAddress/AddressLine2Txt"/>
												<xsl:with-param name="BackupName">IRS8938OFAForeignAddressLine2</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
							</div>
							<!--PART VI  Line 35d  End of Mailing Address-->
							<!--PART VI  Line 35e  Start of City, State and country-->
							<div style="width:187mm;border-style:solid;border-color:black;font-size:8pt;
				  border-width: 0px 0px 1px 0px;height:8mm;">
								<div class="styLNLeftLtrBox" style="padding-left:4mm;padding-top:1mm">e</div>
								<div class="styLNDesc" style="width:179mm;padding-left:2mm;
				  padding-bottom:0mm;padding-top:1mm;">
				  City or town, state or province, country, and ZIP or foreign postal code</div>
								<div class="styLNDesc" style="width:186mm;padding-left:10mm;">
									<xsl:if test="$FormData/OtherForeignAssetGrp/USAddress">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/USAddress/CityNm"/>
											<xsl:with-param name="BackupName">IRS8938OFAUSAddressCity</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/USAddress/StateAbbreviationCd"/>
											<xsl:with-param name="BackupName">IRS8938OFAUSAddressState</xsl:with-param>
										</xsl:call-template>,
						<span style="width:2px;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/USAddress/ZIPCd"/>
											<xsl:with-param name="BackupName">IRS8938OFAUSAddressZIP</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$FormData/OtherForeignAssetGrp/ForeignAddress">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/ForeignAddress/CityNm"/>
											<xsl:with-param name="BackupName">IRS8938OFAForeignAddressCity
							</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/ForeignAddress/ProvinceOrStateNm"/>
											<xsl:with-param name="BackupName">IRS8938OFAForeignAddressProvinceOrStateNm
							</xsl:with-param>
										</xsl:call-template>,
						<span style="width:2px;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/ForeignAddress/CountryCd"/>
											<xsl:with-param name="BackupName">IRS8938OFAForeignAddressCountryCd
							</xsl:with-param>
										</xsl:call-template>,
						<span style="width:2px;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/ForeignAddress/ForeignPostalCd"/>
											<xsl:with-param name="BackupName">IRS8938OFAForeignAddressZip
							</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<!--PART VI  Line 35d  Start of City, State and country-->
							<!--PART VI  Line 36a - 36e  START of Report information of Asset Not Stock of Foreign 
                Ent Grp = 0-->
							<xsl:if test="(count($FormData/OtherForeignAssetGrp/AssetNotStockOfForeignEntGrp) &lt;1)">
								<!--<xsl:for-each select="$FormData/OtherForeignAssetGrp/AssetNotStockOfForeignEntGrp">-->
								<div style="width:187mm;font-size:8pt;">
									<div class="styLNLeftNumBox" style="height:2mm;padding-left:2mm;
					  padding-top:0mm;padding-bottom:0mm;">36</div>
									<div class="styLNDesc" style="width:178mm;padding-left:2mm;
					  padding-top:0mm;padding-bottom:1mm;height:4mm;">
					  If asset reported on line 29 is not stock of a foreign entity or
					  an interest in a foreign entity, enter the following information for the asset.
					</div>
									<div class="styLNDesc" style="width:179mm;padding-left:10mm;padding-top:0mm;
					  padding-bottom:0mm;height:9mm;font-style:italic;">
										<b>Note.</b> If this asset has more than one issuer or counterparty, attach a
						 separate statement with the same information for each additional issuer or
						 counterparty (see instructions).
					</div>
								</div>
								<br/>
								<!--PART VI  Line 36a  Start of Name of Issuer-->
								<div style="width:187mm;font-size:8pt">
									<div class="styLNLeftLtrBox" style="padding-left:4mm;">a</div>
									<div class="styLNDesc" style="width:50mm;padding-left:2mm;">
					  Name of issuer or counterparty
					</div>
									<div class="styFixedUnderline" style="width:127mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
										</xsl:call-template>
										<xsl:if test="BusinessName/BusinessNameLine2Txt">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
								<!--PART VI  Line 36a  End of Name of Issuer-->
								<!--PART VI  Line 36a  Start of Check if information is for Issuer or Counterparty-->
								<div style="width:187mm;padding-left:10mm;font-size:8pt;height:8mm;">
									<div class="styLNDesc" style="width:50.5mm;">Check if information is for</div>
									<div class="styLNDesc" style="width:35mm;">
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="IssuerInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-ANSIssuerInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="IssuerInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-ANSIssuerInd</xsl:with-param>
											</xsl:call-template>
							Issuer
						</label>
									</div>
									<div class="styLNDesc" style="width:35.5mm;">
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="CounterpartyInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-ANSCounterpartyInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="CounterpartyInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-ANSCounterpartyInd</xsl:with-param>
											</xsl:call-template>
							Counterparty
						</label>
									</div>
								</div>
								<br/>
								<!--PART VI  Line 36b  Start of Type of Issuer or counterparty-->
								<div style="width:187mm;font-size:8pt;">
									<div class="styLNLeftLtrBox" style="padding-left:4mm;">b</div>
									<div class="styLNDesc" style="width:170mm;padding-left:2mm;">Type of issuer or counterparty</div>
								</div>
								<!--PART VI  Line 36b (1)  Start of Individual-->
								<div class="styLNDesc" style="width:187mm;padding-left:10mm;font-size:8pt;height:10mm;">
									<div class="styLNDesc" style="width:35mm;">
										<b>(1)</b>
										<span style="width:5px;"/>
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="IndividualInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-ANSIndividualInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="IndividualInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-ANSIndividualInd</xsl:with-param>
											</xsl:call-template>
							Individual
						</label>
									</div>
									<!--PART VI  Line 36b (1)  End of Individual-->
									<!--PART VI  Line 36b (2)  Start of Partnership-->
									<div class="styLNDesc" style="width:31.5mm;">
										<b>(2)</b>
										<span style="width:5px;"/>
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="PartnershipInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-ANSPartnershipInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="PartnershipInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-ANSPartnershipInd</xsl:with-param>
											</xsl:call-template>
							Partnership
						</label>
									</div>
									<!--PART VI  Line 36b (2)  End of Partnership-->
									<!--PART VI  Line 36b (3)  Start of Corporation-->
									<div class="styLNDesc" style="width:35mm;">
										<b>(3)</b>
										<span style="width:5px;"/>
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="CorporationInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-ANSCorporationInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="CorporationInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-ANSCorporationInd</xsl:with-param>
											</xsl:call-template>
							Corporation 
						</label>
									</div>
									<!--PART VI  Line 36b (3)  End of Corporation-->
									<!--PART VI  Line 36b (4)  Start of Trust-->
									<div class="styLNDesc" style="width:25mm;">
										<b>(4)</b>
										<span style="width:5px;"/>
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="TrustInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-ANSTrustInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="TrustInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-ANSTrustInd</xsl:with-param>
											</xsl:call-template>
							Trust 
						</label>
									</div>
									<!--PART VI  Line 36b (5)  Start of Estate-->
									<div class="styLNDesc" style="width:25mm;">
										<b>(5)</b>
										<span style="width:4px;"/>
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="EstateInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-ANSEstateInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:4px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="EstateInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-ANSEstateInd</xsl:with-param>
											</xsl:call-template>
							Estate 
						</label>
									</div>
								</div>
								<br/>
								<br/>
								<!--PART VI  Line 36b (5)  End of Estate-->
								<!--PART VI  Line 36c  Start of Check if Issuer or Counterparty is US or Foreign-->
								<div style="width:187mm;font-size:8pt;height:10mm;">
									<div class="styLNLeftLtrBox" style="padding-left:4mm;">c</div>
									<div class="styLNDesc" style="width:55mm;padding-left:2mm;">Check if issuer or counterparty is a
					</div>
									<div class="styLNDesc" style="width:30.5mm;">
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="USPersonInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-ANSUSPersonInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="USPersonInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-ANSUSPersonInd</xsl:with-param>
											</xsl:call-template>
							U.S. person
						</label>
									</div>
									<div class="styLNDesc" style="width:40mm;padding-left:2mm;">
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="ForeignPersonInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-ANSForeignPersonInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="ForeignPersonInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-ANSForeignPersonInd</xsl:with-param>
											</xsl:call-template>
							Foreign person
						</label>
									</div>
								</div>
								<br/>
								<!--PART VI  Line 36c  End of Check if Issuer or Counterparty is US or Foreign-->
								<!--PART VI  Line 36d  Start of Mailing Address-->
								<div style="width:187mm;font-size:8pt;">
									<div class="styLNLeftLtrBox" style="padding-left:4mm;">d</div>
									<span style="height:4mm;"/>
									<div class="styLNDesc" style="height:1.5mm;width:178mm;padding-left:2mm;
					  padding-top:0mm;padding-bottom:0mm;">
					  Mailing address of issuer or counterparty. Number, street, and room or suite no.
					</div>
									<div class="styFixedUnderline" style="height:6mm;width:178mm;padding-left:2mm;
					  padding-top:1mm;padding-bottom:0mm;">
										<xsl:if test="USAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="USAddress/AddressLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="USAddress/AddressLine2Txt">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="USAddress/AddressLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:if>
										<xsl:if test="ForeignAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="ForeignAddress/AddressLine2Txt">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:if>
									</div>
								</div>
								<!--PART VI  Line 36d  End of Mailing Address-->
								<!--PART VI  Line 36e  Start of City, State or Country-->
								<div style="width:187mm;border-style:solid;border-color:black;font-size:8pt;
				  border-width: 0px 0px 1px 0px;height:8mm;">
									<div class="styLNLeftLtrBox" style="padding-left:4mm;">e</div>
									<div class="styLNDesc" style="width:178mm;padding-left:2mm;padding-bottom:0mm;">
					  City or town, state or province, country, and ZIP or foreign postal code
					</div>
									<div class="styLNDesc" style="width:186mm;padding-left:10mm;">
										<xsl:if test="USAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="USAddress/CityNm"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="USAddress/StateAbbreviationCd"/>
											</xsl:call-template>,
							<span style="width:2px;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="USAddress/ZIPCd"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="ForeignAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignAddress/CityNm"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrStateNm"/>
											</xsl:call-template>,
							<span style="width:2px;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignAddress/CountryCd"/>
											</xsl:call-template>,
							<span style="width:2px;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignAddress/ForeignPostalCd"/>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
								<!--PART VI  Line 36e  End of City, State or Country-->
								<!--</xsl:for-each>-->
							</xsl:if>
							<!--PART VI  Line 36a - 36e  END of Report information of Asset Not Stock 
                 of Foreign Ent Grp = 0-->
							<!--PART VI  START of Report Information of Asset Not Stock 
                 of Foreign Ent Grp >=1 (Lines 36a - 36e)-->
							<xsl:if test="(count($FormData/OtherForeignAssetGrp/AssetNotStockOfForeignEntGrp) &gt;=1)">
								<xsl:for-each select="$FormData/OtherForeignAssetGrp/AssetNotStockOfForeignEntGrp">
									<div style="width:187mm;font-size:8pt;height:auto;">
										<div class="styLNLeftNumBox" style="height:2mm;padding-left:2mm;padding-top:0mm;
						  padding-bottom:0mm;">36</div>
										<div class="styLNDesc" style="width:178mm;padding-left:2mm;padding-top:0mm;
						  padding-bottom:1mm;">If asset reported on line 29 is not stock of a foreign entity
						  or an interest in a foreign entity, enter the following information for the asset.
						</div>
										<xsl:choose>
											<xsl:when test="position()=1">
												<div class="styLNDesc" style="height:auto;width:179mm;padding-left:10mm;padding-top:0mm;padding-bottom:0mm;font-style:italic;">
													<b>Note.</b>If this asset has more than one issuer or counterparty, attach a
														 separate statement with the same information for each additional issuer or
														 counterparty (see instructions).
												</div>
											</xsl:when>
										</xsl:choose>
									</div>
									<!--PART VI  Line 36a  Start of Name of Issuer-->
									<div style="width:187mm;font-size:8pt">
										<div class="styLNLeftLtrBox" style="padding-left:4mm;">a</div>
										<div class="styLNDesc" style="width:50mm;padding-left:2mm;">
						  Name of issuer or counterparty
						</div>
										<div class="styFixedUnderline" style="width:127mm;">
											<xsl:choose>
												<xsl:when test="PersonNm">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PersonNm"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="BusinessName/BusinessNameLine2Txt">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:otherwise>
											</xsl:choose>
										</div>
									</div>
									<!--PART VI  Line 36a  End of Name of Issuer-->
									<!--PART VI  Line 36a  Start of Check if information is for Issuer or Counterparty-->
									<div style="width:187mm;padding-left:10mm;font-size:8pt;height:8mm">
										<div class="styLNDesc" style="width:50.5mm;">Check if information is for</div>
										<div class="styLNDesc" style="width:35mm;">
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="IssuerInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-ANSIssuerInd</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:5px;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="IssuerInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-ANSIssuerInd</xsl:with-param>
												</xsl:call-template>
								Issuer
							</label>
										</div>
										<div class="styLNDesc" style="width:35.5mm;">
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="CounterpartyInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-ANSCounterpartyInd</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:5px;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="CounterpartyInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-ANSCounterpartyInd</xsl:with-param>
												</xsl:call-template>
								Counterparty
							</label>
										</div>
									</div>
									<!--PART VI  Line 36b  Start of Type of Issuer or counterparty-->
									<div style="width:187mm;font-size:8pt;">
										<div class="styLNLeftLtrBox" style="padding-left:4mm;">b</div>
										<div class="styLNDesc" style="width:178mm;padding-left:2mm;">Type of issuer or counterparty</div>
									</div>
									<!--PART VI  Line 36b (1)  Start of Individual-->
									<div class="styLNDesc" style="width:187mm;padding-left:10mm;font-size:8pt;height:6mm;">
										<div class="styLNDesc" style="width:35mm;">
											<b>(1)</b>
											<span style="width:5px;"/>
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="IndividualInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-ANSIndividualInd</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:5px;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="IndividualInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-ANSIndividualInd</xsl:with-param>
												</xsl:call-template>
								Individual
							</label>
										</div>
										<!--PART VI  Line 36b (1)  End of Individual-->
										<!--PART VI  Line 36b (2)  Start of Partnership-->
										<div class="styLNDesc" style="width:30mm;">
											<b>(2)</b>
											<span style="width:5px;"/>
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="PartnershipInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-ANSPartnershipInd</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:5px;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="PartnershipInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-ANSPartnershipInd</xsl:with-param>
												</xsl:call-template>
								Partnership
							</label>
										</div>
										<!--PART VI  Line 36b (2)  End of Partnership-->
										<!--PART VI  Line 36b (3)  Start of Corporation-->
										<div class="styLNDesc" style="width:35mm;">
											<b>(3)</b>
											<span style="width:5px;"/>
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="CorporationInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-ANSCorporationInd</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:5px;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="CorporationInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-ANSCorporationInd</xsl:with-param>
												</xsl:call-template>
								Corporation 
							</label>
										</div>
										<!--PART VI  Line 36b (3)  End of Corporation-->
										<!--PART VI  Line 36b (4)  Start of Trust-->
										<div class="styLNDesc" style="width:25mm;">
											<b>(4)</b>
											<span style="width:5px;"/>
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="TrustInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-ANSTrustInd</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:5px;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="TrustInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-ANSTrustInd</xsl:with-param>
												</xsl:call-template>
								Trust 
							</label>
										</div>
										<!--PART VI  Line 36b (5)  Start of Estate-->
										<div class="styLNDesc" style="width:25mm;">
											<b>(5)</b>
											<span style="width:4px;"/>
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="EstateInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-ANSEstateInd</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:4px;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="EstateInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-ANSEstateInd</xsl:with-param>
												</xsl:call-template>
												
								Estate 
														</label>
										</div>
									</div>
									<!--PART VI  Line 36b (5)  End of Estate-->
									<!--PART VI  Line 36c  Start of Check if Issuer or Counterparty is US or Foreign-->
									<div style="width:187mm;font-size:8pt;height:10mm">
										<div class="styLNLeftLtrBox" style="padding-left:4mm;">c</div>
										<div class="styLNDesc" style="width:55mm;padding-left:2mm;">Check if issuer or counterparty is a
						</div>
										<div class="styLNDesc" style="width:30.5mm;">
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="USPersonInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-ANSUSPersonInd</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:5px;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="USPersonInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-ANSUSPersonInd</xsl:with-param>
												</xsl:call-template>
								U.S. person
							</label>
										</div>
										<div class="styLNDesc" style="width:40mm;padding-left:2mm;">
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="ForeignPersonInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-ANSForeignPersonInd</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:5px;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="ForeignPersonInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-ANSForeignPersonInd</xsl:with-param>
												</xsl:call-template>
								Foreign person
							</label>
										</div>
									</div>
									<!--PART VI  Line 36c  End of Check if Issuer or Counterparty is US or Foreign-->
									<!--PART VI  Line 36d  Start of Mailing Address-->
									<div style="width:187mm;font-size:8pt;">
										<div class="styLNLeftLtrBox" style="padding-left:4mm;">d</div>
										<!--<span style="height:4mm;"/>-->
										<div class="styLNDesc" style="height:4mm;width:178mm;padding-left:2mm;
						  padding-top:0mm;padding-bottom:0mm;">
						  Mailing address of issuer or counterparty. Number, street, and room or suite no.
						</div>
										<div class="styFixedUnderline" style="height:5mm;width:178mm;
						  padding-left:10mm;padding-top:1mm;padding-bottom:0mm;">
											<xsl:if test="USAddress">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="USAddress/AddressLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="USAddress/AddressLine2Txt">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/AddressLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:if>
											<xsl:if test="ForeignAddress">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="ForeignAddress/AddressLine2Txt">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:if>
										</div>
									</div>
									<!--PART VI  Line 36d  End of Mailing Address-->
									<!--PART VI  Line 36e  Start of City, State or Country-->
									<div style="width:187mm;border-style:solid;border-color:black;font-size:8pt;
					  border-width: 0px 0px 1px 0px;height:8mm;">
										<div class="styLNLeftLtrBox" style="padding-left:4mm;">e</div>
										<div class="styLNDesc" style="width:178mm;padding-left:2mm;padding-bottom:0mm;">
						  City or town, state or province, country, and ZIP or foreign postal code
						</div>
										<div class="styLNDesc" style="width:186mm;padding-left:10mm;">
											<xsl:if test="USAddress">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="USAddress/CityNm"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="USAddress/StateAbbreviationCd"/>
												</xsl:call-template>,
								<span style="width:2px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="USAddress/ZIPCd"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="ForeignAddress">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignAddress/CityNm"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrStateNm"/>
												</xsl:call-template>,
								<span style="width:2px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignAddress/CountryCd"/>
												</xsl:call-template>,
								<span style="width:2px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignAddress/ForeignPostalCd"/>
												</xsl:call-template>
											</xsl:if>
										</div>
									</div>
									<!--PART VI  Line 36e  End of City, State or Country-->
								</xsl:for-each>
							</xsl:if>
							<!--PART VI  Line 36a - 36e  END of Report information of Asset Not Stock
                 of Foreign Ent Grp >= 1-->
							<!--</xsl:for-each>-->
						</xsl:if>
						<div style="width:187mm;font-size:8pt">
							<span style="width:153.5mm;"/>Form 
			<span class="styBoldText" style="font-size:8pt;">8938</span> (Rev. 11-2021)
		</div>
					</xsl:if>
					<!--PART VI  End of Other Foreign Assets Continued-->
					<!--PART VI REPEATING INFORMATION  Start of Other Foreign Assets 
        (see instructions) Lines 29-33-->
					<xsl:if test="(count($FormData/OtherForeignAssetGrp) &gt;= 1) and ($Print != $Separated) or ((count($FormData/OtherForeignAssetGrp) = 1) and ($Print = $Separated))">
						<xsl:for-each select="$FormData/OtherForeignAssetGrp">
							<xsl:choose>
								<xsl:when test="position()=1">
								
									<!-- header for first part VI-->
									<div style="width:187mm;font-size:8pt;border-bottom:1px solid black">
										<span style="width:150mm;">Form 8938 (Rev. 11-2021)</span>
										<span style="width:19.5mm;"/>Page 
						<span class="styFixedUnderline" style="width:10mm;float:none;
						  padding-top:0mm;padding-bottom:0mm;"/>
									</div>
									
									<div class="styBB" style="width:187mm;height:5mm;">
										<div class="styPartName" style="font-size:10pt;padding-bottom:.5mm;font-family:arial;
				  text-align:center;height:4mm;padding-top:.5mm">Part VI</div>
										<div class="styPartDesc" style="font-size:10pt;padding-left:3mm;float:left;clear:none;
				  padding-top:.5mm;padding-bottom:.5mm;">
			      Detailed Information for Each "Other Foreign Asset" Included in the Part II Summary
			      <span style="font-weight:normal;"> (see instructions)</span>
										</div>
									</div>
								
									<div class="styBB" style="width:187mm;height:auto;">
										<div class="styLNDesc" style="width:187mm;padding-left:2mm;padding-top:0mm;
				  padding-bottom:0mm;">If you have more than one asset to report in Part VI, attach a separate
				  statement for each additional asset (see instructions).</div>
									</div>
								</xsl:when>
								<xsl:otherwise>
								
									<div style="width:187mm;font-size:8pt;border-bottom:1px solid black">
										<span style="width:150mm;">Form 8938 (Rev. 11-2021)</span>
										<span style="width:19.5mm;"/>Page 
						<span class="styFixedUnderline" style="width:10mm;float:none;
						  padding-top:0mm;padding-bottom:0mm;"/>
									</div>
									
									<div class="styBB" style="width:187mm;">
										<div class="styPartName" style="font-size:10pt;padding-bottom:.5mm;font-family:arial;
				  text-align:center;height:4mm;padding-top:.5mm">Part VI</div>
										<div class="styPartDesc" style="font-size:10pt;padding-left:3mm;float:left;clear:none;
				  padding-top:.5mm;padding-bottom:.5mm;">
			      Detailed Information for Each "Other Foreign Asset" Included in the Part II Summary
			      <span style="font-weight:normal;"> (see instructions)</span>
										</div>
									</div>
									<div class="styBB" style="width:187mm;height:auto;">
										<div class="styLNDesc" style="width:187mm;padding-left:2mm;padding-top:0mm;
				  padding-bottom:0mm;">If you have more than one asset to report in Part VI, attach a separate
				  statement for each additional asset (see instructions).</div>
									</div>
									<!--</xsl:when>-->
								</xsl:otherwise>
							</xsl:choose>
							<!-- PART VI REPEATING INFORMATION  BEGIN TITLE -->
							<table class="styBB" id="IRS8938Table3" summary="Asset [header]" cellspacing="0" cellpadding="0" style="width:187mm;">
								<tr>
									<!--PART VI  REPEATING INFORMATION  Line 29  Start of Asset Description-->
									<th style="width:110mm;font-size:8pt; border-right:solid black 1px;vertical-align:top;padding-left:2mm;text-align:left;" scope="col">
										<div class="styLNLeftNumBox" style="padding-left:0mm;width:4mm;padding-top:0mm;">29</div>
										<div style="font-weight:normal;padding-left:4mm;">Description of asset</div>
										<br/>
										<div style="padding-left:8mm;font-weight:normal;font-size:8pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AssetDesc"/>
												<xsl:with-param name="BackupName">IRS8938OFAAssetDesc</xsl:with-param>
											</xsl:call-template>
										</div>
									</th>
									<!--PART VI  REPEATING INFORMATION  Line 29  End of Asset Description-->
									<!--PART VI  REPEATING INFORMATION  Line 30  Start of Identifying Designation Number-->
									<th style="width:70mm;font-size:8pt; border-left:solid black 0px;vertical-align:top;padding-left:2mm;text-align:left" scope="col">
										<div class="styLNLeftNumBox" style="width:4mm;padding-top:0mm;padding-left:0mm;">30</div>
										<div style="font-weight:normal;">Identifying number or other designation</div>
										<br/>
										<div style="padding-left:4mm;font-weight:normal;font-size:8pt;">
											<xsl:choose>
												<xsl:when test="$FormData/OtherForeignAssetGrp/IdentifyingDesignationNum">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="IdentifyingDesignationNum"/>
														<xsl:with-param name="BackupName">IRS8938OFAIdentifyingDesignationNum
											</xsl:with-param>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BankAccountNum"/>
														<xsl:with-param name="BackupName">IRS8938OFABankAccountNum</xsl:with-param>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</div>
									</th>
									<!--PART VI  REPEATING INFORMATION  Line 30  End of Identifying Designation Number-->
								</tr>
							</table>
							<!--PART VI  REPEATING INFORMATION  Line 30  End of Identifying Designation Number-->
							<!--PART VI REPEATING INFORMATION  Line 311  Start of Complete all that apply-->
							<div class="styBB" style="width:187mm;font-size:8pt;height:18mm;">
								<div style="width:187mm;float:left;clear:none;">
									<div class="styLNLeftNumBox" style="padding-left:2mm;">31</div>
									<div class="styLNDesc" style="width:146.5mm;padding-left:2mm;">
		              Complete all that apply. See instructions for reporting of multiple acquisition
		              or disposition dates.
		            </div>
								</div>
								<!--PART VI REPEATING INFORMATION  Line 31a  Start of Date Acquired-->
								<div style="width:187mm;">
									<div class="styLNLeftLtrBox" style="padding-left:4mm;">a</div>
									<div class="styLNDesc" style="width:144mm;padding-left:2mm;">
						Date asset acquired during tax year, if applicable
					<span class="styDotLn" style="float:none;clear:none;
					  padding-left:2mm;">.................</span>
									</div>
									<div class="styFixedUnderline" style="height:4mm;padding-left:2mm;width:35mm">
										<xsl:if test="AcquiredDt">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="AcquiredDt"/>
												<xsl:with-param name="BackupName">IRS8938OFA-RDateAcquiredMonth</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="AcquiredDateVariousCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AcquiredDateVariousCd"/>
												<xsl:with-param name="BackupName">IRS8938OFAAcquiredDateVariousCd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
								<!--PART VI REPEATING INFORMATION  Line 31a  End of Date Acquired-->
								<!--PART VI REPEATING INFORMATION  Line 31b  Start of Disposed Of Date-->
								<div style="width:187mm;">
									<div class="styLNLeftLtrBox" style="padding-left:4mm;">b</div>
									<div class="styLNDesc" style="width:144mm;padding-left:2mm;">
						Date asset disposed of during tax year, if applicable
					<span class="styDotLn" style="float:none;clear:none;
					  padding-left:2mm;">................</span>
									</div>
									<div class="styFixedUnderline" style="height:4mm;padding-left:2mm;width:35mm">
										<xsl:if test="DisposedOfDt">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="DisposedOfDt"/>
												<xsl:with-param name="BackupName">IRS8938OFA-RDisposedOfDtMonth</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="DisposedOfDateVariousCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DisposedOfDateVariousCd"/>
												<xsl:with-param name="BackupName">IRS8938OFADisposedOfDateVariousCd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
								<!--PART VI REPEATING INFORMATION  Line 31b  End of Disposed Of Date-->
								<!--PART VI REPEATING INFORMATION  Line 31c  Start of Jointly Owned With Spouse Ind-->
								<div style="width:187mm;">
									<div class="styLNLeftLtrBox" style="padding-left:4mm;">c</div>
									<div class="styLNDesc" style="width:68mm;padding-left:1mm;">
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="JointlyOwnedWithSpouseInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-RJointlyOwnedWithSpouseInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="JointlyOwnedWithSpouseInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-RJointlyOwnedWithSpouseInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							Check if asset jointly owned with spouse
						</label>
									</div>
									<!--PART VI REPEATING INFORMATION  Line 31c  End of Jointly Owned With Spouse Ind-->
									<!--PART VI REPEATING INFORMATION  Line 31d  Start of No Tax Item Reported Ind-->
									<div class="styLNDesc" style="width:110mm;padding-left:2mm;">
										<b>d</b>
										<span style="width:5px;"/>
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="NoTaxItemReportedInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-RNoTaxItemReportedInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="NoTaxItemReportedInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-RNoTaxItemReportedInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							Check if no tax item reported in Part III with respect to this asset
						</label>
									</div>
								</div>
							</div>
							<!--PART VI REPEATING INFORMATION  Line 31d  End of No Tax Item Reported Ind-->
							<!--PART VI REPEATING INFORMATION  Line 32  Start of Maximum value of asset during tax
                 year-->
							<div class="styBB" style="width:187mm;font-size:8pt;height:14mm;">
								<div style="width:187mm;float:left;clear:none;">
									<div class="styLNLeftNumBox" style="padding-left:2mm;">32</div>
									<div class="styLNDesc" style="width:146.5mm;padding-left:2mm;">
						Maximum value of asset during tax year (check box that applies)
					</div>
								</div>
								<!--PART VI REPEATING INFORMATION  Line 32a  Start of Max. Value During TY 0 To
                     50000 Ind-->
								<div style="width:187mm;">
									<div class="styLNLeftLtrBox" style="padding-left:4mm;">a</div>
									<div class="styLNDesc" style="width:35mm;padding-left:1mm;">
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="MaxValueDuringTY0To50000Ind"/>
												<xsl:with-param name="BackupName">IRS8938OFA-RMaxValueDuringTY0To50000Ind<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="MaxValueDuringTY0To50000Ind"/>
												<xsl:with-param name="BackupName">IRS8938OFA-RMaxValueDuringTY0To50000Ind<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							$0 - $50,000
						</label>
									</div>
									<!--PART VI REPEATING INFORMATION  Line 32a  End of Max. Value During TY 0 To
                         50000 Ind-->
									<!--PART VI REPEATING INFORMATION  Line 32b  Start of Max. Value During TY 50001 To
                        100000 Ind-->
									<div class="styLNDesc" style="width:45mm;padding-left:2mm;">
										<b>b</b>
										<span style="width:5px;"/>
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="MaxValueDurTY50001To100000Ind"/>
												<xsl:with-param name="BackupName">IRS8938OFA-RMaxValueDurTY50001To100000Ind<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="MaxValueDurTY50001To100000Ind"/>
												<xsl:with-param name="BackupName">IRS8938OFA-RMaxValueDurTY50001To100000Ind<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							$50,001 - $100,000
						</label>
									</div>
									<!--PART VI REPEATING INFORMATION  Line 32b  End of Max. Value During TY 50001 To
                        100000 Ind-->
									<!--PART VI REPEATING INFORMATION  Line 32c  Start of Max. Value During TY 100001 To
                        150000 Ind-->
									<div class="styLNDesc" style="width:50mm;padding-left:2mm;">
										<b>c</b>
										<span style="width:5px;"/>
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="MaxValueDurTY100001To150000Ind"/>
												<xsl:with-param name="BackupName">IRS8938OFA-RMaxValueDurTY100001To150000Ind<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="MaxValueDurTY100001To150000Ind"/>
												<xsl:with-param name="BackupName">IRS8938OFA-RMaxValueDurTY100001To150000Ind<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							$100,001 - $150,000
						</label>
									</div>
									<!--PART VI REPEATING INFORMATION  Line 32c  End of Max. Value During TY 100001 To
                         150000 Ind-->
									<!--PART VI REPEATING INFORMATION  Line 32d  Start of Max. Value During TY 150001 To
                         200000 Ind-->
									<div class="styLNDesc" style="width:45mm;padding-left:2mm;">
										<b>d</b>
										<span style="width:5px;"/>
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="MaxValueDurTY150001To200000Ind"/>
												<xsl:with-param name="BackupName">IRS8938OFA-RMaxValueDurTY150001To200000Ind<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="MaxValueDurTY150001To200000Ind"/>
												<xsl:with-param name="BackupName">IRS8938OFA-RMaxValueDurTY150001To200000Ind<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							$150,001 - $200,000
						</label>
									</div>
								</div>
								<!--PART VI REPEATING INFORMATION  Line 32d  End of Max. Value During TY 150001 To
                     200000 Ind-->
								<!--PART VI REPEATING INFORMATION  Line 32e  Start of Max. Value During TY More Max.
                     Amount-->
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style="height:2mm;padding-left:4mm;padding-top:0mm;
					   padding-bottom:0mm;">e</div>
									<div class="styLNDesc" style="height:2mm;width:146mm;padding-left:2mm;padding-top:0mm;
					  padding-bottom:0mm;">If more than $200,000, list value
						<!--Dotted Line-->
										<span class="styDotLn" style="float:none;clear:none;
						  padding-right:1mm;">......................</span>$</div>
									<div class="styLNAmountBoxNB" style="height:2mm;padding-top:0mm;
					  padding-bottom:0mm;" valign="bottom">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="MaxValueDurTYMoreMaxAmt"/>
											<xsl:with-param name="BackupName">IRS8938OFA-RMaxValueDurTYMoreMaxAmt
							</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<!--PART VI REPEATING INFORMATION  Line 32e  End of Max. Value During TY More Max.
                 Amount-->
							<!--PART VI REPEATING INFORMATION  Line 33  Start of Exchange Rate used-->
							<div class="styBB" style="width:187mm;font-size:8pt;border-bottom:0px;">
								<div class="styLNLeftNumBox" style="height:5mm;padding-left:2mm;padding-top:1.1mm;">33</div>
								<div class="styLNDesc" style="height:4mm;width:178mm;padding-left:2mm;
				  padding-top:.7mm;padding-top:0mm;">Did you use a foreign currency exchange rate to
				  convert the value of the asset into U.S. dollars?
					<!--Dotted Line-->
									<span class="styDotLn" style="float:none;clear:none;padding-right:1mm;">...</span>
									<!--Start of Exchange Rate Used Ind "Yes"-->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
										</xsl:call-template>
										<input type="Checkbox" alt="Exchange Rate Used Indicator Yes" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-RExchangeRateUsedInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-RExchangeRateUsedInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							Yes
						</label>
									</span>
									<!--PART VI REPEATING INFORMATION  End of Exchange Rate Used Ind "Yes"-->
									<span style="width:5px;"/>
									<!--PART VI REPEATING INFORMATION  Start of Exchange Rate Used Ind "No"-->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
										</xsl:call-template>
										<input type="Checkbox" alt="Exchange Rate Used Indicator No" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-RExchangeRateUsedInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:5px;"/>
									<span>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-RExchangeRateUsedInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							No
						</label>
									</span>
									<!--PART VI REPEATING INFORMATION  End of Exchange Rate Used Ind "No"-->
								</div>
							</div>
							<br/>
							<!--PART VI REPEATING INFORMATION  End of Other Foreign Assets
                 Lines 29 thru 33-->
							<!--PART VI REPEATING INFORMATION  Start of Other Foreign Assets 
                (continued) Lines 34 thru 36-->
							<!--PART VI REPEATING INFORMATION  Line 34  Start of If you answered 
                 "Yes" to line 33, complete all that apply-->
							<div style="width:187mm;float:left;clear:none;border-style:solid;border-color:black;
			  border-width: 1px 0px 1px 0px;font-size:8pt;">
								<div class="styLNLeftNumBox" style="padding-left:2mm;padding-top:.7mm;
				  height:4mm">34</div>
								<div class="styLNDesc" style="width:146.5mm;padding-left:2mm;padding-top:.7mm;
				  height:4mm;">If you answered "Yes" to line 33, complete all that apply.
				</div>
							</div>
							<table class="styBB" id="IRS8938Table" summary="Foreign currency [header]" cellspacing="0" cellpadding="0" style="width:187mm;">
								<tr>
									<!--PART VI REPEATING INFORMATION  Line 34(1)  Start of Foreign Currency
                         Description Text-->
									<th class="styLimitationHeading" style="width:52mm;padding-left:10mm;
					  border-right:solid black 1px;font-size:8pt;text-align:left" scope="col">
										<span style="font-weight:normal;">
											<span class="styBoldText">(a)</span>
						  Foreign currency in which<br/>asset is denominated<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignCurrencyDesc"/>
												<xsl:with-param name="BackupName">IRS8938OFA-RForeignCurrencyDescTxt</xsl:with-param>
											</xsl:call-template>
										</span>
									</th>
									<!--PART VI REPEATING INFORMATION  Line 34(1)  End of Foreign Currency
                         Description Text-->
									<!--PART VI REPEATING INFORMATION  Line 34(2)  Start of Exchange Rate Used-->
									<th class="styLimitationHeading" style="width:67mm;font-size:8pt;
					  vertical-align:top;padding-left:2mm;text-align:left" scope="col">
										<span style="font-weight:normal;">
											<b>(b)</b>
						  Foreign currency exchange rate used<br/>to convert to U.S. dollars<br/>
											<span style="padding-left:.5mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ExchangeRt"/>
													<xsl:with-param name="BackupName">IRS8938OFA-RExchangeRateUsed</xsl:with-param>
												</xsl:call-template>
											</span>
										</span>
									</th>
									<!--PART VI REPEATING INFORMATION  Line 34(2)  End of Exchange Rate Used-->
									<!--PART VI REPEATING INFORMATION  Line 34(3)  Start of Source  Of Exchange
                         Rate Used Text-->
									<th class="styLimitationHeading" style="width:68mm;font-size:8pt;
					  border-left:solid black 1px;vertical-align:top;padding-left:2mm;text-align:left" scope="col">
										<span style="font-weight:normal">
											<span class="styBoldText">(c) </span>
						  Source of exchange rate used if not from<br/>
						  U.S. Treasury Department's Bureau of the Fiscal Service<br/>
											<span style="font-size:8pt">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SourceOfExchangeRateUsedTxt"/>
													<xsl:with-param name="BackupName">IRS8938OFA-RSourceOfExchangeRateUsedTxt
									</xsl:with-param>
												</xsl:call-template>
											</span>
										</span>
									</th>
									<!--PART VI REPEATING INFORMATION  Line 34(3)  End of Source Of Exchange 
                         Rate Used Text-->
								</tr>
							</table>
							<!--PART VI REPEATING INFORMATION  Line 35 Report information-->
							<div style="width:187mm;font-size:8pt;height:5mm;">
								<div class="styLNLeftNumBox" style="height:2mm;padding-left:2mm;
									  padding-top:0mm;padding-bottom:0mm;">35</div>
								<div class="styLNDesc" style="height:4mm;width:178mm;padding-left:2mm;
									  padding-top:0mm;padding-bottom:0mm;">
									  If asset reported on line 29 is stock of a foreign entity or an interest in a 
									  foreign entity, enter the following information for the asset.
								</div>
							</div>
							<!--<span style="height:4mm;"/>-->
							<!--PART VI  Line 35a Start of Name of Foreign Entity-->
							<div style="height:16mm;width:187mm;font-size:8pt;">
								<div class="styLNLeftLtrBox" style="padding-left:4mm;">a</div>
								<div class="styLNDesc" style="width:178mm;height:20mm;">
									<div class="styLNDesc" style="width:30mm;padding-left:2mm;">
										Name of foreign entity</div>
									<!--<span style="height:4mm;"/>-->
									<div class="styFixedUnderline" style="width:80mm;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="EntityName/BusinessNameLine1Txt"/>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="EntityName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</div>
									<div class="styLNLeftNumBox" style="width:6mm;padding-right:4mm;">b</div>
									<div class="styLNDesc" style="width:22mm;text-align:right;">GIIN (Optional) </div>
									<div class="styBB" style="width:40mm;font-size:8pt;border-top-width: 0px;         border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;float:right;position:absolute;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="GIIN"/>
											<xsl:with-param name="BackupName">IRS8938OFA-RGIIN<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<!--PART VI REPEATING INFORMATION  Line 35a  End of Name of Foreign Entity-->
							<!--PART VI REPEATING INFORMATION  Line 35b  Start of Type of Foreign Entity-->
							<div style="width:187mm;font-size:8pt;height:5mm;">
								<div class="styLNLeftLtrBox" style="padding-left:4mm;">c</div>
								<div class="styLNDesc" style="width:35mm;padding-left:2mm;">Type of foreign entity</div>
								<!--Part VI Line 35b (1)  Start of Partnership-->
								<div class="styLNDesc" style="width:35mm;">
									<b>(1)</b>
									<span style="width:5px;"/>
									<input type="Checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="PartnershipInd"/>
											<xsl:with-param name="BackupName">IRS8938OFA-RPartnershipInd<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:5px;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="PartnershipInd"/>
											<xsl:with-param name="BackupName">IRS8938OFA-RPartnershipInd<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
						Partnership
					</label>
									<span style="width:5px;"/>
								</div>
								<!--PART VI REPEATING INFORMATION  Line 35b (1)  End of Partnership-->
								<!--PART VI REPEATING INFORMATION  Line 35b (2)  Start of Corporation-->
								<div class="styLNDesc" style="width:35mm;">
									<b>(2)</b>
									<span style="width:5px;"/>
									<input type="Checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="CorporationInd"/>
											<xsl:with-param name="BackupName">IRS8938OFA-RCorporationInd<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:5px;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="CorporationInd"/>
											<xsl:with-param name="BackupName">IRS8938OFA-RCorporationInd<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
						Corporation 
					</label>
									<span style="width:5px;"/>
								</div>
								<!--PART VI REPEATING INFORMATION  Line 35b (2)  End of Corporation-->
								<!--PART VI REPEATING INFORMATION  Line 35b (3)  Start of Trust-->
								<div class="styLNDesc" style="width:35mm;">
									<b>(3)</b>
									<span style="width:5px;"/>
									<input type="Checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="TrustInd"/>
											<xsl:with-param name="BackupName">IRS8938OFA-RTrustInd<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:5px;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="TrustInd"/>
											<xsl:with-param name="BackupName">IRS8938OFA-RTrustInd<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
						Trust 
					</label>
									<span style="width:5px;"/>
								</div>
								<!--PART VI REPEATING INFORMATION  Line 35b (3)  End of Trust-->
								<!--PART VI REPEATING INFORMATION  Line 35b (4)  Start of Estate-->
								<div class="styLNDesc" style="width:35mm;">
									<b>(4)</b>
									<span style="width:5px;"/>
									<input type="Checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="EstateInd"/>
											<xsl:with-param name="BackupName">IRS8938OFA-REstateInd<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:5px;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="EstateInd"/>
											<xsl:with-param name="BackupName">IRS8938OFA-REstateInd<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
						Estate 
					</label>
								</div>
							</div>
							<br/>
							<!--PART VI REPEATING INFORMATION  Line 35b (4)  End of Estate-->
							<!--PART VI REPEATING INFORMATION  Line 35d  Start of Mailing Address-->
							<div style="width:187mm;font-size:8pt">
								<div class="styLNLeftLtrBox" style="padding-left:4mm;padding-top:2mm">d</div>
								<div class="styBB" style="height:16mm;width:179mm;padding-left:2mm;padding-top:0mm;float: nonet; clear: none;border-bottom-width:0px;
				  padding-bottom:0mm;padding-top:2mm;">Mailing address of foreign entity. Number, street, and room or suite no.
				            <br/>
									<xsl:if test="USAddress">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="USAddress/AddressLine1Txt"/>
										</xsl:call-template>
										<xsl:if test="USAddress/AddressLine2Txt">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="USAddress/AddressLine2Txt"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:if>
									<xsl:if test="ForeignAddress">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1Txt"/>
										</xsl:call-template>
										<xsl:if test="ForeignAddress/AddressLine2Txt">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2Txt"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:if>
									<div class="styFixedUnderline" style="width:178mm;padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">
										</div>
								</div>
							</div>
							<!--PART VI REPEATING INFORMATION  Line 35c  End of Mailing Address-->
							<!--PART VI REPEATING INFORMATION  Line e  Start of City, State and country-->
							<div style="width:187mm;height:16mm; border-bottom-width:1px; border-left-width: 0px;border-top-width: 0px; border-right-width: 0px;border-style:solid;border-color:black;font-size:8pt;">
								<div class="styLNLeftLtrBox" style="padding-left:4mm;">e</div>
								<div class="styLNDesc" style="width:179mm;padding-left:2mm;padding-bottom:0mm;">
					City or town, state or province, country, and ZIP or foreign postal code
				</div>
								<div class="styLNDesc" style="width:187mm;padding-left:10mm;">
									<xsl:if test="USAddress">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="USAddress/CityNm"/>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="USAddress/StateAbbreviationCd"/>
										</xsl:call-template>,
						<span style="width:2px;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="USAddress/ZIPCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="ForeignAddress">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ForeignAddress/CityNm"/>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrStateNm"/>
										</xsl:call-template>,
						<span style="width:2px;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ForeignAddress/CountryCd"/>
										</xsl:call-template>,
						<span style="width:2px;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ForeignAddress/ForeignPostalCd"/>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<!--PART VI REPEATING INFORMATION  Line 35d  Start of City, State and country-->
							<!--PART VI  REPEATING INFORMATION Line 36a - 36e  START of Report information of Asset Not
                 Stock of Foreign Ent Grp = 0-->
							<xsl:if test="(count(AssetNotStockOfForeignEntGrp) &lt;1)">
								<xsl:variable name="pos" select="position()"/>
								<!--<xsl:for-each select="AssetNotStockOfForeignEntGrp">-->
								<div style="width:187mm;font-size:8pt;height:12mm;">
									<div class="styLNLeftNumBox" style="height:2mm;padding-left:2mm;padding-top:0mm;
				       padding-bottom:0mm;">36</div>
									<div class="styLNDesc" style="width:178mm;padding-left:2mm;padding-top:0mm;
					  padding-bottom:1mm;">If asset reported on line 29 is not stock of a foreign
					  entity or an interest in a foreign entity, enter the following information for the asset.
					</div>
									<div class="styLNDesc" style="width:179mm;padding-left:10mm;padding-top:0mm;
					  padding-bottom:0mm;">
										<b>Note.</b> If this asset has more than one issuer or counterparty, attach a
						 separate statement with the same information for each additional issuer or
						 counterparty (see instructions).
					</div>
								</div>
								<br/>
								<!--PART VI REPEATING INFORMATION  Line 36a  Start of Name of Issuer-->
								<div style="width:187mm;font-size:8pt">
									<div class="styLNLeftLtrBox" style="padding-left:4mm;">a</div>
									<div class="styLNDesc" style="width:47mm;padding-left:2mm;">
					  Name of issuer or counterparty
					</div>
									<div class="styFixedUnderline" style="width:130mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
										</xsl:call-template>
										<xsl:if test="BusinessName/BusinessNameLine2Txt">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
								<!--PART VI REPEATING INFORMATION  Line 36a  End of Name of Issuer-->
								<!--PART VI REPEATING INFORMATION  Line 36a  Start of Check if information is for Issuer or 
					 Counterparty-->
								<div style="width:187mm;padding-left:10mm;font-size:8pt">
									<div class="styLNDesc" style="width:50.5mm;">Check if information is for</div>
									<div class="styLNDesc" style="width:35mm;">
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="IssuerInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>IssuerInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="IssuerInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>IssuerInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							Issuer
						</label>
									</div>
									<div class="styLNDesc" style="width:35.5mm;">
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="CounterpartyInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>CounterpartyInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="CounterpartyInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>CounterpartyInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							Counterparty
						</label>
									</div>
								</div>
								<br/>
								<!--PART VI REPEATING INFORMATION  Line 36b  Start of Type of Issuer or counterparty-->
								<div style="width:187mm;font-size:8pt;">
									<div class="styLNLeftLtrBox" style="padding-left:4mm;">b</div>
									<div class="styLNDesc" style="width:179mm;padding-left:2mm;">
					  Type of issuer or counterparty</div>
								</div>
								<!--PART VI REPEATING INFORMATION  Line 36b (1)  Start of Individual-->
								<div class="styLNDesc" style="width:187mm;padding-left:10mm;font-size:8pt;height:8mm">
									<div class="styLNDesc" style="width:47.3mm;">
										<b>(1)</b>
										<span style="width:5px;"/>
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/IndividualInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>IndividualInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/IndividualInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>IndividualInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							Individual
						</label>
									</div>
									<!--PART VI REPEATING INFORMATION  Line 36b (1)  End of Individual-->
									<!--PART VI REPEATING INFORMATION  Line 36b (2)  Start of Partnership-->
									<div class="styLNDesc" style="width:32.5mm;">
										<b>(2)</b>
										<span style="width:5px;"/>
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/PartnershipInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>PartnershipInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/PartnershipInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>PartnershipInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							Partnership
						</label>
									</div>
									<!--PART VI REPEATING INFORMATION  Line 36b (2)  End of Partnership-->
									<!--PART VI REPEATING INFORMATION  Line 36b (3)  Start of Corporation-->
									<div class="styLNDesc" style="width:35mm;">
										<b>(3)</b>
										<span style="width:5px;"/>
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/CorporationInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>CorporationInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/CorporationInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>CorporationInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							Corporation 
						</label>
									</div>
									<!--PART VI REPEATING INFORMATION  Line 36b (3)  End of Corporation-->
									<!--PART VI REPEATING INFORMATION  Line 36b (4)  Start of Trust-->
									<div class="styLNDesc" style="width:37mm;">
										<b>(4)</b>
										<span style="width:5px;"/>
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/TrustInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>TrustInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/TrustInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>TrustInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							Trust 
						</label>
									</div>
									<!--PART VI REPEATING INFORMATION  Line 36b (5)  Start of Estate-->
									<div class="styLNDesc" style="width:20mm;">
										<b>(5)</b>
										<span style="width:4px;"/>
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/EstateInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>EstateInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:4px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/EstateInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>EstateInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							Estate 
						</label>
									</div>
								</div>
								<br/>
								<br/>
								<!--PART VI REPEATING INFORMATION  Line 36b (5)  End of Estate-->
								<!--PART VI REPEATING INFORMATION  Line 36c  Start of Check if Issuer or Counterparty
                     is US or Foreign-->
								<div style="width:187mm;font-size:8pt;height:6mm">
									<div class="styLNLeftLtrBox" style="padding-left:4mm;">c</div>
									<div class="styLNDesc" style="width:55mm;padding-left:2mm;">
					  Check if issuer or counterparty is a
					</div>
									<div class="styLNDesc" style="width:30.5mm;">
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/USPersonInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>USPersonInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/USPersonInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>USPersonInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							U.S. person
						</label>
									</div>
									<div class="styLNDesc" style="width:40mm;padding-left:2mm;">
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/ForeignPersonInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>ForeignPersonInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/ForeignPersonInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>ForeignPersonInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							Foreign person
						</label>
									</div>
								</div>
								<br/>
								<!--PART VI REPEATING INFORMATION  Line 36c  End of Check if Issuer or Counterparty is
                     US or Foreign-->
								<!--PART VI REPEATING INFORMATION  Line 36d  Start of Mailing Address-->
								<div style="width:187mm;font-size:8pt;">
									<div class="styLNLeftLtrBox" style="padding-left:4mm;">d</div>
									<span style="height:4mm;"/>
									<div class="styLNDesc" style="height:12mm;width:179mm;padding-left:2mm;
					  padding-top:0mm;padding-bottom:0mm;">Mailing address of issuer or counterparty
					  Number, street, and room or suite no.
					</div>
									<div class="styFixedUnderline" style="height:6mm;width:179mm;padding-left:2mm;
					  padding-top:1mm;padding-bottom:0mm;">
										<xsl:if test="AssetNotStockOfForeignEntGrp/USAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="USAddress/AddressLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="AssetNotStockOfForeignEntGrp/USAddress/AddressLine2Txt">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="USAddress/AddressLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:if>
										<xsl:if test="AssetNotStockOfForeignEntGrp/ForeignAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="AssetNotStockOfForeignEntGrp/ForeignAddress/AddressLine2Txt">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:if>
									</div>
								</div>
								<!--PART VI REPEATING INFORMATION  Line 36d  End of Mailing Address-->
								<!--PART VI REPEATING INFORMATION  Line 36e  Start of City, State or Country-->
								<div style="width:187mm;height:12mm;border-style:solid;border-color:black;
				  border-width: 0px 0px 1px 0px;font-size:8pt;">
									<div class="styLNLeftLtrBox" style="padding-left:4mm;">e</div>
									<div class="styLNDesc" style="width:178mm;padding-left:2mm;padding-bottom:0mm;">
					  City or town, state or province, country, and ZIP or foreign postal code
					</div>
									<div class="styLNDesc" style="width:186mm;padding-left:10mm;">
										<xsl:if test="AssetNotStockOfForeignEntGrp/USAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="USAddress/CityNm"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="USAddress/StateAbbreviationCd"/>
											</xsl:call-template>,
							<span style="width:2px;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="USAddress/ZIPCd"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="AssetNotStockOfForeignEntGrp/ForeignAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignAddress/CityNm"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrStateNm"/>
											</xsl:call-template>,
							<span style="width:2px;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignAddress/CountryCd"/>
											</xsl:call-template>,
							<span style="width:2px;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignAddress/ForeignPostalCd"/>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
								<!--PART VI REPEATING INFORMATION  Line 36e  End of City, State or Country-->
							</xsl:if>
							<!--PART VI  REPEATING INFORMATION Line 36a - 36e  
                 END of Report information of Asset Not Stock of Foreign Ent Grp = 0-->
							<!--PART VI REPEATING INFORMATION  
                 Start of Asset Not Stock of Foreign Ent Grp >=1 (Lines 36a - 36e)-->
							<xsl:if test="(count(AssetNotStockOfForeignEntGrp) &gt;=1)">
								<!--<xsl:for-each select="$FormData/OtherForeignAssetGrp/AssetNotStockOfForeignEntGrp">-->
								<xsl:variable name="pos" select="position()"/>
								<xsl:for-each select="AssetNotStockOfForeignEntGrp">
									<div style="width:187mm;font-size:8pt;height:auto;">
										<div class="styLNLeftNumBox" style="height:2mm;padding-left:2mm;
						  padding-top:0mm;padding-bottom:0mm;">36</div>
										<div class="styLNDesc" style="width:178mm;padding-left:2mm;
						  padding-top:0mm;padding-bottom:1mm;">
						  If asset reported on line 29 is not stock of a foreign entity or
						  an interest in a foreign entity, enter the following information for
						  the asset.</div>
										<xsl:choose>
											<xsl:when test="position()=1">
												<div class="styLNDesc" style="height:auto;width:179mm;padding-left:10mm;padding-top:0mm;padding-bottom:0mm;font-style:italic;">
													<b>Note.</b>If this asset has more than one issuer or counterparty, attach a
														 separate statement with the same information for each additional issuer or
														 counterparty (see instructions).
												</div>
											</xsl:when>
										</xsl:choose>
									</div>
									<br/>
									<!--PART VI REPEATING INFORMATION  Line 36a  Start of Name of Issuer-->
									<div style="width:187mm;font-size:8pt">
										<div class="styLNLeftLtrBox" style="padding-left:4mm;">a</div>
										<div class="styLNDesc" style="width:47mm;padding-left:2mm;">
						  Name of issuer or counterparty
						</div>
										<div class="styFixedUnderline" style="width:130mm;padding-left:2mm">
											<xsl:choose>
												<xsl:when test="PersonNm">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PersonNm"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="BusinessName/BusinessNameLine2Txt">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:otherwise>
											</xsl:choose>
										</div>
									</div>
									<!--PART VI REPEATING INFORMATION  Line 36a  End of Name of Issuer-->
									<!--PART VI REPEATING INFORMATION  Line 36a 
                         Start of Check if information is for Issuer or Counterparty-->
									<div style="width:187mm;padding-left:10mm;font-size:8pt">
										<div class="styLNDesc" style="width:50.5mm;">Check if information is for</div>
										<div class="styLNDesc" style="width:35mm;">
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="IssuerInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>IssuerInd<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:5px;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="IssuerInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>IssuerInd<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
								Issuer
							</label>
										</div>
										<div class="styLNDesc" style="width:35.5mm;">
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="CounterpartyInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>CounterpartyInd<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:5px;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="CounterpartyInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>CounterpartyInd<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
								Counterparty
							</label>
										</div>
									</div>
									<br/>
									<!--PART VI REPEATING INFORMATION  Line 36b  
                         Start of Type of Issuer or counterparty-->
									<div style="width:187mm;font-size:8pt;">
										<div class="styLNLeftLtrBox" style="padding-left:4mm;">b</div>
										<div class="styLNDesc" style="width:179mm;padding-left:2mm;">
						  Type of issuer or counterparty</div>
									</div>
									<!--PART VI REPEATING INFORMATION  Line 36b (1)  Start of Individual-->
									<div class="styLNDesc" style="width:187mm;padding-left:10mm;font-size:8pt;height:7mm;">
										<div class="styLNDesc" style="width:47.3mm;">
											<b>(1)</b>
											<span style="width:5px;"/>
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="IndividualInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>IndividualInd<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:5px;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="IndividualInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>IndividualInd<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
								Individual
							</label>
										</div>
										<!--PART VI REPEATING INFORMATION  Line 36b (1)  End of Individual-->
										<!--PART VI REPEATING INFORMATION  Line 36b (2)  Start of Partnership-->
										<div class="styLNDesc" style="width:32.5mm;">
											<b>(2)</b>
											<span style="width:5px;"/>
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="PartnershipInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>PartnershipInd<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:5px;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="PartnershipInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>PartnershipInd<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
								Partnership
							</label>
										</div>
										<!--PART VI REPEATING INFORMATION  Line 36b (2)  End of Partnership-->
										<!--PART VI REPEATING INFORMATION  Line 36b (3)  Start of Corporation-->
										<div class="styLNDesc" style="width:35mm;">
											<b>(3)</b>
											<span style="width:5px;"/>
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="CorporationInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>CorporationInd<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:5px;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="CorporationInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>CorporationInd<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
								Corporation 
							</label>
										</div>
										<!--PART VI REPEATING INFORMATION  Line 36b (3)  End of Corporation-->
										<!--PART VI REPEATING INFORMATION  Line 36b (4)  Start of Trust-->
										<div class="styLNDesc" style="width:32mm;">
											<b>(4)</b>
											<span style="width:5px;"/>
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="TrustInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>TrustInd<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:5px;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="TrustInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>TrustInd<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
								Trust 
							</label>
										</div>
										<!--PART VI REPEATING INFORMATION  Line 36b (5)  Start of Estate-->
										<div class="styLNDesc" style="width:25mm;">
											<b>(5)</b>
											<span style="width:4px;"/>
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="EstateInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>EstateInd<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:4px;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="EstateInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>EstateInd<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
							     Estate 
							</label>
										</div>
									</div>
									<br/>
									<br/>
									<!--PART VI REPEATING INFORMATION  Line 36b (5)  End of Estate-->
									<!--PART VI REPEATING INFORMATION  Line 36c  
                         Start of Check if Issuer or Counterparty is US or Foreign-->
									<div style="width:187mm;font-size:8pt;height:6mm;">
										<div class="styLNLeftLtrBox" style="padding-left:4mm;">c</div>
										<div class="styLNDesc" style="width:55mm;padding-left:2mm;">Check if issuer or
						  counterparty is a
						</div>
										<div class="styLNDesc" style="width:30.5mm;">
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="USPersonInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>USPersonInd<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:5px;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="USPersonInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>USPersonInd<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
								   U.S. person
							</label>
										</div>
										<div class="styLNDesc" style="width:40mm;padding-left:2mm;">
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="ForeignPersonInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>ForeignPersonInd<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:5px;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="ForeignPersonInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>ForeignPersonInd<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
								   Foreign person
							</label>
										</div>
									</div>
									<br/>
									<!--PART VI REPEATING INFORMATION  Line 36c  
                         End of Check if Issuer or Counterparty is US or  Foreign-->
									<!--PART VI REPEATING INFORMATION  Line 36d  Start of Mailing Address-->
									<div style="width:187mm;font-size:8pt">
										<div class="styLNLeftLtrBox" style="padding-left:4mm;padding-top:2;">d</div>
										<!--<span style="height:4mm;"/>-->
										<div class="styLNDesc" style="height:12mm;width:179mm;padding-left:2mm;
						  padding-top:0mm;padding-bottom:0mm;border-bottom-width: 1px">Mailing address of issuer or counterparty.
						  Number, street, and room or suite no.<br/>
											<xsl:if test="USAddress">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="USAddress/AddressLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="USAddress/AddressLine2Txt">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/AddressLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:if>
											<xsl:if test="ForeignAddress">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="ForeignAddress/AddressLine2Txt">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:if>
											<div class="styFixedUnderline" style="width:178mm;padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">
										</div>
										</div>
									</div>
									<!--PART VI REPEATING INFORMATION  Line 36d  End of Mailing Address-->
									<!--PART VI REPEATING INFORMATION  Line 36e  Start of City, State or Country-->
									<div style="width:187mm;height:17mm;border-style:solid;
					  border-width: 0px 0px 1px 0px;font-size:8pt;padding-top:2mm">
										<div class="styLNLeftLtrBox" style="padding-left:4mm;">e</div>
										<div class="styLNDesc" style="width:178mm;padding-left:2mm;
						  padding-bottom:0mm;">
						  City or town, state or province, country, and ZIP or foreign postal code
						</div>
										<div class="styLNDesc" style="width:186mm;padding-left:10mm;">
											<xsl:if test="USAddress">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="USAddress/CityNm"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="USAddress/StateAbbreviationCd"/>
												</xsl:call-template>,
								<span style="width:2px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="USAddress/ZIPCd"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="ForeignAddress">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignAddress/CityNm"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrStateNm"/>
												</xsl:call-template>,
								<span style="width:2px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignAddress/CountryCd"/>
												</xsl:call-template>,
								<span style="width:2px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignAddress/ForeignPostalCd"/>
												</xsl:call-template>
											</xsl:if>
										</div>
									</div>
									<!--PART VI REPEATING INFORMATION  Line 36e  
                         End of City, State or Country-->
								</xsl:for-each>
							</xsl:if>
							<!--PART VI REPEATING INFORMATION  END of Report Information
                 of Asset Not Stock of Foreign Ent Grp >=1 (Lines 36a - 36e)-->
							<!--  PART VI REPEATING INFORMATION  FOOTER-->
							<div style="width:187mm;font-size:8pt;text-align:right;">
								<span style="font-size:8pt;width:136mm;"/>
								<span style="width:17.5mm;"/>Form 
				<span class="styBoldText" style="font-size:8pt;">8938</span> (Rev. 11-2021)
			</div>
						</xsl:for-each>
					</xsl:if>
					<!--SEE ADDITIONAL TABLE MESSAGE WHEN PART VI REPEATING INFORMATION
         FOR OTHER FOREIGN ASSETS IS GREATER THAN 1 ITEM-->
         
					<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE  Start of Other Foreign Assets
        (see instructions) Lines 1-5-->
					<xsl:if test="(count($FormData/OtherForeignAssetGrp) &gt;= 2) and ($Print = $Separated)">
						<div style="font-size:8pt">
							<!-- PART VI REPEATING-SEPARATED ADDITIONAL TABLE MESSAGE  BEGIN TITLE -->
							<div class="styBB" style="width:187mm;">
								<div class="styPartName" style="font-size:10pt;padding-bottom:.5mm;
				  font-family:arial;text-align:center;">Part VI</div>
								<div class="styPartDesc" style="font-size:10pt;padding-left:3mm;
				  float:left;clear:none;width:173mm;">
			      Detailed Information for Each "Other Foreign Asset" Included in the 
			      Part II Summary<span style="font-weight:normal;width:28.8mm;padding-left:1mm;">(see instructions)</span>
								</div>
							</div>
							<!-- PART VI REPEATING ADDITIONAL TABLE MESSAGE  END TITLE -->
							<!--<div class="styBB" style="width:187mm;height:10mm;background-color:red">
								<div class="styLNDesc" style="width:187mm;padding-left:2mm;padding-top:0mm;
				  padding-bottom:0mm;">
									<b>Note.</b>
									<i>If you reported specified foreign financial assets on 
				Forms 3520, 3520-A, 5471, 8621 or 8865, you do not have to <br/>
				include the assets on Form 8938. You must complete Part IV. See instructions.</i>
								</div>
							</div>-->
							<div class="styBB" style="width:187mm;">
								<div class="styLNDesc" style="width:187mm;padding-left:2mm;padding-top:0mm;
				  padding-bottom:0mm;">If you have more than one asset to report in Part VI, attach a separate
				  statement for each additional asset. see instructions.</div>
							</div>
							<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                 Line 29 Start of Asset Description-->
							<div class="styBB" style="width:187mm;">
								<div style="width:110mm;float:left;clear:none;">
									<div style="width:70mm;float:left;clear:none;">
										<div class="styLNLeftNumBox" style="padding-left:2mm;">29</div>
										<div class="styLNDesc" style="width:40mm;padding-left:2mm;">
							Description of asset
						</div>
									</div>
									<div class="styLNDesc" style="width:110mm;padding-left:10mm;float:left;
					  clear:none;">
										<xsl:call-template name="PopulateAdditionalDataTableMessage">
											<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp"/>
										</xsl:call-template>
									</div>
								</div>
								<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                     Line 29 End of Asset Description-->
								<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                     Line 30 Start of Identifying Designation Number-->
								<div style="width:70mm;float:left;clear:none;border-style:solid;border-color:black;
				   border-width: 0px 0px 0px 1px;">
									<div class="styLNLeftNumBox" style="width:5mm;text-align:center;float:left;
					  padding-bottom:0mm;">30</div>
									<div class="styLNDesc" style="width:64mm;padding-left:2mm;
					  padding-bottom:0mm;">Identifying number or other designation</div>
									<div class="styLNDesc" style="width:69mm;padding-left:5.5mm;
					  padding-top:1mm;" valign="bottom"/>
								</div>
							</div>
							<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                 Line 30 End of Identifying Designation Number-->
							<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                 Line 31 Start of Complete all that apply-->
							<div class="styBB" style="width:187mm;">
								<div style="width:187mm;float:left;clear:none;">
									<div class="styLNLeftNumBox" style="padding-left:2mm;">31</div>
									<div class="styLNDesc" style="width:146.5mm;padding-left:2mm;">
					  Complete all that apply. See instructions for reporting of multiple acquisition
					  or disposition dates.
					</div>
								</div>
								<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                     Line 31a Start of Date Acquired-->
								<div style="width:187mm;">
									<div class="styLNLeftLtrBox" style="padding-left:4mm;">a</div>
									<div class="styLNDesc" style="width:144mm;padding-left:2mm;">
						Date asset acquired during tax year, if applicable
					<span class="styDotLn" style="float:none;clear:none;
					  padding-left:2mm;">..................</span>
									</div>
									<div class="styFixedUnderline" style="height:4mm;padding-left:2mm;width:35mm">
					</div>
								</div>
								<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                     Line 31a End of Date Acquired-->
								<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                     Line 31b Start of Disposed Of Date-->
								<div style="width:187mm;">
									<div class="styLNLeftLtrBox" style="padding-left:4mm;">b</div>
									<div class="styLNDesc" style="width:144mm;padding-left:2mm;">
						Date asset disposed of during tax year, if applicable
					<span class="styDotLn" style="float:none;clear:none;
					  padding-left:2mm;">.................</span>
									</div>
									<div class="styFixedUnderline" style="height:4mm;padding-left:2mm;width:35mm">
					</div>
								</div>
								<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                     Line 31b End of Disposed Of Date-->
								<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                     Line 31c Start of Jointly Owned With Spouse Ind-->
								<div style="width:187mm;height:5mm;">
									<div class="styLNLeftLtrBox" style="padding-left:4mm;">c</div>
									<div class="styLNDesc" style="width:70mm;padding-left:1mm;">
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="JointlyOwnedWithSpouseInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-ATMJointlyOwnedWithSpouseInd
								<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:0mm;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="JointlyOwnedWithSpouseInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-ATMJointlyOwnedWithSpouseInd
								<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							Check if asset jointly owned with spouse
						</label>
									</div>
									<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                         Line 31c End of Jointly Owned With Spouse Ind-->
									<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                         Line 31d Start of No Tax Item Reported Ind-->
									<div class="styLNDesc" style="width:105mm;padding-left:2mm;">
										<b>d</b>
										<span style="width:5px;"/>
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="NoTaxItemReportedInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-ATMNoTaxItemReportedInd
								<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="NoTaxItemReportedInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-ATMNoTaxItemReportedInd
								<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							Check if no tax item reported in Part III with respect to this asset
						</label>
									</div>
								</div>
							</div>
							<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                Line 31d End of No Tax Item Reported Ind-->
							<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                 Line 32 Start of Maximum value of asset during tax year-->
							<div class="styBB" style="width:187mm;height:14mm;">
								<div style="width:187mm;float:left;clear:none;">
									<div class="styLNLeftNumBox" style="padding-left:2mm;">32</div>
									<div class="styLNDesc" style="width:146.5mm;padding-left:2mm;">
						Maximum value of asset during tax year (check box that applies)
					</div>
								</div>
								<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                     Line 32a Start of Max. Value During TY 0 To 50000 Ind-->
								<div style="width:187mm;">
									<div class="styLNLeftLtrBox" style="padding-left:4mm;">a</div>
									<div class="styLNDesc" style="width:35mm;padding-left:1mm;">
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="MaxValueDuringTY0To50000Ind"/>
												<xsl:with-param name="BackupName">IRS8938OFA-ATMMaxValueDuringTY0To50000Ind
								<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="MaxValueDuringTY0To50000Ind"/>
												<xsl:with-param name="BackupName">IRS8938OFA-ATMMaxValueDuringTY0To50000Ind
								<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							$0 - $50,000
						</label>
									</div>
									<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                         Line 32a End of Max. Value During TY 0 To 50000 Ind-->
									<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                         Line 32b Start of Max. Value During TY 50001 To 100000 Ind-->
									<div class="styLNDesc" style="width:45mm;padding-left:2mm;">
										<b>b</b>
										<span style="width:5px;"/>
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="MaxValueDurTY50001To100000Ind"/>
												<xsl:with-param name="BackupName">IRS8938OFA-ATMMaxValueDurTY50001To100000Ind
								<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="MaxValueDurTY50001To100000Ind"/>
												<xsl:with-param name="BackupName">IRS8938OFA-ATMMaxValueDurTY50001To100000Ind
								<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							$50,001 - $100,000
						</label>
									</div>
									<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                        Line 32b End of Max. Value During TY 50001 To 100000 Ind-->
									<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                        Line 32c Start of Max. Value During TY 100001 To 150000 Ind-->
									<div class="styLNDesc" style="width:50mm;padding-left:2mm;">
										<b>c</b>
										<span style="width:5px;"/>
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="MaxValueDurTY100001To150000Ind"/>
												<xsl:with-param name="BackupName">IRS8938OFA-ATMMaxValueDurTY100001To150000Ind
								<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="MaxValueDurTY100001To150000Ind"/>
												<xsl:with-param name="BackupName">IRS8938OFA-ATMMaxValueDurTY100001To150000Ind
								<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							$100,001 - $150,000
						</label>
									</div>
									<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                         Line 32c End of Max. Value During TY 100001 To 150000 Ind-->
									<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                         Line 32d Start of Max. Value During TY 150001 To 200000 Ind-->
									<div class="styLNDesc" style="width:45mm;padding-left:2mm;">
										<b>d</b>
										<span style="width:5px;"/>
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="MaxValueDurTY150001To200000Ind"/>
												<xsl:with-param name="BackupName">IRS8938OFA-ATMMaxValueDurTY150001To200000Ind
								<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="MaxValueDurTY150001To200000Ind"/>
												<xsl:with-param name="BackupName">IRS8938OFA-ATMMaxValueDurTY150001To200000Ind
								<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							$150,001 - $200,000
						</label>
									</div>
								</div>
								<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                     Line 32d End of Max. Value During TY 150001 To 200000 Ind-->
								<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                     Line 32e Start of Max. Value During TY More Max. Amount-->
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style="height:2mm;padding-left:4mm;
					  padding-top:0mm;padding-bottom:0mm;">e</div>
									<div class="styLNDesc" style="height:2mm;width:146mm;
					  padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">
					  If more than $200,000, list value
						<!--Dotted Line-->
										<span class="styDotLn" style="float:none;clear:none;
						padding-right:1mm;">......................</span>$</div>
									<div class="styLNAmountBoxNB" style="height:2mm;padding-top:0mm;
					  padding-bottom:0mm;" valign="bottom">
					</div>
								</div>
							</div>
							<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                 Line 32e End of Max. Value During TY More Max. Amount-->
							<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                 Line 33 Start of Exchange Rate used-->
							<div style="width:187mm;padding-bottom:1mm;">
								<div class="styLNLeftNumBox" style="height:5mm;padding-left:2mm;
				  padding-top:1.7mm;padding-bottom:0mm;">33</div>
								<div class="styLNDesc" style="height:5mm;width:178mm;padding-left:2mm;
				  padding-top:.5mm;padding-bottom:0mm;">Did you use a foreign currency
				  exchange rate to convert the value of the asset into U.S. dollars?
					<!--Dotted Line-->
									<span class="styDotLn" style="float:none;clear:none;
					  padding-right:1mm;">...</span>
									<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE  
                         Start of Exchange Rate Used Ind "Yes"-->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
										</xsl:call-template>
										<input type="checkbox" alt="Exchange Rate Used Ind Yes" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
												<xsl:with-param name="BackupName">IRS8938FFA-ATMExchangeRateUsedInd
								<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
												<xsl:with-param name="BackupName">IRS8938FFA-ATMExchangeRateUsedInd
								<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
						Yes
					</label>
									</span>
									<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                        End of Exchange Rate Used Ind "Yes"-->
									<span style="width:5px;"/>
									<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                        Start of Exchange Rate Used Ind "No"-->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
										</xsl:call-template>
										<input type="checkbox" alt="Exchange Rate Used Ind No" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
												<xsl:with-param name="BackupName">IRS8938FFA-ATMExchangeRateUsedInd
								<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
												<xsl:with-param name="BackupName">IRS8938FFA-ATMExchangeRateUsedInd
							<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
						No
					</label>
									</span>
									<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                         End of Exchange Rate Used Ind "No"-->
								</div>
							</div>
							<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                End of Other Foreign Assets Lines 29 thru 33-->
							<!--<br/>-->
							<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                 Start of Other Foreign Assets (continued) Lines 34 thru 36-->
							<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                 Line 34 Start of If you answered "Yes" to line 33, complete all that apply-->
							<div style="width:187mm;float:left;clear:none;border-style:solid;border-color:black;
			  border-width: 1px 0px 1px 0px;">
								<div class="styLNLeftNumBox" style="padding-left:2mm;padding-top:.7mm;
				  height:5mm">34</div>
								<div class="styLNDesc" style="width:146.5mm;padding-left:2mm;
				  padding-top:.7mm;height:5mm">If you answered "Yes" to line 33 complete
				  all that apply.</div>
							</div>
							<div class="styBB" style="width:187mm;">
								<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                    Line 34(1) Start of Foreign Currency Description Text-->
								<div style="width:60mm;float:left;clear:none;">
									<div class="styLNDesc" style="width:55mm;padding-left:10mm;
					  padding-bottom:.5mm;">
										<b>(a) </b> Foreign currency in which<br/> asset is denominated
					</div>
									<div class="styLNDesc" style="width:55mm;padding-top:1mm;
					  padding-left:8.5mm;" valign="bottom"/>
								</div>
								<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                     Line 34(1) End of Foreign Currency Description Text-->
								<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                     Line 34(2) Start of Exchange Rate Used-->
								<div style="width:63mm;float:left;clear:none;border-style:solid;border-color:black;
				   border-width: 0px 1px 0px 1px;height:10mm">
									<div class="styLNDesc" style="width:61mm;padding-left:2mm;
					  padding-bottom:.5mm;">
										<b>(b) </b> Foreign currency exchange rate used to convert to U.S. dollars
					</div>
									<div class="styLNDesc" style="width:61mm;padding-top:1mm;padding-left:.8mm;
					  text-align:right" valign="bottom"/>
								</div>
								<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                     Line 34(2) End of Exchange Rate Used-->
								<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                     Line 34(3) Start of Source  Of Exchange Rate Used Text-->
								<div style="width:64mm;float:left;clear:none;border-style:solid;border-color:black;
				   border-width: 0px 0px 0px 0px;font-size:8pt;">
									<div class="styLNDesc" style="width:62mm;padding-left:2mm;
					  padding-bottom:1.5mm;">
										<b>(c) </b> Source of exchange rate used if not from <br/>
						 U.S. Treasury Department's Bureau of the Fiscal Service
					</div>
									<div class="styLNDesc" style="width:62mm;padding-top:1mm;
					  padding-left:1mm" valign="bottom"/>
								</div>
							</div>
							<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                 Line 34(3) End of Source Of Exchange Rate Used Text-->
							<!--PART VI REPEATING INFORMATION  Line 35a  End of Name of Foreign Entity-->
							<!--PART VI REPEATING INFORMATION  Line 35b  Start of Type of Foreign Entity-->
							<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                 Line 35 Report information-->
							<div style="width:187mm;font-size:8pt;height:5mm;">
								<div class="styLNLeftNumBox" style="padding-left:2mm;
									  padding-top:0mm;padding-bottom:0mm;">35</div>
								<div class="styLNDesc" style="height:4mm;width:178mm;padding-left:2mm;
									  padding-top:0mm;padding-bottom:0mm;">
									  If asset reported on line 29 is stock of a foreign entity or an interest in a 
									  foreign entity, enter the following information for the asset.
								</div>
							</div>
							<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE blank line
                 Line 35a Start of Name of Foreign Entity-->
							<div style="width:187mm;font-size:8pt,height:16mm;">
								<div class="styLNLeftLtrBox" style="padding-left:4mm;">a</div>
								<div class="styLNDesc" style="width:178mm;height:10mm;">
									<div class="styLNDesc" style="width:30mm;padding-left:2mm;">
									Name of foreign entity</div>
									<!--<span style="height:4mm;"/>-->
									<div class="styFixedUnderline" style="width:80mm;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="EntityName/BusinessNameLine1Txt"/>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="EntityName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</div>
									<div class="styLNLeftNumBox" style="width:6mm;padding-right:4mm;">b</div>
									<div class="styLNDesc" style="width:22mm;text-align:right;">GIIN (Optional) </div>
									<div class="styBB" style="width:40mm;font-size:8pt;border-top-width: 0px;         border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;float:right;position:absolute;text-align:center">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="GIIN"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                 Line 35a End of Name of Foreign Entity-->
							<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                 Line 35b Start of Type of Foreign Entity-->
							<div style="width:187mm;height:10mm;">
								<div class="styLNLeftLtrBox" style="padding-left:4mm;">c</div>
								<div class="styLNDesc" style="width:35mm;padding-left:2mm;">
				  Type of foreign entity</div>
								<!--PART VI Line 35b (1)  Start of Partnership-->
								<div class="styLNDesc" style="width:35mm;">
									<b>(1)</b>
									<span style="width:5px;"/>
									<input type="Checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="PartnershipInd"/>
											<xsl:with-param name="BackupName">IRS8938OFA-ATMPartnershipInd
							<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:5px;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="PartnershipInd"/>
											<xsl:with-param name="BackupName">IRS8938OFA-ATMPartnershipInd
							<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
						Partnership
					</label>
									<span style="width:5px;"/>
								</div>
								<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                     Line 35b (1) End of Partnership-->
								<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                     Line 35b (2) Start of Corporation-->
								<div class="styLNDesc" style="width:35mm;">
									<b>(2)</b>
									<span style="width:5px;"/>
									<input type="Checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="CorporationInd"/>
											<xsl:with-param name="BackupName">IRS8938OFA-ATMCorporationInd
							<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:5px;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="CorporationInd"/>
											<xsl:with-param name="BackupName">IRS8938OFA-ATMCorporationInd
							<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
						Corporation 
					</label>
									<span style="width:5px;"/>
								</div>
								<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                     Line 35b (2) End of Corporation-->
								<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                     Line 35b (3) Start of Trust-->
								<div class="styLNDesc" style="width:35mm;">
									<b>(3)</b>
									<span style="width:5px;"/>
									<input type="Checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="TrustInd"/>
											<xsl:with-param name="BackupName">IRS8938OFA-ATMTrustInd<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:5px;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="TrustInd"/>
											<xsl:with-param name="BackupName">IRS8938OFA-ATMTrustInd<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
						Trust 
					</label>
									<span style="width:5px;"/>
								</div>
								<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                     Line 35b (3) End of Trust-->
								<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                     Line 35b (4) Start of Estate-->
								<div class="styLNDesc" style="width:35mm;">
									<b>(4)</b>
									<span style="width:5px;"/>
									<input type="Checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="EstateInd"/>
											<xsl:with-param name="BackupName">IRS8938OFA-ATMEstateInd
							<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:5px;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="EstateInd"/>
											<xsl:with-param name="BackupName">IRS8938OFA-ATMEstateInd
							<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
						Estate 
					</label>
								</div>
							</div>
							<!--<br/>-->
							<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                 Line 35b (4) End of Estate-->
							<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                 Line 35c Start of Mailing Address-->
							<div style="width:187mm;">
								<div class="styLNLeftLtrBox" style="padding-left:4mm;">d</div>
								<span style="height:4mm;"/>
								<div class="styLNDesc" style="height:7mm;width:178mm;padding-left:2mm;
				  padding-top:0mm;padding-bottom:0mm;">Mailing address of foreign entity.
				  Number, street, and room or suite no.</div>
								<div style="padding-left:10mm;">
									<div class="styFixedUnderline" style="height:1mm;width:176mm;padding-left:2mm;
								  padding-top:0mm;padding-bottom:0mm;">
								</div>
								</div>
							</div>
							<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                 Line 35c End of Mailing Address-->
							<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                 Line 35e Start of City, State and country-->
							<div style="width:187mm;height:8mm; border-bottom-width:1px;border-left-width: 0px;border-top-width: 0px; border-right-width: 0px;border-style:solid;border-color:black;font-size:8pt;">
								<div class="styLNLeftLtrBox" style="padding-left:4mm;padding-top:1mm">e</div>
								<div class="styLNDesc" style="width:179mm;padding-left:2mm;padding-bottom:0mm;padding-top:1mm">
					City or town, state or province, country, and ZIP or foreign postal code
				</div>
								<div class="styLNDesc" style="width:186mm;padding-left:10mm;">	
				</div>
							</div>
							<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                 Line 35d Start of City, State and country-->
							<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                 Line 36 Start of Report information-->
							<div style="height:auto;width:187mm;">
								<div class="styLNLeftNumBox" style="height:2mm;padding-left:2mm;
			      padding-top:0mm;padding-bottom:0mm;">36</div>
								<div class="styLNDesc" style="width:178mm;padding-left:2mm;height:8mm;
				  padding-top:0mm;padding-bottom:.5mm;">
				  If asset reported on line 29 is not stock of a foreign entity or an 
				  interest in a foreign entity, enter the following information for the asset.
				</div>
								<xsl:choose>
									<xsl:when test="position()=1">
										<div class="styLNDesc" style="height:auto;width:179mm;padding-left:10mm;padding-top:0mm;padding-bottom:0mm;font-style:italic;">
											<b>Note.</b>If this asset has more than one issuer or counterparty, attach a
														 separate statement with the same information for each additional issuer or
														 counterparty (see instructions).
												</div>
									</xsl:when>
								</xsl:choose>
							</div>
							<!--<br/>-->
							<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                 Line 36a Start of Name of Issuer-->
							<div style="width:187mm;padding-bottom:2.5mm;">
								<div class="styLNLeftLtrBox" style="padding-left:4mm;">a</div>
								<div class="styLNDesc" style="width:50mm;padding-left:2mm;">
				  Name of issuer or counterparty
				</div>
								<div class="styFixedUnderline" style="width:127mm;padding-top:2.5mm;"/>
							</div>
							<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
					 Line 36a End of Name of Issuer-->
							<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                     Line 36a  Start of Check if information is for Issuer or Counterparty-->
							<div style="width:187mm;padding-left:10mm;">
								<div class="styLNDesc" style="width:50.5mm;">Check if information is for</div>
								<div class="styLNDesc" style="width:35mm;">
									<input type="Checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="IssuerInd"/>
											<xsl:with-param name="BackupName">IRS8938OFA-ATMIssuerInd
								<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:5px;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="IssuerInd"/>
											<xsl:with-param name="BackupName">IRS8938OFA-ATMIssuerInd
								<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
							Issuer
						</label>
								</div>
								<div class="styLNDesc" style="width:35.5mm;">
									<input type="Checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="CounterpartyInd"/>
											<xsl:with-param name="BackupName">IRS8938OFA-ATMCounterpartyInd
									<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:5px;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="CounterpartyInd"/>
											<xsl:with-param name="BackupName">IRS8938OFA-ATMCounterpartyInd
									<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
							Counterparty
						</label>
								</div>
							</div>
							<br/>
							<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                     Line 36b  Start of Type of Issuer or counterparty-->
							<div style="width:187mm;padding-top:1.5mm;">
								<div class="styLNLeftLtrBox" style="padding-left:4mm;">b</div>
								<div class="styLNDesc" style="width:178mm;padding-left:2mm;">
					  Type of issuer or counterparty</div>
							</div>
							<!--Part VI Line 36b (1)  Start of Individual-->
							<div class="styLNDesc" style="width:187mm;padding-left:10mm;">
								<div class="styLNDesc" style="width:47.3mm;">
									<b>(1)</b>
									<span style="width:5px;"/>
									<input type="Checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="IndividualInd"/>
											<xsl:with-param name="BackupName">IRS8938OFA-ATMIndividualInd
								<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:5px;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="IndividualInd"/>
											<xsl:with-param name="BackupName">IRS8938OFA-ATMIndividualInd
								<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
							Individual
						</label>
								</div>
								<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                         Line 36b (1)  End of Individual-->
								<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                         Line 36b (2)  Start of Partnership-->
								<div class="styLNDesc" style="width:32.5mm;">
									<b>(2)</b>
									<span style="width:5px;"/>
									<input type="Checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="PartnershipInd"/>
											<xsl:with-param name="BackupName">IRS8938OFA-ATMPartnershipInd
								<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:5px;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="PartnershipInd"/>
											<xsl:with-param name="BackupName">IRS8938OFA-ATMPartnershipInd
								<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
							Partnership
						</label>
								</div>
								<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                         Line 36b (2)  End of Partnership-->
								<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                         Line 36b (3)  Start of Corporation-->
								<div class="styLNDesc" style="width:35mm;">
									<b>(3)</b>
									<span style="width:5px;"/>
									<input type="Checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="CorporationInd"/>
											<xsl:with-param name="BackupName">IRS8938OFA-ATMCorporationInd
								<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:5px;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="CorporationInd"/>
											<xsl:with-param name="BackupName">IRS8938OFA-ATMCorporationInd
								<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
							Corporation 
						</label>
								</div>
								<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                         Line 36b (3)  End of Corporation-->
								<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                         Line 36b (4)  Start of Trust-->
								<div class="styLNDesc" style="width:37mm;">
									<b>(4)</b>
									<span style="width:5px;"/>
									<input type="Checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="TrustInd"/>
											<xsl:with-param name="BackupName">IRS8938OFA-ATMTrustInd
								<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:5px;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="TrustInd"/>
											<xsl:with-param name="BackupName">IRS8938OFA-ATMTrustInd
								<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
							Trust 
						</label>
								</div>
								<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                         Line 36b (5)  Start of Estate-->
								<div class="styLNDesc" style="width:25mm;">
									<b>(5)</b>
									<span style="width:4px;"/>
									<input type="Checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="EstateInd"/>
											<xsl:with-param name="BackupName">IRS8938OFA-ATMEstateInd
								<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:4px;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="EstateInd"/>
											<xsl:with-param name="BackupName">IRS8938OFA-ATMEstateInd
								<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
							Estate 
						</label>
								</div>
							</div>
							<br/>
							<br/>
							<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                     Line 36b (5)  End of Estate-->
							<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                     Line 36c  Start of Check if Issuer or Counterparty is US or Foreign-->
							<div style="width:187mm;padding-top:1.5mm;">
								<div class="styLNLeftLtrBox" style="padding-left:4mm;">c</div>
								<div class="styLNDesc" style="width:55mm;padding-left:2mm;">
					 Check if issuer or counterparty is a</div>
								<div class="styLNDesc" style="width:30.5mm;">
									<input type="Checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="USPersonInd"/>
											<xsl:with-param name="BackupName">IRS8938OFA-ATMUSPersonInd
								<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:5px;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="USPersonInd"/>
											<xsl:with-param name="BackupName">IRS8938OFA-ATMUSPersonInd
								<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
							U.S. person
						</label>
								</div>
								<div class="styLNDesc" style="width:40mm;padding-left:2mm;">
									<input type="Checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="ForeignPersonInd"/>
											<xsl:with-param name="BackupName">IRS8938OFA-ATMForeignPersonInd
									<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:5px;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="ForeignPersonInd"/>
											<xsl:with-param name="BackupName">IRS8938OFA-ATMForeignPersonInd
									<xsl:number value="position()"/>
											</xsl:with-param>
										</xsl:call-template>
							Foreign person
						</label>
								</div>
							</div>
							<!--<br/>-->
							<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                     Line 36c  End of Check if Issuer or Counterparty is US or Foreign-->
							<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                     Line 36d  Start of Mailing Address-->
							<div style="width:187mm;padding-top:1.5mm;">
								<div class="styLNLeftLtrBox" style="padding-left:4mm;">d</div>
								<div class="styLNDesc" style="height:7mm;width:179mm;padding-left:2mm;
					  padding-top:0mm;padding-bottom:0mm;">
					  Mailing address of issuer or counterparty. Number, street, and room
					  or suite no.
					</div>
								<div style="padding-left:10mm;">
									<div class="styFixedUnderline" style="height:1mm;width:176mm;padding-left:2mm;
				  padding-top:0mm;padding-bottom:0mm;">
</div>
								</div>
								<!--<div class="styFixedUnderline" style="height:6mm;width:178mm;padding-left:2mm;
					  padding-top:1mm;padding-bottom:0mm;">
					</div>-->
							</div>
							<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                     Line 36d  End of Mailing Address-->
							<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                    Line 36e  Start of City, State or Country-->
							<div style="width:187mm;height:8mm; border-bottom-width:1px; border-left-width: 0px;border-top-width: 0px; border-right-width: 0px;border-style:solid;border-color:black;font-size:8pt;">
								<div class="styLNLeftLtrBox" style="padding-left:4mm;">e</div>
								<div class="styLNDesc" style="width:179mm;padding-left:2mm;padding-bottom:0mm;">
					City or town, state or province, country, and ZIP or foreign postal code
				</div>
								<div class="styLNDesc" style="width:186mm;padding-left:10mm;">	
					</div>
							</div>
							<!--PART VI REPEATING ADDITIONAL TABLE MESSAGE
                 Line 36e  End of City, State or Country-->
						</div>
						<div style="width:187mm;font-size:8pt;text-align:right;">
							<span style="width:150mm;"/>Form 
				<span class="styBoldText" style="font-size:8pt;">8938</span> (Rev. 11-2021)
			</div>
					</xsl:if>
					<!--  FOOTER-->
					<!--<div style="width:187mm;border-top:1px solid black;text-align:right">
         Form <span class="styBoldText" style="font-size:9pt;">8938</span> (12-2013)
    </div>-->
					<xsl:if test="($Print = $Separated)">
						<div class="pageEnd"/>
					</xsl:if>
					<!-- BEGIN Left Over Table -->
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
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Single Producer</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SingleProducer"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
					<!--OPTIONAL SEPARATED PRINT FOR REPEATING DATA TABLE FOR PART V LINES 1 - 9 -->
					<!--PART V SEPARATED PRINT  Start of Foreign Deposit and Custodial Accounts-->
					<div style="font-size:8pt;">
						<xsl:if test="(count($FormData/ForeignFinclAccountGrp) &gt;= 2) and ($Print = $Separated)">
							<span class="styRepeatingDataTitle" style="font-weight:bold; font-size:10pt;">
								Part V Detailed Information for Each Foreign Deposit and Custodial Account Lines 20-28</span>
							<br/>
							<br/>
							<xsl:for-each select="$FormData/ForeignFinclAccountGrp">
								<xsl:choose>
									<xsl:when test="position()>=1">
										<p style="page-break-before: always"/>
										<div style="width:187mm;font-size:8pt;padding-bottom:1mm;border-bottom:1px solid black;">
											<span style="width:150mm;">Form 8938 (Rev. 11-2021)</span>
											<span style="width:19.5mm;"/>Page
											<span class="styFixedUnderline" style="width:10mm; float:none; padding-top:0mm; padding-bottom:0mm;"/>
										</div>
									</xsl:when>
								</xsl:choose>
								<!-- PART V SEPARATED PRINT  BEGIN TITLE -->
								<!--<div class="styBB" style="width:187mm;"/>-->
								<div class="styBB" style="width:187mm;height:8mm;">
									<div class="styPartName" style="font-size:10pt;padding-bottom:5mm;height:5mm;
				  font-family:arial;text-align:center;padding-top:.5mm;">Part V</div>
									<div class="styPartDesc" style="font-size:10pt;padding-left:3mm;float:left;clear:none;width:173mm;">
				  Detailed Information for Each Foreign Deposit and Custodial Account Included in the
				  Part I Summary<span style="font-weight:normal;"> (see instructions)</span>
									</div>
								</div>
								<!-- PART V SEPARATED PRINT  END TITLE -->
								<div class="styBB" style="width:187mm;">
									<div class="styLNDesc" style="width:187mm;height:8mm;">
				 If you have more than one account to report in Part V,  attach an additional statement with
				  the same information for each additional account<span style="font-weight:normal;"> (see instructions)</span>
									</div>
								</div>
								<div class="styBB" style="width:187mm;">
									<!--PART V SEPARATED PRINT  Start of Type Of Account-->
									<div style="width:40mm;float:left;clear:none;">
										<div class="styLNLeftNumBox" style="padding-left:2mm;">20</div>
										<div class="styLNDesc" style="width:30mm;padding-left:2mm;">
						Type of account
					</div>
									</div>
									<div style="width:65mm;float:left;clear:none;">
										<!--PART V SEPARATED PRINT  Start of Deposit Account Type Ind-->
										<b>a</b>
										<span style="width:5px;"/>
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="DepositAccountTypeInd"/>
												<xsl:with-param name="BackupName">IRS8938FFA-SEPDepositAccountTypeInd
									<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="DepositAccountTypeInd"/>
												<xsl:with-param name="BackupName">IRS8938FFA-SEPDepositAccountTypeInd
								<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							Deposit 
						</label>
										<!--PART V SEPARATED PRINT  End of Deposit Account Type Ind-->
										<span style="width:8mm;"/>
										<b>b</b>
										<span style="width:5px;"/>
										<!--PART V SEPARATED PRINT  Start of Custodial Account Type Ind-->
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="CustodialAccountTypeInd"/>
												<xsl:with-param name="BackupName">IRS8938FFA-SEPCustodialAccountTypeInd
								<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="CustodialAccountTypeInd"/>
												<xsl:with-param name="BackupName">IRS8938FFA-SEPCustodialAccountTypeInd
								<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
							Custodial
						</label>
										<!--PART V SEPARATED PRINT  End of Custodial Account Type Ind-->
									</div>
									<!--PART V SEPARATED PRINT  End of Type Of Account-->
									<!--PART V SEPARATED PRINT  Start of Identifying Designation Number-->
									<div style="width:70mm; float:left; clear:none; border-style:solid; border-color:black; border-width:0px 0px 0px 1px; height:15mm;">
										<div class="styLNLeftNumBox" style="width:5mm;text-align:center;float:left; padding-bottom:0mm;">21</div>
										<div class="styLNDesc" style="width:64mm;padding-left:2mm;padding-bottom:0mm;">
											Account number or other designation
										</div>
										<div class="styLNDesc" style="width:64mm; padding-left:7mm; padding-bottom:0mm; padding-top:1mm;" valign="bottom">
											<xsl:choose>
												<xsl:when test="IdentifyingDesignationNum">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="IdentifyingDesignationNum"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/BankAccountNum"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</div>
									</div>
									<!--PART V SEPARATED PRINT  End of Identifying Designation Number-->
								</div>
								<div class="styBB" style="width:187mm; font-size:8pt; padding-bottom:2mm; height:10mm;">
									<div style="width:187mm;">
										<div style="width:38mm; float:left; clear:none; padding-top:1mm;">
											<div class="styLNLeftNumBox" style="padding-left:2mm;">22</div>
											<div class="styLNDesc" style="width:30mm; padding-left:2mm; float:left;">
												Check all that apply
											</div>
										</div>
										<!--PART V SEPARATED PRINT  Start of Account Opened During Tax Year Ind-->
										<div class="styLNDesc" style="width:58mm;padding-left:2mm;">
											<b>a</b>
											<span style="width:1mm;"/>
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="AccountOpenedDuringTaxYearInd"/>
													<xsl:with-param name="BackupName">IRS8938FFA-SEPAccountOpenedDuringTaxYearInd
														<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:1mm;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="AccountOpenedDuringTaxYearInd"/>
													<xsl:with-param name="BackupName">IRS8938FFA-SEPAccountOpenedDuringTaxYearInd
														<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
												Account opened during tax year
											</label>
										</div>
										<!--PART V SEPARATED PRINT  End of Account Opened During Tax Year Ind-->
										<!--PART V SEPARATED PRINT  Start of Account Closed During Tax Year Ind-->
										<div class="styLNDesc" style="width:87mm;padding-left:6mm;">
											<b>b</b>
											<span style="width:1mm;"/>
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="AccountClosedDuringTaxYearInd"/>
													<xsl:with-param name="BackupName">IRS8938FFA-SEPAccountClosedDuringTaxYearInd
								<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:1mm;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="AccountClosedDuringTaxYearInd"/>
													<xsl:with-param name="BackupName">IRS8938FFA-SEPAccountClosedDuringTaxYearInd
								<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
							Account closed during tax year
						</label>
										</div>
										<!--PART V SEPARATED PRINT  End of Account Closed During Tax Year Ind-->
									</div>
									<div style="width:187mm;">
										<div style="width:38mm;float:left;clear: none;"/>
										
										<!--PART V SEPARATED PRINT  Start of Jointly Owned With Spouse Ind-->
										<div class="styLNDesc" style="width:100mm;">
											<span style="padding-right:40mm;"/>
											<b>c</b>
											<span style="width:1mm;"/>
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="JointlyOwnedWithSpouseInd"/>
													<xsl:with-param name="BackupName">IRS8938FFA-SEPJointlyOwnedWithSpouseInd
								<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:1mm;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="JointlyOwnedWithSpouseInd"/>
													<xsl:with-param name="BackupName">IRS8938FFA-SEPJointlyOwnedWithSpouseInd
								<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
							Account jointly owned with spouse
						</label>
										</div>
										<!--PART V SEPARATED PRINT  End of Jointly Owned With Spouse Ind-->
										<!--PART V SEPARATED PRINT  Start of No Tax Item Reported Ind-->
										<div class="styLNDesc" style="width:87mm;padding-left:2mm;">
											<b>d</b>
											<span style="width:1mm;"/>
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="NoTaxItemReportedInd"/>
													<xsl:with-param name="BackupName">IRS8938FFA-SEPNoTaxItemReportedInd
								<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:1mm;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="NoTaxItemReportedInd"/>
													<xsl:with-param name="BackupName">IRS8938FFA-SEPNoTaxItemReportedInd
								<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
							 No tax item reported in Part III with respect to this asset
						</label>
										</div>
										<!--PART V SEPARATED PRINT  End of No Tax Item Reported Ind-->
									</div>
								</div>
								<!--PART V SEPARATED PRINT  Line 4  Start of Max. Account Value During TY Amount-->
								<div class="styBB" style="width:187mm;">
									<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;padding-top:.7mm;
				  padding-bottom:0mm;">23</div>
									<div class="styLNDesc" style="height:4mm;width:146mm;padding-left:2mm;
				  padding-top:.7mm;padding-bottom:0mm;">Maximum value of account during tax year
					<!--Dotted Line-->
										<span class="styDotLn" style="float:none;clear:none;
					  padding-right:1mm;">......................</span>$</div>
									<div class="styLNAmountBoxNB" style="height:2mm;padding-top:.7mm;
				  padding-bottom:0mm;" valign="bottom">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="MaxAccountValueDurTYAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!--PART V SEPARATED PRINT  End of Line 4 Max. Account Value During TY Amount-->
								<!--PART V SEPARATED PRINT  Line 5  Start of Exchange Rate Used Ind-->
								<div class="styBB" style="width:187mm;">
									<div class="styLNLeftNumBox" style="height:5mm;padding-left:2mm;padding-top:1.1mm;
				  padding-bottom:0mm;">24</div>
									<div class="styLNDesc" style="height:5mm;width:178mm;padding-left:2mm;
				  padding-top:0mm;padding-bottom:0mm;">Did you use a foreign currency exchange 
				  rate to convert the value of the account into U.S. dollars?
					<!--Dotted Line-->
										<span class="styDotLn" style="float:none;clear:none;
					  padding-right:1mm;">..</span>
										<!--PART V SEPARATED PRINT  Start of Exchange Rate Used Ind "Yes"-->
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/ExchangeRateUsedInd"/>
											</xsl:call-template>
											<input type="Checkbox" alt="Exchange Rate Used Indicator Yes" class="styCkbox">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/ExchangeRateUsedInd"/>
													<xsl:with-param name="BackupName">IRS8938FFAExchangeRateUsedInd
									<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<span>
											<span style="width:5px;"/>
											<label>
												<xsl:call-template name="PopulateLabelYes">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/ExchangeRateUsedInd"/>
													<xsl:with-param name="BackupName">IRS8938FFA-SEPExchangeRateUsedInd
									<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
							Yes
						</label>
										</span>
										<span style="width:10px;padding-left:5px;">
											<!--PART V SEPARATED PRINT  End of Exchange Rate Used Ind "Yes"-->
											<!--<span style="width:10px;"/> -->
											<!--PART V SEPARATED PRINT Start of Exchange Rate Used Ind No"-->
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/ExchangeRateUsedInd"/>
											</xsl:call-template>
											<input type="Checkbox" alt="Exchange Rate Used Indicator No" class="styCkbox">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/ExchangeRateUsedInd"/>
													<xsl:with-param name="BackupName">IRS8938FFAExchangeRateUsedInd
									<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<span>
											<span style="width:18px;"/>
											<label>
												<xsl:call-template name="PopulateLabelNo">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp/ExchangeRateUsedInd"/>
													<xsl:with-param name="BackupName">IRS8938FFAExchangeRateUsedInd
									<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
							No
						</label>
										</span>
										<!--PART V SEPARATED PRINT  End of Exchange Rate Used Ind "No"-->
									</div>
								</div>
								<!--PART V SEPARATED PRINT  Line 5  End of Exchange Rate Used Ind-->
								<!--PART V SEPARATED PRINT  Line 6  Start of If you answered yes to line 5,
                 complete all that apply-->
								<div class="styBB" style="width:187mm;">
									<div class="styLNLeftNumBox" style="height:5mm;padding-left:2mm;
				   padding-top:.7mm;padding-bottom:0mm;">25</div>
									<div class="styLNDesc" style="height:5mm;width:178mm;padding-left:2mm;
				  padding-top:.7mm;padding-bottom:0mm;">If you answered "Yes" to line 5, 
				  complete all that apply.
				</div>
								</div>
								<table class="styBB" id="IRS8938Table" summary="Foreign currency [header]" cellspacing="0" cellpadding="0" style="width:187mm;">
									<tr>
										<!--PART V SEPARATED PRINT  Line 6(1)  Start of Foreign Currency
                         Description Text-->
										<th class="styLimitationHeading" style="width:52mm;padding-left:10mm;
					  border-right:solid black 1px;font-size:8pt;text-align:left" scope="col">
											<span style="font-weight:normal;">
												<span class="styBoldText">(a)</span>
						  Foreign currency in which<br/>account is maintained<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCurrencyDesc"/>
													<xsl:with-param name="BackupName">IRS8938FFA-RForeignCurrencyDescTxt</xsl:with-param>
												</xsl:call-template>
											</span>
										</th>
										<!--PART V SEPARATED PRINT  Line 6(1)  End of Foreign Currency
                         Description Text-->
										<!--PART V SEPARATED PRINT  Line 6(2)  Start of Exchange Rate Used-->
										<th class="styLimitationHeading" style="width:67mm;font-size:8pt;
					  vertical-align:top;padding-left:2mm;text-align:left" scope="col">
											<span style="font-weight:normal;">
												<b>(b)</b>
						  Foreign currency exchange rate used<br/>to convert to U.S. dollars<br/>
												<span style="padding-left:.5mm">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ExchangeRt"/>
														<xsl:with-param name="BackupName">IRS8938FFA-RExchangeRateUsed</xsl:with-param>
													</xsl:call-template>
												</span>
											</span>
										</th>
										<!--PART V SEPARATED PRINT  Line 6(2)  End of Exchange Rate Used-->
										<!--PART V SEPARATED PRINT  Line 6(3)  Start of Source  Of Exchange
                         Rate Used Text-->
										<th class="styLimitationHeading" style="width:68mm;font-size:8pt;
					  border-left:solid black 1px;vertical-align:top;padding-left:2mm;text-align:left" scope="col">
											<span style="font-weight:normal">
												<span class="styBoldText">(c) </span>
						  Source of exchange rate used if not from<br/>
						  U.S. Treasury Department's Bureau of the Fiscal Service<br/>
												<span style="font-size:8pt">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="SourceOfExchangeRateUsedTxt"/>
														<xsl:with-param name="BackupName">IRS8938FFA-RSourceOfExchangeRateUsedTxt
									</xsl:with-param>
													</xsl:call-template>
												</span>
											</span>
										</th>
										<!--PART V SEPARATED PRINT  Line 6(3)  End of Source Of Exchange
                         Rate Used Text-->
									</tr>
								</table>
								<!--PART V SEPARATED PRINT  Line 6  End of If you answered yes to line 5,
                 complete all that apply-->
								<!--PART V SEPARATED PRINT  Line 35a blue table  
                 Start of Foreign Deposit and Custodial Accounts Business Name-->
								<div class="styBB" style="width:187mm;font-size:8pt;">
									<div class="styLNLeftNumBox" style="height:12mm;padding-left:2mm;padding-top:0mm;
				  padding-bottom:0mm;">26a</div>
									<div class="styLNDesc" style="width:98mm;height:18mm;padding-left:2mm;padding-top:0mm;
				  padding-bottom:0mm;">Name of financial institution in which account is maintained
							    <br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
										</xsl:call-template>
										<xsl:if test="BusinessName/BusinessNameLine2Txt">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</xsl:if>
									</div>
									<div class="styLNRightNumBoxNBB" style="border-left-width:0px;width:6mm;padding-left:0mm;float:left">b</div>
									<div class="styLNDesc" style="width:74mm;float:right;">Global Intermediary Identification Number (GIIN) (Optional) 
							<div class="styBB" style="width:187mm;font-size:8pt;border-top-width: 0px;         border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="GIIN"/>
											</xsl:call-template>
										</div>
									</div>
									<div class="styFixedUnderline" style="width:53mm;text-align:right;background-color:back;border-bottom-width: 0px;"/>
								</div>
								<!--PART V SEPARATED PRINT  Line 7  
                End of Foreign Deposit and Custodial Accounts Business Name-->
								<!--PART V SEPARATED PRINT  Line 8  Mailing Address-->
								<div class="styBB" style="width:187mm;height:15mm;">
									<div class="styLNLeftNumBox" style="padding-left:2mm;padding-top:0mm;
				  padding-bottom:0mm;">27</div>
									<div class="styLNDesc" style="width:178mm;padding-left:2mm;
				  padding-top:0mm;padding-bottom:0mm;">
				  Mailing address of financial institution in which account is maintained. 
				  Number, street, and room or suite no.
				</div>
									<div class="styLNDesc" style="width:178mm;padding-top:1mm;
				  padding-left:10mm;height:25mm;" valign="bottom">
										<!--PART V SEPARATED PRINT  Start of Foreign Deposit and Custodial
                         Accounts US Address-->
										<xsl:if test="USAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="USAddress/AddressLine1Txt"/>
												<xsl:with-param name="BackupName">IRS8938FFA-SEPUSAddressLine1</xsl:with-param>
											</xsl:call-template>
											<xsl:if test="USAddress/AddressLine2Txt">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="USAddress/AddressLine2Txt"/>
													<xsl:with-param name="BackupName">IRS8938FFA-SEPUSAddressLine2</xsl:with-param>
												</xsl:call-template>
											</xsl:if>
										</xsl:if>
										<!--PART V SEPARATED PRINT  End of Foreign Deposit and Custodial
                         Accounts US Address-->
										<!--PART V SEPARATED PRINT  Start of Foreign Deposit and Custodial
                         Accounts Foreign Address-->
										<xsl:if test="ForeignAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1Txt"/>
												<xsl:with-param name="BackupName">IRS8938FFA-SEPForeignAddressLine1
								</xsl:with-param>
											</xsl:call-template>
											<xsl:if test="ForeignAddress/AddressLine2Txt">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2Txt"/>
													<xsl:with-param name="BackupName">IRS8938FFA-SEPForeignAddressLine2
									</xsl:with-param>
												</xsl:call-template>
											</xsl:if>
										</xsl:if>
										<!--PART V SEPARATED PRINT  End of Foreign Deposit and Custodial 
                        Accounts Foreign Address-->
									</div>
								</div>
								<!--PART V SEPARATED PRINT  Line 8  End of Mailing Address-->
								<!--PART V SEPARATED PRINT  Line 9  Start of City, State and Country-->
								<div class="styBB" style="width:187mm;height:15mm;">
									<div class="styLNLeftNumBox" style="padding-left:2mm;padding-top:0mm;
				  padding-bottom:0mm;">28</div>
									<div class="styLNDesc" style="width:178mm;padding-left:2mm;
				  padding-top:0mm;padding-bottom:0mm;">
				  City or town, state or province, country, and ZIP or foreign postal code </div>
									<div class="styLNDesc" style="width:186mm;
				  padding-left:10mm;">
										<!--PART V SEPARATED PRINT  Start of Foreign Deposit and Custodial 
                         Accounts US Address City, State, and Zip Code-->
										<xsl:if test="USAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="USAddress/CityNm"/>
												<xsl:with-param name="BackupName">IRS8938FFA-SEPUSAddressCity</xsl:with-param>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="USAddress/StateAbbreviationCd"/>
												<xsl:with-param name="BackupName">IRS8938FFA-SEPUSAddressState</xsl:with-param>
											</xsl:call-template>,
						<span style="width:2px;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="USAddress/ZIPCd"/>
												<xsl:with-param name="BackupName">IRS8938FFA-SEPUSAddressZip</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<!--End of Part V Foreign Deposit and Custodial Accounts US Address City,
                         State, and Zip Code-->
										<xsl:if test="ForeignAddress">
											<!--Start of Part V Foreign Deposit and Custodial Accounts Foreign
                             Address City, ProvinceOrStateNm, ForeignPostalCd, and Country-->
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignAddress/CityNm"/>
												<xsl:with-param name="BackupName">IRS8938FFA-SEPForeignAddressCity</xsl:with-param>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrStateNm"/>
												<xsl:with-param name="BackupName">IRS8938FFA-SEPForeignAddressProvinceOrStateNm
							</xsl:with-param>
											</xsl:call-template>,
						<span style="width:2px;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignAddress/CountryCd"/>
												<xsl:with-param name="BackupName">IRS8938FFA-SEPForeignAddressCountryCd
							</xsl:with-param>
											</xsl:call-template>,
						<span style="width:2px;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignAddress/ForeignPostalCd"/>
												<xsl:with-param name="BackupName">IRS8938FFA-SEPForeignAddressPostalCd
							</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<!--PART V SEPARATED PRINT  End of Foreign Deposit and Custodial
                         Accounts Foreign Address City, ProvinceOrStateNm, ForeignPostalCd, and Country-->
									</div>
								</div>
								<!--PART V SEPARATED PRINT  Line 9  End of City, State and Country-->
								<!--PART V SEPARATED PRINT  FOOTER-->
								<div style="width:187mm;font-size:8pt;">
									<span style="font-size:8pt;width:135mm;"/>
									<span style="width:18.5mm;"/>Form 
					<span class="styBoldText" style="font-size:8pt;">8938</span> (Rev. 11-2021)
						</div>
								<div class="pageEnd" style="width:187mm;border-top:0px solid black;">
          	</div>
							</xsl:for-each>
						</xsl:if>
					</div>
					<!--PART V SEPARATED PRINT  End of Foreign Deposit and Custodial Accounts-->
					<!--OPTIONAL SEPARATED PRINT FOR REPEATING DATA TABLE 
         FOR PART VI LINES 1-8 -->
					<!--PART VI SEPARATED PRINT  Start of Other Foreign Assets (see instructions)-->
					<div style="font-size:8pt">
						<xsl:if test="(count($FormData/OtherForeignAssetGrp) &gt;= 2) and ($Print = $Separated)">
							<span class="styRepeatingDataTitle" style="font-weight:bold;font-size:10pt;
		  ">Part VI Detailed Information for Each
		  "Other Foreign Asset" Lines 29-36</span>
							<br/>
							<br/>
							<xsl:for-each select="$FormData/OtherForeignAssetGrp">
								<xsl:choose>
									<xsl:when test="position()>=1">
										<p style="page-break-before: always"/>
										<div style="width:187mm;padding-bottom:1mm;font-size:8pt;border-bottom:1px solid black">
											<span style="width:150mm;">Form 8938 (Rev. 11-2021)</span>
											<span style="width:19.5mm;"/>Page 
						<span class="styFixedUnderline" style="width:10mm;float:none;
						  padding-top:0mm;padding-bottom:0mm;"/>
										</div>
									</xsl:when>
								</xsl:choose>
								<!-- PART VI SEPARATED PRINT  BEGIN TITLE -->
								<!--<div class="styBB" style="width:187mm"/>-->
								<div class="styBB" style="width:187mm;">
									<div class="styPartName" style="font-size:10pt;padding-bottom:.5mm;
				  font-family:arial;text-align:center">Part VI</div>
									<div class="styPartDesc" style="font-size:10pt;padding-left:3mm;
				  float:left;clear:none;width:173mm;">
			      Detailed Information for Each "Other Foreign Asset" Included in the 
			      Part II Summary<span style="font-weight:normal;width:28.8mm;padding-left:1mm;">(see instructions)</span>
									</div>
								</div>
								<!-- PART VI SEPARATED PRINT  END TITLE -->
								<!--<div class="styBB" style="width:187mm;">
									<div class="styLNDesc" style="width:187mm;padding-left:2mm;padding-top:0mm;
				  padding-bottom:0mm;">
										<b></b>
										<i></i>
									</div>
								</div>-->
								<div class="styBB" style="width:187mm;height:5mm;padding-top:1mm;padding-bottom:1mm;">
									<div class="styLNDesc" style="width:187mm;padding-left:0mm;padding-top:0mm;
				  padding-bottom:0mm;">If you have more than one asset to report in Part VI,  attach a 
				  continuation statement for each additional asset (see instructions).</div>
								</div>
								<table class="styBB" id="IRS8938Table3" summary="Asset [header]" cellspacing="0" cellpadding="0" style="width:187mm;">
									<tr>
										<!--PART VI  SEPARATED PRINT  Line 29  Start of Asset Description-->
										<th style="width:110mm;font-size:8pt; border-right:solid black 1px;vertical-align:top;padding-left:2mm;text-align:left" scope="col">
											<div class="styLNLeftNumBox" style="padding-left:0mm;width:4mm;padding-top:0mm;">29</div>
											<div style="font-weight:normal;padding-left:4mm">Description of asset</div>
											<br/>
											<div style="padding-left:8mm;font-weight:normal;font-size:8pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AssetDesc"/>
													<xsl:with-param name="BackupName">IRS8938OFAAssetDesc</xsl:with-param>
												</xsl:call-template>
											</div>
										</th>
										<!--PART VI  SEPARATED PRINT  Line 29  End of Asset Description-->
										<!--PART VI  SEPARATED PRINT  Line 30  Start of Identifying Designation Number-->
										<th style="width:70mm;font-size:8pt; border-left:solid black 0px;vertical-align:top;padding-left:2mm;text-align:left" scope="col">
											<div class="styLNLeftNumBox" style="width:5mm;padding-top:0mm;padding-left:0mm;">30</div>
											<div style="font-weight:normal;">Identifying number or other designation</div>
											<br/>
											<div style="padding-left:5mm;font-weight:normal;font-size:8pt;">
												<xsl:choose>
													<xsl:when test="$FormData/OtherForeignAssetGrp/IdentifyingDesignationNum">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="IdentifyingDesignationNum"/>
															<xsl:with-param name="BackupName">IRS8938OFAIdentifyingDesignationNum
											</xsl:with-param>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="BankAccountNum"/>
															<xsl:with-param name="BackupName">IRS8938OFABankAccountNum</xsl:with-param>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</div>
										</th>
										<!--PART VI  SEPARATED PRINT  Line 30  End of Identifying Designation Number-->
									</tr>
								</table>
								<!--PART VI  SEPARATED PRINT  Line 30  End of Identifying Designation Number-->
								<!--PART VI SEPARATED PRINT  Line 31  Start of Complete all that apply-->
								<div class="styBB" style="width:187mm;height:20mm;">
									<div style="width:187mm;float:left;clear:none;">
										<div class="styLNLeftNumBox" style="padding-left:2mm;">31</div>
										<div class="styLNDesc" style="width:146.5mm;padding-left:2mm;">
					  Complete all that apply. See instructions for reporting of multiple acquisition 
					  or disposition dates.
					</div>
									</div>
									<!--PART VI SEPARATED PRINT  Line 31a  Start of Date Acquired-->
									<div style="width:187mm;">
										<div class="styLNLeftLtrBox" style="padding-left:4mm;">a</div>
										<div class="styLNDesc" style="width:144mm;padding-left:2mm;">
						Date asset acquired during tax year, if applicable
					<span class="styDotLn" style="float:none;clear:none;
					  padding-left:2mm;">.................</span>
										</div>
										<div class="styFixedUnderline" style="height:4mm;padding-left:2mm;width:35mm">
											<xsl:if test="AcquiredDt">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="AcquiredDt"/>
													<xsl:with-param name="BackupName">IRS8938OFA-SEPDateAcquiredMonth</xsl:with-param>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="AcquiredDateVariousCd">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AcquiredDateVariousCd"/>
													<xsl:with-param name="BackupName">IRS8938OFAAcquiredDateVariousCd</xsl:with-param>
												</xsl:call-template>
											</xsl:if>
										</div>
									</div>
									<!--PART VI SEPARATED PRINT  Line 31a  End of Date Acquired-->
									<!--PART VI SEPARATED PRINT  Line 31b  Start of Disposed Of Date-->
									<div style="width:187mm;">
										<div class="styLNLeftLtrBox" style="padding-left:4mm;">b</div>
										<div class="styLNDesc" style="width:144mm;padding-left:2mm;">
						Date asset disposed of during tax year, if applicable
					<span class="styDotLn" style="float:none;clear:none;
					  padding-left:2mm;">................</span>
										</div>
										<div class="styFixedUnderline" style="height:4mm;padding-left:2mm;width:35mm">
											<xsl:if test="DisposedOfDt">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="DisposedOfDt"/>
													<xsl:with-param name="BackupName">IRS8938OFA-SEPDisposedOfDtMonth</xsl:with-param>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="DisposedOfDateVariousCd">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DisposedOfDateVariousCd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-RDisposedOfDateVariousCd</xsl:with-param>
												</xsl:call-template>
											</xsl:if>
										</div>
									</div>
									<!--PART VI SEPARATED PRINT  Line 31b  End of Disposed Of Date-->
									<!--PART VI SEPARATED PRINT  Line 31c  Start of Jointly Owned With Spouse Ind-->
									<div style="width:187mm;">
										<div class="styLNLeftLtrBox" style="padding-left:4mm;">c</div>
										<div class="styLNDesc" style="width:76mm;padding-left:1mm;">
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="JointlyOwnedWithSpouseInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-SEPJointlyOwnedWithSpouseInd
								<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:1px;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="JointlyOwnedWithSpouseInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-SEPJointlyOwnedWithSpouseInd
								<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
							Check if asset jointly owned with spouse
						</label>
										</div>
										<!--PART VI SEPARATED PRINT  Line 31c  End of Jointly Owned With Spouse Ind-->
										<!--PART VI SEPARATED PRINT  Line 31d  Start of No Tax Item Reported Ind-->
										<div class="styLNDesc" style="width:102mm;">
											<b>d</b>
											<span style="width:5px;"/>
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="NoTaxItemReportedInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-SEPNoTaxItemReportedInd
								<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:1px;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="NoTaxItemReportedInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-SEPNoTaxItemReportedInd
								<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
							Check if no tax item reported in Part III with respect to this asset
						</label>
										</div>
									</div>
								</div>
								<!--PART VI SEPARATED PRINT  Line 31d  End of No Tax Item Reported Ind-->
								<!--PART VI SEPARATED PRINT  Line 32  Start of Maximum value of asset
                 during tax year-->
								<div class="styBB" style="width:187mm;height:16mm;">
									<div style="width:187mm;float:left;clear:none;">
										<div class="styLNLeftNumBox" style="padding-left:2mm;">32</div>
										<div class="styLNDesc" style="width:146.5mm;padding-left:2mm;">
						Maximum value of asset during tax year (check box that applies)
					</div>
									</div>
									<!--PART VI SEPARATED PRINT  Line 32a  Start of Max. Value 
                    During TY 0 To 50000 Ind-->
									<div style="width:187mm;height:5mm;">
										<div class="styLNLeftLtrBox" style="padding-left:4mm;">a</div>
										<div class="styLNDesc" style="width:35mm;padding-left:1mm;">
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="MaxValueDuringTY0To50000Ind"/>
													<xsl:with-param name="BackupName">IRS8938OFA-SEPMaxValueDuringTY0To50000Ind
								<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:5px;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="MaxValueDuringTY0To50000Ind"/>
													<xsl:with-param name="BackupName">IRS8938OFA-SEPMaxValueDuringTY0To50000Ind
								<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
							$0 - $50,000
						</label>
										</div>
										<!--PART VI SEPARATED PRINT  Line 32a  End of Max. Value
                         During TY 0 To 50000 Ind-->
										<!--PART VI SEPARATED PRINT  Line 32b  Start of Max. Value
                         During TY 50001 To 100000 Ind-->
										<div class="styLNDesc" style="width:45mm;padding-left:2mm;">
											<b>b</b>
											<span style="width:5px;"/>
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="MaxValueDurTY50001To100000Ind"/>
													<xsl:with-param name="BackupName">IRS8938OFA-SEPMaxValueDurTY50001To100000Ind
								<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:5px;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="MaxValueDurTY50001To100000Ind"/>
													<xsl:with-param name="BackupName">IRS8938OFA-SEPMaxValueDurTY50001To100000Ind
								<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
							$50,001 - $100,000
						</label>
										</div>
										<!--PART VI SEPARATED PRINT  Line 32b  End of Max. Value
                        During TY 50001 To 100000 Ind-->
										<!--PART VI SEPARATED PRINT  Line 32c  Start of Max. Value
                        During TY 100001 To 150000 Ind-->
										<div class="styLNDesc" style="width:50mm;padding-left:2mm;">
											<b>c</b>
											<span style="width:5px;"/>
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="MaxValueDurTY100001To150000Ind"/>
													<xsl:with-param name="BackupName">IRS8938OFA-SEPMaxValueDurTY100001To150000Ind
								<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:5px;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="MaxValueDurTY100001To150000Ind"/>
													<xsl:with-param name="BackupName">IRS8938OFA-SEPMaxValueDurTY100001To150000Ind
								<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
							$100,001 - $150,000
						</label>
										</div>
										<!--PART VI SEPARATED PRINT  Line 32c  End of Max. Value 
                         During TY 100001 To 150000 Ind-->
										<!--PART VI SEPARATED PRINT  Line 32d  Start of Max. Value 
                         During TY 150001 To 200000 Ind-->
										<div class="styLNDesc" style="width:45mm;padding-left:2mm;">
											<b>d</b>
											<span style="width:5px;"/>
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="MaxValueDurTY150001To200000Ind"/>
													<xsl:with-param name="BackupName">IRS8938OFA-SEPMaxValueDurTY150001To200000Ind
								<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:5px;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="MaxValueDurTY150001To200000Ind"/>
													<xsl:with-param name="BackupName">IRS8938OFA-SEPMaxValueDurTY150001To200000Ind
								<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
							$150,001 - $200,000
						</label>
										</div>
									</div>
									<!--PART VI SEPARATED PRINT  Line 32d  End of Max. Value
                     During TY 150001 To 200000 Ind-->
									<!--PART VI SEPARATED PRINT  Line 32e  Start of Max. Value 
                    During TY More Max. Amount-->
									<div style="width:187mm;">
										<div class="styLNLeftNumBox" style="height:2mm;padding-left:4mm;
					  padding-top:0mm;padding-bottom:0mm;">e</div>
										<div class="styLNDesc" style="height:2mm;width:146mm;padding-left:2mm;
					  padding-top:0mm;padding-bottom:0mm;">If more than $200,000, list value
						<!--Dotted Line-->
											<span class="styDotLn" style="float:none;clear:none;
						  padding-right:1mm;">......................</span>$</div>
										<div class="styLNAmountBoxNB" style="height:2mm;padding-top:0mm;
					  padding-bottom:0mm;" valign="bottom">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="MaxValueDurTYMoreMaxAmt"/>
												<xsl:with-param name="BackupName">IRS8938OFA-SEPMaxValueDurTYMoreMaxAmt
							</xsl:with-param>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<!--PART VI SEPARATED PRINT  Line 32e  End of Max. Value 
                 During TY More Max. Amount-->
								<!--PART VI SEPARATED PRINT  Line 33  Start of Exchange Rate used-->
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style="height:5m;padding-left:2mm;
				  padding-top:1.3mm;padding-bottom:0mm;">33</div>
									<div class="styLNDesc" style="height:5mm;width:178mm;padding-left:2mm;
				  padding-top:0mm;padding-bottom:0mm;">Did you use a foreign currency 
				  exchange rate to convert the value of the asset into U.S. dollars?
					<!--Dotted Line-->
										<span class="styDotLn" style="float:none;clear:none;
					  padding-right:1mm;">...</span>
										<!--PART VI SEPARATED PRINT  Start of Exchange Rate Used Ind "Yes"-->
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/ExchangeRateUsedInd"/>
											</xsl:call-template>
											<input type="Checkbox" alt="Exchange Rate Used Indicator Yes" class="styCkbox">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/ExchangeRateUsedInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-SEPExchangeRateUsedInd
									<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<span>
											<span style="width:5px;"/>
											<label>
												<xsl:call-template name="PopulateLabelYes">
													<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/ExchangeRateUsedInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-SEPExchangeRateUsedInd
									<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
							Yes
						</label>
										</span>
										<span style="padding-left:5px;">
											<!--PART VI SEPARATED PRINT  End of Exchange Rate Used Ind "Yes"-->
											<!--<span style="width:5px;"/>  -->
											<!--PART VI SEPARATED PRINT  Start of Exchange Rate Used Ind "No"-->
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/ExchangeRateUsedInd"/>
											</xsl:call-template>
											<input type="Checkbox" alt="Exchange Rate Used Indicator No" class="styCkbox">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/ExchangeRateUsedInd"/>
													<xsl:with-param name="BackupName">RS8938OFA-SEPExchangeRateUsedInd
									<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<span>
											<span style="width:5px;"/>
											<label>
												<xsl:call-template name="PopulateLabelNo">
													<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/ExchangeRateUsedInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-SEPExchangeRateUsedInd
								<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
							No
						</label>
										</span>
										<!--PART VI SEPARATED PRINT  End of Exchange Rate Used Ind "No"-->
									</div>
								</div>
								<!--<br/>-->
								<!--PART VI SEPARATED PRINT  End of Other Foreign Assets Lines 29 thru 33-->
								<!--PART VI SEPARATED PRINT  Start of Other Foreign Assets (continued)
                 Lines 34 thru 34-->
								<!--PART VI SEPARATED PRINT  Line 34  Start of If you answered "Yes" to line 33,
                 complete all that apply-->
								<div style="width:187mm;float:left;clear:none;border-style:solid;border-color:black;
			   border-width: 1px 0px 1px 0px;height:6mm;">
									<div class="styLNLeftNumBox" style="padding-left:2mm;padding-top:.7mm;
				  height:4mm">34</div>
									<div class="styLNDesc" style="width:146.5mm;padding-left:2mm;padding-top:.7mm;
				  height:4mm;">If you answered "Yes" to line 33, complete all that apply.
				</div>
								</div>
								<table class="styBB" id="IRS8938Table" summary="Foreign currency [header]" cellspacing="0" cellpadding="0" style="width:187mm;">
									<tr>
										<!--PART VI SEPARATED PRINT  Line 34(1)  Start of Foreign Currency
                         Description Text-->
										<th class="styLimitationHeading" style="width:52mm;padding-left:10mm;
					  border-right:solid black 1px;font-size:8pt;text-align:left" scope="col">
											<span style="font-weight:normal;">
												<span class="styBoldText">(a)</span>
						  Foreign currency in which<br/>asset is denominated<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCurrencyDesc"/>
													<xsl:with-param name="BackupName">IRS8938OFA-SEPForeignCurrencyDescTxt
								</xsl:with-param>
												</xsl:call-template>
											</span>
										</th>
										<!--PART VI SEPARATED PRINT  Line 34(1)  End of Foreign Currency
                         Description Text-->
										<!--PART VI SEPARATED PRINT  Line 34(2) Start of Exchange Rate Used-->
										<th class="styLimitationHeading" style="width:67mm;font-size:8pt;
					  vertical-align:top;padding-left:2mm;text-align:left" scope="col">
											<span style="font-weight:normal;">
												<b>(b)</b>
						  Foreign currency exchange rate used<br/>to convert to U.S. dollars<br/>
												<span style="padding-left:.5mm">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ExchangeRt"/>
														<xsl:with-param name="BackupName">IRS8938OFA-SEPExchangeRateUsed</xsl:with-param>
													</xsl:call-template>
												</span>
											</span>
										</th>
										<!--PART VI SEPARATED PRINT  Line 34(2)  End of Exchange Rate Used-->
										<!--PART VI SEPARATED PRINT  Line 34(3)  Start of Source Of Exchange 
                         Rate Used Text-->
										<th class="styLimitationHeading" style="width:68mm;font-size:8pt;
					  border-left:solid black 1px;vertical-align:top;padding-left:2mm;text-align:left" scope="col">
											<span style="font-weight:normal">
												<span class="styBoldText">(c) </span>
						  Source of exchange rate used if not from<br/>
						  U.S. Treasury Department's Bureau of the Fiscal Service<br/>
												<span style="font-size:8pt">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="SourceOfExchangeRateUsedTxt"/>
														<xsl:with-param name="BackupName">IRS8938OFA-SEPSourceOfExchangeRateUsedTxt
									</xsl:with-param>
													</xsl:call-template>
												</span>
											</span>
										</th>
										<!--PART VI SEPARATED PRINT  Line 34(3)  End of Source Of Exchange
                         Rate Used Text-->
									</tr>
								</table>
								<!--PART VI SEPARATED PRINT  Line 35a  Start of Name of Foreign Entity-->
								<div style="width:187mm;font-size:9pt;height:8mm;">
									<div class="styLNLeftNumBox" style="padding-left:1.75mm;
				  padding-top:0mm;padding-bottom:0mm;">35</div>
									<div class="styLNDesc" style="height:35mm;width:178mm;padding-left:2mm;
				  padding-top:0mm;padding-bottom:0mm;">
				  If asset reported on line 29 is stock of a foreign entity or an interest in a 
				  foreign entity, enter the following information for the asset.
				</div>
								</div>
								<div style="width:187mm;font-size:9pt;height:16mm;">
									<div class="styLNLeftLtrBox" style="padding-left:4mm;">a</div>
									<div class="styLNDesc" style="width:178mm;height:20mm;">
										<div class="styLNDesc" style="width:35mm;padding-left:2mm;">
									Name of foreign entity</div>
										<!--<span style="height:4mm;"/>-->
										<div class="styFixedUnderline" style="width:80mm;padding-left:2mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="EntityName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="EntityName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</div>
										<div class="styLNLeftNumBox" style="width:6mm;padding-right:4mm;">b</div>
										<div class="styLNDesc" style="width:22mm;text-align:right;">GIIN (Optional) </div>
										<div class="styBB" style="width:40mm;font-size:8pt;border-top-width: 0px;         border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;float:right;position:absolute;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="GIIN"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<!--PART VI SEPARATED PRINT  Line 35a  End of Name of Foreign Entity-->
								<!--PART VI SEPARATED PRINT  Line 35b  Start of Type of Foreign Entity-->
								<div style="width:187mm;padding-top:2.5mm;">
									<div class="styLNLeftLtrBox" style="padding-left:4mm;">c</div>
									<div class="styLNDesc" style="width:35mm;padding-left:2mm;">
				  Type of foreign entity</div>
									<!--Part II Line 35b (1)  Start of Partnership-->
									<div class="styLNDesc" style="width:35mm;">
										<b>(1)</b>
										<span style="width:5px;"/>
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="PartnershipInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-SEPPartnershipInd
							<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="PartnershipInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-SEPPartnershipInd
							<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
						Partnership
					</label>
										<span style="width:5px;"/>
									</div>
									<!--PART VI SEPARATED PRINT  Line 35b (1)  End of Partnership-->
									<!--PART VI SEPARATED PRINT  Line 35b (2)  Start of Corporation-->
									<div class="styLNDesc" style="width:35mm;">
										<b>(2)</b>
										<span style="width:5px;"/>
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="CorporationInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-SEPCorporationInd
							<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="CorporationInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-SEPCorporationInd
							<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
						Corporation 
					</label>
										<span style="width:5px;"/>
									</div>
									<!--PART VI SEPARATED PRINT  Line 35b (2)  End of Corporation-->
									<!--PART VI SEPARATED PRINT  Line 35b (3)  Start of Trust-->
									<div class="styLNDesc" style="width:35mm;">
										<b>(3)</b>
										<span style="width:5px;"/>
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="TrustInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-SEPTrustInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="TrustInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-SEPTrustInd<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
						Trust 
					</label>
										<span style="width:5px;"/>
									</div>
									<!--PART VI SEPARATED PRINT  Line 35b (3)  End of Trust-->
									<!--PART VI SEPARATED PRINT  Line 35b (4)  Start of Estate-->
									<div class="styLNDesc" style="width:35mm;">
										<b>(4)</b>
										<span style="width:5px;"/>
										<input type="Checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="EstateInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-SEPEstateInd
							<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:5px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="EstateInd"/>
												<xsl:with-param name="BackupName">IRS8938OFA-SEPEstateInd
							<xsl:number value="position()"/>
												</xsl:with-param>
											</xsl:call-template>
						Estate 
					</label>
									</div>
								</div>
								<!--PART VI SEPARATED PRINT  Line 35b (4)  End of Estate-->
								<!--PART VI SEPARATED PRINT  Line 35d  Start of Mailing Address-->
								<div style="width:187mm;padding-top:2mm;">
									<div class="styLNLeftLtrBox" style="padding-left:4mm;">d</div>
									<span style="height:4mm;"/>
									<div class="styLNDesc" style="height:13mm;width:178mm;padding-left:2mm;
				  padding-top:0mm;padding-bottom:0mm;">Mailing address of foreign entity.
				  Number, street, and room or suite no.
								<br/>
										<xsl:if test="USAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="USAddress/AddressLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="USAddress/AddressLine2Txt">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="USAddress/AddressLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:if>
										<xsl:if test="ForeignAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="ForeignAddress/AddressLine2Txt">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:if>
										<div class="styFixedUnderline" style="width:179mm;padding-left:2mm;padding-top:0mm;padding-bottom:0mm;"> 		
										</div>
									</div>
								</div>
								<!--PART VI SEPARATED PRINT  Line 35c  End of Mailing Address-->
								<!--PART VI SEPARATED PRINT  Line 35e  Start of City, State and country-->
								<div style="width:187mm;border-style:solid;border-color:black;padding-top:0mm;height:15mm;
			  border-width: 0px 0px 1px 0px;">
									<div class="styLNLeftLtrBox" style="padding-left:4mm;padding-top:0mm">e</div>
									<div class="styLNDesc" style="width:178mm;padding-left:2mm;
				  padding-bottom:0mm;padding-top:1mm;">
					City or town, state or province, country and ZIP or foreign postal code</div>
									<div class="styLNDesc" style="width:186mm;padding-left:10mm;">
										<xsl:if test="USAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="USAddress/CityNm"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="USAddress/StateAbbreviationCd"/>
											</xsl:call-template>,
						<span style="width:2px;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="USAddress/ZIPCd"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="ForeignAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignAddress/CityNm"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrStateNm"/>
											</xsl:call-template>,
						<span style="width:2px;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignAddress/CountryCd"/>
											</xsl:call-template>,
						<span style="width:2px;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignAddress/ForeignPostalCd"/>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
								<!--PART VI SEPARATED PRINT  Line 35d  Start of City, State and country-->
								<!--PART VI SEPARATED PRINT  Line 36a - 8e  START of Report information of
                 Asset Not Stock of Foreign Ent Grp = 0-->
								<xsl:if test="(count(AssetNotStockOfForeignEntGrp) &lt;1)">
									<div style="width:187mm;">
										<div class="styLNLeftNumBox" style="height:2mm;padding-left:2mm;
				      padding-top:0mm;padding-bottom:0mm;">36</div>
										<div class="styLNDesc" style="width:178mm;padding-left:2mm;
					  padding-top:0mm;padding-bottom:1mm;height:9mm;">If asset reported on 
					  line 29 is not stock of a foreign entity or an interest in a foreign entity,
					  enter the following information for the asset.</div>
										<div class="styLNDesc" style="width:179mm;padding-left:10mm;
					  padding-top:0mm;padding-bottom:0mm;font-style:italic;height:7mm">
											<b>Note.</b> If this asset has more than one issuer or counterparty,
						 attach a separate statement for each additional issuer or counterparty
						 (see instructions).
					</div>
									</div>
									<br/>
									<!--PART VI SEPARATED PRINT  Line 36a  Start of Name of Issuer-->
									<div style="width:187mm;">
										<div class="styLNLeftLtrBox" style="padding-left:4mm;">a</div>
										<div class="styLNDesc" style="width:50mm;padding-left:2mm;">
					  Name of issuer or counterparty
					</div>
										<div class="styFixedUnderline" style="width:127mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="BusinessName/BusinessNameLine2Txt">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</div>
									</div>
									<!--PART VI SEPARATED PRINT  Line 36a  End of Name of Issuer-->
									<!--PART VI SEPARATED PRINT  Line 36a  
                     Start of Check if information is for Issuer or Counterparty-->
									<div style="width:187mm;padding-left:10mm;">
										<div class="styLNDesc" style="width:50.5mm;">Check if information is for</div>
										<div class="styLNDesc" style="width:35mm;">
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="IssuerInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSIssuerInd
								<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:5px;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="IssuerInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSIssuerInd
								<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
							Issuer
						</label>
										</div>
										<div class="styLNDesc" style="width:35.5mm;">
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="CounterpartyInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSCounterpartyInd
									<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:5px;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="CounterpartyInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSCounterpartyInd
									<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
							Counterparty
						</label>
										</div>
									</div>
									<br/>
									<!--PART VI SEPARATED PRINT  Line 36b  Start of Type of Issuer or counterparty-->
									<div style="width:187mm;">
										<div class="styLNLeftLtrBox" style="padding-left:4mm;">b</div>
										<div class="styLNDesc" style="width:178mm;padding-left:2mm;">
					  Type of issuer or counterparty</div>
									</div>
									<!--PART VI SEPARATED PRINT  Line 36b (1)  Start of Individual-->
									<div class="styLNDesc" style="width:187mm;padding-left:10mm;height:6mm">
										<div class="styLNDesc" style="width:47.3mm;">
											<b>(1)</b>
											<span style="width:5px;"/>
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/IndividualInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSIndividualInd
								<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:5px;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/IndividualInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSIndividualInd
								<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
							Individual
						</label>
										</div>
										<!--PART VI SEPARATED PRINT  Line 36b (1)  End of Individual-->
										<!--PART VI SEPARATED PRINT  Line 36b (2)  Start of Partnership-->
										<div class="styLNDesc" style="width:32.5mm;">
											<b>(2)</b>
											<span style="width:5px;"/>
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/PartnershipInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSPartnershipInd
								<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:5px;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/PartnershipInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSPartnershipInd
								<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
							Partnership
						</label>
										</div>
										<!--PART VI SEPARATED PRINT  Line 36b (2)  End of Partnership-->
										<!--PART VI SEPARATED PRINT  Line 36b (3)  Start of Corporation-->
										<div class="styLNDesc" style="width:35mm;">
											<b>(3)</b>
											<span style="width:5px;"/>
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/CorporationInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSCorporationInd
								<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:5px;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/CorporationInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSCorporationInd
								<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
							Corporation 
						</label>
										</div>
										<!--PART VI SEPARATED PRINT  Line 36b (3)  End of Corporation-->
										<!--PART VI SEPARATED PRINT  Line 36b (4)  Start of Trust-->
										<div class="styLNDesc" style="width:20mm;">
											<b>(4)</b>
											<span style="width:5px;"/>
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/TrustInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSTrustInd
								<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:5px;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/TrustInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSTrustInd
								<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
							Trust 
						</label>
										</div>
										<!--PART VI SEPARATED PRINT  Line 36b (5)  Start of Estate-->
										<div class="styLNDesc" style="width:20mm;">
											<b>(5)</b>
											<span style="width:5px;"/>
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/EstateInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSEstateInd
								<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:5px;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/EstateInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSEstateInd
								<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
							Estate 
						</label>
										</div>
									</div>
									<br/>
									<br/>
									<!--PART VI SEPARATED PRINT  Line 36b (5)  End of Estate-->
									<!--PART VI SEPARATED PRINT  Line 36c  Start of Check if Issuer or
                     Counterparty is US or Foreign-->
									<div style="width:187mm;height:6mm">
										<div class="styLNLeftLtrBox" style="padding-left:4mm;">c</div>
										<div class="styLNDesc" style="width:55mm;padding-left:2mm;">
					  Check if issuer or counterparty is a
					</div>
										<div class="styLNDesc" style="width:30.5mm;">
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/USPersonInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSUSPersonInd
								<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:5px;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/USPersonInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSUSPersonInd
								<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
							U.S. person
						</label>
										</div>
										<div class="styLNDesc" style="width:40mm;padding-left:2mm;">
											<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/ForeignPersonInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSForeignPersonInd
									<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:5px;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/ForeignPersonInd"/>
													<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSForeignPersonInd
									<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
							Foreign person
						</label>
										</div>
									</div>
									<br/>
									<!--PART VI SEPARATED PRINT  Line 36c  End of Check if Issuer or 
                     Counterparty is US or Foreign-->
									<!--PART VI SEPARATED PRINT  Line 36d  Start of Mailing Address-->
									<div style="width:187mm;font-size:8pt;">
										<div class="styLNLeftLtrBox" style="padding-left:4mm;">d</div>
										<span style="height:4mm;"/>
										<div class="styLNDesc" style="height:16mm;width:178mm;padding-left:2mm;
					  padding-top:0mm;padding-bottom:0mm;">Mailing address of issuer or 
					  counterparty. Number, street, and room or suite no.</div>
										<div class="styFixedUnderline" style="height:2mm;width:179mm;
					  padding-left:2mm;padding-top:1mm;padding-bottom:0mm;">
											<xsl:if test="AssetNotStockOfForeignEntGrp/USAddress">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="USAddress/AddressLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="AssetNotStockOfForeignEntGrp/USAddress/AddressLine2Txt">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/AddressLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:if>
											<xsl:if test="AssetNotStockOfForeignEntGrp/ForeignAddress">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="AssetNotStockOfForeignEntGrp/ForeignAddress/AddressLine2Txt">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:if>
										</div>
									</div>
									<!--PART VI SEPARATED PRINT  Line 36d  End of Mailing Address-->
									<!--PART VI SEPARATED PRINT  Line 36e  Start of City, State or Country-->
									<div style="width:187mm;height:14mm;border-style:solid;border-color:black;
				  border-width: 0px 0px 1px 0px;padding-top:0mm">
										<div class="styLNLeftLtrBox" style="padding-left:4mm;">e</div>
										<div class="styLNDesc" style="width:178mm;padding-left:2mm;
					  padding-top:0mm;">
					  City or town, state or province, country, and ZIP or foreign postal code</div>
										<div class="styLNDesc" style="width:186mm;padding-left:10mm;">
											<xsl:if test="AssetNotStockOfForeignEntGrp/USAddress">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="USAddress/CityNm"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="USAddress/StateAbbreviationCd"/>
												</xsl:call-template>,
							<span style="width:2px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="USAddress/ZIPCd"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="AssetNotStockOfForeignEntGrp/ForeignAddress">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignAddress/CityNm"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrStateNm"/>
												</xsl:call-template>,
							<span style="width:2px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignAddress/CountryCd"/>
												</xsl:call-template>,
							<span style="width:2px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignAddress/ForeignPostalCd"/>
												</xsl:call-template>
											</xsl:if>
										</div>
									</div>
									<!--PART VI SEPARATED PRINT  Line 36e  End of City, State or Country-->
									<div style="width:187mm;font-size:8pt;">
										<span style="font-size:8pt;width:187mm;"/>
										<span style="width:17mm;"/>Form 
					<span class="styBoldText" style="font-size:8pt;">8938</span> (Rev. 11-2021)
				</div>
								</xsl:if>
								<!--PART VI SEPARATED PRINT  Line 36a - 8e  END of Report information of 
                 Asset Not Stock of Foreign Ent Grp = 0-->
								<!--PART VI SEPARATED PRINT REPEATING INFORMATION  
                 Start of Asset Not Stock of Foreign Ent Grp >=1 (Lines 8a - 8e)-->
								<xsl:if test="(count(AssetNotStockOfForeignEntGrp) &gt;=1)">
									<xsl:for-each select="AssetNotStockOfForeignEntGrp">
										<div style="width:187mm;height:auto;">
											<div class="styLNLeftNumBox" style="height:6mm;padding-left:2mm;
						  padding-top:0mm;padding-bottom:0mm;">36</div>
											<div class="styLNDesc" style="width:178mm;padding-left:2mm;
						  padding-top:0mm;padding-bottom:1mm;">If asset reported on
						  line 29 is not stock of a foreign entity or an interest in a foreign entity,
						  enter the following information for the asset.</div>
											<xsl:choose>
												<xsl:when test="position()=1">
													<div class="styLNDesc" style="height:auto;width:179mm;padding-left:10mm;padding-top:0mm;padding-bottom:0mm;font-style:italic;">
														<b>Note.</b>If this asset has more than one issuer or counterparty, attach a
														 separate statement with the same information for each additional issuer or
														 counterparty (see instructions).
												</div>
												</xsl:when>
											</xsl:choose>
										</div>
										<br/>
										<!--PART VI SEPARATED PRINT  Line 36a  Start of Name of Issuer-->
										<div style="width:187mm;">
											<div class="styLNLeftLtrBox" style="padding-left:4mm;">a</div>
											<div class="styLNDesc" style="width:50mm;padding-left:2mm;">
						  Name of issuer or counterparty
						</div>
											<div class="styFixedUnderline" style="width:127mm;">
												<xsl:choose>
													<xsl:when test="PersonNm">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PersonNm"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
														</xsl:call-template>
														<xsl:if test="BusinessName/BusinessNameLine2Txt">
															<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:otherwise>
												</xsl:choose>
											</div>
										</div>
										<!--PART VI SEPARATED PRINT  Line 36a  End of Name of Issuer-->
										<!--PART VI SEPARATED PRINT  Line 36a  Start of Check if information is
                         for Issuer or Counterparty-->
										<div style="width:187mm;padding-left:10mm;">
											<div class="styLNDesc" style="width:50.5mm;">Check if information is for</div>
											<div class="styLNDesc" style="width:35mm;">
												<input type="Checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="IssuerInd"/>
														<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSIssuerInd
									<xsl:number value="position()"/>
														</xsl:with-param>
													</xsl:call-template>
												</input>
												<span style="width:5px;"/>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="IssuerInd"/>
														<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSIssuerInd
									<xsl:number value="position()"/>
														</xsl:with-param>
													</xsl:call-template>
								Issuer
							</label>
											</div>
											<div class="styLNDesc" style="width:35.5mm;">
												<input type="Checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="CounterpartyInd"/>
														<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSCounterpartyInd
										<xsl:number value="position()"/>
														</xsl:with-param>
													</xsl:call-template>
												</input>
												<span style="width:5px;"/>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="CounterpartyInd"/>
														<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSCounterpartyInd
										<xsl:number value="position()"/>
														</xsl:with-param>
													</xsl:call-template>
								Counterparty
							</label>
											</div>
										</div>
										<br/>
										<!--PART VI SEPARATED PRINT  Line 36b  Start of Type of Issuer or counterparty-->
										<div style="width:187mm;padding-top:2mm;">
											<div class="styLNLeftLtrBox" style="padding-left:4mm;">b</div>
											<div class="styLNDesc" style="width:178mm;padding-left:2mm;">
						  Type of issuer or counterparty</div>
										</div>
										<!--PART VI SEPARATED PRINT  Line 36b (1)  Start of Individual-->
										<div class="styLNDesc" style="width:187mm;padding-left:10mm;">
											<div class="styLNDesc" style="width:47.3mm;">
												<b>(1)</b>
												<span style="width:5px;"/>
												<input type="Checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="IndividualInd"/>
														<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSIndividualInd
									<xsl:number value="position()"/>
														</xsl:with-param>
													</xsl:call-template>
												</input>
												<span style="width:5px;"/>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="IndividualInd"/>
														<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSIndividualInd
									<xsl:number value="position()"/>
														</xsl:with-param>
													</xsl:call-template>
								Individual
							</label>
											</div>
											<!--PART VI SEPARATED PRINT  Line 36b (1)  End of Individual-->
											<!--PART VI SEPARATED PRINT  Line 36b (2)  Start of Partnership-->
											<div class="styLNDesc" style="width:32.5mm;">
												<b>(2)</b>
												<span style="width:5px;"/>
												<input type="Checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="PartnershipInd"/>
														<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSPartnershipInd
									<xsl:number value="position()"/>
														</xsl:with-param>
													</xsl:call-template>
												</input>
												<span style="width:5px;"/>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="PartnershipInd"/>
														<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSPartnershipInd
									<xsl:number value="position()"/>
														</xsl:with-param>
													</xsl:call-template>
								Partnership
							</label>
											</div>
											<!--PART VI SEPARATED PRINT  Line 36b (2)  End of Partnership-->
											<!--PART VI SEPARATED PRINT  Line 36b (3)  Start of Corporation-->
											<div class="styLNDesc" style="width:35mm;">
												<b>(3)</b>
												<span style="width:5px;"/>
												<input type="Checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="CorporationInd"/>
														<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSCorporationInd
									<xsl:number value="position()"/>
														</xsl:with-param>
													</xsl:call-template>
												</input>
												<span style="width:5px;"/>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="CorporationInd"/>
														<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSCorporationInd
									<xsl:number value="position()"/>
														</xsl:with-param>
													</xsl:call-template>
								Corporation 
							</label>
											</div>
											<!--PART VI SEPARATED PRINT  Line 36b (3)  End of Corporation-->
											<!--PART VI SEPARATED PRINT  Line 36b (4)  Start of Trust-->
											<div class="styLNDesc" style="width:35mm;">
												<b>(4)</b>
												<span style="width:1px;"/>
												<input type="Checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="TrustInd"/>
														<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSTrustInd
									<xsl:number value="position()"/>
														</xsl:with-param>
													</xsl:call-template>
												</input>
												<span style="width:1px;"/>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="TrustInd"/>
														<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSTrustInd
									<xsl:number value="position()"/>
														</xsl:with-param>
													</xsl:call-template>
								Trust 
							</label>
											</div>
											<!--PART VI SEPARATED PRINT  Line 36b (5)  Start of Estate-->
											<div class="styLNDesc" style="width:25mm;">
												<b>(5)</b>
												<span style="width:1px;"/>
												<input type="Checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="EstateInd"/>
														<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSEstateInd
									<xsl:number value="position()"/>
														</xsl:with-param>
													</xsl:call-template>
												</input>
												<span style="width:1px;"/>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="EstateInd"/>
														<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSEstateInd
									<xsl:number value="position()"/>
														</xsl:with-param>
													</xsl:call-template>
								Estate 
							</label>
											</div>
										</div>
										<br/>
										<br/>
										<!--PART VI SEPARATED PRINT  Line 36b (5)  End of Estate-->
										<!--PART VI SEPARATED PRINT  Line 36c 
                         Start of Check if Issuer or Counterparty is US or Foreign-->
										<div style="width:187mm;padding-top:2mm;">
											<div class="styLNLeftLtrBox" style="padding-left:4mm;">c</div>
											<div class="styLNDesc" style="width:55mm;padding-left:2mm;">
						  Check if issuer or counterparty is a</div>
											<div class="styLNDesc" style="width:30.5mm;">
												<input type="Checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="USPersonInd"/>
														<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSUSPersonInd
									<xsl:number value="position()"/>
														</xsl:with-param>
													</xsl:call-template>
												</input>
												<span style="width:5px;"/>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="USPersonInd"/>
														<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSUSPersonInd
									<xsl:number value="position()"/>
														</xsl:with-param>
													</xsl:call-template>
								U.S. person
							</label>
											</div>
											<div class="styLNDesc" style="width:40mm;padding-left:2mm;">
												<input type="Checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="ForeignPersonInd"/>
														<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSForeignPersonInd
										<xsl:number value="position()"/>
														</xsl:with-param>
													</xsl:call-template>
												</input>
												<span style="width:5px;"/>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="ForeignPersonInd"/>
														<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSForeignPersonInd
										<xsl:number value="position()"/>
														</xsl:with-param>
													</xsl:call-template>
								Foreign person
							</label>
											</div>
										</div>
										<!--PART VI SEPARATED PRINT  Line 36c  
                         End of Check if Issuer or Counterparty is US or Foreign-->
										<!--PART VI SEPARATED PRINT  Line 36d  Start of Mailing Address-->
										<div style="width:187mm;padding-top:2mm;">
											<div class="styLNLeftLtrBox" style="padding-left:4mm;">d</div>
											<span style="height:4mm;"/>
											<div class="styLNDesc" style="width:178mm;padding-left:2mm;
						  padding-top:0mm;padding-bottom:0mm;height:15mm;">
						  Mailing address of issuer or counterparty. Number, street, and room or suite no.
						  <br/>
												<xsl:if test="USAddress">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/AddressLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="USAddress/AddressLine2Txt">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/AddressLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:if>
												<xsl:if test="ForeignAddress">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="ForeignAddress/AddressLine2Txt">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:if>
												<div class="styFixedUnderline" style="width:178mm;padding-left:2mm;padding-top:0mm;padding-bottom:0mm;height:2mm;">
											</div>
											</div>
										</div>
										<!--PART VI SEPARATED PRINT  Line 36d  End of Mailing Address-->
										<!--PART VI SEPARATED PRINT  Line 36e  Start of City, State or Country-->
										<div style="width:187mm;border-style:solid;border-color:black;height:15mm;
					  border-width: 0px 0px 1px 0px;padding-top:0mm;">
											<div class="styLNLeftLtrBox" style="padding-left:4mm;">e</div>
											<div class="styLNDesc" style="width:178mm;padding-left:2mm;
						  padding-top:.5mm;height:0mm;">
						  City or town, state or province, and country (including postal code)</div>
											<div class="styLNDesc" style="width:186mm;padding-left:10mm;height:0mm">
												<xsl:if test="USAddress">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/CityNm"/>
													</xsl:call-template>
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/StateAbbreviationCd"/>
													</xsl:call-template>,
								<span style="width:2px;"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/ZIPCd"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="ForeignAddress">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddress/CityNm"/>
													</xsl:call-template>
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrStateNm"/>
													</xsl:call-template>,
								<span style="width:2px;"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddress/CountryCd"/>
													</xsl:call-template>,
								<span style="width:2px;"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddress/ForeignPostalCd"/>
													</xsl:call-template>
												</xsl:if>
											</div>
										</div>
										<!--PART VI SEPARATED PRINT  Line 36e  End of City, State or Country-->
									</xsl:for-each>
									<!--PART VI SEPARATED PRINT  FOOTER-->
									<div style="width:187mm;font-size:8pt;">
										<span style="font-size:8pt;width:135mm;"/>
										<span style="width:18.5mm;"/>Form 
					<span class="styBoldText" style="font-size:8pt;">8938</span> (Rev. 11-2021)
					<xsl:if test="position() != last() ">
											<div class="pageEnd" style="width:187mm;border-top:0px solid black;">
						</div>
										</xsl:if>
									</div>
								</xsl:if>
								<!--PART VI SEPARATED PRINT REPEATING INFORMATION  
                 END of Asset Not Stock of Foreign Ent Grp >=1 (Lines 36a - 36e)-->
							</xsl:for-each>
						</xsl:if>
					</div>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
