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
					<div class="styBB" style="width:187mm; height:20mm;">
						<div class="styFNBox" style="width:31mm;height:20mm; border-right-width: 2px; font-size:8px">
							<div>
      Form<span class="styFormNumber">  8868</span><br/>
      (Rev. January 2014)
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
						<div class="styFTBox" style="width:115mm;height:20mm;">
							<div class="styMainTitle" style="height:7mm;">Application for Extension of Time To File an<br/>Exempt Organization Return<br/></div>
							<div class="styFBT" style="height:5mm; font-size: 7pt; padding-top: 2mm">
								<img src="{$ImagePath}/8868_Bullet_Title.gif" alt="bullet"/> File a separate application for each return.<span style="width: 5mm"/>
								<div class="styFST" style="height:5mm;font-size:7pt;padding-top:1mm;">
									<img src="{$ImagePath}/8868_Bullet_Title.gif" alt="Bullet Image"/>
					  Information about Form 8868 and its instructions is at <a href="http://www.irs.gov/form8868" title="Link to IRS.gov">
										<i>www.irs.gov/form8868</i>
									</a>.
							</div>
							</div>
						</div>
						<div class="styTYBox" style="width:25mm; height: 20mm; border-left-width: 2px; ">
						<div class="styOMB" style="width:30mm; border-bottom:0px ;padding-top:10mm;text-align:middle">OMB No.1545-1709</div>
  </div>
					</div>
					<!--   END FORM HEADER   -->
					<div style="width: 187mm;padding-top:1mm ; float:left">
						<img src="{$ImagePath}/8868_Bullet_Round.gif" alt="bullet"/>
						<label for="3MonthExtension"> If you are filing for an <b>Automatic 3-Month Extension, complete only Part I </b> and check this box</label>
<!--						<b>
							<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.
  <span class="styIRS8868NBSP"/>.
  </b>-->
  <div class="styDotLn" style="float:right;padding-right:1mm;">.
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
						<span style="width: 2mm"/>
						<input type="checkbox" alt="alt" class="styCkbox" name="Automatic3MonthExtensionInd" TabIndex="-1" id="Automatic3MonthExtensionInd">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/Automatic3MonthExtensionInd"/>
							</xsl:call-template>
						</input>
					</div>
					</div>
					<div style="width: 187mm;float:left">
						<img src="{$ImagePath}/8868_Bullet_Round.gif" alt="bullet"/> 
						If you are filing for an <b>Additional (Not Automatic) 3-Month Extension, complete only Part II</b> (on page 2 of this form).
<!--</div>-->
					<div class="styIRS8868NoteHdr" style="border-top-width: 0px; font-style:normal;border-bottom-width: 0px;">
						<span class="styItalicText"><b>Do not complete Part II unless </b> </span>
						<span style="font-weight:normal">you have already been granted an automatic 3-month extension on a previously filed Form 8868.</span><br/>
					</div>
					<div style="width:187mm; line-height:1.2; padding-top:1mm">
						<b>Electronic filing (e-file).</b> You can electronically file Form 8868 if you need a 3-month automatic extension of time to file
(6 months for a corporation required to file Form 990-T), or an additional (not automatic) 3-month extension of time.  You can electronically file Form 8868 to request an extension of time to file any of the forms listed in Part I or Part II with the exception of Form 8870, Information Return for Transfers Associated With Certain Personal Benefit Contracts, which must be sent to IRS in paper format (see instructions).  For more details on the electronic filing of this form, visit <i>www.irs.gov/efile</i> and click on <i>e-file for Charities &#38; Nonprofits.</i>
					</div>
					</div>
					<!--   BEGIN PART I   -->
					<!--   BEGIN PART I HEADER   -->
