<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS56Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form56Data" select="$RtnDoc/IRS56"/>
	<!-- ////////////////////////////////////////////////////////////// (Template:	blankRow) -->
	<xsl:template name="blankRow">
		<tr>
			<td style="border-left:1px solid black;border-right:1px solid black;border-top:1px solid black;font-weight:bold;font-size:8pt">4e</td>
			<td style="border-right:1px solid black;border-top:1px solid black">&nbsp;</td>
			<td style="border-right:1px solid black;border-top:1px solid black;font-weight:bold;font-size:8pt">4e</td>
			<td style="border-top:1px solid black;border-right:1px solid black">&nbsp;</td>
		</tr>
	</xsl:template>
	<xsl:template match="/">
		<html lang="EN-US">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form56Data)"/>
					</xsl:call-template>
				</title>
				<!--  No Browser Caching  -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set  -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 56"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS56Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			
			<body class="styBodyClass" style="height:100%;width:100%">
				<form name="IRS56" style="font-family:arial; font-size:9pt">
				
					<!--  Begin Header section 1 -->
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;border-bottom-width:2px;">
						<div class="styFNBox" style="width:31mm;height:22mm;border-right-width:2px;padding-top:.5mm;">
							<div style="padding-top:1mm;">
								Form<span class="styFormNumber">  56</span>
							</div>
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form56Data"/>
							</xsl:call-template>
							<span class="styAgency">(Rev. December 2011)</span>
							<br/>
							<div class="styAgency" style="height:2mm;padding-bottom:0;padding-top:1.5mm">Department of the Treasury</div>
							<div class="styAgency" style="height:2mm;padding-top:0">Internal Revenue Service</div>
						</div>
						<div class="styFTBox" style="width:125mm;height:22mm;">
							<!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
							<br/>
							<div class="styMainTitle" style="height:8mm;">
								Notice Concerning Fiduciary Relationship 
							</div>
							<div class="styFST" style="height:5mm;font-size:7.5pt;margin-left:2mm;text-align:center;">
								<span style="text-align:center;font-weight:bold;">
									<div style="width:100%;height:5mm;padding-left:5px;">
										<div style="width:80mm;height:5mm;">
											<br/>
											<br/>
											(Internal Revenue Code sections 6036 and 6903)
										</div>
									</div>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;border-left-width:2px;height:22.8mm;border-bottom-width:0px;">
							<div class="styOMB" style="width:100%;font-size:7pt;height:auto;padding-top:8mm;border-bottom-width:0px;text-align:center;">OMB No. 1545-0013</div>
						</div>
					</div>
					<!--  End Header section 1 -->
					<!-- Part I - Identification  -->
					<div class="styIRS56PartHeader">
						<div class="styTitleName" style="width:13mm; font-size:10pt">Part I</div>
						<div class="styTitleDesc" style="font-size:10pt; width:170mm">Identification </div>
					</div>
							
						<!-- Line 1 -->
						<div class="styBB" style="width:187mm;height:8mm;">

							<div class="styIRS56CleanDiv" style="width:100%;height:25%;">
								<div class="styIRS56CleanDiv" style="width:50%;height:100%;border-right-width:1px;">
									<div class="styIRS56LNDesc" style="width:100%;auto;font-size:7pt;">
										Name of person for whom you are acting (as shown on the tax return)
									</div>
									<span style="width:100%;height:auto;font-size:7pt;padding-left:4px;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PersonFullName/PersonFirstName"/>
											<xsl:with-param name="BackupName">RtnHdrDataFilerName</xsl:with-param>
										</xsl:call-template>
										<span style="width:4px"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PersonFullName/PersonLastName"/>
											<xsl:with-param name="BackupName">RtnHdrDataFilerName</xsl:with-param>
										</xsl:call-template>
										<span style="width:3px"/>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Filer Primary Name Control</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
										</xsl:call-template> 
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Filer Decedent Name Control</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/DecedentNameControlTxt"/>
										</xsl:call-template> 
									</span>
								</div>
								<div class="styIRS56CleanDiv" style="width:23%;height:100%;border-right-width:1px;">
									<div class="styIRS56LNDesc" style="width:100%;height:auto;font-size:7pt;">
										Identifying number
									</div>
									<xsl:choose>
										<xsl:when test="$Form56Data/PrimarySSN">
											<span style="width:100%;height:auto;font-size:7pt;text-align:center;">
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" select="$Form56Data/PrimarySSN"/>
												</xsl:call-template>
											</span>
										</xsl:when>
										<xsl:otherwise>
											<span style="width:100%;height:auto;font-size:7pt;text-align:center;">
												<xsl:call-template name="PopulateReturnHeaderFiler">
													<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
													<xsl:with-param name="EINChanged">true</xsl:with-param>
												</xsl:call-template>
											</span>
										</xsl:otherwise>
									</xsl:choose>
								</div>
								<div class="styIRS56CleanDiv" style="width:25.9%;height:100%;">
									<div class="styIRS56LNDesc" style="width:100%;height:auto;font-size:7pt;">
										<b>Decedent's social security no.</b>
									</div>

											<span style="width:100%;height:auto;font-size:7pt;text-align:center;">
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/DecedentSSN"/>
												</xsl:call-template>
												<!-- If the SSN has changed, show a delta image -->
												<xsl:if test="$RtnHdrData/Filer/DecedentSSN and ($TaxpayerPrint = 'false' or $TaxpayerPrint = '0')">
													<xsl:if test="(/AppData/Parameters/TINChanged='true') or (/AppData/Parameters/TINChanged='1')">
														<span style="width:2px;"/>
														<img src="{$NonVersionedImagePath}/changeSmall.gif" style="padding-top:1px;" alt="Primary SSN has changed"/>
													</xsl:if>
												</xsl:if>
											</span>
								</div>
							</div>
						</div>
						
							<!-- Line 2 -->
							<div class="styBB" style="width:187mm;height:8mm;">
								<div class="styIRS56LNDesc" style="width:100%;height:auto;font-size:7pt;">
										Address of person for whom you are acting (number, street, and room or suite no.)
									</div>
									<span style="width:100%;height:auto;font-size:7pt;padding-left:4px;">
										<xsl:choose>
											<xsl:when test="$RtnHdrData/Filer/USAddress">
											<!-- US Address -->
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1"/>
												</xsl:call-template>
												<xsl:if test="$RtnHdrData/Filer/USAddress/AddressLine2 != '' ">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine2"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:when>
											<xsl:otherwise>
											<!-- Foreign Address -->
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1"/>
												</xsl:call-template>
												<xsl:if test="$RtnHdrData/Filer/ForeignAddress/AddressLine2 != '' ">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine2"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:otherwise>
										</xsl:choose>
									</span>
							</div>
							<!-- Line 3 -->
							<div class="styBB" style="width:187mm;height:8mm;border-bottom-width:2px">
								<div class="styIRS56LNDesc" style="width:100%;height:auto;font-size:7pt;">
									City or town, state, and ZIP code (If a foreign address, see instructions.) 
								</div>
								<span style="width:100%;height:auto;font-size:7pt;padding-left:4px;">
									<xsl:call-template name="PopulateCityStateInfo">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress"/>
										<xsl:with-param name="ForeignAddressTargetNode" select="$RtnHdrData/Filer/ForeignAddress"/>
									</xsl:call-template>
									<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
										<span style="width:7px;"/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">Country</xsl:with-param>
											<xsl:with-param name="MainForm">true</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</span>
							</div>
							<!-- Line 4 -->
							<div class="styBB" style="width:187mm;height:8mm;">
								<div class="styIRS56LNDesc" style="width:100%;height:auto;font-size:7pt;">
										Fiduciary’s name
									</div>
									<span style="width:100%;height:auto;font-size:7pt;padding-left:4px;">
										<xsl:choose>
											<!-- US Address -->
											<xsl:when test="$Form56Data/FiduciaryPersonName">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryPersonName/PersonFirstName"/>
												</xsl:call-template>
												<xsl:if test="$Form56Data/FiduciaryPersonName/PersonLastName">
													<span style="width:2px"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryPersonName/PersonLastName"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryBusinessNm"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
										<span style="width:3px"/>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Fiduciary Person Name Control</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryPersonNameControlTxt"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Fiduciary Business Name Control</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryBusinessNmControlTxt"/>
										</xsl:call-template>
									</span>
							</div>
							<!-- Line 5 -->
							<div class="styBB" style="width:187mm;height:8mm;">
								<div class="styIRS56LNDesc" style="width:100%;height:auto;font-size:7pt;">
										Address of fiduciary (number, street, and room or suite no.) 
									</div>
									<span style="width:100%;height:auto;font-size:7pt;padding-left:4px;">
										<xsl:choose>
											<!-- US Address -->
											<xsl:when test="$Form56Data/FiduciaryUSAddress/AddressLine1">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryUSAddress/AddressLine1"/>
												</xsl:call-template>
												<xsl:if test="$Form56Data/FiduciaryUSAddress/AddressLine2 != '' ">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryUSAddress/AddressLine2"/>
													</xsl:call-template>
												</xsl:if><br/>
											<xsl:if test="$Form56Data/FiduciaryBusinessUSAddress/AddressLine1">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryBusinessUSAddress/AddressLine1"/>
												</xsl:call-template>
												<xsl:if test="$Form56Data/FiduciaryBusinessUSAddress/AddressLine2 != '' ">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryBusinessUSAddress/AddressLine2"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:if>
											</xsl:when>
											
											<xsl:when test="$Form56Data/FiduciaryForeignAddress/AddressLine1">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryForeignAddress/AddressLine1"/>
												</xsl:call-template>
												<xsl:if test="$Form56Data/FiduciaryForeignAddress/AddressLine2 != '' ">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryForeignAddress/AddressLine2"/>
													</xsl:call-template>
												</xsl:if><br/>
											<xsl:if test="$Form56Data/FiduciaryBusinessFrgnAddress/AddressLine1">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryBusinessFrgnAddress/AddressLine1"/>
												</xsl:call-template>
												<xsl:if test="$Form56Data/FiduciaryBusinessFrgnAddress/AddressLine2 != '' ">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryBusinessFrgnAddress/AddressLine2"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:if>
										</xsl:when>
										</xsl:choose>
									</span>
							</div>
							<!-- Line 6 -->
							<div class="styBB" style="border-bottom-width:0;width:187mm;float:none;clear:none;">
							<div class="styNameBox" style="width:131mm;height:8mm;font-size:7pt;">
								<div>
								City or town, state, and ZIP code</div>
								<span style="width:100%;height:auto;font-size:7pt;padding-left:4px;">
									<xsl:choose>
										<!-- Fiduciary US Biz Address -->
										<xsl:when test="$Form56Data/FiduciaryUSAddress">
											<xsl:call-template name="PopulateCityStateInfo">
												<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryUSAddress"/>
											</xsl:call-template><br/>
											<xsl:if test="$Form56Data/FiduciaryBusinessUSAddress">
												<xsl:call-template name="PopulateCityStateInfo">
													<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryBusinessUSAddress"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:when>
										
										<xsl:when test="$Form56Data/FiduciaryForeignAddress">
											<xsl:call-template name="PopulateCityStateInfo">
												<xsl:with-param name="TargetNode"/>
												<xsl:with-param name="ForeignAddressTargetNode" select="$Form56Data/FiduciaryForeignAddress"/>
											</xsl:call-template>
											<span style="width:6px;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryForeignAddress/Country"/>
											</xsl:call-template><br/>
											<xsl:if test="$Form56Data/FiduciaryBusinessFrgnAddress">
												<xsl:call-template name="PopulateCityStateInfo">
													<xsl:with-param name="TargetNode"/>
													<xsl:with-param name="ForeignAddressTargetNode" select="$Form56Data/FiduciaryBusinessFrgnAddress"/>
												</xsl:call-template>
												<span style="width:6px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryBusinessFrgnAddress/Country"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:when>
									</xsl:choose>
								</span>
							</div>
							<div class="styEINBox" style="width:55mm;height:4mm;padding-left:2mm;font-size:7pt;font-weight:normal;">
							<div>
								Telephone number (optional) </div>
							<span style="width:27mm;text-align:left;">
								<xsl:choose>
									<xsl:when test="$Form56Data/FiduciaryUSPhoneNum">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryUSPhoneNum"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryForeignPhoneNum"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								</span>
								</div>
							</div>
					<!-- END Part I - Identification  -->
							
					<!-- Section A - Authority  -->
					<div class="styIRS56PartHeader">
						<div class="styTitleName" style="width:20mm; font-size:10pt">Section A</div>
						<div class="styTitleDesc" style="font-size:10pt; width:150mm">Authority </div>
					</div>
					<!-- Section A Line 1 -->
					<div class="styIRS56LineItem">
						<div class="styIRS56PartNum" style="padding-top:0.5mm">1</div>
						<div style="float:left; padding-top:0.5mm">
							Authority for fiduciary relationship. Check applicable box:
						</div>      
					</div>
					
					<!-- Section A Line a -->
					<div class="styIRS56LineItem">
						<div class="styIRS56Part1">a</div>
						<div style="float:left">
						<span>
						<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="$Form56Data/TestateInd"/>
						</xsl:call-template>
						<input type="Checkbox" alt="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$Form56Data/TestateInd"/>
							<xsl:with-param name="BackupName">Form56DataTestateInd </xsl:with-param>
							</xsl:call-template>
						</input>
						</span>
						</div>
						<div style="float:left; padding-top:0.5mm;padding-left:0.5mm">
							<label for="Form56DataTestateInd">
							Court appointment of testate estate (valid will exists)
							</label>
						</div>
					</div>
					
					<!-- Section A Line b -->
					<div class="styIRS56LineItem">
						<div class="styIRS56Part1">b</div>
						<div style="float:left">
						<span>
						<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="$Form56Data/IntestateInd"/>
						</xsl:call-template>
						<input type="Checkbox" alt="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form56Data/IntestateInd"/>
								<xsl:with-param name="BackupName">IntestateInd</xsl:with-param>
							</xsl:call-template>
						</input>
						</span>	
						</div>
						<div style="float:left; padding-top:0.5mm;padding-left:0.5mm">
							<label for="IntestateInd">
							 Court appointment of intestate estate (no valid will exists)
							 </label>
						</div>
					</div>
					<!-- Section A Line c -->
					<div class="styIRS56LineItem">
						<div class="styIRS56Part1">c</div>
						<div style="float:left;">
						<span>
						<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="$Form56Data/GuardianOrConservatorInd"/>
						</xsl:call-template>
						<input type="Checkbox" alt="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$Form56Data/GuardianOrConservatorInd"/>
							<xsl:with-param name="BackupName">Form56DataGuardianOrConservatorInd</xsl:with-param>
							</xsl:call-template>
							</input>
							</span>
							</div>
						<div style="float:left; padding-top:0.5mm; padding-left:.5mm">
							<label for="Form56DataGuardianOrConservatorInd">
							Court appointment as guardian or conservator 
							</label>
						</div>      
					</div>
					<!-- Section A line d -->
					<div class="styIRS56LineItem">
						<div class="styIRS56Part1">d</div>
						<div style="float:left; ">
						<span>
						<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="$Form56Data/ValidTrustOrAmendmentInd"/>
						</xsl:call-template>
						<input type="Checkbox" alt="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$Form56Data/ValidTrustOrAmendmentInd"/>
							<xsl:with-param name="BackupName">Form56DataValidTrustOrAmendmentInd</xsl:with-param>
							</xsl:call-template>
							</input>
							</span>
							</div>
						<div style="float:left; padding-top:0.5mm; padding-left:.5mm">
							<label for="Form56DataValidTrustOrAmendmentInd">
							Valid trust instrument and amendments 
							</label>
						</div>      
					</div>
					<!-- Section A line e -->
					<div class="styIRS56LineItem">
						<div class="styIRS56Part1">e</div>
						<div style="float:left;">
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$Form56Data/BankruptcyOrAssignmentInd"/>
								<xsl:with-param name="BackupName">Form56DataBankruptcyOrAssignmentInd</xsl:with-param>
							</xsl:call-template>
							<input type="Checkbox" alt="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form56Data/BankruptcyOrAssignmentInd"/>
								<xsl:with-param name="BackupName">Form56DataBankruptcyOrAssignmentInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						</div>
						<div style="float:left; padding-top:0.5mm; padding-left:.5mm">
							<label for="Form56DataBankruptcyOrAssignmentInd">
							Bankruptcy or assignment for the benefit of creditors
							</label>
						</div>      
					</div>
					<!-- Section A Line f -->
					<div class="styIRS56LineItem">
					<div class="styIRS56Part1">f</div>
					<div style="float:left;">
					<span>
						<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="$Form56Data/BankruptcyOrAssignmentInd"/>
							<xsl:with-param name="BackupName">Form56DataBankruptcyOrAssignmentInd</xsl:with-param>
						</xsl:call-template>
						<input type="Checkbox" alt="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form56Data/OtherFiduciaryAuthorityGrp/OtherAuthorityInd"/>
							<xsl:with-param name="BackupName">Form56OtherFiduciaryAuthorityGrpOtherAuthorityInd</xsl:with-param>
						</xsl:call-template>
						</input>
						</span>
						</div>
					<div style="float:left; padding-top:0.5mm; padding-left:0.5mm;">
						<label for="Form56OtherFiduciaryAuthorityGrpOtherAuthorityInd">
						Other. Describe
						</label>
						 <span style="width:5px"/><img src="{$ImagePath}/56_Bullet.gif" alt="MediumBullet"/><span style="width:5px"/>
					</div>
					<div style="float:left;border-bottom:1px dashed black;width:143mm;">					  
					     <span> 	
						<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form56Data/OtherFiduciaryAuthorityGrp/OtherAuthorityExplanationDesc"/>
						<xsl:with-param name="BackupName">Form56OtherFiduciaryAuthorityGrpOtherAuthorityExplanationDesc</xsl:with-param>
						</xsl:call-template>
					      </span> 
					</div>    
					</div>      	
					<!-- Section A line 2a -->
					<div class="styIRS56LineItem" style="width:187mm;padding-top:0mm">
					<div class="styIRS56PartNum" style="padding-top:0.5mm;padding-left:1.5mm;float:left;clear:none">2a</div>
					<div class="styGenericDiv" style="float:left; padding-top:0.5mm;">
						If box 1a or 1b is checked, enter the date of death
						<span style="width:5px"/><img src="{$ImagePath}/56_Bullet.gif" alt="MediumBullet"/><span style="width:5px"/>
					</div>
					<div class="styGenericDiv" style="border-bottom:1px dashed black;width:100mm">					  
					     <span> 	
						<xsl:call-template name="PopulateMonthDayYear">
						<xsl:with-param name="TargetNode" select="$Form56Data/DecedentDeathDt"/>
						<xsl:with-param name="BackupName">Form56DataDecedentDeathDate</xsl:with-param>
						</xsl:call-template>
					      </span> 
					</div>    
					</div>
					<!-- Section A line 2b -->
					<div class="styIRS56LineItem" style="width:187mm">
					<div class="styIRS56PartNum" style="padding-top:0.5mm;padding-left:1.5mm;float:left;clear:none">2b</div>
					<div class="styGenericDiv" style="float:left; padding-top:0.5mm;">
						If box 1c – 1f is checked, enter the date of appointment, taking office, or assignment
						or transfer of assets
						<span style="width:5px"/><img src="{$ImagePath}/56_Bullet.gif" alt="MediumBullet"/><span style="width:5px"/>
					</div>
					<div class="styGenericDiv" style="border-bottom:1px dashed black;width:22mm">					  
					     <span> 	
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryAuthorityDt"/>
							<xsl:with-param name="BackupName">Form56DataFiduciaryAuthorityDt</xsl:with-param>
						</xsl:call-template>
					      </span> 
					</div>    
					</div>
					<!-- Section B - Nature of Liability and Tax Notices  -->
					<div class="styIRS56PartHeader" style="width:186mm">
						<div class="styTitleName" style="width:20mm; font-size:10pt">Section B</div>
						<div class="styTitleDesc" style="font-size:10pt; width:145mm">Nature of Liability and Tax Notices </div>
					</div>
					<!-- Section B Line 3 -->
					<div class="styIRS56LineItem">
					<div class="styIRS56PartNum" style="padding-top:0.5mm;float:left;clear:none">3</div>
					<div class="styGenericDiv" style="width:180mm;float:left; padding-top:0.5mm;">
						Type of taxes (check all that apply):
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$Form56Data/IncomeInd"/>
								<xsl:with-param name="BackupName">Form56DataIncomeInd </xsl:with-param>
							</xsl:call-template>
							<input type="Checkbox" title="income" id="income" alt="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form56Data/IncomeInd"/>
								<xsl:with-param name="BackupName">Form56DataIncomeInd </xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<label for="income"> 
							Income
						</label>
						<span style="width:8px"/>
						<span>
							<xsl:call-template name="PopulateSpan">
							
							</xsl:call-template>
							<input type="Checkbox" title="gift" id="gift" alt="Checkbox" class="styCkbox" onclick="return false">
							</input>
						</span>
						<label for="gift">Gift </label>
						<span style="width:8px"/>
						<span>
							<input type="Checkbox" alt="Checkbox" title="estate" id="estate" class="styCkbox" onclick="return false">
							</input>
						</span>
						<label for="estate">Estate </label>
						<span style="width:8px"/>
						<span>
							<input type="Checkbox" title="transfer" id="transfer" alt="Checkbox" class="styCkbox" onclick="return false">
							</input>
						</span>
						<label for="transfer">Generation-skipping transfer </label>
						<span style="width:8px"/>
						<span>
							<input type="Checkbox" title="employment" id="employment" alt="Checkbox" class="styCkbox" 
								onclick="return false">
							</input>
						</span>
						<label for="employment">Employment </label>
						<span style="width:8px"/>
						<span>
							<input type="Checkbox" title="excise" id="excise" alt="Checkbox" class="styCkbox" onclick="return false">
							</input>
						</span>
						<label for="excise">Excise </label>
						<span style="width:8px"/>
						<span>
							<input type="Checkbox" title="otherTypeOfTaxes" id="otherTypeOfTaxes" alt="Checkbox" class="styCkbox"
							    onclick="return false">
							</input>
						</span>
						<label for="otherTypeOfTaxes">Other (describe) </label>
						<span style="width:8px;"/>
						<span><img src="{$ImagePath}/56_Bullet.gif" alt="MediumBullet"/></span><span style="width:5px"/>
						<span style="width:102mm;border-bottom:1px dashed black"/>
						</div>
						  <span style="width:30mm;text-align:center;border-bottom:0px dashed black;">
					  
						<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form56Data/TaxTypeDescription"/>
						</xsl:call-template>
						</span>
					</div>
					
					<!-- Section B Line 4 -->
					<div class="styIRS56LineItem">
					<div class="styIRS56PartNum" style="padding-top:0.5mm;float:left;clear:none">4</div>
					<div class="styGenericDiv" style="width:180mm;float:left; padding-top:0.5mm;">
						Federal tax form number (check all that apply):
						<span><b>a</b>
						<span style="width:5px"/>
							<input type="Checkbox" alt="Checkbox" title="form706" id="form706" class="styCkbox" onclick="return false">
							</input>
						</span>
						<label for="form706">706 Series </label>
						<span style="width:8px"/>
						<span><b>b</b>
						<span style="width:5px"/>
							<input type="Checkbox" alt="Checkbox" title="form709" id="form709" class="styCkbox" onclick="return false">
							</input>
						</span>
						<label for="form709">709 </label>
						<span style="width:8px"/>
						<span><b>c</b>
						<span style="width:5px"/>
							<input type="Checkbox" alt="Checkbox" title="form940" id="form940" class="styCkbox" onclick="return false">
							</input>
						</span>
						<label for="form940">940 </label>
						<span style="width:8px"/>
						<span><b>d</b>
						<span style="width:5px"/>
							<input type="Checkbox" alt="Checkbox" title="form941" id="form941" class="styCkbox" onclick="return false">
							</input>
						</span>
						<label for="form941">941,943, or 944 </label>
						<span style="width:8px"/>
						<span><b>e</b>
						<span style="width:5px"/>
						
							<input type="Checkbox" title="form1040" alt="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form56Data/TaxFormNum1040Ind"/>
								<xsl:with-param name="BackupName">Form56DataTaxFormNum1040Ind </xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$Form56Data/TaxFormNum1040Ind"/>
								<xsl:with-param name="BackupName">Form56DataTaxFormNum1040Ind </xsl:with-param>
							</xsl:call-template>
							1040, 1040-A, or 1040-EZ 
						</label>
						<span style="width:8px"/>
						<span><b>f</b>
						<span style="width:5px"/>
						    <input type="Checkbox" title="form1041" id="form1041" alt="Checkbox" class="styCkbox" 
								  onclick="return false">
							</input>
						</span>
						<label for="form1041">1041 </label>
						<span style="width:8px"/>
						<span><b>g</b>
						<span style="width:5px"/>
							<input type="Checkbox" alt="Checkbox" title="form1120" id="form1120" class="styCkbox" 
								 onclick="return false">
							</input>
						</span>
						<label for="form1120">1120 </label>
						<span style="width:8px;"/>
						<span><b>h</b>
						<span style="width:5px"/>
							<input type="Checkbox" title="otherFormNumber" id="otherFormNumber" alt="Checkbox" class="styCkbox"
							     onclick="return false">
							</input>
						</span>
						<label for="otherFormNumber">Other (list) </label>
						<span style="width:5px"/>
						<span><img src="{$ImagePath}/56_Bullet.gif" alt="MediumBullet"/></span><span style="width:5px"/>
						<span style="width:88mm;border-bottom:1px dashed black"/>
						</div>
						  <span style="width:30mm;text-align:center;border-bottom:0px dashed black;">
					  
						<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form56Data/TaxTypeDescription"/>
						</xsl:call-template>
						</span>
					</div>
					<!-- Section B Line 5 -->
					<div class="styIRS56LineItem">
					<div class="styIRS56PartNum" style="padding-top:0.5mm">5</div>
					<div class="styIRS56LNDesc" style="width:179mm">
					<div style="float:left">
						<span style="float:left;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form56Data/FidcryAuthDoesNotCoverAllYrGrp/AuthDoesNotCoverAllTaxYearInd"/>
									<xsl:with-param name="BackupName">Form56DataFidcryAuthDoesNotCoverAllYrGrpAuthDoesNotCoverAllTaxYearInd </xsl:with-param>
								</xsl:call-template>
								If your authority as a fiduciary does not cover all years or tax periods, check here
							</label>
						</span>
						<span style="float:right;">
							<span class="styDotLn" style="padding-right:2mm;">..............</span>
							<img src="{$ImagePath}/56_Bullet.gif" alt="MediumBullet"/>
							<span style="width:8px"/>
							<input type="Checkbox" alt="Authority does not cover all tax periods" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form56Data/FidcryAuthDoesNotCoverAllYrGrp/AuthDoesNotCoverAllTaxYearInd"/>
									<xsl:with-param name="BackupName">Form56DataFidcryAuthDoesNotCoverAllYrGrpAuthDoesNotCoverAllTaxYearInd </xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<br/>
						<label for="Form56DataFidcryAuthDoesNotCoverAllYrGrpAuthDoesNotCoverAllTaxYearInd">
							and list the specific years or periods
						  </label>
						<span style="width:5px"/>
						<img src="{$ImagePath}/56_Bullet.gif" alt="MediumBullet"/> 
						<xsl:for-each select="$Form56Data/FidcryAuthDoesNotCoverAllYrGrp/TaxYearOrTaxPeriodGrp">
						<xsl:if test="position()!=1">
							<span style="width:56.5mm"/>
						</xsl:if> 
						<span style="width:120mm;border-bottom:1px dashed black">
						<span style="width:3mm"/>
						
						<xsl:call-template name="PopulateYear">
						<xsl:with-param name="TargetNode" select="TaxYr"/>
						</xsl:call-template>
						<span style="width:3mm"/>
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="TaxPeriodBeginDt"/>
						</xsl:call-template>
						<span style="width:3mm"/>
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="TaxPeriodEndDt"/>
						</xsl:call-template>
						
						</span>
						<br/>
						</xsl:for-each>
						</div>
					</div>
					</div>     

					<!-- Section B Line 6 -->
					<div class="styIRS56LineItem" style="width:187mm;">
						<div class="styIRS56PartNum" style="padding-top:0mm">6</div>
							<div class="styGenericDiv" style="width:179mm; ">
								<span style="float:left;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryRcvCopyOfCommunGrp/FiduciaryReceivesAllNoticeInd"/>
											<xsl:with-param name="BackupName">Form56DataFiduciaryRcvCopyOfCommunGrpFiduciaryReceivesAllNoticeInd </xsl:with-param>
										</xsl:call-template>
								If the fiduciary listed wants a copy of notices or other written communications (see the instructions) check this box
									</label>
								</span>
								<span style="float:right;">
									<span class="styDotLn">..</span>
									<span style="width:8px"/>
									<img src="{$ImagePath}/56_Bullet.gif" alt="MediumBullet"/>
									<span style="width:5px"/>
									<input type="Checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryRcvCopyOfCommunGrp/FiduciaryReceivesAllNoticeInd"/>
											<xsl:with-param name="BackupName">Form56DataFiduciaryRcvCopyOfCommunGrpFiduciaryReceivesAllNoticeInd </xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
							</div>
							<div class="styGenericDiv" style="margin-left:5.8mm;width:187mm">
								 and enter the year(s) or period(s) for the corresponding line 4 item checked. 
								 If more than 1 form entered on line 4h, enter the form number.	
							</div>
							<div class="styGenericDiv" style="margin-left:0.5mm;margin-top:1mm;width187mm;font-weight:bold;">
								Complete only if the line 6 box is checked.
							</div>
							<!-- Table expand/collapse toggle button -->
								<div class="styGenericDiv" style="width:3.2mm;height:4mm;float:right;clear:none;">
									<xsl:call-template name="SetDynamicTableToggleButton">
										<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryRcvCopyOfCommunGrp/TaxYearOrTaxPeriodGrp"/>
										<xsl:with-param name="containerHeight" select="5"/>
										<xsl:with-param name="headerHeight" select="1"/>
										<xsl:with-param name="containerID" select=" 'depdContainerId'  "/>
									</xsl:call-template>
								</div>
							<div style="width:183mm;border-bottom:1px solid black;">
							<div class="sty56DepdContainer" style="overflow-y: auto;width:187mm;border-bottom-width:0" id="depdContainerId">
								<!-- print logic -->
								<xsl:call-template name="SetInitialState"/>
								<table class="styTable" style="" cellspacing="0">
								<thead class="styTableThead">
									<tr>
										<th style="font-size:8pt;font-weight:normal;border-left:1px solid black;border-right:1px solid black;border-top:1px solid black; width:30mm;" scope="col"  >If this item is checked:</th>
										<th style="font-size:8pt;font-weight:normal;border-right:1px solid black;width:60mm;border-top:1px solid black;" scope="col" >Enter year(s) or period(s)</th>
										<th style="font-size:8pt;font-weight:normal;border-right:1px solid black;width:30mm;border-top:1px solid black;" scope="col" >If this item is checked:</th>
										<th style="font-size:8pt;font-weight:normal;border-right:1px solid black;black;width:70mm;border-top:1px solid black;" scope="col">Enter year(s) or period(s)</th>
									</tr>
									</thead>
									<tbody>
									<xsl:if test="($Print = $Separated) and (count($Form56Data/FiduciaryRcvCopyOfCommunGrp/TaxYearOrTaxPeriodGrp) &gt; 10)">
										<tr>
											<td style="border-left:1px solid black;border-right:1px solid black;border-top:1px solid black">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryRcvCopyOfCommunGrp/TaxYearOrTaxPeriodGrp"/>
												</xsl:call-template>
											</td>
											<td style="border-right:1px solid black;border-top:1px solid black">&nbsp;</td>
											<td style="border-right:1px solid black;border-top:1px solid black">&nbsp;</td>
											<td style="border-top:1px solid black;border-right:1px solid black">&nbsp;</td>
										</tr>
										<tr>
											<td style="border-left:1px solid black;border-right:1px solid black;border-top:1px solid black">&nbsp;</td>
											<td style="border-right:1px solid black;border-top:1px solid black">&nbsp;</td>
											<td style="border-right:1px solid black;border-top:1px solid black">&nbsp;</td>
											<td style="border-top:1px solid black;border-right:1px solid black">&nbsp;</td>
										</tr>
										<tr>
											<td style="border-left:1px solid black;border-right:1px solid black;border-top:1px solid black">&nbsp;</td>
											<td style="border-right:1px solid black;border-top:1px solid black">&nbsp;</td>
											<td style="border-right:1px solid black;border-top:1px solid black">&nbsp;</td>
											<td style="border-top:1px solid black;border-right:1px solid black">&nbsp;</td>
										</tr>
										<tr>
											<td style="border-left:1px solid black;border-right:1px solid black;border-top:1px solid black">&nbsp;</td>
											<td style="border-right:1px solid black;border-top:1px solid black">&nbsp;</td>
											<td style="border-right:1px solid black;border-top:1px solid black">&nbsp;</td>
											<td style="border-top:1px solid black;border-right:1px solid black">&nbsp;</td>
										</tr>
										<tr>
											<td style="border-left:1px solid black;border-right:1px solid black;border-top:1px solid black">&nbsp;</td>
											<td style="border-right:1px solid black;border-top:1px solid black">&nbsp;</td>
											<td style="border-right:1px solid black;border-top:1px solid black">&nbsp;</td>
											<td style="border-top:1px solid black;border-right:1px solid black">&nbsp;</td>
										</tr>
									</xsl:if>
									<xsl:if test="($Print != $Separated) or (count($Form56Data/FiduciaryRcvCopyOfCommunGrp/TaxYearOrTaxPeriodGrp) &lt;= 10)">
										<xsl:for-each select="$Form56Data/FiduciaryRcvCopyOfCommunGrp/TaxYearOrTaxPeriodGrp">
										<xsl:variable name="position" select="position()"/>
										<xsl:if test="$position mod 2 = 1">
											<tr style="">
												<td style="font-size:8pt;font-weight:bold;border-left:1px solid black;border-right:1px solid black;border-top:1px solid black">4e</td>
												<td style="font-size:8pt;border-right:1px solid black;border-top:1px solid black">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryRcvCopyOfCommunGrp/TaxYearOrTaxPeriodGrp[$position]/TaxYr"/>
													</xsl:call-template>
													<span style="width:10px"/>
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryRcvCopyOfCommunGrp/TaxYearOrTaxPeriodGrp[$position]/TaxPeriodBeginDt"/>
													</xsl:call-template>
													<span style="width:10px"/>
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryRcvCopyOfCommunGrp/TaxYearOrTaxPeriodGrp[$position]/TaxPeriodEndDt"/>
													</xsl:call-template>
												</td>
												<td style="font-size:8pt;font-weight:bold;border-right:1px solid black;border-top:1px solid black">4e</td>
												<td style="font-size:8pt;border-top:1px solid black;border-right:1px solid black">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryRcvCopyOfCommunGrp/TaxYearOrTaxPeriodGrp[$position+1]/TaxYr"/>
													</xsl:call-template>
													<span style="width:10px"/>
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryRcvCopyOfCommunGrp/TaxYearOrTaxPeriodGrp[$position+1]/TaxPeriodBeginDt"/>
													</xsl:call-template>
													<span style="width:10px"/>
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryRcvCopyOfCommunGrp/TaxYearOrTaxPeriodGrp[$position+1]/TaxPeriodEndDt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:if>
										</xsl:for-each>
										<xsl:choose>
										<xsl:when test="count($Form56Data/FiduciaryRcvCopyOfCommunGrp/TaxYearOrTaxPeriodGrp) &lt; 1">
											<xsl:call-template name="blankRow"/>
											<xsl:call-template name="blankRow"/>
											<xsl:call-template name="blankRow"/>
											<xsl:call-template name="blankRow"/>
											<xsl:call-template name="blankRow"/>
										</xsl:when>
										<xsl:when test="count($Form56Data/FiduciaryRcvCopyOfCommunGrp/TaxYearOrTaxPeriodGrp) &lt; 3">
											<xsl:call-template name="blankRow"/>
											<xsl:call-template name="blankRow"/>
											<xsl:call-template name="blankRow"/>
											<xsl:call-template name="blankRow"/>
										</xsl:when>
										<xsl:when test="count($Form56Data/FiduciaryRcvCopyOfCommunGrp/TaxYearOrTaxPeriodGrp) &lt; 5">
											<xsl:call-template name="blankRow"/>
											<xsl:call-template name="blankRow"/>
											<xsl:call-template name="blankRow"/>
										</xsl:when>
										<xsl:when test="count($Form56Data/FiduciaryRcvCopyOfCommunGrp/TaxYearOrTaxPeriodGrp) &lt; 7">
											<xsl:call-template name="blankRow"/>
											<xsl:call-template name="blankRow"/>
										</xsl:when>
										<xsl:when test="count($Form56Data/FiduciaryRcvCopyOfCommunGrp/TaxYearOrTaxPeriodGrp) &lt; 9">
											<xsl:call-template name="blankRow"/>
										</xsl:when>
										</xsl:choose>
									</xsl:if>
								</tbody>
							</table>
						</div>
					</div>
					</div>
					<!-- Set Initial Height of Above Table -->
		<!--		<xsl:call-template name="SetInitialDynamicTableHeight">
                <xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryRcvCopyOfCommunGrp/TaxYearOrTaxPeriodGrp"/>
                <xsl:with-param name="containerHeight" select="5"/>
                <xsl:with-param name="headerHeight" select="1"/>
                <xsl:with-param name="containerID" select=" 'depdContainerId' "/>
              </xsl:call-template > -->
					<!-- END Part III - Nature of Liability and Tax Notices  -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;margin-top:4px;border-top:2px solid black;">
						<div style="float:left;">
							<span style="font-weight:bold;">
								For Paperwork Reduction Act and Privacy Act Notice, see back page.
							</span>
							<span style="margin-left:16px;width:26mm;font-size:7pt;">
							Cat. No. 16375I
							</span>
						</div>
						<div style="float:right;"> 
								Form 
							<span class="styBoldText" style="font-size:8pt;">56</span> (Rev. 12-2011)
						</div>
						
					</div>
					<!-- END Page Break and Footer-->
					<!-- BEGIN Page Header -->
					<div class="styTBB" style="width:187mm;height:5mm;padding-top:3mm;vertical-align:bottom">
						<span style="float:left;vertical-align:bottom;font-size:8pt;">
							Form 56 (Rev. 12-2011)
						</span>
						<span style="float:right;vertical-align:bottom">
							Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</span>
					</div>
					<!-- END Page Header -->

					<!-- Part II - Court and Administrative Proceedings  -->
					<div class="styIRS56PartHeader">
						<div class="styTitleName" style="width:17mm; font-size:10pt">Part II</div>
						<div class="styTitleDesc" style="font-size:10pt; width:169mm">Court and Administrative Proceedings </div>
					</div>
					<div class="styBB" style="width:187mm;float:none;clear:none;">
							<div class="styNameBox" style="width:131mm;height:8mm;font-size:7pt;">
								<div>Name of court (if other than a court proceeding, identify the type of proceeding and name of agency)</div>
								<span style="width:100%;height:auto;font-size:7pt;padding-left:4px;">
									<xsl:choose>
									<xsl:when test="$Form56Data/CourtNm">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form56Data/CourtNm"/>
										</xsl:call-template>
										<span style="width:4px;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form56Data/CourtNm"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form56Data/CourtAgencyGrp/OtherProceedingTypeDesc"/>
										</xsl:call-template>
										<span style="width:8px;"/>-<span style="width:8px;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form56Data/CourtAgencyGrp/AgencyNm"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								</span>
							</div>
							<div class="styEINBox" style="width:55mm;height:4mm;padding-left:2mm;font-size:7pt;font-weight:normal;">
							<div>Date proceeding initiated </div>
							<span style="width:27mm;text-align:center;font-weight:normal;">
								<xsl:choose>
									<xsl:when test="$Form56Data/ProceedingsInitiatedDt">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="$Form56Data/ProceedingsInitiatedDt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise/>
								</xsl:choose>
							</span>
								</div>
							</div>
							
							<div class="styBB" style="width:187mm;float:none;clear:none;">
							<div class="styNameBox" style="width:131mm;height:8mm;font-size:7pt;">
								<div>
								Address of court</div>
								<span style="width:100%;height:auto;font-size:7pt;padding-left:4px;">
									<xsl:choose>
										<!-- US Biz Address -->
										<xsl:when test="$Form56Data/CourtAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form56Data/CourtAddress/AddressLine1"/>
											</xsl:call-template>,
												<span style="width:2px;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form56Data/CourtAddress/AddressLine2"/>
											</xsl:call-template>
										</xsl:when>
										</xsl:choose>
										</span>
							</div>
							<div class="styEINBox" style="width:55mm;height:4mm;padding-left:2mm;font-size:7pt;font-weight:normal;">
							<div>
								Docket number of proceeding</div>
							<span style="width:27mm;text-align:left;font-weight:normal;">
								<xsl:choose>
									<xsl:when test="$Form56Data/DocketNum">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form56Data/DocketNum"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise/>
								</xsl:choose>
								</span>
								</div>
							</div>
							
							<div class="styGenericDiv" style="width:187mm;">
							<table style="border-collapse:collapse">
								<tbody>
									<tr>
										<th style="font-weight:normal;width:93mm;border-right:1px solid black;font-size:7pt;" align="left" scope="col">City or town, state, and ZIP code </th>
										<th style="font-weight:normal;width:21mm;border-right:1px solid black;font-size:7pt;padding-left:2mm" align="left" scope="col">Date</th>
										<th style="font-weight:normal;width:27mm;border-right:1px solid black;font-size:7pt;padding-left:2mm" align="left" scope="col">Time</th>
										<th style="font-weight:normal;width:40mm;font-size:7pt;padding-left:2mm" align="left" scope="col">Place of other proceedings </th>
									</tr>
									<tr>
										<td style="font-size:7pt;border-right:1px solid black" valign="top">
											<xsl:call-template name="PopulateCityStateInfo">
												<xsl:with-param name="TargetNode" select="$Form56Data/CourtAddress"/>
											</xsl:call-template>
										</td>
										<td style="font-size:7pt;border-right:1px solid black" valign="top" align="center" >
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$Form56Data/CourtDt"/>
											</xsl:call-template>
										</td>
										<td style="font-size:7pt;border-right:1px solid black" valign="top" align="center">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form56Data/AMPMCourtTs"/>
											</xsl:call-template>
										</td>
										<td style="font-size:7pt" valign="top">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form56Data/OtherProceedingPlaceNm"/>
											</xsl:call-template>
										</td>
									</tr>
								</tbody>
							</table>
							
							</div>
							
					<!-- END Part II - Court and Administrative Proceedings  -->
					
					<!-- Part III - Signature   -->
					<div class="styIRS56PartHeader">
						<div class="styTitleName" style="width:13mm; font-size:10pt">Part III</div>
						<div class="styTitleDesc" style="font-size:10pt; width:170mm">Signature  </div>
					</div>
					<div class="styTBB" style="width:187mm;height:20mm;font-size:6.5pt;font-family:arial;border-bottom: 1px solid black;">
	<div style="width:20mm;padding-top:1mm;padding-left:1mm;height:100%;float:left;clear:none;border-right: 1px solid black;">
		<span class="styMainTitle" style="font-size:11pt;">
			Please 
			Sign <br/>
			Here 
		</span>
	</div>
	<div style="width:164mm;float:left;clear:none;">
		<div class="styIRS56LNDesc" style="width:100%">
