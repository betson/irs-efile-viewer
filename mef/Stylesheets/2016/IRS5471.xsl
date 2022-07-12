<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS5471Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!--  Defines the stage of the data, e.g. original or latest  -->
	<xsl:param name="IRS5471Data" select="$RtnDoc/IRS5471"/>
	<xsl:param name="IRS5471AData" select="$RtnDoc/IRS5471/IRS5471ScheduleA"/>
	<xsl:param name="IRS5471BData" select="$RtnDoc/IRS5471/IRS5471ScheduleB"/>
	<xsl:param name="IRS5471CData" select="$RtnDoc/IRS5471/IRS5471ScheduleC"/>
	<xsl:param name="IRS5471EData" select="$RtnDoc/IRS5471/IRS5471ScheduleE"/>
	<xsl:param name="IRS5471FData" select="$RtnDoc/IRS5471/IRS5471ScheduleF"/>
	<xsl:param name="IRS5471GData" select="$RtnDoc/IRS5471/IRS5471ScheduleG"/>
	<xsl:param name="IRS5471HData" select="$RtnDoc/IRS5471/IRS5471ScheduleH"/>
	<xsl:param name="IRS5471IData" select="$RtnDoc/IRS5471/IRS5471ScheduleI"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($IRS5471Data)"/>
					</xsl:call-template>
				</title>
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<meta http-equiv="Cache-Control" content="private"/>
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="TY 2006 IRS Form 5471"/>
				<META name="GENERATOR" content="IBM WebSphere Studio"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!-- uncomment this before checking in111111 code this one  -->
				<xsl:if test="not($Print) or $Print=''">
					<!-- Form 5471 CSS Styles are located in the template called below -->
					<xsl:call-template name="IRS5471Style"/>
					<xsl:call-template name="AddOnStyle"/>
</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm">
				<form name="IRS5471">
					<!--   BEGIN WARNING LINE  -->
					<xsl:call-template name="DocumentHeader"/>
					<!--   END WARNING LINE   -->
					<!--   BEGIN FORM HEADER   -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:28.25mm; height: 23mm;border-bottom-width:1pt;;border-right-width:1pt">
							<div>
                Form 
                <span class="styFormNumber">5471</span>
								<br/>
								<span style="width: 3mm">
									<xsl:call-template name="IRS5471LinkToLeftoverDataTable">
										<xsl:with-param name="Desc">Change In Taxable Year No. 898c</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$IRS5471Data/ChangeInTaxableYearNo898cInd"/>
										<xsl:with-param name="Style"/>
									</xsl:call-template>
								</span>
								<span style="width: 3mm">
									<xsl:call-template name="IRS5471LinkToLeftoverDataTable">
										<xsl:with-param name="Desc">Election Change In Year 898c</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$IRS5471Data/ElectionChangeInYear898cInd"/>
										<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
									</xsl:call-template>
								</span>
								<span style="width: 3mm">
									<xsl:call-template name="IRS5471LinkToLeftoverDataTable">
										<xsl:with-param name="Desc">Section 898c Election</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$IRS5471Data/Section898cElectionInd"/>
										<xsl:with-param name="Style">padding-left:6mm;</xsl:with-param>
									</xsl:call-template>
								</span>
								<span style="width: 3mm">
									<xsl:call-template name="IRS5471LinkToLeftoverDataTable">
										<xsl:with-param name="Desc">Section 338g Election</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$IRS5471Data/Section338gElectionInd"/>
										<xsl:with-param name="Style">padding-left:9mm;</xsl:with-param>
									</xsl:call-template>
								</span>
								<span style="width: 3mm">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Dormant Indicator</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$IRS5471Data/@dormantForeignCorporationCd"/>
										<xsl:with-param name="Style">padding-left:9mm;</xsl:with-param>
									</xsl:call-template>
								</span>
								<span style="width: 3mm">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Change Annual Accounting Period</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$IRS5471Data/@changeAnnualAccountingPeriodCd"/>
										<xsl:with-param name="Style">padding-left:9mm;</xsl:with-param>
									</xsl:call-template>
								</span>
								<span style="width: 3mm;padding-left:3mm;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$IRS5471Data"/>
										<xsl:with-param name="Style">width:10mm;text-align:right;padding-left:16mm</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<span style="height:13mm"/>
							<div class="styAgency">(Rev. December 2012)</div>
							<div class="styAgency" style="font-size: 6pt; text-align:bottom;padding-top:.5mm;">Department of the Treasury<br/>Internal Revenue Service</div>
						</div>
						<div class="styFNBox" style="width:127.5mm; height: 23mm;border-bottom-width:1pt;;border-right-width:1pt;border-left-width:1pt">
							<div class="styMainTitle" style="font-size:12pt;padding-left:3mm">Information Return of U.S. Persons With Respect To Certain <span style="width:35mm"/> Foreign Corporations</div>
							<div class="styFST" style="padding-top:1mm;padding-left:16mm">
								<img src="{$ImagePath}/5471_Bullet_Title.gif" alt="bullet"/>
								<span style="width: 1mm"/>For more information about Form 5471, see
								<a style="text-decoration:none;color:black;" href="http://www.irs.gov/form5471" title="Link to IRS.gov">
										<i>www.irs.gov/form5471.</i>
									</a>		 
								<br/>
							</div>
							<div style="text-align: left; padding-top: 1mm; padding-left:2mm; text-align:bottom;">Information furnished for the foreign corporation's
							 annual accounting period (tax year required <span style="width:6mm"/> by  section 898)&#160;<span style="font-size:6pt">(see instructions) </span>&#160;beginning     
                    <span style="width: 15mm">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/TaxYearBeginDt"/>
									</xsl:call-template>
								</span>, and ending
          		<span style="width: 16mm">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/TaxYearEndDt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="height: 23mm;width:31mm;border-bottom-width:1pt;border-left-width:1pt">
							<div class="styOMB" style="height:12mm;">
								<div style="text-align:left;font-size: 7pt;padding-left: 1mm;height:4mm;
								padding-top:8mm;padding-bottom:0mm;">OMB No. 1545-0704</div>
							</div>
							<div class="styBoldText" style="height:2mm;padding-left: 3mm;padding-top:5mm"/>
							<div style="font-size:6pt; height:6mm; text-align: left; padding-left: 3mm">
								<div style="width:10mm;">Attachment</div>
								<div style="width:20mm;">Sequence No.<b>121</b>
								</div>
							</div>
						</div>
					</div>
					<!--   END FORM HEADER   -->
					<!--   BEGIN TAXPAYER INFO   -->
					<!--   BEGIN NAME   -->
					<div style="width:187mm;">
						<div class="styNameBox" style=";font-size: 7pt;width: 109mm">Name of person filing this return
    <span style="width:2mm"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn"/>
							</xsl:call-template>
							<br/>
							<div style="font-family: verdana, arial, sans-serif; font-size: 7pt; font-weight: normal;
							 height: 6mm">
								<xsl:choose>
									<!-- Name from Form level -->
									<xsl:when test="$IRS5471Data/PersonFilingThisReturn/BusinessName/BusinessNameLine1Txt != '' ">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn/BusinessName/BusinessNameLine1Txt"/>
										</xsl:call-template>
										<xsl:choose>
											<xsl:when test="$IRS5471Data/PersonFilingThisReturn/BusinessName/BusinessNameLine2Txt != ''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn/BusinessName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:when>
										</xsl:choose>
									</xsl:when>
									<xsl:otherwise>
										<xsl:choose>
											<!-- Name from 1040 Return Header -->
							<xsl:when test="$RtnHdrData/Filer/PrimaryNameControlTxt">
							<span style="padding-top:2mm">
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								</xsl:call-template></span>
							</xsl:when>
											<!-- Name from 1120/990/1065 Return Header -->
											<xsl:when test="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
						<span class="styEINBox" style="font-size:7pt; padding-left:1mm;
						">A<span style="width:8px;"/>
						Identifying number</span>
						<span class="styNormalText" style="padding-top: 3mm; text-align: left; width: 70mm;padding-left:5mm;">
							<span style="font-weight:normal;">
								<!-- WARNING: Return Type will need to be update with various future form 1040 return type-->
								<xsl:choose>
									<xsl:when test="$IRS5471Data/SSN != ''">
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/SSN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$IRS5471Data/EIN != ''">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/EIN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$IRS5471Data/MissingEINReasonCd != ''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/MissingEINReasonCd"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:choose>
		                  <xsl:when test="$RtnHdrData/Filer/EIN">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">EIN</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</span>
					</div>
					<!--  END NAME   -->
					<!--   BEGIN ADDRESS AND CATEGORY   -->
					<div style="width:187mm;">
						<div class="styAddrFld" style="border-bottom-width: 0px; border-left-width: 0px;
						 border-style:solid; font-size: 6pt; height:9mm;width: 109mm;
						 font-weight: normal">
						Number, street, and room or suite no. (or P.O. box number if mail is not
						 delivered to street address)
    <span style="font-family: verdana, arial, sans-serif;font-size: 7pt; font-weight: normal;">
								<!-- Added new code to have choice between USAddress and ForeignAddress -->
								<!-- Added per RIS 13 and EXO-0273OTH  12/27/06 -->
								<xsl:choose>
									<xsl:when test="$IRS5471Data/PersonFilingThisReturn/USAddress/AddressLine1Txt != ''">
										<div>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn/USAddress/AddressLine1Txt"/>
											</xsl:call-template>
										</div>
										<br/>
										<xsl:choose>
											<xsl:when test="$IRS5471Data/PersonFilingThisReturn/USAddress/AddressLine2Txt != ''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn/USAddress/AddressLine2Txt"/>
												</xsl:call-template>
											</xsl:when>
										</xsl:choose>
									</xsl:when>
									<xsl:when test="$IRS5471Data/PersonFilingThisReturn/ForeignAddress/AddressLine1Txt != ''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn/ForeignAddress/AddressLine1Txt"/>
										</xsl:call-template>
										<xsl:choose>
											<xsl:when test="$IRS5471Data/PersonFilingThisReturn/ForeignAddress/AddressLine2Txt != ''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn/ForeignAddress/AddressLine2Txt"/>
												</xsl:call-template>
											</xsl:when>
										</xsl:choose>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
						<div class="styComType" style="width: 78mm; height: 9.3mm;
						 float: right;clear:both; padding-left: 1mm;
						border-top-width: 1px; border-bottom-width: px;">
							<b style="font-size: 7pt;">B</b>
							<span style="width: 8px; font-size: 7pt;"/>Category of filer (See instructions.  Check applicable box(es)):
    			<br/>
							<span style="margin-left: 4mm; font-size: 8pt">1
                (repealed)
                <span style="width:4px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler2Ind"/>
										<xsl:with-param name="BackupName">IRS5471CategoryOfFiler2</xsl:with-param>
									</xsl:call-template>2</label>
								<span style="width:8px"/>
								<input type="checkbox" class="styCkbox" name="CategoryOfFiler2Ind">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler2Ind"/>
										<xsl:with-param name="BackupName">IRS5471CategoryOfFiler2</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:12px;"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler3Ind"/>
									<xsl:with-param name="Style">width: 32mm; text-align:left; padding-left: 8mm</xsl:with-param>
								</xsl:call-template>
								<span style="width:1mm;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler3Ind"/>
										<xsl:with-param name="BackupName">IRS5471CategoryOfFiler3</xsl:with-param>
									</xsl:call-template>3</label>
								<span style="width: 8px"/>
								<input type="checkbox" class="styCkbox" name="CategoryOfFiler3Ind">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler3Ind"/>
										<xsl:with-param name="BackupName">IRS5471CategoryOfFiler3</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:12px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler4Ind"/>
										<xsl:with-param name="BackupName">IRS5471CategoryOfFiler4</xsl:with-param>
									</xsl:call-template>4</label>
								<span style="width:8px"/>
								<input type="checkbox" class="styCkbox" name="CategoryOfFiler4Ind">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler4Ind"/>
										<xsl:with-param name="BackupName">IRS5471CategoryOfFiler4</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:12px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler5Ind"/>
										<xsl:with-param name="BackupName">IRS5471CategoryOfFiler5</xsl:with-param>
									</xsl:call-template>5</label>
								<span style="width:8px"/>
								<input type="checkbox" class="styCkbox" name="CategoryOfFiler5Ind">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler5Ind"/>
										<xsl:with-param name="BackupName">IRS5471CategoryOfFiler5</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
					</div>
					<!--   END ADDRESSS AND CATEGORY   -->
					<!--   BEGIN CITY, STATE, ZIP AND VOTING PERCENTAGE   -->
					<!--  *******************************************************************************  -->
					<div style="width:187mm;">
						<div class="styComType" style="font-size: 7pt; width: 109mm; height: 16mm; border-top-width: 1px; border-bottom-width: 0px;border-right-width: 1px">City or town, state, and ZIP code
                         <br/> 
							<span style="font-family: verdana, arial, sans-serif;font-size: 7pt; font-weight: normal;">
								<!-- <span style="font-family: verdana, arial, sans-serif;font-size: 8pt; font-weight: bold;"> -->
								<!-- NEW CODE ADDED TO REFLECT USADDRESS AND FOREIGNADDRESS  -->
								<!-- Added per RIS 13 and EXO-0273OTH  12/27/06 -->
								<xsl:choose>
									<xsl:when test="$IRS5471Data/PersonFilingThisReturn/USAddress">
										<xsl:attribute name="style">margin-left:0mm; padding-top:1mm; 
                                       </xsl:attribute>
										<div>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn/USAddress/CityNm"/>
											</xsl:call-template>
										</div>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn/USAddress/StateAbbreviationCd"/>
										</xsl:call-template>
										<span style="width:8px"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn/USAddress/ZIPCd"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn/ForeignAddress/CityNm"/>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn/ForeignAddress/ProvinceOrStateNm"/>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn/ForeignAddress/ForeignPostalCd"/>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn/ForeignAddress/CountryCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
						<div style="width: 78mm;  height:16mm;
						padding-left: 1mm;border-top-width: 1px; border-bottom-width: 0px;text-align: left">
							<b style="font-size: 7pt;padding-right: 1mm">C</b>
    Enter the total percentage of the foreign corporation's voting stock
    you owned at the end of its annual accounting period
							
							
    <span class="styFixedUnderline" style="width:15mm;float:none;">
								<xsl:call-template name="PopulatePercent">
									<xsl:with-param name="TargetNode" select="$IRS5471Data/VotingStockOwnedPct"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!--   END CITY, STATE, ZIP AND VOTING PERCENTAGE   -->
					<!--   BEGIN FILER'S TAX YEAR   -->
					<div class="styBB" style="width: 187mm; border-top-width: 1px;height:4mm">
						<span style="text-align:left">Filer's tax year beginning
                  <span style="width: 20mm;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$IRS5471Data/FilerTaxYearBeginDt"/>
								</xsl:call-template>
							</span>, and ending
                                 <span style="width: 20mm; ">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$IRS5471Data/FilerTaxYearEndDt"/>
								</xsl:call-template>
							</span>
						</span>
					</div>
					<!--   END FILER'S TAX YEAR   -->
					<!--   END TAXPAYER INFO   -->
					<!--   BEGIN BLOCK D   -->
					<!--   BEGIN LINE D   -->
					<div class="styBB" style="width:187mm;height:4mm">
						<div style="float:left;">
							<b style="font-size: 7pt;">D</b>
							<!--<span class="styNBSP"/>-->
							<span style="font-size: 7pt;">&#160;  Person(s) on whose behalf this information return is filed:</span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonInformationIsFiledFor"/>
							</xsl:call-template>
							<span style="width:1px"/>
						</div>
						<div style="width:7mm;text-align:right;float:right;clear:none;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonInformationIsFiledFor"/>
								<xsl:with-param name="containerHeight" select="4"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" 'ATctn' "/>
								<xsl:with-param name="imageID" select=" 'ATimg' "/>
								<xsl:with-param name="buttonID" select=" 'ATbtn' "/>
						</xsl:call-template>
						</div>
					</div>
					<!--   END LINE D   -->
					<!--   BEGIN BLOCK D TABLE   -->
					<div class="styIRS5471TableContainer" style="width:187mm;"  id="ATctn">
						<!--print logic-->
						<xsl:call-template name="SetInitialState"/>
						<!--end-->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th scope="col" class="styTableCellHeader" style="border-color: black; font-size: 7pt; text-align: center; width: 68mm" rowspan="2">
                    (1)<span class="styNormalText">&#160;Name</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="border-color: black; font-size: 7pt; text-align: center; width: 63mm" rowspan="2">
                    (2)<span class="styNormalText">&#160;Address</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="border-color: black; font-size: 7pt; text-align: center; width: 30mm" rowspan="2">
                    (3)<span class="styNormalText">&#160;Identifying number</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 42mm; border-color: black; font-size: 7pt;border-right-width: 0px" colspan="3">
                    (4)<span class="styNormalText">&#160;Check applicable box(es)</span>
									</th>
								</tr>
								<tr>
									<th scope="col" class="styTableCellHeader" style="border-color: black; width: 17mm; font-weight: normal">Shareholder</th>
									<th scope="col" class="styTableCellHeader" style="border-color: black; width: 11mm; font-weight: normal">Officer</th>
									<th scope="col" class="styTableCellHeader" style="border-color: black; border-right-width:0px; width: 14mm; font-weight: normal">Director</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS5471Data/PersonInformationIsFiledFor">
									<xsl:if test="($Print != $Separated) or (count($IRS5471Data/PersonInformationIsFiledFor) &lt;=4)">
										<tr>
											<td class="styTableCell" style="width: 68mm; text-align: left; border-color: black; font-size: 7pt;">
												<xsl:if test="PersonNm!=''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PersonNm"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="BusinessName/BusinessNameLine1Txt!=''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="BusinessName/BusinessNameLine2Txt != ''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:if>
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonInformationIsFiledFor"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color: black; width: 63mm; text-align: left; font-size: 7pt;">
												<xsl:if test="USAddress !=''">
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="USAddress"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="ForeignAddress !=''">
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="ForeignAddress"/>
													</xsl:call-template>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color: black; width: 30mm;  text-align: center; font-size: 7pt;">
												<xsl:choose>
													<xsl:when test="SSN != ''">
														<xsl:call-template name="PopulateSSN">
															<xsl:with-param name="TargetNode" select="SSN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:when test="EIN != ''">
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="EIN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color: black; text-align: center; font-size: 7pt; width: 17mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ShareholderInd"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color: black; text-align: center; font-size: 7pt; width: 11mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="OfficerInd"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color: black; text-align: center; font-size: 7pt; border-right-width: 0px; width: 14mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DirectorInd"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<xsl:call-template name="AddRowsD">
									<xsl:with-param name="NumOfRows" select="4"/>
									<xsl:with-param name="PersonCount" select="count($IRS5471Data/PersonInformationIsFiledFor)"/>
								</xsl:call-template>
							</tbody>
						</table>
					</div>
							<xsl:call-template name="SetInitialDynamicTableHeight">
								<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonInformationIsFiledFor"/>
								<xsl:with-param name="containerHeight" select="4"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" 'ATctn' "/>
								<xsl:with-param name="imageID" select=" 'ATimg' "/>
								<xsl:with-param name="buttonID" select=" 'ATbtn' "/>
						</xsl:call-template>
					<!--   END Block D TABLE   -->
					<!--   BEGIN IMPORTANT HEADER   -->
				 <xsl:choose>
					<xsl:when test="($Print = $Separated)">
						<br/><br/><br/>
					</xsl:when>
						<xsl:otherwise>
							<br/>
						</xsl:otherwise>
					</xsl:choose>
				<div class="styGenericDiv" style="width: 187mm; font-size: 8pt">
						<span class="styBoldText" style="vertical-align: top;">Important:</span>
						<span class="styItalicText" style="width: 160mm; padding-left: 1mm;"> Fill in all applicable lines and schedules.  All information <b>must</b> be in English.  All amounts <b>must</b> be stated in U.S. dollars unless otherwise indicated.</span>
					</div>
					<span class="styBB" style="width: 187mm; padding-left: 21mm;font-size:7pt">
					</span>
					<!--   END IMPORTANT HEADER   -->
					<!--   BEGIN BLOCK 1   -->
					<!--   BEGIN 1A, 1B, 1C   -->
					<xsl:choose>
						<xsl:when test="($Print = $Separated)">
							<!--   BEGIN 1A, 1B, 1C   -->
							<table class="styTable" cellspacing="0" style="width:187mm;font-size:9pt;">
								<tr>
									<td class="styTableCell" rowspan="3" valign="top" style="width: 120mm; text-align:left;
									        border-color:black; border-bottom:0;border-right:1;">
										<b>1a</b>
										Name and address of foreign corporation<br/>
										<br/>
										<span style="padding-left:5mm">
												<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/ForeignCorporation/BusinessName/BusinessNameLine1Txt"/>
										</xsl:call-template>
										<xsl:choose>
										<xsl:when test="$IRS5471Data/ForeignCorporation/BusinessName/BusinessNameLine2Txt != ''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$IRS5471Data/ForeignCorporation/BusinessName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:when>
										</xsl:choose>
										<br/>
										<xsl:choose>
											<xsl:when test="$IRS5471Data/ForeignCorporation/USAddress">
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="$IRS5471Data/ForeignCorporation/USAddress"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateForeignAddressTemplate">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/ForeignCorporation/ForeignAddress"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose></span>
									</td>
									<td class="styTableCell" valign="top" style="width: 59.5mm;height: 9.5mm;border-color:black;border-right-width: 0px;font-size:7pt">
										<span style="width:64mm;text-align:left;padding-left:1mm;font:size:7pt">
											<b>b(1)</b>
											Employer identification number, if any
                </span>
										<br/>
										<br/>
										<span style="text-align:left; width: 59.5mm; padding-left:7mm;">
											<xsl:choose>
												<xsl:when test="$IRS5471Data/EmployerEIN != '' ">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="$IRS5471Data/EmployerEIN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$IRS5471Data/MissingEmployerEINReasonCd"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</span>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" valign="top" style="width: 59.5mm;height: 9.5mm;border-color:black;border-right-width: 0px;font-size:7pt">
										<span style="width:64mm;text-align:left;padding-left:1mm;padding-bottom:5mm">
											<b>b(2)</b>
											<span style="padding-left:1mm;font-size:7pt">Reference ID number (see instructions)
                                         </span>
										</span>
										<br/>
										<br/>
										<xsl:choose>
											<xsl:when test="count($IRS5471Data/ForeignEntityIdentificationGrp) = 1">
												<span style="text-align:left; width: 59.5mm; padding-left:7mm">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$IRS5471Data/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
													</xsl:call-template>
													<br/>
												</span>
											</xsl:when>
											<xsl:otherwise>
												<span style="text-align:left; width: 59.5mm; padding-left:7mm;">
													<xsl:call-template name="PopulateAdditionalDataTableMessage">
														<xsl:with-param name="TargetNode" select="$IRS5471Data/ForeignEntityIdentificationGrp"/>
														<xsl:with-param name="ShortMessage" select=" 'false' "/>
													</xsl:call-template>
													<br/>
												</span>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" valign="top" style="width: 59.5mm;height: 9.5mm;border-color:black;border-right-width: 0px;border-bottom-width: 0px">
										<span style="width:64mm;text-align:left;padding-left:1mm;;font-size:7pt">
											<b>c</b>
											<span class="styNBSP"/>Country under whose laws incorporated
                                        </span>
										<br/>
										<br/>
										<span style="text-align:left; width: 59.5mm; padding-left:7mm;">
											<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/CountryUnderWhoseLawsIncCd"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
							</table>
						</xsl:when>
						<xsl:when test="($Print != $Separated)">
							<div style="width:187mm;font-size:7pt;">
								<span class="styTableCell" style="float:left;vertical-align:top;width: 114.1mm;height:25mm;
								;text-align:left;border-right-width:0px;border-bottom-width:0px">
									<b>1a</b>
									<span class="styNBSP"/>Name and address of foreign corporation<br/>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/ForeignCorporation/BusinessName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<xsl:choose>
										<xsl:when test="$IRS5471Data/ForeignCorporation/BusinessName/BusinessNameLine2Txt != ''">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/ForeignCorporation/BusinessName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</xsl:when>
									</xsl:choose>
									<br/>
									<xsl:choose>
										<xsl:when test="$IRS5471Data/ForeignCorporation/USAddress">
											<xsl:call-template name="PopulateUSAddressTemplate">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/ForeignCorporation/USAddress"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateForeignAddressTemplate">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/ForeignCorporation/ForeignAddress"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</span>
								<span class="styTableCell" style="text-align:left;width: 70mm;height:16mm;
							border-left-width:1px;border-right:0;border-bottom:0;">
									<span style="width:1mm;"/>
									<b>b(1)&#160;</b>
									<span style="padding-right:3mm;">Employer identification number, if any
                                    </span>
									<span style="padding-top:4mm;float:left;text-align:left;vertical-align:bottom;padding-left:8mm;">
										<xsl:choose>
											<xsl:when test="$IRS5471Data/EmployerEIN != '' ">
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="$IRS5471Data/EmployerEIN"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$IRS5471Data/MissingEmployerEINReasonCd"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</span>
									<span class="styTableCell" style="border:none;border-top:1px solid black;
									padding-left:2mm;width:72mm;border-bottom-width:2px;border-left-width:1px">
										<span style="float:left;">
											<b>b(2)</b>	Reference ID number (see instructions)
			                            	</span>
										<span style="float:right;">
											<xsl:call-template name="SetDynamicTableToggleButton">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/ForeignEntityIdentificationGrp"/>
												<xsl:with-param name="containerHeight" select="1"/>
												<xsl:with-param name="headerHeight" select="0"/>
												<xsl:with-param name="containerID" select=" 'FEIdctn' "/>
											</xsl:call-template>
										</span>
									</span>
								</span>
								<div class="styIRS5471TableContainer" id="FEIdctn" style="height:9mm;border-top-width:1px;
								border-left:1px solid black;border-top:1;width:72mm;padding-left:0mm">
									<xsl:call-template name="SetInitialState"/>
									<table class="styTable" cellspacing="0" style="font-size: 7pt;">
										<tbody>
											<xsl:choose>
												<xsl:when test="count($IRS5471Data/ForeignEntityIdentificationGrp) = 0">
													<tr>
														<td class="styTableCell" style="vertical-align:bottom;height:9mm;border-color:black;border-right:0;">
															<span style="text-align:left;width: 69mm;">
																<br/>
															</span>
														</td>
													</tr>
												</xsl:when>
												<xsl:otherwise>
													<xsl:for-each select="$IRS5471Data/ForeignEntityIdentificationGrp">
														<tr>
															<td class="styTableCell" style="vertical-align:bottom;height:9mm;border-color:black;border-right:0;border-left:0;">
																<span style="font-size:6pt;text-align:left;">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
																	</xsl:call-template>
																	<br/>
																</span>
															</td>
														</tr>
													</xsl:for-each>
												</xsl:otherwise>
											</xsl:choose>
										</tbody>
									</table>
								</div>
							</div>
								<span class="styTableCell" style="width:113.2mm;border:none;">
                              </span>
							<xsl:call-template name="SetInitialDynamicTableHeight">
								<xsl:with-param name="TargetNode" select="$IRS5471Data/ForeignEntityIdentificationGrp"/>
								<xsl:with-param name="containerHeight" select="1"/>
								<xsl:with-param name="headerHeight" select="0"/>
								<xsl:with-param name="containerID" select=" 'FEIdctn' "/>
							</xsl:call-template>
						</xsl:when>
					</xsl:choose>
				<xsl:if test="($Print != $Separated)">
					<span style="width:.8mm"/>
				<!--06-21-2015  In print Preview Mode we have the best available right border alignments  -->
				<span class="styTableCell" style="text-align:left;padding-left:2mm;height:9.5mm;border:none;border-left:1px solid black;
								width:70mm;">
									<b>c</b>
									<span style="width:0mm;padding-left:2mm"/>Country under whose laws incorporated
										<br/>
									<br/>
									<span style="text-align:left; width: 64mm; padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/CountryUnderWhoseLawsIncCd"/>
										</xsl:call-template>
									</span>
								</span>
                                        </xsl:if>
					<!--   END BLOCK 1A, 1B, 1C   -->
					<!--   BEGIN BLOCK 1D, 1E, 1F, 1G, 1H   -->
					<table class="styTable" cellspacing="0" style="width:187mm;border-top:0px solid black;font-size: 7pt">
						<tr>
							<td class="styTableCell" valign="top" style="width: 33mm; height: 10mm; border-color: black;
							         border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px;">
								<span style="width:33mm;text-align:left;padding-left:1mm">
									<b>d</b>
									<span style="width: 1mm"/>Date of incorporation
                               </span>
								<br/>
								<br/>
								<span style="text-align: left; width: 32mm;padding-left:3.5mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/IncorporationDt"/>
									</xsl:call-template>
								</span>
							</td>
							<td class="styTableCell" valign="top" style="width: 42mm; height: 10mm;
							 border-color: black; border-top-width: 1px;border-bottom-width:0px">
								<span style="width:42mm;text-align:left;padding-left:1mm;">
									<b>e</b>
									<span style="width: 1mm"/>Principal place of business
		                     </span>
								<br/>
								<br/>
								<span style="text-align: left; width: 42mm;padding-left:4mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/PrincipalPlaceOfBusCountryCd"/>
									</xsl:call-template>
								</span>
							</td>
							<td class="styTableCell" valign="top" style="width: 39mm; height: 10mm; 
							border-color: black; border-bottom-width: 0px;border-top-width:1px">
								<span style="width:39mm;text-align:left;padding-left:1mm;">
									<b>f</b>
									<span style="width: 1mm"/>Principal business 
	                         </span>
								<span style="text-align: left; width: 39mm;padding-left:3mm">activity code number<br/>
								</span>
								<span style="text-align: left; width: 39mm; padding-left:3.5mm;">
									<xsl:choose>
										<xsl:when test="$IRS5471Data/PrincipalBusinessActivityCd != ''">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/PrincipalBusinessActivityCd"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/InactivePrincipalBusActyCd"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</td>
							<td class="styTableCell" valign="top" style="width: 41mm; height: 10mm; 
							border-color: black; border-bottom-width: 0px;border-top-width:1px">
								<span style="width:41mm;text-align:left;padding-left:1mm;">
									<b>g</b>
									<span style="width: 1mm"/>Principal business activity
	                         </span>
								<br/>
								<div style="width:39mm;text-align:left;; text-align:left;padding-top:3mm;padding-bottom:0mm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/PrincipalBusinessActivityDesc"/>
									</xsl:call-template>
								</div>
							</td>
							<td class="styTableCell" valign="top" style="width: 29mm; height: 10mm;
							 border-color: black;border-bottom-width: 0px; border-right-width: 0px;border-top-width:1px">
								<span style="width:29mm;text-align:left;padding-left:1mm;">
									<b>h</b>
									<span style="width: 1mm;font-size:6pt"/>Functional&#160; &#160;&#160; &#160;&#160; &#160;&#160; &#160;&#160; &#160;&#160; &#160;currency
	                      </span>
								<br/>
								<br/>
								<span style="text-align: left; width: 30mm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/FunctionalCurrencyTxt"/>
									</xsl:call-template>
								</span>
							</td>
						</tr>
					</table>
					<!--   END BLOCK 1D, 1E, 1F, 1G, 1H   -->
					<!--   END BLOCK 1   -->
					<!--   BEGIN BLOCK 2   -->
					<!--   BEGIN LINE 2   -->
					<div class="styBB" style="text-align: left; border-top-width: 1px;width: 187mm">
						<b>2</b>
					<span style="width:1.5mm;"/>
						Provide the following information for the foreign corporation's accounting period stated above.</div>
					<!--   END LINE 2   -->
					<!-- BEGIN BLOCK 2A, 2B   -->
					<table class="styTable" cellspacing="0" style="width:187mm;font-size:7pt;">
						<tr>
							<th scope="col" class="styTableCellHeader " style="border-color:black;height: 2mm;font-weight:normal;
							border-bottom-width: 0px;width: 102mm" valign="top">
								<span style="width:102mm;text-align:left;">
									<b>a</b>
									<span style="width: 1mm"/>
									 Name, address, and identifying number of branch office or agent<br/>
									<span style="width: 3mm"/> (if any) in
										the United States</span>
							</th>
							<th scope="col" class="styTableCellHeader " style="border-color: black;height: 2mm;width: 70mm;border-right-width: 0px;text-align:left;padding-left:2mm" colspan="2">
								<span style="width:70mm;text-align:left;">
                                  <b>b</b>&#160;
									<span style="font-weight:normal">If a U.S. income tax return was filed, enter:</span>
								</span>
							</th>
						</tr>
						<tr>
							<td class="styLNAmountBoxNBB" style="text-align: left; border-left-width: 0px;height:30.5mm;
							border-right-width: 1px; width: 104mm;padding-left:4mm;
							border-bottom-width:1px" valign="top" rowspan="2">
								<xsl:choose>
									<xsl:when test="$IRS5471Data/BranchOfficeInTheUS/PersonNm != ''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/BranchOfficeInTheUS/PersonNm"/>
										</xsl:call-template>
									</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="$IRS5471Data/BranchOfficeInTheUS/BusinessName/BusinessNameLine1Txt != ''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/BranchOfficeInTheUS/BusinessName/BusinessNameLine1Txt"/>
										</xsl:call-template>
									</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="$IRS5471Data/BranchOfficeInTheUS/BusinessName/BusinessNameLine2Txt != ''">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/BranchOfficeInTheUS/BusinessName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</xsl:when>
								</xsl:choose>
								<br/>
								<xsl:if test="$IRS5471Data/BranchOfficeInTheUS/USAddress != ''">
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/BranchOfficeInTheUS/USAddress"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$IRS5471Data/BranchOfficeInTheUS/ForeignAddress != ''">
									<xsl:call-template name="PopulateForeignAddressTemplate">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/BranchOfficeInTheUS/ForeignAddress"/>
									</xsl:call-template>
								</xsl:if>
								<br/>
								<xsl:choose>
									<xsl:when test="$IRS5471Data/USAgentSSN != ''">
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/USAgentSSN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$IRS5471Data/USAgentEIN != ''">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/USAgentEIN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/USAgentMissingEINReasonCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<span class="styTableCellPad"/>
							</td>
							<td scope="col" class="styTableCellHeader " style="font-weight: normal; border-color: black;">
							<div class="styBB" style="width:41mm;height:15mm;border-right-width:0px;padding-top:2mm">
									<i>(i)</i>
									<span style="width:1mm"/>Taxable income or (loss)
								</div>
