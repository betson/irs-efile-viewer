<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS5471Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
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
		<html>
			<head>
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
					<!-- uncomment this before checking in111111 code this one-->
					<xsl:if test="not($Print) or $Print=''">
						<!-- Form 5471 CSS Styles are located in the template called below -->
						<xsl:call-template name="IRS5471Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS5471">
					<!--   BEGIN WARNING LINE  -->
					<xsl:call-template name="DocumentHeader"/>
					<!--   END WARNING LINE   -->
					<!--   BEGIN FORM HEADER   -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:30.25mm; height: 23.25mm">
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
							<div class="styAgency">(Rev. December 2012)</div>
							<div class="styAgency" style="font-size: 6pt; text-align:bottom;padding-top:.5mm;">Department of the Treasury<br/>Internal Revenue Service</div>
						</div>
						<div class="styFTBox" style="width:126mm;height:20mm;">
							<div class="styMainTitle" style="font-size:12pt;">Information Return of U.S. Persons With Respect To Certain Foreign Corporations</div>
							<div class="styFST" style="padding-top:1mm">
								<img src="{$ImagePath}/5471_Bullet_Title.gif" alt="bullet"/>
								<span style="width: 2mm"/>For more information about Form 5471, see <a href="http://www.irs.gov/form5471" title="Link to IRS.gov">
									<i>www.irs.gov/form5471</i>
								</a>
								<br/>
							</div>
							<div style="text-align: left; padding-top: 1mm; padding-left: .5mm; text-align:bottom;">Information furnished for the foreign corporation's annual accounting period (tax year required by section 898) 		 <span style="font-size:6pt">(see instructions) </span>beginning     
                    <span style="width: 20mm">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/TaxYearBeginDt"/>
									</xsl:call-template>
								</span>, and ending
          		<span style="width: 20mm">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/TaxYearEndDt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="height: 23.25mm">
							<div class="styOMB" style="height:7mm;">
								<div style="text-align:left;font-size: 7pt;padding-left: 1mm;height:4mm;padding-top:4mm;padding-bottom:4mm;">OMB No. 1545-0704</div>
							</div>
							<div class="styBoldText" style="height:2mm;vertical-align: middle;text-align:left; padding-left: 1mm;padding-top:1.5mm;"/>
							<div style="font-size:6pt; height:6mm; text-align: left; padding-left: 1mm">
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
						<div class="styNameBox" style="height: 4.5mm;font-size: 7pt;width: 109mm">Name of person filing this return
    <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn"/>
							</xsl:call-template>
							<div style="font-family: verdana, arial, sans-serif; font-size: 7pt; font-weight: normal; height: 4.5mm">
								<xsl:choose>
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
											<xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
												<br/>
												<xsl:call-template name="PopulateReturnHeaderFiler">
													<xsl:with-param name="TargetNode">Name</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateReturnHeaderFiler">
													<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateReturnHeaderFiler">
													<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
						<span class="styEINBox" style="font-size:7pt; padding-left:1mm">A<span style="width:8px;"/>Identifying number</span>
						<span class="styNormalText" style="padding-top: 2mm; text-align: left; width: 70mm;padding-left:5mm;">
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
											<xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
												<xsl:call-template name="PopulateReturnHeaderFiler">
													<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateReturnHeaderFiler">
													<xsl:with-param name="TargetNode">EIN</xsl:with-param>
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
						<div class="styAddrFld" style="border-bottom-width: 0px; border-left-width: 0px; border-style:solid; font-size: 6pt; height: 8mm;width: 109mm; float:left; font-weight: normal">Number, street, and room or suite no. (or P.O. box number if mail is not delivered to street address)
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
						<div class="styComType" style="width: 78mm; height: 8mm; float: right;clear:both; padding-left: 1mm;border-top-width: 1px; border-bottom-width: 0px;">
							<b style="font-size: 7pt;">B</b>
							<span style="width: 8px; font-size: 7pt;"/>Category of filer (See instructions.  Check applicable box(es)):
    			<br/>
							<span style="margin-left: 4mm; font-size: 8pt">
       		 1
                <span style="width:8px;"/>
                (repealed)
                <span style="width:12px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler2Ind"/>
										<xsl:with-param name="BackupName">IRS5471CategoryOfFiler2</xsl:with-param>
									</xsl:call-template>
        2</label>
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
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler3Ind"/>
										<xsl:with-param name="BackupName">IRS5471CategoryOfFiler3</xsl:with-param>
									</xsl:call-template>
        3</label>
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
									</xsl:call-template>
        4</label>
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
									</xsl:call-template>
        5</label>
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
					<div style="width:187mm;">
						<div class="styComType" style="font-size: 7pt; width: 109mm; height: 8mm; border-top-width: 1px; border-bottom-width: 0px;border-right-width: 1px">City or town, state, and ZIP code
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
										<!-- xsl:attribute name="style">line-height:100%; font-size:5pt </xsl:attribute-->
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
						<div class="styComType" style="width: 78mm; height: 8mm; float: right;clear:both; padding-left: 1mm;border-top-width: 1px; border-bottom-width: 0px;text-align: left">
							<b style="font-size: 7pt;padding-right: 1mm">C</b>
              
    Enter the total percentage of the foreign corporation's voting stock
    you owned at the end of its annual accounting period 
    <span class="styFixedUnderline" style="width:12mm;float:none;">
								<xsl:call-template name="PopulatePercent">
									<xsl:with-param name="TargetNode" select="$IRS5471Data/VotingStockOwnedPct"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!--   END CITY, STATE, ZIP AND VOTING PERCENTAGE   -->
					<!--   BEGIN FILER'S TAX YEAR   -->
					<div class="styBB" style="width: 187mm; border-top-width: 1px">
						<span style="text-align:left">Filer's tax year beginning
                  <span style="width: 20mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$IRS5471Data/FilerTaxYearBeginDt"/>
								</xsl:call-template>
							</span>, and ending
        <span style="width: 20mm; ">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$IRS5471Data/FilerTaxYearEndDt"/>
								</xsl:call-template>
							</span>
						</span>
					</div>
					<!--   END FILER'S TAX YEAR   -->
					<!--   END TAXPAYER INFO   -->
					<!--   BEGIN BLOCK D   -->
					<!--   BEGIN LINE D   -->
					<div class="styBB" style="width:187mm">
						<div style="float:left;">
							<b style="font-size: 7pt;">D</b>
							<span class="styNBSP"/>
							<span style="font-size: 7pt;">  Person(s) on whose behalf this information return is filed:</span>
							<!--							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonInformationIsFiledFor"/>
							</xsl:call-template>-->
							<span style="width:1px"/>
						</div>
						<div style="width:7mm;text-align:right;float:right;clear:none;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonInformationIsFiledFor"/>
								<xsl:with-param name="containerHeight" select="4"/>
								<xsl:with-param name="containerID" select=" 'PBctn' "/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE D   -->
					<!--   BEGIN BLOCK D TABLE   -->
					<div class="styIRS5471TableContainer" id="PBctn">
						<!--print logic-->
						<xsl:call-template name="SetInitialState"/>
						<!--end-->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th scope="col" class="styTableCellHeader" style="border-color: black; font-size: 7pt; text-align: center; width: 68mm" rowspan="2">
                    (1)<span class="styNormalText"> Name</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="border-color: black; font-size: 7pt; text-align: center; width: 63mm" rowspan="2">
                    (2)<span class="styNormalText"> Address</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="border-color: black; font-size: 7pt; text-align: center; width: 30mm" rowspan="2">
                    (3)<span class="styNormalText"> Identifying number</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 42mm; border-color: black; font-size: 7pt;border-right-width: 0px" colspan="3">
                    (4)<span class="styNormalText"> Check applicable box(es)</span>
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
						<xsl:with-param name="containerID" select=" 'PBctn' "/>
					</xsl:call-template>
					<!--   END Block D TABLE   -->
					<!--   BEGIN IMPORTANT HEADER   -->
					<div class="styGenericDiv" style="width: 187mm; font-size: 8pt">
						<span class="styBoldText" style="vertical-align: top;">Important:</span>
						<span class="styItalicText" style="width: 160mm; padding-left: 2mm"> Fill in all applicable lines and schedules.  All information <b>must</b> be in English.  All amounts <b>must</b> be stated</span>
					</div>
					<div class="styBB" style="width: 187mm; font-size: 8pt">
						<span class="styItalicText" style="width: 149mm; padding-left: 21mm">in U.S. dollars unless otherwise indicated.</span>
					</div>
					<!--   END IMPORTANT HEADER   -->
					<!--   BEGIN BLOCK 1   -->
					<!--   BEGIN 1A, 1B, 1C   -->
					<!-- ******************************************START******************************************************************************************** -->
					<!-- ************************************************************************************************************************************** -->
					<xsl:choose>
						<xsl:when test="($Print = $Separated)">
							<!--   BEGIN 1A, 1B, 1C   -->
							<table class="styTable" cellspacing="0" style="width:187mm;font-size:7pt;">
								<tr>
									<td class="styTableCell" rowspan="3" valign="top" style="width: 117mm; text-align:left;
									        border-color:black; border-bottom:0;">
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
									</td>
									<td class="styTableCell" valign="top" style="width: 59.5mm;height: 9.5mm;border-color:black;border-right:0;">
										<span style="width:59.5mm;text-align:left;padding-left:1mm;">
											<b>b(1)</b>
											<span style="padding-left:1mm;">Employer identification number, if any
                </span>
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
									<td class="styTableCell" valign="top" style="width: 59.5mm;height: 9.5mm;border-color:black;border-right-width: 0px">
										<span style="width:64mm;text-align:left;padding-left:1mm;">
											<b>b(2)</b>
											<span style="padding-left:1mm;">Reference ID number (see instructions)
                </span>
										</span>
										<br/>
										<br/>
										<xsl:choose>
											<xsl:when test="count($IRS5471Data/ForeignEntityIdentificationGrp) = 1">
												<span style="text-align:left; width: 59.5mm; padding-left:7mm;">
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
												<!-- ************************************************************  -->
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" valign="top" style="border-color:black;border-bottom:0;width:59.5mm;height: 9.5mm;border-right:0;">
										<span style="width:59.5mm;text-align:left;padding-left:1mm;">
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
								<!--<tr>-->
								<span class="styTableCell" style="float:left;vertical-align:top;width: 114mm;text-align:left;border:none;">
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
								<span class="styTableCell" style="text-align:left;width: 70mm;height: 9.5mm;
							border-left-width:1px;border-right:0;border-bottom:0;">
									<span style="width:1mm;"/>
									<b>b(1)</b>
									<span style="padding-left:1mm;">Employer identification number, if any
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
									<span class="styTableCell" style="border:none;border-top:1px solid black;padding-left:1mm;width:70mm;">
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
								<div class="styIRS5471TableContainer" id="FEIdctn" style="height:9mm;border-left:1px solid black;border-top:0;width:70mm;">
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
															<td class="styTableCell" style="vertical-align:bottom;height:9mm;border-color:black;border-right:0;">
																<span style="font-size:6pt;text-align:left;width: 64mm; padding-left:1mm;">
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
								<span class="styTableCell" style="float:left;width:114mm;border:none;">