I certify that I have the authority to execute this notice concerning fiduciary relationship on behalf of the taxpayer. </div>
	<br/><br/><br/>
<div class="styIRS56LNDesc" style="width:5mm;padding:0px 0px 0px 5px;">
<img src="{$ImagePath}/56_Bullet_Md.gif" alt="MediumBullet"/>
</div>
<div class="styIRS56LNDesc" style="width:65mm;padding:0px 0px 0px 5px;">
	<div class="styIRS56LNDesc" style="padding:0px 0px 0px 		0px;width:100%;height:4mm;border-bottom-width:1px;border-color:black;text-align:center">
		<xsl:call-template name="PopulatePin">
			<xsl:with-param name="TargetNode" select="$RtnHdrData/FiduciarySignaturePIN"/>
			<xsl:with-param name="BackupName">$RtnHdrDataFiduciarySignature</xsl:with-param>
		</xsl:call-template>
	</div>
	<div class="styIRS56LNDesc" style="padding:0px 0px 0px 0px;width:100%;height:4mm;font-size:6pt;">
		Fiduciary’s signature
	</div>
</div>
<div class="styIRS56LNDesc" style="width:5mm;padding:0px 0px 0px 5px;">

</div>
<div class="styIRS56LNDesc" style="width:45mm;padding:0px 0px 0px 5px;">
	<div class="styIRS56LNDesc" style="padding:0px 0px 0px 0px;width:100%;height:4mm;border-bottom-width:1px;border-color:black;">
		<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="$RtnHdrData/FiduciaryTitleTxt"/>
			<xsl:with-param name="BackupName">$RtnHdrDataFiduciaryTitle</xsl:with-param>
		</xsl:call-template>
	</div>
	<div class="styIRS56LNDesc" style="padding:0px 0px 0px 0px;width:100%;height:4mm;font-size:6pt;">
	Title, if applicable
	</div>