<div style="border-top-width:1px;padding-left:16mm;height:14.5mm;padding-top:11mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/TaxableIncomeOrNetLossAmt"/>
									</xsl:call-template>
								</div>
							</td>
							<td scope="col" class="styTableCellHeader " style="font-weight: normal; border-color: black;border-right-width:0px;">
								<div class="styBB" style="width:41mm;height:13.5mm;border-right-width:0px">
									<i>(ii)</i>
									<span style="width: 1mm"/>U.S. income tax paid (after all credits)
								</div>
								<div style="border-top-width:1px;padding-left:16mm;height:13mm;padding-top:11mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/USIncomeTaxPaidAfterCrAmt"/>
									</xsl:call-template>
								</div>
							</td>
						</tr>
						<tr>
					</tr>
					</table>
					<span style="float:right;">
						<span class="styTableCellPad"/>
						<span style="float:right;vertical-align:bottom;padding-right:1mm">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonWithRecordsCustody"/>
								<xsl:with-param name="containerHeight" select="1"/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerID" select=" 'PWRCctn' "/>
							</xsl:call-template>
						</span>
					</span>
					<!--   END BLOCK 2A, 2B   -->
					<!-- Adding parent div to the elements a and b of line 2.  If not when the height of the line e is less than the c and d, then this table will appear next to the line e -->
					<div style="width:186mm;float:none;clear:both;border-top:1px solid black;">
						<div class="styBB" style="width:102mm;border-bottom:0;border-right-width:px;clear:none;">
							<!-- Box 2c -->
							<div class="styGenericDiv" style="font-size:7pt; ">
								<b>c</b> &#160;Name and address of foreign corporation's statutory or resident 
				agent in <br/>
								<span style="width:2mm"/>   country of incorporation<br/>
								<br/>
								<span style="padding-left:3mm">
									
								
								<div style="font-family:verdana;">
									<xsl:choose>
										<xsl:when test="$IRS5471Data/FrgnCorpStatutoryOrResidentAgt/PersonNm != ''">
	
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/FrgnCorpStatutoryOrResidentAgt/PersonNm"/>
											</xsl:call-template>
										</xsl:when>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="$IRS5471Data/FrgnCorpStatutoryOrResidentAgt/BusinessName/BusinessNameLine1Txt != ''">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/FrgnCorpStatutoryOrResidentAgt/BusinessName/BusinessNameLine1Txt"/>
											</xsl:call-template>
										</xsl:when>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="$IRS5471Data/FrgnCorpStatutoryOrResidentAgt/BusinessName/BusinessNameLine2Txt != ''">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/FrgnCorpStatutoryOrResidentAgt/BusinessName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</xsl:when>
									</xsl:choose>
								</div>
								<br/>
								<xsl:if test="$IRS5471Data/FrgnCorpStatutoryOrResidentAgt/USAddress != ''">
									<xsl:call-template name="PopulateUSAddressTemplate">
									<xsl:with-param name="TargetNode" select="$IRS5471Data/FrgnCorpStatutoryOrResidentAgt/USAddress"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$IRS5471Data/FrgnCorpStatutoryOrResidentAgt/ForeignAddress != ''">
									<xsl:call-template name="PopulateForeignAddressTemplate">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/FrgnCorpStatutoryOrResidentAgt/ForeignAddress"/>
									</xsl:call-template>
								</xsl:if>
								</span>
							</div>
						</div>
						<!-- Box 2d -->
						<xsl:if test="($Print != $Separated) or (count($IRS5471Data/PersonWithRecordsCustody) = 1)">
							<span id="PWRCctn" style="height:auto;width:84mm;border-left:0px solid black;" class="styIRS5471TableContainer">
								<xsl:call-template name="SetInitialState"/>
								<table class="styTable" cellspacing="0" name="PWRCTable" id="PWRCTable">
									<thead>
										<tr style="border-left-width:0px solid black;">
											<th class="styTableCellHeader" style="width:4mm;border-left-width:0px;border-bottom-width:0px ;text-align:left;vertical-align:top;border-right-width:1px;
											padding-left:1mm;font-size:7pt;padding-top:0mm;" scope="col">
											
											</th>
											<th class="styTableCellHeader" style="width:76mm;border:none;font-weight:normal;text-align:left;
											vertical-align:top;font-size:7pt;background-color:" scope="col">
											<b>d</b>
											<!--<span style="padding-left:1mm">-->
												
											
											 Name and address (including corporate
											department,  if <br/><span style="padding-left:2mm">applicable) of person (or persons)
											with custody of the books and records of the
											foreign corporation, and the location of such
											books and records, if different <br/></span>
												<br/>
											</th>
										</tr>
									</thead>
									<tfoot/>
									<tbody>
										<!-- Display all rows of Line 2b if the print option is not "separated" -->
										<!-- If the print option is "separated", but there is only one row, display the row -->
										<xsl:for-each select="$IRS5471Data/PersonWithRecordsCustody">
											<tr>
												<td class="styTableCell" style="width:4mm;vertical-align:top;text-align:left;
												border:none;border-bottom-width:1px solid black">
													<xsl:if test="position()=last()">
														<xsl:attribute name="style">width:4mm;vertical-align:top;text-align:left;border:none;</xsl:attribute>
													</xsl:if>
													<span style="width:4px;"/>
												</td>
												<td class="styTableCell" style="width:76mm;text-align:left;vertical-align:top;
												border:none;font-size:7pt;border-bottom:1px solid black">
													<xsl:if test="position()=last()">
														<xsl:attribute name="style">width:84mm;text-align:left;vertical-align:top;
												font-size:7pt;border-left-width:1px;border-bottom-width:0px;border-right-width:0px</xsl:attribute>
													</xsl:if>
													<span style="font-family:verdana;">
													
														<xsl:choose>
														
															<xsl:when test="BusinessName/BusinessNameLine1Txt !=''">
															<span style="padding-left:2mm">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
																</xsl:call-template>
																<xsl:if test="BusinessName/BusinessNameLine2Txt !=''">
																	<br/>
																	<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
																	</xsl:call-template>
																</xsl:if>
																</span>
															</xsl:when>
															<xsl:otherwise>
															<span style="padding-left:2mm">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="PersonNm"/>
																</xsl:call-template></span>
															</xsl:otherwise>
														</xsl:choose>
													</span>
													<br/>
													<br/>
													<xsl:choose>
														<xsl:when test="USAddress">
														<span style="padding-left:2mm">
															
														
															<xsl:call-template name="PopulateUSAddressTemplate">
																<xsl:with-param name="TargetNode" select="USAddress"/>
															</xsl:call-template></span>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateForeignAddressTemplate">
																<xsl:with-param name="TargetNode" select="ForeignAddress"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
													<br/>
													<br/>
													<xsl:choose>
													
														<xsl:when test="LocationAddressInUS">
														<span style="padding-left:2mm">
															<xsl:call-template name="PopulateUSAddressTemplate">
																<xsl:with-param name="TargetNode" select="LocationAddressInUS"/>
															</xsl:call-template></span>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateForeignAddressTemplate">
																<xsl:with-param name="TargetNode" select="LocationAddressInForeign"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
										</xsl:for-each>
									</tbody>
								</table>
							</span>
							<xsl:call-template name="SetInitialDynamicTableHeight">
								<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonWithRecordsCustody"/>
								<xsl:with-param name="containerHeight" select="1"/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerID" select=" 'PWRCctn' "/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="(($Print = $Separated) and (count($IRS5471Data/PersonWithRecordsCustody) &gt; 1))">
							<span style="border-left:1px solid black;height:35mm">
								<span class="styTableCell" style="width:8mm;border:none;text-align:left;vertical-align:top;padding-left:1mm;font-size:7pt;padding-top:0mm;" scope="col">
									<b>d</b>
								</span>
								<span class="styTableCell" style="width:70mm;border-color:black;border:none;font-weight:normal;
								text-align:left;vertical-align:top;font-size:7pt;" scope="col">