</span>
								<span class="styTableCell" style="text-align:left;padding-left:1mm;height:9mm;border:none;border-left:1px solid black;width:70mm;">
									<b>c</b>
									<span class="styNBSP"/>Country under whose laws incorporated
										<br/>
									<br/>
									<span style="text-align:left; width: 64mm; padding-left:7mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/CountryUnderWhoseLawsIncCd"/>
										</xsl:call-template>
									</span>
								</span>
							</div>
							<xsl:call-template name="SetInitialDynamicTableHeight">
								<xsl:with-param name="TargetNode" select="$IRS5471Data/ForeignEntityIdentificationGrp"/>
								<xsl:with-param name="containerHeight" select="1"/>
								<xsl:with-param name="headerHeight" select="0"/>
								<xsl:with-param name="containerID" select=" 'FEIdctn' "/>
							</xsl:call-template>
						</xsl:when>
					</xsl:choose>
					<!-- ************************************************************************************************************************************** -->
					<!-- **********************************************END**************************************************************************************** -->
					<!--   END BLOCK 1A, 1B, 1C   -->
					<!--   BEGIN BLOCK 1D, 1E, 1F, 1G, 1H   -->
					<table class="styTable" cellspacing="0" style="width:187mm;border-top:1px solid black;font-size: 7pt">
						<tr>
							<td class="styTableCell" valign="top" style="width: 32mm; height: 10mm; border-color: black;         border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px;">
								<span style="width:32mm;text-align:left;padding-left:1mm;">
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
							<td class="styTableCell" valign="top" style="width: 42mm; height: 10mm; border-color: black; border-bottom-width: 0px">
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
							<td class="styTableCell" valign="top" style="width: 39mm; height: 10mm; border-color: black; border-bottom-width: 0px">
								<span style="width:39mm;text-align:left;padding-left:1mm;">
									<b>f</b>
									<span style="width: 1mm"/>Principal business activity
	              </span>
								<span style="text-align: center; width: 39mm">code number<br/>
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
							<td class="styTableCell" valign="top" style="width: 41mm; height: 10mm; border-color: black; border-bottom-width: 0px">
								<span style="width:41mm;text-align:left;padding-left:1mm;">
									<b>g</b>
									<span style="width: 1mm"/>Principal business activity
	              </span>
								<br/>
								<div style="width:100%; margin-left:3.5mm; text-align:left;padding-top:3mm;padding-bottom:0mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/PrincipalBusinessActivityDesc"/>
									</xsl:call-template>
								</div>
							</td>
							<td class="styTableCell" valign="top" style="width: 30mm; height: 10mm; border-color: black;border-bottom-width: 0px; border-right-width: 0px">
								<span style="width:30mm;text-align:left;padding-left:1mm;">
									<b>h</b>
									<span style="width: 1mm"/>Functional currency
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
						<span style="width:1.5mm;"/> Provide the following information for the foreign corporation's accounting period stated above.</div>
					<!--   END LINE 2   -->
					<!-- BEGIN BLOCK 2A, 2B   -->
					<table class="styTable" cellspacing="0" style="width:187mm;font-size:7pt;">
						<tr>
							<th scope="col" class="styTableCellHeader " style="border-color:black;height: 2mm;border-bottom-width: 0px; margin-left: .25mm; width: 102mm" valign="top">
								<span style="width:102mm;padding-left:1.5mm;text-align:left;">
                  a<span style="width: 1mm"/>
									<span class="styNormalText">Name, address, and identifying number of branch office or agent (if any) in
										<span style="width: 3mm"/>the United States</span>
								</span>
							</th>
							<th scope="col" class="styTableCellHeader " style="border-color: black;height: 2mm;width: 70mm;border-right-width: 0px" colspan="2">
								<span style="width:70mm;padding-left:1.5mm;text-align:left;">
                  b<span style="width: 1mm"/>
									<span class="styNormalText">If a U.S. income tax return was filed, enter:</span>
								</span>
							</th>
						</tr>
						<tr>
							<td class="styLNAmountBoxNBB" style="text-align: left; border-left-width: 0px;border-right-width: 1px; width: 102mm;" valign="top" rowspan="2">
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
							<th scope="col" class="styTableCellHeader " style="font-weight: normal; border-color: black; width: 70mm">
								<i>(i)</i>
								<span style="width:1mm"/>Taxable income or (loss)</th>
							<th scope="col" class="styTableCellHeader " style="font-weight: normal; border-color: black;border-right-width: 0px; width: 70mm">
								<i>(ii)</i>
								<span style="width: 1mm"/>U.S. income tax paid (after all credits)</th>
						</tr>
						<tr>
							<td class="styLNAmountBoxNBB" valign="top" style="height: 8mm; border-left-width: 0px; border-right-width: 1px; width: 70mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471Data/TaxableIncomeOrNetLossAmt"/>
								</xsl:call-template>
								<span class="styTableCellPad"/>
							</td>
							<td class="styLNAmountBoxNBB" valign="top" style="border-left-width: 0px;height: 8mm; width: 70mm">
								<span style="float:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/USIncomeTaxPaidAfterCrAmt"/>
									</xsl:call-template>
								</span>
								<span class="styTableCellPad"/>
								<span style="float:right;padding-top:2mm;vertical-align:bottom;">
									<xsl:call-template name="SetDynamicTableToggleButton">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonWithRecordsCustody"/>
										<xsl:with-param name="containerHeight" select="1"/>
										<xsl:with-param name="headerHeight" select="1"/>
										<xsl:with-param name="containerID" select=" 'PWRCctn' "/>
									</xsl:call-template>
								</span>
							</td>
						</tr>
					</table>
					<!--   END BLOCK 2A, 2B   -->
					<!-- *********************************************************************************************** -->
					<!-- *********************************************************************************************** -->
					<!-- Adding parent div to the elements a and b of line 2.  If not when the height of the line e is less than the c and d, then this table will appear next to the line e -->
					<div class="styBB" style="width:187mm;float:none;clear:both;border-top:1px solid black;">
						<div class="styBB" style="width:102mm;border-bottom:0;clear:none;">
							<div class="styLNLeftNumBox" style="height:4.5mm;  font-size: 7pt;padding-top:0mm;">c</div>
							<!-- Box 2c -->
							<div class="styGenericDiv" style="font-size:7pt; ">
				Name and address of foreign corporation's statutory or resident agent in country of incorporation<br/>
								<br/>
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
							</div>
						</div>
						<!-- Box 2d -->
						<xsl:if test="($Print != $Separated) or (count($IRS5471Data/PersonWithRecordsCustody) = 1)">
							<span id="PWRCctn" style="width:84mm;border-left:1px solid black;" class="styIRS5471TableContainer">
								<xsl:call-template name="SetInitialState"/>
								<table class="styTable" cellspacing="0" name="PWRCTable" id="PWRCTable">
									<thead>
										<tr style="border-left:1px solid black;">
											<th class="styTableCellHeader" style="width:8mm;border:none;text-align:left;vertical-align:top;
											padding-left:1mm;font-size:7pt;padding-top:0mm;" scope="col">
											d
											</th>
											<th class="styTableCellHeader" style="width:76mm;border:none;font-weight:normal;text-align:left;
											vertical-align:top;font-size:7pt;" scope="col">
											Name and address (including corporate
											department, if applicable) of person (or persons)
											with custody of the books and records of the
											foreign corporation, and the location of such
											books and records, if different <br/>
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
												<td class="styTableCell" style="width:8mm;vertical-align:top;text-align:left;
												border:none;border-bottom:1px solid black;">
													<xsl:if test="position()=last()">
														<xsl:attribute name="style">width:8mm;vertical-align:top;text-align:left;border:none;</xsl:attribute>
													</xsl:if>
													<span style="width:4px;"/>
												</td>
												<td class="styTableCell" style="width:76mm;text-align:left;vertical-align:top;
												border:none;font-size:7pt;border-bottom:1px solid black;">
													<xsl:if test="position()=last()">
														<xsl:attribute name="style">width:84mm;text-align:left;vertical-align:top;
												border:none;font-size:7pt;</xsl:attribute>
													</xsl:if>
													<span style="font-family:verdana;">
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
													</span>
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
							</span>
							<xsl:call-template name="SetInitialDynamicTableHeight">
								<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonWithRecordsCustody"/>
								<xsl:with-param name="containerHeight" select="1"/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerID" select=" 'PWRCctn' "/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="(($Print = $Separated) and (count($IRS5471Data/PersonWithRecordsCustody) &gt; 1))">
							<span style="border-left:1px solid black;height:25mm;">
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
					<!-- *********************************************************************************************** -->
					<!-- *********************************************************************************************** -->
					<!--   END BLOCK 2C, 2D   -->
					<!--   BEGIN SCHEDULE A HEADER   -->
					<div class="styBB" style="width:187mm; border-top: 1px solid black;">
						<div class="styPartName" style="width: 22mm;">Schedule A</div>
						<div class="styPartDesc" style="width: 160mm;">Stock of the Foreign Corporation</div>
						<span style="width:5mm;text-align:right;float:right;clear:none">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$IRS5471AData/StockOfTheForeignCorporation"/>
								<xsl:with-param name="containerHeight" select="4"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" 'SCctn' "/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END SCHEDULE A HEADER   -->
					<!--  BEGIN A, B, i and ii   -->
					<div class="styIRS5471TableContainer" id="SCctn" style="height: 22mm">
						<!--print logic-->
						<xsl:call-template name="SetInitialState"/>
						<!--end-->
						<table class="styTable" cellspacing="0" id="SCTable" style="font-size: 7pt">
							<thead class="styTableThead">
								<tr>
									<th scope="col" class="styTableCellHeader" style="border-color:black; width: 90mm; text-align: center" rowspan="2">
                    (a)<span class="styNormalText"> Description of each class of stock</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="border-color:black; width: 96mm; text-align: center; border-right-width: 0px;" colspan="2">
                    (b)<span class="styNormalText"> Number of shares issued and outstanding</span>
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
					<!--BEGIN FOOTER-->
					<div style="width:187mm">
						<div style="float: left; clear: none;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see instructions.</span>
						</div>
						<div style="float:right">
    Cat. No. 49958V 
    <span style="width:90px"/>
    Form <span class="styBoldText" style="font-size: 8pt">5471</span> (Rev. 12-2012)
  </div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
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
					<div class="styBB" style="width:187mm; border-top: 1px solid black;">
						<div class="styPartName" style="width: 22mm;height:3.75mm">Schedule B</div>
						<div class="styPartDesc" style="width: 160mm;">
                	U.S. Shareholders of Foreign Corporation <span style="font-size: 8pt; width: 80mm; font-weight: normal">(see instructions.)</span>
						</div>
						<span style="width:5mm;text-align:right;float:right; clear: none">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$IRS5471BData/USShareholdersOfForeignCorp"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="containerID" select=" 'FSctn' "/>
							</xsl:call-template>
						</span>
						<!--   END SCHEDULE B HEADER   -->
						<!-- take this out later -->
					</div>
					<!--  BEGIN TABLE SCHEDULE B   -->
					<div class="styIRS5471TableContainer" name="FSctn" id="FSctn">
						<!--print logic-->
						<xsl:call-template name="SetInitialState"/>
						<!--end-->
						<table class="styTable" cellspacing="0" name="FSTable" id="FSTable">
							<thead class="styTableThead">
								<tr>
									<th scope="col" class="styTableCell" style="border-color: black; width: 50mm; text-align: center;">
    					(a)<span class="styNormalText"> Name, address, and identifying number of shareholder</span>
									</th>
									<th scope="col" class="styTableCell" style="border-color: black; width: 50mm; text-align:left;">
                    (b)<span class="styNormalText"> Description of each class of stock held by shareholder <b>Note:</b>
											<i> This description should match the corresponding description entered in Schedule A, column (a).</i>
										</span>
									</th>
									<th scope="col" class="styTableCell" style="border-color: black; width: 29mm; text-align: left;">
                    (c)<span class="styNormalText"> Number of shares held at beginning of annual accounting period</span>
									</th>
									<th scope="col" class="styTableCell" style="border-color: black; width: 29mm; text-align: left; border-right-width: 1px">
                    (d)<span class="styNormalText"> Number of shares held at end of annual accounting period</span>
									</th>
									<th scope="col" class="styTableCell" style="border-color: black; width: 26mm; text-align: left; border-right-width: 0px">
                    (e)<span class="styNormalText"> Pro rata share of subpart F income (enter as a percentage)</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS5471BData/USShareholdersOfForeignCorp">
									<xsl:variable name="FSRowCount" select="count(ForeignCorporationStocks)"/>
									<!--  <xsl:variable name="testCount" select="count($IRS5471BData/USShareholdersOfForeignCorp[count(ForeignCorporationStocks) &gt; 5])"/> -->
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
														<td class="styTableCell" style="text-align:right;border-color: black;text-size:4mm; width: 29mm;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="AnnualAcctPeriodBeginShareCnt"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</td>
														<td class="styTableCell" style="text-align:right;border-color: black; text-size:5mm;width: 29mm;border-right-width: 1px">
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
														<td class="styTableCell" style="text-align:right;text-size:5mm;border-color: black; width: 29mm;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="AnnualAcctPeriodBeginShareCnt"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</td>
														<td class="styTableCell" style="text-align:right;text-size:5mm;border-color: black; width: 29mm;border-right-width: 1px">
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
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$IRS5471BData/USShareholdersOfForeignCorp"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="containerID" select=" 'FSctn' "/>
					</xsl:call-template>
					<!--  END SCHEDULE B   -->
					<!--  BEGIN SCHEDULE C   -->
					<table class="styTable" style="width:187mm;font-size: 7pt" cellspacing="0">
						<thead>
							<div class="styBB" style="width:187mm;">
								<div class="styPartName" style="width: 22mm;">Schedule C</div>
								<div class="styPartDesc" style="width: 165mm;">Income Statement <span style="font-size: 8pt; width: 80mm; font-weight: normal">(see instructions.)</span>
								</div>
							</div>
							<tr scope="col">
								<th scope="col" colspan="2" class="styBoldText" style="width: 4mm; border-style: solid; border-color: black;  border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px; padding-bottom:10mm;vertical-align:top; font-size: 8pt">Important:</th>
								<th scope="col" colspan="6" class="styItalicText" style="padding-left: 1mm; border-top-width: 0px; width: 177mm;border-style: solid; border-color: black;  border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px; font-size: 8pt">
									<span style="font-weight:normal;width: 160mm">
               Report all information in functional currency in accordance with U.S. GAAP.  Also, report each amount in
              U.S. dollars translated from functional currency (using GAAP translation rules). However, if the
              functional currency is the U.S. dollar, complete only the U.S. Dollars column.  See instructions for special
               rules for DASTM corporations.
            </span>
								</th>
							</tr>
							<tr>
								<th scope="col" style="width: 6mm; border-color: black; border-style: solid; border-right-width: 1px; border-left-width: 0px; border-bottom-width: 0px; border-top-width: 0px">
									<span style="width:1px;"/>
								</th>
								<th scope="col" colspan="2">
									<span style="width: 1px"/>
								</th>
								<th scope="col" class="styLNRightNumBox">
									<span style="width: 1mm"/>
								</th>
								<th class="styLNAmountBox" scope="col" style="width: 39mm; text-align: center">Functional Currency</th>
								<th class="styLNAmountBox" scope="col" style="width: 39mm; text-align:center">U.S. Dollars</th>
							</tr>
						</thead>
						<tfoot/>
						<tbody valign="top">
							<!--   BEGIN LINE 1   -->
							<!--   BEGIN LINE 1A   -->
							<tr>
								<!-- this is the place i think -->
								<td class="styIRS5471Img" rowspan="12" style="width:4mm;padding-top:20mm; border-bottom-width: 1px">
									<img src="{$ImagePath}/5471_Income.gif" alt="VerticalIncome"/>
								</td>
								<td>
									<span class="styLNLeftNumBox" style="padding-left: 2.25mm">1a</span>
								</td>
								<td class="styLNDesc" style="width:89mm;">
									<span style="float:left">