</div>
<div class="styIRS56LNDesc" style="width:5mm;padding:0px 0px 0px 5px;">

</div>
<div class="styIRS56LNDesc" style="width:35mm;padding:0px 0px 0px 5px;">
	<div class="styIRS56LNDesc" style="padding:0px 0px 0px 0px;width:100%;height:4mm;border-bottom-width:1px;border-color:black;text-align:center">
		<xsl:call-template name="PopulateMonthDayYear">
			<xsl:with-param name="TargetNode" select="$RtnHdrData/FiduciarySignatureDt"/>
			<xsl:with-param name="BackupName">$RtnHdrDataFiduciarySignatureDate</xsl:with-param>
		</xsl:call-template>
	</div>
	<div class="styIRS56LNDesc" style="padding:0px 0px 0px 0px;width:100%;height:4mm;font-size:6pt;">
	Date
	</div>
</div>
</div>
</div>
<div class="pageEnd" style="width:187mm">
<div style="float:right;">
		<span style="width:50px;"/>  
			Form 
		<span class="styBoldText" style="font-size:8pt;">56</span> (Rev. 12-2011)
	</div>
</div>
					<!-- END Part III - Signature   -->
					

					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData" style="padding-top:5mm;">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<xsl:variable name="TableWidth">100</xsl:variable>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form56Data"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I - Filer Primary Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I - Filer Decedent Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/DecedentNameControlTxt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I - Fiduciary Person Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryPersonNameControlTxt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I - Fiduciary Business Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryBusinessNmControlTxt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Address Type Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form56Data/AddressTypeCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
					</table>
					
					
					<xsl:if test="($Print = $Separated) and (count($Form56Data/FiduciaryRcvCopyOfCommunGrp/TaxYearOrTaxPeriodGrp) &gt; 10)">
						<span class="styRepeatingDataTitle">Form 56 Line 6 - Tax Year or Tax Period</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="2" style="text-align:left;width:85mm;">
										If this item is checked:
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:85mm;">
										Enter year(s) or period(s)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$Form56Data/FiduciaryRcvCopyOfCommunGrp/TaxYearOrTaxPeriodGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<xsl:variable name="position" select="position()"/>
												<td style="font-size:8pt;font-weight:bold;border-left:1px solid black;border-right:1px solid black;border-top:1px solid black">4e</td>
												<td style="font-size:8pt;border-right:1px solid black;border-top:1px solid black">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryRcvCopyOfCommunGrp/TaxYearOrTaxPeriodGrp[$position]/TaxYr"/>
													</xsl:call-template>
													<span style="width:10px"/>
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryRcvCopyOfCommunGrp/TaxYearOrTaxPeriodGrp[$position]/TaxPeriodBeginDt"/>
													</xsl:call-template>
													<span style="width:10px"/>
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryRcvCopyOfCommunGrp/TaxYearOrTaxPeriodGrp[$position]/TaxPeriodEndDt"/>
													</xsl:call-template>
												</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