Name and address (including corporate
department, if applicable) of person (or persons) 
with custody of the books and records of the
foreign corporation, and the location of such
books and records, if different 
<br/>
									<xsl:if test="count($IRS5471Data/PersonWithRecordsCustody) &gt; 1">
										<br/>
										<span style="font-family:verdana;">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonWithRecordsCustody"/>
											</xsl:call-template>
										</span>
									</xsl:if>
								</span>
							</span>
						</xsl:if>
					</div>
					<!--   END BLOCK 2C, 2D   -->
				<p style="page-break-before:always"/>
					<!--   BEGIN SCHEDULE A HEADER   -->
					<div class="styBB" style="width:186mm; border-top: 1px solid black;">
					<div class="styPartName" style="width: 22mm;height:4.5mm">Schedule A</div>
						<div class="styPartDesc" style="width: 158mm;">Stock of the Foreign Corporation</div>
						<div style="height:2mm;float:right;clear:none;width:3mm;"> 
                                                        <xsl:call-template name="SetDynamicTableToggleButton"> 
                                                                <xsl:with-param name="TargetNode" select="$IRS5471AData/StockOfTheForeignCorporation"/> 
                                                                <xsl:with-param name="containerHeight" select="4"/> 
                                                                        <xsl:with-param name="containerID" select=" 'SCctn' "/>

                                                        </xsl:call-template> 
                                                        </div>
                                                </div>

					<!--   END SCHEDULE A HEADER   -->
					<!--  BEGIN A, B, i and ii   -->
					 <div class="styTableContainer" style="width:187mm;height:auto;" id="SCctn">
						<!--print logic-->
						<xsl:call-template name="SetInitialState"/>
						<!--end-->
						<table class="styTable" cellspacing="0" id="SCTable" style="font-size: 7pt">
							<thead class="styTableThead">
								<tr>
									<th scope="col" class="styTableCellHeader" style="border-color:black; width: 90mm; text-align: center" rowspan="2">
                    (a)<span class="styNormalText">&#160;Description of each class of stock</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="border-color:black; width: 96mm; text-align: center; border-right-width: 0px;" colspan="2">
                    (b)<span class="styNormalText">&#160;Number of shares issued and outstanding</span>
									</th>
								</tr>
								<tr>
									<th scope="col" class="styTableCellHeader" style="border-color:black; width: 48mm; text-align: center;">
										<span class="styNormalText">
											<span class="styItalicText">(i)</span> Beginning of annual accounting period</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="border-color:black; width: 48mm; border-right-width:0px;">
										<span class="styNormalText">
											<span class="styItalicText">(ii)</span> End of annual accounting period</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS5471AData/StockOfTheForeignCorporation">
									<xsl:if test="($Print != $Separated) or (count($IRS5471AData/StockOfTheForeignCorporation) &lt;=4)">
										<tr>
											<td class="styTableCell" style="border-color:black; width: 90mm; text-align: left">
												<xsl:choose>
													<xsl:when test="StockClassDesc">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="StockClassDesc"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="StockClassTypeCd "/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; width: 48mm;text-align:right">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AnnualAcctPeriodBeginShareCnt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; width: 48mm; text-align: right; border-right-width: 0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AnnualAcctPeriodEndShareCnt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<xsl:call-template name="AddRowsScheduleAI">
									<xsl:with-param name="NumOfRows" select="4"/>
									<xsl:with-param name="StockCount" select="count($IRS5471AData/StockOfTheForeignCorporation)"/>
								</xsl:call-template>
							</tbody>
						</table>
					</div>
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$IRS5471AData/StockOfTheForeignCorporation"/>
								<xsl:with-param name="containerHeight" select="4"/>
								<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerID" select=" 'SCctn' "/>
							</xsl:call-template>
					<!--   END A, B, i and ii   -->
						<xsl:if test="($Print = $Separated)">
					<span style="height:3mm"/>
					</xsl:if>
					<!--BEGIN FOOTER-->
					<div style="width:187mm; border-color: black; border-style: solid; border-right-width: 0px;
					 border-left-width: 0px; border-top-width: 1px; border-bottom-width: 0px;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see instructions.</span>
						<div style="float:right">
    Cat. No. 49958V 
    <span style="width:90px"/>
    Form <span class="styBoldText" style="font-size: 8pt">5471</span> (Rev. 12-2012)
  </div>
					</div>
					<!--<div class="pageEnd"/>-->
					<!--END FOOTER-->
					<p style="page-break-before:always"/>
					<!--BEGIN HEADER-->
					<div class="styGenericDiv" style="width:187mm">
						<div style="float: left; clear: none">Form 5471 (Rev. 12-2012)</div>
						<div style="float:right">
    Page <span class="styBoldText" style="font-size: 8pt">2</span>
						</div>
					</div>
					<!--END HEADER-->
					<!--   BEGIN SCHEDULE B   -->
					<!--   BEGIN SCHEDULE B HEADER   -->
					<div class="styBB" style="width:187mm; border-top: 2px solid black;">
						<div class="styPartName" style="width: 22mm;height:4mm">Schedule B</div>
						<div class="styPartDesc" style="width: 160mm;">
                	U.S. Shareholders of Foreign Corporation <span style="font-size: 8pt; width: 80mm; font-weight: normal">(see instructions.)</span>
						</div>
						<span style="width:5mm;text-align:right;float:right; clear: none">
<xsl:if test="($Print != $Separated) and (count($IRS5471BData/USShareholdersOfForeignCorp) &gt; 5)">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$IRS5471BData/USShareholdersOfForeignCorp"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="containerID" select=" 'FSctn' "/>
							</xsl:call-template>
</xsl:if>
						</span>
						<!--   END SCHEDULE B HEADER   -->
						<!-- take this out later -->
					</div>
					<!--  BEGIN TABLE SCHEDULE B   -->
					<div class="styTableContainer"  id="FSctn" style="width:187mm;height:auto;clear:both;">
					<!--print logic-->
					<xsl:call-template name="SetInitialState"/>
					<!--end-->
					<table class="styTable" cellspacing="0" name="FSTable" id="FSTable">
						<thead class="styTableThead">
							<tr>
								<th scope="col" class="styTableCell" style="border-color: black; width: 50mm; text-align: center;font-weight:normal">
								<b>(a)</b>