<!--					<div class="styIRS8868PartHdr" style="border-bottom-width: 1px">
						<span class="styPartName">Part I</span>
						<span class="styPartDesc">Automatic 3-Month Extension of Time.<span style="font-weight: normal">  Only submit original (no copies needed).</span>
						</span>
					</div>-->
		<div class="styBB" style="border-top-width:1px; width:187mm;">
            <div class="styPartName" style="padding-top:1mm; height:auto">Part I</div>
            <div class="styPartDesc" style="width:170mm; padding-left:3mm;padding-top:1mm; font-size:7pt">
              Automatic 3-Month Extension of Time. <span style="font-weight: normal">  Only submit original (no copies needed)</span>
            </div>
          </div>
					<!--<div style="width:187mm;"/>-->
					<div  style="width:187mm;"><!--class="styIRS8868NoteHdr"-->
						<span>
							<label for="6MonthExtension">
								<span style="font-style:normal; font-weight: normal">A corporation required to file Form 990-T and requesting an automatic 6-month extension?check this box and complete Part I only</span>
							</label>
			<div class="styDotLn" style="float:right;padding-right:1mm;">...
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
						<input type="checkbox" alt="alt" class="styCkbox" name="Automatic6MonthExtensionInd" TabIndex="-1" id="Automatic6MonthExtensionInd">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/Automatic6MonthExtensionInd"/>
							</xsl:call-template>
						</input>
				</div>
				</span>	
					
					<div style="font-size:7pt; font-style: italic; padding-top:1mm;font-weight:normal; width:187mm;border-bottom-width:0px;"><!--height:8mm;-->All other corporations (including 1120-C filers), partnerships, REMICs, and trusts must use Form 7004 to request an extension of time to file income tax returns.
					</div>
					</div>			
					<div  style="width:187mm; font-weight:bold; text-align:right; border-bottom:1px solid black ">Enter filer's identifying number, see instructions</div>
					<!--   END PART I HEADER padding-left:90mm  -->
					<div style="width:187mm;float:left;clear:none;border-bottom:1px solid black">
						<div class="styUseLbl"  rowspan="3" style="width:16mm;height:28mm; font-size: 7pt; ">
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
						<div class="styFNBox" style=" 
						padding-left:2mm;font-size:7pt;width:54mm;height:13mm;border-right-width:0px;border-bottom-width:1px;"> 
						Employer identification number (EIN) <b>or</b>
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
						<div class="styNameAddr" style="width:110mm;height:8mm; font-size:7pt; border-top-width: 1px;border-right-width: 1px;border-bottom-width:0px;">
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
						<div class="styFNBox" style="padding-left:2mm;font-size:7pt;width:54mm;border-right-width:0px;">Social security number (SSN)<br/>
							<br/>
							<span style="text-align:left;font-size: 7pt; font-weight:normal;">
								<!-- Since this is a main form, we must check for and display an updated EIN.  To do this, we use the EINChanged parameter when calling PopulateReturnHeaderFiler.-->
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="EINChanged">false</xsl:with-param>
									<xsl:with-param name="TargetNode">SSN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div class="styNameAddr" style=";border-top-width:1px;border-bottom-width: 0px;width:164mm;height:6mm;font-size: 7pt"><!---->
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
					<div style="float:left; border-style:solid; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px; font-size: 8pt"><!-- line-height:2;-->
						Enter the Return code for the return that this application is for (file a separate application for each return):
						<div class="styDotLn" style="float:right; padding-right:4mm">..............
							<span style="line-height:1;padding-top:1mm; float:right; width:8mm; border-style:solid; border-width:1px;vertical-align:bottom ">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/ExtensionReturnCd"/>
							</xsl:call-template></span>
						</div>	
					</div>
					<table style="float:left; font-size:7pt;border-color:black;" class="styTable" cellspacing="0" summary="Table displaying entity name or names and corresponding employer identification numbers" name="GBCtable" id="GBCtable">
						<thead class="styTableThead">
							<tr>
								<th scope="col" class="styTableCell" style="width:68mm;font-size:7pt;text-align:left;border-bottom:none;font-weight:bold;border-left-width:0px;">Application</th>
								<th scope="col" class="styTableCell" style="width:24mm;font-size:7pt;text-align:center;border-bottom:none;font-weight:bold;border-right-width:2px;">Return</th>
								<th scope="col" class="styTableCell" style="width:68mm;font-size:7pt;text-align:left;border-bottom:none;font-weight:bold;">Application</th>
								<th scope="col" class="styTableCell" style="width:24mm;font-size:7pt;text-align:center;border-bottom:none;font-weight:bold;border-right-width:0px">Return</th>
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
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;border-right-width:1px;">Form 990-T(corporation)</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;font-weight:normal;border-right-width:0px">07</th>
							</tr>
							<tr>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;border-left-width:0px;">Form 990-BL</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;border-right-width:2px;font-weight:normal;">02</th>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;">Form 1041-A</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;font-weight:normal;border-right-width:0px">08</th>
							</tr>
							<tr>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;border-left-width:0px;">Form 4720 (Individual)</th>
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
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;border-left-width:0px;">Form 990-T (trust other than above)</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;border-right-width:2px;font-weight:normal;">06</th>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;">Form 8870</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;font-weight:normal;border-right-width:0px">12</th>
							</tr>
						</thead>
					</table>
					<!--Schema Mods for TY2004 -->
					<!--The books are in the care of - Person or Business Name-->
					<div style="width:187mm;"/>
					<div style="width: 187mm; padding-top:1mm; height:auto">
						<div class="styGenericDiv">
							<img src="{$ImagePath}/8868_Bullet_Round.gif" alt="bullet"/> The books are in the care of
      <span style="width:   2mm; padding-left:2mm"/>
							<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
							<span style="width: 5mm, padding-left:2mm"/>
						</div>
						<div class="styGenericDiv" style="width:130mm;border-bottom:1px solid black;">
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
								<span style="width:2mm"/> 
							<xsl:choose>
								<xsl:when test="$IRS8868Data/Automatic3MonthExtensionOfTime/BooksInCareOfDetail/USAddress">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/BooksInCareOfDetail/USAddress/AddressLine1Txt"/>
									</xsl:call-template>
									<span style="width:1px">,</span>
									<span style="width:2mm"/> 
									
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/BooksInCareOfDetail/USAddress/AddressLine2Txt"/>
									</xsl:call-template>
									<span style="width:1px">,</span>
									<span style="width:2mm"/> 
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/BooksInCareOfDetail/USAddress/CityNm"/>
									</xsl:call-template>
									<span style="width:1px">,</span>
									<span style="width:2mm"/> 
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
					<div style="width:187mm; float:left">
					<span style="width: 90mm; padding-left:4mm">
						<span style="left-padding:5mm">Telephone No.</span>
						<span style="width: 2mm"/>
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
						<span style="width: 2mm"/>
						<span class="styFixedUnderline" style="float:none;width:40mm">
							<xsl:call-template name="PopulatePhoneNumber">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/BooksInCareOfDetail/PhoneNum"/>
							</xsl:call-template>
						</span>
					</span>
					<span style="width: 90mm;;float:right">	
						<span style="width:17mm"/>Fax No.<span style="width: 2mm"/>
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
						<span style="width: 2mm"/>
						<span class="styFixedUnderline" style="float:none;width:40mm">
							<xsl:call-template name="PopulatePhoneNumber">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/BooksInCareOfDetail/FaxNum"/>
							</xsl:call-template>
						</span>
					</span>
					</div>
					<!--End schema mods -->
					<div style="width: 187mm;padding-top:2mm; float:left">
						<img src="{$ImagePath}/8868_Bullet_Round.gif" alt="bullet"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/OrgHasNoOfficeInUSInd"/>
							</xsl:call-template> If the organization does not have an office or place of business in the United States, check this box</label>
						<span class="styDotLn" style="float:right;">.
							<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
							<!--<span style="width: 2mm"/>-->
							<input type="checkbox" class="styCkbox" name="OrgHasNoOfficeInUSInd" id="OrgHasNoOfficeInUSInd">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/OrgHasNoOfficeInUSInd"/>
								</xsl:call-template>
							</input>
						</span>	
					</div>
					
					<div style="width: 187mm;  border-style: solid; border-width:1px ; border-left-width:0px;border-right-width:0px; border-top-width:0px; float:left">
						<!--						<img src="{$ImagePath}/8868_Bullet_Round.gif" alt="bullet"/> If this is for a Group Return, enter the organization's four digit Group Exemption Number (GEN)_____________.  -->
						<img src="{$ImagePath}/8868_Bullet_Round.gif" alt="bullet"/> If this is for a Group Return, enter the organization's four digit Group Exemption Number (GEN)
						<span class="styFixedUnderline" style="float:none;text-align:center;width:15mm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/GroupExemptionNum"/>
							</xsl:call-template>
						</span>.	
			<!--		<span>-->
					If this is for the whole group, check this box<!--<label for="wholeGroup"></label>