Gross receipts or sales
</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
								</td>
								<td class="styLNRightNumBox">1a</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignGrossReceiptsOrSalesAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USGrossReceiptsOrSalesAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--   END LINE 1A   -->
							<!--   BEGIN LINE 1B   -->
							<tr>
								<td>
									<span class="styLNLeftNumBox" style="padding-left: 4mm">b</span>
								</td>
								<td class="styLNDesc" style="width:89mm;">
									<span style="float:left">
Returns and allowances
</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
								</td>
								<td class="styLNRightNumBox">1b</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignReturnsAndAllowancesAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USReturnsAndAllowancesAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--   END LINE 1B   -->
							<!--   BEGIN LINE 1C   -->
							<tr>
								<td>
									<span class="styLNLeftNumBox" style="padding-left: 4mm">c</span>
								</td>
								<td class="styLNDesc" style="width:89mm;">
									<span style="float:left">
Subtract line 1b from line 1a
</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
								</td>
								<td class="styLNRightNumBox">1c</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignNetGrossReceiptsAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USNetGrossReceiptsAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--   END LINE 1C   -->
							<!--   END LINE 1   -->
							<!--   BEGIN LINE 2   -->
							<tr>
								<td>
									<span class="styLNLeftNumBoxSD">2</span>
								</td>
								<td class="styLNDesc" style="width:89mm;">
									<span style="float:left">
Cost of goods sold
</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
								</td>
								<td class="styLNRightNumBox">2</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignCostOfGoodsSoldAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USCostOfGoodsSoldAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--   END LINE 2   -->
							<!--   BEGIN LINE 3   -->
							<tr>
								<td>
									<span class="styLNLeftNumBoxSD">3</span>
								</td>
								<td class="styLNDesc" style="width:89mm;">
									<span style="float:left">
Gross profit (subtract line 2 from line 1c)
</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
								</td>
								<td class="styLNRightNumBox">3</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignGrossProfitAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USGrossProfitAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--   END LINE 3   -->
							<!--   BEGIN LINE 4   -->
							<tr>
								<td>
									<span class="styLNLeftNumBoxSD">4</span>
								</td>
								<td class="styLNDesc" style="width:89mm;">
									<span style="float:left">
Dividends
</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
								</td>
								<td class="styLNRightNumBox">4</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignDividendsAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USDividendsAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 4   -->
							<!--   BEGIN LINE 5   -->
							<tr>
								<td>
									<span class="styLNLeftNumBoxSD">5</span>
								</td>
								<td class="styLNDesc" style="width:89mm;">
									<span style="float:left">
Interest
</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
								</td>
								<td class="styLNRightNumBox">5</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignInterestIncomeAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USInterestIncomeAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 5   -->
							<!--   BEGIN LINE 6a   -->
							<tr>
								<td>
									<span class="styLNLeftNumBox" style="padding-left: 2.25mm">6a</span>
								</td>
								<td class="styLNDesc" style="width:89mm;">
									<span style="float:left">
Gross rents
</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
								</td>
								<td class="styLNRightNumBox">6a</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignGrossRentsAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USGrossRentsAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 6a   -->
							<!--   BEGIN LINE 6b   -->
							<tr>
								<td>
									<span class="styLNLeftNumBox" style="padding-left: 4mm">b</span>
								</td>
								<td class="styLNDesc" style="width:89mm;">
									<span style="float:left">
Gross royalties and license fees
</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
								</td>
								<td class="styLNRightNumBox">6b</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/FrgnGrRoyaltiesAndLcnsFeesAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USGrRoyaltiesAndLcnsFeesAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 6b   -->
							<!--   BEGIN LINE 7   -->
							<tr>
								<td>
									<span class="styLNLeftNumBoxSD">7</span>
								</td>
								<td class="styLNDesc" style="width:89mm;">
									<span style="float:left">
Net gain or (loss) on sale of capital assets
</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
								</td>
								<td class="styLNRightNumBox">7</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/FrgnNetGainOrLossSaleCapAstAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USNetGainOrLossSaleCapAstAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 7   -->
							<!--   BEGIN LINE 8   -->
							<tr>
								<td>
									<span class="styLNLeftNumBoxSD">8</span>
								</td>
								<td class="styLNDesc" style="width:89mm;">
									<span style="float:left">
Other income (attach statement)
</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
								</td>
								<td class="styLNRightNumBox">8</td>
								<td class="styLNAmountBox" style="width:39mm;">
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
								</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USOtherIncomeAmt"/>
									</xsl:call-template>
									<span style="width:1px"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USOtherIncomeAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 8   -->
							<!--   BEGIN LINE 9   -->
							<tr>
								<td style="border-color:black; border-style:solid; border-bottom-width: 1px; border-top-width: 0px; border-left-width: 0px; border-right-width: 0px">
									<span class="styLNLeftNumBoxSD">9</span>
								</td>
								<td class="styLNDesc" style="border-color: black; border-style:solid; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; width:89mm;; border-bottom-width: 1px">
									<span style="float:left">
Total income (add lines 3 through 8)
</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
								</td>
								<td class="styLNRightNumBox">9</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignTotalIncomeAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USTotalIncomeAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 9   -->
							<!--   BEGIN LINE 10   -->
							<tr>
								<!-- this is the place II -->
								<td class="styIRS5471Img" rowspan="10" style="padding-top:14mm; border-bottom-width: 1px">
									<img src="{$ImagePath}/5471_Deductions.gif" alt="VerticalDeductions"/>
								</td>
								<td>
									<span class="styLNLeftNumBox">10</span>
								</td>
								<td class="styLNDesc" style="width:89mm;">
									<span style="float:left">
Compensation not deducted elsewhere
</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
								</td>
								<td class="styLNRightNumBox">10</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignCompensationNotDedAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USCompensationNotDedAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 10   -->
							<!--   BEGIN LINE 11a   -->
							<tr>
								<td>
									<span class="styLNLeftNumBox">11a</span>
								</td>
								<td class="styLNDesc" style="width:89mm;">
									<span style="float:left">
Rents
</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
								</td>
								<td class="styLNRightNumBox">11a</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignRentsAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USRentsAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 11a   -->
							<!--   BEGIN LINE 11b   -->
							<tr>
								<td>
									<span class="styLNLeftNumBoxSD" style="padding-left:5mm;">b</span>
								</td>
								<td class="styLNDesc" style="width:89mm;">
									<span style="float:left">
Royalties and license fees
</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
								</td>
								<td class="styLNRightNumBox">11b</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/FrgnRoyaltiesAndLcnsFeesAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USRoyaltiesAndLcnsFeesAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 11b   -->
							<!--   BEGIN LINE 12   -->
							<tr>
								<td>
									<span class="styLNLeftNumBox">12</span>
								</td>
								<td class="styLNDesc" style="width:89mm;">
									<span style="float:left">
Interest
</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
								</td>
								<td class="styLNRightNumBox">12</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignInterestDeductionAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USInterestDeductionAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 12   -->
							<!--   BEGIN LINE 13   -->
							<tr>
								<td>
									<span class="styLNLeftNumBox">13</span>
								</td>
								<td class="styLNDesc" style="width:89mm;">
									<span style="float:left">
Depreciation not deducted elsewhere
</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
								</td>
								<td class="styLNRightNumBox">13</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignDepreciationNotDedAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USDepreciationNotDedAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 13   -->
							<!--   BEGIN LINE 14  -->
							<tr>
								<td>
									<span class="styLNLeftNumBox">14</span>
								</td>
								<td class="styLNDesc" style="width:89mm;">
									<span style="float:left">
Depletion
</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
								</td>
								<td class="styLNRightNumBox">14</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignDepletionAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USDepletionAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 14   -->
							<!--   BEGIN LINE 15   -->
							<tr>
								<td>
									<span class="styLNLeftNumBox">15</span>
								</td>
								<td class="styLNDesc" style="width:89mm;">
								
Taxes (exclude provision for income, war profits, and excess</td>
								<td class="styLNRightNumBox" style="border-bottom-width: 0px">
									<span style="width: 1px"/>
								</td>
								<td class="styLNAmountBox" style="width:39mm; border-bottom-width: 0px">
									<span style="width: 1px"/>
								</td>
								<td class="styLNAmountBox" style="width:39mm; border-bottom-width: 0px; width:39mm">
									<span style="width: 1px"/>
								</td>
							</tr>
							<tr>
								<td>
									<span class="styLNLeftNumBox">
										<span style="width: 1px"/>
									</span>
								</td>
								<td class="styLNDesc" style="width:89mm;">
									<span style="float:left">
profits  taxes)
</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
								</td>
								<td class="styLNRightNumBox">15</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignTaxesAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USTaxesAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 15   -->
							<!--   BEGIN LINE 16   -->
							<tr>
								<td>
									<span class="styLNLeftNumBox">16</span>
								</td>
								<td class="styLNDesc" style="width:89mm;">
								