&#160; Name, address, and identifying number of shareholder
								</th>
								<th scope="col" class="styTableCell" style="border-color: black; width: 50mm; text-align:center;font-weight:normal">
                   <b>(b)</b> Description of each class of stock held by shareholder <b>Note:</b>
										<i> This description should match the corresponding description entered in Schedule A, column (a).</i>
								</th>
								<th scope="col" class="styTableCell" style="border-color: black; width: 29mm; text-align:center;font-weight:normal">
                    <b>(c)</b> Number of shares held at beginning of annual accounting period
								</th>
								<th scope="col" class="styTableCell" style="border-color: black; width: 29mm; text-align: center; border-right-width: 1px;font-weight:normal">
                   <b>(d)</b> Number of shares held at end of annual accounting period
								</th>
								<th scope="col" class="styTableCell" style="border-color: black; width: 26mm; text-align: center; border-right-width: 0px;font-weight:normal">
                   <b>(e)</b> Pro rata share of subpart F income (enter as a percentage)
								</th>
							</tr>
						</thead>
						<tfoot/>
						<tbody>
							<xsl:for-each select="$IRS5471BData/USShareholdersOfForeignCorp">
								<xsl:variable name="FSRowCount" select="count(ForeignCorporationStocks)"/>
									<xsl:if test="($Print != $Separated) or ((count($IRS5471BData/USShareholdersOfForeignCorp[count(ForeignCorporationStocks) &gt; 4]) &lt;=0))          and (count($IRS5471BData/USShareholdersOfForeignCorp) &lt;=5)">
									<xsl:for-each select="ForeignCorporationStocks">
										<xsl:choose>
											<xsl:when test="position()=1">
												<tr>
													<td class="styTableCell" style="border-color: black; text-align:left; width: 60mm">
														<xsl:choose>
															<xsl:when test="$FSRowCount&gt;4">
																<xsl:attribute name="rowspan"><xsl:value-of select="$FSRowCount"/></xsl:attribute>
															</xsl:when>
															<xsl:otherwise>
																<xsl:attribute name="rowspan">4</xsl:attribute>
															</xsl:otherwise>
														</xsl:choose>
														<xsl:choose>
															<xsl:when test="../PersonNm != ''">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="../PersonNm"/>
																</xsl:call-template>
															</xsl:when>
														</xsl:choose>
														<xsl:choose>
															<xsl:when test="../BusinessName/BusinessNameLine1Txt != ''">
																<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="../BusinessName/BusinessNameLine1Txt"/>
																</xsl:call-template>
															</xsl:when>
														</xsl:choose>
														<xsl:choose>
															<xsl:when test="../BusinessName/BusinessNameLine1Txt != ''">
																<br/>
																<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="../BusinessName/BusinessNameLine2Txt"/>
																</xsl:call-template>
															</xsl:when>
														</xsl:choose>
														<xsl:choose>
															<xsl:when test="../USAddress != ''">
																<br/>
																<xsl:call-template name="PopulateUSAddressTemplate">
																	<xsl:with-param name="TargetNode" select="../USAddress"/>
																</xsl:call-template>
															</xsl:when>
														</xsl:choose>
														<xsl:choose>
															<xsl:when test="../ForeignAddress != ''">
																<br/>
																<xsl:call-template name="PopulateForeignAddressTemplate">
																	<xsl:with-param name="TargetNode" select="../ForeignAddress"/>
																</xsl:call-template>
															</xsl:when>
														</xsl:choose>
														<br/>
														<xsl:choose>
															<xsl:when test="../ShareholderEIN != ''">
																<xsl:call-template name="PopulateEIN">
																	<xsl:with-param name="TargetNode" select="../ShareholderEIN"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:when test="../ShareholderSSN != ''">
																<xsl:call-template name="PopulateSSN">
																	<xsl:with-param name="TargetNode" select="../ShareholderSSN"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="../ShareholderMissingEINReasonCd"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="text-align:left; border-color: black; width: 50mm;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="StockClassDesc"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="text-align:left;border-color: black;text-size:4mm; width: 29mm;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="AnnualAcctPeriodBeginShareCnt"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="text-align:left;border-color: black; text-size:5mm;width: 29mm;border-right-width: 1px">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="AnnualAcctPeriodEndShareCnt"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="border-color: black; width: 24mm; text-align: right; border-right-width: 0px">
														<xsl:choose>
															<xsl:when test="$FSRowCount&gt;4">
																<xsl:attribute name="rowspan"><xsl:value-of select="$FSRowCount"/></xsl:attribute>
															</xsl:when>
															<xsl:otherwise>
																<xsl:attribute name="rowspan">4</xsl:attribute>
															</xsl:otherwise>
														</xsl:choose>
														<xsl:call-template name="PopulatePercent">
															<xsl:with-param name="TargetNode" select="../ProRataShareSubpartFIncomeRt"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
													<td class="styIRS5471TableLastCol" id="FSspcr"/>
												</tr>
												<xsl:if test="position()=last()">
													<xsl:call-template name="AddSubRows">
														<xsl:with-param name="RowNumber" select="position()"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:when>
											<xsl:otherwise>
												<tr>
													<td class="styTableCell" style="border-color: black; width: 50mm;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="StockClassDesc"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="text-align:left;text-size:5mm;border-color: black; width: 29mm;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="AnnualAcctPeriodBeginShareCnt"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="text-align:left;text-size:5mm;border-color: black; width: 29mm;border-right-width: 1px">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="AnnualAcctPeriodEndShareCnt"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
													<td class="styIRS5471TableLastCol" id="FSspcr"/>
												</tr>
												<xsl:if test="position()=last()">
													<xsl:call-template name="AddSubRows">
														<xsl:with-param name="RowNumber" select="position()"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:for-each>
								</xsl:if>
							</xsl:for-each>
							<xsl:call-template name="AddRowsScheduleB">
								<xsl:with-param name="NumOfRows" select="5"/>
								<xsl:with-param name="ShareholdersCount" select="count($IRS5471BData/USShareholdersOfForeignCorp)"/>
								<xsl:with-param name="StockSetsCount" select="count($IRS5471BData/USShareholdersOfForeignCorp[count(ForeignCorporationStocks) &gt; 4])"/>
							</xsl:call-template>
						</tbody>
					</table>
					</div>
			<xsl:if test="($Print != $Separated) and (count($IRS5471BData/USShareholdersOfForeignCorp) &gt; 5)">
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$IRS5471BData/USShareholdersOfForeignCorp"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="containerID" select=" 'FSctn' "/>
					</xsl:call-template>
					</xsl:if>
					<!--  END SCHEDULE B   -->
					<!--<div class="styBB" style="width:187mm">-->
						<!--  BEGIN SCHEDULE C   -->
						<div class="styBB" style="width:187mm">
							<div class="styPartName" style="width: 22mm;">Schedule C</div>
							<div class="styPartDesc" style="width: 165mm;">Income Statement
								 <span style="font-size: 8pt; width: 80mm; font-weight: normal">
								 (see instructions.)</span>
							</div>
						</div>
						<div class="styBB" style="width:187mm;">
							<div class="styLNDesc" style="height:auto;width:187mm; font-size: 8pt;font-style:italic;">
										<span style="font-weight: normal">	<b>Important: </b> </span>
							    Report all information in functional currency in accordance with U.S. GAAP.  Also, report each amount in  U.S.  <br/>
								dollars translated from functional currency (using GAAP translation rules).  However, if the  functional currency is the U.S.<br/>
								 dollar, complete only the U.S. Dollars column.  See instructions for special rules for DASTM corporations. 
							</div>
						</div>	
						<!--   BEGIN LINE 1   -->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS5471Img" style="height:52mm;width:4mm;
								padding-top:22mm;">
								<img src="{$ImagePath}/5471_Income.gif" alt="VerticalIncome"/>
						</div>
						<!--   BEGIN LINE 1A   -->
						<div  style="height:52mm;width:183mm;">
				
							<div class="styLNLeftNumBox" style="padding-left: 2.25mm"/>
							<div class="styLNDesc" style="width:89mm;height:4mm;">	
								</div>
							<div class="styLNRightNumBox" style="border-top-width:0px;border-left-width:0px;border-bottom-width:0px;height:4mm"/>
							<div class="styLNAmountBox" style="width:39mm;height:4mm;text-align:center;">
								<b>Functional Currency</b>
							</div>
							<div class="styLNAmountBox" style="width:39mm;height:4mm;text-align:center">
								<b>U.S. Dollars</b>
							</div>
							<!--   END LINE 1A   -->
							<!--   BEGIN LINE 1A   -->
	<!--						<span class="styIRS5471Img" style="height:48mm;width:4mm;
								padding-top:15mm; border-bottom-width: 1px">
								<img src="{$ImagePath}/5471_Income.gif" alt="VerticalIncome"/>
							</span>-->
							<div>
								<div class="styLNLeftNumBox" style="padding-left: 2.25mm">1a</div>
								<div class="styLNDesc" style="width:89mm;">Gross receipts or sales
									<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
								</div>
								<div class="styLNRightNumBox" style="height:4mm;border-top-width:1px">1a</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignGrossReceiptsOrSalesAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USGrossReceiptsOrSalesAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--   END LINE 1A   -->
							<!--   BEGIN LINE 1B   -->
							<div>
								<div class="styLNLeftNumBox" style="padding-left:4mm">b</div>
								<span>
									</span>
								<div class="styLNDesc" style="width:89mm;">Returns and allowances
									<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
								</div>
								<div class="styLNRightNumBox" style="height:4mm">1b</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignReturnsAndAllowancesAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USReturnsAndAllowancesAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--   END LINE 1B   -->
							<!--   BEGIN LINE 1C   -->
							<div>
								<div class="styLNLeftNumBox" style="padding-left: 4mm">c</div>
								<div class="styLNDesc" style="width:89mm;">Subtract line 1b from line 1a
									<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
								</div>
								<div class="styLNRightNumBox">1c</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignNetGrossReceiptsAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USNetGrossReceiptsAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--   END LINE 1C   -->
							<!--   END LINE 1   -->
							<!--   BEGIN LINE 2   -->
							<div>
								<div class="styLNLeftNumBoxSD">2</div>
								<div class="styLNDesc" style="width:89mm;">Cost of goods sold
									<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
								</div>
								<div class="styLNRightNumBox">2</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignCostOfGoodsSoldAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USCostOfGoodsSoldAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--   END LINE 2   -->
							<!--   BEGIN LINE 3   -->
							<div>
								<div class="styLNLeftNumBoxSD">3</div>
								<div class="styLNDesc" style="width:89mm;">Gross profit (subtract line 2 from line 1c)
									<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
								</div>
								<div class="styLNRightNumBox">3</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignGrossProfitAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USGrossProfitAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--   END LINE 3   -->
							<!--   BEGIN LINE 4   -->
							<div>
								<div class="styLNLeftNumBoxSD">4</div>
								<div class="styLNDesc" style="width:89mm;">Dividends
									<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
								</div>
								<div class="styLNRightNumBox">4</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignDividendsAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USDividendsAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--  END LINE 4   -->
							<!--   BEGIN LINE 5   -->
							<div>
								<div class="styLNLeftNumBoxSD">5</div>
								<div class="styLNDesc" style="width:89mm;">Interest
									<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
								</div>
								<div class="styLNRightNumBox">5</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignInterestIncomeAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USInterestIncomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--  END LINE 5   -->
							<!--   BEGIN LINE 6a   -->
							<div>
								<div class="styLNLeftNumBox" style="padding-left: 2.25mm">6a</div>
								<div class="styLNDesc" style="width:89mm;">Gross rents
									<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
								</div>
								<div class="styLNRightNumBox">6a</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignGrossRentsAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USGrossRentsAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--  END LINE 6a   -->
							<!--   BEGIN LINE 6b   -->
							<div>
								<div class="styLNLeftNumBox" style="padding-left: 4mm">b</div>
								<div class="styLNDesc" style="width:89mm;">Gross royalties and license fees
									<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
								</div>
								<div class="styLNRightNumBox">6b</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/FrgnGrRoyaltiesAndLcnsFeesAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USGrRoyaltiesAndLcnsFeesAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--  END LINE 6b   -->
							<!--   BEGIN LINE 7   -->
							<div>
								<div class="styLNLeftNumBoxSD">7</div>
								<div class="styLNDesc" style="width:89mm;">Net gain or (loss) on sale of capital assets
									<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
								</div>
								<div class="styLNRightNumBox">7</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/FrgnNetGainOrLossSaleCapAstAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USNetGainOrLossSaleCapAstAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--  END LINE 7   -->
							<!--   BEGIN LINE 8   -->
							<div>
								<div class="styLNLeftNumBoxSD">8</div>
								<div class="styLNDesc" style="width:89mm;">Other income (attach statement)
									<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
								</div>
								<div class="styLNRightNumBox">8</div>
								<div class="styLNAmountBox" style="width:39mm;">
									<span style="float:left">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignOtherIncomeAmt"/>
										</xsl:call-template>
									</span>
									<span style="float:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignOtherIncomeAmt"/>
											<xsl:with-param name="MaxSize" select="17"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styLNAmountBox" style="width: 39mm;height: 4mm">
								<span style="float:left; clear:none">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USOtherIncomeAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/USOtherIncomeAmt"/>
								</xsl:call-template>
							</div>
							</div>
							<!--  END LINE 8   -->
							<!--   BEGIN LINE 9   -->
							<div>
								<div class="styLNLeftNumBoxSD" >9</div>
								<div class="styLNDesc" style="width:89mm;">Total income (add lines 3 through 8)
									<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
								</div>
								<div class="styLNRightNumBox"  style="border-bottom-width: 0px;">9</div>
								<div class="styLNAmountBox" style="width:39mm;border-bottom-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignTotalIncomeAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:39mm;border-bottom-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USTotalIncomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>	
						<!--  END LINE 9   -->
						<!--   BEGIN LINE 10   -->
						<div style="width:187mm">
							<div class="styIRS5471Img" style="height:44mm;width:4mm;padding-top:12mm; border-bottom-width: 1px">
								<img src="{$ImagePath}/5471_Deductions.gif" alt="VerticalDeductions"/>
							</div>
							<div>
								<!-- this is the place II -->
								<div class="styLNLeftNumBox">10</div>
								<div class="styLNDesc" style="width:89mm;">Compensation not deducted elsewhere
									<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
								</div>
								<div class="styLNRightNumBox">10</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignCompensationNotDedAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USCompensationNotDedAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--  END LINE 10   -->
							<!--   BEGIN LINE 11a   -->
							<div>
								<div class="styLNLeftNumBox">11a</div>
								<div class="styLNDesc" style="width:89mm;">Rents
									<span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
								</div>
								<div class="styLNRightNumBox">11a</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignRentsAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USRentsAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--  END LINE 11a   -->
							<!--   BEGIN LINE 11b   -->
							<div>
								<div class="styLNLeftNumBoxSD" style="padding-left:5mm;">b</div>
								<div class="styLNDesc" style="width:89mm;">Royalties and license fees
									<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
								</div>
								<div class="styLNRightNumBox">11b</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/FrgnRoyaltiesAndLcnsFeesAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USRoyaltiesAndLcnsFeesAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--  END LINE 11b   -->
							<!--   BEGIN LINE 12   -->
							<div>
								<div class="styLNLeftNumBox">12</div>
								<div class="styLNDesc" style="width:89mm;">Interest
									<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
								</div>
								<div class="styLNRightNumBox">12</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignInterestDeductionAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USInterestDeductionAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--  END LINE 12   -->
							<!--   BEGIN LINE 13   -->
							<div>
								<div class="styLNLeftNumBox">13</div>
								<div class="styLNDesc" style="width:89mm;">Depreciation not deducted elsewhere
									<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
								</div>
								<div class="styLNRightNumBox">13</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignDepreciationNotDedAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USDepreciationNotDedAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--  END LINE 13   -->
							<!--   BEGIN LINE 14  -->
							<div>
								<div class="styLNLeftNumBox">14</div>
								<div class="styLNDesc" style="width:89mm;">Depletion
									<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
								</div>
								<div class="styLNRightNumBox">14</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignDepletionAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USDepletionAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--  END LINE 14   -->
							<!--   BEGIN LINE 15   -->
							<div>
								<div class="styLNLeftNumBox">15</div>
								<div class="styLNDesc" style="width:89mm;">
                                  Taxes (exclude provision for income, war profits, and excess</div>
								<div class="styLNRightNumBox" style="border-bottom-width: 0px">
									<span style="width: 1px"/>
								</div>
								<div class="styLNAmountBox" style="width:39mm; border-bottom-width: 0px">
									<span style="width: 1px"/>
								</div>
								<div class="styLNAmountBox" style="width:39mm; border-bottom-width: 0px; width:39mm">
									<span style="width: 1px"/>
								</div>
							</div>
							<div>
								<div class="styLNLeftNumBox">
									<span style="width: 1px"/>
								</div>
								<div class="styLNDesc" style="width:89mm;">profits  taxes)
									<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
								</div>
								<div class="styLNRightNumBox">15</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignTaxesAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USTaxesAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--  END LINE 15   -->
							<!--   BEGIN LINE 16   -->
							<div>
								<div class="styLNLeftNumBox" style="height:8mm">16</div>
								<div class="styLNDesc" style="width:89mm;height:8mm">
                                        Other deductions (attach statement-exclude provision for<br/>
                                        income, war profits, and excess profits taxes)
 									<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
								</div>
								<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">16</div>
								<div class="styLNAmountBox" style="width: 39mm;height: 8mm;padding-top:4mm">
							<div style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignOtherDeductionsAmt"/>
								</xsl:call-template>
							</div>
							<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignOtherDeductionsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 39mm;height: 8mm;padding-top:4mm">
							<div style="float:left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/USOtherDeductionsAmt"/>
								</xsl:call-template>
							</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471CData/USOtherDeductionsAmt"/>
							</xsl:call-template>
						</div>
							</div>
							<!--  END LINE 16   -->
							<br/>
							<!--   BEGIN LINE 17   -->
							<div>
								<div class="styLNLeftNumBoxSD" style="border-color: black; border-style:solid;padding-left:1mm;
								 border-left-width: 0px; border-right-width: 0px; border-top-width: 0px;
								   border-bottom-width: 1px">17</div>
								<div class="styLNDesc" style="border-color: black; border-style:solid; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; width:89mm;; border-bottom-width: 1px">Total deductions (add lines 10 through 16)
									<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
								</div>
								<div class="styLNRightNumBox">17</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignTotalDeductionsAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USTotalDeductionsAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--  END LINE 17   -->
						<div style="width:187mm">
							<!--   BEGIN LINE 18   -->
								<div class="styIRS5471Img" style="height:32mm;width:4mm;padding-top:6mm; border-bottom-width: 0px">
								<img src="{$ImagePath}/5471_NetIncome.gif" alt="VerticalNetIncome"/>
							</div>
							<div>
								<div class="styLNLeftNumBox">18</div>
								<div class="styLNDesc" style="width:89mm;">
								Net income or (loss) before extraordinary items, prior period</div>
								<div class="styLNRightNumBox" style="background-color: lightgrey;
								 border-bottom-width: 0px">
									<span style="width: 1px"/>
								</div>
								<div class="styLNAmountBox" style="width:39mm;background-color:lightgrey; border-bottom-width: 0px">
									<span style="width: 1px"/>
								</div>
								<div class="styLNAmountBox" style="border-bottom-width: 0px; background-color: lightgrey; width:39mm">
									<span style="width: 1px"/>
								</div>
							</div>
							<div>
								<div class="styLNLeftNumBox"/>
								<div class="styLNDesc" style="width:89mm;">
								adjustments, and the provision for income, war profits, and</div>
								<div class="styLNRightNumBox" style="background-color:lightgrey; border-bottom-width: 0px">
									<span style="width: 1px"/>
								</div>
								<div class="styLNAmountBox" style="width:39mm; background-color:lightgrey; border-bottom-width: 0px">
									<span style="width: 1px"/>
								</div>
								<div class="styLNAmountBox" style="border-bottom-width: 0px; background-color: lightgrey; width:39mm">
									<span style="width: 1px"/>
								</div>
							</div>
							<div>
								<div class="styLNLeftNumBox"/>
								<div class="styLNDesc" style="width:89mm;">excess profits taxes (subtract line 17 from line 9)
									<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
								</div>
								<div class="styLNRightNumBox">18</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/FrgnTotalIncomeMinusTotDedAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USTotalIncomeMinusTotDedAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--  END LINE 18   -->
							<!--   BEGIN LINE 19   -->
							<div>
								<div class="styLNLeftNumBox">19</div>
								<div class="styLNDesc" style="width:89mm;">
								Extraordinary items and prior period adjustments (see instructions)
							</div>
								
								<div class="styLNRightNumBox" style="height:4mm;">19</div>
								<div class="styLNAmountBox" style="width:39mm;height:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignExtraordinaryItemsAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:39mm;height:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USExtraordinaryItemsAmt"/>
									</xsl:call-template>
								</div>
							</div><br/>
							<!--  END LINE 19  -->
							<!--   BEGIN LINE 20   -->
							<div>
								<div class="styLNLeftNumBox" style=";height:8mm"> 20</div>
								<div class="styLNDesc" style="width:89mm;;height:6mm">
								    Provision for income, war profits, and excess profits taxes (see instructions)
									<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
								</div>
								<div class="styLNRightNumBox" style="padding-top:4mm;height:8mm">20</div>
								<div class="styLNAmountBox" style="padding-top: 4mm;width:39mm;height:8mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignProvisionForIncomeAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="padding-top:4mm;width:39mm;height:8mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USProvisionForIncomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--  END LINE 20  -->
							<!--   BEGIN LINE 21   -->
							<div>
								<div class="styLNLeftNumBox">21</div>
								<div class="styLNDesc" style="width:89mm;;height:8mm">
								Current year net income or (loss) per books (combine lines 18<br/>
								through 20)
									<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
								</div>
								<div class="styLNRightNumBox" style=";height:8mm;border-bottom-width: 0px; padding-top:4mm">21</div>
								<div class="styLNAmountBox" style=";height:8mm;padding-top:4mm; width:39mm;border-bottom-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignCYNetIncomePerBooksAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style=";height:8mm;padding-top:4mm; border-bottom-width: 0px; width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USCYNetIncomePerBooksAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--  END LINE 21 -->
						<!--	</tbody>-->
						<!--	</table>-->
					<!--</div>-->
					<!--BEGIN FOOTER-->
					<div style="width:187mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 1px; border-bottom-width: 0px">
						<div style="float:right">
                        Form <span class="styBoldText" style="font-size: 8pt">5471</span> (Rev. 12-2012)
                      </div>
					</div>
					<!--<div class="pageEnd"/>-->
					<p style="page-break-before:always"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styGenericDiv" style="width:187mm">
						<div style="float: left; clear: none">Form 5471 (Rev. 12-2012)</div>
						<div style="float:right"> Page <span class="styBoldText" style="font-size: 8pt">3</span>
						</div>
					</div>
					<!--END HEADER-->
					<br/>
					<!--   BEGIN SCHEDULE E   -->
					<!--   BEGIN SCHEDULE E HEADER   -->
					<div class="styBB" style="width:187mm; border-top: 2px solid black;">
						<div class="styPartName" style="width: 22mm; height:4.5mm;'">Schedule E</div>
						<div class="styPartDesc" style="width: 158mm;">
                              Income, War Profits, and Excess Profits Taxes Paid or Accrued 
                            <span style="font-size: 7pt; width: 43mm; font-weight: normal;">(See instructions.)</span>
						</div>
						<span style="float:right;">
							<span class="styTableCellPad"/>
							<span style="float:right;vertical-align:bottom;">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$IRS5471EData/IncomeAndWarProfitsTaxesPaid"/>
									<xsl:with-param name="containerHeight" select="2"/>
									<xsl:with-param name="headerHeight" select="4"/>
									<xsl:with-param name="containerID" select=" 'PActn' "/>
								</xsl:call-template>
							</span>
						</span>
					</div>
					<!--   END SCHEDULE E HEADER   -->
					<!--  BEGIN A, B, C and D   -->
					<div class="styIRS5471TableContainer" style="height: 38mm;float:left;clear:none;" name="PActn" id="PActn">
						<!--print logic-->
						<xsl:call-template name="SetInitialState"/>
						<!--end-->
						<table class="styTable" cellspacing="0" name="PATable" id="PATable" style="font-size: 7pt">
							<thead class="styTableThead">
								<tr>
									<th scope="col" class="styTableCellHeader" style="border-color: black; width: 76mm;" rowspan="2">
										<b>(a)</b>
										<br/>
										<span class="styNormalText">Name of country or U.S. possession</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="border-color:black; height:4mm;width:110mm; border-right-width:0px" colspan="3">
										<b>
											<span class="styBoldText">Amount of Tax</span>
										</b>
									</th>
								</tr>
								<tr>
									<th scope="col" class="styTableCellHeader" style="border-color:black; height:7.25mm;width:36mm;">
										<b>(b)</b>
										<br/>
										<span class="styNormalText">In foreign currency</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="border-color:black; width:44mm;">
										<b>(c)</b>
										<br/>
										<span class="styNormalText">Conversion rate</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="border-color:black; width: 32mm; border-right-width:0px">
										<b>(d)</b>
										<br/>
										<span class="styNormalText">In U.S. dollars</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<tr style="height:4mm;">
									<td class="styTableCell" style="border-color:black; width:76mm; text-align: left;">
										<span style="width: 1mm"/>
										<b>1</b>
										<span style="width: 2mm"/>U.S.
                                    </td>
									<td class="styTableCell" style="border-color:black;width:36mm;background-color: lightgrey;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="border-color:black;width:42mm;background-color: lightgrey;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="border-color:black;text-align:right; border-right-width:0px;width:32mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS5471EData/USIncomeAndProfitsTaxesAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<xsl:for-each select="$IRS5471EData/IncomeAndWarProfitsTaxesPaid">
									<xsl:if test="($Print != $Separated) or (count($IRS5471EData/IncomeAndWarProfitsTaxesPaid) &lt;= 6)">
										<tr style="height:4mm;">
											<td class="styTableCell" style="border-color:black;width:76mm;text-align: left">
												<span style="width: 1mm"/>
												<span class="styBoldText">
													<xsl:choose>
														<xsl:when test="position()&lt;7">
															<xsl:number value="position() + 1"/>
															
														</xsl:when>
													</xsl:choose>
												</span>
												<span style="width:2mm"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryOrPossessionName"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black;width:36mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxInForeignCurrencyAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black;width:42mm;text-align:center;border-right-width:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ConversionRt"/>
												</xsl:call-template>
												<span style="width:2px;"/>
											</td>
											<td class="styTableCell" style="border-color:black; text-align:right;border-right-width:0px;width:32mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxInUSDollarsAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styIRS5471TableLastCol" id="PAspcr"/>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<xsl:call-template name="AddRowsScheduleE">
									<xsl:with-param name="NumOfRows" select="6"/>
									<xsl:with-param name="TPCount" select="count($IRS5471EData/IncomeAndWarProfitsTaxesPaid)"/>
								</xsl:call-template>
							</tbody>
						</table>
					</div>
					<!-- Schedule E line 8 -->
					<div class="styBB" style="width: 187mm;" rowspan="2">
						<span class="styLNLeftNumBoxSD" style="padding-top:2mm;padding-right:3mm;">8</span>
						<span class="styLNDesc" style="border-right-width:0px;width:145.5mm;padding-top:2mm">
							<span style="float:left">Total</span>
							<span style="float:right;">
								<span class="styDotLn" style="padding-right:2mm;">................................</span>
								<img class="styIRS5471Img" style="padding-right:1mm;border-right-width:0px;        width:2.5mm;height:2.5mm;" src="{$ImagePath}/5471_Bullet_Line.gif" alt="bullet"/>
							</span>
						</span>
						<span class="styLNAmountBox" style="height:6mm;padding-top:2mm;text-align:right;       border-left-width:1px;border-bottom-width:0px; width:32mm;padding-right:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471EData/TotalIncomeAndWarProfitsTxsAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END A, B, C and D   -->
					<!--   END SCHEDULE E   -->
					<!--   BEGIN SCHEDULE F HEADER   -->
					<div class="styBB" style="width:187mm">
						<div class="styPartName" style="width: 22mm;">Schedule F</div>
						<div class="styPartDesc" style="width: 165mm;">Balance Sheet
								 </div>
					</div>
					<div class="styGenericDiv" style="width: 187mmm; font-size: 8pt">
						<span class="styBoldText">Important:</span>
						<span class="styItalicText" style="padding-left:1mm">Report all amounts in U.S. dollars prepared and translated in accordance with U.S. GAAP.  See instructions.</span>
					</div>
					<div class="styBB" style="width: 187mm; font-size: 8pt">
						<span class="styItalicText" style="width: 149mm"> for an exception for DASTM corporations</span>
					</div>
					<!--   END SCHEDULE F HEADER   -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNDesc" style="width:108mm;font-size:8pt;height:11mm;text-align:center;
						        border-color:black;border-style:solid;border-bottom-width:1px;
						        border-top-width:0;border-left-width:0;border-right-width:0;">
							<b>
								<br/>Assets</b>
						</div>
						<div class="styLNRightNumBox" style="height: 11mm;"/>
						<div class="styLNAmountBox" style="height: 11mm; text-align: center; width: 34mm">
							<b>(a)</b>
							<br/>Beginning of annual<br/>accounting period</div>
						<div class="styLNAmountBox" style="height: 11mm; text-align: center; 
						width: 37mm">
							<b>(b)</b>
							<br/>End of annual<br/>accounting period</div>
					</div>
					<!--   BEGIN LINE 1   -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:100mm">Cash
							<span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>
						</div>
						<div class="styLNRightNumBox">1</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdCashAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdCashAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 1   -->
					<!--   BEGIN LINE 2   -->
					<!--   BEGIN LINE 2A   -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 2.25mm">2a</div>
						<div class="styLNDesc" style="width: 100mm">Trade notes and accounts receivable
							<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
						</div>
						<div class="styLNRightNumBox">2a</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdTradeNotesAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdTradeNotesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 2A   -->
					<!--   BEGIN LINE 2B   -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 4mm">b</div>
						<div class="styLNDesc" style="width: 100mm">Less allowance for bad debts
							<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
						</div>
						<div class="styLNRightNumBox">2b</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdBadDebtAllwncAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdBadDebtAllwncAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 2B   -->
					<!--   END LINE 2   -->
					<!--   BEGIN LINE 3   -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width: 100mm">Inventories
							<span class="styDotLn" style="float:right;padding-right:1mm;">.....................</span>
						</div>
						<div class="styLNRightNumBox">3</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdInventoriesAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdInventoriesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 3   -->
					<!--   BEGIN LINE 4   -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width: 100mm">Other current assets (attach statement)
							<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
						</div>
						<div class="styLNRightNumBox" style="height: 4.7mm">4</div>
						<div class="styLNAmountBox" style="width: 34mm;height: 4.7mm">
							<div style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOtherCurrAssetsAmt"/>
								</xsl:call-template>
							</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOtherCurrAssetsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm;height: 4.7mm">
							<div style="float:left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOtherCurrAssetsAmt"/>
								</xsl:call-template>
							</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOtherCurrAssetsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  END LINE 4   -->
					<!--   BEGIN LINE 5   -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="width: 100mm">Loans to shareholders and other related persons
							<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
						</div>
						<div class="styLNRightNumBox">5</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdLoansToShrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdLoansToShrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  END LINE 5   -->
					<!--   BEGIN LINE 6   -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="width: 100mm">Investment in subsidiaries (attach statement)
							<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
						</div>
						<div class="styLNRightNumBox" style="height: 4.7mm">6</div>
						<div class="styLNAmountBox" style="width: 34mm;height: 4.7mm">
							<div style="float:left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdInvstSubsidiaryAmt"/>
								</xsl:call-template>
							</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdInvstSubsidiaryAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm;height: 4.7mm">
							<div style="float:left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdInvstSubsidiaryAmt"/>
								</xsl:call-template>
							</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdInvstSubsidiaryAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  END LINE 6   -->
					<!--   BEGIN LINE 7   -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="width: 100mm">Other investments (attach statement)
							<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
						</div>
						<div class="styLNRightNumBox" style="height: 4.7mm">7</div>
						<div class="styLNAmountBox" style="width: 34mm;height: 4.7mm">
							<div style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOthInvestmentsAmt"/>
								</xsl:call-template>
							</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOthInvestmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm;height: 4.7mm">
							<div style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOthInvestmentsAmt"/>
								</xsl:call-template>
							</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOthInvestmentsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  END LINE 7   -->
					<!--   BEGIN LINE 8   -->
					<!--   BEGIN LINE 8A   -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 2.25mm">8a</div>
						<div class="styLNDesc" style="width: 100mm">Buildings and other depreciable assets
							<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
						</div>
						<div class="styLNRightNumBox" style="height: 4.7mm">8a</div>
						<div class="styLNAmountBox" style="width: 34mm;height: 4.7mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdBldgAndOtherAstAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm;height: 4.7mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdBldgAndOtherAstAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 8A   -->
					<!--   BEGIN LINE 8B   -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 4mm">b</div>
						<div class="styLNDesc" style="width: 100mm">Less accumulated depreciation
							<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
						</div>
						<div class="styLNRightNumBox" style="height: 4.7mm">8b</div>
						<div class="styLNAmountBox" style="width: 34mm;height: 4.7mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdNetAccumDeprecAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm;height: 4.7mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdNetAccumDeprecAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 8B   -->
					<!--  END LINE 8   -->
					<!--   BEGIN LINE 9   -->
					<!--   BEGIN LINE 9A   -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 2.25mm">9a</div>
						<div class="styLNDesc" style="width: 100mm">Depletable assets
							<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
						</div>
						<div class="styLNRightNumBox">9a</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdDepletableAstAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdDepletableAstAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 9A   -->
					<!--   BEGIN LINE 9B   -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 4mm">b</div>
						<div class="styLNDesc" style="width: 100mm">Less accumulated depletion
							<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
						</div>
						<div class="styLNRightNumBox">9b</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdNetAccumDpltnAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdNetAccumDpltnAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 9B   -->
					<!--  END LINE 9   -->
					<!--   BEGIN LINE 10   -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc" style="width: 100mm">Land (net of any amortization)
							<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
						</div>
						<div class="styLNRightNumBox">10</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdLandAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdLandAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  END LINE 10   -->
					<!--   BEGIN LINE 11   -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="width: 100mm">Intangible assets:</div>
						<div class="styLNRightNumBox" style="border-bottom-width: 0px; height: 4.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; width: 34mm; height: 4.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; width: 37mm; height: 4.5mm"/>
					</div>
					<!--  END LINE 11   -->
					<!--   BEGIN LINE 11A   -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 4mm">a</div>
						<div class="styLNDesc" style="width: 100mm">Goodwill
							<span class="styDotLn" style="float:right;padding-right:1mm;">.....................</span>
						</div>
						<div class="styLNRightNumBox">11a</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdGoodwillAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdGoodwillAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 11A   -->
					<!--   BEGIN LINE 11B   -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 4mm">b</div>
						<div class="styLNDesc" style="width: 100mm">Organization costs
							<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
						</div>
						<div class="styLNRightNumBox">11b</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOrgCostAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOrgCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 11B   -->
					<!--   BEGIN LINE 11C   -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 4mm">c</div>
						<div class="styLNDesc" style="width: 100mm">Patents, trademarks, and other intangible assets
							<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
						</div>
						<div class="styLNRightNumBox">11c</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdPatentsOthAstAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdPatentsOthAstAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 11C   -->
					<!--   BEGIN LINE 11D   -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 4mm">d</div>
						<div class="styLNDesc" style="width: 100mm">Less accumulated amortization for lines 11a, b, and c
							<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
						</div>
						<div class="styLNRightNumBox">11d</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdNetAccumAmortzAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdNetAccumAmortzAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 11d   -->
					<!--   BEGIN LINE 12   -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc" style="width: 100mm">Other assets (attach statement)
							<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
						</div>
						<div class="styLNRightNumBox" style="height: 4.7mm">12</div>
						<div class="styLNAmountBox" style="width: 34mm;height: 4.7mm">
							<div style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOtherAssetsAmt"/>
								</xsl:call-template>
							</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOtherAssetsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm;height: 4.7mm">
							<div style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOtherAssetsAmt"/>
								</xsl:call-template>
							</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOtherAssetsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  END LINE 12   -->
					<!--   BEGIN LINE 13A   -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox"></div>
						<div class="styLNDesc" style="width: 100mm"></div>
						<div class="styLNRightNumBox" style="border-bottom-width: 0px; height: 4.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; width: 34mm; height: 4.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; width: 37mm; height: 4.5mm"/>
					</div>
					<!--   END LINE 13A   -->
					<!--   BEGIN LINE 13B   -->
						<div class="styBB" style="width: 187mm">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc" style="width: 100mm">Total assets
							<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
						</div>
						<div class="styLNRightNumBox" style="border-bottom-width: 0px">13</div>
						<div class="styLNAmountBox" style="border-bottom-width: 0px;width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdTotalAssetsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width: 0px;width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdTotalAssetsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 13B   -->
					<!--   END LINE 1-13   -->
					<div class="styGenericDiv" style="width: 187mm">
					<div class="styLNDesc" style="width:108mm;font-size:8pt;height:6mm;text-align:center;
						        border-color:black;border-style:solid;border-bottom-width:1px;
						        border-top-width:0;border-left-width:0;border-right-width:0;">
						<b>Liabilities and Shareholders' Equity</b>
						</div>
						<div class="styLNRightNumBox" style="height: 6mm; background-color: lightgrey;border-bottom-width:1px"/>
						<div class="styLNAmountBox" style="width: 34mm; height: 6mm; background-color: lightgrey;
						;border-left:width:0px; border-bottom-width: 1px;border-left-width:0;border-right-width:0;"/>
						<div class="styLNAmountBox" style="width: 37mm; height: 6mm; border-bottom-width: 1px; background-color: lightgrey;border-left-width:0;border-right-width:0;"/>
					</div>
					<!--   BEGIN LINE 14   -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc" style="width: 100mm">Accounts payable
							<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
						</div>
						<div class="styLNRightNumBox" style="border-top-width:0px">14</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdAccountsPayableAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdAccountsPayableAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  END LINE 14   -->
					<!--   BEGIN LINE 15   -->
					<div class="styGenericDiv" style="width: 187mm;">
						<div class="styLNLeftNumBox">15</div>
						<div class="styLNDesc" style="width: 100mm">Other current liabilities (attach statement)
							<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
						</div>
						<div class="styLNRightNumBox" style="height: 4.7mm">15</div>
						<div class="styLNAmountBox" style="width: 34mm;height: 4.7mm">
							<div style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOtherCurrLiabAmt"/>
								</xsl:call-template>
							</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOtherCurrLiabAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm;height: 4.7mm">
							<div style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOtherCurrLiabAmt"/>
								</xsl:call-template>
							</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOtherCurrLiabAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  END LINE 15   -->
					<!--   BEGIN LINE 16   -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox">16</div>
						<div class="styLNDesc" style="width: 100mm">Loans from shareholders and other related persons
							<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
						</div>
						<div class="styLNRightNumBox">16</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdLoansFromShrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdLoansFromShrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  END LINE 16   -->
					<!--   BEGIN LINE 17   -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox">17</div>
						<div class="styLNDesc" style="width: 100mm">Other liabilities (attach statement)
							<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
						</div>
						<div class="styLNRightNumBox" style="height: 4.7mm">17 </div>
						<div class="styLNAmountBox" style="width: 34mm;height: 4.7mm">
							<div style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOthLiabilitiesAmt"/>
								</xsl:call-template>
							</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOthLiabilitiesAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm;height: 4.7mm">
							<div style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOthLiabilitiesAmt"/>
								</xsl:call-template>
							</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOthLiabilitiesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  END LINE 17   -->
					<!--   BEGIN LINE 18   -->
					<div class="styGenericDiv">
						<div class="styLNLeftNumBox">18</div>
						<div class="styLNDesc" style="width: 100mm">Capital stock:</div>
						<div class="styLNRightNumBox" style="border-bottom-width: 0px"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; width: 34mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; width: 37mm"/>
					</div>
					<!--  END LINE 18   -->
					<!--   BEGIN LINE 18A   -->
					<div class="styGenericDiv">
						<div class="styLNLeftLtrBoxDD">a</div>
						<div class="styLNDesc" style="width: 100mm">Preferred stock
							<span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
						</div>
						<div class="styLNRightNumBox">18a</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdPreferredStockAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdPreferredStockAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 18A   -->
					<!--   BEGIN LINE 18B   -->
					<div class="styGenericDiv">
						<div class="styLNLeftLtrBoxDD">b</div>
						<div class="styLNDesc" style="width: 100mm">Common stock
							<span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
						</div>
						<div class="styLNRightNumBox">18b</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdCommonStockAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdCommonStockAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 18B   -->
					<!--   BEGIN LINE 19   -->
					<div class="styGenericDiv">
						<div class="styLNLeftNumBox">19</div>
						<div class="styLNDesc" style="width: 100mm">Paid-in or capital surplus (attach reconciliation)
							<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
						</div>
						<div class="styLNRightNumBox" style="height: 4.7mm">19</div>
						<div class="styLNAmountBox" style="width: 34mm;height: 4.7mm">
							<div style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdPaidInOrSurplusAmt"/>
								</xsl:call-template>
							</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdPaidInOrSurplusAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm;height: 4.7mm">
							<div style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdPaidInOrSurplusAmt"/>
								</xsl:call-template>
							</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdPaidInOrSurplusAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  END LINE 19   -->
					<!--   BEGIN LINE 20   -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox">20</div>
						<div class="styLNDesc" style="width: 100mm">Retained earnings
							<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
						</div>
						<div class="styLNRightNumBox">20</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdRtnEarningsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdRtnEarningsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  END LINE 20   -->
					<!--   BEGIN LINE 21   -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox">21</div>
						<div class="styLNDesc" style="width: 100mm">Less cost of treasury stock
							<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
						</div>
						<div class="styLNRightNumBox">21</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdNetCostOfTrStkAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdNetCostOfTrStkAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  END LINE 21   -->
					<!--   BEGIN LINE 22   -->
				<div class="styGenericDiv" style="width: 187mm">
					<div class="styLNLeftNumBox">22</div>
					<div class="styLNDesc" style="width: 100mm">Total liabilities and shareholders' equity
						<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
					</div>
					<div class="styLNRightNumBox" style="border-bottom-width: 0px">22</div>
					<div class="styLNAmountBox" style="border-bottom-width: 0px; width: 34mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdTotLiabShrEqtyAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNAmountBox" style="border-bottom-width: 0px; width: 37mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdTotLiabShrEqtyAmt"/>
						</xsl:call-template>
					</div>
				</div>	
					<!--   END LINE 22   -->
					<!--   END LINE 14-22   -->
					<!--   END SCHEDULE F   -->
					<!--BEGIN FOOTER-->
					<div style="width:187mm; border-color: black; border-style: solid;
					 border-right-width: 0px; border-left-width: 0px; border-top-width: 2px; 
					 border-bottom-width: 0px">
						<div style="float:right">
                        Form <span class="styBoldText" style="font-size: 8pt">5471</span> (Rev. 12-2012)
                        </div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<p style="page-break-before:always"/>
					<!--BEGIN HEADER-->
					<div class="styGenericDiv" style="width:187mm">
						<div style="float: left; clear: none">Form 5471 (Rev.)</div>
						<div style="float:right">
                         Page <span class="styBoldText" style="font-size: 8pt">4</span>
						</div>
					</div>
					<!--END HEADER-->
					<!--   BEGIN SCHEDULE G   -->
				<!--   BEGIN SCHEDULE G   -->
					<!-- Text was updated to be able to taturally wrap according to SS design and codeing documents --> 
					<!--   BEGIN SCHEDULE G HEADER   -->
					<div class="styBB" style="width:187mm; border-top: 2px solid black;">
						<div class="styPartName" style="width: 22mm; float: left;">Schedule G</div>
						<div class="styPartDesc" style="width: 165mm;">
							<span style="width:16px; float: left;"/>Other Information</div>
					</div>
					<!--   END SCHEDULE G HEADER   -->
					<div class="styGenericDiv" style="font-size:8pt">
						<span class="styLNDesc" style="font-size: 8pt; width: 168mm;"/>
						<span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/Owns10PctOrMoreFrgnPrtshpInd"/>
									<xsl:with-param name="BackupName">IRS5471Owns10PctOrMoreFrgnPartnership</xsl:with-param>
								</xsl:call-template>
								<b>Yes</b>
							</label>
							<span style="width: 1mm"/>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/Owns10PctOrMoreFrgnPrtshpInd"/>
									<xsl:with-param name="BackupName">IRS5471Owns10PctOrMoreFrgnPartnership</xsl:with-param>
								</xsl:call-template>
								<b>&#160;No</b>
							</label>
						</span>
					</div>
					<!--   BEGIN LINE 1   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">1</span>
						<span class="styLNDesc" style="width: 175mm;">
						During the tax year, did the foreign corporation own at least a 10% interest, 
						directly or indirectly, in any foreign partnership? </span>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="width: 160mm; margin-left:8mm">
							<span style="float:left">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/Owns10PctOrMoreFrgnPrtshpInd"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">
							......................................</span>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/Owns10PctOrMoreFrgnPrtshpInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox" style="width: 3mm; height: 3mm">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/Owns10PctOrMoreFrgnPrtshpInd"/>
									<xsl:with-param name="BackupName">
									IRS5471Owns10PctOrMoreFrgnPartnership</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<span class="styNBSP" style="width: 10px"/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/Owns10PctOrMoreFrgnPrtshpInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox" style="width: 3mm; height: 3mm">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/Owns10PctOrMoreFrgnPrtshpInd"/>
									<xsl:with-param name="BackupName">
									IRS5471Owns10PctOrMoreFrgnPartnership</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="margin-left: 8mm">
						If "Yes," see the instructions for required statement.</span>
					</div>
					<!--   BEGIN LINE 2   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">2</span>
						<span class="styLNDesc" style="width: 160mm">
							<span style="float:left">
							During the tax year, did the foreign corporation own an interest in any trust?</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpOwnsInterestInTrustInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox" style="width: 3mm; height: 3mm">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpOwnsInterestInTrustInd"/>
									<xsl:with-param name="BackupName">IRS5471OwnsInterestInAnyTrust</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<span class="styNBSP" style="width: 10px"/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpOwnsInterestInTrustInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox" style="width: 3mm; height: 3mm">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpOwnsInterestInTrustInd"/>
									<xsl:with-param name="BackupName">IRS5471OwnsInterestInAnyTrust</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<label>
						<xsl:call-template name="PopulateLabelYes">
							<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpOwnsInterestInTrustInd"/>
							<xsl:with-param name="BackupName">IRS5471OwnsInterestInAnyTrust</xsl:with-param>
						</xsl:call-template>
						<span style="visibility : hidden ;">Yes</span>
					</label>
					<label>
						<xsl:call-template name="PopulateLabelNo">
							<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpOwnsInterestInTrustInd"/>
							<xsl:with-param name="BackupName">IRS5471OwnsInterestInAnyTrust</xsl:with-param>
						</xsl:call-template>
						<span style="visibility : hidden ;">No</span>
					</label>
					<!--   END LINE 2   -->
					<!--   BEGIN LINE 3   -->
						<span class="styLNLeftNumBoxSD">3</span>
						<span class="styLNDesc" style="width: 175mm">
							<span style="float:left">
						During the tax year, did the foreign corporation own any foreign entities that were disregarded as entities separate
						<br/> from their owners under  Regulations sections 301.7701-2 and 301.7701-3 (see instructions)?
						 <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/
									FrgnCorpOwnsForeignEntityInd"/>
									<xsl:with-param name="BackupName">
									IRS5471OwnsAnyForeignEntities</xsl:with-param>
								</xsl:call-template>
								</span></span>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="width: 160mm; margin-left: 8mm">
	                	<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/
								FrgnCorpOwnsForeignEntityInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox" style="width: 3mm; height: 3mm">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/
									FrgnCorpOwnsForeignEntityInd"/>
									<xsl:with-param name="BackupName">
									IRS5471OwnsAnyForeignEntities</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<span class="styNBSP" style="width: 10px"/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/
								FrgnCorpOwnsForeignEntityInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox" style="width: 3mm; height: 3mm">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/
									FrgnCorpOwnsForeignEntityInd"/>
									<xsl:with-param name="BackupName">
									IRS5471OwnsAnyForeignEntities</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<label>
						<xsl:call-template name="PopulateLabelYes">
							<xsl:with-param name="TargetNode" select="$IRS5471GData/
							FrgnCorpOwnsForeignEntityInd"/>
							<xsl:with-param name="BackupName">
							IRS5471OwnsAnyForeignEntities</xsl:with-param>
						</xsl:call-template>
						<span style="visibility : hidden ;">Yes</span>
					</label>
					<label>
						<xsl:call-template name="PopulateLabelNo">
							<xsl:with-param name="TargetNode" select="$IRS5471GData/
							FrgnCorpOwnsForeignEntityInd"/>
							<xsl:with-param name="BackupName">
							IRS5471OwnsAnyForeignEntities</xsl:with-param>
						</xsl:call-template>
						<span style="visibility : hidden ;">No</span>
					</label>
						<span class="styLNDesc" style="width: 160mm; 
						margin-left: 8mm">If "Yes," you are generally required
						 to attach Form 8858 for each entity (see instructions).</span>
					<!--   END LINE 3   -->
					<!--   BEGIN LINE 4   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">4</span>
						<span class="styLNDesc" style="width: 160mm">
							<span style="float:left">
								During the tax year, was the foreign corporation a participant
								 in a cost sharing arrangement?
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/
								FrgnCorpPartcpCostShrInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="alt" class="styCkbox" style="width: 3mm; height: 3mm">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/
									FrgnCorpPartcpCostShrInd"/>
									<xsl:with-param name="BackupName">
									IRS5471ForeignCorpWasParticipant</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<span class="styNBSP" style="width: 10px"/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpPartcpCostShrInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="alt" class="styCkbox" style="width: 3mm; height: 3mm">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/
									FrgnCorpPartcpCostShrInd"/>
									<xsl:with-param name="BackupName">
									IRS5471ForeignCorpWasParticipant</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<label>
						<xsl:call-template name="PopulateLabelYes">
							<xsl:with-param name="TargetNode" select="$IRS5471GData/
							FrgnCorpPartcpCostShrInd"/>
							<xsl:with-param name="BackupName">
							IRS5471ForeignCorpWasParticipantt</xsl:with-param>
						</xsl:call-template>
						<span style="visibility : hidden ;">Yes</span>
					</label>
					<label>
						<xsl:call-template name="PopulateLabelNo">
							<xsl:with-param name="TargetNode" select="$IRS5471GData/
							FrgnCorpPartcpCostShrInd"/>
							<xsl:with-param name="BackupName">
							IRS5471ForeignCorpWasParticipantt</xsl:with-param>
						</xsl:call-template>
						<span style="visibility : hidden ;">No</span>
					</label>
					<!--   END LINE 4   -->
					<!--   BEGIN LINE 5   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">5</span>
						<span class="styLNDesc" style="width: 160mm">
							<span style="float:left">
								During the tax year, did the foreign corporation
								 become a participant in a cost sharing arrangement?
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/
								FrgnCorpBecamePartcpCostShrInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="alt" class="styCkbox" style="width: 3mm; height: 3mm">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/
									FrgnCorpBecamePartcpCostShrInd"/>
									<xsl:with-param name="BackupName">
									IRS5471ForeignCorpBecameParticipant</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<span class="styNBSP" style="width: 10px"/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/
								FrgnCorpBecamePartcpCostShrInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="alt" class="styCkbox" style="width: 3mm; height: 3mm">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/
									FrgnCorpBecamePartcpCostShrInd"/>
									<xsl:with-param name="BackupName">
									IRS5471ForeignCorpBecameParticipant</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<label>
						<xsl:call-template name="PopulateLabelYes">
							<xsl:with-param name="TargetNode" select="$IRS5471GData/
							FrgnCorpBecamePartcpCostShrInd"/>
							<xsl:with-param name="BackupName">
							IRS5471ForeignCorpBecameParticipant</xsl:with-param>
						</xsl:call-template>
						<span style="visibility : hidden ;">Yes</span>
					</label>
					<label>
						<xsl:call-template name="PopulateLabelNo">
							<xsl:with-param name="TargetNode" select="$IRS5471GData/
							FrgnCorpBecamePartcpCostShrInd"/>
							<xsl:with-param name="BackupName">
							IRS5471ForeignCorpBecameParticipant</xsl:with-param>
						</xsl:call-template>
						<span style="visibility : hidden ;">No</span>
					</label>
					<!--   END LINE 5   -->
					<!--   BEGIN LINE 6   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">6</span>
						<span class="styLNDesc" style="width: 177mm">
						During the tax year, did the foreign corporation participate
						 in any reportable transaction as defined in Regulations </span>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="width: 160mm; margin-left:8mm">
							<span style="float:left">section 1.6011-4? 
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/ReportableTransactionPrtcptInd"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">
							................................</span>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/ReportableTransactionPrtcptInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="IRS5471PrtcptInReportableTransYes" class="styCkbox" style="width: 3mm; height: 3mm">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/
									ReportableTransactionPrtcptInd"/>
									<xsl:with-param name="BackupName">
									IRS5471PrtcptInReportableTrans</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<span class="styNBSP" style="width: 10px"/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/
								ReportableTransactionPrtcptInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="IRS5471PrtcptInReportableTransNo" class="styCkbox" style="width:3mm; height: 3mm">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/
									ReportableTransactionPrtcptInd"/>
									<xsl:with-param name="BackupName">
									IRS5471PrtcptInReportableTrans</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="margin-left: 8mm">
						If "Yes," attach Form(s) 8886 if required by Regulations section 1.6011-4(c)(i)(G).</span>
					</div>
					<!--   END LINE 6  -->
					<!--   BEGIN LINE 7   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">7</span>
						<span class="styLNDesc" style="width: 175mm">
						During the tax year, did the foreign corporation pay or
						 accrue any foreign tax that was disqualified for credit under  <br/>section 901(m)?
						</span>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="width: 160mm; margin-left:8mm">
							<span style="float:left">
							</span>
						<span class="styDotLn" style="float:right;padding-right:1mm;">
							.................................</span>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/
								FrgnTaxDisqualifiedSec901mInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="IRS5471ForeignCorpPd901TaxYes" class="styCkbox" style="width: 3mm; height: 3mm">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/
									FrgnTaxDisqualifiedSec901mInd"/>
									<xsl:with-param name="BackupName">
									IRS5471ForeignCorpPd901Tax</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<span class="styNBSP" style="width: 10px"/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/
								FrgnTaxDisqualifiedSec901mInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="IRS5471ForeignCorpPd901TaxNo" class="styCkbox" style="width: 3mm; height: 3mm">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/
									FrgnTaxDisqualifiedSec901mInd"/>
									<xsl:with-param name="BackupName">
									IRS5471ForeignCorpPd901Tax</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<!--   END LINE 7   -->
					<!--   BEGIN LINE 8   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">8</span>
						<span class="styLNDesc" style="width: 175mm">
						During the tax year, did the foreign corporation pay or accrue foreign
						 taxes to which section 909 applies, or treat 
						</span>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="width: 160mm; margin-left:8mm">
							<span style="float:left">
						foreign taxes that were previously suspended under section 909 as no longer suspended?
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/
								ForeignTaxSection909Ind"/>
							</xsl:call-template>
							<input type="checkbox" alt="IRS5471ForeignCorpPd909TaxYes" class="styCkbox" style="width: 3mm; height: 3mm">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/
									ForeignTaxSection909Ind"/>
									<xsl:with-param name="BackupName">
									IRS5471ForeignCorpPd909Tax</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<span class="styNBSP" style="width: 10px"/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/
								ForeignTaxSection909Ind"/>
							</xsl:call-template>
							<input type="checkbox" alt="IRS5471ForeignCorpPd909TaxNo" class="styCkbox" style="width: 3mm; height: 3mm">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/
									ForeignTaxSection909Ind"/>
									<xsl:with-param name="BackupName">
									IRS5471ForeignCorpPd909Tax</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<!--   END LINE 8  -->
					<!--   BEGIN SCHEDULE H   -->
					<!--   BEGIN SCHEDULE H HEADER   -->
					<div class="styBB" style="border-bottom-width: 0px;border-top-width:1px; width: 187mm;">
						<div class="styPartName" style="width: 22mm;float:left;">Schedule H</div>
						<div class="styPartDesc" style="width: 165mm">
							<span style="width:16px; float: left;"/>Current Earnings and Profits
            <span style="font-size: 8pt; width: 50mm; font-weight: normal">(see instructions.)</span>
						</div>
					</div>
					<!--   END SCHEDULE H HEADER   -->
					<!--   BEGIN IMPORTANT HEADER   -->
					<div class="styBB" style="width: 187mm">
						<span class="styBoldText" style="font-size: 8pt">Important:</span>
						<span class="styItalicText" style="font-size: 8pt; width: 120mm; font-weight: normal;">
							<span style="width:2px"/>  Enter the amounts on lines 1 through 5c in <b>functional</b> currency.</span>
					</div>
					<!--   END IMPORTANT HEADER   -->
					<!--   BEGIN LINE 1   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD" style="height: 4.5mm">1</span>
						<span class="styLNDesc" style="width: 138mm">
							<span style="float:left">Current year net income or (loss) per foreign 
							books of account</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
						</span>
						<span class="styLNRightNumBox" style="height: 4.75mm">1</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 4.75mm; width: 33mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471HData/
								ForeignCYNetIncomePerBooksAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 1   -->
					<!--   BEGIN LINE 2   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="width: 146mm"/>
						<span class="styLNRightNumBox" style="height: 4.6mm;width: 8mm;
						background-color: lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 4.6mm;
						 width: 33mm;background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">2</span>
						<span class="styLNDesc" style="width: 64mm; vertical-align: bottom;">
						Net adjustments made to line 1 to determine </span>
						<span class="styLNAmountBox" style="height: 4.6mm; width: 37mm;
						 border-bottom-width:0px; border-top-width: 1px"/>
						<span class="styLNAmountBox" style="height: 4.6mm; width: 37mm; 
						border-bottom-width:0px; border-top-width: 1px"/>
						<span class="styLNRightNumBox" style="height: 4.6mm; 
						background-color: lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 4.6mm; width: 33mm;
						background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="width: 64mm; margin-left: 8mm">
						current earnings and profits according to U.S.</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 4.5mm;
						 width: 37mm; border-left-width: 1px; border-bottom-width: 0px;
						  text-align: center; font-weight: bold">Net</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 4.5mm; 
						width: 37mm; border-left-width: 1px; border-bottom-width: 0px; text-align: center;
						 font-weight: bold">Net</span>
						<span class="styLNRightNumBox" style="height: 4.5mm; 
						background-color: lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 4.5mm; width: 33mm; 
						background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="padding-top: .75mm; height: 4.5mm;
						 width:64mm; margin-left: 8mm; vertical-align: top;">
						 financial and tax accounting standards (see</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 4.5mm;
						 width: 37mm; border-left-width: 1px; border-bottom-width: 0px;
						  text-align: center; font-weight: bold">Additions</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 4.5mm; 
						width: 37mm; border-left-width: 1px; border-bottom-width: 0px; 
						text-align: center; font-weight: bold">Subtractions</span>
						<span class="styLNRightNumBox" style="height: 4.5mm;  background-color:
						 lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 4.5mm; width: 33mm;
						 background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="width: 64mm; margin-left: 8mm">instructions): </span>
						<span class="styLNAmountBox" style="height: 4.5mm; width: 37mm;
						 border-left-width: 1px; text-align: center"/>
						<span class="styLNAmountBox" style="height: 4.5mm; width: 37mm;
						 border-left-width: 1px; text-align: center"/>
						<span class="styLNRightNumBox" style="height: 4.5mm;
						 background-color: lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 4.5mm; width: 33mm;
						 background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<!--   BEGIN LINE 2A   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBoxDD">a</span>
						<span class="styLNDesc" style="width:64mm;">
							<span style="float:left">Capital gains or losses</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
						</span>
						<span class="styLNAmountBox" style="width:37mm; height: 5mm;
						 padding-top: .75mm; font-size: 7pt; border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/
								CapitalGainOrLossNetAddnAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width:37mm;height: 5mm; 
						padding-top: .75mm; font-size: 7pt; border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/
								CapitalGainOrLossNetSbtrctnAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm; background-color: lightgrey; 
						border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 5mm; width: 33mm; 
						background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<!--   END LINE 2A   -->
					<!--   BEGIN LINE 2B   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBoxDD">b</span>
						<span class="styLNDesc" style="width:64mm;">
							<span style="float:left">Depreciation and amortization</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 5mm; font-size: 7pt;
						 width:37mm; border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/
								DeprecAndAmortzNetAddnAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 5mm;
						 font-size: 7pt; width:37mm;border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/
								DeprecAndAmortzNetSbtrctnAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm;background-color: lightgrey; 
						border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 5mm; width: 33mm; 
						background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<!--   END LINE 2B   -->
					<!--   BEGIN LINE 2C   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBoxDD">c</span>
						<span class="styLNDesc" style="width:64mm;">
							<span style="float:left">Depletion</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 5mm; 
						font-size: 7pt; width:37mm;border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/
								DepletionNetAddnAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 5mm;
						 font-size: 7pt; width:37mm;border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/
								DepletionNetSbtrctnAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm; background-color: lightgrey; 
						border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 5mm; width: 33mm;
						background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<!--   END LINE 2C   -->
					<!--   BEGIN LINE 2D   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBoxDD">d</span>
						<span class="styLNDesc" style="width:64mm;">
							<span style="float:left">Investment or incentive allowance</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 5mm; 
						font-size: 7pt; width:37mm; border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/InvstIncntvAllwncNetAddnAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 5mm;
						 font-size: 7pt; width:37mm; border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/
								InvstIncntvAllwncNetSbtrctnAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm; background-color: lightgrey;
						 border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 5mm; width: 33mm;
						 background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<!--   END LINE 2D   -->
					<!--   BEGIN LINE 2E   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBoxDD">e</span>
						<span class="styLNDesc" style="width:64mm;">
							<span style="float:left">Charges to statutory reserves</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 5mm; 
						font-size: 7pt; width:37mm; border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/
								ChrgsStryReservesNetAddnAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 5mm; 
						font-size: 7pt; width:37mm;border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/
								ChrgsStryReservesNetSbtrctnAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm; background-color: lightgrey;
						 border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 5mm; width: 33mm;
						 background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<!--   END LINE 2E   -->
					<!--   BEGIN LINE 2F   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBoxDD">f</span>
						<span class="styLNDesc" style="width:64mm;">
							<span style="float:left">Inventory adjustments</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 5mm; font-size: 7pt; width:37mm;border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/
								InventoryAdjNetAddnAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 5mm; 
						font-size: 7pt; width:37mm;border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/
								InventoryAdjNetSbtrctnAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm; background-color: lightgrey;
						 border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 5mm; width: 33mm;
						 background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<!--   END LINE 2F   -->
					<!--   BEGIN LINE 2G   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBoxDD">g</span>
						<span class="styLNDesc" style="width:64mm;">
							<span style="float:left">Taxes</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 5mm; 
						font-size: 7pt; width:37mm; border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/TaxesNetAddnAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 5mm; 
						font-size: 7pt; width:37mm;border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/
								TaxesNetSbtrctnAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm; background-color: lightgrey; 
						border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 5mm; width: 33mm;
						background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<!--   END LINE 2G   -->
					<!--   BEGIN LINE 2H   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBoxDD">h</span>
						<span class="styLNDesc" style="width: 64mm;">
							<span style="float:left">Other (attach statement)</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
						</span>
						<span class="styLNAmountBox" style="height: 5mm;font-size: 7pt;
						 width: 37mm; border-left-width: 1px;">
							<span style="float: left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471HData/
									OtherAdjustmentsNetAddnAmt"/>
								</xsl:call-template>
							</span>
							<span style="float: right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="MaxSize" select="17"/>
									<xsl:with-param name="TargetNode" select="$IRS5471HData/
									OtherAdjustmentsNetAddnAmt"/>
								</xsl:call-template>
							</span>
						</span>
						<span class="styLNAmountBox" style="height: 5mm;font-size: 7pt; width: 37mm;
						 border-left-width: 1px;">
							<span style="float: left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471HData/
									OtherAdjustmentsNetSbtrctnAmt"/>
								</xsl:call-template>
							</span>
							<span style="float: right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="MaxSize" select="17"/>
									<xsl:with-param name="TargetNode" select="$IRS5471HData/
									OtherAdjustmentsNetSbtrctnAmt"/>
								</xsl:call-template>
							</span>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm;background-color: lightgrey; 
						border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 5mm;width: 33mm;
						 background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<!--   END LINE 2H   -->
					<!--   END LINE 2   -->
					<!--   BEGIN LINE 3   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">3</span>
						<span class="styLNDesc" style="width:64mm;">
							<span style="float:left">Total net additions</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 5mm; font-size: 7pt; width:37mm; border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/TotalNetAdditonsAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="height: 5mm; width:37mm;border-left-width: 1px; 
						background-color: lightgrey"/>
						<span class="styLNRightNumBox" style="height: 5mm; background-color: lightgrey; 
						border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 5mm; width: 33mm;
						border-bottom-width: 0px; background-color: lightgrey"/>
					</div>
					<!--   END LINE 3   -->
					<!--   BEGIN LINE 4   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">4</span>
						<span class="styLNDesc" style="width: 101mm">
							<span style="float:left">Total net subtractions </span>
							<span class="styDotLn" style="float:right;padding-right:3.5mm;">.................</span>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 5mm;
						 font-size: 7pt; width: 37mm;border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/
								TotalNetSubtractionsAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm;background-color: lightgrey; 
						border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 5mm; width: 33mm; 
						background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<!--   END LINE 4   -->
					<!--   BEGIN LINE 5A   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox" style="padding-left: 2.25mm">5a</span>
						<span class="styLNDesc" style="width: 138mm">
							<span style="float:left">Current earnings and profits (line 1 plus line 3 minus line 4)</span>
							<span class="styDotLn" style="float:right;padding-right:1.5mm;">..............</span>
						</span>
						<span class="styLNRightNumBox">5a</span>
						<span class="styLNAmountBox" style="font-size: 7pt; width: 33mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/CurrentEarningsAndProfitsAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 5A   -->
					<!--   BEGIN LINE 5B   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox" style="padding-left: 4mm">b</span>
						<span class="styLNDesc" style="width: 138mm">
							<span style="float:left">DASTM gain or (loss) for foreign corporations that use
							 DASTM (see instructions)</span>
							<span class="styDotLn" style="float:right;padding-right:1.5mm;">.......</span>
						</span>
						<span class="styLNRightNumBox">5b</span>
						<span class="styLNAmountBox" style="font-size: 7pt;width: 33mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/
								DASTMGainOrLossAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 5B   -->
					<!--   BEGIN LINE 5C   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox" style="padding-left: 4mm">c</span>
						<span class="styLNDesc" style="width: 138mm">
							<span style="float:left">Combine lines 5a and 5b</span>
							<span class="styDotLn" style="float:right;padding-right:1.5mm;">
							..........................</span>
						</span>
						<span class="styLNRightNumBox">5c</span>
						<span class="styLNAmountBox" style="font-size: 7pt; width: 33mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/
								EarningAndPrftPlusDASTMGainAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 5C   -->
					<!--   BEGIN LINE 5D   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox" style="padding-left: 4mm">d</span>
						<span class="styLNDesc" style="width: 138mm">
						Current earnings and profits in U.S. dollars (line 5c translated at the appropriate exchange 
						rate as</span>
						<span class="styLNRightNumBox" style="height: 4.5mm; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 4.5mm; width: 33mm; border-bottom-width: 0px"/>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="width: 137.75mm; margin-left: 8.25mm">
						defined in section 989(b) and the related regulations (see instructions))
							<span class="styDotLn" style="float:right;padding-right:1.5mm;">
							.........</span>
						</span>
						<span class="styLNRightNumBox">5d</span>
						<span class="styLNAmountBox" style="font-size: 7pt; width: 33mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471HData/CurrEarnAndPrftInUSDollarsAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="border-right-width: 0px; width: 49.75mm;
						 margin-left: 8.25mm">Enter exchange rate used for line 5d</span>
						<img class="styIRS5471Img" style="border-right-width: 0px; width: 2mm; height: 2mm; 
						float: none" src="{$ImagePath}/5471_Bullet_Line.gif" alt="bullet"/>
						<span style="width:8px"/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$IRS5471HData/CurrEarnAndPrftInUSDollarsAmt/@exchangeRt"/>
						</xsl:call-template>
					</div>
					<!--   END LINE 5D SCHEDULE H  -->
					<div class="styBB" style="width:187mm;float:none;clear:both;"/>
					<!-- Schedule I header -->
					<!-- Filler for Schedule I-->
					<!-- Display the data container only if there is no data for Schedule I. -->
					<!-- If the print parameter is "separated" and there is more than one instance of Schedule I, -->
					<!-- then display a message directing the user to the additional data table -->
					<xsl:if test="(not($IRS5471IData)) or (($Print = $Separated) and count($IRS5471IData) &gt; 1)">
						<div class="styBB" style="width:187mm;float:none;clear:both;">
							<span class="styPartName" style="width: 20mm;float:left;">Schedule I</span>
							<span class="styPartDesc" style="width: 160mm;">Summary of Shareholder’s Income From Foreign Corporation<span class="styNormalText">&#160;(see instructions)</span>
							</span>
						</div>
						<div style="width:187mm;padding-left:2mm;">
