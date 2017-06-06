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
		<html>
			<head>
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
					<div class="styBB" style="width:187mm; height:22mm;">
						<div class="styFNBox" style="width:31mm;height:22mm; border-right-width: 2px">
							<div style="padding-top:1mm;">
      Form<span class="styFormNumber">  8868</span>(Rev. January 2014)
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
						<div class="styFTBox" style="width:125mm;height:22mm">
							<div class="styMainTitle" style="height:7mm;">Application for Extension of Time To File an<br/>Exempt Organization Return</div>
							<div class="styFBT" style="height:5mm; font-size: 7pt; padding-top: 1mm">
								<img src="{$ImagePath}/8868_Bullet_Title.gif" alt="bullet"/> File a separate application for each return.<span style="width: 5mm"/>
								<div class="styFST" style="height:5mm;font-size:7pt;padding-top:1mm;">
									<img src="{$ImagePath}/8868_Bullet_Title.gif" alt="Bullet Image"/>
					  Information about Form 8868 and its instructions is at <a href="http://www.irs.gov/form8868" title="Link to IRS.gov">
										<i>www.irs.gov/form8868</i>
									</a>.
							</div>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:22mm; border-left-width: 2px; padding-top: 10mm; font-size: 7pt">OMB No. 1545-1709
  </div>
					</div>
					<!--   END FORM HEADER   -->
					<div style="width: 187mm">
						<img src="{$ImagePath}/8868_Bullet_Round.gif" alt="bullet"/>
						<label for="3MonthExtension"> If you are filing for an <b>Automatic 3-Month Extension, complete only Part I </b> and check this box</label>
						<b>
							<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.
  <span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.
  <span class="styIRS8868NBSP"/>.
  </b>
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
						<span style="width: 2mm"/>
						<!--						<input type="checkbox" class="styIRS8868Ckbox" name="3MonthExtension" TabIndex="-1" id="3MonthExtension" onclick="return false;"/>   -->
						<input type="checkbox" alt="alt" class="styIRS8868Ckbox" name="Automatic3MonthExtensionInd" TabIndex="-1" id="Automatic3MonthExtensionInd">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/Automatic3MonthExtensionInd"/>
							</xsl:call-template>
						</input>
					</div>
					<div style="width: 187mm">
						<img src="{$ImagePath}/8868_Bullet_Round.gif" alt="bullet"/> If you are filing for an <b>Additional (Not Automatic) 3-Month Extension, complete only Part II</b> (on page 2 of this form).
</div>
					<div class="styIRS8868NoteHdr" style="border-top-width: 0px; font-style:normal;border-bottom-width: 0px;">
						<span class="styItalicText">Do not complete Part II unless </span>
						<span style="font-weight:normal">you have already been granted an automatic 3-month extension on a previously filed Form 8868.</span>
					</div>
					<span style="font-style:normal;padding-top:1mm;height:12mm;width:187mm;">
						<b>Electronic filing (e-file).</b> You can electronically file Form 8868 if you need a 3-month automatic extension of time to file