Other deductions (attach statement-exclude provision for
 <span style="float:left"> income, war profits, and excess profits taxes)
</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
								</td>
								<td class="styLNRightNumBox">16</td>
								<td class="styLNAmountBox" style="padding-top: 3mm; width:39mm;">
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignOtherDeductionsAmt"/>
										</xsl:call-template>
									</span>
									<span style="float:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignOtherDeductionsAmt"/>
											<xsl:with-param name="MaxSize" select="17"/>
										</xsl:call-template>
									</span>
								</td>
								<!--<td style="width: 4mm; border-color: black; border-style: solid; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px; padding-top: 3mm">
                  <span style="width: 1px"/>
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$IRS5471CData/USOtherDeductions"/>
                  </xsl:call-template>
                </td>-->
								<td class="styLNAmountBox" style="padding-top: 3mm; width:39mm;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USOtherDeductionsAmt"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USOtherDeductionsAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 16   -->
							<!--   BEGIN LINE 17   -->
							<tr>
								<td style="border-color:black; border-style:solid; border-bottom-width: 1px; border-top-width: 0px; border-left-width: 0px; border-right-width: 0px">
									<span class="styLNLeftNumBox">17</span>
								</td>
								<td class="styLNDesc" style="border-color: black; border-style:solid; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; width:89mm;; border-bottom-width: 1px">
									<span style="float:left">
Total deductions (add lines 10 through 16)
</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
								</td>
								<td class="styLNRightNumBox">17</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignTotalDeductionsAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USTotalDeductionsAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 17   -->
							<!--   BEGIN LINE 18   -->
							<tr>
								<td class="styIRS5471Img" rowspan="6" style="padding-top:8mm;">
									<img src="{$ImagePath}/5471_NetIncome.gif" alt="VerticalNetIncome"/>
								</td>
								<td>
									<span class="styLNLeftNumBox">18</span>
								</td>
								<td class="styLNDesc" style="width:89mm;">Net income or (loss) before extraordinary items, prior period</td>
								<td class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px">
									<span style="width: 1px"/>
								</td>
								<td class="styLNAmountBox" style="width:39mm;background-color:lightgrey; border-bottom-width: 0px">
									<span style="width: 1px"/>
								</td>
								<td class="styLNAmountBox" style="border-bottom-width: 0px; background-color: lightgrey; width:39mm">
									<span style="width: 1px"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox">
									<span style="width: 1px"/>
								</td>
								<td class="styLNDesc" style="width:89mm;">adjustments, and the provision for income, war profits, and</td>
								<td class="styLNRightNumBox" style="background-color:lightgrey; border-bottom-width: 0px">
									<span style="width: 1px"/>
								</td>
								<td class="styLNAmountBox" style="width:39mm; background-color:lightgrey; border-bottom-width: 0px">
									<span style="width: 1px"/>
								</td>
								<td class="styLNAmountBox" style="border-bottom-width: 0px; background-color: lightgrey; width:39mm">
									<span style="width: 1px"/>
								</td>
							</tr>
							<tr>
								<td style="width: 2mm">
									<span style="width: 1px"/>
								</td>
								<td class="styLNDesc" style="width:89mm;">
									<span style="float:left">
excess profits taxes (subtract line 17 from line 9)
</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
								</td>
								<td class="styLNRightNumBox">18</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/FrgnTotalIncomeMinusTotDedAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" style="width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USTotalIncomeMinusTotDedAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 18   -->
							<!--   BEGIN LINE 19   -->
							<tr>
								<td>
									<span class="styLNLeftNumBox">19</span>
								</td>
								<td class="styLNDesc" style="width:89mm;">Extraordinary items and prior period adjustments (see
								<span style="float:left">
								 instructions)
								</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
								</td>
								<td class="styLNRightNumBox">19</td>
								<td class="styLNAmountBox" style="width:39mm;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignExtraordinaryItemsAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" style="width:39mm;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USExtraordinaryItemsAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 19  -->
							<!--   BEGIN LINE 20   -->
							<tr>
								<td>
									<span class="styLNLeftNumBox">20</span>
								</td>
								<td class="styLNDesc" style="width:89mm;">
								
Provision for income, war profits, and excess profits taxes (see 
<span style="float:left">instructions)
</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
								</td>
								<td class="styLNRightNumBox" style="padding-top:4mm">20</td>
								<td class="styLNAmountBox" style="padding-top: 4mm;width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignProvisionForIncomeAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" style="padding-top:4mm;width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USProvisionForIncomeAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 20  -->
							<!--   BEGIN LINE 21   -->
							<tr>
								<td>
									<span class="styLNLeftNumBox">21</span>
								</td>
								<td class="styLNDesc" style="width:89mm;">
								Current year net income or (loss) per books (combine lines 18
								 <span style="float:left">
through 20)
</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
								</td>
								<td class="styLNRightNumBox" style="border-bottom-width: 0px; padding-top:4mm">21</td>
								<td class="styLNAmountBox" style="padding-top:4mm; width:39mm;border-bottom-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignCYNetIncomePerBooksAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" style="padding-top:4mm; border-bottom-width: 0px; width:39mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USCYNetIncomePerBooksAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--  END LINE 21 -->
						</tbody>
					</table>
					<!--BEGIN FOOTER-->
					<div style="width:187mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 1px; border-bottom-width: 0px">
						<div style="float:right">
    Form <span class="styBoldText" style="font-size: 8pt">5471</span> (Rev. 12-2012)
  </div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styGenericDiv" style="width:187mm">
						<div style="float: left; clear: none">Form 5471 (Rev. 12-2012)</div>
						<div style="float:right">
    Page <span class="styBoldText" style="font-size: 8pt">3</span>
						</div>
					</div>
					<!--END HEADER-->
					<!--   BEGIN SCHEDULE E   -->
					<!--   BEGIN SCHEDULE E HEADER   -->
					<div class="styBB" style="width:187mm; border-top: 1px solid black;">
						<div class="styPartName" style="width: 22mm; height:3.75mm;'">Schedule E</div>
						<div class="styPartDesc" style="width: 158mm;">
              Income, War Profits, and Excess Profits Taxes Paid or Accrued 
              <span style="font-size: 7pt; width: 43mm; font-weight: normal;">(See instructions.)</span>
						</div>
						<span style="width:7mm;text-align:right;float:right; clear: none;">
							<xsl:call-template name="SetTableToggleButton">
								<xsl:with-param name="TargetNode" select="$IRS5471EData/IncomeAndWarProfitsTaxesPaid"/>
								<xsl:with-param name="containerHeight" select="6"/>
								<xsl:with-param name="containerID" select=" 'PActn' "/>
								<xsl:with-param name="imageID" select=" 'PAimg' "/>
								<xsl:with-param name="buttonID" select=" 'PAbtn' "/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END SCHEDULE E HEADER   -->
					<!--  BEGIN A, B, C and D   -->
					<div class="styIRS5471TableContainer" style="height: 39mm;float:left;clear:none;" name="PActn" id="PActn">
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
									<td class="styTableCell" style="border-color:black; width:76mm; text-align: left">
										<span style="width: 2mm"/>
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
												<span style="width: 2mm"/>
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
						<span class="styLNLeftNumBoxSD" style="padding-top:2mm;">8</span>
						<span class="styLNDesc" style="border-right-width:0px;width:146.5mm;padding-top:2mm;">
							<span style="float:left">Total
						
</span>
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
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styPartName" style="border-top-width:0px;width: 21mm">Schedule F</div>
						<div class="styPartDesc" style="width: 80mm">Balance Sheet</div>
					</div>
					<div class="styGenericDiv" style="width: 187mmm; font-size: 8pt">
						<span class="styBoldText">Important:</span>
						<span class="styItalicText" style="width: 160mm; padding-left: 2mm"> Report all amounts in U.S. dollars prepared and translated in accordance with U.S. GAAP.  See</span>
					</div>
					<div class="styBB" style="width: 187mm; font-size: 8pt">
						<span class="styItalicText" style="width: 149mm">instructions for an exception for DASTM corporations.</span>
					</div>
					<!--   END SCHEDULE F HEADER   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="width:108mm;font-size:8pt;height:11mm;text-align:center;        border-color:black;border-style:solid;border-bottom-width:1px;border-top-width:0;border-left-width:0;border-right-width:0;">
							<b>
								<br/>Assets</b>
						</span>
						<span class="styLNRightNumBox" style="height: 11mm;"/>
						<span class="styLNAmountBox" style="height: 11mm; text-align: center; width: 34mm">
							<b>(a)</b>
							<br/>Beginning of annual<br/>accounting period</span>
						<span class="styLNAmountBox" style="height: 11mm; text-align: center; width: 37mm">
							<b>(b)</b>
							<br/>End of annual<br/>accounting period</span>
					</div>
					<!--   BEGIN LINE 1   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">1</span>
						<span class="styLNDesc" style="width:100mm">
							<span style="float:left">
Cash
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>
						</span>
						<span class="styLNRightNumBox">1</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdCashAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdCashAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 1   -->
					<!--   BEGIN LINE 2   -->
					<!--   BEGIN LINE 2A   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox" style="padding-left: 2.25mm">2a</span>
						<span class="styLNDesc" style="width: 100mm">
							<span style="float:left">
Trade notes and accounts receivable
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
						</span>
						<span class="styLNRightNumBox">2a</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdTradeNotesAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdTradeNotesAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 2A   -->
					<!--   BEGIN LINE 2B   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox" style="padding-left: 4mm">b</span>
						<span class="styLNDesc" style="width: 100mm">
							<span style="float:left">
Less allowance for bad debts
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
						</span>
						<span class="styLNRightNumBox">2b</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdBadDebtAllwncAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdBadDebtAllwncAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 2B   -->
					<!--   END LINE 2   -->
					<!--   BEGIN LINE 3   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">3</span>
						<span class="styLNDesc" style="width: 100mm">
							<span style="float:left">
Inventories
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.....................</span>
						</span>
						<span class="styLNRightNumBox">3</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdInventoriesAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdInventoriesAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 3   -->
					<!--   BEGIN LINE 4   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">4</span>
						<span class="styLNDesc" style="width: 100mm">
							<span style="float:left">
Other current assets (attach statement)
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
						</span>
						<span class="styLNRightNumBox" style="height: 4.7mm">4</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<span style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOtherCurrAssetsAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOtherCurrAssetsAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 37mm">
							<span style="float:left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOtherCurrAssetsAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOtherCurrAssetsAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  END LINE 4   -->
					<!--   BEGIN LINE 5   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">5</span>
						<span class="styLNDesc" style="width: 100mm">
							<span style="float:left">
Loans to shareholders and other related persons
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
						</span>
						<span class="styLNRightNumBox">5</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdLoansToShrAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdLoansToShrAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  END LINE 5   -->
					<!--   BEGIN LINE 6   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">6</span>
						<span class="styLNDesc" style="width: 100mm">
							<span style="float:left">
Investment in subsidiaries (attach statement)
   </span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
						</span>
						<span class="styLNRightNumBox" style="height: 4.7mm">6</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<span style="float:left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdInvstSubsidiaryAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdInvstSubsidiaryAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 37mm">
							<span style="float:left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdInvstSubsidiaryAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdInvstSubsidiaryAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  END LINE 6   -->
					<!--   BEGIN LINE 7   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">7</span>
						<span class="styLNDesc" style="width: 100mm">
							<span style="float:left">
Other investments (attach statement)
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
						</span>
						<span class="styLNRightNumBox" style="height: 4.7mm">7</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<span style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOthInvestmentsAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOthInvestmentsAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 37mm">
							<span style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOthInvestmentsAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOthInvestmentsAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  END LINE 7   -->
					<!--   BEGIN LINE 8   -->
					<!--   BEGIN LINE 8A   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox" style="padding-left: 2.25mm">8a</span>
						<span class="styLNDesc" style="width: 100mm">
							<span style="float:left">