If item D on page 1 is completed, a separate Schedule I must be filed for each Category 4 or 5 filer for whom reporting is furnished<br/>on this Form 5471.  This schedule I is being completed for:
<br/>
							<br/>
						</div>
						<div class="styBB" style=" width:187mm;padding-left:2mm;">
					Name of U.S. shareholder <span style="width:2mm;"/>
							<img src="{$ImagePath}/5471_Bullet_Title.gif" alt="bullet"/>
							<span style="width:65mm;border-bottom: 1 solid black">
								<xsl:if test="(count($IRS5471IData) &gt; 1)">
									<xsl:call-template name="PopulateAdditionalDataTableMessage">
										<xsl:with-param name="TargetNode" select="$IRS5471IData"/>
										<xsl:with-param name="ShortMessage" select="'false'"/>
									</xsl:call-template>
								</xsl:if>
							</span>					
						Identifying number <span style="width:2mm;"/>
							<img src="{$ImagePath}/5471_Bullet_Title.gif" alt="bullet"/>
							<span style="width:50mm;border-bottom: 1 solid black; text-align:center;">
							</span>
						</div>
						<br/>
						<!-- Schedule I line 1 -->
						<div style="width:187mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox" style="height:4mm;">1</div>
								<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Subpart F income (line 38b, Worksheet A in the instructions)    
                </div>
							</div>
							<div style="float:right;">
								<div class="styDotLn" style="padding-right:2mm;">.............</div>
								<div class="styLNRightNumBox">1</div>
								<div class="styLNAmountBox" style="width:33mm;">
									<xsl:call-template name="PopulateAdditionalDataTableMessage">
										<xsl:with-param name="TargetNode" select="$IRS5471IData/IRS5471ScheduleI"/>
										<xsl:with-param name="ShortMessage" select="'true'"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Line 2 -->
						<div style="width:187mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox" style="height:4mm;">2</div>
								<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Earnings invested in U.S. property (line 17, Worksheet B in the instructions)   
                </div>
							</div>
							<div style="float:right;">
								<div class="styDotLn" style="padding-right:2mm;">........</div>
								<div class="styLNRightNumBox">2</div>
								<div class="styLNAmountBox" style="width:33mm;"/>
							</div>
						</div>
						<!-- Line 3 -->
						<div style="width:187mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox" style="height:4mm;">3</div>
								<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Previously excluded subpart F income withdrawn from qualified investments (line 6b, Worksheet C   
                </div>
							</div>
							<div style="float:right;">
								<div class="styLNRightNumBoxNBB"/>
								<div class="styLNAmountBoxNBB" style="width:33mm;"/>
							</div>
						</div>
						<div style="width:187mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox" style="height:4mm;"/>
								<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  in the instructions)   
                </div>
							</div>
							<div style="float:right;">
								<div class="styDotLn" style="padding-right:2mm;">..........................</div>
								<div class="styLNRightNumBox">3</div>
								<div class="styLNAmountBox" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="PrevExcludedSubpartFIncomeAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Line 4 first line-->
						<div style="width:187mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox" style="height:4mm;">4</div>
								<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Previously excluded export trade income withdrawn from investment in export trade assets (line 7b,  
                </div>
							</div>
							<div style="float:right;">
								<div class="styLNRightNumBoxNBB"/>
								<div class="styLNAmountBoxNBB" style="width:33mm;"/>
							</div>
						</div>
						<!-- Line 4 second line-->
						<div style="width:187mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox" style="height:4mm;"/>
								<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Worksheet D in the instructions)   
                </div>
							</div>
							<div style="float:right;">
								<div class="styDotLn" style="padding-right:2mm;">.......................</div>
								<div class="styLNRightNumBox">4</div>
								<div class="styLNAmountBox" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="WithdrawnExportTradeIncomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Line 5 -->
						<div style="width:187mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox" style="height:4mm;">5</div>
								<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Factoring income   
                </div>
							</div>
							<div style="float:right;">
								<div class="styDotLn" style="padding-right:2mm;">............................</div>
								<div class="styLNRightNumBox">5
                </div>
								<div class="styLNAmountBox" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="FactoringIncomeAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Line 6 -->
						<div style="width:187mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox" style="height:4mm;">6</div>
								<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Total of lines 1 through 5. Enter here and on your income tax return. See instructions   
                </div>
							</div>
							<div style="float:right;">
								<div class="styDotLn" style="padding-right:2mm;">......</div>
								<div class="styLNRightNumBox">6
                </div>
								<div class="styLNAmountBox" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="TotalIncmControlledFrgnCorpAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Line 7 -->
						<div style="width:187mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox" style="height:4mm;">7</div>
								<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Dividends received (translated at spot rate on payment date under section 989(b)(1))   
                </div>
							</div>
							<div style="float:right;">
								<div class="styDotLn" style="padding-right:2mm;">.....</div>
								<div class="styLNRightNumBox">7
                </div>
								<div class="styLNAmountBox" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="DividendsReceivedAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Line 8 -->
						<div class="styBB" style="width:187mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox" style="height:4mm;">8</div>
								<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Exchange gain or (loss) on a distribution of previously taxed income  
                </div>
							</div>
							<div style="float:right;">
								<div class="styDotLn" style="padding-right:2mm;">...........</div>
								<div class="styLNRightNumBoxNBB">8
                </div>
								<div class="styLNAmountBoxNBB" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="ExchangeGainOrLossOnDistriAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--YES and NO Boxes for blocked income -->
						<div class="styGenericDiv" style="width: 187mm;">
							<span class="styLNDesc" style="font-size: 8pt; width: 186mm;">
								<span style="float: right; clear: none;padding-right:6mm">
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
											<xsl:with-param name="BackupName">IRS5471AnyIncomeBlocked</xsl:with-param>
										</xsl:call-template>
										<!--<b>No</b>-->
									   <b>No&#160;</b>
										<!--<span style="width: 1mm"/>-->
									</label>
								</span>
								<span style="float: right; clear: none;padding-left:3mm">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
											<xsl:with-param name="BackupName">IRS5471AnyIncomeBlocked</xsl:with-param>
										</xsl:call-template>
										<b>Yes</b>
									</label>
									<span style="width: 3mm"/>
								</span>
							</span>
						</div>
						<!--   BEGIN LINE 1   -->
						<div class="styGenericDiv" style="width: 187mm;padding-top:1mm;">
							<img class="styIRS5471Img" style="width:1.5mm; height:1.5mm; border-right-width:0px; margin-top:1mm;" 
							src="{$ImagePath}/5471_Bullet_Round.gif" alt="bullet"/>
							<span class="styLNDesc" style="width: 165mm; margin-left: 1mm">
								<span style="float:left">Was any income of the foreign corporation blocked?
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>
							</span>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox" style="width: 3mm; height: 3mm">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
										<xsl:with-param name="BackupName">IRS5471AnyIncomeBlocked</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span class="styNBSP" style="width: 10px"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox" style="width: 3mm; height: 3mm">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
										<xsl:with-param name="BackupName">IRS5471AnyIncomeBlocked</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
						<!--   END LINE 1   -->
						<div class="styGenericDiv" style="width: 187mm">
							<span class="styLNDesc" style="font-size: 8pt; width: 186mm">
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
										<xsl:with-param name="BackupName">IRS5471IncomeBecomeUnblockedThisTY</xsl:with-param>
									</xsl:call-template>
								</label>
								<span style="width: 2mm"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
										<xsl:with-param name="BackupName">IRS5471IncomeBecomeUnblockedThisTY</xsl:with-param>
									</xsl:call-template>
								</label>
							</span>
						</div>
						<!--   BEGIN LINE 2   -->
						<div class="styGenericDiv" style="width: 187mm">
							<img class="styIRS5471Img" style="width:1.5mm; height:1.5mm;
							 border-right-width:0px; margin-top:1mm;" src="{$ImagePath}/5471_Bullet_Round.gif" alt="bullet"/>
							<span class="styLNDesc" style="width: 165mm; margin-left: 1mm">
								<span style="float:left">
                                       Did any such income become unblocked during the tax year (see section 964(b))?
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
							</span>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox" style="width: 3mm; height: 3mm;">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
										<xsl:with-param name="BackupName">IRS5471IncomeBecomeUnblockedThisTY</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span class="styNBSP" style="width: 10px"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox" style="width: 3mm; height: 3mm">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
										<xsl:with-param name="BackupName">IRS5471IncomeBecomeUnblockedThisTY</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
						<div class="styGenericDiv" style="width: 187mm;">
					<span class="styLNDesc" style="width: 160mm;">If the answer to either question is "Yes,"
					 attach an explanation.</span>
						</div>
					</xsl:if>
					<!--   END LINE 2   -->
					<!-- Display all instances of Schedule I data if the print option is not "separated" -->
					<!-- If the print option is "separated", but there is only one Schedule I, display that instance -->
					<xsl:if test="($Print != $Separated) or (($Print = $Separated) and (count($IRS5471IData) = 1))">
						<xsl:for-each select="$IRS5471IData">
							<div class="styBB" style="width:187mm;float:none;clear:both;">
								<span class="styPartName" style="width: 20mm;">Schedule I</span>
								<span class="styPartDesc" style="width: 160mm;">
								Summary of Shareholder’s Income From Foreign Corporation
								<span class="styNormalText"> (see instructions)</span>
								</span>
							</div>
							<div style="width:187mm;padding-left:2mm;">