(6 months for a corporation required to file Form 990-T), or an additional (not automatic) 3-month extension of time.  You can electronically file Form 8868 to request an extension of time to file any of the forms listed in Part I or Part II with the exception of Form 8870, Information Return for Transfers Associated With Certain Personal Benefit Contracts, which must be sent to IRS in paper format (see instructions).  For more details on the electronic filing of this form, visit <i>www.irs.gov/efile</i> and click on <i>e-file for Charities &#38; Nonprofits.</i>
					</span>
					<!--   BEGIN PART I   -->
					<!--   BEGIN PART I HEADER   -->
					<div class="styIRS8868PartHdr" style="border-bottom-width: 1px">
						<span class="styPartName">Part I</span>
						<span class="styPartDesc">Automatic 3-Month Extension of Time.<span style="font-weight: normal">  Only submit original (no copies needed).</span>
						</span>
					</div>
					<div style="width:187mm;"/>
					<div class="styIRS8868NoteHdr" style="border-bottom-width: 0px">
						<span>
							<label for="6MonthExtension">
								<span style="font-style:normal; font-weight: normal">A corporation required to file Form 990-T and requesting an automatic 6-month extension?check this box and complete<br/> Part I only</span>
							</label>
						</span>
						<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span style="width: 11px"/>
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
						<span style="width: 2mm"/>
						<!--						<input type="checkbox" class="styIRS8868Ckbox" name="6MonthExtension" TabIndex="-1" id="6MonthExtension" onclick="return false;"/>    -->
						<input type="checkbox" alt="alt" class="styIRS8868Ckbox" name="Automatic6MonthExtensionInd" TabIndex="-1" id="Automatic6MonthExtensionInd">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/Automatic6MonthExtensionInd"/>
							</xsl:call-template>
						</input>
					</div>
					<span class="styBB" style="font-style: italic; font-weight:normal; width: 187mm;padding-top:1mm;height:8mm;border-bottom-width:0px;">All other corporations (including 1120-C filers), partnerships, REMICs, and trusts must use Form 7004 to request an extension of time to file income tax returns.<br/>
					</span>
					<span class="styBB" style="width:187mm;font-weight:bold;text-align:center;clear:none;">Enter filer's identifying number, see instructions<br/>
					</span>
					<!--   END PART I HEADER   -->
					<div style="width:187mm;float:left;clear:none;">
						<div class="styUseLbl" style="width:18mm;height:33mm; font-size: 7pt; border-top-width: 0px">
							<b>Type or print</b>
							<br/>
							<span style="font-size: 6pt; font-weight: normal">File by the due date for filing your return. See instructions.</span>
						</div>
						<div class="styNameAddr" style=" border-bottom-width: 0px; border-top-width: 0px; border-right-width: 1px;width:110mm;height:13mm;font-size: 7pt;">
      Name of exempt organization or other filer, see instructions.<br/>
							<!--  xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/BooksInCareOfDetail/BusinessName/BusinessNameLine2"/>
											</xsl:call-template>  -->
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
						<div class="styFNBox" style="padding-left:2mm;font-size:7pt;width:59mm;height:13mm;border-right-width:0px;border-bottom-width:1px;">Employer identification number (EIN) <b>or</b>
							<br/>
							<br/>
							<span style="text-align:left;font-size: 7pt; font-weight:normal;">
								<!-- Since this is a main form, we must check for and display an updated EIN.  To do this, we use the EINChanged parameter when calling PopulateReturnHeaderFiler.-->
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="EINChanged">true</xsl:with-param>
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div class="styNameAddr" style="width:110mm;height:11mm; font-size:7pt; border-top-width: 1px;border-right-width: 1px;border-bottom-width:0px;">
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
						<div class="styFNBox" style="padding-left:2mm;font-size:7pt;width:59mm;border-right-width:0px;">Social security number (SSN)<br/>
							<br/>
							<span style="text-align:left;font-size: 7pt; font-weight:normal;">
								<!-- Since this is a main form, we must check for and display an updated EIN.  To do this, we use the EINChanged parameter when calling PopulateReturnHeaderFiler.-->
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="EINChanged">false</xsl:with-param>
									<xsl:with-param name="TargetNode">SSN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div class="styNameAddr" style="border-bottom-width: 0px;border-top-width:1px;width:169mm;height:8mm;font-size: 7pt">
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
					<div style="width: 187mm; border-style:solid; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width: 1px; font-size: 8pt">
						Enter the Return code for the return that this application is for (file a separate application for each return):
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/ExtensionReturnCd"/>
						</xsl:call-template>
					</div>
					<table style="font-size:7pt;border-color:black;" class="styTable" cellspacing="0" summary="Table displaying entity name or names and corresponding employer identification numbers" name="GBCtable" id="GBCtable">
						<thead class="styTableThead">
							<tr>
								<th scope="col" class="styTableCell" style="width:68mm;font-size:7pt;text-align:left;border-bottom:none;font-weight:bold;border-left-width:1px;">Application</th>
								<th scope="col" class="styTableCell" style="width:24mm;font-size:7pt;text-align:center;border-bottom:none;font-weight:bold;border-right-width:2px;">Return</th>
								<th scope="col" class="styTableCell" style="width:68mm;font-size:7pt;text-align:left;border-bottom:none;font-weight:bold;">Application</th>
								<th scope="col" class="styTableCell" style="width:24mm;font-size:7pt;text-align:center;border-bottom:none;font-weight:bold;">Return</th>
							</tr>
							<tr>
								<th scope="col" class="styTableCell" style="width:68mm;font-size:7pt;text-align:left;font-weight:bold;border-left-width:1px;">Is For:<br/>
								</th>
								<th scope="col" class="styTableCell" style="width:24mm;font-size:7pt;text-align:center;font-weight:bold;border-right-width:2px;">Code<br/>
								</th>
								<th scope="col" class="styTableCell" style="width:68mm;font-size:7pt;text-align:left;font-weight:bold;">Is For:<br/>
								</th>
								<th scope="col" class="styTableCell" style="width:24mm;font-size:7pt;text-align:center;font-weight:bold;">Code<br/>
								</th>
							</tr>
							<tr>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;border-left-width:1px;">Form 990 or Form 990-EZ</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;font-weight:normal;border-right-width:2px;">01</th>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;border-right-width:1px;">Form 990-T(corporation)</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;font-weight:normal;">07</th>
							</tr>
							<tr>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;border-left-width:1px;">Form 990-BL</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;border-right-width:2px;font-weight:normal;">02</th>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;">Form 1041-A</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;font-weight:normal;">08</th>
							</tr>
							<tr>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;border-left-width:1px;">Form 4720 (Individual)</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;border-right-width:2px;font-weight:normal;">03</th>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;">Form 4720 (other than individual)</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;font-weight:normal;">09</th>
							</tr>
							<tr>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;border-left-width:1px;">Form 990-PF</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;border-right-width:2px;font-weight:normal;">04</th>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;">Form 5227</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;font-weight:normal;">10</th>
							</tr>
							<tr>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;border-left-width:1px;">Form 990-T (sec. 401(a) or 408(a) trust)</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;border-right-width:2px;font-weight:normal;">05</th>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;">Form 6069</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;font-weight:normal;">11</th>
							</tr>
							<tr>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;border-left-width:1px;">Form 990-T (trust other than above)</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;border-right-width:2px;font-weight:normal;">06</th>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;">Form 8870</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;font-weight:normal;">12</th>
							</tr>
						</thead>
					</table>
					<!--Schema Mods for TY2004 -->
					<!--The books are in the care of - Person or Business Name-->
					<div style="width:187mm;"/>
					<div style="width: 187mm;">
						<div class="styGenericDiv">
							<img src="{$ImagePath}/8868_Bullet_Round.gif" alt="bullet"/> The books are in the care of
      <span style="width:   2mm"/>
							<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
							<span style="width: 2mm"/>
						</div>
						<div class="styGenericDiv" style="width:140mm;border-bottom:1 solid black;">
							<div style="font-family:verdana;">
					
								<xsl:choose>
									<xsl:when test="$IRS8868Data/Automatic3MonthExtensionOfTime/BooksInCareOfDetail/PersonNm">
										<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/BooksInCareOfDetail/PersonNm"/>
											</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:if test ="$IRS8868Data/Automatic3MonthExtensionOfTime/BooksInCareOfDetail/PersonNm='' ">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/BooksInCareOfDetail/BusinessName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="$IRS8868Data/Automatic3MonthExtensionOfTime/BooksInCareOfDetail/BusinessName/BusinessNameLine2Txt != '' ">
												
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/BooksInCareOfDetail/BusinessName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:if>
									</xsl:otherwise>
								</xsl:choose>
								<span style="width:1px">,</span>
								<span style="width:2px"/> 
							<xsl:choose>
								<xsl:when test="$IRS8868Data/Automatic3MonthExtensionOfTime/BooksInCareOfDetail/USAddress">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/BooksInCareOfDetail/USAddress/AddressLine1Txt"/>
									</xsl:call-template>
									<span style="width:1px">,</span>
									<span style="width:2px"/> 
									
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/BooksInCareOfDetail/USAddress/AddressLine2Txt"/>
									</xsl:call-template>
									<span style="width:1px">,</span>
									<span style="width:2px"/> 
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/BooksInCareOfDetail/USAddress/CityNm"/>
									</xsl:call-template>
									<span style="width:1px">,</span>
									<span style="width:2px"/> 
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/BooksInCareOfDetail/USAddress/StateAbbreviationCd"/>
									</xsl:call-template>
									<span style="width:1px"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/BooksInCareOfDetail/USAddress/ZIPCd"/>
									</xsl:call-template>
								
								</xsl:when>
								<xsl:otherwise >
									<xsl:if test="$IRS8868Data/Automatic3MonthExtensionOfTime/BooksInCareOfDetail/ForeignAddress">
										<xsl:call-template name="PopulateForeignAddressTemplate">
											<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/BooksInCareOfDetail/ForeignAddress"/>
										</xsl:call-template>
									</xsl:if>
								</xsl:otherwise>
							</xsl:choose>
							</div>
						</div>	
					</div>
					<!--Telephone No. and Fax No. -->
					<div style="width:187mm;"/>
					<div style="width: 187mm;">
						<span style="width:3mm"/>Telephone No.<span style="width: 2mm"/>
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
						<span style="width: 2mm"/>
						<span class="styFixedUnderline" style="float:none;width:40mm">
							<xsl:call-template name="PopulatePhoneNumber">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/BooksInCareOfDetail/PhoneNum"/>
							</xsl:call-template>
						</span>
						<span style="width:17mm"/>Fax No.<span style="width: 2mm"/>
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
						<span style="width: 2mm"/>
						<span class="styFixedUnderline" style="float:none;width:40mm">
							<xsl:call-template name="PopulatePhoneNumber">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/BooksInCareOfDetail/FaxNum"/>
							</xsl:call-template>
						</span>
					</div>
					<!--End schema mods -->
					<div style="width: 187mm">
						<img src="{$ImagePath}/8868_Bullet_Round.gif" alt="bullet"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/OrgHasNoOfficeInUSInd"/>
							</xsl:call-template> If the organization does not have an office or place of business in the United States, check this box</label>
						<b>
							<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.
  <span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.
  </b>
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
						<span style="width: 2mm"/>
						<input type="checkbox" class="styIRS8868Ckbox" name="OrgHasNoOfficeInUSInd" id="OrgHasNoOfficeInUSInd">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/OrgHasNoOfficeInUSInd"/>
							</xsl:call-template>
						</input>
					</div>
					<div style="width: 187mm">
						<!--						<img src="{$ImagePath}/8868_Bullet_Round.gif" alt="bullet"/> If this is for a Group Return, enter the organization's four digit Group Exemption Number (GEN)_____________.  -->
						<img src="{$ImagePath}/8868_Bullet_Round.gif" alt="bullet"/> If this is for a Group Return, enter the organization's four digit Group Exemption Number (GEN)
						<span class="styFixedUnderline" style="float:none;text-align:center;width:21mm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/GroupExemptionNum"/>
							</xsl:call-template>
						</span>.
    <label for="WholeGroupInd">If this is for the whole group, check this box</label>
						<b>
							<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.</b>
						<span style="width: 2mm"/>
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
						<span style="width: 2mm"/>
						<!--<input type="checkbox" class="styIRS8868Ckbox" name="WholeGroup" TabIndex="-1" id="WholeGroup" onclick="return false"/>   -->
						<input type="checkbox" alt="alt" class="styIRS8868Ckbox" name="WholeGroupInd" TabIndex="-1" id="WholeGroupInd">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/WholeGroupInd"/>
							</xsl:call-template>
						</input>.
						 <label for="PartGroup"> If it is for part of the group, check this box</label>
						<b>
							<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.</b>
						<span style="width: 2mm"/>
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
						<span style="width: 2mm"/>
						<!--<input type="checkbox" class="styIRS8868Ckbox" name="PartGroup" TabIndex="-1" id="PartGroup" onclick="return false"/>    -->
						<input type="checkbox" alt="alt" class="styIRS8868Ckbox" name="PartialGroupInd" id="PartialGroupInd">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/PartialGroupInd"/>
							</xsl:call-template>
						</input>
						and attach a list with the names and EINs of all members the extension is for.
						
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/PartialGroupInd"/>
						</xsl:call-template>
					</div>
					<!--   BEGIN LINE 1   -->
					<div class="styIRS8868LineItem" style="border-top-width: 1px">
						<span class="styIRS8868LNLeftNumBox" style="margin-right: 1mm">1</span>
						<span class="styIRS8868LNDesc" style="width: 180mm">I request an automatic 3-month (6 months for a  corporation required to file Form 990-T) extension of time until 
								<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/ExtensionDt"/>
							</xsl:call-template>
						to file the exempt organization return for the organization named above.  The extension is for the organization's return for:
					  </span>
					</div>
					<div class="styIRS8868LineItem" style="margin-left: 3mm">
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
						<span style="width: 2mm"/>
						<xsl:choose>
							<xsl:when test="$RtnHdrData/TaxYr != ''  ">
								<input type="checkbox" class="styIRS8868Ckbox" name="CalendarYearInd" id="CalendarYearInd" checked="checked"/>
							</xsl:when>
							<xsl:otherwise>
								<input type="checkbox" class="styIRS8868Ckbox" name="CalendarYearInd" TabIndex="-1" id="CalendarYearInd" onclick="return false;"/>
							</xsl:otherwise>
						</xsl:choose>
						<span class="styIRS8868CkboxText" style="float: none; clear:none">
							<label for="CalendarYearInd"> calendar year 
    <span style="width:8mm;border-style:solid;float:none;clear:none;padding-left: .5mm" class="styBB">
									<xsl:if test="$RtnHdrData/TaxYr != '' ">
										<xsl:call-template name="PopulateReturnHeaderTaxYear"/>
									</xsl:if>
								</span> or</label>
						</span>
					</div>
					<div class="styIRS8868LineItem" style="margin-left: 3mm">
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
						<span style="width: 2mm"/>
						<xsl:choose>
							<xsl:when test="substring($RtnHdrData/TaxPeriodEndDt,6,5) != ''">
								<input type="checkbox" class="styIRS8868Ckbox" name="TaxYearCheckBox" id="TaxYearCheckBox" onclick="return false" checked="checked"/>
							</xsl:when>
							<xsl:otherwise>
								<input type="checkbox" class="styIRS8868Ckbox" name="TaxYearCheckBox" TabIndex="-1" id="TaxYearCheckBox" onclick="return false;"/>
							</xsl:otherwise>
						</xsl:choose>
						<span class="styIRS8868CkboxText" style="width: 160mm; float: none; clear: none">
							<label for="TaxYearCheckBox"> tax year beginning         
        <!--<xsl:choose>
									<xsl:when test="substring($RtnHdrData/TaxPeriodEndDt,6,5) != '12-31'">-->
								<span style="padding-left: 1mm;width:20mm;border-style:solid;float:none;clear:none;" class="styBB">
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
								</span>
								<!--</xsl:when>-->
								<!--<xsl:otherwise>-->
								<!--
										<span style="width:20mm;border-style:solid;float:none;clear:none;" class="styBB"/>
										<span style="width:4px;"/>,<span style="width:4px;"/>
										<span style="width:8mm;border-style:solid;float:none;clear:none;padding-left: .5mm" class="styBB"/>
										<span style="width:4px;"/>,-->
								<!--</xsl:otherwise>-->
								<!--</xsl:choose>-->
							</label>
							<!-- Deleted in the 2003V02 schema
      <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$IRS8868Data/TaxYearBeginningDate" />
      </xsl:call-template>  -->
							<label for="TaxYearCheckBox"> and ending
        <!--<xsl:choose>
									<xsl:when test="substring($RtnHdrData/TaxPeriodEndDt,6,5) != '12-31'">-->
								<span style="padding-left: 1mm;width:20mm;border-style:solid;float:none;clear:none;" class="styBB">
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
								</span>
								<!--</xsl:when>
									<xsl:otherwise>-->
								<!--
										<span style="width:20mm;border-style:solid;float:none;clear:none;" class="styBB"/>
										<span style="width:4px;"/>,<span style="width:4px;"/>
										<span style="width:8mm;border-style:solid; float:none;clear:none;padding-left: .5mm" class="styBB"/>
										<span style="width:4px;"/>,-->
								<!--</xsl:otherwise>
								</xsl:choose>-->
							</label>
						</span>
						<!--  Deleted in the 2003V02 schema
    <xsl:call-template name="PopulateText">
      <xsl:with-param name="TargetNode" select="$IRS8868Data/TaxYearEndingDate" />
    </xsl:call-template>  -->
					</div>
					<!--   END LINE 1   -->
					<br/>
					<br/>
					<!--  BEGIN LINE 2  -->
					<div class="styIRS8868LineItem">
						<span class="styIRS8868LNLeftNumBox" style="margin-right: 1mm;padding-top:3mm;">2</span>
						<span class="styIRS8868LNDesc" style="width: 180mm">If the tax year entered in line 1 is for less than 12 months, check reason: <span style="width: 1mm"/>
							<!--							<input type="checkbox" class="styIRS8868Ckbox" name="InitialReturn" TabIndex="-1" id="InitialReturn" onclick="return false;"/>   -->
							<input type="checkbox" alt="alt" class="styIRS8868Ckbox" name="InitialReturn" TabIndex="-1" id="InitialReturn">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/InitialReturnInd"/>
								</xsl:call-template>
							</input>
							<span class="styIRS8868CkboxText" style="width: 15mm; float: none; clear: none">
								<label for="InitialReturn"> Initial return</label>
							</span>
							<!--							<input type="checkbox" class="styIRS8868Ckbox" name="FinalReturn" TabIndex="-1" id="FinalReturn" onclick="return false;"/>   -->
							<input type="checkbox" alt="alt" class="styIRS8868Ckbox" name="FinalReturnInd" id="FinalReturnInd">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/FinalReturnInd"/>
								</xsl:call-template>
							</input>
							<span class="styIRS8868CkboxText" style="width: 15mm; float: none; clear: none">
								<label for="FinalReturnInd"> Final return</label>
							</span>
							<span style="width:3mm"/>
							<!--							<input type="checkbox" class="styIRS8868Ckbox" name="ChangeAccountingPeriod" TabIndex="-1" id="ChangeAccountingPeriod" onclick="return false;"/>   -->
							<input type="checkbox" alt="alt" class="styIRS8868Ckbox" name="AccountingPeriodChangeInd" TabIndex="-1" id="AccountingPeriodChangeInd">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/AccountingPeriodChangeInd"/>
								</xsl:call-template>
							</input>
							<span class="styIRS8868CkboxText" style="width:30mm; float: none; clear: none">
								<label for="AccountingPeriodChangeInd"> Change in accounting period</label>
							</span>
						</span>
					</div>
					<!--  END LINE 2  -->
					<!--  BEGIN LINE 3a  -->
					<div class="styBB" style="width:187mm;border-top-width:1">
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">3a</div>
							<div class="styLNDesc" style="border: 0 solid black;border-bottom-width:1px;height:7.5mm;width:136mm">If this application is for Forms 990-BL, 990-PF, 990-T, 4720, or 6069, enter the tentative tax, less any nonrefundable credits. See instructions. <span style="width:2px;"/>
								<!-- Form to Form Link -->
							</div>
							<div class="styLNRightNumBox" style="padding-top:3.75mm;height:7.5mm;">3a</div>
							<div class="styLNAmountBox" style="height:7.5mm; padding-top:3.75mm;width:34mm">
								<span class="styBoldText" style="padding-left:1mm;float:left;">$</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/TentativeTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--  END LINE 3a  -->
						<!--  BEGIN LINE 3b  -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">
								<span style="width:2mm"/>b</div>
							<div class="styLNDesc" style="border: 0 solid black;border-bottom-width:1px;height:7.5mm;width:136mm">If this application is for Forms 990-PF, 990-T, 4720, or 6069, enter any refundable credits and estimated tax payments made. Include any prior year overpayment allowed as a credit.<span style="width:2px;"/>
								<!-- Form to Form Link -->
							</div>
							<div class="styLNRightNumBox" style="padding-top:3.75mm;height:7.5mm;">3b</div>
							<div class="styLNAmountBox" style="height:7.5mm; padding-top:3.75mm;width:34mm">
								<span class="styBoldText" style="padding-left:1mm;float:left">$</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/EstTaxPymtAndRfdblCreditAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--  END LINE 3b  -->
						<!--  BEGIN LINE 3c  -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">
								<span style="width:2mm"/>c</div>
							<div class="styLNDesc" style="border: 0 solid black;height:7.5mm;width:136mm">
								<b>Balance due.</b> Subtract line 3b from line 3a. Include your payment with this form, if required, by using EFTPS (Electronic Federal Tax Payment System). See instructions.      <span style="width:2px;"/>
								<!-- Form to Form Link -->
							</div>
							<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.75mm;border-bottom-width:0">3c</div>
							<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.75mm;border-bottom-width:0;width:34mm">
								<span class="styBoldText" style="padding-left:1mm;float:left">$</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/BalanceDueAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div class="styIRS8868LineItem" style="border-bottom-width: 1px">
						<b>Caution.</b> If you are going to make an electronic funds withdrawal (direct debit) with this Form 8868, see Form 8453-EO and Form 8879-EO	for payment instructions.</div>
					<!--  END LINE 3c  -->
					<!--BEGIN FOOTER-->
					<div style="width:187mm">
						<div style="float: left; clear: none;">
							<span class="styBoldText">For Privacy Act and Paperwork Reduction Act Notice, see Instructions.</span>
						</div>
						<div style="float:right">
    Cat. No. 27916D 
    <span style="width:70px"/>
    Form<span class="styBoldText" style="font-size: 8pt"> 8868 </span>(Rev. 1-2014)
  </div>
					</div>
					<!--END FOOTER-->
					<br/>
					<div class="pageEnd"/>
					<div class="styBB" style="width:187mm;">
						<div style="float:left;clear:none;">Form 8868 (Rev. 1-2014)</div>
						<div style="float:right">Page <span class="styBoldText" style="font-size: 8pt">2</span>
						</div>
					</div>
					<!--   END FORM HEADER   -->
					<div style="width: 187mm">
						<img src="{$ImagePath}/8868_Bullet_Round.gif" alt="bullet"/>
						<label for="3MonthExtension"> If you are filing for an <b>Additional (Not Automatic) 3-Month Extension, complete only Part II </b> and check this box</label>
						<b>
							<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.
  <span class="styIRS8868NBSP"/>.
							
  </b>
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>

						<input type="checkbox" alt="alt" class="styIRS8868Ckbox" name="Additional3MonthExtensionInd" TabIndex="-1" id="Additional3MonthExtensionInd">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/Additional3MonthExtensionInd"/>
							</xsl:call-template>
						</input>
					</div>
					<div class="styIRS8868NoteHdr" style="border-top-width: 0px; font-style:normal;border-bottom-width: 0px;">
						<span style="font-weight:normal">
							<b>Note.</b> Only complete Part II if you have already been granted an automatic 3-month extension on a previously filed Form 8868.</span>
					</div>
					<div style="width: 187mm">
						<img src="{$ImagePath}/8868_Bullet_Round.gif" alt="bullet"/> If you are filing for an <b>Automatic 3-Month Extension, complete only Part I</b> (on page 1).
					</div>
					<!--   BEGIN PART II   -->
					<!--   BEGIN PART II HEADER   -->
					<div class="styIRS8868PartHdr">
						<span class="styPartName">Part II</span>
						<span class="styPartDesc">Additional (Not Automatic) 3-Month Extension of Time.<span style="font-weight: normal">  Only file the original (no copies needed).</span>
						</span>
					</div>
					<span class="styBB" style="width:187mm;font-weight:bold;clear:none;text-align:center;">Enter filer's identifying number, see instructions<br/>
					</span>
					<!--   END PART II HEADER   -->
					<div style="width:187mm;float:left;clear:none;">
						<div class="styUseLbl" style="width:18mm;height:33mm; font-size: 7pt; border-top-width: 0px">
							<b>Type or print</b>
							<br/>
							<span style="font-size: 6pt; font-weight: normal">File by the due date for filing your return. See instructions.</span>
						</div>
						<div class="styNameAddr" style=" border-bottom-width: 0px; border-top-width: 0px; border-right-width: 1px;width:110mm;height:13mm;font-size: 7pt">
      Name of exempt organization or other filer, see instructions.<br/>
							<xsl:if test="$IRS8868Data/Addnl3MonthExtensionOfTime/Additional3MonthExtensionInd">
								<span style="font-family:verdana;font-size:6pt;">
											<xsl:call-template name="PopulateReturnHeaderFiler">
													<xsl:with-param name="TargetNode" >BusinessNameLine1Txt</xsl:with-param>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateReturnHeaderFiler">
													<xsl:with-param name="TargetNode" >BusinessNameLine2Txt</xsl:with-param>
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
							</xsl:if>
						</div>
						<!--						<div class="styFNBox" style="padding-left:2mm;font-size:7pt;">Employer identification number (EIN) <b>or</b><br/>    -->
						<div class="styFNBox" style="padding-left:2mm;font-size:7pt;width:59mm;height:13mm;border-right-width:0px;border-bottom-width:1px;">Employer identification number (EIN) <b>or</b>
							<br/>
							<br/>
							<xsl:if test="$IRS8868Data/Addnl3MonthExtensionOfTime/Additional3MonthExtensionInd">
								<span style="text-align:left;font-size: 7pt; font-weight:normal;">
									<!-- Since this is a main form, we must check for and display an updated EIN.  To do this, we use the EINChanged parameter when calling PopulateReturnHeaderFiler.-->
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="EINChanged">true</xsl:with-param>
										<xsl:with-param name="TargetNode">EIN</xsl:with-param>
									</xsl:call-template>
								</span>
							</xsl:if>
						</div>
						<!--						<div class="styNameAddr" style="width:110mm;height:10mm; font-size:7pt; border-top-width: 1px">    -->
					
						<div class="styNameAddr" style="width:110mm;height:10mm; font-size:7pt; border-top-width: 1px;border-right-width: 1px;border-bottom-width:0px;">
							<!-- width used to be 169mm -->
	Number, street, and room or suite no. If a P.O. box, see instructions.<br/>
							<xsl:if test="$IRS8868Data/Addnl3MonthExtensionOfTime/Additional3MonthExtensionInd">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
									</xsl:call-template>
							</xsl:if>		
						</div>
						
						<div class="styFNBox" style="padding-left:2mm;font-size:7pt;width:59mm;border-right-width:0px;">Social security number (SSN)<br/>
							<br/>
						<xsl:if test="$IRS8868Data/Addnl3MonthExtensionOfTime/Additional3MonthExtensionInd">
							<span style="text-align:left;font-size: 7pt; font-weight:normal;">
								<!-- Since this is a main form, we must check for and display an updated EIN.  To do this, we use the EINChanged parameter when calling PopulateReturnHeaderFiler.-->
						
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="EINChanged">false</xsl:with-param>
										<xsl:with-param name="TargetNode">SSN</xsl:with-param>
									</xsl:call-template>
							</span>
						</xsl:if>	
						</div>
						<!--						<div class="styNameAddr" style="border-bottom-width: 0px;width:169mm;height:8mm;font-size: 7pt">  -->
						<div class="styNameAddr" style="border-bottom-width: 0px;border-top-width:1px;width:169mm;height:8mm;font-size: 7pt">  
      City, town or post office, state, and ZIP code. For a foreign address, see instructions.<br/>
						  <xsl:if test="$IRS8868Data/Addnl3MonthExtensionOfTime/Additional3MonthExtensionInd">
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
								<xsl:with-param name="MainForm">true</xsl:with-param>
							</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<div style="width: 187mm; border-style:solid; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width: 1px; font-size: 8pt">
						Enter the Return code for the return that this application is for (file a separate application for each return):
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/ExtensionReturnCd"/>
						</xsl:call-template>
					</div>
					<table style="font-size:7pt;border-color:black;" class="styTable" cellspacing="0" summary="Table displaying entity name or names and corresponding employer identification numbers" name="GBCtable" id="GBCtable">
						<thead class="styTableThead">
							<tr>
								<th scope="col" class="styTableCell" style="width:68mm;font-size:7pt;text-align:left;border-bottom:none;font-weight:bold;border-left-width:1px;">Application</th>
								<th scope="col" class="styTableCell" style="width:24mm;font-size:7pt;text-align:center;border-bottom:none;font-weight:bold;border-right-width:2px;">Return</th>
								<th scope="col" class="styTableCell" style="width:68mm;font-size:7pt;text-align:left;border-bottom:none;font-weight:bold;">Application</th>
								<th scope="col" class="styTableCell" style="width:24mm;font-size:7pt;text-align:center;border-bottom:none;font-weight:bold;">Return</th>
							</tr>
							<tr>
								<th scope="col" class="styTableCell" style="width:68mm;font-size:7pt;text-align:left;font-weight:bold;border-left-width:1px;">Is For:<br/>
								</th>
								<th scope="col" class="styTableCell" style="width:24mm;font-size:7pt;text-align:center;font-weight:bold;border-right-width:2px;">Code<br/>
								</th>
								<th scope="col" class="styTableCell" style="width:68mm;font-size:7pt;text-align:left;font-weight:bold;">Is For:<br/>
								</th>
								<th scope="col" class="styTableCell" style="width:24mm;font-size:7pt;text-align:center;font-weight:bold;">Code<br/>
								</th>
							</tr>
							<tr>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;border-left-width:1px;">Form 990 or Form 990-EZ</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;border-right-width:2px;font-weight:normal;">01</th>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;border-left-width:0px;background-color:lightgrey;">
									<font color="lightgrey">Form 990 or Form 990-EZ</font>
								</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;border-right-width:2px;font-weight:normal;background-color:lightgrey;">
									<font color="lightgrey">01</font>
								</th>
							</tr>
							<tr>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;border-left-width:1px;">Form 990-BL</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;border-right-width:2px;font-weight:normal;">02</th>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;">Form 1041-A</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;font-weight:normal;">08</th>
							</tr>
							<tr>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;border-left-width:1px;">Form 4720 (Individual)</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;border-right-width:2px;font-weight:normal;">03</th>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;">Form 4720 (other than individual)</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;font-weight:normal;">09</th>
							</tr>
							<tr>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;border-left-width:1px;">Form 990-PF</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;border-right-width:2px;font-weight:normal;">04</th>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;">Form 5227</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;font-weight:normal;">10</th>
							</tr>
							<tr>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;border-left-width:1px;">Form 990-T (sec. 401(a) or 408(a) trust)</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;border-right-width:2px;font-weight:normal;">05</th>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;">Form 6069</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;font-weight:normal;">11</th>
							</tr>
							<tr>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;border-left-width:1px;">Form 990-T (trust other than above)</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;border-right-width:2px;font-weight:normal;">06</th>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;">Form 8870</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;font-weight:normal;">12</th>
							</tr>
						</thead>
					</table>
					<div style="width:187mm;border-bottom:1 solid black;">
						<b>STOP! Do not complete Part II if you were not already granted an automatic 3-month extension on a previously filed Form 8868.</b>
					</div>
					<!--Schema Mods for TY2004 -->
					<!--The books are in the care of - Person or Business Name-->
					<div style="width:187mm;"/>
					<div style="width: 187mm;">
						<div class="styGenericDiv">
							<img src="{$ImagePath}/8868_Bullet_Round.gif" alt="bullet"/> The books are in the care of
      <span style="width:   2mm"/>
							<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
							<span style="width: 2mm"/>
						</div>
						<div class="styGenericDiv" style="width:140mm;border-bottom:1 solid black;">
							<xsl:if test="$IRS8868Data/Addnl3MonthExtensionOfTime/Additional3MonthExtensionInd">
									<div style="font-family:verdana;">
								
								<xsl:choose>
										<xsl:when test="$IRS8868Data/Addnl3MonthExtensionOfTime/BooksInCareOfDetail/PersonNm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/BooksInCareOfDetail/PersonNm"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/BooksInCareOfDetail/BusinessName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="$IRS8868Data/Addnl3MonthExtensionOfTime/BooksInCareOfDetail/BusinessName/BusinessNameLine2Txt != '' ">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/BooksInCareOfDetail/BusinessName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:otherwise>
									</xsl:choose>
									<span style="width:1px">,</span>
									<span style="width:2px"/> 
									
								<xsl:choose>
									<xsl:when test="$IRS8868Data/Automatic3MonthExtensionOfTime/BooksInCareOfDetail/USAddress">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/BooksInCareOfDetail/USAddress/AddressLine1Txt"/>
										</xsl:call-template>
										<span style="width:1px">,</span>
										<span style="width:2px"/> 							
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/BooksInCareOfDetail/USAddress/AddressLine2Txt"/>
										</xsl:call-template>
										<span style="width:1px">,</span>
										<span style="width:2px"/> 
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/BooksInCareOfDetail/USAddress/CityNm"/>
										</xsl:call-template>
										<span style="width:1px">,</span>
										<span style="width:2px"/> 
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/BooksInCareOfDetail/USAddress/StateAbbreviationCd"/>
										</xsl:call-template>
										<span style="width:1px"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/BooksInCareOfDetail/USAddress/ZIPCd"/>
										</xsl:call-template>
									
									</xsl:when>
									<xsl:otherwise >
										<xsl:if test="$IRS8868Data/Addnl3MonthExtensionOfTime/BooksInCareOfDetail/ForeignAddress">
											<xsl:call-template name="PopulateForeignAddressTemplate">
												<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/BooksInCareOfDetail/ForeignAddress"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:otherwise>
								</xsl:choose>
								</div>
							</xsl:if>
						</div>	
					</div>
			
					
					<!--Telephone No. and Fax No. -->
					<div style="width:187mm;"/>
					<div style="width: 187mm;">
						<span style="width:3mm"/>Telephone No.<span style="width: 2mm"/>
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
						<span style="width: 2mm"/>
						<span class="styFixedUnderline" style="float:none;width:40mm">
							<xsl:call-template name="PopulatePhoneNumber">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/BooksInCareOfDetail/PhoneNum"/>
							</xsl:call-template>
						</span>
						<span style="width:17mm"/>Fax No.<span style="width: 2mm"/>
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
						<span style="width: 2mm"/>
						<span class="styFixedUnderline" style="float:none;width:40mm">
							<xsl:call-template name="PopulatePhoneNumber">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/BooksInCareOfDetail/FaxNum"/>
							</xsl:call-template>
						</span>
					</div>
					<!--End schema mods -->
					<div style="width: 187mm">
						<img src="{$ImagePath}/8868_Bullet_Round.gif" alt="bullet"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/OrgHasNoOfficeInUSInd"/>
							</xsl:call-template> If the organization does not have an office or place of business in the United States, check this box</label>
						<b>
							<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.
  <span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.
  </b>
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
						<span style="width: 2mm"/>
						<input type="checkbox" alt="alt" class="styIRS8868Ckbox" name="OrgHasNoOfficeInUSInd" id="OrgHasNoOfficeInUSInd">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/OrgHasNoOfficeInUSInd"/>
							</xsl:call-template>
						</input>
					</div>
					<div style="width: 187mm">
						<!--						<img src="{$ImagePath}/8868_Bullet_Round.gif" alt="bullet"/> If this is for a Group Return, enter the organization's four digit Group Exemption Number (GEN)_____________.  -->
						<img src="{$ImagePath}/8868_Bullet_Round.gif" alt="bullet"/> If this is for a Group Return, enter the organization's four digit Group Exemption Number (GEN)
						<span class="styFixedUnderline" style="float:none;text-align:center;width:21mm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/GroupExemptionNum"/>
							</xsl:call-template>
						</span>.
    <label for="WholeGroupInd">If this is for the whole group, check this box</label>
						<span style="width: 2mm"/>
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
						<span style="width: 2mm"/>
						<!--						<input type="checkbox" class="styIRS8868Ckbox" name="WholeGroup" TabIndex="-1" id="WholeGroup" onclick="return false"/>   -->
						<input type="checkbox" alt="alt" class="styIRS8868Ckbox" name="WholeGroupInd" TabIndex="-1" id="WholeGroupInd">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/WholeGroupInd"/>
							</xsl:call-template>
						</input>							
						. <label for="PartGroup"> If it is for part of the group, check this box</label>
						<span style="width: 2mm"/>
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
						<span style="width: 2mm"/>
						<!--						<input type="checkbox" class="styIRS8868Ckbox" name="PartGroup" TabIndex="-1" id="PartGroup" onclick="return false"/>   -->
						<input type="checkbox" alt="alt" class="styIRS8868Ckbox" name="PartialGroupInd" TabIndex="-1" id="PartialGroupInd">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/PartialGroupInd"/>
							</xsl:call-template>
						</input>							
						 and attach a list with the names and EINs of all members the extension is for.
						 
						 <xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/PartialGroupInd"/>
						</xsl:call-template>
					</div>
					<!--   BEGIN LINE 4   -->
					<div class="styIRS8868LineItem" style="border-top-width: 1px">
						<br/>
						<span class="styIRS8868LNLeftNumBox" style="margin-right: 1mm">4</span>
						<span class="styIRS8868LNDesc" style="width: 180mm">I request an additional 3-month extension of time until <span style="width:25mm;border-style:solid;float:none;clear:none;padding-left: .5mm" class="styBB">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/ExtensionDt"/>
								</xsl:call-template>
							</span>.
 						</span>
					</div>
					<!--   BEGIN LINE 5   -->
					<div class="styIRS8868LineItem" style="border-top-width: 0px">
						<span class="styIRS8868LNLeftNumBox" style="margin-right: 1mm">5</span>
						<span class="styIRS8868LNDesc" style="width: 180mm">For calendar year 
    <span style="width:10mm;border-style:solid;float:none;clear:none;padding-left: .5mm" class="styBB">
							<xsl:if test="$IRS8868Data/Addnl3MonthExtensionOfTime/Additional3MonthExtensionInd">
								<xsl:if test="$RtnHdrData/TaxYr != '' ">
									<xsl:call-template name="PopulateReturnHeaderTaxYear"/>
								</xsl:if>
							</xsl:if>
							
							</span>,  or other tax year beginning
     							   <!--<xsl:choose>
								<xsl:when test="substring($RtnHdrData/TaxPeriodEndDt,6,5) != '12-31'">-->
							
								<span style="padding-left: 1mm;width:20mm;border-style:solid;float:none;clear:none;" class="styBB">
									<xsl:if test="$IRS8868Data/Addnl3MonthExtensionOfTime/Additional3MonthExtensionInd">	
										<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
									</xsl:if>
								</span>
								
							<!--</xsl:when>
								<xsl:otherwise>-->
							<!--<span style="width:20mm;border-style:solid;float:none;clear:none;" class="styBB"/>
									<span style="width:4px;"/>,<span style="width:4px;"/>
									<span style="width:8mm;border-style:solid;float:none;clear:none;padding-left: .5mm" class="styBB"/>
									<span style="width:4px;"/>,-->
							<!--</xsl:otherwise>
							</xsl:choose>-->
								, and ending
       						 <!--<xsl:choose>
								<xsl:when test="substring($RtnHdrData/TaxPeriodEndDt,6,5) != '12-31'">-->
							
							<span style="padding-left: 1mm;width:20mm;border-style:solid;float:none;clear:none;" class="styBB">
								<xsl:if test="$IRS8868Data/Addnl3MonthExtensionOfTime/Additional3MonthExtensionInd">
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
								</xsl:if>
							</span>
								
							<!--</xsl:when>
								<xsl:otherwise>-->
							<!--
									<span style="width:20mm;border-style:solid;float:none;clear:none;" class="styBB"/>
									<span style="width:4px;"/>,<span style="width:4px;"/>
									<span style="width:8mm;border-style:solid; float:none;clear:none;padding-left: .5mm" class="styBB"/>
									<span style="width:4px;"/>,-->
							<!--</xsl:otherwise>
							</xsl:choose>-->
						</span>
					</div>
					<!--   END LINE 5   -->
					<br/>
					<!--  BEGIN LINE 6  -->
					<div class="styIRS8868LineItem">
						<span class="styIRS8868LNLeftNumBox" style="margin-right: 1mm;padding-top:3mm">6</span>
						<span class="styIRS8868LNDesc" style="width: 180mm">If the tax year entered in line 5 is for less than 12 months, check reason: <span style="width: 1mm"/>
							<!--							<input type="checkbox" class="styIRS8868Ckbox" name="InitialReturn" TabIndex="-1" id="InitialReturn" onclick="return false;"/>   -->
							<input type="checkbox" alt="alt" class="styIRS8868Ckbox" name="InitialReturn" TabIndex="-1" id="InitialReturn">
								<xsl:if test="$IRS8868Data/Addnl3MonthExtensionOfTime/Additional3MonthExtensionInd">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/InitialReturnInd"/>
									</xsl:call-template>
								</xsl:if>	
							</input>
							<span class="styIRS8868CkboxText" style="width: 15mm; float: none; clear: none">
								<label for="InitialReturn"> Initial return</label>
							</span>
							<!--							<input type="checkbox" class="styIRS8868Ckbox" name="FinalReturn" TabIndex="-1" id="FinalReturn" onclick="return false;"/>   -->
							<input type="checkbox" alt="alt" class="styIRS8868Ckbox" name="FinalReturnInd" id="FinalReturnInd">
								<xsl:if test="$IRS8868Data/Addnl3MonthExtensionOfTime/Additional3MonthExtensionInd">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/FinalReturnInd"/>
									</xsl:call-template>
								</xsl:if>
							</input>
							<span class="styIRS8868CkboxText" style="width: 15mm; float: none; clear: none">
								<label for="FinalReturnInd"> Final return</label>
							</span>
							<span style="width:3mm"/>
							<!--							<input type="checkbox" class="styIRS8868Ckbox" name="ChangeAccountingPeriod" TabIndex="-1" id="ChangeAccountingPeriod" onclick="return false;"/>   -->
							<input type="checkbox" alt="alt" class="styIRS8868Ckbox" name="AccountingPeriodChangeInd" TabIndex="-1" id="AccountingPeriodChangeInd">
								<xsl:if test="$IRS8868Data/Addnl3MonthExtensionOfTime/Additional3MonthExtensionInd">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/AccountingPeriodChangeInd"/>
									</xsl:call-template>
								</xsl:if>
							</input>
							<span class="styIRS8868CkboxText" style="width:30mm; float: none; clear: none">
								<label for="AccountingPeriodChangeInd"> Change in accounting period</label>
							</span>
						</span>
					</div>
					<!--  END LINE 6  -->
					<!--  BEGIN LINE 7  -->
					<div class="styIRS8868LineItem">
						<span class="styIRS8868LNLeftNumBox" style="margin-right: 1mm;">7</span>
						<span class="styIRS8868LNDesc" style="width: 180mm">State in detail why you need the extension<span style="width: 2mm"/>
							<xsl:choose>
								<xsl:when test="$IRS8868Data/Addnl3MonthExtensionOfTime/FilingExtensionReasonCd1">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/FilingExtensionReasonCd1/AdditionalExtensionReasonCd"/>
									</xsl:call-template>
									<span style="width: 2mm"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/FilingExtensionReasonCd1/AdditionalExtensionReasonDesc"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="$IRS8868Data/Addnl3MonthExtensionOfTime/FilingExtensionReasonCd2">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/FilingExtensionReasonCd2/AdditionalExtensionReasonCd"/>
									</xsl:call-template>
									<span style="width: 2mm"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/FilingExtensionReasonCd2/AdditionalExtensionReasonDesc"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="$IRS8868Data/Addnl3MonthExtensionOfTime/FilingExtensionReasonCd3">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/FilingExtensionReasonCd3/AdditionalExtensionReasonCd"/>
									</xsl:call-template>
									<span style="width: 2mm"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/FilingExtensionReasonCd3/AdditionalExtensionReasonDesc"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/FilingExtensionReasonCd4/AdditionalExtensionReasonCd"/>
									</xsl:call-template>
									<span style="width: 2mm"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/FilingExtensionReasonCd4/AdditionalExtensionReasonTxt"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</span>
					</div>
					<!--  END LINE 7  -->
					<!--  BEGIN LINE 8a  -->
					<div class="styBB" style="width:187mm;border-top-width:1">
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">8a</div>
							<div class="styLNDesc" style="border: 0 solid black;border-bottom-width:1px;height:7.5mm;width:136mm">If this application is for Forms 990-BL, 990-PF, 990-T, 4720, or 6069, enter the tentative tax, less any nonrefundable credits. See instructions.      <span style="width:2px;"/>
								<!-- Form to Form Link -->
							</div>
							<div class="styLNRightNumBox" style="padding-top:3.75mm;height:7.5mm;">8a</div>
							<div class="styLNAmountBox" style="height:7.5mm; padding-top:3.75mm;width:34mm">
								<span class="styBoldText" style="padding-left:1mm;float:left;">$</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/TentativeTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--  END LINE 8a  -->
						<!--  BEGIN LINE 8b  -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">
								<span style="width:2mm"/>b</div>
							<div class="styLNDesc" style="border: 0 solid black;border-bottom-width:1px;height:6mm;width:136mm">If this application is for Forms 990-PF, 990-T, 4720, or 6069, enter any refundable credits and estimated tax payments made. Include any prior year overpayment allowed as a credit and any amount paid previously with Form 8868. <span style="width:2px;"/>
								<!-- Form to Form Link -->
							</div>
							<div class="styLNRightNumBox" style="border-bottom-width:0; height:6mm;background-color:lightgrey"/>
							<div class="styLNAmountBox" style="height:6mm;border-bottom-width:0;width:34mm"/>
							<div class="styLNRightNumBox" style="border-bottom-width:1">8b</div>
							<div class="styLNAmountBox" style="border-bottom-width:1;width:34mm">
								<span class="styBoldText" style="padding-left:1mm;float:left">$</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/EstTaxPymtAndRfdblCreditAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--  END LINE 8b  -->
						<!--  BEGIN LINE 8c  -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">
								<span style="width:2mm"/>c</div>
							<div class="styLNDesc" style="border: 0 solid black;height:6mm;width:136mm">
								<b>Balance due.</b> Subtract line 8b from line 8a. Include your payment with this form,  if required, by using EFTPS (Electronic Federal Tax Payment System). See instructions.      <span style="width:2px;"/>
								<!-- Form to Form Link -->
							</div>
							<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.75mm;border-bottom-width:0">8c</div>
							<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.75mm;border-bottom-width:0;width:34mm">
								<span class="styBoldText" style="padding-left:1mm;float:left">$</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/BalanceDueAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  END LINE 8c  -->
					<!--  BEGIN SIGNATURE AND VERIFICATION  -->
					<div style="width: 187mm; text-align: center; font-weight: bold; font-size: 7pt">Signature and Verification must be completed for Part II only.</div>
					<div style="width: 187mm; text-align: left; font-size: 6pt">Under penalties of perjury, I declare that I have examined this form, including accompanying schedules and statements, and to the best of my knowledge and 
  belief, it is true, correct, and complete, and that I am authorized to prepare this form.
</div>
					<br/>
					<br/>
					<div class="styBB" style="width: 187mm; text-align: left; font-size: 7pt">
						<span style="width: 70mm">
							<span style="font-size:6pt;padding-right:1mm;">Signature</span>
							<img src="{$ImagePath}/8868_Bullet_Sm.gif" alt="bullet"/>
						</span>
						<span style="width: 70mm">
							<span style="font-size:6pt;padding-right:1mm;">Title</span>
							<img src="{$ImagePath}/8868_Bullet_Sm.gif" alt="bullet"/>
						</span>
						<span style="width: 27mm">
							<span style="font-size:6pt;padding-right:1mm;">Date</span>
							<img src="{$ImagePath}/8868_Bullet_Sm.gif" alt="bullet"/>
						</span>
					</div>
					<!--BEGIN FOOTER-->
					<div style="width:187mm">
						<!--						<div style="float: left; clear: none;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see Instructions.</span>
						</div>  -->
						<div style="float:right">
							<!--   Cat. No. 27916D  -->
							<span style="width:70px"/>
  						  Form<span class="styBoldText" style="font-size: 8pt"> 8868 </span>(Rev. 1-2014)
 						 </div>
					</div>
					<!--END FOOTER-->
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