Buildings and other depreciable assets
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
						</span>
						<span class="styLNRightNumBox" style="height: 4.5mm">8a</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdBldgAndOtherAstAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdBldgAndOtherAstAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 8A   -->
					<!--   BEGIN LINE 8B   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox" style="padding-left: 4mm">b</span>
						<span class="styLNDesc" style="width: 100mm">
							<span style="float:left">
Less accumulated depreciation
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
						</span>
						<span class="styLNRightNumBox">8b</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdNetAccumDeprecAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdNetAccumDeprecAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 8B   -->
					<!--  END LINE 8   -->
					<!--   BEGIN LINE 9   -->
					<!--   BEGIN LINE 9A   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox" style="padding-left: 2.25mm">9a</span>
						<span class="styLNDesc" style="width: 100mm">
							<span style="float:left">
Depletable assets
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
						</span>
						<span class="styLNRightNumBox">9a</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdDepletableAstAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdDepletableAstAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 9A   -->
					<!--   BEGIN LINE 9B   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox" style="padding-left: 4mm">b</span>
						<span class="styLNDesc" style="width: 100mm">
							<span style="float:left">
Less accumulated depletion
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
						</span>
						<span class="styLNRightNumBox">9b</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdNetAccumDpltnAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdNetAccumDpltnAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 9B   -->
					<!--  END LINE 9   -->
					<!--   BEGIN LINE 10   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox">10</span>
						<span class="styLNDesc" style="width: 100mm">
							<span style="float:left">
Land (net of any amortization)
 </span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
						</span>
						<span class="styLNRightNumBox">10</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdLandAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdLandAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  END LINE 10   -->
					<!--   BEGIN LINE 11   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox">11</span>
						<span class="styLNDesc" style="width: 100mm">
					
Intangible assets:

						</span>
						<span class="styLNRightNumBox" style="border-bottom-width: 0px; height: 4.5mm"/>
						<span class="styLNAmountBox" style="border-bottom-width: 0px; width: 34mm; height: 4.5mm"/>
						<span class="styLNAmountBox" style="border-bottom-width: 0px; width: 37mm; height: 4.5mm"/>
					</div>
					<!--  END LINE 11   -->
					<!--   BEGIN LINE 11A   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox" style="padding-left: 4mm">a</span>
						<span class="styLNDesc" style="width: 100mm">
							<span style="float:left">
Goodwill
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.....................</span>
						</span>
						<span class="styLNRightNumBox">11a</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdGoodwillAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdGoodwillAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 11A   -->
					<!--   BEGIN LINE 11B   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox" style="padding-left: 4mm">b</span>
						<span class="styLNDesc" style="width: 100mm">
							<span style="float:left">
Organization costs
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
						</span>
						<span class="styLNRightNumBox">11b</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOrgCostAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOrgCostAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 11B   -->
					<!--   BEGIN LINE 11C   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox" style="padding-left: 4mm">c</span>
						<span class="styLNDesc" style="width: 100mm">
							<span style="float:left">
Patents, trademarks, and other intangible assets
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
						</span>
						<span class="styLNRightNumBox">11c</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdPatentsOthAstAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdPatentsOthAstAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 11C   -->
					<!--   BEGIN LINE 11D   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox" style="padding-left: 4mm">d</span>
						<span class="styLNDesc" style="width: 100mm">
							<span style="float:left">
Less accumulated amortization for lines 11a, b, and c
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
						</span>
						<span class="styLNRightNumBox">11d</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdNetAccumAmortzAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdNetAccumAmortzAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 11d   -->
					<!--   BEGIN LINE 12   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox">12</span>
						<span class="styLNDesc" style="width: 100mm">
							<span style="float:left">
Other assets (attach statement)
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
						</span>
						<span class="styLNRightNumBox" style="height: 4.7mm">12</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<span style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOtherAssetsAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOtherAssetsAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 37mm">
							<span style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOtherAssetsAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOtherAssetsAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  END LINE 12   -->
					<!--   BEGIN LINE 13   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="width: 108mm"/>
						<span class="styLNRightNumBox" style="border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="border-bottom-width: 0px;width: 34mm"/>
						<span class="styLNAmountBox" style="border-bottom-width: 0px;width: 37mm"/>
					</div>
					<div class="styBB" style="width: 187mm">
						<span class="styLNLeftNumBox">13</span>
						<span class="styLNDesc" style="width: 100mm">
							<span style="float:left">
Total assets
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
						</span>
						<span class="styLNRightNumBox" style="border-bottom-width: 0px">13</span>
						<span class="styLNAmountBox" style="border-bottom-width: 0px;width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdTotalAssetsAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="border-bottom-width: 0px;width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdTotalAssetsAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 13   -->
					<!--   END LINE 1-13   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="width: 108mm; height: 10mm; font-size: 8pt; text-align: center">
							<b>Liabilities and Shareholders' Equity</b>
						</span>
						<span class="styLNRightNumBox" style="height: 10mm; background-color: ligthgrey"/>
						<span class="styLNAmountBox" style="width: 34mm; height: 10mm; background-color: lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="width: 37mm; height: 10mm; border-bottom-width: 0px; background-color: lightgrey"/>
					</div>
					<!--   BEGIN LINE 14   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox">14</span>
						<span class="styLNDesc" style="width: 100mm">
							<span style="float:left">
Accounts payable
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
						</span>
						<span class="styLNRightNumBox">14</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdAccountsPayableAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdAccountsPayableAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  END LINE 14   -->
					<!--   BEGIN LINE 15   -->
					<div class="styGenericDiv" style="width: 187mm;">
						<span class="styLNLeftNumBox">15</span>
						<span class="styLNDesc" style="width: 100mm">
							<span style="float:left">
Other current liabilities (attach statement)
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
						</span>
						<span class="styLNRightNumBox" style="height: 4.7mm">15</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<span style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOtherCurrLiabAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOtherCurrLiabAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 37mm">
							<span style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOtherCurrLiabAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOtherCurrLiabAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  END LINE 15   -->
					<!--   BEGIN LINE 16   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox">16</span>
						<span class="styLNDesc" style="width: 100mm">
							<span style="float:left">
Loans from shareholders and other related persons
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
						</span>
						<span class="styLNRightNumBox">16</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdLoansFromShrAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdLoansFromShrAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  END LINE 16   -->
					<!--   BEGIN LINE 17   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox">17</span>
						<span class="styLNDesc" style="width: 100mm">
							<span style="float:left">
Other liabilities (attach statement)
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
						</span>
						<span class="styLNRightNumBox" style="height: 4.7mm">17 </span>
						<span class="styLNAmountBox" style="width: 34mm">
							<span style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOthLiabilitiesAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOthLiabilitiesAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 37mm">
							<span style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOthLiabilitiesAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOthLiabilitiesAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  END LINE 17   -->
					<!--   BEGIN LINE 18   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox">18</span>
						<span class="styLNDesc" style="width: 100mm">Capital stock:</span>
						<span class="styLNRightNumBox" style="border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="border-bottom-width: 0px; width: 34mm"/>
						<span class="styLNAmountBox" style="border-bottom-width: 0px; width: 37mm"/>
					</div>
					<!--  END LINE 18   -->
					<!--   BEGIN LINE 18A   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBoxDD">a</span>
						<span class="styLNDesc" style="width: 100mm">
							<span style="float:left">Preferred stock
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
						</span>
						<span class="styLNRightNumBox">18a</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdPreferredStockAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdPreferredStockAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 18A   -->
					<!--   BEGIN LINE 18B   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBoxDD">b</span>
						<span class="styLNDesc" style="width: 100mm">
							<span style="float:left">Common stock
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
						</span>
						<span class="styLNRightNumBox">18b</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdCommonStockAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdCommonStockAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 18B   -->
					<!--   BEGIN LINE 19   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox">19</span>
						<span class="styLNDesc" style="width: 100mm">
							<span style="float:left">
Paid-in or capital surplus (attach reconciliation)
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
						</span>
						<span class="styLNRightNumBox" style="height: 4.7mm">19</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<span style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdPaidInOrSurplusAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdPaidInOrSurplusAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 37mm">
							<span style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdPaidInOrSurplusAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdPaidInOrSurplusAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  END LINE 19   -->
					<!--   BEGIN LINE 20   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox">20</span>
						<span class="styLNDesc" style="width: 100mm">
							<span style="float:left">
Retained earnings
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
						</span>
						<span class="styLNRightNumBox">20</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdRtnEarningsAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdRtnEarningsAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  END LINE 20   -->
					<!--   BEGIN LINE 21   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox">21</span>
						<span class="styLNDesc" style="width: 100mm">
							<span style="float:left">
Less cost of treasury stock
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
						</span>
						<span class="styLNRightNumBox">21</span>
						<span class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdNetCostOfTrStkAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdNetCostOfTrStkAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  END LINE 21   -->
					<!--   BEGIN LINE 22   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="width: 108mm"/>
						<span class="styLNRightNumBox" style="border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="border-bottom-width: 0px; width: 34mm"/>
						<span class="styLNAmountBox" style="border-bottom-width: 0px;width: 37mm"/>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox">22</span>
						<span class="styLNDesc" style="width: 100mm">
							<span style="float:left">
Total liabilities and shareholders' equity
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
						</span>
						<span class="styLNRightNumBox" style="border-bottom-width: 0px">22</span>
						<span class="styLNAmountBox" style="border-bottom-width: 0px; width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdTotLiabShrEqtyAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="border-bottom-width: 0px; width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdTotLiabShrEqtyAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 22   -->
					<!--   END LINE 14-22   -->
					<!--   END SCHEDULE F   -->
					<!--BEGIN FOOTER-->
					<div style="width:187mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 1px; border-bottom-width: 0px">
						<div style="float:right">
    Form <span class="styBoldText" style="font-size: 8pt">5471</span> (Rev. 12-2012)
  </div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styGenericDiv" style="width:187mm">
						<div style="float: left; clear: none">Form 5471 (Rev. 12-2012)</div>
						<div style="float:right">
    Page <span class="styBoldText" style="font-size: 8pt">4</span>
						</div>
					</div>
					<!--END HEADER-->
					<!--   BEGIN SCHEDULE G   -->
					<!--   BEGIN SCHEDULE G HEADER   -->
					<div class="styBB" style="width:187mm; border-top: 1px solid black;">
						<div class="styPartName" style="width: 22mm; float: left;">Schedule G</div>
						<div class="styPartDesc" style="width: 165mm;">
							<span style="width:16px; float: left;"/>Other Information</div>
					</div>
					<!--   END SCHEDULE G HEADER   -->
					<div class="styGenericDiv" style="font-size:8pt">
						<span class="styLNDesc" style="font-size: 8pt; width: 171mm"/>
						<span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/Owns10PctOrMoreFrgnPrtshpInd"/>
									<xsl:with-param name="BackupName">IRS5471Owns10PctOrMoreFrgnPartnership</xsl:with-param>
								</xsl:call-template>
								<b>Yes </b>
							</label>
							<span style="width: 2mm"/>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/Owns10PctOrMoreFrgnPrtshpInd"/>
									<xsl:with-param name="BackupName">IRS5471Owns10PctOrMoreFrgnPartnership</xsl:with-param>
								</xsl:call-template>
								<b>No</b>
							</label>
						</span>
					</div>
					<!--   BEGIN LINE 1   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">1</span>
						<span class="styLNDesc" style="width: 175mm">During the tax year, did the foreign corporation own at least a 10% interest, directly or indirectly, in any foreign </span>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="width: 166mm; margin-left:8mm">
							<span style="float:left">
						partnership?
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/Owns10PctOrMoreFrgnPrtshpInd"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">...................................</span>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/Owns10PctOrMoreFrgnPrtshpInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/Owns10PctOrMoreFrgnPrtshpInd"/>
									<xsl:with-param name="BackupName">IRS5471Owns10PctOrMoreFrgnPartnership</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<span class="styNBSP" style="width: 10px"/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/Owns10PctOrMoreFrgnPrtshpInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/Owns10PctOrMoreFrgnPrtshpInd"/>
									<xsl:with-param name="BackupName">IRS5471Owns10PctOrMoreFrgnPartnership</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="margin-left: 8mm">If "Yes," see the instructions for required statement.</span>
					</div>
					<!--   BEGIN LINE 2   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">2</span>
						<span class="styLNDesc" style="width: 166mm">
							<span style="float:left">
