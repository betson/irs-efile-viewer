<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8858Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="Form8858Data" select="$RtnDoc/IRS8858"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8858Data)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching  -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 8858"/>
				<xsl:call-template name="InitJS"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"/>
				<style type="text/css">
					<!--HINTS - This form contains separated print format -->
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8858Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm">
				<form name="Form8858">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Begin Form Number and Name -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:26mm;height:21mm;">
							<div style="height:8mm;">
                Form<span class="styFormNumber">  8858</span>
							</div>
							<!--<br/>
							<br/>-->
							<div style="height:4mm;font-size:7pt;font-family:arial;">
               (Rev. December 2018)<br/>
								<span style="width:3px;"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8858Data"/>
								</xsl:call-template>
								<span style="width:3px;"/>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Form 8858, Top Left Margin - Summary Dormant FDE Indicator</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form8858Data/@summaryDormantFDECd"/>
								</xsl:call-template>
							</div>
							<div style="padding-top:3mm;">
								<span class="styAgency">Department of the Treasury </span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:132mm;height:21mm;">
							<div class="styMainTitle"><span style="text-align:left;">Information Return of U.S. Persons With Respect To Foreign</span>
														  <br/>Disregarded Entities (FDEs) and Foreign Branches (FBs)
							</div>
							<div class="styFBT" style="margin-top:0px;padding-bottom:1mm;">
									<img src="{$ImagePath}/8858_Bullet_Sm.gif" alt="Bullet"/>Go to 
											<a href="http://www.irs.gov/form8858" title="Link to IRS.gov"><i>www.irs.gov/Form8858 </i></a>for instructions and the latest information.
							</div>
							<br/>
							<div style="width:132mm;text-align:center;font:size:10pt;float:left;padding-left:1mm;">Information furnished for the FDE’s or FB's annual accounting period (see instructions)<br/>
								beginning 
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form8858Data/FrgnDisrgrdEntAnnualAcctPeriod/BeginDt"/>
								</xsl:call-template>
								  , and ending         
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form8858Data/FrgnDisrgrdEntAnnualAcctPeriod/EndDt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styTYBox" style="width:27mm;height:21mm;">
							<div class="styOMB" style="height:8mm;padding-bottom:1.5mm;padding-top:1mm;">OMB No. 1545-1910</div>
							<div class="stySequence" style="padding-left:.5mm;padding-top:6mm;">Attachment<br/>Sequence No. 
								<span style="font-size:8pt;font-weight:bold;">140</span>
							</div>
						</div>
					</div>
					<!-- End Form Header -->
					<!-- Begin Filer Info -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:140mm;height:10mm;font-size:7pt;">
              Name of person filing this return<br/>
							<xsl:choose>
								<!-- Input Name  -->
								<xsl:when test="normalize-space($Form8858Data/FilerName/BusinessNameLine1Txt) != ''">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/FilerName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/FilerName/BusinessNameLine2Txt"/>
									</xsl:call-template>
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
								<!-- Name from 1040 Return Header -->
								<xsl:when test="$RtnHdrData/Filer/NameLine1Txt">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
									</xsl:call-template>
								</xsl:when>
								<!-- Name from 1041 Return Header -->
								<xsl:when test="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt">
									<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="$RtnHdrData/Filer/NationalMortgageAssocCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
									</xsl:call-template>
									<br/>
								</xsl:when>
								<xsl:otherwise>
        </xsl:otherwise>
							</xsl:choose>
						</div>
						<div style="width:45mm;height: 10mm;padding-left:2mm;font-size:7pt;
             font-weight: normal;" class="styEINBox">
							<span class="styBoldText">Filer’s identifying number</span>
							<br/>
							<br/>
							<xsl:choose>
								<!--input SSN-->
								<xsl:when test="$Form8858Data/FilerSSN">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$Form8858Data/FilerSSN"/>
									</xsl:call-template>
								</xsl:when>
								<!--input Missing EIN Reason code-->
								<xsl:when test="$Form8858Data/MissingEINReasonCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/MissingEINReasonCd"/>
									</xsl:call-template>
								</xsl:when>
								<!--input EIN -->
								<xsl:when test="$Form8858Data/FilerEIN">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$Form8858Data/FilerEIN"/>
									</xsl:call-template>
								</xsl:when>
								<!-- Filer's Identifying information from 1120/990/1065 Return Header -->
								<xsl:when test="$RtnHdrData/Filer/EIN">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
									</xsl:call-template>
								</xsl:when>
								<!-- Filer's Identifying information from 1040 Return Header -->
								<xsl:when test="$RtnHdrData/Filer/PrimarySSN">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<!-- Filer's Identifying information from 1041 Return Header -->
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styNumberBox" style="height:10mm;font-size:7pt;">
              Number, street, and room or suite no. (or P.O. box number if mail is not delivered to street address)  
              <br/>
							<xsl:choose>
								<!-- Input US street address -->
								<xsl:when test="$Form8858Data/FilerUSAddress">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/FilerUSAddress/AddressLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="$Form8858Data/FilerUSAddress/AddressLine2Txt">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8858Data/FilerUSAddress/AddressLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
								</xsl:when>
								<xsl:otherwise>
									<!-- Input Foreign street address -->
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/FilerForeignAddress/AddressLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="$Form8858Data/FilerForeignAddress/AddressLine2Txt">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8858Data/FilerForeignAddress/AddressLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styNumberBox" style="height:10mm;">
          City or town, state, and ZIP code
              <br/>
							<br/>
							<!--<xsl:choose>-->
								<!-- input US city, state and zip code-->
								<xsl:if test="$Form8858Data/FilerUSAddress">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/FilerUSAddress/CityNm"/>
									</xsl:call-template>,
									  <span style="width:4px;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/FilerUSAddress/StateAbbreviationCd"/>
									</xsl:call-template>
									  <span style="width:5px;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/FilerUSAddress/ZIPCd"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form8858Data/FilerForeignAddress">
									<!-- input Foreign city, state and zip code-->
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/FilerForeignAddress/CityNm"/>
									</xsl:call-template>,
									  <span style="width:.5mm;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/FilerForeignAddress/ProvinceOrStateNm"/>
									</xsl:call-template>,
										<span style="width:4px;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/FilerForeignAddress/ForeignPostalCd"/>
									</xsl:call-template>
									<span style="width:4px;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/FilerForeignAddress/CountryCd"/>
									</xsl:call-template>
								</xsl:if>
							<!--</xsl:choose>-->
						</div>
					</div>
					<div class="styBB" style="width:187mm;height:4mm;">
						<div style="text-align:left;height:4mm;">
              Filer’s tax year beginning
              <xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$Form8858Data/FilerTaxYearDetail/BeginDt"/>
							</xsl:call-template>
              , and ending         
              <xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$Form8858Data/FilerTaxYearDetail/EndDt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Filer Info -->
					<div class="styBB" style="width:187mm;height:8mm;font-size:8pt;">
						<span style="width: 180mm;">
							<b>Important: </b>
							<i>Fill in all applicable lines and schedules. All information <b>must</b>
								  be in English. All amounts  <b>must</b> be stated in <span style="width:18mm"/>
								  U.S. dollars unless otherwise indicated.</i>
						</span>
					</div>
					<div class="styBB" style="height:9mm;width:187mm;">	
						<div style="width:187mm;">
							<div class="styLNDesc" style="width:63mm;">Check here
								<span style="width:7mm;"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8858Data/FDEUSPersonInd"/>
										<xsl:with-param name="BackupName">IRS8858FDEUSPerson</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8858Data/FDEUSPersonInd"/>
										<xsl:with-param name="BackupName">IRS8858FDEUSPerson</xsl:with-param>
									</xsl:call-template>FDE of a U.S. person
							   </label>
							</div>   
							<div class="styLNDesc" style="width:68mm;">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8858Data/FDECFCInd"/>
										<xsl:with-param name="BackupName">IRS8858FDECFC</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8858Data/FDECFCInd"/>
										<xsl:with-param name="BackupName">IRS8858FDECFC</xsl:with-param>
									</xsl:call-template>FDE of a controlled foreign corporation (CFC)
							   </label>
							</div>   
							<div class="styLNDesc" style="width:56mm;">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8858Data/FDECFPInd"/>
										<xsl:with-param name="BackupName">IRS8858FDECFP</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8858Data/FDECFPInd"/>
										<xsl:with-param name="BackupName">IRS8858FDECFP</xsl:with-param>
									</xsl:call-template>FDE of a controlled foreign partnership
							   </label>
							</div>
						</div>	
						<div style="width:187mm;">
							<div class="styLNDesc" style="width:63mm;">
								<span style="width:22mm;"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8858Data/FBUSPersonInd"/>
										<xsl:with-param name="BackupName">IRS8858FBUSPerson</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8858Data/FBUSPersonInd"/>
										<xsl:with-param name="BackupName">IRS8858FBUSPerson</xsl:with-param>
									</xsl:call-template>FB of a U.S. person
							   </label>
							</div>   
							<div class="styLNDesc" style="width:68mm;">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8858Data/FBCFCInd"/>
										<xsl:with-param name="BackupName">IRS8858FBCFC</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8858Data/FBCFCInd"/>
										<xsl:with-param name="BackupName">IRS8858FBCFC</xsl:with-param>
									</xsl:call-template>FB of a CFC
							   </label>
							</div>   
							<div class="styLNDesc" style="width:56mm;">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8858Data/FBCFPInd"/>
										<xsl:with-param name="BackupName">IRS8858FBCFP</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8858Data/FBCFPInd"/>
										<xsl:with-param name="BackupName">IRS8858FBCFP</xsl:with-param>
									</xsl:call-template>FB of a controlled foreign partnership
							   </label>
							</div>
						</div>
					</div>		
					<div class="styBB" style="height:5mm;width:187mm;">	
						<div style="width:187mm;">
							<div class="styLNDesc" style="width:63mm;">Check here 
								<span style="width:7mm;"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8858Data/InitialForm8858Ind"/>
										<xsl:with-param name="BackupName">IRS8858InitialForm8858</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8858Data/InitialForm8858Ind"/>
										<xsl:with-param name="BackupName">IRS8858InitialForm8858</xsl:with-param>
									</xsl:call-template>Initial 8858
							   </label>
							</div>   
							<div class="styLNDesc" style="width:68mm;">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8858Data/FinalForm8858Ind"/>
										<xsl:with-param name="BackupName">IRS8858FinalForm8858</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8858Data/FinalForm8858Ind"/>
										<xsl:with-param name="BackupName">IRS8858FinalForm8858</xsl:with-param>
									</xsl:call-template>Final 8858
							   </label>
							</div>
						</div>
					</div>	
					
					<div class="styGenericDiv" style="width:187mm;overflow:hidden;">
						<div class="styFNBox" style="width:95mm;height:30mm;border-right-width:1px;clear:none;">
							<div class="styLNLeftNumBox" style="width:6mm;padding-left:0mm;padding-top:0mm;">1a</div>  
								Name and address of FDE or FB
							<br/><br/>
							<div style="margin-left:6mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8858Data/FDEOrFBName/BusinessNameLine1Txt"/>
								</xsl:call-template>
								<xsl:if test="normalize-space($Form8858Data/FDEOrFBName/BusinessNameLine2Txt)!=''">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/FDEOrFBName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</xsl:if>
								<br/>
								<xsl:choose>
									<xsl:when test="$Form8858Data/FDEOrFBForeignAddress">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8858Data/FDEOrFBForeignAddress/AddressLine1Txt"/>
										</xsl:call-template>
										<xsl:if test="normalize-space($Form8858Data/FDEOrFBForeignAddress/AddressLine2Txt)!=''">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8858Data/FDEOrFBForeignAddress/AddressLine2Txt"/>
											</xsl:call-template>
										</xsl:if>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8858Data/FDEOrFBForeignAddress/CityNm"/>
										</xsl:call-template>
										<xsl:if test="(normalize-space($Form8858Data/FDEOrFBForeignAddress/CityNm) != '') and (normalize-space($Form8858Data/FDEOrFBForeignAddress/ProvinceOrStateNm) != '' or normalize-space($Form8858Data/FDEOrFBForeignAddress/ForeignPostalCd) != '')">											,
										</xsl:if>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8858Data/FDEOrFBForeignAddress/ProvinceOrStateNm"/>
										</xsl:call-template>  
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8858Data/FDEOrFBForeignAddress/ForeignPostalCd"/>
										</xsl:call-template>
										<xsl:if test="normalize-space($Form8858Data/FDEOrFBForeignAddress/CityNm) != '' or normalize-space($Form8858Data/FDEOrFBForeignAddress/ProvinceOrStateNm) != '' or normalize-space($Form8858Data/FDEOrFBForeignAddress/ForeignPostalCd) != ''">
										<span style="width:4px;"/>
										</xsl:if>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8858Data/FDEOrFBForeignAddress/CountryCd"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:if test="$Form8858Data/FDEOrFBUSAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8858Data/FDEOrFBUSAddress/AddressLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="normalize-space($Form8858Data/FDEOrFBUSAddress/AddressLine2Txt)!=''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form8858Data/FDEOrFBUSAddress/AddressLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8858Data/FDEOrFBUSAddress/CityNm"/>
											</xsl:call-template>,
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8858Data/FDEOrFBUSAddress/StateAbbreviationCd"/>
											</xsl:call-template>  
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8858Data/FDEOrFBUSAddress/ZIPCd"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
						<div style="width:92mm;border-bottom:1px solid black;border-left:0px solid black;">
							<div class="styGenericDiv" style="padding-left:1mm;height:10mm;">
								<div class="styLNLeftNumBox" style="width:9mm;padding-top:0mm;">b(1)</div>  
									U.S. identifying number, if any
								<br/>
								<br/>
								<div style="padding-left:14mm;">
									<xsl:choose>
										<xsl:when test="$Form8858Data/FDEOrFBUSIdNumberDetail/EIN !=''">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="$Form8858Data/FDEOrFBUSIdNumberDetail/EIN"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="$Form8858Data/FDEOrFBUSIdNumberDetail/MissingEINReasonCd !=''">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8858Data/FDEOrFBUSIdNumberDetail/MissingEINReasonCd"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="$Form8858Data/FDEOrFBUSIdNumberDetail/SSN"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</div>
						</div>
						<!-- Box 1b(2) Reference ID number -->
						<div style="height:12mm;width:92mm;float:left;border-top-width: 1px;border-top-style:solid;border-color:black;border-bottom-width: 1px;">
							<div class="styLNLeftNumBox" style="width:9mm;padding-top:0mm;">b(2)</div>  
								Reference ID number (see instructions)<br/><br/>
							<span style="width: 8mm"/> 
							<xsl:choose>
								<xsl:when test="((count($Form8858Data/ForeignEntityIdentificationGrp) &gt; 1)) ">
									See Additional Data Table   
							   </xsl:when>
								<xsl:otherwise>
									<div style="padding-left: 0mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8858Data/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
										</xsl:call-template>
										<br/>
									</div>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-top-width:1px;float:none ">
						<div class="styGenericDiv" style="width:152mm;border-style:solid;border-color:black;border-width:0px 1px 0px 0px;">
							<div style="height:4mm;">
								<span class="styTableCellHeader" style="height:4mm;width:112mm;border-color:black;border-bottom:0;text-align:left;vertical-align:top;padding-left:1mm;font-weight:normal;font-size:6pt;" scope="col">
									<div class="styLNLeftNumBox" style="font-size: 7pt;width:5mm;padding-top:0mm;">c</div>
										For FDE, country(ies) under whose laws organized and entity type under local tax law
							   </span>
								<span style="font-weight:bold;padding-left:1mm;">d</span>
								<span style="width:10px;"/>Date(s) of organization
 							</div>
							<div style="float:right;">
								<!-- Tanuja  no need for dynamictoggle button as this needs to be controlled by height-->
								<xsl:call-template name="SetDynamicTableToggleButton">
												<xsl:with-param name="TargetNode" select="$Form8858Data/ForeignEntityIdentificationGrp"/>
												<xsl:with-param name="containerHeight" select="1"/>
												<xsl:with-param name="headerHeight" select="0"/>
												<xsl:with-param name="containerID" select=" 'FEIdctn2' "/>
											</xsl:call-template>
							</div>
							<div class="styGenericDiv" style="width:152mm;overflow:hidden;" id="FEIdctn2">
								<xsl:call-template name="SetInitialState"/>
								<table class="styIRS8858CDTable" cellspacing="0" name="TYTable" id="FEIdctn2" style="width:152mm;">
									<thead/>
									<tfoot/>
									<tbody>
										<!-- Display all rows of Line 1c/1d if the print option is not "separated" -->
										<!-- If the print option is "separated", but there is only one row, display the row -->
										<xsl:if test="($Print != $Separated) or (count($Form8858Data/CountryEntityOrgDetail) = 1)">
											<xsl:for-each select="$Form8858Data/CountryEntityOrgDetail">
												<tr style="height:7mm;">
													<td class="styTableCell" style="width:112mm;vertical-align:top;text-align:left;border-color:black;font-size:7pt;padding-left:6mm;">
														<xsl:if test="position() = last()">
															<xsl:attribute name="style">width:112mm;vertical-align:top;text-align:left;border-color:black;font-size:7pt;border-bottom-width:0px;padding-left:6mm;</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="CntryUnderWhoseLawsOrganizedCd"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="EntityTypeTxt"/>
														</xsl:call-template>
													</td>
													<td class="styTableCell" style="width:40mm;text-align:left;border-color:black;vertical-align:top;font-size:7pt;padding-left:1mm">
														<xsl:if test="position() = last()">
															<xsl:attribute name="style">width:40mm;text-align:left;border-color:black;vertical-align:top;font-size:7pt;border-bottom-width:0px;padding-left:1mm;</xsl:attribute>
														</xsl:if>
													<span style="padding-left:6mm">
													<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="OrganizationDt"/>
														</xsl:call-template>
														</span>
											</td>
												</tr>
											</xsl:for-each>
										</xsl:if>
										<!-- Display the data container only if there is no data for Lines 1c/1d. -->
										<!-- If the print parameter is "separated" and there is more than one row of data, then display a -->
										<!-- message directing the user to the additional data table -->
										<xsl:if test="not($Form8858Data/CountryEntityOrgDetail) or (($Print = $Separated) and (count($Form8858Data/CountryEntityOrgDetail) &gt; 1))">
											<tr style="height:6mm;">
												<td class="styTableCell" style="width:112mm;vertical-align:top;text-align:left;font-size:7pt;border-bottom:0;padding-left:6mm;">
													<xsl:call-template name="PopulateAdditionalDataTableMessage">
														<xsl:with-param name="TargetNode" select="$Form8858Data/CountryEntityOrgDetail"/>
													</xsl:call-template>
													<br/>
												</td>
												<td class="styTableCell" style="width:40mm;text-align:left;vertical-align:top;font-size:7pt;border-bottom:0;padding-left:6mm;">
													<xsl:call-template name="PopulateAdditionalDataTableMessage">
														<xsl:with-param name="TargetNode" select="$Form8858Data/CountryEntityOrgDetail"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
											</tr>
										</xsl:if>
									</tbody>
								</table>
							</div>
						</div>
						<div style="width:35mm;" class="styGenericDiv">
							<div class="styLNLeftNumBox" style="height:6.75mm;width:4mm;padding-top:0mm;">e</div> 
            Effective date as FDE
						<br/>
							<span style="width:39mm;padding-left:5mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8858Data/FDEEffectiveDt"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
						<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form8858Data/ForeignEntityIdentificationGrp"/>
						<xsl:with-param name="containerHeight" select="1"/>
						<xsl:with-param name="headerHeight" select="0"/>
						<xsl:with-param name="containerID" select=" 'FEIdctn2' "/>
					</xsl:call-template>
					<div class="styBB" style="width:187mm;height:auto;">
						<!-- Box 1f -->
						<div class="styNameBox" style="height:22mm;width:56mm;font-size:6pt;border-right: 1px solid black;">
							<div class="styLNLeftNumBox" style="font-size: 7pt;width:5mm;padding-top:0mm;">f</div>
							<div class="styNameBox" style="width:50mm;border-right:0;">
              If benefits under a U.S. tax treaty were claimed with respect to income of
               the FDE or FB, enter the treaty and article number<br/><br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8858Data/TreatyAndArticleNumberTxt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="height:22mm;width:56mm;float:left; border-right: 1px solid black; font-size: 6pt;">
							<div class="styLNLeftNumBox" style="width:4mm;padding-top:0mm">g</div>
							<!-- Box 1g -->
							<div class="styNameBox" style="width:50mm;border-right-width:0px;">
                                  Country in which principal business activity is conducted<br/>
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8858Data/PrincipalBusinessActyCountryCd"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="height:22mm;width:40mm;float:left; border-right: 1px solid black; font-size: 6pt;">
							<div class="styLNLeftNumBox" style="width:4mm;font-size:7pt;padding-top:0mm;">h</div>
							<!-- Box 1h -->
							<div class="styNameBox" style="width:35mm;border-right-width:0px;">
                                   Principal business activity<br/>
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8858Data/PrincipalBusinessActivityDesc"/>
									<!-- ELEMENT IS MISSPELLED IN SCHEMA -->
								</xsl:call-template>
							</div>
						</div>
						<div style="width:35mm;height:22mm;float:left;">
							<div class="styLNLeftNumBox" style="width:4mm;padding-top:0mm;">i</div>
							<!-- Box 1i -->
							<div class="styNameBox" style="border-right-width:0px;height:22mm;">
                               Functional currency<br/>
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8858Data/FunctionalCurrencyDesc"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styGenericDiv" style="width:160mm;">
							<span class="styBoldText">2</span>
							<span style="width: 3mm;"/>
							<!-- Line 2 -->
            Provide the following information for the FDE&#39;s or FB&#39;s accounting period stated above.
            </div>
						<div style="float:right;">
							<!-- Tanuja  no need for dynamictoggle button as this needs to be controlled by height-->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form8858Data/BooksAndRecords"/>
								<xsl:with-param name="containerHeight" select="1"/>
								<xsl:with-param name="headerHeight" select="0"/>
								<xsl:with-param name="containerID" select=" 'TPctn' "/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Adding parent div to the elements a and b of line 2.  If not when the height of the line e is less than the c and d, then this table will appear next to the line e -->
					<div class="styBB" style="width:187mm;float:none;clear:both;height:auto;display:block;">
						<div class="styBB" style="width:93mm;height:auto;border-bottom:0px solid black;">
							<div class="styLNLeftNumBox" style="height:4.5mm; font-size: 7pt;padding-top:0mm;">a</div>
							<!-- Box 2a -->
							<div class="styGenericDiv" style="width:85mm;font-size:7pt;margin-left:-2.5mm;padding-right:2px;height:8mm;">
              Name, address, and identifying number of branch office or <br/>agent (if any) in the United States
							</div> 
								<!-- 2a - Name -->
								<div style="font-family:verdana;padding-top:7mm;padding-left:6mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/USAgentName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="$Form8858Data/USAgentName/BusinessNameLine2Txt !=''">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8858Data/USAgentName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
								
									<!-- 2a - Address -->
									<br/>
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" select="$Form8858Data/USAgentAddress"/>
									</xsl:call-template>
									<!-- 2a - Identifying number -->
									<br/>
									<xsl:choose>
										<xsl:when test="$Form8858Data/USAgentIdNumberDetail/SSN">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="$Form8858Data/USAgentIdNumberDetail/SSN"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="$Form8858Data/USAgentIdNumberDetail/MissingEINReasonCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8858Data/USAgentIdNumberDetail/MissingEINReasonCd"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="$Form8858Data/USAgentIdNumberDetail/EIN"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</div>
						
							<!-- Box 2b -->
						<div style="width:94mm;border-left:1px solid black;">
							<div style="width:94mm;">
								<div class="styLNLeftNumBox" style="height:13mm;border-left:0px solid black;text-align:left;
									vertical-align:top;padding-left:1mm;font-size:7pt;padding-top:0mm;">b
								</div>
								<div class="styGenericDiv" style="width:86mm;border-color:black;
									border:none;font-weight:normal;text-align:left;vertical-align:top;font-size:7pt;">
										  Name and address (including corporate department, if applicable) of person(s) 
										  with custody of the books and records of the FDE or FB, and the 
										  location of such books and records, if different
								</div>
							</div>
							<div class="styIRS8858Ln2bTable" style="height:auto;border-left:0px solid black;"  id="TPctn">
								<xsl:call-template name="SetInitialState"/>
								<table class="styTable" cellspacing="0" name="TYTable" id="TYTable">
									<tbody>
										<!-- Display all rows of Line 2b if the print option is not "separated" -->
										<!-- If the print option is "separated", but there is only one row, display the row -->
										<xsl:if test="($Print != $Separated) or (count($Form8858Data/BooksAndRecords) = 1)">
											<xsl:for-each select="$Form8858Data/BooksAndRecords">
												<tr>
													<td class="styTableCell" style="width:8mm;border:none;border-bottom:1px solid black;">
														<xsl:if test="(position() = last())">
															<xsl:attribute name="style">width:8mm;border:none;</xsl:attribute>
														</xsl:if>
														<span style="width:4px;"/>
													</td>
													<td class="styTableCell" style="width:86mm;text-align:left;vertical-align:top;border:none;border-bottom:1px solid black;">
														<xsl:if test="(position() = last())">
															<xsl:attribute name="style">width:86mm;text-align:left;vertical-align:top;border:none;</xsl:attribute>
														</xsl:if>
														<span style="font-family:verdana;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="PersonsWithBooksName/BusinessNameLine1Txt"/>
															</xsl:call-template>
															<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="PersonsWithBooksName/BusinessNameLine2Txt"/>
															</xsl:call-template>
														</span>
														<br/>
							Custodian Address:<br/>
														<xsl:choose>
															<xsl:when test="PersonsWithBooksUSAddress">
																<xsl:call-template name="PopulateUSAddressTemplate">
																	<xsl:with-param name="TargetNode" select="PersonsWithBooksUSAddress"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$Form8858Data/BooksAndRecords/PersonsWithBooksForeignAddress/AddressLine1Txt"/>
																</xsl:call-template>
																<xsl:if test="normalize-space($Form8858Data/BooksAndRecords/PersonsWithBooksForeignAddress/AddressLine2Txt)!=''">
																	<br/>
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="$Form8858Data/BooksAndRecords/PersonsWithBooksForeignAddress/AddressLine2Txt"/>
																	</xsl:call-template>
																</xsl:if>
																<br/>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$Form8858Data/BooksAndRecords/PersonsWithBooksForeignAddress/CityNm"/>
																</xsl:call-template>
																<xsl:if test="(normalize-space($Form8858Data/BooksAndRecords/PersonsWithBooksForeignAddress/CityNm) != '') and (normalize-space($Form8858Data/BooksAndRecords/PersonsWithBooksForeignAddress/ProvinceOrStateNm) != '' or normalize-space($Form8858Data/BooksAndRecords/PersonsWithBooksForeignAddress/ForeignPostalCd) != '')">											,
																</xsl:if>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$Form8858Data/BooksAndRecords/PersonsWithBooksForeignAddress/ProvinceOrStateNm"/>
																</xsl:call-template>  
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$Form8858Data/BooksAndRecords/PersonsWithBooksForeignAddress/ForeignPostalCd"/>
																</xsl:call-template>
																<xsl:if test="normalize-space($Form8858Data/BooksAndRecords/PersonsWithBooksForeignAddress/CityNm) != '' or normalize-space($Form8858Data/BooksAndRecords/PersonsWithBooksForeignAddress/ProvinceOrStateNm) != '' or normalize-space($Form8858Data/BooksAndRecords/PersonsWithBooksForeignAddress/ForeignPostalCd) != ''">
																<span style="width:4px;"/>
																</xsl:if>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$Form8858Data/BooksAndRecords/PersonsWithBooksForeignAddress/CountryCd"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
														<br/>
															Location:<br/>
														<xsl:choose>
															<xsl:when test="LocationOfBooksUSAddress">
																<xsl:call-template name="PopulateUSAddressTemplate">
																	<xsl:with-param name="TargetNode" select="LocationOfBooksUSAddress"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$Form8858Data/BooksAndRecords/LocationOfBooksForeignAddress/AddressLine1Txt"/>
																</xsl:call-template>
																<xsl:if test="normalize-space($Form8858Data/BooksAndRecords/LocationOfBooksForeignAddress/AddressLine2Txt)!=''">
																	<br/>
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="$Form8858Data/BooksAndRecords/LocationOfBooksForeignAddress/AddressLine2Txt"/>
																	</xsl:call-template>
																</xsl:if>
																<br/>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$Form8858Data/BooksAndRecords/LocationOfBooksForeignAddress/CityNm"/>
																</xsl:call-template>
																<xsl:if test="(normalize-space($Form8858Data/BooksAndRecords/LocationOfBooksForeignAddress/CityNm) != '') and (normalize-space($Form8858Data/BooksAndRecords/LocationOfBooksForeignAddress/ProvinceOrStateNm) != '' or normalize-space($Form8858Data/BooksAndRecords/LocationOfBooksForeignAddress/ForeignPostalCd) != '')">											,
																</xsl:if>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$Form8858Data/BooksAndRecords/LocationOfBooksForeignAddress/ProvinceOrStateNm"/>
																</xsl:call-template>  
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$Form8858Data/BooksAndRecords/LocationOfBooksForeignAddress/ForeignPostalCd"/>
																</xsl:call-template>
																<xsl:if test="normalize-space($Form8858Data/BooksAndRecords/LocationOfBooksForeignAddress/CityNm) != '' or normalize-space($Form8858Data/BooksAndRecords/LocationOfBooksForeignAddress/ProvinceOrStateNm) != '' or normalize-space($Form8858Data/BooksAndRecords/LocationOfBooksForeignAddress/ForeignPostalCd) != ''">
																<span style="width:4px;"/>
																</xsl:if>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$Form8858Data/BooksAndRecords/LocationOfBooksForeignAddress/CountryCd"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</td>
												</tr>
											</xsl:for-each>
										</xsl:if>
										<!-- Display the data container only if there is no data for Line 2b. -->
										<!-- If the print parameter is "separated" and there is more than one row of data, then display a -->
										<!-- message directing the user to the additional data table -->
										<xsl:if test="not($Form8858Data/BooksAndRecords) or (($Print = $Separated)
					   and (count($Form8858Data/BooksAndRecords) &gt;  1))">
											<tr>
												<td class="styTableCell" style="width:8mm;vertical-align:top;text-align:left;border:none;">
													<span style="width:4px;"/>
												</td>
												<td class="styTableCell" style="height:28mm;width:86mm;text-align:left;vertical-align:top;border:none;">
													<br/>
													<xsl:call-template name="PopulateAdditionalDataTableMessage">
														<xsl:with-param name="TargetNode" select="$Form8858Data/BooksAndRecords"/>
													</xsl:call-template>
													<span style="width:4px;"/>
												</td>
											</tr>
										</xsl:if>
									</tbody>
								</table>
								<xsl:call-template name="SetInitialDynamicTableHeight">
									<xsl:with-param name="TargetNode" select="$Form8858Data/BooksAndRecords"/>
									<xsl:with-param name="containerHeight" select="1"/>
									<xsl:with-param name="headerHeight" select="0"/>
									<xsl:with-param name="containerID" select=" 'TPctn' "/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div style="width:187mm;float:none;clear:both;">
						<table class="styTable" style="font-size: 7pt" cellspacing="0">
							<thead/>
							<tbody>
								<tr style="border-color: black">
									<td class="styTableCell" style="width: 187mm; text-align: left; border-right-width: 0px;border-bottom-width:0px" colspan="3">
										<span class="styBoldText">3</span>
										<span style="width: 2mm;"/>
										<!-- Line 3 -->
                    For the <span class="styBoldText">tax owner</span> of the FDE or FB (if different from the filer) provide the following (see instructions):
                  </td>
								</tr>
								<tr>
									<td class="styTableCell" style="width: 92mm;border-color:black; text-align: left;border-top-width: 1px; height:20mm; vertical-align:top;" rowspan="3">
										<span class="styLNLeftNumBox" style="padding-top:0mm;width:4.5mm;height:100%;padding-right:2mm;">a</span>
										<!-- Box 3a -->
                    Name and address<br/><br/>
										<!-- 3a - Name -->
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8858Data/TaxOwnerName/BusinessNameLine1Txt"/>
										</xsl:call-template>
										<xsl:if test="$Form8858Data/TaxOwnerName/BusinessNameLine2Txt !=''">
											<br/>
											<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8858Data/TaxOwnerName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</xsl:if>
										<!-- 3a - Address -->
										<!-- USA Adress -->
										<br/>
											<xsl:choose>
												<xsl:when test="$Form8858Data/TaxOwnerUSAddress">
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="$Form8858Data/TaxOwnerUSAddress"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form8858Data/TaxOwnerForeignAddress/AddressLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="normalize-space($Form8858Data/TaxOwnerForeignAddress/AddressLine2Txt)!=''">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form8858Data/TaxOwnerForeignAddress/AddressLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form8858Data/TaxOwnerForeignAddress/CityNm"/>
												</xsl:call-template>
												<xsl:if test="(normalize-space($Form8858Data/TaxOwnerForeignAddress/CityNm) != '') and (normalize-space($Form8858Data/TaxOwnerForeignAddress/ProvinceOrStateNm) != '' or normalize-space($Form8858Data/TaxOwnerForeignAddress/ForeignPostalCd) != '')">											,
												</xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form8858Data/TaxOwnerForeignAddress/ProvinceOrStateNm"/>
												</xsl:call-template>  
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form8858Data/TaxOwnerForeignAddress/ForeignPostalCd"/>
												</xsl:call-template>
												<xsl:if test="normalize-space($Form8858Data/TaxOwnerForeignAddress/CityNm) != '' or normalize-space($Form8858Data/TaxOwnerForeignAddress/ProvinceOrStateNm) != '' or normalize-space($Form8858Data/TaxOwnerForeignAddress/ForeignPostalCd) != ''">
												<span style="width:4px;"/>
												</xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form8858Data/TaxOwnerForeignAddress/CountryCd"/>
												</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
									</td>
									<td class="styNameBox" colspan="1" valign="top" style="height:10mm;font-size:7pt; border-top-width: 1px;
                   border-bottom-width: 1px;border-right-width:0px;width:95mm">
										<span class="styLNLeftNumBox" style="height:9mm;width:7.5mm;padding-top:0mm;">b</span>
										<!-- Box 3b -->                 
                                          Annual accounting period covered by the return (see instructions)                                  
                    <br/><br/>
										<xsl:choose>
											<xsl:when test="$Form8858Data/TaxOwnerTaxYearDetail">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form8858Data/TaxOwnerTaxYearDetail/BeginDt"/>
												</xsl:call-template>
												 to       
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form8858Data/TaxOwnerTaxYearDetail/EndDt"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form8858Data/TaxOwnerTaxYearDetail/BeginDt"/>
												</xsl:call-template>
												      
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form8858Data/TaxOwnerTaxYearDetail/EndDt"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="border-bottom-width:1px;width:95mm">
										<div class="styLNLeftNumBox" style="width:9mm;padding-top:0mm;">c(1)</div>
										<!-- Box 3C(1) U.S. identifying number -->
                     U.S. identifying number, if any<br/><br/>
										<div style="height:4mm;padding-left:8mm;">
											<xsl:choose>
												<xsl:when test="$Form8858Data/TaxOwnerUSIdNumberDetail/SSN">
													<xsl:call-template name="PopulateSSN">
														<xsl:with-param name="TargetNode" select="$Form8858Data/TaxOwnerUSIdNumberDetail/SSN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="$Form8858Data/TaxOwnerUSIdNumberDetail/MissingEINReasonCd">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form8858Data/
                            TaxOwnerUSIdNumberDetail/MissingEINReasonCd"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="$Form8858Data/TaxOwnerUSIdNumberDetail/EIN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</div>
										<!-- Box 3c(2) Reference ID number -->
										<div style="height:9mm;width:95mm;float:left;border-top-width: 1px;
                   border-top-style:solid;border-color:black;border-bottom-width: 1px;">
											<div class="styLNLeftNumBox" style="width:9mm;padding-top:0mm;">c(2)</div>  
                     Reference ID number (see instructions)<br/><br/>
											<span style="width: 7.5mm"/> 
											<xsl:choose>
												<xsl:when test="((count($Form8858Data/TaxOwnerEntityIdGrp) &gt; 1)) ">
                        See Additional Data Table   
                       </xsl:when>
												<xsl:otherwise>
													<div style="padding-left: 0mm;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form8858Data/TaxOwnerEntityIdGrp/ForeignEntityReferenceIdNum"/>
														</xsl:call-template>
														<br/>
													</div>
												</xsl:otherwise>
											</xsl:choose>
										</div>
									</td>
								</tr>
								<tr>
									<td valign="top" class="styNameBox" style="width:60mm;height:10mm;font-size:7pt;
                   border-bottom-width: 1px;border-top-width: 1px;">
										<span class="styLNLeftNumBox" style="width:7.5mm;padding-top:0mm;">d</span>
										<!-- Box 3d -->
						Country under whose laws organized
				    <br/><br/>
										<span style="width: 7.5mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8858Data/
                      TxOwnerCntryLawsOrganizedCd"/>
										</xsl:call-template>
									</td>
									<td valign="top" class="styNameBox" style="width:35mm;height:10mm;font-size:7pt; 
                  border-right: 0px;border-top-width: 1px;border-bottom-width: 1px">
										<span class="styBoldText" style="padding-left:1mm;padding-right: 1.8mm">e</span>
										<!-- Box 3e -->
                         Functional currency<br/>
										<br/>
										<span style="width: 5mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8858Data/
                      TaxOwnerFunctionalCurrencyDesc"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styGenericDiv" style="width:187mm;">
							<div style="width:175mm;">
								<span class="styBoldText">4</span>
								<span style="width: 2mm;"/>
								<!-- Line 4 -->  
								  For the <span class="styBoldText">direct owner</span> of the FDE or FB (if different from the tax owner) provide the following
								   (see instructions):
							</div>
							<!--Line 4  Toggle Button set begin -->
							<div style="float:right;">
								<xsl:if test="count($Form8858Data/DirectOwner) &gt; 1">
									<xsl:call-template name="SetDynamicTableToggleButton">
										<xsl:with-param name="TargetNode" select="$Form8858Data/DirectOwner"/>
										<xsl:with-param name="containerHeight" select="2"/>
										<xsl:with-param name="headerHeight" select="0"/>
										<xsl:with-param name="containerID" select=" 'DOctn' "/>
									</xsl:call-template>
								</xsl:if>
							</div>
						</div>
						<xsl:if test="($Print != $Separated) and (count($Form8858Data/DirectOwner) &gt;0)
           or ($Print = $Separated) and (count($Form8858Data/DirectOwner) =1)">
							<div class="styTableContainer" id="DOctn" style="height:auto;border-top-width:1px;">
								<xsl:call-template name="SetInitialState"/>
								<!-- Display all rows of Line 4 if the print option is not "separated" -->
								<!-- If the print option is  "separated", but there is one row, display the row, including if the data field is empty -->
								<table class="styTable" style="font-size: 7pt" cellspacing="0">
									<thead/>
									<tbody>
										<xsl:for-each select="$Form8858Data/DirectOwner">
											<!-- Line 4 -->
											<tr>
												<td class="styTableCell" style="width: 95mm;border-color:black; text-align: left; 
                      border-top-width: 0px; height:32mm; vertical-align:top;" rowspan="2">
													<span class="styLNLeftNumBox" style="padding-top:0mm;width:4.5mm;
                        height:100%;">a</span>
													<!-- Box 4a -->
              Name and address<br/><br/>
													<!-- 4a - Name -->
													<xsl:if test="DirectOwnerName/BusinessNameLine1Txt !=''">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DirectOwnerName/BusinessNameLine1Txt"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="DirectOwnerName/BusinessNameLine2Txt !=''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DirectOwnerName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
													<!-- 4a - Address -->
													<!-- USA Adress -->
													<br/>
													<xsl:if test="DirectOwnerUSAddress">
														<xsl:call-template name="PopulateUSAddressTemplate">
															<xsl:with-param name="TargetNode" select="DirectOwnerUSAddress"/>
														</xsl:call-template>
													</xsl:if>
													<!-- Foreign Address 4a -->
													<xsl:if test="DirectOwnerForeignAddress">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form8858Data/DirectOwner/DirectOwnerForeignAddress/AddressLine1Txt"/>
														</xsl:call-template>
														<xsl:if test="normalize-space($Form8858Data/DirectOwner/DirectOwnerForeignAddress/AddressLine2Txt)!=''">
															<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$Form8858Data/DirectOwner/DirectOwnerForeignAddress/AddressLine2Txt"/>
															</xsl:call-template>
														</xsl:if>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form8858Data/DirectOwner/DirectOwnerForeignAddress/CityNm"/>
														</xsl:call-template>
														<xsl:if test="(normalize-space($Form8858Data/DirectOwner/DirectOwnerForeignAddress/CityNm) != '') and (normalize-space($Form8858Data/DirectOwner/DirectOwnerForeignAddress/ProvinceOrStateNm) != '' or normalize-space($Form8858Data/DirectOwner/DirectOwnerForeignAddress/ForeignPostalCd) != '')">											,
														</xsl:if>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form8858Data/DirectOwner/DirectOwnerForeignAddress/ProvinceOrStateNm"/>
														</xsl:call-template>  
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form8858Data/DirectOwner/DirectOwnerForeignAddress/ForeignPostalCd"/>
														</xsl:call-template>
														<xsl:if test="normalize-space($Form8858Data/DirectOwner/DirectOwnerForeignAddress/CityNm) != '' or normalize-space($Form8858Data/DirectOwner/DirectOwnerForeignAddress/ProvinceOrStateNm) != '' or normalize-space($Form8858Data/DirectOwner/DirectOwnerForeignAddress/ForeignPostalCd) != ''">
														<span style="width:4px;"/>
														</xsl:if>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form8858Data/DirectOwner/DirectOwnerForeignAddress/CountryCd"/>
														</xsl:call-template>
													</xsl:if>
												</td>
												<!-- Box 4b -->
												<td class="styNameBox" style="height:10mm;width:92mm;font-size:7pt; border-top-width:0px;
                       border-bottom-width: 1px;border-right:0px;" colspan="2">
													<span class="styLNLeftNumBox" style="padding-top:0mm;width:4.5mm;
                        height:100%;">b</span>
                        Country under whose laws organized<br/>
													<span style="width:5mm;"/>
													<br/>
													<span style="width: 5mm"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DrtOwnerCntryLawsOrganizedCd"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="styNameBox" valign="top" style="width:57mm;height:22mm;
                         font-size: 7pt;border-top-width: 0px; border-bottom-width: 1px; border-right-width:  1px;">
													<span class="styBoldText" style="padding-left:1mm;padding-right: 1.8mm;
                        text-align:center;">c</span>
													<!-- Box 4c -->
                            U.S. identifying number, if any
                        <br/>
													<br/>
													<span style="width: 5mm;"/>
													<xsl:choose>
														<xsl:when test="DirectOwnerUSIdNumberDetail/SSN">
															<xsl:call-template name="PopulateSSN">
																<xsl:with-param name="TargetNode" select="DirectOwnerUSIdNumberDetail/SSN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:when test="DirectOwnerUSIdNumberDetail/MissingEINReasonCd">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="DirectOwnerUSIdNumberDetail/
                              MissingEINReasonCd"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateEIN">
																<xsl:with-param name="TargetNode" select="DirectOwnerUSIdNumberDetail/EIN"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td valign="top" class="styNameBox" style="width:35mm;height:22mm;
                      font-size:7pt; border-right: 0px;border-bottom-width: 1px;">
													<span class="styBoldText" style="padding-left:1mm;padding-right: 1.8mm">d</span>
													<!-- Box 4d -->
                            Functional currency<br/>
													<br/>
													<span style="width: 5mm"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DrtOwnerFunctionalCurrencyDesc"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
									</tbody>
								</table>
								<xsl:if test="count($Form8858Data/DirectOwner) &gt; 1">
									<xsl:call-template name="SetInitialDynamicTableHeight">
										<xsl:with-param name="TargetNode" select="$Form8858Data/DirectOwner"/>
										<xsl:with-param name="containerHeight" select="2"/>
										<xsl:with-param name="headerHeight" select="0"/>
										<xsl:with-param name="containerID" select=" 'DOctn' "/>
									</xsl:call-template>
								</xsl:if>
							</div>
						</xsl:if>
						<!-- Line 4 Toggle Button End -->
						<!-- If the print parameter is "separated" and there is more than one row of data, then display a -->
						<!-- message directing the user to the additional data table.  If there is no Direct Owner data print an empty table -->
						<xsl:if test="not($Form8858Data/DirectOwner) or
                      ($Print = $Separated) and (count($Form8858Data/DirectOwner) &gt; 1)">
							<div style="float: left; clear:none; width: 187mm;border-top:1px solid #000000;">
								<table class="styTable" style="font-size: 7pt" cellspacing="0">
									<thead/>
									<tbody>
										<!-- Line 4 -->
										<tr>
											<td class="styTableCell" style="width:92mm;border-color:black;
                     text-align: left; border-top-width: 0px; height:20mm; vertical-align:top;" rowspan="2">
												<span class="styLNLeftNumBox" style="padding-top:0mm;width:4.5mm;
                      height:100%;">a</span>
												<!-- Box 4a -->
              Name and address<br/>
												<br/>
												<!-- 4a - Name -->
												<span style="font-family:verdana;font-size:7pt;">
													<xsl:if test="$Form8858Data/DirectOwner !=''">
														<xsl:call-template name="PopulateAdditionalDataTableMessage">
															<xsl:with-param name="TargetNode" select="$Form8858Data/
                            DirectOwner/DirectOwnerName"/>
														</xsl:call-template>
													</xsl:if>
													<!-- 4a - Address -->
													<!-- USA Adress -->
												</span>
											</td>
											<!-- Box 4b -->
											<td class="styNameBox" style="width:95mm;font-size:7pt; border-top-width: 0px; 
                    border-right-width:0px;border-bottom-width: 1px;" colspan="2">
												<span class="styLNLeftNumBox" style="padding-top:0mm;width:4.5mm;
                      height:100%;">b</span>
                        Country under whose laws organized<br/>
												<span style="width:5mm;"/>
												<br/>
												<span style="width: 5mm"/>
												<xsl:if test="$Form8858Data/DirectOwner/DrtOwnerCntryLawsOrganizedCd !=''">
													<xsl:call-template name="PopulateAdditionalDataTableMessage">
														<xsl:with-param name="TargetNode" select="$Form8858Data/DirectOwner/
                          DrtOwnerCntryLawsOrganizedCd"/>
													</xsl:call-template>
												</xsl:if>
											</td>
										</tr>
										<tr>
											<td class="styNameBox" style="width:57mm;font-size: 7pt;border-top-width: 0px;
                      border-bottom-width: 1px; border-right-width:1px;">
												<span class="styBoldText" style="height:4mm;padding-left:1mm;
                      padding-right: 1.8mm">c</span>
												<!-- Box 4c -->
                          U.S. identifying number, if any<br/>
												<br/>
												<span style="width: 5mm"/>
												<xsl:if test="$Form8858Data/DirectOwner/DirectOwnerUSIdNumberDetail/EIN !=''">
													<xsl:call-template name="PopulateAdditionalDataTableMessage">
														<xsl:with-param name="TargetNode" select="$Form8858Data/DirectOwner/
                          DirectOwnerUSIdNumberDetail/EIN"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styNameBox" style="width:38mm;height:10.8mm;font-size:7pt; 
                    border-right: 0px;border-bottom-width: 1px;">
												<span class="styBoldText" style="padding-left:1mm;padding-right:1.8mm">d</span>
												<!-- Box 4d -->
                         Functional currency<br/>
												<br/>
												<span style="width: 5mm;"/>
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form8858Data/DirectOwner/
                        DrtOwnerFunctionalCurrencyDesc"/>
												</xsl:call-template>
											</td>
										</tr>
									</tbody>
								</table>
								<!--   END line 4 TABLE   -->
							</div>
						</xsl:if>
						<!-- ******************************************End Tag Added by PJ on October 3, 2013****************************************** -->
					</div>
					<div class="styBB" style="width:187mm;float:none;clear:both;">
						<div style="width:187mm;height:6mm">
							<span class="styLNLeftNumBox" style="width:6mm;padding-left:0mm;">5</span>
							<!-- Line 5 -->
							<span class="styLNDesc" style="width:179mm;font-size: 6pt;margin-left:-2mm;">
								  Attach an organizational chart that identifies the name, placement, percentage of ownership, tax classification, and country 
								  of organization of all entities in the chain of ownership between the tax owner and the FDE or FB, and the chain 
								  of ownership between the FDE or FB and each entity in which the FDE or FB has a 10% or more 
								  direct or indirect interest. See instructions.
            </span>
						</div>
						<div style="width:187mm;"/>
					</div>

					<!-- Page 1 Footer and Page 2 Header -->
					<div class="pageEnd" style="width:187mm;float:none;clear:both;">
						<div class="stySmallText" style="width:90mm;text-align:left;float;left; font-weight: bold;">
							For Paperwork Reduction Act Notice, see the separate instructions.
						</div>
						<div class="stySmallText" style="width:41mm;text-align:right;clear:none;">
							Cat. No. 21457L
						</div>
						<div class="stySmallText" style="width:36mm;text-align:right;float:right;clear:none;">
							Form <span class="styBoldText" style="font-size:8pt;">8858</span> (Rev. 12-2018)
						</div>
					</div>
					<p style="page-break-before:always"/>
					<div style="width:187mm;border-bottom:1px solid #000000;">
						<div class="stySmallText" style="width:90mm;text-align:left;float;left;">
							Form 8858 (Rev. 12-2018)
						</div>
						<div class="stySmallText" style="width:36mm;text-align:right;float:right;clear:none;">
							Page <span class="styBoldText" style="font-size:8pt;">2</span>
						</div>
					</div>
					<!-- Schedule C header -->
					<div class="styBB" style="width:187mm;float:none;clear:both;">
						<span class="styPartName" style="width: 26mm;">Schedule C</span>
						<span class="styPartDesc" style="width: 160mm;">Income Statement
						<span class="styNormalText"> (see instructions)</span>
						</span>
					</div>
					<div class="styBB" style="width:187mm;font-size: 9pt">
						<!-- Schedule C description -->
						<label for="Section989bAvgExchangeRateInd">
							<!-- The xsl:choose code block below will display multiple schema versions using one stylesheet -->
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/Section989bAvgExchangeRateInd"/>
								<xsl:with-param name="BackupName">IRS8858ScheduleCSection989(b)AverageExchangeRate</xsl:with-param>
							</xsl:call-template>
							<span class="styBoldText" style="height: 4mm; width: 20mm; font-size: 9pt;vertical-align: top;">Important: </span>
							<i>
							Report all information in functional currency in accordance with U.S. GAAP. Also, report each amount in U.S. 
							dollars translated from functional currency (using GAAP translation rules or the average exchange rate determined 
							under section 989(b)). If the functional currency is the U.S. dollar, complete only the U.S. Dollars column. See 
							instructions for special rules for FDEs or FBs that use DASTM. </i>
						</label>
						<br/>
						<div class="styItalicText" style="float:left;clear:none;">
							If you are using the average exchange rate (determined under section 989(b)), check the following box
						</div>
						<div style="float:right;clear:none;">
							<span class="styDotLn">...</span>
							<input type="checkbox" class="styCkbox" id="Section989bAvgExchangeRateInd">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/Section989bAvgExchangeRateInd"/>
									<xsl:with-param name="BackupName">IRS8858ScheduleCSection989(b)AverageExchangeRate</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<br/>
					<br/>
					<br/>
					<br/>
					<br/>
					<br/>
					<br/>
					<div style="width:187mm;">
						<!-- Schedule C data -->
						<!-- Schedule C Header -->
						<div style="width:187mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="width:8mm;height: 4.5mm;"/>
								<div class="styLNDesc" style="width: 107mm; height: 4.5mm;">
									<span class="styDotLn" style="float:right;padding-right:1mm;"/>
								</div>
							</div>
							<div style="float:right;clear:none;border-top-width:1px;">
								<div class="styLNRightNumBox" style="height: 4.5mm;"/>
								<div class="styLNAmountBox" style="height: 4.5mm;text-align:center">
									<b>Functional Currency</b>
								</div>
								<div class="styLNAmountBox" style="height: 4.5mm;;text-align:center">
									<b>U.S. Dollars </b>
								</div>
							</div>
						</div>
						<!-- Schedule C line 1 -->
						<div style="width:187mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;height: 4.5mm;">1</div>
								<div class="styLNDesc" style="width: 107mm; height: 4.5mm;">
									<span style="float: left; clear: none;">Gross receipts or sales (net of returns and allowances)</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
								</div>
							</div>
							<div style="float:right;clear:none;border-top-width:1px;">
								<div class="styLNRightNumBox" style="height: 4.5mm;padding-top:1mm">1</div>
								<div class="styLNAmountBox" style="height: 4.5mm;;padding-top:1mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/
                    GrossReceiptsOrSalesIncmStmt/FunctionalCurrencyAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height: 4.5mm;padding-top:1mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/
                    GrossReceiptsOrSalesIncmStmt/USDollarAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Schedule C line 2 -->
						<div style="width:187mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;height: 4.5mm;">2</div>
								<div class="styLNDesc" style="width: 107mm; height: 4.5mm;">
									<span style="float: left; clear: none;">Cost of goods sold</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
								</div>
							</div>
							<div style="float:right;clear:none;border-top-width:1px;">
								<div class="styLNRightNumBox" style="height: 4.5mm;padding-top:1mm">2</div>
								<div class="styLNAmountBox" style="height: 4.5mm;padding-top:1mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/
                    CostOfGoodsSoldIncmStmt/FunctionalCurrencyAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height: 4.5mm;padding-top:1mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/
                    CostOfGoodsSoldIncmStmt/USDollarAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Schedule C line 3 -->
						<div style="width:187mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;height: 4.5mm;">3</div>
								<div class="styLNDesc" style="width: 107mm; height: 4.5mm;">
									<span style="float: left; clear: none;">Gross profit (subtract line 2 from line 1)</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
								</div>
							</div>
							<div style="float:right;clear:none;border-top-width:1px;">
								<div class="styLNRightNumBox" style="height: 4.5mm;padding-top:1mm">3</div>
								<div class="styLNAmountBox" style="height: 4.5mm;padding-top:1mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/
                    GrossProfitIncmStmt/FunctionalCurrencyAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height: 4.5mm;padding-top:1mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/
                    GrossProfitIncmStmt/USDollarAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Schedule C line 4 -->
						<div style="width:187mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;height: 4.5mm;">4</div>
								<div class="styLNDesc" style="width: 107mm; height: 4.5mm;">
									<span style="float: left; clear: none;">Dividends</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>
								</div>
							</div>
							<div style="float:right;clear:none;border-top-width:1px;">
								<div class="styLNRightNumBox" style="height: 4.5mm;padding-top:1mm">4</div>
								<div class="styLNAmountBox" style="height: 4.5mm;padding-top:1mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/DividendsIncmStmt/FunctionalCurrencyAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height: 4.5mm;padding-top:1mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/DividendsIncmStmt/USDollarAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Schedule C line 5 -->
						<div style="width:187mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;height: 4.5mm;">5</div>
								<div class="styLNDesc" style="width: 107mm; height: 4.5mm;">
									<span style="float: left; clear: none;">Interest</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>
								</div>
							</div>
							<div style="float:right;clear:none;border-top-width:1px;">
								<div class="styLNRightNumBox" style="height: 4.5mm;padding-top:1mm">5</div>
								<div class="styLNAmountBox" style="height: 4.5mm;padding-top:1mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/InterestIncmStmt/FunctionalCurrencyAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height: 4.5mm;padding-top:1mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/InterestIncmStmt/USDollarAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Schedule C line 6 -->
						<div style="width:187mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;height: 4.5mm;">6</div>
								<div class="styLNDesc" style="width: 107mm; height: 4.5mm;">
									<span style="float: left; clear: none;">Gross rents, royalties, and license fees</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
								</div>
							</div>
							<div style="float:right;clear:none;border-top-width:1px;">
								<div class="styLNRightNumBox" style="height: 4.5mm;padding-top:1mm">6</div>
								<div class="styLNAmountBox" style="height: 4.5mm;padding-top:1mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/GrossRentRyltyLcnsFeeIncmStmt/FunctionalCurrencyAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height: 4.5mm;padding-top:1mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/GrossRentRyltyLcnsFeeIncmStmt/USDollarAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Schedule C line 7 -->
						<div style="width:187mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;height: 4.5mm;">7</div>
								<div class="styLNDesc" style="width: 107mm; height: 4.5mm;">
									<span style="float: left; clear: none;">Gross income from performance of services</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
								</div>
							</div>
							<div style="float:right;clear:none;border-top-width:1px;">
								<div class="styLNRightNumBox" style="height: 4.5mm;padding-top:1mm">7</div>
								<div class="styLNAmountBox" style="height: 4.5mm;padding-top:1mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/GrossIncmPerfSrvcIncmStmt/FunctionalCurrencyAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height: 4.5mm;padding-top:1mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/GrossIncmPerfSrvcIncmStmt/USDollarAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Schedule C line 8 -->
						<div style="width:187mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;height: 4.5mm;">8</div>
								<div class="styLNDesc" style="width: 107mm; height: 4.5mm;">
									<span style="float: left; clear: none;">Foreign currency gain (loss)</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
								</div>
							</div>
							<div style="float:right;clear:none;border-top-width:1px;">
								<div class="styLNRightNumBox" style="height: 4.5mm;padding-top:1mm">8</div>
								<div class="styLNAmountBox" style="height: 4.5mm;padding-top:1mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/FrgnCurrencyGainLossIncmStmt/FunctionalCurrencyAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height: 4.5mm;padding-top:1mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/FrgnCurrencyGainLossIncmStmt/USDollarAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Schedule C line 9 -->
						<div style="width:187mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;height: 4.5mm;">9</div>
								<div class="styLNDesc" style="width: 107mm; height: 4.5mm;">
									<span style="float: left; clear: none;">Other income</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>
								</div>
							</div>
							<div style="float:right;clear:none;border-top-width:1px;">
								<div class="styLNRightNumBox" style="height: 4.5mm;padding-top:1mm">9</div>
								<div class="styLNAmountBox" style="height: 4.5mm;padding-top:1mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/
                    OtherIncmStmt/FunctionalCurrencyAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height: 4.5mm;padding-top:1mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/
                    OtherIncmStmt/USDollarAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Schedule C line 10 -->
						<div style="width:187mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="width:8mm;height: 4.5mm;">10</div>
								<div class="styLNDesc" style="width: 107mm; height: 4.5mm;">
									<span style="float: left; clear: none;">Total income (add lines 3 through 9)</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
								</div>
							</div>
							<div style="float:right;clear:none;border-top-width:1px;">
								<div class="styLNRightNumBox" style="height: 4.5mm;padding-top:1mm">10</div>
								<div class="styLNAmountBox" style="height: 4.5mm;padding-top:1mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/
                    TotalIncmStmt/FunctionalCurrencyAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height: 4.5mm;padding-top:1mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/
                    TotalIncmStmt/USDollarAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Schedule C line 11 -->
						<div style="width:187mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="width:8mm;height: 4.5mm;">11</div>
								<div class="styLNDesc" style="width: 107mm; height: 4.5mm;">
									<span style="float: left; clear: none;">Total deductions (exclude income tax expense)</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
								</div>
							</div>
							<div style="float:right;clear:none;border-top-width:1px;">
								<div class="styLNRightNumBox" style="height: 4.5mm;padding-top:1mm">11</div>
								<div class="styLNAmountBox" style="height: 4.5mm;padding-top:1mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/
                    TotalDeductionsIncmStmt/FunctionalCurrencyAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height: 4.5mm;padding-top:1mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/
                    TotalDeductionsIncmStmt/USDollarAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Schedule C line 12 -->
						<div style="width:187mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="width:8mm;height: 4.5mm;">12</div>
								<div class="styLNDesc" style="width: 107mm; height: 4.5mm;">
									<span style="float: left; clear: none;">Income tax expense</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
								</div>
							</div>
							<div style="float:right;clear:none;border-top-width:1px;">
								<div class="styLNRightNumBox" style="height: 4.5mm;padding-top:1mm">12</div>
								<div class="styLNAmountBox" style="height: 4.5mm;padding-top:1mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/IncomeTaxExpenseIncmStmt/FunctionalCurrencyAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height: 4.5mm;padding-top:1mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/IncomeTaxExpenseIncmStmt/USDollarAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Schedule C line 13 -->
						<div style="width:187mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="width:8mm;height: 4.5mm;">13</div>
								<div class="styLNDesc" style="width: 107mm; height: 4.5mm;">
									<span style="float: left; clear: none;">Other adjustments</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
								</div>
							</div>
							<div style="float:right;clear:none;border-top-width:1px;">
								<div class="styLNRightNumBox" style="height: 4.5mm;padding-top:1mm">13</div>
								<div class="styLNAmountBox" style="height: 4.5mm;padding-top:1mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/
                    OtherAdjustmentsIncmStmt/FunctionalCurrencyAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height: 4.5mm;padding-top:1mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/
                    OtherAdjustmentsIncmStmt/USDollarAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Schedule C line 14 -->
						<div style="width:187mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="width:8mm;height: 4.5mm">14</div>
								<div class="styLNDesc" style="width: 107mm; height: 4.5mm;">
									<span style="float: left; clear: none;">Net income (loss) per books</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
								</div>
							</div>
							<div style="float:right;clear:none;border-top-width:1px;">
								<div class="styLNRightNumBox" style="height: 4.5mm;border-bottom-width:0px;padding-top:1mm">14</div>
								<div class="styLNAmountBox" style="height: 4.5mm;border-bottom-width:0px;padding-top:1mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/
                     NetIncomeLossPerBooksIncmStmt/FunctionalCurrencyAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height: 4.5mm;border-bottom-width:0px;padding-top:1mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC/
                    NetIncomeLossPerBooksIncmStmt/USDollarAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- Schedule C-1 header -->
					<!-- Filler section for Schedule C-1 -->
					<!-- Display the data container only if there is no data for Schedule C-1 -->
					<!-- If the print parameter is "separated" and there is more than one instance of Schedule C-1,  -->
					<!-- then display a message directing the user to the additional data table -->
					<xsl:if test="not($Form8858Data/IRS8858ScheduleC1) or    
                      (($Print = $Separated) and (count($Form8858Data/IRS8858ScheduleC1) &gt; 1))">
						<div class="styBB" style="width:187mm;border-top:1px solid black;">
							<span class="styPartName" style="width: 25mm;">Schedule C-1</span>
							<span class="styPartDesc" style="width: 155mm;">Section 987 Gain or Loss Information</span>
						</div>
						<div class="styBB" style="width:187mm;">
							<div style="width:187mm;">
								<div style="float:left;">
									<div class="styLNLeftNumBox" style="height:15mm;"/>
									<div class="styLNDesc" style="height:15mm;width:105mm;padding-top:4mm;">
											<b>Note:</b>  See the instructions if there are multiple recipients of remittances 
                    from the FDE or FB.</div>
								</div>
								<div style="float:right;">
									<div class="styLNRightNumBox" style="height:15mm;"/>
									<div class="styLNAmountBox" style="height:15mm;font-weight:normal;text-align:center;
                  font-size:6pt">
										<b>(a)</b>
										<br/>Amount stated in <br/>functional currency of FDE or FB</div>
									<div class="styLNAmountBox" style="height:15mm;font-weight:normal;text-align:center;
                  font-size:6pt;">
										<b>(b)</b>
										<br/>Amount stated in <br/>functional currency <br/>of recipient</div>
								</div>
							</div>
							<div style="width:187mm;">
								<div style="float:left;">
									<div class="styLNLeftNumBoxSD" style="height:4mm;">1</div>
									<div class="styLNDesc" style="height:4mm;width:107mm;">
										<span style="float:left;">Remittances from the FDE or FB</span>
										<!--Dotted Lines -->
										<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
									</div>
								</div>
								<div style="float:right;">
									<div class="styLNRightNumBox" style="height:4mm">1</div>
									<div class="styLNAmountBox" style="text-align:center">
										<xsl:call-template name="PopulateAdditionalDataTableMessage">
											<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC1"/>
											<xsl:with-param name="ShortMessage" select="'true'"/>
										</xsl:call-template>
									</div>
									<div class="styLNAmountBox"/>
								</div>
							</div>
							<div style="width:187mm;">
								<div style="float:left;">
										<div class="styLNLeftNumBoxSD" style="height:4mm;">2</div>
										<div class="styLNDesc" style="height:4mm;width:105mm;">
											<span style="float:left;">Section 987 gain (loss) recognized by recipient </span>
											<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
										</div>
									</div>
								<div style="float:right;">
									<div class="styLNRightNumBox" style="height:4mm;">2</div>
									<div class="styLNAmountBox"/>
									<div class="styLNAmountBox"/>
								</div>
							</div>
							<div style="width:187mm;">
								<div style="float:left;">
										<div class="styLNLeftNumBoxSD" style="height:4mm;">3</div>
										<div class="styLNDesc" style="height:7mm;width:105mm;">
											Section 987 gain (loss) deferred under Regulations section 1.987-12T (attach statement)
											<span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>
										</div>
									</div>
								<div style="float:right;">
									<div class="styLNRightNumBox" style="height:3mm;background-color:lightgrey;"/>
									<div class="styLNAmountBox" style="height:3mm;background-color:lightgrey;"/>
									<div class="styLNAmountBox" style="height:3mm;background-color:lightgrey;"/><br/>
									<div class="styLNRightNumBox" style="height:4mm;">3</div>
									<div class="styLNAmountBox" style="height:4mm;"/>
									<div class="styLNAmountBox" style="height:4mm;"/>
								</div>
							</div>
							<div style="width:187mm;">
								<div style="float:left;">
									<div class="styLNLeftNumBox" style="height:4mm;"/>
									<div class="styLNDesc" style="height:4mm;width:147mm;"/>
								</div>
								<div style="float:right;">
									<div class="styLNAmountBox" style="width:16mm;text-align:center;font-weight:bold;">Yes</div>
									<div class="styLNAmountBox" style="width:16mm;text-align:center;font-weight:bold;">No</div>
								</div>
							</div>
							<!-- Begin c-1 line 4 -->
							<div style="width:187mm;">
								<div style="float:left;">
										<div class="styLNLeftNumBoxSD" style="height:4mm;">4</div>
										<div class="styLNDesc" style="height:4mm;width:147mm;">
											<span style="float:left;">Were all remittances from the FDE or FB treated as made to the direct owner? </span>
											<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
										</div>
									</div>
								<div style="float:right;">
									<div class="styLNAmountBox" style="width:16mm;text-align:center;font-weight:bold;"/>
									<div class="styLNAmountBox" style="width:16mm;text-align:center;font-weight:bold;"/>
								</div>
							</div>
							<div style="width:187mm;">
								<div style="float:left;">
										<div class="styLNLeftNumBoxSD" style="height:4mm;">5</div>
										<div class="styLNDesc" style="height:10mm;width:147mm;">
											Did the tax owner change its method of accounting for section 
											987 gain or loss with respect to remittances from the FDE or FB during the tax year?  If "Yes," 
											attach a statement describing the method used prior to the change and new method of accounting
											<!--Dotted Lines -->
											<span class="styDotLn" style="float:right;padding-right:1mm;">.............................</span>
										</div>
									</div>
								<div style="float:right;">
									<div class="styLNAmountBoxNBB" style="height:10mm;width:16mm;text-align:center;">
										<br/>
									</div>
									<div class="styLNAmountBoxNBB" style="height:10mm;width:16mm;text-align:center;">
										<br/>
									</div>
								</div>
							</div>
						</div>
					</xsl:if>
					<!-- Display all instances of Schedule C-1 if the print option is not "separated" -->
					<!-- If the print option is "separated", but there is only one instance, display that instance -->
					<xsl:if test="($Print != $Separated) or (count($Form8858Data/IRS8858ScheduleC1) = 1)">
						<xsl:for-each select="$Form8858Data/IRS8858ScheduleC1">
							<!--div class="styGenericDiv"-->
							<div class="styBB" style="width:187mm;float:none;clear:both;">
								<xsl:if test="position() = 1">
									<xsl:attribute name="style">width:187mm; border-top: 1px solid black;float:none;clear:both;
              </xsl:attribute>
								</xsl:if>
								<span class="styPartName" style="width: 25mm;">Schedule C-1</span>
								<span class="styPartDesc" style="width: 155mm;">Section 987 Gain or Loss Information</span>
							</div>
							<!-- The headers for the section c-1 -->
							<div class="styBB" style="width:187mm;float:none;clear:both;">
								<div style="width:187mm;">
									<div style="float:left;">
										<div class="styLNLeftNumBox" style="height:15mm;"/>
										<div class="styLNDesc" style="height:15mm;width:105mm;padding-top:4mm;">
											<b>Note:</b>  See the instructions if there are multiple recipients of remittances 
                    from the FDE or FB.</div>
									</div>
									<div style="float:right;">
										<div class="styLNRightNumBox" style="height:15mm;"/>
										<div class="styLNAmountBox" style="width:33mm;height:15mm;font-weight:normal;
                    text-align:center;font-size:6pt;padding-top:2mm">
											<b>(a)</b>
											<br/>Amount stated in <br/>functional currency of <br/>FDE or FB</div>
										<div class="styLNAmountBox" style="width:33mm;height:15mm;font-weight:normal;
                    text-align:center;font-size:6pt;padding-top:2mm">
											<b>(b)</b>
											<br/>Amount stated in <br/>functional currency <br/>of recipient</div>
									</div>
								</div>
								<div style="width:187mm;">
									<div style="float:left;">
										<div class="styLNLeftNumBoxSD" style="height:4mm;">1</div>
										<div class="styLNDesc" style="height:4mm;width:105mm;">
											<span style="float:left;">Remittances from the FDE or FB 
												<!-- puch pen  -->
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC1/
														RecipientRemittanceAmt"/>
												</xsl:call-template>
											</span>
											<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
										</div>
									</div>
									<div style="float:right;">
										<div class="styLNRightNumBox" style="height:4mm;">1</div>
										<div class="styLNAmountBox" style="width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="RemittanceAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBox" style="width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="RecipientRemittanceAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<div style="width:187mm;">
									<div style="float:left;">
										<div class="styLNLeftNumBoxSD" style="height:4mm;">2</div>
										<div class="styLNDesc" style="height:4mm;width:105mm;">
											<span style="float:left;">Section 987 gain (loss) recognized by recipient </span>
											<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
										</div>
									</div>
									<div style="float:right;">
										<div class="styLNRightNumBox" style="height:4mm;">2</div>
										<div class="styLNAmountBox" style="width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Section987GainOrLossAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBox" style="width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Section987GainOrLossRcpntAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<div style="width:187mm;">
									<div style="float:left;">
										<div class="styLNLeftNumBoxSD" style="height:4mm;">3</div>
										<div class="styLNDesc" style="height:7mm;width:105mm;">
											Section 987 gain (loss) deferred under Regulations section 1.987-12T (attach statement)
												<!-- push pen  -->
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="Sect987GainOrLossDefrdAmt"/>
												</xsl:call-template>
											<span class="styDotLn" style="float:right;padding-right:1mm;">.....................</span>
										</div>
									</div>
									<div style="float:right;">
										<div class="styLNRightNumBox" style="height:3mm;background-color:lightgrey;border-bottom-width: 0px;"/>
										<div class="styLNAmountBox" style="height:3mm;width:33mm;background-color:lightgrey;border-bottom-width:0px;"/>
										<div class="styLNAmountBox" style="height:3mm;width:33mm;background-color:lightgrey;border-bottom-width:0px;"/><br/>
										<div class="styLNRightNumBox" style="height:4mm;">3</div>
										<div class="styLNAmountBox" style="height:4mm;width:33mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Sect987GainOrLossDefrdAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBox" style="height:mm;width:33mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Sect987GainOrLossDefrdRcpntAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<div style="width:187mm;">
									<div style="float:left;">
										<div class="styLNLeftNumBox" style="height:4mm;"/>
										<div class="styLNDesc" style="height:4mm;width:146mm;"/>
									</div>
									<div style="float:right;">
										<div class="styLNAmountBox" style="width:16.5mm;text-align:center;font-weight:bold;">Yes</div>
										<div class="styLNAmountBox" style="width:16.5mm;text-align:center;font-weight:bold;">No</div>
									</div>
								</div>
								<!-- Begin c-1 line 4 -->
								<div style="width:187mm;">
									<div style="float:left;">
										<div class="styLNLeftNumBoxSD" style="height:4mm;">4</div>
										<div class="styLNDesc" style="height:4mm;width:146mm;">
											<span style="float:left;">Were all remittances from the FDE or FB treated as made to the direct owner? </span>
											<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
										</div>
									</div>
									<div style="float:right;">
										<div class="styLNAmountBox" style="width:16.5mm;text-align:center;">
											<xsl:call-template name="PopulateYesBoxText">
												<xsl:with-param name="TargetNode" select="RmtTreatedAsDirectOwnerInd"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBox" style="width:16.5mm;text-align:center;">
											<xsl:call-template name="PopulateNoBoxText">
												<xsl:with-param name="TargetNode" select="RmtTreatedAsDirectOwnerInd"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<!-- line 5  -->
								<div style="width:187mm;">
									<div style="float:left;">
										<div class="styLNLeftNumBoxSD" style="height:4mm;">5</div>
										<div class="styLNDesc" style="height:10mm;width:146mm;">
											Did the tax owner change its method of accounting for section 
											987 gain or loss with respect to remittances from the FDE or FB during the tax year?  If "Yes," 
											attach a statement describing the method used prior to the change and new method of accounting
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="TaxOwnerMethodOfAcctChangeInd"/>
											</xsl:call-template>  
											<!--Dotted Lines -->
											<span class="styDotLn" style="float:right;padding-right:1mm;">............................</span>
										</div>
									</div>
									<div style="float:right;">
										<div class="styLNAmountBoxNBB" style="height:10mm;width:16.5mm;text-align:center;padding-top:4mm;">
											<br/>
											<xsl:call-template name="PopulateYesBoxText">
												<xsl:with-param name="TargetNode" select="TaxOwnerMethodOfAcctChangeInd"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxNBB" style="height:10mm;width:16.5mm;text-align:center;padding-top:4mm;">
											<br/>
											<xsl:call-template name="PopulateNoBoxText">
												<xsl:with-param name="TargetNode" select="TaxOwnerMethodOfAcctChangeInd"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
							</div>
						</xsl:for-each>
					</xsl:if>
					<!-- Schedule F header -->
					<div class="styBB" style="width: 187mm;float:none;clear:none;">
						<span class="styPartName" style="width: 20mm;">Schedule F</span>
						<span class="styPartDesc" style="width: 160mm; font-weight: bold;">Balance Sheet</span>
					</div>
					<div class="styBB" style="width:187mm;float:none;clear:none;">
						<!-- Schedule F description -->
						<span style="font-size: 9pt;">
							<span class="styBoldText" style="height: 4mm; width: 21mm;vertical-align: top;">Important:  </span>
							<i>Report all amounts in U.S. dollars computed in functional currency and translated
								into U.S. dollars in accordance with U.S. GAAP. See instructions for an exception
								for FDEs or FBs that use DASTM.</i>
						</span>
					</div>
					<div class="styBB" style="width:187mm;float:none;clear:none;border-bottom-width:0px;">
						<!-- Schedule F data -->
						<div style="height: 11mm;">
							<span class="styLNLeftNumBox" style="height: 11mm;"/>
							<span style="width: 107mm; height: 11mm; float: left; clear: none; text-align: center; 
              font-size: 12; font-weight: bold;padding-top:3mm;">Assets</span>
							<span class="styLNAmountBoxNBB" style="text-align: center; height: 11mm;
              border-bottom-width:1px; float: right; clear: none;">
								<span class="styBoldText">(b)</span>
								<br/>End of annual<br/>accounting period</span>
							<span class="styLNAmountBoxNBB" style="text-align: center; height: 11mm;
              border-bottom-width:1px;  float: right; clear: none;">
								<span class="styBoldText">(a)</span>
								<br/>Beginning of annual accounting period</span>
							<span class="styLNRightNumBoxNBB" style="height: 11mm; border-bottom-width:1px;
               float: right; clear: none;"/>
						</div>
					</div>
					<!-- Schedule F line 1 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;height: 4.5mm;">1</div>
							<div class="styLNDesc" style="width: 107mm; height: 4.5mm;">
								<span style="float: left; clear: none;">Cash and other current assets</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
							</div>
						</div>
						<div style="float:right;clear:none;border-top-width:1px;">
							<div class="styLNRightNumBox" style="height: 4.5mm;">1</div>
							<div class="styLNAmountBox" style="height: 4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleF/
                  CashAndOtherCurrentAssets/BeginningAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="height: 4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleF/
                  CashAndOtherCurrentAssets/EndingAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule F line 2 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none">
							<div class="styLNLeftNumBoxSD" style="widht:8mm;height: 4.5mm;">2</div>
							<div class="styLNDesc" style="width: 107mm; height: 4.5mm;">
								<span style="float: left; clear: none;">Other assets</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.....................</span>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBox" style="height: 4.5mm;">2</div>
							<div class="styLNAmountBox" style="height: 4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleF/
                  OtherAssetsBalanceSheet/BeginningAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="height: 4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleF/
                  OtherAssetsBalanceSheet/EndingAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule F line 3 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none">
							<div class="styLNLeftNumBoxSD" style="widht:8mm;height: 4.5mm;">3</div>
							<div class="styLNDesc" style="width: 107mm; height: 4.5mm;">
								<span style="float: left; clear: none;">Total assets</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.....................</span>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBox" style="height: 4.5mm;">3</div>
							<div class="styLNAmountBox" style="height: 4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleF/
                  TotalAssetsBalanceSheet/BeginningAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="height: 4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleF/
                  TotalAssetsBalanceSheet/EndingAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div style="width: 187mm; height: 4.5mm;">
						<span class="styLNLeftNumBox"/>
						<span style="width: 106mm; height: 8mm; float: left; clear: none; text-align: center; 
            font-size: 12; font-weight: bold;padding-top:2mm;padding-bottom:2mm;">
            Liabilities and Owner's Equity</span>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBox" style="height: 8mm;background-color: lightgrey"/>
							<div class="styLNAmountBox" style="height: 8mm;background-color: lightgrey">
               </div>
							<div class="styLNAmountBox" style="height: 8mm;background-color: lightgrey">
               </div>
						</div>
					</div>
					<br/>
					<br/>
					<!-- Schedule F line 4 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none">
							<div class="styLNLeftNumBoxSD" style="widht:8mm;height: 4.5mm;">4</div>
							<div class="styLNDesc" style="width: 107mm; height: 4.5mm;">
								<span style="float: left; clear: none;">Liabilities</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBox" style="height: 4.5mm;">4</div>
							<div class="styLNAmountBox" style="height: 4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleF/
                  LiabilitiesBalanceSheet/BeginningAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="height: 4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleF/
                  LiabilitiesBalanceSheet/EndingAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule F line 5 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none">
							<div class="styLNLeftNumBoxSD" style="widht:8mm;height: 4.5mm;">5</div>
							<div class="styLNDesc" style="width: 107mm; height: 4.5mm;">
								<span style="float: left; clear: none;">Owner's equity</span>
								<!--Dotted Lines -->
								<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBox" style="height: 4.5mm;">5</div>
							<div class="styLNAmountBox" style="height: 4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleF/
                  OwnerEquityBalanceSheet/BeginningAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="height: 4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleF/
                  OwnerEquityBalanceSheet/EndingAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule F line 6 -->
					<div class="styBB" style="width:187mm;">
						<div style="float:left;clear:none">
							<div class="styLNLeftNumBoxSD" style="widht:8mm;height: 4.5mm;">6</div>
							<div class="styLNDesc" style="width: 107mm; height: 4.5mm;">
								<span style="float: left; clear: none;">Total liabilities and owner's equity </span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNRightNumBoxNBB" style="height: 4.5mm;">6</div>
							<div class="styLNAmountBoxNBB" style="height: 4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleF/
                  TotLiabOwnerEquityBalanceSheet/BeginningAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBoxNBB" style="height: 4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleF/
                  TotLiabOwnerEquityBalanceSheet/EndingAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule G data -->
					<div class="styBB" style="width:187mm;">
						<span class="styPartName" style="width: 20mm;">Schedule G</span>
						<span class="styPartDesc" style="width: 160mm; font-weight: bold;">Other Information</span>
					</div>
					<!-- Schedule G data -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="width: 146.5mm;"/>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:32mm;">
								<div style="width: 16mm; text-align: center; font-weight: bold; border-left: 1px solid black;
												 border-bottom: 1px solid black; height: 4.5mm;padding-left:0mm;float:left;clear:none; ">Yes
							    </div>
							    <div style="width: 16mm; text-align: center; font-weight: bold; border-left: 1px solid black;
												 border-bottom: 1px solid black; height: 4.5mm;float:right;">No
								</div>
							</div>
						</div>
					</div>
					<!-- Schedule G line 1-->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height: 4.5mm;">1</div>
							<div class="styLNDesc" style="width: 146.5mm; height: 4.5mm;">
								During the tax year, did the FDE or FB own an interest in any trust?
								<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:32mm;">
								<div style="width:16mm;text-align: center;border-left:1px solid black;padding-top:.5mm;
												 border-bottom:1px solid black;height:4.5mm;padding-left:0mm;float:left;clear:none;">
									<xsl:call-template name="PopulateYesBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/OwnInterestInTrustInd"/>
									</xsl:call-template>
								</div>
								<div style="width:16mm; text-align:center; border-left:1px solid black;padding-top:.5mm;
												 border-bottom:1px solid black;height:4.5mm;float:right;">
									<xsl:call-template name="PopulateNoBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/OwnInterestInTrustInd"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- Schedule G line 2 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:7.5mm;">2</div>
							<div class="styLNDesc" style="height:7.5mm;width: 146.5mm;">
                            During the tax year, did the FDE or FB own at least a 10% interest,
                             directly or indirectly, in any foreign <br/>partnership?
                                    <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/
											Owned10PercentIntFrgnPrtshpInd"/>
									</xsl:call-template>
								<!--Dotted Lines -->
								<span class="styDotLn" style="float:right;padding-right:1mm;">...............................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:32mm;">
								<div style="height:7.5mm;width:16mm;padding-top:3mm;text-align:center;border-left:1px solid black;
												 border-bottom:1px solid black;padding-left:0mm;float:left;clear:none; ">
									<xsl:call-template name="PopulateYesBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/
											Owned10PercentIntFrgnPrtshpInd"/>
									</xsl:call-template>
								</div>
								<div style="height:7.5mm;width:16mm;padding-top:3mm;text-align:center;border-left:1px solid black; 
												 border-bottom:1px solid black; float:right;">
									<xsl:call-template name="PopulateNoBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/
											Owned10PercentIntFrgnPrtshpInd"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- Schedule G line 3 -->
					<div style="width:187mm;height:7.5mm">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:7.5mm;">3</div>
							<div class="styLNDesc" style="width: 146.5mm; height:7.5mm;">
								<i>Answer the following question only if the FDE made its election to be treated as disregarded from its owner 
									during the tax year:</i> Did the tax owner claim a loss with respect to stock or debt of the FDE as a result of the 
									election?
								<!--Dotted Lines -->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:32mm;">
								<div style="height:7.5mm;width:16mm; text-align: center;border-left:1px solid black;border-bottom:1px solid black;
												padding-left:0mm;padding-top:3mm;float:left;clear:none;">
									<xsl:call-template name="PopulateYesBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/LossClaimToStockOrDebtInd"/>
									</xsl:call-template>
								</div>
								<div style="height:7.5mm;width:16mm;padding-top:3mm;text-align: center;border-left: 1px solid black; border-bottom: 1px solid black;float:right;">
									<xsl:call-template name="PopulateNoBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/LossClaimToStockOrDebtInd"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- Schedule G line 4 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:7.5mm;">4</div>
							<div class="styLNDesc" style="height:7.5mm;width: 146.5mm;">
								During the tax year, did the FDE or FB pay or accrue any foreign tax that was disqualified for credit under
								section 901(m)?
								<!--Dotted Lines -->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.................................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:32mm;">
								<div style="height:7.5mm;width:16mm;padding-top:3mm;text-align:center;border-left:1px solid black;
												 border-bottom:1px solid black;padding-left:0mm;float:left;clear:none; ">
									<xsl:call-template name="PopulateYesBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/
											FrgnTaxDisqualifiedSec901mInd"/>
									</xsl:call-template>
								</div>
								<div style="height:7.5mm;width:16mm;padding-top:3mm;text-align:center;border-left:1px solid black; 
												 border-bottom:1px solid black; float:right;">
									<xsl:call-template name="PopulateNoBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/
											FrgnTaxDisqualifiedSec901mInd"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- Schedule G line 5 -->
					<div class="styBB" style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:7.5mm;">5</div>
							<div class="styLNDesc" style="height:7.5mm;width: 146.5mm;">
								During the tax year, did the FDE or FB pay or accrue foreign taxes to which section 909 applies, or treat
								foreign taxes that were previously suspended under section 909 as no longer suspended?
								<!--Dotted Lines -->
								<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:32mm;">
								<div style="height:7.5mm;width:16mm;padding-top:3mm;text-align:center;border-left:1px solid black;
												 border-bottom:0px solid black;padding-left:0mm;float:left;clear:none; ">
									<xsl:call-template name="PopulateYesBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/
											ForeignTaxSection909Ind"/>
									</xsl:call-template>
								</div>
								<div style="height:7.5mm;width:16mm;padding-top:3mm;text-align:center;border-left:1px solid black; 
												 border-bottom:0px solid black; float:right;">
									<xsl:call-template name="PopulateNoBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/
											ForeignTaxSection909Ind"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- Page 2 Footer and Page 3 Header -->
					<div class="pageEnd" style="width:187mm;float:none;clear:both;">
						<div class="stySmallText" style="width:90mm;text-align:left;float;left; font-weight: bold;"/>
						<div class="stySmallText" style="width:41mm;text-align:right;clear:none;"/>
						<div class="stySmallText" style="width:36mm;text-align:right;float:right;clear:none;">
							Form <span class="styBoldText" style="font-size:8pt;">8858</span> (Rev. 12-2018)
						</div>
					</div>
					<p style="page-break-before:always"/>
					<div style="width:187mm;border-bottom:1px solid #000000;">
						<div class="stySmallText" style="width:90mm;text-align:left;float;left;">
							Form 8858 (Rev. 12-2018)
						</div>
						<div class="stySmallText" style="width:36mm;text-align:right;float:right;clear:none;">
							Page <span class="styBoldText" style="font-size:8pt;">3</span>
						</div>
					</div>
					<!-- Schedule G continued-->
					<div class="styBB" style="width:187mm;">
						<span class="styPartName" style="width: 20mm;">Schedule G</span>
						<span class="styPartDesc" style="width: 160mm; font-weight: bold;">Other Information <span style="font-weight: normal">
								<i>(continued)</i>
							</span>
						</span>
					</div>
					<!-- Schedule G data -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="width: 146.5mm;"/>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:32mm;">
								<div style="height:4.5mm;width:16mm; text-align: center; font-weight: bold; border-left: 1px solid black;
												 border-bottom: 1px solid black; padding-left:0mm;float:left;clear:none; ">Yes
							   </div>
								<div style="height: 4.5mm;width:16mm; text-align: center; font-weight: bold; border-left:1px solid black;
												 border-bottom: 1px solid black; float:right;">No
							   </div>
							</div>
						</div>
					</div>
					<!-- Schedule G line 6a-->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:10mm;padding-left:1mm;">6a</div>
							<div class="styLNDesc" style="height:10mm;width:146.5mm;">
								During the tax year, did the FDE or FB receive, or accrue the receipt of, any amounts defined as a
								base erosion payment under section 59A(d) or have a base erosion tax benefit under section 59A(c)(2) from
								a foreign person which is a related party of the taxpayer? See instructions. If “Yes,” complete lines 6b
								and 6c
								<!--Dotted Lines -->
								<span class="styDotLn" style="float: right; padding-right:1mm;">.......</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:32mm;">
								<div style="height:10mm;padding-top:5mm;width: 16mm;text-align:center;border-left:1px solid black; 
												 border-bottom:1px solid black;padding-left:0mm;float:left;clear:none; ">
									<xsl:call-template name="PopulateYesBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/BaseErosionPaymentBenefitInd"/>
									</xsl:call-template>
								</div>
								<div style="height:10mm;padding-top:5mm;width:16mm;text-align:center;border-left:1px solid black;border-bottom:
												1px solid black; float:right;">
									<xsl:call-template name="PopulateNoBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/BaseErosionPaymentBenefitInd"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- Schedule G line 6b -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftLtrBox" style="height:4mm;padding-left:3mm;">b</div>
							<div class="styLNDesc" style="height:4mm;width:146.5mm; ">Enter the total amount of the base erosion payments
								<span style="width:7px;"/> $ 
                                 <span style="width:25mm;border-bottom:1px solid black;text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/BaseErosionPaymentAmt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:32mm;">
								<div style="height:4mm;width:16mm;background-color:lightgrey;text-align:center;border-left:1px solid black;border-bottom:0px solid black; 
												 padding-left:0mm;float:left;clear:none;"/>
								<div style="height:4mm;width:16mm;background-color:lightgrey;text-align:center;border-left:1px solid black;border-bottom:0px solid black;
												 float:right;"/>
							</div>
						</div>
					</div>
					<!-- Schedule G line 6c -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftLtrBox" style="height:4mm;padding-left:3mm;">c</div>
							<div class="styLNDesc" style="height:4mm;width:146.5mm; ">Enter the total amount of the base erosion tax benefit
								<span style="width:3px;"/> $ 
                                 <span style="width:25mm;border-bottom:1px solid black;text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/BaseErosionTaxBenefitAmt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:32mm;">
								<div style="height:4mm;width:16mm;background-color:lightgrey;text-align:center;border-left:1px solid black;border-bottom:1px solid black; 
												 padding-left:0mm;float:left;clear:none;"/>
								<div style="height:4mm;width:16mm;background-color:lightgrey;text-align:center;border-left:1px solid black;border-bottom:1px solid black;
												 float:right;"/>
							</div>
						</div>
					</div>
					<!-- Schedule G line 7a-->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:10mm;padding-left:1mm;">7a</div>
							<div class="styLNDesc" style="height:10mm;width:146.5mm;">
								During the tax year, did the FDE or FB pay, or accrue the payment of, any amounts defined as a base erosion 
								payment under section 59A(d) or have a base erosion tax benefit under section 59A(c)(2) to a foreign person which 
								is a related party of the taxpayer? See instructions. If “Yes,” complete lines 7b and 7c
								<!--Dotted Lines -->
								<span class="styDotLn" style="float: right; padding-right:1mm;">.........</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:32mm;">
								<div style="height:10mm;padding-top:5mm;width: 16mm;text-align:center;border-left:1px solid black; 
												 border-bottom:1px solid black;padding-left:0mm;float:left;clear:none; ">
									<xsl:call-template name="PopulateYesBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/BaseErosionPaymentBenefitPdInd"/>
									</xsl:call-template>
								</div>
								<div style="height:10mm;padding-top:5mm;width:16mm;text-align:center;border-left:1px solid black;border-bottom:
												1px solid black; float:right;">
									<xsl:call-template name="PopulateNoBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/BaseErosionPaymentBenefitPdInd"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- Schedule G line 7b -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftLtrBox" style="height:4mm;padding-left:3mm;">b</div>
							<div class="styLNDesc" style="height:4mm;width:146.5mm; ">Enter the total amount of the base erosion payments
								<span style="width:7px;"/> $ 
                                 <span style="width:25mm;border-bottom:1px solid black;text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/BaseErosionPaymentPdAmt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:32mm;">
								<div style="height:4mm;width:16mm;background-color:lightgrey;text-align:center;border-left:1px solid black;border-bottom:0px solid black; 
												 padding-left:0mm;float:left;clear:none;"/>
								<div style="height:4mm;width:16mm;background-color:lightgrey;text-align:center;border-left:1px solid black;border-bottom:0px solid black;
												 float:right;"/>
							</div>
						</div>
					</div>
					<!-- Schedule G line 7c -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftLtrBox" style="height:4mm;padding-left:3mm;">c</div>
							<div class="styLNDesc" style="height:4mm;width:146.5mm; ">Enter the total amount of the base erosion tax benefit
								<span style="width:3px;"/> $ 
                                 <span style="width:25mm;border-bottom:1px solid black;text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/BaseErosionTaxBenefitPdAmt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:32mm;">
								<div style="height:4mm;width:16mm;background-color:lightgrey;text-align:center;border-left:1px solid black;border-bottom:1px solid black; 
												 padding-left:0mm;float:left;clear:none;"/>
								<div style="height:4mm;width:16mm;background-color:lightgrey;text-align:center;border-left:1px solid black;border-bottom:1px solid black;
												 float:right;"/>
							</div>
						</div>
					</div>
					<!-- Schedule G line 8 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:4.5mm;">8</div>
							<div class="styLNDesc" style="width: 146.5mm; height:4.5mm;">
								Is the FDE or FB a qualified business unit as defined in section 989(a)?
								<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:32mm;">
								<div style="height:4.5mm;width:16mm;text-align:center;border-left:1px solid black;border-bottom:1px solid black; 
												 padding-left:0mm;padding-top:.5mm;float:left;clear:none;">
									<xsl:call-template name="PopulateYesBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/QualifiedBusinessUnitInd"/>
									</xsl:call-template>
								</div>
								<div style="height:4.5mm;width:16mm;text-align:center;border-left:1px solid black;border-bottom:1px solid black;
												 float:right;padding-top:.5mm;">
									<xsl:call-template name="PopulateNoBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/QualifiedBusinessUnitInd"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- Schedule G line 9 -->
					<div  style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:10mm;">9</div>
							<div class="styLNDesc" style="height:10mm;width:146.5mm; ">
								<i>Answer the following question only if the tax owner of the FDE or FB is a CFC:</i> Were there any
									 intracompany transactions between the FDE or FB and the CFC or any other branch of the CFC during the
									 tax year, in which the FDE or FB acted as a manufacturing, selling, or purchasing branch?
								<!--Dotted Lines -->
								<span class="styDotLn" style="float: right; padding-right:1mm;">...............</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:32mm;">
								<div style="height:10mm;width:16mm;padding-top:6mm;text-align:center;border-left:1px solid black; 
												 border-bottom:1px solid black;padding-left:0mm;float:left;clear:none;">
									<xsl:call-template name="PopulateYesBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/MfrSellingPurchasingBranchInd"/>
									</xsl:call-template>
								</div>
								<div style="height:10mm;width:16mm;padding-top:6mm;text-align:center;border-left:1px solid black;
												 border-bottom:1px solid black; float:right;">
									<xsl:call-template name="PopulateNoBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/MfrSellingPurchasingBranchInd"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- Schedule G line 10a-->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="height:14mm;">10a</div>
							<div class="styLNDesc" style="height:14mm;width:146.5mm;">
								Answer the remaining questions in Schedule G only if the tax owner of the FB or the interest in the FDE
								is a U.S. corporation: If the FB or the interest in the FDE is a separate unit under Regulations section
								1.1503(d)-1(b)(4), and is not part of a combined separate unit under Regulations section 1.1503(d)-1(b)(4)(ii),
								does the separate unit have a dual consolidated loss as defined in Regulations section 1.1503(d)-1(b)(5)(ii)?
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/SeparateUnitDefinedInRegInd"/>
									</xsl:call-template>
								<!--Dotted Lines -->
								<span class="styDotLn" style="float: right; padding-right:1mm;">..........</span>								
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:32mm;">
								<div style="height:14mm;padding-top:9mm;width:16mm;text-align:center;border-left:1px solid black; 
												 border-bottom:1px solid black;padding-left:0mm;float:left;clear:none; ">
									<xsl:call-template name="PopulateYesBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/SeparateUnitDefinedInRegInd"/>
									</xsl:call-template>
								</div>
								<div style="height:14mm;padding-top:9mm;width:16mm;text-align:center;border-left:1px solid black;border-bottom:
												1px solid black; float:right;">
									<xsl:call-template name="PopulateNoBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/SeparateUnitDefinedInRegInd"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- Schedule G line 10b -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftLtrBoxDD" style="height:4.5mm;padding-left:3mm;">b</div>
							<div class="styLNDesc" style="height:4mm;width:146.5mm; ">If “Yes,” enter the amount of the dual consolidated loss
								<!--Dotted Lines -->
								<span class="styDotLn" style="float:none;clear:none;padding-right:1mm;">..........</span>	
								<img src="{$ImagePath}/8858_Bullet_Sm.gif" alt="Bullet"/>
								<span style="width:7px;"/> $ 
                                 <span style="width:27mm;border-bottom:1px solid black;text-align:right">
									(<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/DualConsolidatedLossAmt"/>
									</xsl:call-template>)
								</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:32mm;">
								<div style="height:4.5mm;width:16mm;background-color:lightgrey;text-align:center;border-left:1px solid black;border-bottom:1px solid black; 
												 padding-left:0mm;float:left;clear:none;"/>
								<div style="height:4.5mm;width:16mm;background-color:lightgrey;text-align:center;border-left:1px solid black;border-bottom:1px solid black;
												 float:right;"/>
							</div>
						</div>
					</div>
					<!-- Schedule G line 11a-->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="height:10mm;">11a</div>
							<div class="styLNDesc" style="height:10mm;width:146.5mm;">
								If the FB or the interest in the FDE is a separate unit and part of a combined separate unit under
								Regulations section 1.1503(d)-1(b)(4)(ii), does the combined separate unit have a dual consolidated loss as
								defined in Regulations section 1.1503(d)-1(b)(5)(ii)? If “Yes,” complete lines 11b and 11c
								<!--Dotted Lines -->
								<span class="styDotLn" style="float: right; padding-right:1mm;">...............</span>								
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:32mm;">
								<div style="height:10mm;padding-top:5mm;width:16mm;text-align:center;border-left:1px solid black; 
												 border-bottom:1px solid black;padding-left:0mm;float:left;clear:none; ">
									<xsl:call-template name="PopulateYesBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/SepCombSepDualCnsldtLossInd"/>
									</xsl:call-template>
								</div>
								<div style="height:10mm;padding-top:5mm;width:16mm;text-align:center;border-left:1px solid black;border-bottom:
												1px solid black; float:right;">
									<xsl:call-template name="PopulateNoBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/SepCombSepDualCnsldtLossInd"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- Schedule G line 11b -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftLtrBoxDD" style="height:4.5mm;padding-left:3mm;">b</div>
							<div class="styLNDesc" style="height:4mm;width:146.5mm; ">Enter the amount of the dual consolidated loss for the combined separate unit
								<!--Dotted Lines -->
								<span class="styDotLn" style="float:none;clear:none;padding-right:1mm;">...</span>	
								<img src="{$ImagePath}/8858_Bullet_Sm.gif" alt="Bullet"/>
								<span style="width:7px;"/> $ 
                                 <span style="width:27mm;border-bottom:1px solid black;text-align:right">
									(<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/SepCombSepDualCnsldtLossAmt"/>
									</xsl:call-template>)
								</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:32mm;">
								<div style="height:4.5mm;width:16mm;background-color:lightgrey;text-align:center;border-left:1px solid black;border-bottom:0px solid black; 
												 padding-left:0mm;float:left;clear:none;"/>
								<div style="height:4.5mm;width:16mm;background-color:lightgrey;text-align:center;border-left:1px solid black;border-bottom:0px solid black;
												 float:right;"/>
							</div>
						</div>
					</div>
					<!-- Schedule G line 11c -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftLtrBoxDD" style="height:8mm;padding-left:3mm;">c</div>
							<div class="styLNDesc" style="height:4mm;width:146.5mm; ">
								Enter the net income (loss) attributed to the individual FB or the individual interest in the FDE as 
								determined under Regulations section 1.1503(d)-5(c)(4)(ii)(A)
								<!--Dotted Lines -->
								<span class="styDotLn" style="float:none;clear:none;padding-right:0mm;">..............</span>	
								<img src="{$ImagePath}/8858_Bullet_Sm.gif" alt="Bullet"/>
								<span style="width:7px;"/> $ 
                                 <span style="width:25mm;border-bottom:1px solid black;text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/NetIncomeLossAmt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:32mm;">
								<div style="height:8mm;width:16mm;background-color:lightgrey;text-align:center;border-left:1px solid black;border-bottom:1px solid black; 
												 padding-left:0mm;float:left;clear:none;"/>
								<div style="height:8mm;width:16mm;background-color:lightgrey;text-align:center;border-left:1px solid black;border-bottom:1px solid black;
												 float:right;"/>
							</div>
						</div>
					</div>

					<!-- Schedule G line 12a-->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="height:7mm;">12a</div>
							<div class="styLNDesc" style="height:7mm;width:146.5mm;">
								Was any portion of the dual consolidated loss in line 10b or 11b taken into account in computing U.S.
								taxable income for the year? If “Yes,” go to line 12b. If “No,” go to line 13
								<!--Dotted Lines -->
								<span class="styDotLn" style="float: right; padding-right:1mm;">..................</span>								
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:32mm;">
								<div style="height:7mm;padding-top:3mm;width:16mm;text-align:center;border-left:1px solid black; 
												 border-bottom:1px solid black;padding-left:0mm;float:left;clear:none; ">
									<xsl:call-template name="PopulateYesBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/DualCnsldtLossTaxableIncomeInd"/>
									</xsl:call-template>
								</div>
								<div style="height:7mm;padding-top:3mm;width:16mm;text-align:center;border-left:1px solid black;border-bottom:
												1px solid black; float:right;">
									<xsl:call-template name="PopulateNoBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/DualCnsldtLossTaxableIncomeInd"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- Schedule G line 12b-->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftLtrBoxDD" style="height:7mm;padding-left:3mm;">b</div>
							<div class="styLNDesc" style="height:7mm;width:146.5mm;">
								Was this a permitted domestic use of the dual consolidated loss under Regulations section 1.1503(d)-6? If
								“Yes,” see the instructions and go to line 12c. If “No,” go to line 12d
								<!--Dotted Lines -->
								<span class="styDotLn" style="float: right; padding-right:1mm;">..................</span>								
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:32mm;">
								<div style="height:7mm;padding-top:3mm;width:16mm;text-align:center;border-left:1px solid black; 
												 border-bottom:1px solid black;padding-left:0mm;float:left;clear:none; ">
									<xsl:call-template name="PopulateYesBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/PermittedDomDualCnsldtLossInd"/>
									</xsl:call-template>
								</div>
								<div style="height:7mm;padding-top:3mm;width:16mm;text-align:center;border-left:1px solid black;border-bottom:
												1px solid black; float:right;">
									<xsl:call-template name="PopulateNoBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/PermittedDomDualCnsldtLossInd"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- Schedule G line 12c-->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftLtrBoxDD" style="height:7mm;padding-left:3mm;">c</div>
							<div class="styLNDesc" style="height:7mm;width:146.5mm;">
								If “Yes,” is the documentation that is required for the permitted domestic use under Regulations section
								1.1503(d)-6 attached to the return? After answering this question, go to line 13a
								<!--Dotted Lines -->
								<span class="styDotLn" style="float: right; padding-right:1mm;">..............</span>								
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:32mm;">
								<div style="height:7mm;padding-top:3mm;width:16mm;text-align:center;border-left:1px solid black; 
												 border-bottom:1px solid black;padding-left:0mm;float:left;clear:none; ">
									<xsl:call-template name="PopulateYesBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/PrmtDomDualCnsldtLossDcmntnInd"/>
									</xsl:call-template>
								</div>
								<div style="height:7mm;padding-top:3mm;width:16mm;text-align:center;border-left:1px solid black;border-bottom:
												1px solid black; float:right;">
									<xsl:call-template name="PopulateNoBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/PrmtDomDualCnsldtLossDcmntnInd"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- Schedule G line 12d-->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftLtrBoxDD" style="height:7mm;padding-left:3mm;">d</div>
							<div class="styLNDesc" style="height:7mm;width:146.5mm;">
								If this was not a permitted domestic use, was the dual consolidated loss used to compute consolidated
								taxable income as provided under Regulations section 1.1503(d)-4?  If "Yes," go to line 12e.	
								<!--Dotted Lines -->
								<span class="styDotLn" style="float: right; padding-right:1mm;">..........</span>								
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:32mm;">
								<div style="height:7mm;padding-top:3mm;width:16mm;text-align:center;border-left:1px solid black; 
												 border-bottom:1px solid black;padding-left:0mm;float:left;clear:none; ">
									<xsl:call-template name="PopulateYesBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/CmptDualCnsldtLossTxblIncmInd"/>
									</xsl:call-template>
								</div>
								<div style="height:7mm;padding-top:3mm;width:16mm;text-align:center;border-left:1px solid black;border-bottom:
												1px solid black; float:right;">
									<xsl:call-template name="PopulateNoBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/CmptDualCnsldtLossTxblIncmInd"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- Schedule G line 12e -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftLtrBoxDD" style="height:8mm;padding-left:3mm;">e</div>
							<div class="styLNDesc" style="height:4mm;width:146.5mm; ">
								Enter the separate unit’s contribution to the cumulative consolidated taxable income
								(“cumulative register”) as of the beginning of the tax year
								<!--Dotted Lines -->
								<!--<span class="styDotLn" style="float:none;clear:none;padding-right:0mm;">..............</span>	-->
								<img src="{$ImagePath}/8858_Bullet_Sm.gif" alt="Bullet"/>
								<span style="width:7px;"/> $ 
                                 <span style="width:25mm;border-bottom:1px solid black;text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/CumulativeRegisterAmt"/>
									</xsl:call-template>
								</span> <span style="width:7px;"/>See instructions.
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:32mm;">
								<div style="height:8mm;width:16mm;background-color:lightgrey;text-align:center;border-left:1px solid black;border-bottom:1px solid black; 
												 padding-left:0mm;float:left;clear:none;"/>
								<div style="height:8mm;width:16mm;background-color:lightgrey;text-align:center;border-left:1px solid black;border-bottom:1px solid black;
												 float:right;"/>
							</div>
						</div>
					</div>
					<!-- Schedule G line 13a-->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="height:10mm;">13a</div>
							<div class="styLNDesc" style="height:10mm;width:146.5mm;">
								During the tax year, did any triggering event(s) occur under Regulations section 1.1503(d)-6(e) requiring
								recapture of any dual consolidated loss(es) attributable to the FB or interest in the FDE, individually or as
								part of a combined separate unit, in any prior tax years?
								<!--Dotted Lines -->
								<span class="styDotLn" style="float: right; padding-right:1mm;">........................</span>								
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:32mm;">
								<div style="height:10mm;padding-top:5mm;width:16mm;text-align:center;border-left:1px solid black; 
												 border-bottom:1px solid black;padding-left:0mm;float:left;clear:none; ">
									<xsl:call-template name="PopulateYesBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/TriggeringEventRecaptureInd"/>
									</xsl:call-template>
								</div>
								<div style="height:10mm;padding-top:5mm;width:16mm;text-align:center;border-left:1px solid black;border-bottom:
												1px solid black; float:right;">
									<xsl:call-template name="PopulateNoBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/TriggeringEventRecaptureInd"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- Schedule G line 13b -->
					<div class="styBB" style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftLtrBoxDD" style="height:4.3mm;padding-left:3mm;">b</div>
							<div class="styLNDesc" style="height:4.3mm;width:146.5mm; ">
								If “Yes,” enter the total amount of recapture
								<!--Dotted Lines -->
								<span class="styDotLn" style="float:none;clear:none;padding-right:0mm;">........</span>	
								<img src="{$ImagePath}/8858_Bullet_Sm.gif" alt="Bullet"/>
								<span style="width:7px;"/> $ 
                                 <span style="width:25mm;border-bottom:1px solid black;text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleG/TriggeringEventRecaptureAmt"/>
									</xsl:call-template>
								</span> <span style="width:7px;"/>See instructions.
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:32mm;">
								<div style="height:4.3mm;width:16mm;background-color:lightgrey;text-align:center;border-left:1px solid black;border-bottom:0px solid black; 
												 padding-left:0mm;float:left;clear:none;"/>
								<div style="height:4.3mm;width:16mm;background-color:lightgrey;text-align:center;border-left:1px solid black;border-bottom:0px solid black;
												 float:right;"/>
							</div>
						</div>
					</div>
					<!-- Page 3 Footer and Page 4 Header -->
					<div class="pageEnd" style="width:187mm;float:none;clear:both;">
						<div class="stySmallText" style="width:90mm;text-align:left;float;left; font-weight: bold;"/>
						<div class="stySmallText" style="width:41mm;text-align:right;clear:none;"/>
 						<div class="stySmallText" style="width:36mm;text-align:right;float:right;clear:none;">
							Form <span class="styBoldText" style="font-size:8pt;">8858</span> (Rev. 12-2018)
						</div>
					</div>
					<p style="page-break-before:always"/>
					<div style="width:187mm;border-bottom:1px solid #000000;">
						<div class="stySmallText" style="width:90mm;text-align:left;float;left;">
							Form 8858 (Rev. 12-2018)
						</div>
						<div class="stySmallText" style="width:36mm;text-align:right;float:right;clear:none;">
							Page <span class="styBoldText" style="font-size:8pt;">4</span>
						</div>
					</div>
					<!-- Schedule H header -->
					<!-- Filler for Schedule H-->
					<!-- Display the data container only if there is no data for Schedule H. -->
					<!-- If the print parameter is "separated" and there is more than one instance of Schedule H, -->
					<!-- then display a message directing the user to the additional data table -->
					<xsl:if test="not($Form8858Data/IRS8858ScheduleH) or 
                         (($Print = $Separated) and (count($Form8858Data/IRS8858ScheduleH) &gt; 1))">
						<div class="styBB" style="width:187mm;float:none;clear:both;">
							<span class="styPartName" style="width: 20mm;">Schedule H</span>
							<span class="styPartDesc" style="width: 160mm;">Current Earnings and Profits or 
              Taxable Income <span class="styNormalText"> (see instructions)</span>
							</span>
						</div>
						<div class="styBB" style="width:187mm;">
							<!-- Schedule H description -->
							<span style="font-size: 9pt;">
								<span class="styBoldText" style="height: 4mm; width: 21mm; font-size: 9pt;vertical-align: top;">Important:  </span>
								<i>Enter the amounts on lines 1 through 6 in functional currency.</i>
							</span>
						</div>
						<div class="styBB" style="width:187mm;">
							<!-- Schedule H line 1 -->
							<div style="width:187mm;">
								<div style="float:left;clear:none;">
									<div class="styLNLeftNumBox" style="width:8mm;">1</div>
									<div class="styLNDesc" style="width:139mm;padding-top:.5mm;padding-bottom:.5mm">
										<span style="float:left;">Current year net income (loss) per foreign books of account </span>
										<span class="styDotLn" style="float: right; padding-right:1mm;">...............</span>
									</div>
								</div>
								<div style="float:right;clear;none;">
									<div style="width:40mm;">
										<div class="styLNRightNumBox">1</div>
										<div class="styLNAmountBox">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleH"/>
												<xsl:with-param name="ShortMessage" select="'true'"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
							</div>
							<!-- Line 2 -->
							<div style="width:187mm;">
								<div style="float:left;">
									<div class="styLNLeftNumBox">2</div>
									<div class="styLNDesc" style="width:139mm;padding-top:.5mm;padding-bottom:.5mm;">
										<span style="float:left;">Total net additions</span>
										<!--Dotted Lines -->
										<span class="styDotLn" style="float: right; padding-right:1mm;">............................</span>
									</div>
								</div>
								<div style="float:right;">
									<div class="styLNRightNumBox">2</div>
									<div class="styLNAmountBox"/>
								</div>
							</div>
							<!-- Line 3 -->
							<div style="width:187mm;">
								<div style="float:left;">
									<div class="styLNLeftNumBox">3</div>
									<div class="styLNDesc" style="width:139mm;padding-top:.5mm;padding-bottom:.5mm;">
										<span style="float:left;">Total net substractions</span>
										<span class="styDotLn" style="float: right; padding-right:1mm;">...........................</span>
									</div>
								</div>
								<div style="float:right;">
									<div class="styLNRightNumBox">3</div>
									<div class="styLNAmountBox"/>
								</div>
							</div>
							<!-- Line 4 -->
							<div style="width:187mm;">
								<div style="float:left;">
									<div class="styLNLeftNumBox">4</div>
									<div class="styLNDesc" style="width:139mm;padding-top:.5mm;padding-bottom:.5mm;">
										<span style="float:left;">Current earnings and profits 
                    (or taxable income &#8211; see instructions) (line 1 plus line 2 minus line 3) </span>
										<span class="styDotLn" style="float: right; padding-right:1mm;">...</span>
									</div>
								</div>
								<div style="float:right;">
									<div class="styLNRightNumBox">4</div>
									<div class="styLNAmountBox"/>
								</div>
							</div>
							<!-- Line 5 -->
							<div style="width:187mm;">
								<div style="float:left;">
									<div class="styLNLeftNumBox">5</div>
									<div class="styLNDesc" style="width:139mm;padding-top:.5mm;padding-bottom:.5mm;">
										<span style="float:left;">DASTM gain (loss) (if applicable) </span>
										<!--Dotted Lines -->
										<span class="styDotLn" style="float: right; padding-right:1mm;">.......................</span>
									</div>
								</div>
								<div style="float:right;">
									<div class="styLNRightNumBox">5</div>
									<div class="styLNAmountBox"/>
								</div>
							</div>
							<!-- Line 6 -->
							<div style="width:187mm;">
								<div style="float:left;">
									<div class="styLNLeftNumBox" style="height:4mm;">6</div>
									<div class="styLNDesc" style="width:139mm;height:4mm;padding-top:.5mm;
                  padding-bottom:.5mm;">
										<span style="float:left;">Combine lines 4 and 5</span>
										<!--Dotted Lines -->
										<span class="styDotLn" style="float: right; padding-right:1mm;">............................</span>
									</div>
								</div>
								<div style="float:right;">
									<div class="styLNRightNumBox">6</div>
									<div class="styLNAmountBox"/>
								</div>
							</div>
							<!-- Line 7 -->
							<div style="width:187mm;">
								<div style="float:left;">
									<div class="styLNLeftNumBox" style="height:6.5mm;">7</div>
									<div class="styLNDesc" style="height:6.5mm;">
										Current earnings and profits (or taxable income) in U.S. dollars (line 6 translated at the average 
										exchange rate determined under section 989(b) and the related regulations (see instructions)) 
										<!--Dotted Lines -->
										<span class="styDotLn" style="float: right; padding-right:1mm;">.......</span>
									</div>
								</div>
								<div style="float:right;">
									<div class="styLNRightNumBox" style="height:6.5mm;padding-top:2mm;">7</div>
									<div class="styLNAmountBox" style="height:6.5mm;width:32mm;padding-top:2mm;"/>
								</div>
							</div>	
							<!-- Line 8 -->
							<div style="width:187mm;">
								<div class="styLNLeftNumBox" style="height:4mm;">8</div>
								<div class="styLNDesc" style="height:4mm;width:50mm;float:left;">
									Enter exchange rate used for line 7 <span style="width:2mm"/>
									    <img src="{$ImagePath}/8858_Bullet_Sm.gif" alt="Bullet"/>
								</div>
								<span class="styUnderlineAmount" style="height:4mm;width:36mm;float:none;clear:none"/>
								<div style="float:right;">
									<div class="styLNRightNumBox" style="height:4.6mm;background-color:lightgrey;border-bottom-width:0px"/>
									<div class="styLNAmountBox" style="height:4.6mm;width:32mm;background-color:lightgrey;border-bottom-width:0px;border-left-width:0px"/>
								</div>
							</div>
						</div>
					</xsl:if>
					<!-- Display all instances of Schedule H data if the print option is not "separated" -->
					<!-- If the print option is "separated", but there is only one Schedule H, display that instance -->
					<xsl:if test="($Print != $Separated) or (count($Form8858Data/IRS8858ScheduleH) = 1)">
						<xsl:for-each select="$Form8858Data/IRS8858ScheduleH">
							<div class="styBB" style="width:187mm;float:none;clear:both;">
								<span class="styPartName" style="width: 20mm;">Schedule H</span>
								<span class="styPartDesc" style="width: 160mm;">
                Current Earnings and Profits or Taxable Income<span class="styNormalText" style="padding-left:2mm;"> (see instructions)</span>
								</span>
							</div>
							<div class="styBB" style="width:187mm;float:none;clear:both;">
								<!-- Schedule H description -->
								<span style="font-size: 9pt;">
									<span class="styBoldText" style="height: 4mm; width: 21mm;vertical-align: top;">Important:  </span>
									<i>Enter the amounts on lines 1 through 6 in functional currency.</i>
								</span>	
							</div>
							<div class="styBB" style="width:187mm;float:none;clear:both;">
								<!-- Schedule H line 1 -->
								<div style="width:187mm;">
									<div style="float:left;">
										<div class="styLNLeftNumBox">1</div>
										<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm">
											<span style="float:left;">Current year net income (loss) per foreign books of account </span>
											<!--Dotted Lines -->
											<span class="styDotLn" style="float: right; padding-right:1mm;">...............</span>
										</div>
									</div>
									<div style="float:right;">
										<div class="styLNRightNumBox">1</div>
										<div class="styLNAmountBox" style="width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignCYNetIncomePerBooksAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<!-- Line 2 -->
								<div style="width:187mm;">
									<div style="float:left;">
										<div class="styLNLeftNumBox">2</div>
										<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
											<span style="float:left;"> Total net additions   
											    <xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="TotalNetAdditonsAmt"/>
												</xsl:call-template>
											</span>
											<!--Dotted Lines -->
											<span class="styDotLn" style="float: right; padding-right:1mm;">...........................</span>
										</div>
									</div>
									<div style="float:right;">
										<div class="styLNRightNumBox" style="height:4.5mm;">2</div>
										<div class="styLNAmountBox" style="width:33mm;height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalNetAdditonsAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<!-- Line 3 -->
								<div style="width:187mm;">
									<div style="float:left;">
										<div class="styLNLeftNumBox">3</div>
										<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
											<span style="float:left;">Total net subtractions   
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="TotalNetSubtractionsAmt"/>
												</xsl:call-template>
											</span>
											<span class="styDotLn" style="float: right; padding-right:1mm;">..........................</span>
										</div>
									</div>
									<div style="float:right;">
										<div class="styLNRightNumBox">3</div>
										<div class="styLNAmountBox" style="width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalNetSubtractionsAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<!-- Line 4 -->
								<div style="width:187mm;">
									<div style="float:left;">
										<div class="styLNLeftNumBox">4</div>
										<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
											<span style="float:left;">Current earnings and profits (or taxable incomesee instructions)
																			   (line 1 plus line 2 minus line 3) </span>
											<!--Dotted Lines -->
											<span class="styDotLn" style="float: right; padding-right:1mm;">...</span>
										</div>
									</div>
									<div style="float:right;">
										<div class="styLNRightNumBox">4</div>
										<div class="styLNAmountBox" style="width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CurrentEarningsAndProfitsAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<!-- Line 5 -->
								<div style="width:187mm;">
									<div style="float:left;">
										<div class="styLNLeftNumBox">5</div>
										<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
											<span style="float:left;">DASTM gain (loss) (if applicable) </span>
											<!--Dotted Lines -->
											<span class="styDotLn" style="float: right; padding-right:1mm;">........................</span>
										</div>
									</div>
									<div style="float:right;">
										<div class="styLNRightNumBox">5</div>
										<div class="styLNAmountBox" style="width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DASTMGainOrLossAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<!-- Line 6 -->
								<div style="width:187mm;">
									<div style="float:left;">
										<div class="styLNLeftNumBox">6</div>
										<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
											<span style="float:left;">Combine lines 4 and 5 </span>
											<!--Dotted Lines -->
											<span class="styDotLn" style="float: right; padding-right:1mm;">...........................</span>
										</div>
									</div>
									<div style="float:right;">
										<div class="styLNRightNumBox">6</div>
										<div class="styLNAmountBox" style="width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="EarningAndPrftPlusDASTMGainAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<!-- Line 7 -->
								<div style="width:187mm;">
									<div style="float:left;">
										<div class="styLNLeftNumBox" style="height:6.5mm;">7</div>
										<div class="styLNDesc" style="height:6.5mm;">
											Current earnings and profits (or taxable income) in U.S. dollars (line 6 translated at the average 
											exchange rate determined under section 989(b) and the related regulations (see instructions)) 
											<!--Dotted Lines -->
											<span class="styDotLn" style="float: right; padding-right:1mm;">.......</span>
										</div>
									</div>
									<div style="float:right;">
										<div class="styLNRightNumBox" style="height:6.5mm;padding-top:2mm;">7</div>
										<div class="styLNAmountBox" style="height:6.5mm;width:33mm;padding-top:2mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CurrEarnAndPrftInUSDollarsAmt"/>
											</xsl:call-template>
										</div>
									</div>	
								</div>
								<!-- Line 8 -->
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style="height:4mm;">8</div>
									<div class="styLNDesc" style="height:4mm;width:50mm;float:left;">
										Enter exchange rate used for line 7<span style="width:2mm"/>
											<img src="{$ImagePath}/8858_Bullet_Sm.gif" alt="Bullet"/>
									</div>
									<span class="styUnderlineAmount" style="height:4mm;width:36mm;float:none;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="ExchangeRt"/>
										</xsl:call-template>
									</span>
									<div style="float:right;">
										<div class="styLNRightNumBox" style="height:4.6mm;background-color:lightgrey;border-bottom-width:0px"/>
										<div class="styLNAmountBox" style="height:4.6mm;width:33mm;background-color:lightgrey;border-bottom-width:0px;border-left-width:0px"/>
									</div>
								</div>
							</div>
						</xsl:for-each>
					</xsl:if>
					<div class="styBB" style="width:187mm;float:none;clear:both;">
						<span class="styPartName" style="width: 20mm;">Schedule I</span>
						<span class="styPartDesc" style="width: 160mm;">Transferred Loss Amount 
							<span class="styNormalText"> (see instructions)</span>
						</span>
					</div>
					<div class="styBB" style="width:187mm;">
						<!-- Schedule I description -->
						<span style="font-size: 9pt;">
							<span class="styBoldText" style="height: 4mm; width: 21mm; font-size: 9pt;vertical-align: top;">Important:   </span>
							<i>See instructions for who has to complete this section.</i>
						</span>
					</div>
					<!-- Schedule I data -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="width: 146.5mm;"/>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:32mm;">
								<div style="width: 16mm; text-align: center; font-weight: bold; border-left: 1px solid black;
												 border-bottom: 1px solid black; height: 4.5mm;padding-left:0mm;float:left;clear:none; ">Yes
							    </div>
							    <div style="width: 16mm; text-align: center; font-weight: bold; border-left: 1px solid black;
												 border-bottom: 1px solid black; height: 4.5mm;float:right;">No
								</div>
							</div>
						</div>
					</div>
					<!-- Schedule I line 1-->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:7.5mm;">1</div>
							<div class="styLNDesc" style="height:7.5mm;width:146.5mm;">
								Were any assets of an FB (including an FB that is an FDE) transferred to a foreign corporation? If “No,”
								stop here. If “Yes,” go to line 2
								<span class="styDotLn" style="float:right;padding-right:1mm;">..............................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:32mm;">
								<div style="height:7.5mm;width:16mm;text-align: center;border-left:1px solid black;padding-top:4mm;
												 border-bottom:1px solid black;padding-left:0mm;float:left;clear:none;">
									<xsl:call-template name="PopulateYesBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleI/ForeignBranchAssetTransferInd"/>
									</xsl:call-template>
								</div>
								<div style="height:7.5mm;width:16mm; text-align:center; border-left:1px solid black;padding-top:4mm;
												 border-bottom:1px solid black;float:right;">
									<xsl:call-template name="PopulateNoBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleI/ForeignBranchAssetTransferInd"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- Schedule I line 2 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:7.5mm;">2</div>
							<div class="styLNDesc" style="height:7.5mm;width: 146.5mm;">
								Was the transferor a domestic corporation that transferred substantially all of the assets of an FB (including
								an FB that is an FDE) to a specified 10%-owned foreign corporation? If “No,” stop here. If “Yes,” go to line 3
								<!--Dotted Lines -->
								<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:32mm;">
								<div style="height:7.5mm;width:16mm;padding-top:4mm;text-align:center;border-left:1px solid black;
												 border-bottom:1px solid black; padding-left:0mm;float:left;clear:none; ">
									<xsl:call-template name="PopulateYesBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleI/DomCorpAstTransferForeignBrInd"/>
									</xsl:call-template>
								</div>
								<div style="height:7.5mm;width:16mm;padding-top:4mm;text-align:center;border-left:1px solid black; 
												 border-bottom:1px solid black; float:right;">
									<xsl:call-template name="PopulateNoBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleI/DomCorpAstTransferForeignBrInd"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- Schedule I line 3 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:7.5mm;">3</div>
							<div class="styLNDesc" style="height:7.5mm;width:146.5mm;">
								Immediately after the transfer, was the domestic corporation a U.S. shareholder with respect to the
								transferee foreign corporation? If “No,” stop here. If “Yes,” go to line 4
								<!--Dotted Lines -->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div style="width:32mm;">
								<div style="height:7.5mm;width: 16mm; text-align: center;border-left:1px solid black;border-bottom:0px solid black;
												padding-left:0mm;padding-top:4mm;float:left;clear:none;">
									<xsl:call-template name="PopulateYesBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleI/DomesticCorpUSShareholderInd"/>
									</xsl:call-template>
								</div>
								<div style="height:7.5mm;width:16mm;padding-top:4mm;text-align: center;border-left: 1px solid black; border-bottom: 0px solid black;float:right;">
									<xsl:call-template name="PopulateNoBoxText">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleI/DomesticCorpUSShareholderInd"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- Line 4 -->
					<div class="styBB" style="width:187mm;">
						<div style="float:left;">
							<div class="styLNLeftNumBoxSD" style="height:4.3mm;">4</div>
							<div class="styLNDesc" style="height:4.3mm;width:138.5mm;">
								Enter the transferred loss amount included in gross income as required under section 91. See instructions 
								<!-- push pen  -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleI/TransferredLossAmt"/>
								</xsl:call-template>
								<!--Dotted Lines -->
								<!--<span class="styDotLn" style="float:right; padding-right:1mm;">.</span>-->
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:4.3mm;border-top-width:1px;border-bottom-width:0px;">4</div>
							<div class="styLNAmountBox" style="height:4.3mm;border-top-width:1px;border-bottom-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleI/TransferredLossAmt"/>
								</xsl:call-template>
							</div>
						</div>	
					</div>

					<div class="styBB" style="width:187mm;float:none;clear:both;">
						<span class="styPartName" style="width: 20mm;">Schedule J</span>
						<span class="styPartDesc" style="width: 160mm;">Income Taxes Paid or Accrued 
							<span class="styNormalText"> (see instructions)</span>
						</span>
					</div>
					<div class="styBB" style="width:187mm;">
						<!-- Schedule J description -->
						<div class="styLNDesc" style="height: 4mm; width:23.5mm; font-size: 9pt;vertical-align: top;"/>
						<div class="styLNDesc" style="height: 4mm;font-weight: bold; width:70.5mm; font-size: 9pt;vertical-align: top;text-align:center;border-left:1px solid black;">Foreign Income Taxes</div>
						<div class="styLNDesc" style="height: 4mm;font-weight: bold; width:93mm; font-size: 9pt;vertical-align: top;text-align:center;border-left:1px solid black;">Foreign Tax Credit Separate Categories</div>
					</div>

				<div style="width:187mm">
					<table cellpadding="0" cellspacing="0" class="styTable" style="width:187mm;font-weight:normal;font-size:7pt;border:1px solid black;">
						<thead class="stythead">
							<tr>
								<th style="width:15mm;border-color:black;font-weight:normal;vertical-align:top;border:1px solid black;border-top:0px;border-left:0px;" class="styTablecellHeader" scope="col">
									<div style="padding-top:.5mm;text-align:center;padding-bottom:.5mm;">
										<b>(a) </b><br/> Country or Possession
									</div>
								</th>
								<th style="width:26mm;border-color:black;font-weight:normal;vertical-align:middle;border:1px solid black;border-top:0px;border-left:0px;" class="styTablecellHeader" scope="col">
									<div style="padding-top:.5mm;text-align:center;padding-bottom:.5mm;">
										<b>(b) </b><br/> Foreign Currency
									</div>
								</th>
								<th style="width:26mm;border-color:black;font-weight:normal;vertical-align:middle;border:1px solid black;border-top:0px;border-left:0px;" class="styTablecellHeader" scope="col">
									<div style="padding-top:.5mm;text-align:center;padding-bottom:.5mm;">
										<b>(c) </b><br/> Conversion Rate
									</div>
								</th>
								<th style="width:23mm;border-color:black;font-weight:normal;vertical-align:middle;border:1px solid black;border-top:0px;border-left:0px;" class="styTablecellHeader" scope="col">
									<div style="padding-top:.5mm;text-align:center;padding-bottom:.5mm;">
										<b>(d) </b><br/>U.S. Dollar
									</div>
								</th>
								<th style="width:23mm;border-color:black;font-weight:normal;vertical-align:middle;border:1px solid black;border-top:0px;border-left:0px;" class="styTablecellHeader" scope="col">
									<div style="padding-top:.5mm;text-align:center;padding-bottom:.5mm;">
										<b>(e) </b><br/> Foreign Branch
									</div>
								</th>
								<th style="width:23mm;border-color:black;font-weight:normal;vertical-align:middle;border:1px solid black;border-top:0px;border-left:0px;" class="styTablecellHeader" scope="col">
									<div style="padding-top:.5mm;text-align:center;padding-bottom:.5mm;">
										<b>(f) </b><br/> Passive
									</div>
								</th>
								<th style="width:23mm;border-color:black;font-weight:normal;vertical-align:middle;border:1px solid black;border-top:0px;border-left:0px;" class="styTablecellHeader" scope="col">
									<div style="padding-top:.5mm;text-align:center;padding-bottom:.5mm;">
										<b>(g) </b><br/> General
									</div>
								</th>
								<th style="width:23mm;border-color:black;font-weight:normal;vertical-align:middle;border:1px solid black;border-top:0px;border-left:0px;border-right:0px;" class="styTablecellHeader" scope="col">
									<div style="padding-top:.5mm;text-align:center;padding-bottom:.5mm;">
										<b>(h) </b><br/> Other
									</div>
								</th>
							</tr>
						</thead>
						<tfoot/>
						<tbody>
						
							<xsl:if test="(count($Form8858Data/IRS8858ScheduleJ/FrgnIncmTaxesPaidAccruedGrp) &lt; 1)">
								<tr>
									<!-- Column (a) -->
									<td class="styTableCellTextSmall" style="height:4mm;text-align:center;"/>
									<!-- Column (b) -->
									<td class="styTableCellSmall" style="height:4mm;"/>
									<!-- Column (c) -->
									<td class="styTableCellSmall" style="height:4mm;"/>
									<!-- Column (d) -->
									<td class="styTableCellSmall" style="height:4mm;"/>
									<!-- Column (e) -->
									<td class="styTableCellSmall" style="height:4mm;"/>
									<!-- Column (f) -->
									<td class="styTableCellSmall" style="height:4mm;"/>
									<!-- Column (g) -->
									<td class="styTableCellSmall" style="height:4mm;"/>
									<!-- Column (h) -->
									<td class="styTableCellSmall" style="height:4mm;border-right-width:0px;"/>
								</tr>	
								<tr>
									<!-- Column (a) -->
									<td class="styTableCellTextSmall" style="height:4mm;text-align:center;"/>
									<!-- Column (b) -->
									<td class="styTableCellSmall" style="height:4mm;"/>
									<!-- Column (c) -->
									<td class="styTableCellSmall" style="height:4mm;"/>
									<!-- Column (d) -->
									<td class="styTableCellSmall" style="height:4mm;"/>
									<!-- Column (e) -->
									<td class="styTableCellSmall" style="height:4mm;"/>
									<!-- Column (f) -->
									<td class="styTableCellSmall" style="height:4mm;"/>
									<!-- Column (g) -->
									<td class="styTableCellSmall" style="height:4mm;"/>
									<!-- Column (h) -->
									<td class="styTableCellSmall" style="height:4mm;border-right-width:0px;"/>
								</tr>	
								<tr>
									<!-- Column (a) -->
									<td class="styTableCellTextSmall" style="height:4mm;text-align:center;"/>
									<!-- Column (b) -->
									<td class="styTableCellSmall" style="height:4mm;"/>
									<!-- Column (c) -->
									<td class="styTableCellSmall" style="height:4mm;"/>
									<!-- Column (d) -->
									<td class="styTableCellSmall" style="height:4mm;"/>
									<!-- Column (e) -->
									<td class="styTableCellSmall" style="height:4mm;"/>
									<!-- Column (f) -->
									<td class="styTableCellSmall" style="height:4mm;"/>
									<!-- Column (g) -->
									<td class="styTableCellSmall" style="height:4mm;"/>
									<!-- Column (h) -->
									<td class="styTableCellSmall" style="height:4mm;border-right-width:0px;"/>
								</tr>	
							</xsl:if>
							<!-- Foreign Income Taxes Paid Accrued Group -->							
							<xsl:if test="(count($Form8858Data/IRS8858ScheduleJ/FrgnIncmTaxesPaidAccruedGrp) &gt;  0)">
								<xsl:for-each select="$Form8858Data/IRS8858ScheduleJ/FrgnIncmTaxesPaidAccruedGrp">
									<tr>
										<!-- Column (a) -->
										<td class="styTableCellTextSmall" style="height:4mm;width:15mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
											</xsl:call-template>
										</td>
										<!-- Column (b) -->
										<td class="styTableCellSmall" style="height:4mm;width:26mm;font-size: 6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignCurrencyAmt"/>
											</xsl:call-template>
										</td>
										<!-- Column (c) -->
										<td class="styTableCellSmall" style="height:4mm;width:26mm;font-size: 6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ConversionRt"/>
											</xsl:call-template>
										</td>
										<!-- Column (d) -->
										<td class="styTableCellSmall" style="height:4mm;width:23mm;font-size: 6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="USDollarAmt"/>
											</xsl:call-template>
										</td>
										<!-- Column (e) -->
										<td class="styTableCellSmall" style="height:4mm;width:23mm;font-size: 6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignBranchIncomeCrAmt"/>
											</xsl:call-template>
										</td>
										<!-- Column (f) -->
										<td class="styTableCellSmall" style="height:4mm;width:23mm;font-size: 6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignPassiveIncTaxCreditAmt"/>
											</xsl:call-template>
										</td>
										<!-- Column (g) -->
										<td class="styTableCellSmall" style="height:4mm;width:23mm;font-size: 6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignGeneralIncTaxCreditAmt"/>
											</xsl:call-template>
										</td>
										<!-- Column (h) -->
										<td class="styTableCellSmall" style="height:4mm;width:23mm;font-size: 6pt;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignIncmSection901jCrAmt"/>
											</xsl:call-template>
										</td>
									</tr>	
								</xsl:for-each>
								<xsl:if test="(count($Form8858Data/IRS8858ScheduleJ/FrgnIncmTaxesPaidAccruedGrp) = 2)">	
									<tr>
										<!-- Column (a) -->
										<td class="styTableCellTextSmall" style="height:4mm;text-align:center;"/>
										<!-- Column (b) -->
										<td class="styTableCellSmall" style="height:4mm;"/>
										<!-- Column (c) -->
										<td class="styTableCellSmall" style="height:4mm;"/>
										<!-- Column (d) -->
										<td class="styTableCellSmall" style="height:4mm;"/>
										<!-- Column (e) -->
										<td class="styTableCellSmall" style="height:4mm;"/>
										<!-- Column (f) -->
										<td class="styTableCellSmall" style="height:4mm;"/>
										<!-- Column (g) -->
										<td class="styTableCellSmall" style="height:4mm;"/>
										<!-- Column (h) -->
										<td class="styTableCellSmall" style="height:4mm;border-right-width:0px;"/>
									</tr>	
								</xsl:if>
								<xsl:if test="(count($Form8858Data/IRS8858ScheduleJ/FrgnIncmTaxesPaidAccruedGrp) = 1)">
									<tr>
										<!-- Column (a) -->
										<td class="styTableCellTextSmall" style="height:4mm;text-align:center;"/>
										<!-- Column (b) -->
										<td class="styTableCellSmall" style="height:4mm;"/>
										<!-- Column (c) -->
										<td class="styTableCellSmall" style="height:4mm;"/>
										<!-- Column (d) -->
										<td class="styTableCellSmall" style="height:4mm;"/>
										<!-- Column (e) -->
										<td class="styTableCellSmall" style="height:4mm;"/>
										<!-- Column (f) -->
										<td class="styTableCellSmall" style="height:4mm;"/>
										<!-- Column (g) -->
										<td class="styTableCellSmall" style="height:4mm;"/>
										<!-- Column (h) -->
										<td class="styTableCellSmall" style="height:4mm;border-right-width:0px;"/>
									</tr>	
									<tr>
										<!-- Column (a) -->
										<td class="styTableCellTextSmall" style="height:4mm;text-align:center;"/>
										<!-- Column (b) -->
										<td class="styTableCellSmall" style="height:4mm;"/>
										<!-- Column (c) -->
										<td class="styTableCellSmall" style="height:4mm;"/>
										<!-- Column (d) -->
										<td class="styTableCellSmall" style="height:4mm;"/>
										<!-- Column (e) -->
										<td class="styTableCellSmall" style="height:4mm;"/>
										<!-- Column (f) -->
										<td class="styTableCellSmall" style="height:4mm;"/>
										<!-- Column (g) -->
										<td class="styTableCellSmall" style="height:4mm;"/>
										<!-- Column (h) -->
										<td class="styTableCellSmall" style="height:4mm;border-right-width:0px;"/>
									</tr>
								</xsl:if>
							</xsl:if>
							<!-- Total Foreign Income Taxes Paid Accrued Group -->
							<tr>
								<!-- Column (a) -->
								<td class="styTableCellTextSmall" style="height:4mm;width:15mm;font-weight: bold;text-align:left;">Totals</td>
								<!-- Column (b) -->
								<td class="styTableCellSmall" style="height:4mm;width:26mm;background-color:lightgrey;"/>
								<!-- Column (c) -->
								<td class="styTableCellSmall" style="height:4mm;width:26mm;background-color:lightgrey;"/>
								<!-- Column (d) -->
								<td class="styTableCellSmall" style="height:4mm;width:23mm;font-size: 6pt;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleJ/TotFrgnIncmTaxesPaidAccruedGrp/USDollarAmt"/>
									</xsl:call-template>
								</td>
								<!-- Column (e) -->
								<td class="styTableCellSmall" style="height:4mm;width:23mm;font-size: 6pt;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleJ/TotFrgnIncmTaxesPaidAccruedGrp/ForeignBranchIncomeCrAmt"/>
									</xsl:call-template>
								</td>
								<!-- Column (f) -->
								<td class="styTableCellSmall" style="height:4mm;width:23mm;font-size: 6pt;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleJ/TotFrgnIncmTaxesPaidAccruedGrp/ForeignPassiveIncTaxCreditAmt"/>
									</xsl:call-template>
								</td>
								<!-- Column (g) -->
								<td class="styTableCellSmall" style="height:4mm;width:23mm;font-size: 6pt;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleJ/TotFrgnIncmTaxesPaidAccruedGrp/ForeignGeneralIncTaxCreditAmt"/>
									</xsl:call-template>
								</td>
								<!-- Column (h) -->
								<td class="styTableCellSmall" style="height:4mm;width:23mm;font-size: 6pt;border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleJ/TotFrgnIncmTaxesPaidAccruedGrp/ForeignIncmSection901jCrAmt"/>
									</xsl:call-template>
								</td>
							</tr>	
						</tbody>
					</table>
				</div>
					<!-- Page 2 Footer -->
					<div style="width:187mm;">
						<div class="stySmallText" style="width:36mm;text-align:right;float:right;clear:none;">
              Form <span class="styBoldText" style="font-size:8pt;">8858</span> (Rev. 12-2018)
            </div>
					</div>
					<p style="page-break-before:always"/>
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
            Additional Data        
          </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form8858Data"/>
						</xsl:call-template>
						<tr>
							<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8858Data/@summaryDormantFDECd"/>
										<xsl:with-param name="BackupName">Summary Dormant FDE Code</xsl:with-param>
									</xsl:call-template>
											Form 8858, Top Left Margin - Summary Dormant FDE Indicator:
                                </label>
							</td>
							<td class="styLeftOverTableRowAmount" style="width:87mm;padding-top:4mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8858Data/@summaryDormantFDECd"/>
									<xsl:with-param name="BackupName">Summary Dormant FDE Code</xsl:with-param>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<!-- END Left Over Table -->
					<!-- Additional Data Table for Separated Repeating Data from Line 1 b(2) -->
						<xsl:if test="(($Print = $Separated) or (count($Form8858Data/ForeignEntityIdentificationGrp) &gt; 1))">
						<span class="styRepeatingDataTitle">
							<br/>Form 8858, Line 1 b(2):
            </span>
						<table class="styDepTbl" style="font-size:7pt">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="text-align:left">
                    Reference ID number (see instructions)
                  </th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$Form8858Data/ForeignEntityIdentificationGrp">
									<tr>
										<!--Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align:left;">
											<span style="font-family:verdana;font-size:7pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
												</xsl:call-template>
											</span>
											<br/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- End Line 1b Separated Data -->
					<!-- Additional Data Table for Separated Repeating Data from Line 1c/1d -->
					<xsl:if test="($Print = $Separated) and (count($Form8858Data/CountryEntityOrgDetail) &gt; 1) ">
						<span class="styRepeatingDataTitle">
							<br/>Form 8858, Lines 1c and 1d:
            </span>
						<table class="styDepTbl" style="font-size:7pt">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell">
                    c<span style="width:10px;"/>Country(ies) under whose laws organized and entity 
                    type under local tax law
                  </th>
									<th class="styDepTblCell">
                    d<span style="width:10px;"/>Date(s) of organization
                  </th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$Form8858Data/CountryEntityOrgDetail">
									<tr>
										<!--Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">
                    styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CntryUnderWhoseLawsOrganizedCd"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="EntityTypeTxt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align:center;">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="OrganizationDt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- End Line 1c/1d Separated Data -->
					<!-- Additional Data Table for Separated Repeating Data from Line 2b -->
					<xsl:if test="($Print = $Separated) and (count($Form8858Data/BooksAndRecords) &gt; 1) ">
						<span class="styRepeatingDataTitle">
							<br/>Form 8858, Line 2b:
            </span>
						<table class="styDepTbl" style="font-size:7pt">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="text-align:left">
                    b<span style="width:20px;"/>
                    Name and address (including corporate department, if applicable) of person(s)<br/>
										<span style="width:28px;"/>with custody of the books and records of the foreign 
                    disregarded entity, and the <br/>
										<span style="width:28px;"/>location of such books and records, if different
                  </th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$Form8858Data/BooksAndRecords">
									<tr>
										<!--Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">
                    styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align:left;">
											<span style="font-family:verdana;font-size:7pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonsWithBooksName/
                          BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonsWithBooksName/
                          BusinessNameLine2Txt"/>
												</xsl:call-template>
											</span>
											<br/>
                      CustodianAddress:<br/>
											<xsl:if test="PersonsWithBooksUSAddress!=''">
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="PersonsWithBooksUSAddress"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="PersonsWithBooksForeignAddress!=''">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$Form8858Data/BooksAndRecords/PersonsWithBooksForeignAddress/AddressLine1Txt"/>
															</xsl:call-template>
															<xsl:if test="normalize-space($Form8858Data/BooksAndRecords/PersonsWithBooksForeignAddress/AddressLine2Txt)!=''">
																<br/>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$Form8858Data/BooksAndRecords/PersonsWithBooksForeignAddress/AddressLine2Txt"/>
																</xsl:call-template>
															</xsl:if>
															<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$Form8858Data/BooksAndRecords/PersonsWithBooksForeignAddress/CityNm"/>
															</xsl:call-template>
															<xsl:if test="(normalize-space($Form8858Data/BooksAndRecords/PersonsWithBooksForeignAddress/CityNm) != '') and (normalize-space($Form8858Data/BooksAndRecords/PersonsWithBooksForeignAddress/ProvinceOrStateNm) != '' or normalize-space($Form8858Data/BooksAndRecords/PersonsWithBooksForeignAddress/ForeignPostalCd) != '')">											,
															</xsl:if>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$Form8858Data/BooksAndRecords/PersonsWithBooksForeignAddress/ProvinceOrStateNm"/>
															</xsl:call-template>  
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$Form8858Data/BooksAndRecords/PersonsWithBooksForeignAddress/ForeignPostalCd"/>
															</xsl:call-template>
															<xsl:if test="normalize-space($Form8858Data/BooksAndRecords/PersonsWithBooksForeignAddress/CityNm) != '' or normalize-space($Form8858Data/BooksAndRecords/PersonsWithBooksForeignAddress/ProvinceOrStateNm) != '' or normalize-space($Form8858Data/BooksAndRecords/PersonsWithBooksForeignAddress/ForeignPostalCd) != ''">
															<span style="width:4px;"/>
															</xsl:if>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$Form8858Data/BooksAndRecords/PersonsWithBooksForeignAddress/CountryCd"/>
															</xsl:call-template>

											</xsl:if>
											<br/>
                      Location:<br/>
											<xsl:if test="LocationOfBooksUSAddress!=''">
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="LocationOfBooksUSAddress"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="LocationOfBooksForeignAddress!=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form8858Data/BooksAndRecords/LocationOfBooksForeignAddress/AddressLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="normalize-space($Form8858Data/BooksAndRecords/LocationOfBooksForeignAddress/AddressLine2Txt)!=''">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form8858Data/BooksAndRecords/LocationOfBooksForeignAddress/AddressLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form8858Data/BooksAndRecords/LocationOfBooksForeignAddress/CityNm"/>
												</xsl:call-template>
												<xsl:if test="(normalize-space($Form8858Data/BooksAndRecords/LocationOfBooksForeignAddress/CityNm) != '') and (normalize-space($Form8858Data/BooksAndRecords/LocationOfBooksForeignAddress/ProvinceOrStateNm) != '' or normalize-space($Form8858Data/BooksAndRecords/LocationOfBooksForeignAddress/ForeignPostalCd) != '')">											,
												</xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form8858Data/BooksAndRecords/LocationOfBooksForeignAddress/ProvinceOrStateNm"/>
												</xsl:call-template>  
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form8858Data/BooksAndRecords/LocationOfBooksForeignAddress/ForeignPostalCd"/>
												</xsl:call-template>
												<xsl:if test="normalize-space($Form8858Data/BooksAndRecords/LocationOfBooksForeignAddress/CityNm) != '' or normalize-space($Form8858Data/BooksAndRecords/LocationOfBooksForeignAddress/ProvinceOrStateNm) != '' or normalize-space($Form8858Data/BooksAndRecords/LocationOfBooksForeignAddress/ForeignPostalCd) != ''">
												<span style="width:4px;"/>
												</xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form8858Data/BooksAndRecords/LocationOfBooksForeignAddress/CountryCd"/>
												</xsl:call-template>
											</xsl:if>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- End Line 2b Separated Data -->
					<!-- Additional Data Table for Separated Repeating Data from Line 3 c(2) -->
					<xsl:if test="(($Print = $Separated) or (count($Form8858Data/TaxOwnerEntityIdGrp) &gt; 1))">
						<span class="styRepeatingDataTitle">
							<br/>Form 8858, Line 3 c(2):
                        </span>
						<table class="styDepTbl" style="font-size:7pt">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="text-align:left">
                    Reference ID number (see instructions)
                </th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$Form8858Data/TaxOwnerEntityIdGrp">
									<tr>
										<!--Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align:left;">
											<span style="font-family:verdana;font-size:7pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
												</xsl:call-template>
											</span>
											<br/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- End Line 3c Separated Data -->
					<!-- Additional Data Table for Separated Repeating Data from Lines 4a thru 4d -->
					<xsl:if test="($Print = $Separated) and (count($Form8858Data/DirectOwner/DirectOwnerName)
           &gt; 1) ">
						<span class="styRepeatingDataTitle">
							<br/>Form 8858, Line 4:  Direct owner of the FDE or FB (if different from the
               tax owner) provide the following(see instructions):
                   </span>
						<div style="float: left; clear:none; width: 187mm">
							<table class="styDepTbl" style="font-size: 7pt" cellspacing="0">
								<thead class="styTableHead">
									<!-- Line 4 -->
									<tr class="styDepTblHdr">
										<td class="styDepTblCell" style="width: 77mm; text-align: left; height:10mm; vertical-align:top;">
											<span class="styLNLeftNumBox" style="padding-top:0mm;width:4.5mm;
                      height:100%;">a</span>
											<!-- Box 4a -->
                          Name and address
                            </td>
										<td class="styDepTblCell" style="width:25mm;font-size:7pt;">
											<span class="styLNLeftNumBox" style="padding-top:0mm;width:4.5mm;
                      height:100%;">b</span>
                    Country under whose laws<br/> organized
                    </td>
										<td class="styDepTblCell" style="width:43mm;font-size: 7pt; vertical-align:top;">
											<span class="styBoldText" style="padding-left:1mm;padding-right: 1.8mm">c</span>
											<!-- Box 4c -->
                  U.S. identifying number, if any
                       </td>
										<td class="styDepTblCell" style="width:42mm;font-size:7pt; vertical-align:top;">
											<span class="styBoldText" style="padding-left:1mm;padding-right: 1.8mm">d</span>
											<!-- Box 4d -->
                               Functional currency                               
          </td>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="$Form8858Data/DirectOwner">
										<tr>
											<!--Define background colors to the rows -->
											<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">
                      styDepTblRow1</xsl:when><xsl:otherwise>               styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styDepTblCell" style="width:93mm;font-size:7pt; text-align:left;">
												<!-- 4a - Name -->
												<span style="font-family:verdana;font-size:7pt;">
													<xsl:if test="DirectOwnerName/BusinessNameLine1Txt !=''">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DirectOwnerName/BusinessNameLine1Txt"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="DirectOwnerName/BusinessNameLine2Txt !=''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DirectOwnerName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
													<!-- 4a - Address -->
													<!-- USA Address -->
													<br/>
													<xsl:if test="DirectOwnerUSAddress !=''">
														<xsl:call-template name="PopulateUSAddressTemplate">
															<xsl:with-param name="TargetNode" select="DirectOwnerUSAddress"/>
														</xsl:call-template>
													</xsl:if>
													<!-- Foreign Address 4a -->
													<xsl:if test="DirectOwnerForeignAddress!=''">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form8858Data/DirectOwner/DirectOwnerForeignAddress/AddressLine1Txt"/>
														</xsl:call-template>
														<xsl:if test="normalize-space($Form8858Data/DirectOwner/DirectOwnerForeignAddress/AddressLine2Txt)!=''">
															<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$Form8858Data/DirectOwner/DirectOwnerForeignAddress/AddressLine2Txt"/>
															</xsl:call-template>
														</xsl:if>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form8858Data/DirectOwner/DirectOwnerForeignAddress/CityNm"/>
														</xsl:call-template>
														<xsl:if test="(normalize-space($Form8858Data/DirectOwner/DirectOwnerForeignAddress/CityNm) != '') and (normalize-space($Form8858Data/DirectOwner/DirectOwnerForeignAddress/ProvinceOrStateNm) != '' or normalize-space($Form8858Data/DirectOwner/DirectOwnerForeignAddress/ForeignPostalCd) != '')">											,
														</xsl:if>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form8858Data/DirectOwner/DirectOwnerForeignAddress/ProvinceOrStateNm"/>
														</xsl:call-template>  
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form8858Data/DirectOwner/DirectOwnerForeignAddress/ForeignPostalCd"/>
														</xsl:call-template>
														<xsl:if test="normalize-space($Form8858Data/DirectOwner/DirectOwnerForeignAddress/CityNm) != '' or normalize-space($Form8858Data/DirectOwner/DirectOwnerForeignAddress/ProvinceOrStateNm) != '' or normalize-space($Form8858Data/DirectOwner/DirectOwnerForeignAddress/ForeignPostalCd) != ''">
														<span style="width:4px;"/>
														</xsl:if>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form8858Data/DirectOwner/DirectOwnerForeignAddress/CountryCd"/>
														</xsl:call-template>
													</xsl:if>
												</span>
											</td>
											<!-- Box 4b -->
											<td class="styDepTblCell" style="width:47mm;font-size:7pt; text-align:left">
												<span style="width:2mm;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DrtOwnerCntryLawsOrganizedCd"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" valign="top" style="height: 8mm;width:47mm;
                      font-size: 7pt;text-align:left">
												<!-- Box 4c -->
												<span style="width: 2mm"/>
												<xsl:if test="DirectOwnerUSIdNumberDetail/EIN">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="DirectOwnerUSIdNumberDetail/EIN"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="DirectOwnerUSIdNumberDetail/SSN">
													<xsl:call-template name="PopulateSSN">
														<xsl:with-param name="TargetNode" select="DirectOwnerUSIdNumberDetail/SSN"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="DirectOwnerUSIdNumberDetail/MissingEINReasonCd">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DirectOwnerUSIdNumberDetail/
                            MissingEINReasonCd"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styDepTblCell" valign="top" style="height: 8mm;width:47mm;
                      font-size: 7pt;text-align:left">
												<span style="width: 2mm"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DrtOwnerFunctionalCurrencyDesc"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</div>
						<br/>
					</xsl:if>
					<!-- Additional Data Table for Separated Repeating Data from Schedule C-1 -->
					<xsl:if test="($Print = $Separated) and (count($Form8858Data/IRS8858ScheduleC1) &gt; 1)">
						<xsl:for-each select="$Form8858Data/IRS8858ScheduleC1">
							<span class="styRepeatingDataTitle">
								<br/>Form 8858, Schedule C-1  Section 987 Gain or Loss Information:
               <!-- puch pen  -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8858Data/IRS8858ScheduleC1/
							RecipientRemittanceAmt"/>
								</xsl:call-template>
							</span>
							<table class="styDepTbl" style="font-size:7pt">
								<tbody>
									<tr class="styDepTblHdr">
										<th class="styDepTblCell" style="width:115mm;padding-top:4mm;" align="left">
											<span style="width:2px"/>
											<b>Note:</b>  See the instructions if there are multiple 
                      recipients of remittances<br/> <span style="width:10mm"/>from the FDE or FB.
                    </th>
										<th class="styDepTblCell" style="width:5mm"/>
										<th class="styDepTblCell" style="text-align:center;width:33mm">
                      (a)<br/>Amount stated in <br/>functional currency of <br/>FDE or FB
                    </th>
										<th class="styDepTblCell" colspan="2" style="text-align:center;width:32mm">
                      (b)<br/>Amount stated in <br/>functional currency <br/>of recipient
                    </th>
									</tr>
									<tr class="styDepTblRow1">
										<td class="styDepTblCell" style="text-align:left;">
											<div class="styLNLeftNumBox" style="text-align:left">1</div>
                      Remittances from the FDE or FB
                    </td>
										<td class="styDepTblCell" style="text-align:center;font-weight:bold;">1</td>
										<td class="styDepTblCell" style="text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="RemittanceAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" colspan="2" style="text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="RecipientRemittanceAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr class="styDepTblRow2">
										<td class="styDepTblCell" style="text-align:left;">
											<div class="styLNLeftNumBox" style="text-align:left">2</div>
                      Section 987 gain (loss) of recipient
                    </td>
										<td class="styDepTblCell" style="text-align:center;font-weight:bold;">2</td>
										
										<td class="styDepTblCell" style="text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Section987GainOrLossAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" colspan="2" style="text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Section987GainOrLossRcpntAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- Line 3 -->
									<tr class="styDepTblRow1">
										<td class="styDepTblCell"  style="text-align:left;">
											<div class="styLNLeftNumBox" style="text-align:left">3</div>
                      Were all remittances from the FDE or FB treated as made to the direct owner?
                    </td>
										<td class="styDepTblCell" style="text-align:center;font-weight:bold;">3</td>
										<td class="styDepTblCell" style="text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Sect987GainOrLossDefrdAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" colspan="2" style="text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Sect987GainOrLossDefrdRcpntAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr class="styDepTblRow2">
										<td class="styDepTblCell" colspan="3" style="text-align:left;"/>
										<td class="styDepTblCell" style="text-align:center;width:16mm;font-weight:bold">Yes</td>
										<td class="styDepTblCell" style="text-align:center;width:16mm;font-weight:bold">No</td>
									</tr>
									<!-- Line 4 -->
									<tr class="styDepTblRow1">
										<td class="styDepTblCell" colspan="3" style="text-align:left;">
											<div class="styLNLeftNumBox" style="text-align:left">4</div>
												Did the tax owner change its method of accounting for section 987 gain or loss with respect to 
												remittances from the disregarded entity during the tax year?
										</td>
										<td class="styDepTblCell" style="text-align:center">
											<xsl:call-template name="PopulateYesBoxText">
												<xsl:with-param name="TargetNode" select="RmtTreatedAsDirectOwnerInd"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align:center">
											<xsl:call-template name="PopulateNoBoxText">
												<xsl:with-param name="TargetNode" select="RmtTreatedAsDirectOwnerInd"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- Line 5 -->
									<tr class="styDepTblRow1">
										<td class="styDepTblCell" colspan="3" style="height:12mm;text-align:left;">
											<div class="styLNLeftNumBox" style="text-align:left">5</div>
											<div class="styLNDesc" style="text-align:left">
												Did the tax owner change its method of accounting for section 
												987 gain or loss with respect to remittances from the FDE or FB during the tax year?  If "Yes," 
												attach a statement describing the method used prior to the change and new method of accounting
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="TaxOwnerMethodOfAcctChangeInd"/>
												</xsl:call-template> 
											</div>
										</td>
										<td class="styDepTblCell" style="text-align:center">
											<xsl:call-template name="PopulateYesBoxText">
												<xsl:with-param name="TargetNode" select="TaxOwnerMethodOfAcctChangeInd"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align:center">
											<xsl:call-template name="PopulateNoBoxText">
												<xsl:with-param name="TargetNode" select="TaxOwnerMethodOfAcctChangeInd"/>
											</xsl:call-template>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
						</xsl:for-each>
					</xsl:if>
					<!-- End Schedule C-1 Separated Data -->
					<!-- Additional Data Table for Separated Repeating Data from Schedule H -->
					<xsl:if test="($Print = $Separated) and (count($Form8858Data/IRS8858ScheduleH) &gt; 1) ">
						<span class="styRepeatingDataTitle">
							<br/>Form 8858, Schedule H - Current Earnings and Profits or Taxable Income:
            </span>
						<xsl:for-each select="$Form8858Data/IRS8858ScheduleH">
							<table class="styDepTbl" style="font-size:7pt">
								<tbody>
									<tr class="styDepTblRow1">
										<td class="styDepTblCell" style="text-align:left;">
											<div class="styLNLeftNumBox" style="text-align:left;">1</div>
                        Current year net income or (loss) per foreign books of account
                      </td>
										<td class="styDepTblCell" style="text-align:center;font-weight:bold;width:5mm">1</td>
										<td class="styDepTblCell" style="text-align:right;width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignCYNetIncomePerBooksAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr class="styDepTblRow2">
										<td class="styDepTblCell" style="text-align:left;">
											<div class="styLNLeftNumBox" style="text-align:left">2</div>
                      Total net additions    
                    </td>
										<td class="styDepTblCell" style="text-align:center;font-weight:bold;width:5mm">2</td>
										<td class="styDepTblCell" style="text-align:right;width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalNetAdditonsAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr class="styDepTblRow1">
										<td class="styDepTblCell" style="text-align:left;">
											<div class="styLNLeftNumBox" style="text-align:left">3</div>
                      Total net substractions    
                      </td>
										<td class="styDepTblCell" style="text-align:center;font-weight:bold;width:5mm">3</td>
										<td class="styDepTblCell" style="text-align:right;width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalNetSubtractionsAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr class="styDepTblRow2">
										<td class="styDepTblCell" style="text-align:left;">
											<div class="styLNLeftNumBox" style="text-align:left">4</div>
                      Current earnings and profits (or taxable incomesee instructions) (line 1 plus line 2 minus line 3)
                        </td>
										<td class="styDepTblCell" style="text-align:center;font-weight:bold;width:5mm">4</td>
										<td class="styDepTblCell" style="text-align:right;width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CurrentEarningsAndProfitsAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr class="styDepTblRow1">
										<td class="styDepTblCell" style="text-align:left;">
											<div class="styLNLeftNumBox" style="text-align:left">5</div>
                      DASTM gain or loss (if applicable)    
                    </td>
										<td class="styDepTblCell" style="text-align:center;font-weight:bold;width:5mm">5</td>
										<td class="styDepTblCell" style="text-align:right;width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DASTMGainOrLossAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr class="styDepTblRow2">
										<td class="styDepTblCell" style="text-align:left;">
											<div class="styLNLeftNumBox" style="text-align:left">6</div>
                      Combine lines 4 and 5    
                    </td>
										<td class="styDepTblCell" style="text-align:center;font-weight:bold;width:5mm">6</td>
										<td class="styDepTblCell" style="text-align:right;width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="EarningAndPrftPlusDASTMGainAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr class="styDepTblRow1">
										<td class="styDepTblCell" style="text-align:left;border-bottom-width:0px">
											<div class="styLNLeftNumBox" style="text-align:left">7</div>
                      Current earnings and profits (or taxable income) in U.S. dollars (line 6 translated at the average
                      exchange rate determined under section 989(b) and the related regulations (see instructions))    
                      <!--<span style="font-weight: bold; letter-spacing: 16px; ">.</span>-->
										</td>
										<td class="styDepTblCell" style="text-align:center;font-weight:bold;vertical-align:bottom;width:5mm">7</td>
										<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CurrEarnAndPrftInUSDollarsAmt"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr class="styDepTblRow1">
										<td class="styDepTblCell" style="text-align:left;border-top-width:0px">
											<div class="styLNLeftNumBox" style="text-align:left"/>
                      Enter exchange rate used for line 7<span style="width:4px"/>
											<img src="{$ImagePath}/8858_Bullet_Sm.gif" alt="Bullet"/>
											<span style="width:4px"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ExchangeRt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="background-color:lightgrey;width:5mm;border-right-width:0px;"/>
										<td class="styDepTblCell" style="background-color:lightgrey;width:33mm;border-left-width:0px;"/>
									</tr>
								</tbody>
							</table>
							<br/>
						</xsl:for-each>
					</xsl:if>
					<!-- End Schedule H Separated Data -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