If item D on page 1 is completed, a separate Schedule I must be filed for each Category 4 or 5 filer for whom reporting is furnished<br/>on this Form 5471.  This schedule I is being completed for:
<br/>
								<br/>
							</div>
							<div class="styBB" style="width:187mm;padding-left:2mm;">
					Name of U.S. shareholder <span style="width:2mm;"/>
								<img src="{$ImagePath}/5471_Bullet_Title.gif" alt="bullet"/>
								<span style="width:65mm;border-bottom: 1 solid black">
									<xsl:choose>
										<xsl:when test="ShareholderInformation/ShareholderPersonNm != ''">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ShareholderInformation/ShareholderPersonNm"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" 
												select="ShareholderInformation/ShareholderBusinessName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" 
												select="ShareholderInformation/ShareholderBusinessName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</span>					
						Identifying number <span style="width:2mm;"/>
								<img src="{$ImagePath}/5471_Bullet_Title.gif" alt="bullet"/>
								<span style="width:50mm;border-bottom: 1 solid black; text-align:center;">
									<xsl:choose>
										<xsl:when test="ShareholderInformation/ShareholderSSN != ''">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="ShareholderInformation/ShareholderSSN"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="ShareholderInformation/ShareholderEIN != ''">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="ShareholderInformation/ShareholderEIN"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="ShareholderInformation/ShareholderMissingEINReasonCd != ''">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" 
												select="ShareholderInformation/ShareholderMissingEINReasonCd"/>
											</xsl:call-template>
										</xsl:when>
									</xsl:choose>
								</span>
							</div>
							<br/>
							<!-- Schedule I line 1 -->
							<div class="styBB" style="width:187mm;float:none;clear:both;">
								<div style="width:187mm;">
									<div style="float:left;">
										<div class="styLNLeftNumBox" style="height:4mm;">1</div>
										<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Subpart F income (line 38b, Worksheet A in the instructions)    
                </div>
									</div>
									<div style="float:right;">
										<div class="styDotLn" style="padding-right:2mm;">..............</div>
										<div class="styLNRightNumBox" style="border-top-width:1;">1
                </div>
										<div class="styLNAmountBox" style="width:33mm;border-top-width:1;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SubpartFIncomeAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<!-- Line 2 -->
								<div style="width:187mm;">
									<div style="float:left;">
										<div class="styLNLeftNumBox" style="height:4mm;">2</div>
										<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Earnings invested in U.S. property (line 17, Worksheet B in the instructions)  
                </div>
									</div>
									<div style="float:right;">
										<div class="styDotLn" style="padding-right:2mm;">........</div>
										<div class="styLNRightNumBox">2
                </div>
										<div class="styLNAmountBox" style="width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="EarningsInvestedInUSPropAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<!-- Line 3 -->
								<div style="width:187mm;">
									<div style="float:left;">
										<div class="styLNLeftNumBox" style="height:4mm;">3</div>
										<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Previously excluded subpart F income withdrawn from qualified investments (line 6b, Worksheet C   
                </div>
									</div>
									<div style="float:right;">
										<div class="styLNRightNumBoxNBB"/>
										<div class="styLNAmountBoxNBB" style="width:33mm;"/>
									</div>
								</div>
								<div style="width:187mm;">
									<div style="float:left;">
										<div class="styLNLeftNumBox" style="height:4mm;"/>
										<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  in the instructions)   
                </div>
									</div>
									<div style="float:right;">
										<div class="styDotLn" style="padding-right:2mm;">..........................</div>
										<div class="styLNRightNumBox">3</div>
										<div class="styLNAmountBox" style="width:33mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PrevExcludedSubpartFIncomeAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<!-- Line 4 -->
								<div style="width:187mm;">
									<div style="float:left;">
										<div class="styLNLeftNumBox" style="height:4mm;">4</div>
										<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Previously excluded export trade income withdrawn from investment in export trade assets (line 7b,  
                </div>
									</div>
									<div style="float:right;">
										<div class="styLNRightNumBoxNBB"/>
										<div class="styLNAmountBoxNBB" style="width:33mm;"/>
									</div>
								</div>
								<div style="width:187mm;">
									<div style="float:left;">
										<div class="styLNLeftNumBox" style="height:4mm;"/>
										<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Worksheet D in the instructions)  
                </div>
									</div>
									<div style="float:right;">
										<div class="styDotLn" style="padding-right:2mm;">.......................</div>
										<div class="styLNRightNumBox">4</div>
										<div class="styLNAmountBox" style="width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="WithdrawnExportTradeIncomeAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<!-- Line 5 -->
								<div style="width:187mm;">
									<div style="float:left;">
										<div class="styLNLeftNumBox" style="height:4mm;">5</div>
										<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Factoring income    
                </div>
									</div>
									<div style="float:right;">
										<div class="styDotLn" style="padding-right:2mm;">............................</div>
										<div class="styLNRightNumBox">5
                </div>
										<div class="styLNAmountBox" style="width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FactoringIncomeAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<!-- Line 6 -->
								<div style="width:187mm;">
									<div style="float:left;">
										<div class="styLNLeftNumBox" style="height:4mm;">6</div>
										<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Total of lines 1 through 5. Enter here and on your income tax return. See instructions    
                </div>
									</div>
									<div style="float:right;">
										<div class="styDotLn" style="padding-right:2mm;">......</div>
										<div class="styLNRightNumBox">6
                </div>
										<div class="styLNAmountBox" style="width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalIncmControlledFrgnCorpAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<!-- Line 7 -->
								<div style="width:187mm;">
									<div style="float:left;">
										<div class="styLNLeftNumBox" style="height:4mm;">7</div>
										<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Dividends received (translated at spot rate on payment date under section 989(b)(1))   
                </div>
									</div>
									<div style="float:right;">
										<div class="styDotLn" style="padding-right:2mm;">.....</div>
										<div class="styLNRightNumBox">7</div>
										<div class="styLNAmountBox" style="width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsReceivedAmt"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<!-- Line 8 -->
								<div style="width:187mm;border-bottom:1px solid black;">
									<div style="float:left;">
										<div class="styLNLeftNumBox" style="height:4mm;">8</div>
										<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                 Exchange gain or (loss) on a distribution of previously taxed income    
                </div>
									</div>
									<div style="float:right;">
										<div class="styDotLn" style="padding-right:2mm;">...........</div>
										<div class="styLNRightNumBoxNBB">8</div>
										<div class="styLNAmountBoxNBB" style="width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExchangeGainOrLossOnDistriAmt"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<div class="styGenericDiv" style="width: 187mm">
									<span class="styLNDesc" style="font-size: 8pt; width: 187mm">
										<span style="float: right; clear: none;padding-right:4.5mm">
											<label>
												<xsl:call-template name="PopulateLabelNo">
													<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
													<xsl:with-param name="BackupName">IRS547AnyIncomeBlocked</xsl:with-param>
												</xsl:call-template>
												<b>No</b>
											</label>
											<span style="width: 1mm"/>
										</span>
										<span style="float: right; clear: none;padding-right:0mm">
											<label>
												<xsl:call-template name="PopulateLabelYes">
													<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
													<xsl:with-param name="BackupName">IRS547AnyIncomeBlocked</xsl:with-param>
												</xsl:call-template>
												<b> &#160;Yes </b>
											</label>
											<span style="width: 4mm"/>
										</span>
									</span>
								</div>
								<!--   BEGIN LINE 1   -->
								<div class="styGenericDiv" style="width: 187mm;padding-top:1mm;">
									<img class="styIRS5471Img" style="width:1.5mm; height:1.5mm; border-right-width:0px; margin-top:1mm;"   src="{$ImagePath}/5471_Bullet_Round.gif" alt="bullet"/>
									<span class="styLNDesc" style="width: 164mm; margin-left: 1mm">
										<span style="float:left">Was any income of the foreign corporation blocked?
										<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
											</xsl:call-template>
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>
									</span>
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox" style="width: 3mm; height: 3mm">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
												<xsl:with-param name="BackupName">IRS547AnyIncomeBlocked</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span class="styNBSP" style="width: 20px"/>
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox" style="width: 3mm; height: 3mm">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
												<xsl:with-param name="BackupName">IRS547AnyIncomeBlocked</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
								</div>
								<!--   END LINE 1   -->
								<div class="styGenericDiv" style="width: 187mm">
									<span class="styLNDesc" style="font-size: 8pt; width: 186mm">
										<label>
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
												<xsl:with-param name="BackupName">IRS547IncomeBecomeUnblockedThisTY</xsl:with-param>
											</xsl:call-template>
										</label>
										<span style="width: 2mm"/>
										<label>
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
												<xsl:with-param name="BackupName">IRS547IncomeBecomeUnblockedThisTY</xsl:with-param>
											</xsl:call-template>
										</label>
									</span>
								</div>
								<!--   BEGIN LINE 2   -->
								<div class="styGenericDiv" style="width: 187mm">
									<img class="styIRS5471Img" style="width:1.5mm; height:1.5mm; border-right-width:0px; margin-top:1mm;" src="{$ImagePath}/5471_Bullet_Round.gif" alt="bullet"/>
									<span class="styLNDesc" style="width: 164mm; margin-left: 1mm">
										<span style="float:left">