During the tax year, did the foreign corporation own an interest in any trust?
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpOwnsInterestInTrustInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
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
							<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
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
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">3</span>
						<span class="styLNDesc" style="width: 175mm">During the tax year, did the foreign corporation own any foreign entities that were disregarded as entities</span>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="width: 166mm; margin-left: 8mm">
							<span style="float:left">
								separate from their owners under Regulations sections 301.7701-2 and 301.7701-3 (see instructions)?
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpOwnsForeignEntityInd"/>
									<xsl:with-param name="BackupName">IRS5471OwnsAnyForeignEntities</xsl:with-param>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpOwnsForeignEntityInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpOwnsForeignEntityInd"/>
									<xsl:with-param name="BackupName">IRS5471OwnsAnyForeignEntities</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<span class="styNBSP" style="width: 10px"/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpOwnsForeignEntityInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpOwnsForeignEntityInd"/>
									<xsl:with-param name="BackupName">IRS5471OwnsAnyForeignEntities</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<label>
						<xsl:call-template name="PopulateLabelYes">
							<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpOwnsForeignEntityInd"/>
							<xsl:with-param name="BackupName">IRS5471OwnsAnyForeignEntities</xsl:with-param>
						</xsl:call-template>
						<span style="visibility : hidden ;">Yes</span>
					</label>
					<label>
						<xsl:call-template name="PopulateLabelNo">
							<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpOwnsForeignEntityInd"/>
							<xsl:with-param name="BackupName">IRS5471OwnsAnyForeignEntities</xsl:with-param>
						</xsl:call-template>
						<span style="visibility : hidden ;">No</span>
					</label>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="width: 160mm; margin-left: 8mm">If "Yes," you are generally required to attach Form 8858 for each entity (see instructions).</span>
					</div>
					<!--   END LINE 3   -->
					<!--   BEGIN LINE 4   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">4</span>
						<span class="styLNDesc" style="width: 166mm">
							<span style="float:left">
								During the tax year, was the foreign corporation a participant in a cost sharing arrangement?
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpPartcpCostShrInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="alt" class="styCkbox" style="width: 4mm; height: 4mm">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpPartcpCostShrInd"/>
									<xsl:with-param name="BackupName">IRS5471ForeignCorpWasParticipant</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<span class="styNBSP" style="width: 10px"/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpPartcpCostShrInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="alt" class="styCkbox" style="width: 4mm; height: 4mm">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpPartcpCostShrInd"/>
									<xsl:with-param name="BackupName">IRS5471ForeignCorpWasParticipant</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<label>
						<xsl:call-template name="PopulateLabelYes">
							<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpPartcpCostShrInd"/>
							<xsl:with-param name="BackupName">IRS5471ForeignCorpWasParticipantt</xsl:with-param>
						</xsl:call-template>
						<span style="visibility : hidden ;">Yes</span>
					</label>
					<label>
						<xsl:call-template name="PopulateLabelNo">
							<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpPartcpCostShrInd"/>
							<xsl:with-param name="BackupName">IRS5471ForeignCorpWasParticipantt</xsl:with-param>
						</xsl:call-template>
						<span style="visibility : hidden ;">No</span>
					</label>
					<!--   END LINE 4   -->
					<!--   BEGIN LINE 5   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">5</span>
						<span class="styLNDesc" style="width: 166mm">
							<span style="float:left">
								During the tax year, did the foreign corporation become a participant in a cost sharing arrangement?
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpBecamePartcpCostShrInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="alt" class="styCkbox" style="width: 4mm; height: 4mm">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpBecamePartcpCostShrInd"/>
									<xsl:with-param name="BackupName">IRS5471ForeignCorpBecameParticipant</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<span class="styNBSP" style="width: 10px"/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpBecamePartcpCostShrInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="alt" class="styCkbox" style="width: 4mm; height: 4mm">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpBecamePartcpCostShrInd"/>
									<xsl:with-param name="BackupName">IRS5471ForeignCorpBecameParticipant</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<label>
						<xsl:call-template name="PopulateLabelYes">
							<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpBecamePartcpCostShrInd"/>
							<xsl:with-param name="BackupName">IRS5471ForeignCorpBecameParticipant</xsl:with-param>
						</xsl:call-template>
						<span style="visibility : hidden ;">Yes</span>
					</label>
					<label>
						<xsl:call-template name="PopulateLabelNo">
							<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpBecamePartcpCostShrInd"/>
							<xsl:with-param name="BackupName">IRS5471ForeignCorpBecameParticipant</xsl:with-param>
						</xsl:call-template>
						<span style="visibility : hidden ;">No</span>
					</label>
					<!--   END LINE 5   -->
					<!--   BEGIN LINE 6   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">6</span>
						<span class="styLNDesc" style="width: 175mm">During the tax year, did the foreign corporation participate in any reportable transaction as defined in Regulations</span>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="width: 166mm; margin-left:8mm">
							<span style="float:left">
						section 1.6011-4?
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/ReportableTransactionPrtcptInd"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.................................</span>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/ReportableTransactionPrtcptInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="IRS5471PrtcptInReportableTransYes" class="styCkbox" style="width: 4mm; height: 4mm">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/ReportableTransactionPrtcptInd"/>
									<xsl:with-param name="BackupName">IRS5471PrtcptInReportableTrans</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<span class="styNBSP" style="width: 10px"/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/ReportableTransactionPrtcptInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="IRS5471PrtcptInReportableTransNo" class="styCkbox" style="width: 4mm; height: 4mm">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/ReportableTransactionPrtcptInd"/>
									<xsl:with-param name="BackupName">IRS5471PrtcptInReportableTrans</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="margin-left: 8mm">If "Yes," attach Form(s) 8886 if required by Regulations section 1.6011-4(c)(i)(G).</span>
					</div>
					<!--   END LINE 6  -->
					<!--   BEGIN LINE 7   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">7</span>
						<span class="styLNDesc" style="width: 175mm">
						During the tax year, did the foreign corporation pay or accrue any foreign tax that was disqualified for credit under
						</span>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="width: 166mm; margin-left:8mm">
							<span style="float:left">
						 section 901(m)?
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">...................................</span>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnTaxDisqualifiedSec901mInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="IRS5471ForeignCorpPd901TaxYes" class="styCkbox" style="width: 4mm; height: 4mm">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnTaxDisqualifiedSec901mInd"/>
									<xsl:with-param name="BackupName">IRS5471ForeignCorpPd901Tax</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<span class="styNBSP" style="width: 10px"/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnTaxDisqualifiedSec901mInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="IRS5471ForeignCorpPd901TaxNo" class="styCkbox" style="width: 4mm; height: 4mm">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnTaxDisqualifiedSec901mInd"/>
									<xsl:with-param name="BackupName">IRS5471ForeignCorpPd901Tax</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<!--   END LINE 7   -->
					<!--   BEGIN LINE 8   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">8</span>
						<span class="styLNDesc" style="width: 175mm">
						During the tax year, did the foreign corporation pay or accrue foreign taxes to which section 909 applies, or treat foreign taxes
						</span>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="width: 166mm; margin-left:8mm">
							<span style="float:left">
						that were previously suspended under section 909 as no longer suspended?
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/ForeignTaxSection909Ind"/>
							</xsl:call-template>
							<input type="checkbox" alt="IRS5471ForeignCorpPd909TaxYes" class="styCkbox" style="width: 4mm; height: 4mm">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/ForeignTaxSection909Ind"/>
									<xsl:with-param name="BackupName">IRS5471ForeignCorpPd909Tax</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<span class="styNBSP" style="width: 10px"/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/ForeignTaxSection909Ind"/>
							</xsl:call-template>
							<input type="checkbox" alt="IRS5471ForeignCorpPd909TaxNo" class="styCkbox" style="width: 4mm; height: 4mm">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/ForeignTaxSection909Ind"/>
									<xsl:with-param name="BackupName">IRS5471ForeignCorpPd909Tax</xsl:with-param>
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
							<span style="float:left">
Current year net income or (loss) per foreign books of account
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
						</span>
						<span class="styLNRightNumBox" style="height: 4.75mm">1</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 4.75mm; width: 33mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471HData/ForeignCYNetIncomePerBooksAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 1   -->
					<!--   BEGIN LINE 2   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="width: 146mm"/>
						<span class="styLNRightNumBox" style="height: 4.6mm;width: 8mm;background-color: lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 4.6mm; width: 33mm;background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">2</span>
						<span class="styLNDesc" style="width: 64mm; vertical-align: bottom;">Net adjustments made to line 1 to determine </span>
						<span class="styLNAmountBox" style="height: 4.6mm; width: 37mm; border-bottom-width:0px; border-top-width: 1px"/>
						<span class="styLNAmountBox" style="height: 4.6mm; width: 37mm; border-bottom-width:0px; border-top-width: 1px"/>
						<span class="styLNRightNumBox" style="height: 4.6mm; background-color: lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 4.6mm; width: 33mm;background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="width: 64mm; margin-left: 8mm">current earnings and profits according to U.S.</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 4.5mm; width: 37mm; border-left-width: 1px; border-bottom-width: 0px; text-align: center; font-weight: bold">Net</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 4.5mm; width: 37mm; border-left-width: 1px; border-bottom-width: 0px; text-align: center; font-weight: bold">Net</span>
						<span class="styLNRightNumBox" style="height: 4.5mm; background-color: lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 4.5mm; width: 33mm; background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="padding-top: .75mm; height: 4.5mm; width:64mm; margin-left: 8mm; vertical-align: top;">financial and tax accounting standards (see</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 4.5mm; width: 37mm; border-left-width: 1px; border-bottom-width: 0px; text-align: center; font-weight: bold">Additions</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 4.5mm; width: 37mm; border-left-width: 1px; border-bottom-width: 0px; text-align: center; font-weight: bold">Subtractions</span>
						<span class="styLNRightNumBox" style="height: 4.5mm;  background-color: lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 4.5mm; width: 33mm; background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="width: 64mm; margin-left: 8mm">instructions): </span>
						<span class="styLNAmountBox" style="height: 4.5mm; width: 37mm; border-left-width: 1px; text-align: center"/>
						<span class="styLNAmountBox" style="height: 4.5mm; width: 37mm; border-left-width: 1px; text-align: center"/>
						<span class="styLNRightNumBox" style="height: 4.5mm; background-color: lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 4.5mm; width: 33mm; background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<!--   BEGIN LINE 2A   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBoxDD">a</span>
						<span class="styLNDesc" style="width:64mm;">
							<span style="float:left">
Capital gains or losses
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
						</span>
						<span class="styLNAmountBox" style="width:37mm; height: 5mm; padding-top: .75mm; font-size: 7pt; border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/CapitalGainOrLossNetAddnAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="width:37mm;height: 5mm; padding-top: .75mm; font-size: 7pt; border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/CapitalGainOrLossNetSbtrctnAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm; background-color: lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 5mm; width: 33mm; background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<!--   END LINE 2A   -->
					<!--   BEGIN LINE 2B   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBoxDD">b</span>
						<span class="styLNDesc" style="width:64mm;">
							<span style="float:left">
Depreciation and amortization
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 5mm; font-size: 7pt; width:37mm; border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/DeprecAndAmortzNetAddnAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 5mm; font-size: 7pt; width:37mm;border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/DeprecAndAmortzNetSbtrctnAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm;background-color: lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 5mm; width: 33mm; background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<!--   END LINE 2B   -->
					<!--   BEGIN LINE 2C   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBoxDD">c</span>
						<span class="styLNDesc" style="width:64mm;">
							<span style="float:left">