-->					<span class="styDotLn" style="float:none" >...</span>
	
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
						<span style="width: 2mm"/>
						<!--<input type="checkbox" class="styIRS8868Ckbox" name="WholeGroup" TabIndex="-1" id="WholeGroup" onclick="return false"/>   -->
		
						<input type="checkbox" alt="alt" class="styCkbox" name="WholeGroupInd" TabIndex="-1" id="WholeGroupInd">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/WholeGroupInd"/>
							</xsl:call-template>
						</input>.
				<!--		</span>-->
						 <label for="PartGroup" style="float:none"> If it is for part of the group, check this box</label>
					<span class="styDotLn" style="float:none">......
						
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
						<span style="width: 2mm"/>
						<!--<input type="checkbox" class="styIRS8868Ckbox" name="PartGroup" TabIndex="-1" id="PartGroup" onclick="return false"/>    -->
						<input type="checkbox" alt="alt" class="styCkbox" name="PartialGroupInd" id="PartialGroupInd">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/PartialGroupInd"/>
							</xsl:call-template>
						</input>	
					</span>
					<label style="float:none">and attach a list with the names and EINs of all members the extension is for.</label>
						
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/PartialGroupInd"/>
						</xsl:call-template>
					</div>

					
					<!--   BEGIN LINE 1   -->
					<div class="styIRS8868LineItem" style="width:187mm;border-top-width: 1px;height:auto ">
					  <span class="styLNLeftNumBoxSD" style=";padding-top:0mm;">1</span>
					  <span class="styLNDesc" style="width: 176mm;height:auto">I request an automatic 3-month (6 months for a  corporation required to file Form 990-T) extension of time until 
								<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/ExtensionDt"/>
							</xsl:call-template>
						to file the exempt organization return for the organization named above.  The extension is for the organization's return for:
					  </span>
					</div>
				<xsl:choose>
						<xsl:when test="$RtnHdrData/TaxYr != ''  ">					
								<div class="styIRS8868LineItem" style="margin-left: 8mm; float:left">
									<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
									<span style="width: 2mm"/>
									<input type="checkbox" class="styCkbox" name="CalendarYearInd" id="CalendarYearInd" checked="checked"/>
									
									<span  style="; clear:none"><!--class="styIRS8868CkboxText"-->
										<label for="CalendarYearInd"> calendar year 
											<!--<span style="width:20mm;border-style:solid;float:none;clear:none;padding-left: .5mm" class="styBB">-->
											<span class="styGenericDiv" style="width:50mm;border-bottom:1px solid black;padding-left: .5mm; float:none; clear:none;">
												<xsl:call-template name="PopulateReturnHeaderTaxYear"/>
											</span><b>  or  </b> 
										</label>
									</span>
								</div>
								<div class="styIRS8868LineItem" style="float:left; width:187mm; padding-left:8mm">
									<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
									<span style="width: 2mm"/>
											<input type="checkbox" class="styIRS8868Ckbox" name="CalendarYearInd" TabIndex="-1" id="CalendarYearInd" onclick="return false;"/>
									<span class="styIRS8868CkboxText" style="width: 160mm; float: none; clear: none">
										<label for="TaxYearCheckBox" style="width:130mm"> tax year beginning   
											<span style="padding-left: 1mm;width:20mm;border-style:solid;float:none;clear:none;border-bottom-width:0px;" class="styBB">__________</span>
										</label>
										<label for="TaxYearCheckBox"> and ending
											<span class="styBB" style="padding-left: 1mm;width:20mm;float:none;clear:none;border-bottom-width:0px">__________</span>
										</label>
									</span>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styIRS8868LineItem" style="margin-left: 3mm; float:left">
									<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
									<span style="width: 2mm"/>
									<input type="checkbox" class="styIRS8868Ckbox" name="CalendarYearInd" id="CalendarYearInd" onclick="return false"/>
									<span class="styIRS8868CkboxText" style="float: none; clear:none;">
									<label for="CalendarYearInd"> calendar year 
										<span style="width:8mm;border-style:solid;float:none;clear:none;" class="styBB">  or </span>
									</label>
									</span>
								</div>
							<div class="styIRS8868LineItem" style="margin-left: 3mm;float:left">
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
								<span style="padding-left: 1mm;width:20mm;border-style:solid;float:none;clear:none;" class="styBB">
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
								</span>
							</label>
							<label for="TaxYearCheckBox"> and ending
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
						<span class="styLNLeftNumBoxSD" style="">2</span>
						<span class="styLNDesc" style="width: 178mm; float:none; height:auto">If the tax year entered in line 1 is for less than 12 months, check reason: <span style="width: 1mm"/>
							<input type="checkbox" alt="alt" class="styIRS8868Ckbox" name="InitialReturn" TabIndex="-1" id="InitialReturn">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/InitialReturnInd"/>
								</xsl:call-template>
							</input>
							<span class="styIRS8868CkboxText" style="width: 15mm; float: none; clear: none">
								<label for="InitialReturn"> Initial return</label>
							</span>
							<input type="checkbox" alt="alt" class="styIRS8868Ckbox" name="FinalReturnInd" id="FinalReturnInd">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/FinalReturnInd"/>
								</xsl:call-template>
							</input>
							<span class="styIRS8868CkboxText" style="width: 15mm; float: none; clear: none">
								<label for="FinalReturnInd"> Final return</label>
							</span>
							<span style="width:3mm"/>
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
					<div class="styBB" style="width:187mm;border-style:solid; border-width:1px; border-top-width:1; border-left-width:0px; border-right-width:0px; float:left; height:auto; page-break-inside:avoid">
						<div style="width:187mm;float:left">
							<div class="styLNLeftNumBox" style="height:auto;">3a</div>
							<div class="styLNDesc" style="border: 0 solid black;border-bottom-width:1px;height:9mm;width:132mm">If this application is for Forms 990-BL, 990-PF, 990-T, 4720, or 6069, enter the tentative tax, less any nonrefundable credits. See instructions. <span style="width:2px;"/>
								<!-- Form to Form Link -->
							</div>
							<div class="styLNRightNumBox" style="height:9mm;">3a</div>
							<div class="styLNAmountBox" style="height:9mm;width:36mm"><!--7.5mm;-->
								<span class="styBoldText" style="padding-left:1mm;float:left;">$</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/TentativeTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--  END LINE 3a  -->
						<!--  BEGIN LINE 3b  -->
						<div style="width:187mm;float:left">
							<div class="styLNLeftNumBox" style="height:4mm;">
								<span style="width:2mm; padding-left:2mm"/>b</div>
							<div class="styLNDesc" style="border: 0 solid black;border-bottom-width:1px;height:14mm;width:132mm">If this application is for Forms 990-PF, 990-T, 4720, or 6069, enter any refundable credits and estimated tax payments made. Include any prior year overpayment allowed as a credit.<span style="width:2px;"/>
								<!-- Form to Form Link -->
							</div>
							<div class="styLNRightNumBox" style="height:14mm;">3b</div>
							<div class="styLNAmountBox" style="height:14mm;width:36mm">
								<span class="styBoldText" style="padding-left:1mm;float:left">$</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/EstTaxPymtAndRfdblCreditAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--  END LINE 3b  -->
						<!--  BEGIN LINE 3c  -->
						<div style="width:187mm;height;auto">
							<div class="styLNLeftNumBox" style="height:4mm;">
								<span style="width:2mm;padding-left:2mm"/>c</div>
							<div class="styLNDesc" style="border: 0 solid black;height:14mm;width:132mm">
								<b>Balance due.</b> Subtract line 3b from line 3a. Include your payment with this form, if required, by using EFTPS (Electronic Federal Tax Payment System). See instructions.      <span style="width:2px;"/>
								<!-- Form to Form Link -->
							</div>
							<div class="styLNRightNumBox" style="height:14mm;border-bottom-width:0">3c</div>
							<div class="styLNAmountBox" style="height:14mm;border-bottom-width:0;width:36mm">
								<span class="styBoldText" style="padding-left:1mm;float:left">$</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Automatic3MonthExtensionOfTime/BalanceDueAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div class="styIRS8868LineItem" style="width:187mm;font-size:9pt; float:left;border-bottom-style:solid; border-bottom-width:1px">
						<b>Caution.</b> If you are going to make an electronic funds withdrawal (direct debit) with this Form 8868, see Form 8453-EO and Form 8879-EO	for payment instructions.</div>
					<!--  END LINE 3c  -->
					<!--BEGIN FOOTER-->
					<div class="pageEnd" style="clear:both;width:187mm;page-break-after:always; "><!--border-style:solid; border-width:1px; border-left-width:0px; border-right-width:0px; border-bottom-width:0px;-->
						
						<span style="width:90mm; float: left; clear: none;font-size:8pt;">
							<span class="styBoldText">For Privacy Act and Paperwork Reduction Act Notice, see Instructions.</span>
						</span>
						<span style="width:70mm; float:right;  font-size:8pt;"><span style="width:50mm">Cat. No. 27916D</span>
						<span style="; font-size:7pt; float:right;">Form  <span class="styBoldText" style="font-size: 8pt;"> 8868  </span>  (Rev. 1-2014)</span></span>
					</div>
					<!--END FOOTER-->
					
					
					  <!-- end Page footer -->	
					
					<div  style=";width:187mm"><!--class="styBB"-->
						<div style="float:left;clear:none;">Form 8868 (Rev. 1-2014)</div>
						<div style="float:right">Page <span class="styBoldText" style="font-size: 10pt">2</span>
						</div>
					</div>
					<!--   END FORM HEADER   -->
					<div style="width: 187mm;float:left; border-top-style:solid;border-top-width:1px">
						<img src="{$ImagePath}/8868_Bullet_Round.gif" alt="bullet"/>
						<label for="3MonthExtension"> If you are filing for an <b>Additional (Not Automatic) 3-Month Extension, complete only Part II </b> and check this box  </label>
					<span class="styDotLn" style="float:right;">........				
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>				
						<input type="checkbox" alt="alt" class="styIRS8868Ckbox" name="Additional3MonthExtensionInd" TabIndex="-1" id="Additional3MonthExtensionInd">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/Additional3MonthExtensionInd"/>
							</xsl:call-template>
						</input>
						</span>
					</div>
					<div  style="width:187mm;float:left">
						<span style="font-weight:normal">
							<b>Note.</b> Only complete Part II if you have already been granted an automatic 3-month extension on a previously filed Form 8868.</span>
					</div>
					<div style="width: 187mm;float:left">
						<img src="{$ImagePath}/8868_Bullet_Round.gif" alt="bullet"/> If you are filing for an <b>Automatic 3-Month Extension, complete only Part I</b> (on page 1).
					</div>
					<!--   BEGIN PART II   -->
					<!--   BEGIN PART II HEADER   -->
					<div class="styIRS8868PartHdr" style="width:187mm; height:auto; text-align:middle;border-style:solid; border-width:1px; border-left-width:0px; border-right-width:0px; float:left">
						<span class="styPartName">Part II</span>
						<span class="styPartDesc" style="width:160mm;">Additional (Not Automatic) 3-Month Extension of Time.<span style="font-weight: normal">  Only file the original (no copies needed).</span>
						</span>
					</div>
					<div style="float:left; width:187mm;font-weight:bold;clear:none;text-align:right;">Enter filer's identifying number, see instructions<br/>
					</div>
					<!--   END PART II HEADER   -->
					<div style="width:187mm;float:left;clear:none;border-style:solid; border-width:1px; border-left-width:0px; border-right-width:0px;  border-bottom:1px solid black">
						<div class="styUseLbl" style="width:18mm;height:30mm; font-size: 7pt; border-top-width: 0px">
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
						<div class="styFNBox" style="padding-left:2mm;font-size:7pt;width:50mm;height:13mm;border-right-width:0px;border-bottom-width:1px;">Employer identification number (EIN) <b>or</b>
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
						
						<div class="styFNBox" style="padding-left:2mm;font-size:7pt;width:50mm;border-right-width:0px;">Social security number (SSN)<br/>
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
						<div class="styNameAddr" style="border-bottom-width: 0px;border-top-width:1px;width:160mm;height:auto;font-size: 7pt">  
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
					
					<div style="float:left; width: 187mm; border-style:solid; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width: 1px; font-size:8pt">
						Enter the Return code for the return that this application is for (file a separate application for each return):
						<!--<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/ExtensionReturnCd"/>
						</xsl:call-template>-->
						<div class="styDotLn" style="float:right; padding-right:4mm">..........
							<span style="float:right; width:8mm; border-style:solid; border-width:1px; ">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/ExtensionReturnCd"/>
							</xsl:call-template></span>
						</div>	
					</div>
					<table style=" float:left; font-size:8pt;border-color:black;" class="styTable" cellspacing="0" summary="Table displaying entity name or names and corresponding employer identification numbers" name="GBCtable" id="GBCtable">
						<thead class="styTableThead">
							<tr>
								<th scope="col" class="styTableCell" style="width:68mm; font-size:7pt;text-align:left;border-bottom:none;font-weight:bold;border-left-width:0px;">Application</th>
								<th scope="col" class="styTableCell" style="width:24mm;font-size:7pt;text-align:center;border-bottom:none;font-weight:bold;border-right-width:2px;">Return</th>
								<th scope="col" class="styTableCell" style="width:68mm;font-size:7pt;text-align:left;border-bottom:none;font-weight:bold;">Application</th>
								<th scope="col" class="styTableCell" style="width:24mm;font-size:7pt;text-align:center;border-bottom:none;font-weight:bold;border-right-width:0px">Return</th>
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
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;border-right-width:2px;font-weight:normal;">01</th>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;border-left-width:0px;background-color:lightgrey;">
									<font color="lightgrey"><!--Form 990 or Form 990-EZ--></font>
								</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;border-right-width:2px;font-weight:normal;background-color:lightgrey;border-right-width:0px">
									<font color="lightgrey"><!--01--></font>
								</th>
							</tr>
							<tr>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;border-left-width:0px;">Form 990-BL</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;border-right-width:2px;font-weight:normal;">02</th>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;">Form 1041-A</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;font-weight:normal;border-right-width:0px">08</th>
							</tr>
							<tr>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;border-left-width:0px;">Form 4720 (Individual)</th>
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
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;border-left-width:0px;">Form 990-T (trust other than above)</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;border-right-width:2px;font-weight:normal;">06</th>
								<th scope="col" class="styTableCell" style="width:68mm;text-align:left;font-weight:normal;">Form 8870</th>
								<th scope="col" class="styTableCell" style="width:24mm;text-align:center;font-weight:normal;border-right-width:0px">12</th>
							</tr>
						</thead>
					</table>
					<div style="width:187mm;border-bottom:1px solid black; padding-top:1mm; float:left">
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
						<div class="styGenericDiv" style="width:130mm;border-bottom:1px solid black;">
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
									<xsl:when test="$IRS8868Data/Addnl3MonthExtensionOfTime/BooksInCareOfDetail/USAddress">
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
					<div style="width:187mm; float:left">
					<span style="width: 90mm;  padding-left:4mm">
						<span style="width:30mm;left-padding:5mm">Telephone No.</span>
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
						<span style="width: 2mm"/>
						<span class="styFixedUnderline" style="float:none;width:40mm">
							<xsl:call-template name="PopulatePhoneNumber">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/BooksInCareOfDetail/PhoneNum"/>
							</xsl:call-template>
						</span>
					</span>
					<span style="width: 90mm;float:right">	
						<span style="width:17mm"/>Fax No.<span style="width: 2mm"/>
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
						<span style="width: 2mm"/>
						<span class="styFixedUnderline" style="float:none;width:40mm">
							<xsl:call-template name="PopulatePhoneNumber">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/BooksInCareOfDetail/FaxNum"/>
							</xsl:call-template>
						</span>
					</span>						
						
					</div>
					<!--End schema mods -->
					
					<div style="width: 187mm; padding-top:2mm; float:left">
						<img src="{$ImagePath}/8868_Bullet_Round.gif" alt="bullet"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/OrgHasNoOfficeInUSInd"/>
							</xsl:call-template> If the organization does not have an office or place of business in the United States, check this box</label>
						<span class="styDotLn" style="float:right;">.
							<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
							<input type="checkbox" class="styIRS8868Ckbox" name="OrgHasNoOfficeInUSInd" id="OrgHasNoOfficeInUSInd">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/OrgHasNoOfficeInUSInd"/>
								</xsl:call-template>
							</input>
						</span>	
					</div>
				
				
				<div style="width: 187mm; border-style: solid; border-width:1px ; border-left-width:0px;border-right-width:0px; border-top-width:0px;float:left; height:auto">
						<img src="{$ImagePath}/8868_Bullet_Round.gif" alt="bullet"/> If this is for a Group Return, enter the organization's four digit Group Exemption Number (GEN)
						<span class="styFixedUnderline" style="float:none;text-align:center;width:15mm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/GroupExemptionNum"/>
							</xsl:call-template>
						</span>.					
						If this is for the whole group, check this box
						<span class="styDotLn" style="float:none" >...</span>	
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
						<span style="width: 2mm"/>
						<input type="checkbox" alt="alt" class="styIRS8868Ckbox" name="WholeGroupInd" TabIndex="-1" id="WholeGroupInd">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/WholeGroupInd"/>
							</xsl:call-template>
						</input>.
						 <label for="PartGroup" style="float:none"> If it is for part of the group, check this box</label>
						<span class="styDotLn" style="float:none">......
							<span style="width: 2mm"/>
							<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
							<span style="width: 2mm"/>
							<input type="checkbox" alt="alt" class="styIRS8868Ckbox" name="PartialGroupInd" id="PartialGroupInd">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/PartialGroupInd"/>
								</xsl:call-template>
							</input>	
						</span>
						<label style="width:187mm;padding-left:1mm;">and attach a list with the names and EINs of all members the extension is for.</label>					
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/PartialGroupInd"/>
						</xsl:call-template>
					</div>
				
					<!--   BEGIN LINE 4   -->
					<div class="styIRS8868LineItem" style="border-top-width: 1px;float:left">
						<span class="styLNLeftNumBoxSD" style="margin-right: 1mm">4</span>
						<span class="styIRS8868LNDesc" style="width:170mm;">I request an additional 3-month extension of time until <span style="width:25mm;border-style:solid;float:none;clear:none;padding-left: .5mm" class="styBB">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/ExtensionDt"/>
								</xsl:call-template>
							</span>.
 						</span>
					</div>
					<!--   BEGIN LINE 5   -->
					<div class="styIRS8868LineItem" style="float:left">
						<span class="styLNLeftNumBoxSD" style="">5</span>
						<span class="styIRS8868LNDesc" style="">For calendar year 
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
					<div class="styIRS8868LineItem" style="height:11mm; float:left" >
						<span class="styLNLeftNumBoxSD" style="height:5mm;margin-right: 1mm;;">6</span>
						<span class="styLNDesc" style="width: 178mm">If the tax year entered in line 5 is for less than 12 months, check reason: <span style="width: 1mm"/>
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
					<div class="styIRS8868LineItem" style="width:187mm; float:left; ">
						<span class="styLNLeftNumBoxSD" style="">7</span>
						<span class="styIRS8868LNDesc" style="">State in detail why you need the extension </span>
							<span class="styUnderlinedText" style="padding-left:2mm">
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
					<div  style="width:187mm;border-top:1px solid black;border-bottom:1px solid black; float:left; page-break-inside:avoid">
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD" style="height:4mm;">8a</div>
							<div class="styLNDesc" style="border: 0 solid black;border-bottom-width:1px;height:9mm;width:130mm">If this application is for Forms 990-BL, 990-PF, 990-T, 4720, or 6069, enter the tentative tax, less any nonrefundable credits. See instructions.      <span style="width:2px;"/>
								<!-- Form to Form Link -->
							</div>
							<div class="styLNRightNumBox" style="height:9mm;">8a</div>
							<div class="styLNAmountBox" style="height:9mm;width:36mm">
								<span class="styBoldText" style="padding-left:1mm;float:left;">$</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/TentativeTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--  END LINE 8a  -->
						<!--  BEGIN LINE 8b  -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD" style="height:14mm;">
								<span style="width:2mm; padding-right:1mm"/>b</div>
							<div class="styLNDesc" style="border: 0 solid black;border-bottom-width:1px;height:18mm;width:130mm;">If this application is for Forms 990-PF, 990-T, 4720, or 6069, enter any refundable credits and estimated tax payments made. Include any prior year overpayment allowed as a credit and any amount paid previously with Form 8868. <span style="width:2px;"/>
								<!-- Form to Form Link -->
							</div>
							<div class="styLNRightNumBox" style="border-bottom-width:0; height:9mm;background-color:lightgrey"/>
							<div class="styLNAmountBox" style="height:9mm;border-bottom-width:0;width:32mm;"/>
							<div class="styLNRightNumBox" style="border-bottom-width:1px; border-top:0px;height:8mm;">8b</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;width:36mm;height:8mm; ">
								<span class="styBoldText" style="padding-left:1mm;float:left">$</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/EstTaxPymtAndRfdblCreditAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--  END LINE 8b  -->
						<!--  BEGIN LINE 8c  -->
						<div style="width:187mm;float:left">
							<div class="styLNLeftNumBoxSD" style="height:auto">
							<span style="width:2mm; padding-right:1mm"/>c</div>
							<div class="styLNDesc" style="border: 0 solid black;height:auto;width:130mm">
								<b>Balance due.</b> Subtract line 8b from line 8a. Include your payment with this form,  if required, by using EFTPS (Electronic Federal Tax Payment System). See instructions.      
								<!-- Form to Form Link -->
							</div>
							<div class="styLNRightNumBox" style="height:11mm;padding-top:3.75mm;border-bottom-width:0">8c</div>
							<div class="styLNAmountBox" style="height:11mm;padding-top:3.75mm;border-bottom-width:0;width:36mm">
								<span class="styBoldText" style="padding-left:1mm;float:left">$</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Addnl3MonthExtensionOfTime/BalanceDueAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					
					<!--  END LINE 8c  -->
					<!--  BEGIN SIGNATURE AND VERIFICATION  -->
				
					<div style="width: 187mm; text-align: center; font-weight: bold;vertical-align:middle; float:left"><br/>Signature and Verification must be completed for Part II only.</div>
					<div style="width: 187mm; text-align: left; font-size:9pt; float:left "><br/>Under penalties of perjury, I declare that I have examined this form, including accompanying schedules and statements, and to the best of my knowledge and 
  belief, it is true, correct, and complete, and that I am authorized to prepare this form.
