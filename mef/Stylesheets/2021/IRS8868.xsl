<?xml version="1.0" encoding="UTF-8"?>
<!-- 10/10/2013 - Modified per Defect #38396 - Jeremy Nichols -->
<!-- 10/10/2013 - Modified per Defect #38404 - Jeremy Nichols -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8868Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="IRS8868Data" select="$RtnDoc/IRS8868"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($IRS8868Data)"/>
					</xsl:call-template>
				</title>
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<meta http-equiv="Cache-Control" content="private"/>
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 8868"/>
				<META name="GENERATOR" content="IBM WebSphere Studio"/>
				<!-- This is a test of the streams -->
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<!-- Form 8868 CSS Styles are located in the template called below -->
						<xsl:call-template name="IRS8868Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS8868">
					<!--   BEGIN WARNING LINE  -->
					<xsl:call-template name="DocumentHeader"/>
					<!--    WARNING LINE   -->
					<!--   BEGIN FORM HEADER   -->
					<div class="styBB" style="width:187mm; height:21.7mm;">
						<div class="styFNBox" style="width:31mm;height:21.7mm; border-right-width: 2px; font-size:8px">
							<div>
							Form<span class="styFormNumber">  8868</span><br/>
							(Rev. January 2022)
							<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS8868Data"/>
								</xsl:call-template>
							</div>
							<div style="padding-top:2mm;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:115mm;height:20mm">
							<div class="styMainTitle" style="height:7mm;">Application for Automatic Extension of Time To File an Exempt Organization Return
							<br/></div>
							<div class="styFBT" style="height:5mm; font-size: 7pt; padding-top: 2mm">
								<img src="{$ImagePath}/8868_Bullet_Title.gif" alt="bullet"/> File a separate application for each return.<span style="width: 5mm"/>
								<div class="styFST" style="height:5mm;font-size:7pt;padding-top:1mm;">
									<img src="{$ImagePath}/8868_Bullet_Title.gif" alt="Bullet Image"/>
									  Go to <a href="http://www.irs.gov/Form8868" title="Link to IRS.gov">
										<i>www.irs.gov/Form8868</i></a> for the latest information.
							</div>
							</div>
						</div>
						<div class="styTYBox" style="width:25mm; height: 21.7mm; border-left-width: 2px; ">
							<div class="styOMB" style="width:30mm; border-bottom:0px ;padding-top:10mm;text-align:middle">OMB No.1545-0047</div>
						</div>
					</div>
					<!--   END FORM HEADER   -->
					<div style="width:187mm; line-height:1.2; padding-top:1mm; padding-bottom:1mm">
						<b>Electronic filing (e-file).</b> You can electronically file Form 8868 to request a 6-month automatic extension of time to file any 
						of the forms listed below with the exception of Form 8870, Information Return for Transfers Associated With Certain Personal Benefit Contracts, for
						which an extension request must be sent to the IRS in paper format (see instructions).  For more details on the electronic filing of this form, visit 
						  <i>www.irs.gov/e-file-providers/e-file-for-charities-and-non-profits</i>.
					</div>
					<!--   BEGIN PART I   -->
					<!--   BEGIN PART I HEADER   -->
					<div class="styBB" style="border-top-width:1px; width:187mm;">
						<div class="styPartDesc" style="width:170mm; padding-left:0mm;padding-top:1mm; font-size:7pt">
						  Automatic 6-Month Extension of Time. <span style="font-weight: normal">  Only submit original (no copies needed).</span>
						</div>
				    </div>
					<div  style="width:187mm;">
					<div style="font-size:7pt; font-style: italic; padding-top:1mm;font-weight:normal; width:187mm;border-bottom-width:0px;"><!--height:8mm;-->
						All corporations required to file an income tax return other than a Form 990-T (including 1120-C filers), partnerships, REMICs, and trusts
						must use Form 7004 to request an extension of time to file income tax returns. 
					</div>
					</div>			
					<div  style="width:187mm; font-weight:bold; text-align:right; border-bottom:1px solid black ">Enter filer's identifying number, see instructions
					</div>
					<!--   END PART I HEADER padding-left:90mm  -->
					<div style="width:187mm;float:left;clear:none;border-bottom:1px solid black">
						<div class="styUseLbl"  rowspan="3" style="width:16mm;height:33mm; font-size: 7pt">
							<b>Type or print</b>
							<br/>
							<span style="font-size: 6pt; font-weight: normal">File by the due date for filing your return. See instructions.</span>
						</div>
						<div class="styNameAddr" 
						style=" border-bottom-width: 0px; border-top-width: 0px; border-right-width: 1px;width:103mm;height:13mm;font-size: 7pt">
						  Name of exempt organization or other filer, see instructions.<br/>
							<span style="font-family:verdana;font-size:6pt;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								</xsl:call-template>
								<br/>

								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Header - In Care Of Name</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Header - Business Name Control</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessNameControlTxt"/>
								</xsl:call-template>	
							</span>
						</div>
						<div class="styFNBox" 
						style="padding-left:2mm;font-size:7pt;width:68mm;height:13mm;border-right-width:0px;border-bottom-width:0px;"> 
						Taxpayer identification number (TIN)
							<br/>
							<br/>
							<span style="text-align:left;font-size: 7pt; font-weight:normal;">
								<!-- Since this is a main form, we must check for and display an updated EIN.  To do this, we use the EINChanged 
									parameter when calling PopulateReturnHeaderFiler.-->
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="EINChanged">true</xsl:with-param>
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
								<span style="width: 2mm"/>								
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="EINChanged">true</xsl:with-param>
									<xsl:with-param name="TargetNode">SSN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div class="styNameAddr" style="width:103mm;height:9mm; font-size:7pt; border-top-width: 1px;
						border-right-width: 1px;border-bottom-width:0px;">
							<!-- width used to be 169mm -->
							 Number, street, and room or suite no. If a P.O. box, see instructions.<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<!--<div class="styFNBox" style="padding-left:2mm;font-size:7pt;width:68mm;border-right-width:0px;">Social security number (SSN)<br/>
							<br/>
							<span style="text-align:left;font-size: 7pt; font-weight:normal;">
								--><!-- Since this is a main form, we must check for and display an updated EIN.  To do this, we use the EINChanged parameter when 
								calling PopulateReturnHeaderFiler.-->
							<!--</span>
						</div>-->
						<div class="styNameAddr" style=";border-top-width:1px;border-bottom-width: 0px;width:171mm;height:10mm;font-size:7pt"><!---->
						    City, town or post office, state, and ZIP code. For a foreign address, see instructions.<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
								<xsl:with-param name="MainForm">true</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<span style="width:187mm"/>
					<div style="float:left; border-style:solid; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px; 
					font-size: 8pt"><!-- line-height:2;-->
						Enter the Return code for the return that this application is for (file a separate application for each return):
						<div class="styDotLn" style="float:right; padding-right:4mm">..............
							<span style="line-height:1;padding-top:1mm; float:right; width:8mm; border-style:solid; border-width:1px;vertical-align:bottom">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic6MonthExtensionOfTime/ExtensionReturnCd"/>
							</xsl:call-template></span>
						</div>	
					</div>
					<table style="float:left; font-size:7pt;border-color:black;" class="styTable" cellspacing="0" 
					summary="Table displaying entity name or names and corresponding employer identification numbers" name="GBCtable" id="GBCtable">
						<thead class="styTableThead">
							<tr>
								<th scope="col" class="styTableCell" 
								style="width:68mm;font-size:7pt;text-align:left;border-bottom:none;font-weight:bold;border-left-width:0px;">Application</th>
								<th scope="col" class="styTableCell" 
								style="width:24mm;font-size:7pt;text-align:center;border-bottom:none;font-weight:bold;border-right-width:2px;">Return</th>
								<th scope="col" class="styTableCell" 
								style="width:68mm;font-size:7pt;text-align:left;border-bottom:none;font-weight:bold;">Application</th>
								<th scope="col" class="styTableCell" 
								style="width:24mm;font-size:7pt;text-align:center;border-bottom:none;font-weight:bold;border-right-width:0px">Return</th>
							</tr>
							<tr>
								<th scope="col" class="styTableCell" style="width:68mm;font-size:7pt;text-align:left;font-weight:bold;border-left-width:0px;">Is For:<br/>
								</th>
								<th scope="col" class="styTableCell" style="width:24mm;font-size:7pt;text-align:center;font-weight:bold;border-right-width:2px;">Code<br/>
								</th>
								<th scope="col" class="styTableCell" style="width:68mm;font-size:7pt;text-align:left;font-weight:bold;">Is For:<br/>
								</th>
								<th scope="col" class="styTableCell" style="width:24mm;font-size:7pt;text-align:center;font-weight:bold;border-right-width:0px">Code<br/>
								</th>
							</tr>
							<tr>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;border-left-width:0px;">Form 990 or Form 990-EZ</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;font-weight:normal;border-right-width:2px;">01</th>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;border-right-width:1px;">Form 1041-A</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;font-weight:normal;border-right-width:0px">08</th>
							</tr>
							<tr>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;border-left-width:0px;">Form 4720 (individual)</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;border-right-width:2px;font-weight:normal;">03</th>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;">Form 4720 (other than individual)</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;font-weight:normal;border-right-width:0px">09</th>
							</tr>
							<tr>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;border-left-width:0px;">Form 990-PF</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;border-right-width:2px;font-weight:normal;">04</th>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;">Form 5227</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;font-weight:normal;border-right-width:0px">10</th>
							</tr>
							<tr>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;border-left-width:0px;">Form 990-T (sec. 401(a) or 408(a) trust)</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;border-right-width:2px;font-weight:normal;">05</th>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;">Form 6069</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;font-weight:normal;border-right-width:0px">11</th>
							</tr>
							<tr>
								<th scope="col" class="styTableCell" 
									  style="width:68mm;text-align:left;font-weight:normal;border-left-width:0px;">Form 990-T (trust other than above)</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;border-right-width:2px;font-weight:normal;">06</th>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;">Form 8870</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;font-weight:normal;border-right-width:0px">12</th>
							</tr>
							<tr>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;border-left-width:0px;">
								Form 990-T (corporation)</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;border-right-width:2px;font-weight:normal;">07</th>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;background-color: lightgrey;"></th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;font-weight:normal;border-right-width:0px;background-color: lightgrey;"></th>
							</tr>
						</thead>
					</table>
					<!--Schema Mod(s) for TY2004 -->
					<!--The books are in the care of - Person or Business Name-->
					<div style="width:187mm;"/>
					<div style="width: 187mm;">
						<div class="styGenericDiv">
							<img src="{$ImagePath}/8868_Bullet_Round.gif" alt="bullet"/> The books are in the care of
								 <span style="width: 2mm"/>
							<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
							<span style="width: 2mm"/>
						</div>
						<div class="styGenericDiv" style="width:140mm;border-bottom:1px solid black;">
							<div style="font-family:verdana;padding-left:1mm">
								<xsl:choose>
									<xsl:when test="$IRS8868Data/Automatic6MonthExtensionOfTime/BooksInCareOfDetail/PersonNm !=' '">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
												select="$IRS8868Data/Automatic6MonthExtensionOfTime/BooksInCareOfDetail/PersonNm"/>
											</xsl:call-template>
											<span style="width:1px"></span>
											<span style="width:2mm"/>
									</xsl:when>
									<xsl:otherwise>
									<xsl:if test="$IRS8868Data/Automatic6MonthExtensionOfTime/BooksInCareOfDetail/BusinessName/BusinessNameLine1Txt != '' ">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" 
												select="$IRS8868Data/Automatic6MonthExtensionOfTime/BooksInCareOfDetail/BusinessName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<span style="width:1px"></span>
											<span style="width:2mm"/>
												<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" 
												select="$IRS8868Data/Automatic6MonthExtensionOfTime/BooksInCareOfDetail/BusinessName/BusinessNameLine2Txt"/>
												</xsl:call-template>
												<span style="width:1mm"></span>
												<span style="width:2mm"/>
											</xsl:if>
									</xsl:otherwise>
								</xsl:choose>
							<xsl:choose>
								<xsl:when test="$IRS8868Data/Automatic6MonthExtensionOfTime/BooksInCareOfDetail/USAddress !='' ">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" 
											select="$IRS8868Data/Automatic6MonthExtensionOfTime/BooksInCareOfDetail/USAddress/AddressLine1Txt"/>
									</xsl:call-template>
									<span style="width:1px"></span>
									<span style="width:2mm"/>
																
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" 
											select="$IRS8868Data/Automatic6MonthExtensionOfTime/BooksInCareOfDetail/USAddress/AddressLine2Txt"/>
									</xsl:call-template>
									<span style="width:1px"></span>
									<span style="width:2mm"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" 
										select="$IRS8868Data/Automatic6MonthExtensionOfTime/BooksInCareOfDetail/USAddress/CityNm"/>
									</xsl:call-template>
									<span style="width:1px">,</span>
									<span style="width:2mm"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" 
											select="$IRS8868Data/Automatic6MonthExtensionOfTime/BooksInCareOfDetail/USAddress/StateAbbreviationCd"/>
									</xsl:call-template>
										<span style="width:1px"></span>
										<span style="width:2px"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" 
										select="$IRS8868Data/Automatic6MonthExtensionOfTime/BooksInCareOfDetail/USAddress/ZIPCd"/>
									</xsl:call-template>								
								</xsl:when>
								<xsl:otherwise >
									<xsl:if test="$IRS8868Data/Automatic6MonthExtensionOfTime/BooksInCareOfDetail/ForeignAddress">									
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" 
											select="$IRS8868Data/Automatic6MonthExtensionOfTime/BooksInCareOfDetail/ForeignAddress/AddressLine1Txt"/>
									</xsl:call-template>
									<span style="width:1px"></span>
									<span style="width:2mm"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" 
											select="$IRS8868Data/Automatic6MonthExtensionOfTime/BooksInCareOfDetail/ForeignAddress/AddressLine2Txt"/>
									</xsl:call-template>
									<span style="width:1px"></span>
									<span style="width:2mm"/> <br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" 
										select="$IRS8868Data/Automatic6MonthExtensionOfTime/BooksInCareOfDetail/ForeignAddress/CityNm"/>
									</xsl:call-template>
									<span style="width:1px">,</span>
									<span style="width:2mm"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" 
										select="$IRS8868Data/Automatic6MonthExtensionOfTime/BooksInCareOfDetail/ForeignAddress/ProvinceOrStateNm"/>
									</xsl:call-template>
									<span style="width:1px">,</span>
									<span style="width:2mm"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" 
										select="$IRS8868Data/Automatic6MonthExtensionOfTime/BooksInCareOfDetail/ForeignAddress/ForeignPostalCd"/>
									</xsl:call-template>
									<span style="width:1px"></span>
									<span style="width:2mm"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" 
											select="$IRS8868Data/Automatic6MonthExtensionOfTime/BooksInCareOfDetail/ForeignAddress/CountryCd"/>
									</xsl:call-template>
									<span style="width:1px"></span>
									<span style="width:2mm"/>
									</xsl:if>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<!--<br/>-->
						</div>
					</div>
					<!--Telephone No. and Fax No. -->
					<div style="width:187mm; float:left">
					<span style="width: 90mm; padding-left:4mm">
						<span style="left-padding:5mm">Telephone No.</span>
						<span style="width: 2mm"/>
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
						<span style="width: 2mm"/>
						<span class="styFixedUnderline" style="float:none;width:40mm">
							<xsl:call-template name="PopulatePhoneNumber">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic6MonthExtensionOfTime/BooksInCareOfDetail/PhoneNum"/>
							</xsl:call-template>
						</span>
					</span>
					<span style="width: 90mm;;float:right">	
						<span style="width:17mm"/>Fax No.<span style="width: 2mm"/>
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
						<span style="width: 2mm"/>
						<span class="styFixedUnderline" style="float:none;width:40mm">
							<xsl:call-template name="PopulatePhoneNumber">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic6MonthExtensionOfTime/BooksInCareOfDetail/FaxNum"/>
							</xsl:call-template>
						</span>
					</span>
					</div>
					<!--End schema mods -->
					<div style="width: 187mm;padding-top:2mm; float:left">
						<img src="{$ImagePath}/8868_Bullet_Round.gif" alt="bullet"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic6MonthExtensionOfTime/OrgHasNoOfficeInUSInd"/>
									<xsl:with-param name="BackupName">OrganizationHasNoOfficeInUS</xsl:with-param>
							</xsl:call-template> If the organization does not have an office or place of business in the United States, check this box</label>
						<span class="styDotLn" style="float:right;">............
							<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
							<!--<span style="width: 2mm"/>-->
							<input type="checkbox" alt="OrgHasNoOfficeInUS"  class="styCkbox" name="OrgHasNoOfficeInUSInd" id="OrgHasNoOfficeInUSInd">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic6MonthExtensionOfTime/OrgHasNoOfficeInUSInd"/>
									<xsl:with-param name="BackupName">OrgHasNoOfficeInUS</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>	
					</div>
					
					<div style="width: 187mm;  border-style: solid; border-width:1px ; border-left-width:0px;border-right-width:0px; border-top-width:0px; float:left">
						<img src="{$ImagePath}/8868_Bullet_Round.gif" alt="bullet"/> If this is for a Group Return, enter the organization's four digit Group 
						Exemption Number (GEN)
						<span class="styFixedUnderline" style="float:none;text-align:center;width:15mm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic6MonthExtensionOfTime/GroupExemptionNum"/>
							</xsl:call-template>
						</span>.	
					If this is for the whole group, check this box
					<span class="styDotLn" style="float:none" >...</span>
	
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
						<span style="width: 2mm"/>
		
						<input type="checkbox" alt="WholeGroup" class="styCkbox" name="WholeGroupInd" id="WholeGroupInd">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic6MonthExtensionOfTime/WholeGroupInd"/>
									<xsl:with-param name="BackupName">WholeGroup</xsl:with-param>
							</xsl:call-template>
						</input>.
						 <label for="PartGroup" style="float:none"> If it is for part of the group, check this box</label>
							<span class="styDotLn" style="float:none">......
						
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
						<span style="width: 2mm"/>
						<input type="checkbox" alt="PartialGroup" class="styCkbox" name="PartialGroupInd" id="PartialGroupInd">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic6MonthExtensionOfTime/PartialGroupInd"/>
									<xsl:with-param name="BackupName">PartialGroup</xsl:with-param>
							</xsl:call-template>
						</input>	
					</span>
					<label style="float:none">and attach a list with the names and EINs of all members the extension is for.</label>
						
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic6MonthExtensionOfTime/PartialGroupInd"/>
						</xsl:call-template>
					</div>

					
					<!--   BEGIN LINE 1   -->
					<div class="styIRS8868LineItem" style="width:187mm;border-top-width: 1px;height:auto ">
					  <span class="styLNLeftNumBoxSD" style=";padding-top:0mm;">1</span>
					  <span class="styLNDesc" style="width: 176mm;height:auto">I request an automatic 6-month extension of time until 
								<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic6MonthExtensionOfTime/ExtensionDt"/>
							</xsl:call-template>,
						to file the exempt organization return for the organization named above.  The extension is for the organization's return for:
					  </span>
					</div>
				<xsl:choose>
						<xsl:when test="substring($RtnHdrData/TaxPeriodEndDt,6,2) = '12' ">		 
								<div class="styIRS8868LineItem" style="margin-left: 8mm; float:left">
									<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
									<span style="width: 2mm"/>
									<input type="checkbox" class="styCkbox" id="CalendarYearInd" checked="checked" onclick="return false;"/>
									<span  style="; clear:none">
										<label for="CalendarYearInd" style="padding-left:1.5mm"> calendar year 
											<span class="styGenericDiv" style="width:50mm;border-bottom:1px solid black;padding-left: .5mm; float:none; clear:none;">
												<xsl:call-template name="PopulateReturnHeaderTaxYear"/>
											</span><b>  or  </b> 
										</label>
									</span>
								</div>
								<div class="styIRS8868LineItem" style="float:left; width:187mm; padding-left:8mm">
									<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
									<span style="width: 2mm"/>
											<input type="checkbox" class="styIRS8868Ckbox" id="TaxYearCheckBox" onclick="return false;"/>
									<span class="styIRS8868CkboxText" style="width: 160mm; float: none; clear: none">
										<label for="TaxYearCheckBox" style="width:130mm"> tax year beginning   
											<span style="padding-left: 1mm;width:20mm;border-style:solid;float:none;clear:none;border-bottom-width:0px;"
											 class="styBB">__________</span>
											 and ending
											<span class="styBB" 
											style="padding-left: 1mm;width:20mm;float:none;clear:none;border-bottom-width:0px">__________</span>
										</label>
									</span>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styIRS8868LineItem" style="margin-left: 3mm; float:left">
									<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
									<span style="width: 2mm"/>
									<input type="checkbox" class="styIRS8868Ckbox" id="CalendarYearInd" onclick="return false"/>
									<span class="styIRS8868CkboxText" style="float: none; clear:none;">
									<label for="CalendarYearInd"> calendar year 
										<span style="width:8mm;border-style:solid;float:none;clear:none;" class="styBB"></span>  or 
									</label>
									</span>
								</div>
							<div class="styIRS8868LineItem" style="margin-left: 3mm;float:left">
								<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
								<span style="width: 2mm"/>
								<xsl:choose>
									<xsl:when test="substring($RtnHdrData/TaxPeriodEndDt,6,2) != '12'">
										<input type="checkbox" class="styIRS8868Ckbox" id="TaxYearCheckBox" onclick="return false" checked="checked"/>
									</xsl:when>
									<xsl:otherwise>
										<input type="checkbox" class="styIRS8868Ckbox" id="TaxYearCheckBox" onclick="return false;"/>
									</xsl:otherwise>
								</xsl:choose>
								<span class="styIRS8868CkboxText" style="width: 160mm; float: none; clear: none">
							<label for="TaxYearCheckBox"> tax year beginning         
								<span style="padding-left: 1mm;width:20mm;border-style:solid;float:none;clear:none;" class="styBB">
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
								</span>
								 and ending
								<span style="padding-left: 1mm;width:20mm;border-style:solid;float:none;clear:none;" class="styBB">
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
								</span>
							</label>
						</span>
					</div>				
				</xsl:otherwise>
			</xsl:choose>
					<!--   END LINE 1   -->

					<!--  BEGIN LINE 2  -->
					<div class="styIRS8868LineItem" style="width:187mm; padding-top:1mm;height:auto; float:left">
						<span class="styLNLeftNumBoxSD" style="height:6mm;padding-top:2mm">2</span>
						<span class="styLNDesc" style="width: 178mm; float:none; height:auto;">If the tax year entered in line 1 is for less 
							than 12 months, check reason: 
						<span style="width: 1mm"/>
							<input type="checkbox" alt="InitialReturn" class="styIRS8868Ckbox" name="InitialReturn" TabIndex="-1" 
								id="InitialReturn">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic6MonthExtensionOfTime/InitialReturnInd"/>
									<xsl:with-param name="BackupName">InitialReturn</xsl:with-param>
								</xsl:call-template>
							</input>
							<span class="styIRS8868CkboxText" style="width: 17mm; float: none; clear: none">
								<label for="InitialReturn"> Initial return</label>
							</span>
							<input type="checkbox" alt="FinalReturn" class="styIRS8868Ckbox" name="FinalReturnInd" id="FinalReturnInd">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic6MonthExtensionOfTime/FinalReturnInd"/>
									<xsl:with-param name="BackupName">FinalReturn</xsl:with-param>
								</xsl:call-template>
							</input>
							<span class="styIRS8868CkboxText" style="width: 15mm; float: none; clear: none">
								<label for="FinalReturnInd"> Final return</label>
							</span><br/>
							<input type="checkbox" alt="AccountingPeriodChange" class="styIRS8868Ckbox" name="AccountingPeriodChangeInd" 
							id="AccountingPeriodChangeInd">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" 
										select="$IRS8868Data/Automatic6MonthExtensionOfTime/AccountingPeriodChangeInd"/>
									<xsl:with-param name="BackupName">AccountingPeriodChange</xsl:with-param>
								</xsl:call-template>
							</input>
							<span class="styIRS8868CkboxText" style="width:36mm; float: none; clear: none">
								<label for="AccountingPeriodChangeInd"> Change in accounting period</label>
							</span>
						</span>
					</div>
					<!--  END LINE 2  -->
					<!--  BEGIN LINE 3a  -->
					<div class="styBB" style="width:187mm;border-style:solid; border-width:1px; border-top-width:1; border-left-width:0px; 
					border-right-width:0px; float:left; height:auto; page-break-inside:avoid">
						<div style="width:187mm;float:left">
							<div class="styLNLeftNumBox" style="height:auto;">3a</div>
							<div class="styLNDesc" style="border: 0 solid black;border-bottom-width:1px;height:7mm;width:132mm">If this application is for Forms 
							990-PF, 990-T, 4720, or 6069, enter the tentative tax, less any nonrefundable credits. See instructions. <span style="width:2px;"/>
								<!-- Form to Form Link -->
							</div>
							<div class="styLNRightNumBox" style="height:7mm;">3a</div>
							<div class="styLNAmountBox" style="height:7mm;width:36mm"><!--7.5mm;-->
								<span class="styBoldText" style="padding-left:1mm;float:left;">$</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic6MonthExtensionOfTime/TentativeTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--  END LINE 3a  -->
						<!--  BEGIN LINE 3b  -->
						<div style="width:187mm;float:left">
							<div class="styLNLeftNumBox" style="height:4mm;">
								<span style="width:2mm; padding-left:2mm"/>b</div>
							<div class="styLNDesc" style="border: 0 solid black;border-bottom-width:1px;height:7mm;width:132mm">If this application is 
							for Forms
							 990-PF, 990-T, 4720, or 6069, enter any refundable credits and estimated tax payments made. Include any prior year 
							 overpayment 
							 allowed as a credit.<span style="width:2px;"/>
								<!-- Form to Form Link -->
							</div>
							<div class="styLNRightNumBox" style="height:7mm;">3b</div>
							<div class="styLNAmountBox" style="height:7mm;width:36mm">
								<span class="styBoldText" style="padding-left:1mm;float:left">$</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$IRS8868Data/Automatic6MonthExtensionOfTime/EstTaxPymtAndRfdblCreditAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--  END LINE 3b  -->
						<!--  BEGIN LINE 3c  -->
						<div style="width:187mm;height;auto">
							<div class="styLNLeftNumBox" style="height:4mm;">
								<span style="width:2mm;padding-left:2mm"/>c</div>
							<div class="styLNDesc" style="border: 0 solid black;height:7mm;width:132mm">
								<b>Balance due.</b> Subtract line 3b from line 3a. Include your payment with this form, if required, by using EFTPS (Electronic
								 Federal Tax Payment System). See instructions.      <span style="width:2px;"/>
								<!-- Form to Form Link -->
							</div>
							<div class="styLNRightNumBox" style="height:7mm;border-bottom-width:0">3c</div>
							<div class="styLNAmountBox" style="height:7mm;border-bottom-width:0;width:36mm">
								<span class="styBoldText" style="padding-left:1mm;float:left">$</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic6MonthExtensionOfTime/BalanceDueAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div class="styIRS8868LineItem" style="width:187mm;font-size:8pt; float:left;border-bottom-style:solid; border-bottom-width:1px">
						<b>Caution.</b> If you are going to make an electronic funds withdrawal (direct debit) with this Form 8868, see Form 8453-EO and Form 
						8879-EO	for payment instructions.</div>
					<!--  END LINE 3c  -->
					<!--BEGIN FOOTER-->
					<div class="pageEnd" style="clear:both;width:187mm;page-break-after:always; ">						
						<span style="width:115mm; float: left; clear: none;font-size:8pt;">
							<span class="styBoldText">For Privacy Act and Paperwork Reduction Act Notice, see instructions.</span>
						</span>
						<span style="width:70mm; float:right;  font-size:8pt;"><span style="width:30mm">Cat. No. 27916D</span>
						<span style="; font-size:7pt; float:right;">Form  <span class="styBoldText" style="font-size: 8pt;"> 8868  </span>  (Rev. 1-2022)</span>
						</span>
					</div>
					<!--END FOOTER-->					
					  <!-- end Page footer -->	
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">Additional Data</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTbl" style="float:left;">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$IRS8868Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Header - In Care Of Name</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Header - Business Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessNameControlTxt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