Depletion
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 5mm; font-size: 7pt; width:37mm;border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/DepletionNetAddnAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 5mm; font-size: 7pt; width:37mm;border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/DepletionNetSbtrctnAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm; background-color: lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 5mm; width: 33mm;background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<!--   END LINE 2C   -->
					<!--   BEGIN LINE 2D   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBoxDD">d</span>
						<span class="styLNDesc" style="width:64mm;">
							<span style="float:left">
Investment or incentive allowance
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 5mm; font-size: 7pt; width:37mm; border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/InvstIncntvAllwncNetAddnAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 5mm; font-size: 7pt; width:37mm; border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/InvstIncntvAllwncNetSbtrctnAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm; background-color: lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 5mm; width: 33mm; background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<!--   END LINE 2D   -->
					<!--   BEGIN LINE 2E   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBoxDD">e</span>
						<span class="styLNDesc" style="width:64mm;">
							<span style="float:left">
Charges to statutory reserves
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 5mm; font-size: 7pt; width:37mm; border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/ChrgsStryReservesNetAddnAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 5mm; font-size: 7pt; width:37mm;border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/ChrgsStryReservesNetSbtrctnAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm; background-color: lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 5mm; width: 33mm; background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<!--   END LINE 2E   -->
					<!--   BEGIN LINE 2F   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBoxDD">f</span>
						<span class="styLNDesc" style="width:64mm;">
							<span style="float:left">
Inventory adjustments
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 5mm; font-size: 7pt; width:37mm;border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/InventoryAdjNetAddnAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 5mm; font-size: 7pt; width:37mm;border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/InventoryAdjNetSbtrctnAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm; background-color: lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 5mm; width: 33mm; background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<!--   END LINE 2F   -->
					<!--   BEGIN LINE 2G   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBoxDD">g</span>
						<span class="styLNDesc" style="width:64mm;">
							<span style="float:left">
Taxes
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 5mm; font-size: 7pt; width:37mm; border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/TaxesNetAddnAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 5mm; font-size: 7pt; width:37mm;border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/TaxesNetSbtrctnAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm; background-color: lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 5mm; width: 33mm;background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<!--   END LINE 2G   -->
					<!--   BEGIN LINE 2H   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftLtrBoxDD">h</span>
						<span class="styLNDesc" style="width: 64mm;">
							<span style="float:left">
Other (attach statement)
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
						</span>
						<span class="styLNAmountBox" style="height: 5mm;font-size: 7pt; width: 37mm; border-left-width: 1px;">
							<span style="float: left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471HData/OtherAdjustmentsNetAddnAmt"/>
								</xsl:call-template>
							</span>
							<span style="float: right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="MaxSize" select="17"/>
									<xsl:with-param name="TargetNode" select="$IRS5471HData/OtherAdjustmentsNetAddnAmt"/>
								</xsl:call-template>
							</span>
						</span>
						<span class="styLNAmountBox" style="height: 5mm;font-size: 7pt; width: 37mm; border-left-width: 1px;">
							<span style="float: left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471HData/OtherAdjustmentsNetSbtrctnAmt"/>
								</xsl:call-template>
							</span>
							<span style="float: right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="MaxSize" select="17"/>
									<xsl:with-param name="TargetNode" select="$IRS5471HData/OtherAdjustmentsNetSbtrctnAmt"/>
								</xsl:call-template>
							</span>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm;background-color: lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 5mm;width: 33mm; background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<!--   END LINE 2H   -->
					<!--   END LINE 2   -->
					<!--   BEGIN LINE 3   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">3</span>
						<span class="styLNDesc" style="width:64mm;">
							<span style="float:left">
Total net additions
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 5mm; font-size: 7pt; width:37mm; border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/TotalNetAdditonsAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNAmountBox" style="height: 5mm; width:37mm;border-left-width: 1px; background-color: lightgrey"/>
						<span class="styLNRightNumBox" style="height: 5mm; background-color: lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 5mm; width: 33mm;border-bottom-width: 0px; background-color: lightgrey"/>
					</div>
					<!--   END LINE 3   -->
					<!--   BEGIN LINE 4   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBoxSD">4</span>
						<span class="styLNDesc" style="width: 101mm">
							<span style="float:left">
Total net subtractions
 </span>
							<span class="styDotLn" style="float:right;padding-right:3.5mm;">.................</span>
						</span>
						<span class="styLNAmountBox" style="padding-top: .75mm; height: 5mm; font-size: 7pt; width: 37mm;border-left-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/TotalNetSubtractionsAmt"/>
							</xsl:call-template>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm;background-color: lightgrey; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 5mm; width: 33mm; background-color: lightgrey; border-bottom-width: 0px"/>
					</div>
					<!--   END LINE 4   -->
					<!--   BEGIN LINE 5A   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox" style="padding-left: 2.25mm">5a</span>
						<span class="styLNDesc" style="width: 138mm">
							<span style="float:left">
Current earnings and profits (line 1 plus line 3 minus line 4)
</span>
							<span class="styDotLn" style="float:right;padding-right:1.5mm;">...............</span>
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
							<span style="float:left">
DASTM gain or (loss) for foreign corporations that use DASTM (see instructions)
</span>
							<span class="styDotLn" style="float:right;padding-right:1.5mm;">........</span>
						</span>
						<span class="styLNRightNumBox">5b</span>
						<span class="styLNAmountBox" style="font-size: 7pt;width: 33mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/DASTMGainOrLossAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 5B   -->
					<!--   BEGIN LINE 5C   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox" style="padding-left: 4mm">c</span>
						<span class="styLNDesc" style="width: 138mm">
							<span style="float:left">
Combine lines 5a and 5b
</span>
							<span class="styDotLn" style="float:right;padding-right:1.5mm;">..........................</span>
						</span>
						<span class="styLNRightNumBox">5c</span>
						<span class="styLNAmountBox" style="font-size: 7pt; width: 33mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471HData/EarningAndPrftPlusDASTMGainAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 5C   -->
					<!--   BEGIN LINE 5D   -->
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNLeftNumBox" style="padding-left: 4mm">d</span>
						<span class="styLNDesc" style="width: 138mm">Current earnings and profits in U.S. dollars (line 5c translated at the appropriate exchange rate as</span>
						<span class="styLNRightNumBox" style="height: 4.5mm; border-bottom-width: 0px"/>
						<span class="styLNAmountBox" style="height: 4.5mm; width: 33mm; border-bottom-width: 0px"/>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="width: 137.75mm; margin-left: 8.25mm">defined in section 989(b) and the related regulations (see instructions))</span>
						<span class="styLNRightNumBox">5d</span>
						<span class="styLNAmountBox" style="font-size: 7pt; width: 33mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471HData/CurrEarnAndPrftInUSDollarsAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="border-right-width: 0px; width: 49.75mm; margin-left: 8.25mm">Enter exchange rate used for line 5d</span>
						<img class="styIRS5471Img" style="border-right-width: 0px; width: 2mm; height: 2mm; float: none" src="{$ImagePath}/5471_Bullet_Line.gif" alt="bullet"/>
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
							<span class="styPartDesc" style="width: 160mm;">Summary of Shareholder’s Income From Foreign Corporation<span class="styNormalText"> (see instructions)</span>
							</span>
						</div>
						<div style="width:187mm;padding-left:2mm;">
If item D on page 1 is completed, a separate Schedule I must be filed for each Category 4 or 5 filer for whom reporting is furnished<br/>on this Form 5471.  This schedule I is being completed for:
<br/>
							<br/>
						</div>
						<div style="width:187mm;padding-left:2mm;">
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
								<div class="styDotLn" style="padding-right:2mm;">..............</div>
								<div class="styLNRightNumBox">
                  1
                </div>
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
								<div class="styDotLn" style="padding-right:2mm;">.........</div>
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
								<div class="styLNRightNumBox">
                4
                </div>
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
								<div class="styLNRightNumBox">
                  5
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
								<div class="styLNRightNumBox">
                  6
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
								<div class="styDotLn" style="padding-right:2mm;">......</div>
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
								<div class="styDotLn" style="padding-right:2mm;">............</div>
								<div class="styLNRightNumBoxNBB">
                 8
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
								<span style="float: right; clear: none">
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
											<xsl:with-param name="BackupName">IRS5471AnyIncomeBlocked</xsl:with-param>
										</xsl:call-template>
										<b>No</b>
									</label>
									<span style="width: 2mm"/>
								</span>
								<span style="float: right; clear: none">
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
											<xsl:with-param name="BackupName">IRS5471AnyIncomeBlocked</xsl:with-param>
										</xsl:call-template>
										<b>Yes </b>
									</label>
									<span style="width: 1.42mm"/>
								</span>
							</span>
						</div>
						<!--   BEGIN LINE 1   -->
						<div class="styGenericDiv" style="width: 187mm;padding-top:1mm;">
							<img class="styIRS5471Img" style="width:1.5mm; height:1.5mm; border-right-width:0px; margin-top:1mm;" src="{$ImagePath}/5471_Bullet_Round.gif" alt="bullet"/>
							<span class="styLNDesc" style="width: 169mm; margin-left: 1mm">
								<span style="float:left">
Was any income of the foreign corporation blocked?
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
								<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
										<xsl:with-param name="BackupName">IRS5471AnyIncomeBlocked</xsl:with-param>
									</xsl:call-template>
								</input>
								<!--<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="AnyIncomeBlocked"/>
											<xsl:with-param name="BackupName">IRS5471AnyIncomeBlocked</xsl:with-param>
										</xsl:call-template>
									</label>-->
							</span>
							<span class="styNBSP" style="width: 10px"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
										<xsl:with-param name="BackupName">IRS5471AnyIncomeBlocked</xsl:with-param>
									</xsl:call-template>
								</input>
								<!--<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="AnyIncomeBlocked"/>
											<xsl:with-param name="BackupName">IRS5471AnyIncomeBlocked</xsl:with-param>
										</xsl:call-template>
									</label>-->
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
							<img class="styIRS5471Img" style="width:1.5mm; height:1.5mm; border-right-width:0px; margin-top:1mm;" src="{$ImagePath}/5471_Bullet_Round.gif" alt="bullet"/>
							<span class="styLNDesc" style="width: 169mm; margin-left: 1mm">
								<span style="float:left">
Did any such income become unblocked during the tax year (see section 964(b))?
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
							</span>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
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
								<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
										<xsl:with-param name="BackupName">IRS5471IncomeBecomeUnblockedThisTY</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
						<div class="styGenericDiv" style="width: 187mm;">
							<span class="styLNDesc" style="width: 160mm;">If the answer to either question is "Yes," attach an explanation.</span>
						</div>
					</xsl:if>
					<!--   END LINE 2   -->
					<!-- Display all instances of Schedule I data if the print option is not "separated" -->
					<!-- If the print option is "separated", but there is only one Schedule I, display that instance -->
					<xsl:if test="($Print != $Separated) or (($Print = $Separated) and (count($IRS5471IData) = 1))">
						<xsl:for-each select="$IRS5471IData">
							<div class="styBB" style="width:187mm;float:none;clear:both;">
								<span class="styPartName" style="width: 20mm;">Schedule I</span>
								<span class="styPartDesc" style="width: 160mm;">Summary of Shareholder’s Income From Foreign Corporation
								<span class="styNormalText"> (see instructions)</span>
								</span>
							</div>
							<div style="width:187mm;padding-left:2mm;">