Did any such income become unblocked during the tax year (see section 964(b))?
										<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
											</xsl:call-template>
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
									</span>
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox" style="width: 3mm; height: 3mm">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
												<xsl:with-param name="BackupName">IRS547IncomeBecomeUnblockedThisTY</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span class="styNBSP" style="width: 20px"/>
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox" style="width: 3mm; height: 3mm">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
												<xsl:with-param name="BackupName">IRS547IncomeBecomeUnblockedThisTY</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
								</div>
								<div class="styGenericDiv" style="width: 187mm">
									<span class="styLNDesc" style="width: 160mm;">
									If the answer to either question is "Yes," attach an explanation.</span>
								</div>
								<br/>
								<br/>
							</div>
						</xsl:for-each>
						<!--   END LINE 2   -->
					</xsl:if>
	<!--BEGIN FOOTER-->
					<div style="width:187mm; border-color: black; border-style: solid;
					 border-right-width: 0px; border-left-width: 0px; border-top-width:1px; 
					 border-bottom-width: 0px">
						<div style="float:right">
                        Form <span class="styBoldText" style="font-size: 8pt">5471</span> (Rev. 12-2012)
                        </div>
					</div>
					<!--END FOOTER-->
					<br/>
					<p style="page-break-before:always"/>
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
							<xsl:with-param name="TargetNode" select="$IRS5471Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="IRS5471PopulateLeftoverRow">
							<xsl:with-param name="Desc">Change In Taxable Year No. 898c</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$IRS5471Data/ChangeInTaxableYearNo898cInd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="IRS5471PopulateLeftoverRow">
							<xsl:with-param name="Desc">Election Change In Year 898c</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$IRS5471Data/ElectionChangeInYear898cInd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="IRS5471PopulateLeftoverRow">
							<xsl:with-param name="Desc">Section 898c Election</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$IRS5471Data/Section898cElectionInd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="IRS5471PopulateLeftoverRow">
							<xsl:with-param name="Desc">Section 338g Election</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$IRS5471Data/Section338gElectionInd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Dormant Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$IRS5471Data/@dormantForeignCorporationCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Change Annual Accounting Period</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$IRS5471Data/@changeAnnualAccountingPeriodCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
					<!-- Separated Repeating Data Table Line D -->
					<xsl:if test="($Print = $Separated) and  (count($IRS5471Data/PersonInformationIsFiledFor) &gt; 4)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 5471, Line D - Person(s) on whose behalf this information return is filed:</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<thead class="styTableThead">
								<!-- JMI: Label the Column Headers -->
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="font-size: 7pt; text-align: center" rowspan="2">
										<b>
											<br/>(1)</b> Name</th>
									<th scope="col" class="styDepTblCell" style="font-size: 7pt; text-align: center" rowspan="2">
										<b>
											<br/>(2)</b> Address</th>
									<th scope="col" class="styDepTblCell" style="font-size: 7pt; text-align: center" rowspan="2">
										<b>
											<br/>(3)</b> Identifying number</th>
									<th scope="col" class="styDepTblCell" style="font-size: 7pt;" colspan="3">
										<b>(4)</b> Check applicable box(es)</th>
								</tr>
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell">Shareholder</th>
									<th scope="col" class="styDepTblCell">Officer</th>
									<th scope="col" class="styDepTblCell">Director</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS5471Data/PersonInformationIsFiledFor">
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCell" style="width: 68mm; font-size: 7pt;text-align: left">
											<xsl:if test="PersonNm!=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonNm"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="BusinessName/BusinessNameLine1Txt!=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="BusinessName/BusinessNameLine2Txt != ''">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:if>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonInformationIsFiledFor"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width: 63mm; font-size: 7pt;text-align: left">
											<xsl:if test="USAddress !=''">
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="USAddress"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="ForeignAddress !=''">
												<xsl:call-template name="PopulateForeignAddressTemplate">
													<xsl:with-param name="TargetNode" select="ForeignAddress"/>
												</xsl:call-template>
											</xsl:if>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width: 30mm; text-align: center; font-size: 7pt;">
											<xsl:choose>
												<xsl:when test="EIN != ''">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="EIN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="SSN != ''">
													<xsl:call-template name="PopulateSSN">
														<xsl:with-param name="TargetNode" select="SSN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align: center; font-size: 7pt; width: 17mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ShareholderInd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="text-align: center; font-size: 7pt; width: 11mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="OfficerInd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="text-align: center; font-size: 7pt; width: 14mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DirectorInd"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- /Separated Repeating Data Table Line D -->
					<!-- Start Separate Data for Line 1b(2) -->
					<xsl:if test="(($Print = $Separated) and (count($IRS5471Data/ForeignEntityIdentificationGrp) &gt; 1))">
						<br/>
						<span class="styRepeatingDataTitle">
							<br/>Form 5471, Line 1b(2) - Reference ID number (see instructions):
               </span>
						<table class="styDepTbl" style="font-size:7pt;">
							<tbody>
								<xsl:for-each select="$IRS5471Data/ForeignEntityIdentificationGrp">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align:left;">
											<span style="text-align:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
												</xsl:call-template>
												<br/>
											</span>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!-- End Separate Data for Line 1b(2) -->
					<!-- Separate Data for Line 2(d) -->
					<xsl:if test="($Print = $Separated) and ( count($IRS5471Data/PersonWithRecordsCustody) &gt; 1)">
						<br/>
						<span class="styRepeatingDataTitle">
							<br/> Form 5471, Line 2(d) - Name and address (including corporate
							department, if applicable) of person (or persons) 
							with custody of the books and records of the
							foreign corporation, and the location of such
							books and records, if different:
               </span>
						<table class="styDepTbl" style="font-size:7pt;">
							<tbody>
								<xsl:for-each select="$IRS5471Data/PersonWithRecordsCustody">
									<tr>
										<!--Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">
										styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align:left;">
											<xsl:choose>
												<xsl:when test="BusinessName/BusinessNameLine1Txt !=''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="BusinessName/BusinessNameLine2Txt !=''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PersonNm"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<br/>
											<br/>
											<xsl:choose>
												<xsl:when test="USAddress">
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="USAddress"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="ForeignAddress"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<br/>
											<br/>
											<xsl:choose>
												<xsl:when test="LocationAddressInUS">
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="LocationAddressInUS"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="LocationAddressInForeign"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!-- End Separate Data for Line 2(d) -->
					<!-- Separated Repeating Data Table for Schedule A -->
					<xsl:if test="($Print = $Separated) and  (count($IRS5471AData/StockOfTheForeignCorporation) &gt; 4)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 5471, Schedule A - Stock of the Foreign Corporation:</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<thead class="styTableThead">
								<!-- JMI: Label the Column Headers -->
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="width: 90mm; text-align: center; font-size: 7pt;" rowspan="2">
										<br/>
										<b>(a)</b> Description of each class of stock</th>
									<th scope="col" class="styDepTblCell" style="width: 96mm; text-align: center;
									 border-right-width: 0px; font-size: 7pt;" colspan="2">
										<b>(b)</b> Number of shares issued and outstanding</th>
								</tr>
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="width: 48mm; text-align: center;">
										<i>(i)</i> Beginning of annual accounting period</th>
									<th scope="col" class="styDepTblCell" style="width: 48mm; border-right-width:0px;">
										<i>(ii)</i> End of annual accounting period</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS5471AData/StockOfTheForeignCorporation">
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">
										styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCell" style="width: 90mm; text-align: left">
											<xsl:choose>
												<xsl:when test="StockClassDesc">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="StockClassDesc"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="StockClassTypeCd "/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width: 48mm;text-align:right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AnnualAcctPeriodBeginShareCnt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width: 48mm; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AnnualAcctPeriodEndShareCnt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- /Separated Repeating Data Table for Schedule A -->
					<!-- Separated Repeating Data Table for Schedule B -->
					<xsl:if test="((count($IRS5471BData/USShareholdersOfForeignCorp) &gt; 5) or (count($IRS5471BData/USShareholdersOfForeignCorp[count(ForeignCorporationStocks) &gt; 4]) &gt; 0)) and ($Print = $Separated)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 5471, Schedule B - U.S. Shareholders of Foreign Corporation (See instructions.):</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="width: 50mm; text-align: center;">
										<br/>
										<br/>
										<b>(a)</b> Name, address, and identifying number of shareholder</th>
									<th scope="col" class="styDepTblCell" style="width: 50mm; text-align: center">
										<b>(b)</b> Description of each class of stock held by shareholder (<b>Note:</b>
										<i> This description should match the corresponding description entered in Schedule A, Part I, column (a).)</i>
									</th>
									<th scope="col" class="styDepTblCell" style="width: 30mm; text-align: center">
										<b>(c)</b> Number of shares held at beginning of annual accounting period</th>
									<th scope="col" class="styDepTblCell" style="width: 30mm; text-align: center; border-right-width: 1px">
										<b>(d)</b> Number of shares held at end of annual accounting period</th>
									<th scope="col" class="styDepTblCell" style="width: 20mm; text-align: center; border-right-width: 0px">
										<b>(e)</b> Pro rata share of subpart F income (enter as a percentage)</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS5471BData/USShareholdersOfForeignCorp">
									<xsl:variable name="RowCount" select="count(ForeignCorporationStocks)"/>
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCell" style="width: 50mm; text-align: left; font-size: 6pt">
											<xsl:choose>
												<xsl:when test="$RowCount&gt;4">
													<xsl:attribute name="rowspan"><xsl:value-of select="$RowCount"/></xsl:attribute>
												</xsl:when>
												<xsl:otherwise>
													<xsl:attribute name="rowspan">4</xsl:attribute>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:if test="PersonNm != ''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonNm"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="BusinessName/BusinessNameLine1Txt != ''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="BusinessName/BusinessNameLine1Txt != ''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:choose>
												<xsl:when test="USAddress != ''">
													<br/>
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="USAddress"/>
													</xsl:call-template>
												</xsl:when>
											</xsl:choose>
											<xsl:choose>
												<xsl:when test="ForeignAddress != ''">
													<br/>
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="ForeignAddress"/>
													</xsl:call-template>
												</xsl:when>
											</xsl:choose>
											<br/>
											<xsl:choose>
												<xsl:when test="ShareholderEIN != ''">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="ShareholderEIN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="ShareholderSSN != ''">
													<xsl:call-template name="PopulateSSN">
														<xsl:with-param name="TargetNode" select="ShareholderSSN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ShareholderMissingEINReasonCd"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width: 50mm;text-align:left;padding-left:1px;padding-right:0px;padding-top:0px;padding-bottom:0px; font-size: 6pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignCorporationStocks[1]/StockClassDesc"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width: 30mm; text-align: right;padding-left:1px;padding-right:0px;padding-top:0px;padding-bottom:0px; font-size: 6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignCorporationStocks[1]/AnnualAcctPeriodBeginShareCnt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width: 30mm; text-align: right; border-right-width: 1px;font-size:6pt;padding-left:1px;padding-right:0px;padding-top:0px;padding-bottom:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignCorporationStocks[1]/AnnualAcctPeriodEndShareCnt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width: 20mm; text-align: right; font-size: 6pt">
											<xsl:choose>
												<xsl:when test="$RowCount&gt;4">
													<xsl:attribute name="rowspan"><xsl:value-of select="$RowCount"/></xsl:attribute>
												</xsl:when>
												<xsl:otherwise>
													<xsl:attribute name="rowspan">4</xsl:attribute>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="ProRataShareSubpartFIncomeRt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<xsl:for-each select="ForeignCorporationStocks">
										<xsl:if test="not(position() = 1)">
											<tr>
												<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">
												styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose>
												</xsl:attribute>
												<td class="styTableCell" style="width: 50mm; text-align: left; font-size: 6pt;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="StockClassDesc"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="width: 30mm; text-align: right; font-size: 6pt">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AnnualAcctPeriodBeginShareCnt"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="width: 30mm; text-align: right; border-right-width: 1px; font-size: 6pt">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AnnualAcctPeriodEndShareCnt"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="position()=last()">
											<xsl:call-template name="AddDepRowsScheduleB">
												<xsl:with-param name="RowNumber" select="position()"/>
												<xsl:with-param name="index" select="1"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- /Separated Repeating Data Sch. B -->
					<!-- Separated data table for Schedule E -->
					<xsl:if test="($Print = $Separated) and  (count($IRS5471EData/IncomeAndWarProfitsTaxesPaid) &gt; 6)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 5471, Schedule E - Income, War Profits, and Excess Profits Taxes Paid or Accrued (See  instructions.):</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<thead class="styTableThead">
								<!-- JMI: Label the Column Headers -->
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="width: 90mm; text-align: center; font-size: 7pt;" rowspan="2">
										<br/>
										<b>(a)</b>
										<br/>Name of country or U.S. possession</th>
									<th scope="col" class="styDepTblCell" 
									style="font-size: 7pt; width: 96mm; text-align: center; border-right-width: 0px" colspan="3">
										<b>Amount of Tax</b>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="width: 34mm; text-align: center; font-size: 7pt;">
										<b>(b)</b>
										<br/> In foreign currency</th>
									<th scope="col" class="styDepTblCell" 
									style="width: 30mm; text-align: center; border-right-width:1px; font-size: 7pt;">
										<b>(c)</b>
										<br/>Conversion rate</th>
									<th scope="col" class="styDepTblCell" 
									style="width: 32mm; text-align: center; border-right-width:0px; font-size: 7pt;">
										<b>(d)</b>
										<br/>In U.S. dollars</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS5471EData/IncomeAndWarProfitsTaxesPaid">
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when 
										test="position() mod 2 = 1">styDepTblRow1</xsl:when>
										<xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCell" style="width: 90mm; font-size: 7pt; text-align: left">
											<span style="width: 2px"/>
											<span class="styBoldText">
												<xsl:number value="position() + 1"/>
											</span>
											<span style="width: 2px"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CountryOrPossessionName"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width: 34mm; font-size: 7pt; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxInForeignCurrencyAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width: 30mm; font-size: 7pt; text-align: right; border-right-width: 1px">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ConversionRt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width: 32mm; font-size: 7pt; text-align: right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxInUSDollarsAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styIRS5471TableLastCol" id="PAspcr"/>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
						<br/>
					</xsl:if>
					<!-- /Separated data table for Schedule E -->
					<!-- Additional Data Table for Separated Repeating Data from Schedule I -->
					<xsl:if test="($Print = $Separated) and (count($IRS5471IData) &gt; 1) ">
						<xsl:for-each select="$IRS5471IData">
							<span class="styRepeatingDataTitle">
								<br/>Form 5471, Schedule I - Summary of Shareholder’s Income From Foreign Corporation (see instructions):
            </span>
							<table class="styDepTbl" style="font-size:7pt;width:186mm;">
								<thead class="styTableThead">
									<tr class="styDepTblHdr">
								</tr>
								</thead>
								<tbody>
									<tr class="styDepTblRow1">
										<td class="styDepTblCell" style="text-align:left;" colspan="3">
											<div style="width:181mm;padding-left:2mm;">
					Name of U.S. shareholder <span style="width:2mm;"/>
												<img src="{$ImagePath}/5471_Bullet_Title.gif" alt="bullet"/>
												<span style="width:55mm;border-bottom: 1 solid black">
													<xsl:choose>
														<xsl:when test="ShareholderInformation/ShareholderPersonNm != ''">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode"
																 select="ShareholderInformation/ShareholderPersonNm"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" 
																select="ShareholderInformation/ShareholderBusinessName/BusinessNameLine1Txt"/>
															</xsl:call-template>
															<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" 
																select="ShareholderInformation/ShareholderBusinessName/BusinessNameLine2Txt"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</span>					
						Identifying number <span style="width:2mm;"/>
												<img src="{$ImagePath}/5471_Bullet_Title.gif" alt="bullet"/>
												<span style="width:50mm;border-bottom: 1 solid black; text-align:center;">
													<xsl:choose>
														<xsl:when test="ShareholderInformation/ShareholderSSN != ''">
															<xsl:call-template name="PopulateSSN">
																<xsl:with-param name="TargetNode" select="ShareholderInformation/ShareholderSSN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:when test="ShareholderInformation/ShareholderEIN != ''">
															<xsl:call-template name="PopulateEIN">
																<xsl:with-param name="TargetNode" select="ShareholderInformation/ShareholderEIN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:when test="ShareholderInformation/ShareholderMissingEINReasonCd != ''">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" 
																select="ShareholderInformation/ShareholderMissingEINReasonCd"/>
															</xsl:call-template>
														</xsl:when>
													</xsl:choose>
												</span>
											</div>
										</td>
									</tr>
									<!-- Line 1  -->
									<tr class="styDepTblRow2">
										<td class="styDepTblCell" style="text-align:left;">
											<div style="float:left;">
												<div class="styLNLeftNumBox" style="height:4mm;">1</div>
												<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Subpart F income (line 38b, Worksheet A in the instructions)    
                </div>
											</div>
											<div style="float:right;">
												<div class="styDotLn">...............</div>
											</div>
										</td>
										<td class="styDepTblCell" style="text-align:center;font-weight:bold;width:5mm">1</td>
										<td class="styDepTblCell" style="text-align:right;width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SubpartFIncomeAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- Line 2 -->
									<tr class="styDepTblRow1">
										<td class="styDepTblCell" style="text-align:left;">
											<div style="float:left;">
												<div class="styLNLeftNumBox" style="height:4mm;">2</div>
												<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Earnings invested in U.S. property (line 17, Worksheet B in the instructions)   
                </div>
											</div>
											<div style="float:right;">
												<div class="styDotLn">..........</div>
											</div>
										</td>
										<td class="styDepTblCell" style="text-align:center;font-weight:bold;width:5mm">2</td>
										<td class="styDepTblCell" style="text-align:right;width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="EarningsInvestedInUSPropAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- Line 3  -->
									<tr class="styDepTblRow2">
									<td class="styDepTblCell" style="text-align:left;border-bottom-width:0px">
											<div style="float:left;">
												<div class="styLNLeftNumBox" style="height:4mm;">3</div>
												<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                                                                 Previously excluded subpart F income withdrawn from 
                                                   qualified investments (line 6b, Worksheet <br/>C in the instructions)  
                </div>
											</div>
											<div style="float:right;">
												<div class="styDotLn">.............................</div>
											</div>
										</td>
										<td class="styDepTblCell" style="text-align:center;font-weight:bold;width:5mm;padding-top:5mm;">3</td>
										<td class="styDepTblCell" style="text-align:right;width:33mm;padding-top:5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PrevExcludedSubpartFIncomeAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- Line 4 -->
									<tr class="styDepTblRow1">
										<td class="styDepTblCell" style="text-align:left;">
											<div style="float:left;">
												<div class="styLNLeftNumBox" style="height:4mm;">4</div>
												<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Previously excluded export trade income withdrawn from investment in export trade assets (line 7b,  
                </div>
											</div>
											<div style="float:left;">
												<div class="styLNLeftNumBox" style="height:4mm;"/>
												<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Worksheet D in the instructions)  
                </div>
											</div>
											<div style="float:right;">
												<div class="styDotLn">........................</div>
											</div>
										</td>
										<td class="styDepTblCell" style="text-align:center;font-weight:bold;width:5mm;padding-top:6mm;">4</td>
										<td class="styDepTblCell" style="text-align:right;width:33mm;padding-top:6mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="WithdrawnExportTradeIncomeAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- Line 5  -->
									<tr class="styDepTblRow2">
										<td class="styDepTblCell" style="text-align:left;">
											<div style="float:left;">
												<div class="styLNLeftNumBox" style="height:4mm;">5</div>
												<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Factoring income    
                </div>
											</div>
											<div style="float:right;">
												<div class="styDotLn">............................</div>
											</div>
										</td>
										<td class="styDepTblCell" style="text-align:center;font-weight:bold;width:5mm">5</td>
										<td class="styDepTblCell" style="text-align:right;width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FactoringIncomeAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- Line 6  -->
									<tr class="styDepTblRow1">
										<td class="styDepTblCell" style="text-align:left;">
											<div style="float:left;">
												<div class="styLNLeftNumBox" style="height:4mm;">6</div>
												<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Total of lines 1 through 5. Enter here and on your income tax return. See instructions    
                </div>
											</div>
											<div style="float:right;">
												<div class="styDotLn">......</div>
											</div>
										</td>
										<td class="styDepTblCell" style="text-align:center;font-weight:bold;width:5mm">6</td>
										<td class="styDepTblCell" style="text-align:right;width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalIncmControlledFrgnCorpAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- Line 7  -->
									<tr class="styDepTblRow2">
										<td class="styDepTblCell" style="text-align:left;border-bottom-width:0px">
											<div style="float:left;">
												<div class="styLNLeftNumBox" style="height:4mm;">7</div>
												<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Dividends received (translated at spot rate on payment date under section 989(b)(1))   
                </div>
											</div>
											<div style="float:right;">
												<div class="styDotLn">.......</div>
											</div>
										</td>
										<td class="styDepTblCell" style="text-align:center;font-weight:bold;vertical-align:bottom;width:5mm">7</td>
										<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsReceivedAmt"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- Line 8  -->
									<tr class="styDepTblRow1">
										<td class="styDepTblCell" style="text-align:left;border-bottom-width:0px">
											<div style="float:left;">
												<div class="styLNLeftNumBox" style="height:4mm;">8</div>
												<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                 Exchange gain or (loss) on a distribution of previously taxed income    
                </div>
											</div>
											<div style="float:right;">
												<div class="styDotLn">............</div>
											</div>
										</td>
										<td class="styDepTblCell" style="text-align:center;font-weight:bold;
										vertical-align:bottom;border-bottom-width:4px">8</td>
										<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:33mm;border-bottom-width:4px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExchangeGainOrLossOnDistriAmt"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr class="styDepTblRow2">
										<td class="styDepTblCell" style="text-align:left;border-bottom-width:0px;" colspan="3">
											<div class="styGenericDiv" style="width: 181mm">
												<span class="styLNDesc" style="font-size: 8pt; width: 180mm">
													<span style="float: right; clear: none;padding-right:4mm;">
														<label>
															<xsl:call-template name="PopulateLabelNo">
																<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
																<xsl:with-param name="BackupName">IRS547AnyIncomeBlocked</xsl:with-param>
															</xsl:call-template>
															<b>No</b>
														</label>
												<!--		<span style="width: 1mm"/>-->
													</span>
													<span style="float: right; clear: none;padding-right:1mm;">
														<label>
															<xsl:call-template name="PopulateLabelYes">
																<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
																<xsl:with-param name="BackupName">IRS547AnyIncomeBlocked</xsl:with-param>
															</xsl:call-template>
															<b>Yes</b>
														</label>
														<span style="width: 3mm"/>
													</span>
												</span>
											</div>
											<!--   BEGIN LINE 1   -->
											<div class="styGenericDiv" style="width: 181mm;padding-top:1mm;">
												<img class="styIRS5471Img" style="width:1.5mm; height:1.5mm; border-right-width:0px; margin-top:1mm;" src="{$ImagePath}/5471_Bullet_Round.gif" alt="bullet"/>
												<span class="styLNDesc" style="width: 160mm; margin-left: 1mm">
													<span style="float:left">