</div>
					<br/>
					<br/>
					<div   style="width: 187mm; font-weight:bold; text-align: left; border-bottom:1px solid black;float:left">
						<span  style="width: 70mm; float:left">
							<span style="font-size:9pt;padding-right:1mm;">Signature</span>
							<img src="{$ImagePath}/8868_Bullet_Sm.gif" alt="bullet"/>
						</span>
						<span  style="width: 50mm; float:middle">
							<span style="font-size:9pt;padding-right:1mm;">Title</span>
							<img src="{$ImagePath}/8868_Bullet_Sm.gif" alt="bullet"/>
						</span>
						<span  style="width: 27mm;float:right">
							<span style="font-size:9pt;padding-right:1mm;">Date</span>
							<img src="{$ImagePath}/8868_Bullet_Sm.gif" alt="bullet"/>
						</span>
					</div>
					<!--BEGIN FOOTER-->
					<div class="pageEnd" style="clear:both;width:187mm;page-break-after:always">
						<div style="float:right">
  						  Form  <span class="styBoldText" style="font-size: 8pt"> 8868 </span>  (Rev. 1-2014)
 						 </div>
					</div>
					<!--END FOOTER-->
					
					
					
					<div class="styLeftOverTitleLine" id="LeftoverData"  style="; width:187mm">
						<div class="styLeftOverTitle" style="float:left; width:187mm">Additional Data</div>
						<div class="styLeftOverButtonContainer" style="float:left; width:187mm">
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