If item D on page 1 is completed, a separate Schedule I must be filed for each Category 4 or 5 filer for whom reporting is furnished<br/>on this Form 5471.  This schedule I is being completed for:
<br/>
								<br/>
							</div>
							<div style="width:187mm;padding-left:2mm;">
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
												<xsl:with-param name="TargetNode" select="ShareholderInformation/ShareholderBusinessName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ShareholderInformation/ShareholderBusinessName/BusinessNameLine2Txt"/>
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
												<xsl:with-param name="TargetNode" select="ShareholderInformation/ShareholderMissingEINReasonCd"/>
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
										<div class="styLNRightNumBox" style="border-top-width:1;">
                  1
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
										<div class="styDotLn" style="padding-right:2mm;">.........</div>
										<div class="styLNRightNumBox">
                  2
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
										<div class="styLNRightNumBox">
                  5
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
										<div class="styLNRightNumBox">
                  6
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
										<div class="styDotLn" style="padding-right:2mm;">......</div>
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
										<div class="styDotLn" style="padding-right:2mm;">............</div>
										<div class="styLNRightNumBoxNBB">8</div>
										<div class="styLNAmountBoxNBB" style="width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExchangeGainOrLossOnDistriAmt"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<div class="styGenericDiv" style="width: 187mm">
									<span class="styLNDesc" style="font-size: 8pt; width: 186mm">
										<span style="float: right; clear: none">
											<label>
												<xsl:call-template name="PopulateLabelNo">
													<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
													<xsl:with-param name="BackupName">IRS547AnyIncomeBlocked</xsl:with-param>
												</xsl:call-template>
												<b>No</b>
											</label>
											<span style="width: 2mm"/>
										</span>
										<span style="float: right; clear: none">
											<label>
												<xsl:call-template name="PopulateLabelYes">
													<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
													<xsl:with-param name="BackupName">IRS547AnyIncomeBlocked</xsl:with-param>
												</xsl:call-template>
												<b>Yes </b>
											</label>
											<span style="width: 1.42mm"/>
										</span>
									</span>
								</div>
								<!--   BEGIN LINE 1   -->
								<div class="styGenericDiv" style="width: 187mm;padding-top:1mm;">
									<img class="styIRS5471Img" style="width:1.5mm; height:1.5mm; border-right-width:0px; margin-top:1mm;" src="{$ImagePath}/5471_Bullet_Round.gif" alt="bullet"/>
									<span class="styLNDesc" style="width: 169mm; margin-left: 1mm">
										<span style="float:left">
Was any income of the foreign corporation blocked?
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
									<span class="styLNDesc" style="width: 169mm; margin-left: 1mm">
										<span style="float:left">
Did any such income become unblocked during the tax year (see section 964(b))?
										<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
											</xsl:call-template>
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
									</span>
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
												<xsl:with-param name="BackupName">IRS547IncomeBecomeUnblockedThisTY</xsl:with-param>
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
												<xsl:with-param name="BackupName">IRS547IncomeBecomeUnblockedThisTY</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
								</div>
								<div class="styGenericDiv" style="width: 187mm">
									<span class="styLNDesc" style="width: 160mm;">If the answer to either question is "Yes," attach an explanation.</span>
								</div>
								<br/>
								<br/>
							</div>
						</xsl:for-each>
						<!--   END LINE 2   -->
					</xsl:if>
					<!--   BEGIN FORM FOOTER  -->
					<div style="width: 187mm; border-color: black;padding-top:.5mm; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 1px; border-bottom-width: 0px">
						<span style="float: left; width: 100mm"/>
						<span style="float: right">Form <span class="styBoldText" style="font-size: 8pt">5471</span> (Rev. 12-2012)</span>
					</div>
					<!--   END FORM FOOTER   -->
					<br/>
					<div class="pageEnd"/>
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
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
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
									<th scope="col" class="styDepTblCell" style="width: 96mm; text-align: center; border-right-width: 0px; font-size: 7pt;" colspan="2">
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
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
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
						<span class="styRepeatingDataTitle">Form 5471, Schedule B - U.S. Shareholders of Foreign Corporation (See page 4 of the instructions.):</span>
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
										<!--td class="styIRS5471TableLastCol" id="FSspcr"/-->
									</tr>
									<xsl:for-each select="ForeignCorporationStocks">
										<xsl:if test="not(position() = 1)">
											<tr>
												<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
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
						<span class="styRepeatingDataTitle">Form 5471, Schedule E - Income, War Profits, and Excess Profits Taxes Paid or Accrued (See page 5 of the instructions.):</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<thead class="styTableThead">
								<!-- JMI: Label the Column Headers -->
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="width: 90mm; text-align: center; font-size: 7pt;" rowspan="2">
										<br/>
										<b>(a)</b>
										<br/>Name of country or U.S. possession</th>
									<th scope="col" class="styDepTblCell" style="font-size: 7pt; width: 96mm; text-align: center; border-right-width: 0px" colspan="3">
										<b>Amount of Tax</b>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="width: 34mm; text-align: center; font-size: 7pt;">
										<b>(b)</b>
										<br/> In foreign currency</th>
									<th scope="col" class="styDepTblCell" style="width: 30mm; text-align: center; border-right-width:1px; font-size: 7pt;">
										<b>(c)</b>
										<br/>Conversion rate</th>
									<th scope="col" class="styDepTblCell" style="width: 32mm; text-align: center; border-right-width:0px; font-size: 7pt;">
										<b>(d)</b>
										<br/>In U.S. dollars</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!--							
								<tr class="styDepTblRow1">
									<td class="styTableCell" style="width: 90mm; font-size: 7pt; text-align: left">
										<span style="width: 2px"/>
										<b>1</b>
										<span style="width: 6px"/>U.S.<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width: 34mm; font-size: 7pt; text-align: right; background-color: lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width: 30mm; font-size: 7pt; text-align: right; background-color: lightgrey">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width: 32mm; font-size: 7pt; text-align: right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS5471EData/USIncomeAndProfitsTaxesAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
								</tr>
-->
								<xsl:for-each select="$IRS5471EData/IncomeAndWarProfitsTaxesPaid">
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
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
								<!--								
								<tr class="styDepTblHdr">
									<td class="styDepTblCell" colspan="3" style="text-align: left">
										<xsl:value-of select="count($IRS5471EData/IncomeAndWarProfitsTaxesPaid)  + 2"/>
										<span style="width:5px"/>Total
	  			<b>
											<span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.
				    <span class="styNBSP"/>.		    
				</b>
										<img class="styIRS5471Img" style="border-right-width: 0px; width: 2mm; height: 2mm; float: none" src="{$ImagePath}/5471_Bullet_Line.gif" alt="bullet"/>
									</td>
									<td class="styDepTblCell" style="border-color: black; text-align: right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS5471EData/TotalIncomeAndWarProfitsTxsAmt"/>
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
										</xsl:call-template>
									</td>
								</tr>
-->
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
<br/>If item D on page 1 is completed, a separate Schedule I must be filed for each Category 4 or 5 filer for whom reporting is furnished on this Form 5471.  This schedule I is being completed for:
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
																<xsl:with-param name="TargetNode" select="ShareholderInformation/ShareholderPersonNm"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ShareholderInformation/ShareholderBusinessName/BusinessNameLine1Txt"/>
															</xsl:call-template>
															<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ShareholderInformation/ShareholderBusinessName/BusinessNameLine2Txt"/>
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
																<xsl:with-param name="TargetNode" select="ShareholderInformation/ShareholderMissingEINReasonCd"/>
															</xsl:call-template>
														</xsl:when>
													</xsl:choose>
												</span>
											</div>
										</td>
									</tr>
									<tr class="styDepTblRow2">
										<td class="styDepTblCell" style="text-align:left;">
											<div style="float:left;">
												<div class="styLNLeftNumBox" style="height:4mm;">1</div>
												<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Subpart F income (line 38b, Worksheet A in the instructions)    
                </div>
											</div>
											<div style="float:right;">
												<div class="styDotLn">..............</div>
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
									<tr class="styDepTblRow1">
										<td class="styDepTblCell" style="text-align:left;">
											<div style="float:left;">
												<div class="styLNLeftNumBox" style="height:4mm;">2</div>
												<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Earnings invested in U.S. property (line 17, Worksheet B in the instructions)   
                </div>
											</div>
											<div style="float:right;">
												<div class="styDotLn">.........</div>
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
									<tr class="styDepTblRow2">
										<td class="styDepTblCell" style="text-align:left;">
											<div style="float:left;">
												<div class="styLNLeftNumBox" style="height:4mm;">3</div>
												<div class="styGenericDiv" style="padding-top:.5mm;">
                  Previously excluded subpart F income withdrawn from qualified investments (line 6b, Worksheet C in
                </div>
											</div>
											<div style="float:left;">
												<div class="styLNLeftNumBox" style="height:4mm;"/>
												<div class="styGenericDiv" style="padding-top:.5mm;">
                  the instructions)   
                </div>
											</div>
											<div style="float:right;">
												<div class="styDotLn">............................</div>
											</div>
										</td>
										<td class="styDepTblCell" style="text-align:center;font-weight:bold;width:5mm;padding-top:6mm;">3</td>
										<td class="styDepTblCell" style="text-align:right;width:33mm;padding-top:6mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PrevExcludedSubpartFIncomeAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
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
												<div class="styDotLn">.......................</div>
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
									<tr class="styDepTblRow2">
										<td class="styDepTblCell" style="text-align:left;border-bottom-width:0px">
											<div style="float:left;">
												<div class="styLNLeftNumBox" style="height:4mm;">7</div>
												<div class="styGenericDiv" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
                  Dividends received (translated at spot rate on payment date under section 989(b)(1))   
                </div>
											</div>
											<div style="float:right;">
												<div class="styDotLn">......</div>
											</div>
										</td>
										<td class="styDepTblCell" style="text-align:center;font-weight:bold;vertical-align:bottom;width:5mm">7</td>
										<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsReceivedAmt"/>
											</xsl:call-template>
										</td>
									</tr>
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
										<td class="styDepTblCell" style="text-align:center;font-weight:bold;vertical-align:bottom;width:5mm">8</td>
										<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExchangeGainOrLossOnDistriAmt"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr class="styDepTblRow2">
										<td class="styDepTblCell" style="text-align:left;border-bottom-width:0px;" colspan="3">
											<div class="styGenericDiv" style="width: 181mm">
												<span class="styLNDesc" style="font-size: 8pt; width: 180mm">
													<span style="float: right; clear: none;padding-right:3mm;">
														<label>
															<xsl:call-template name="PopulateLabelNo">
																<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
																<xsl:with-param name="BackupName">IRS547AnyIncomeBlocked</xsl:with-param>
															</xsl:call-template>
															<b>No</b>
														</label>
														<span style="width: 2mm"/>
													</span>
													<span style="float: right; clear: none">
														<label>
															<xsl:call-template name="PopulateLabelYes">
																<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
																<xsl:with-param name="BackupName">IRS547AnyIncomeBlocked</xsl:with-param>
															</xsl:call-template>
															<b>Yes </b>
														</label>
														<span style="width: 1mm"/>
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
											<div class="styGenericDiv" style="width: 181mm">
												<img class="styIRS5471Img" style="width:1.5mm; height:1.5mm; border-right-width:0px; margin-top:1mm;" src="{$ImagePath}/5471_Bullet_Round.gif" alt="bullet"/>
												<span class="styLNDesc" style="width: 160mm; margin-left: 1mm">
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
													<input type="checkbox" class="styCkbox" style="width: 4mm; height: 4mm">
														<xsl:call-template name="PopulateYesCheckbox">
															<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
															<xsl:with-param name="BackupName">IRS547IncomeBecomeUnblockedThisTY</xsl:with-param>
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
															<xsl:with-param name="BackupName">IRS547IncomeBecomeUnblockedThisTY</xsl:with-param>
														</xsl:call-template>
													</input>
												</span>
											</div>
											<div class="styGenericDiv" style="width: 180mm">
												<span class="styLNDesc" style="width: 160mm;">If the answer to either question is "Yes," attach an explanation.</span>
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
						<img src="{$NonVersionedImagePath}/pen.gif" alt="{$Desc}: {'Yes'}" TabIndex="{$TabOrder}" style="cursor:hand;" onclick="this.id =window.event.x + 'and' + window.event.y;goToLeftoverDataTable( this.id );" onkeypress="this.id =window.event.x + 'and' + window.event.y;goToLeftoverDataTable( this.id );"/>
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
				<!--<xsl:call-template name="PopulateText">
         <xsl:with-param name="TargetNode" select="Desc" />
       </xsl:call-template></td>-->
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
				<!-- ************************************************** -->
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
		<!-- Separated data case -->
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