Was any income of the foreign corporation blocked?
										<xsl:call-template name="SetFormLinkInline">
															<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
														</xsl:call-template>
													</span>
													<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
												</span>
												<span>
													<xsl:call-template name="PopulateSpan">
														<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
													</xsl:call-template>
													<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
														<xsl:call-template name="PopulateYesCheckbox">
															<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
															<xsl:with-param name="BackupName">IRS547AnyIncomeBlocked</xsl:with-param>
														</xsl:call-template>
													</input>
												</span>
												<span class="styNBSP" style="width: 10px"/>
												<span>
													<xsl:call-template name="PopulateSpan">
														<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
													</xsl:call-template>
													<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
														<xsl:call-template name="PopulateNoCheckbox">
															<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
															<xsl:with-param name="BackupName">IRS547AnyIncomeBlocked</xsl:with-param>
														</xsl:call-template>
													</input>
												</span>
											</div>
											<!--   END LINE 1   -->
											<div class="styGenericDiv" style="width: 181mm">
												<span class="styLNDesc" style="font-size: 8pt; width: 180mm">
													<label>
														<xsl:call-template name="PopulateLabelYes">
															<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
															<xsl:with-param name="BackupName">IRS547IncomeBecomeUnblockedThisTY
															</xsl:with-param>
														</xsl:call-template>
													</label>
													<span style="width: 2mm"/>
													<label>
														<xsl:call-template name="PopulateLabelNo">
															<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
															<xsl:with-param name="BackupName">IRS547IncomeBecomeUnblockedThisTY
															</xsl:with-param>
														</xsl:call-template>
													</label>
												</span>
											</div>
											<!--   BEGIN LINE 2   -->
											<div class="styGenericDiv" style="width: 181mm">
												<img class="styIRS5471Img" 
												style="width:1.5mm; height:1.5mm; border-right-width:0px; margin-top:1mm;" 
												src="{$ImagePath}/5471_Bullet_Round.gif" alt="bullet"/>
												<span class="styLNDesc" 
												style="width: 160mm; margin-left: 1mm">
													<span style="float:left">
Did any such income become unblocked during the tax year (see section 964(b))?
										<xsl:call-template name="SetFormLinkInline">
															<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
														</xsl:call-template>
													</span>
													<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
												</span>
												<span>
													<xsl:call-template name="PopulateSpan">
														<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
													</xsl:call-template>
													<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
														<xsl:call-template name="PopulateYesCheckbox">
															<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
															<xsl:with-param name="BackupName">IRS547IncomeBecomeUnblockedThisTY
															</xsl:with-param>
														</xsl:call-template>
													</input>
												</span>
												<span class="styNBSP" style="width: 10px"/>
												<span>
													<xsl:call-template name="PopulateSpan">
														<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
													</xsl:call-template>
													<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
														<xsl:call-template name="PopulateNoCheckbox">
															<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
															<xsl:with-param name="BackupName">IRS547IncomeBecomeUnblockedThisTY
															</xsl:with-param>
														</xsl:call-template>
													</input>
												</span>
											</div>
											<div class="styGenericDiv" style="width: 180mm">
												<span class="styLNDesc" style="width: 160mm;">
												If the answer to either question is "Yes," attach an explanation.</span>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:for-each>
					</xsl:if>
					<!-- End Schedule I Separated Data -->
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="IRS5471LinkToLeftoverDataTable">
		<xsl:param name="Desc"/>
		<xsl:param name="TargetNode"/>
		<xsl:param name="Style"/>
		<xsl:param name="TabOrder">1</xsl:param>
		<!-- do nothing if for printing -->
		<!-- take this out -->
		<xsl:choose>
			<xsl:when test="$TargetNode='X' or $TargetNode='x'">
				<!-- do nothing if for printing -->
				<!--xsl:if test="not($Print) or $Print=''" Commented to print pen images-->
				<xsl:if test="($TargetNode)">
					<div>
						<img src="{$NonVersionedImagePath}/pen.gif" alt="{$Desc}: {'Yes'}" TabIndex="{$TabOrder}" style="cursor:hand;" onclick="this.id =window.event.x + 'and' + window.event.y;
						goToLeftoverDataTable( this.id );" onkeypress="this.id =window.event.x + 'and' + window.event.y;
						 goToLeftoverDataTable( this.id );"/>
					</div>
				</xsl:if>
				<!--/xsl:if-->
			</xsl:when>
			<xsl:otherwise>
				<!-- do nothing if for printing -->
				<!--xsl:if test="not($Print) or $Print=''" Commented to print pen image-->
				<xsl:if test="($TargetNode)">
					<div>
						<img src="{$NonVersionedImagePath}/pen.gif" alt="{$Desc}: {'No'}" TabIndex="{$TabOrder}" style="cursor:hand;" onclick="this.id =window.event.x + 'and' + window.event.y;goToLeftoverDataTable( this.id );" onkeypress="this.id =window.event.x + 'and' + window.event.y;goToLeftoverDataTable( this.id );"/>
					</div>
				</xsl:if>
				<!--/xsl:if-->
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="IRS5471PopulateLeftoverRow">
		<xsl:param name="Desc"/>
		<xsl:param name="TargetNode"/>
		<xsl:param name="DescWidth">100</xsl:param>
		<xsl:param name="AmountWidth" select="187 - $DescWidth"/>
		<xsl:if test="$TargetNode">
			<tr>
				<td class="styLeftOverTableRowDesc" style="width:{$DescWidth}mm;" scope="row">
					<xsl:value-of select="$Desc"/>:</td>
				<td class="styLeftOverTableRowAmount" style="width:{$AmountWidth}mm;">
					<xsl:choose>
						<xsl:when test="$TargetNode='X'">Yes</xsl:when>
						<xsl:otherwise>No</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	<xsl:template name="AddRowsD">
		<xsl:param name="NumOfRows"/>
		<xsl:param name="PersonCount"/>
		<xsl:if test="($PersonCount &gt;4) and ($Print = $Separated)">
			<tr>
				<td class="styTableCell" style="width: 68mm; border-color: black; text-align: left; font-size: 7pt">
					<span class="styTableCellPad"/>
					<xsl:call-template name="PopulateAdditionalDataTableMessage">
						<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonInformationIsFiledFor/PersonNm"/>
					</xsl:call-template>
				</td>
				<td class="styTableCell" style="width: 63mm; border-color: black">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width: 30mm; border-color: black">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width: 12mm; border-color: black">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width: 7mm; border-color: black">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width:7mm; border-color: black; border-right-width: 0px">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AddRowsD">
				<xsl:with-param name="PersonCount" select="1"/>
				<xsl:with-param name="NumOfRows" select="$NumOfRows"/>
			</xsl:call-template>
		</xsl:if>
		<!-- Separated data case -->
		<xsl:if test="$PersonCount &lt; $NumOfRows">
			<tr>
				<td class="styTableCell" style="width: 68mm; border-color: black">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width: 63mm; border-color: black">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width: 30mm; border-color: black">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width: 12mm; border-color: black">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width: 7mm; border-color: black">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width: 7mm; border-color: black; border-right-width: 0px">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AddRowsD">
				<xsl:with-param name="PersonCount" select="$PersonCount + 1"/>
				<xsl:with-param name="NumOfRows" select="$NumOfRows"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="AddRowsScheduleAI">
		<xsl:param name="NumOfRows"/>
		<xsl:param name="StockCount"/>
		<!-- Separated data case -->
		<xsl:if test="($StockCount &gt;4) and ($Print = $Separated)">
			<tr>
				<td class="styTableCell" style="width: 68mm; border-color: black; text-align: left">
					<span class="styTableCellPad"/>
					<xsl:call-template name="PopulateAdditionalDataTableMessage">
						<xsl:with-param name="TargetNode" select="$IRS5471AData/StockOfTheForeignCorporation"/>
					</xsl:call-template>
				</td>
				<td class="styTableCell" style="width: 48mm;text-align:right; border-color: black">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width: 48mm; text-align: right; border-color: black; border-right-width: 0px">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AddRowsScheduleAI">
				<xsl:with-param name="StockCount" select="1"/>
				<xsl:with-param name="NumOfRows" select="$NumOfRows"/>
			</xsl:call-template>
		</xsl:if>
		<!-- Separated data case Schedule A -->
		<xsl:if test="$StockCount &lt; $NumOfRows">
			<tr>
				<td class="styTableCell" style="border-color: black; width: 90mm">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 48mm;text-align:right">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 48mm; text-align: right; border-right-width: 0px">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AddRowsScheduleAI">
				<xsl:with-param name="StockCount" select="$StockCount + 1"/>
				<xsl:with-param name="NumOfRows" select="$NumOfRows"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- separated data Schedule B -->
	<xsl:template name="AddRowsScheduleB">
		<xsl:param name="NumOfRows"/>
		<xsl:param name="ShareholdersCount"/>
		<xsl:param name="StockSetsCount"/>
		<xsl:if test="($ShareholdersCount &lt; 1) or ((($ShareholdersCount &gt; $NumOfRows) or ($StockSetsCount&gt; 0)) and ($Print = $Separated))">
			<tr>
				<td class="styTableCell" style="border-color: black; width: 60mm; text-align: left; font-size: 7pt" rowspan="4">
					<span class="styTableCellPad"/>
					<xsl:if test="(($ShareholdersCount &gt; $NumOfRows) or ($StockSetsCount&gt; 0)) and ($Print = $Separated)">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$IRS5471BData/USShareholdersOfForeignCorp/PersonNm"/>
						</xsl:call-template>
					</xsl:if>
				</td>
				<td class="styTableCell" style="border-color: black; width: 60mm">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 20mm; text-align: right">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 20mm; text-align: right; border-right-width: 1px">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" rowspan="4" style="border-color: black; width: 20mm; text-align: right; border-right-width: 0px">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AddSubRows">
				<xsl:with-param name="RowNumber">1</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="($ShareholdersCount &lt; 2) or ((($ShareholdersCount &gt; $NumOfRows) or ($StockSetsCount&gt; 0)) and ($Print = $Separated))">
			<tr>
				<td class="styTableCell" style="border-color: black; width: 60mm" rowspan="4">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 60mm">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 20mm; text-align: right">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 20mm; text-align: right; border-right-width: 1px">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" rowspan="4" style="border-color: black; width: 20mm; text-align: right; border-right-width: 0px">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AddSubRows">
				<xsl:with-param name="RowNumber">1</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="($ShareholdersCount &lt; 3) or ((($ShareholdersCount &gt; $NumOfRows) or ($StockSetsCount&gt; 0)) and ($Print = $Separated))">
			<tr>
				<td class="styTableCell" style="border-color: black; width: 60mm" rowspan="4">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 60mm">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 20mm; text-align: right">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 20mm; text-align: right; border-right-width: 1px">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" rowspan="4" style="border-color: black; width: 20mm; text-align: right; border-right-width: 0px">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AddSubRows">
				<xsl:with-param name="RowNumber">1</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="($ShareholdersCount &lt; 4) or ((($ShareholdersCount &gt; $NumOfRows) or ($StockSetsCount&gt; 0)) and ($Print = $Separated))">
			<tr>
				<td class="styTableCell" style="border-color: black; width: 60mm" rowspan="4">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 60mm">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 20mm; text-align: right">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 20mm; text-align: right; border-right-width: 1px">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" rowspan="4" style="border-color: black; width: 20mm; text-align: right; border-right-width: 0px">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AddSubRows">
				<xsl:with-param name="RowNumber">1</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="($ShareholdersCount &lt; 5) or ((($ShareholdersCount &gt; $NumOfRows) or ($StockSetsCount&gt; 0)) and ($Print = $Separated))">
			<tr>
				<td class="styTableCell" style="border-color: black; width: 60mm" rowspan="4">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 60mm">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 20mm; text-align: right">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 20mm; text-align: right; border-right-width: 1px">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" rowspan="4" style="border-color: black; width: 20mm; text-align: right; border-right-width: 0px">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AddSubRows">
				<xsl:with-param name="RowNumber">1</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- AddDepRowsScheduleB -->
	<xsl:template name="AddDepRowsScheduleB">
		<xsl:param name="RowNumber"/>
		<xsl:param name="index"/>
		<xsl:if test="$RowNumber &lt; 4">
			<tr>
				<xsl:attribute name="class"><xsl:choose><xsl:when test="$index mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
				<td class="styTableCell" style=" width: 60mm">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style=" width: 20mm; text-align: right">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style=" width: 20mm; text-align: right; border-right-width: 1px">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableLastCol" id="FSspcr"/>
			</tr>
			<xsl:call-template name="AddDepRowsScheduleB">
				<xsl:with-param name="RowNumber" select="$RowNumber + 1"/>
				<xsl:with-param name="index" select="$index + 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- /AddDepRowsScheduleB -->
	<xsl:template name="AddDepSubRows">
		<xsl:param name="RowNumber"/>
		<xsl:param name="index"/>
		<xsl:if test="$RowNumber &lt; 4">
			<tr>
				<xsl:attribute name="class"><xsl:choose><xsl:when test="$index mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
				<td class="styTableCell" style="border-color: black; width: 60mm">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 20mm; text-align: right">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 20mm; text-align: right; border-right-width: 1px">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableLastCol" id="FSspcr"/>
			</tr>
			<xsl:call-template name="AddDepSubRows">
				<xsl:with-param name="RowNumber" select="$RowNumber + 1"/>
				<xsl:with-param name="index" select="$index + 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="AddSubRows">
		<xsl:param name="RowNumber"/>
		<xsl:if test="$RowNumber &lt; 4">
			<tr>
				<td class="styTableCell" style="border-color: black; width: 60mm">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 20mm; text-align: right">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; width: 20mm; text-align: right; border-right-width: 1px">
					<span class="styTableCellPad"/>
				</td>
				<td class="styIRS5471TableLastCol" id="FSspcr"/>
			</tr>
			<xsl:call-template name="AddSubRows">
				<xsl:with-param name="RowNumber" select="$RowNumber + 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="AddRowsScheduleE">
		<xsl:param name="NumOfRows"/>
		<xsl:param name="TPCount"/>
		<!-- Separated data case  -->
		<xsl:if test="($TPCount &gt; $NumOfRows) and ($Print = $Separated)">
			<tr style="height:4mm;">
				<td class="styTableCell" style="border-color: black; width: 90mm; text-align: left ">
					<span style=" width: 2mm;"/>
					<b>2</b>
					<span style=" width: 2px;"/>
					<span class="styTableCellPad"/>
					<xsl:call-template name="PopulateAdditionalDataTableMessage">
						<xsl:with-param name="TargetNode" select="$IRS5471AData/StockOfTheForeignCorporation/StockClassDesc"/>
					</xsl:call-template>
				</td>
				<td class="styTableCell" style="border-color: black">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; border-right-width: 1px">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; border-right-width: 0px">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableLastCol" id="PAspcr"/>
			</tr>
			<xsl:call-template name="AddRowsScheduleE">
				<xsl:with-param name="TPCount" select="1"/>
				<xsl:with-param name="NumOfRows" select="$NumOfRows"/>
			</xsl:call-template>
		</xsl:if>
		<!-- /Separated data case -->
		<xsl:if test="$TPCount &lt; $NumOfRows">
			<tr>
				<td class="styTableCell" style="border-color: black; width: 90mm; font-size: 7pt; text-align: left; padding-left: 2mm">
					<span class="styBoldText">
						<xsl:number value="$TPCount + 2"/>
					</span>
					<span style="width: 2px"/>
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; text-align: right">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color: black; border-right-width: 0px">
					<span class="styTableCellPad"/>
				</td>
				<td class="styIRS5471TableLastCol" id="PAspcr"/>
			</tr>
			<xsl:call-template name="AddRowsScheduleE">
				<xsl:with-param name="TPCount" select="$TPCount + 1"/>
				<xsl:with-param name="NumOfRows" select="$NumOfRows"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
