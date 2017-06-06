<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS9465Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form9465Data" select="$RtnDoc/IRS9465"/>
	<!-- ////////////////////////////////////////////////////////////// (Template:	CreateBox) -->
	<xsl:template name="CreateBox">
		<xsl:param name="TargetNode"/>
		<xsl:param name="AmountBoxStyle"/>
		<xsl:param name="PopulateAsText"/>
		<xsl:param name="StaticText"/>
		<xsl:param name="Number"/>
		<xsl:param name="NumberBoxStyle"/>
		<xsl:param name="Width">29mm</xsl:param>
		<xsl:param name="Height">5mm</xsl:param>
		<div class="styLNAmountBox">
			<xsl:attribute name="style">
				width:<xsl:value-of select="$Width"/>;height:<xsl:value-of select="$Height"/>;
				border-right-width:0px;float:right;text-align:right;padding-right:2px;font-size:7pt;
				<xsl:choose><xsl:when test="$TargetNode"><xsl:choose><xsl:when test="$TargetNode/@referenceDocumentId">padding-top:2px;</xsl:when><xsl:otherwise>padding-top:4px;</xsl:otherwise></xsl:choose></xsl:when><xsl:otherwise>padding-top:3px;</xsl:otherwise></xsl:choose><xsl:if test="$AmountBoxStyle"><xsl:value-of select="$AmountBoxStyle"/></xsl:if></xsl:attribute>
			<xsl:choose>
				<xsl:when test="$TargetNode">
					<xsl:choose>
						<xsl:when test="$PopulateAsText">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$TargetNode"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$TargetNode"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="$TargetNode/@referenceDocumentId">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$TargetNode"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:when>
				<xsl:when test="$StaticText">
					<xsl:value-of select="$StaticText"/>
				</xsl:when>
			</xsl:choose>
		</div>
		<div class="styLNRightNumBox">
			<xsl:attribute name="style">
				float:right;
				padding:2px 0px 0px 0px;
				border-right-width:0px;font-size:8pt;
				height:<xsl:value-of select="$Height"/>;
				<xsl:if test="$NumberBoxStyle"><xsl:value-of select="$NumberBoxStyle"/></xsl:if></xsl:attribute>
			<xsl:if test="$Number">
				<xsl:value-of select="$Number"/>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<xsl:template match="/">
		<html lang="EN-US">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form9465Data)"/>
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
				<meta name="Description" content="IRS Form 9465"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS9465Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS9465" style="font-family:arial;">
					<!--  Begin Header section 1 -->
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;border-bottom-width:2px;">
						<div class="styFNBox" style="width:31mm;height:22mm;border-right-width:2px;padding-top:.5mm;">
							<div style="padding-top:1mm;">
								Form<span class="styFormNumber">  9465</span>
							</div>
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form9465Data"/>
							</xsl:call-template>
							<!-- should this still say December -->
							<span class="styAgency">(Rev. December 2011)</span>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:125mm;height:22mm;">
							<!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
							<div class="styMainTitle" style="height:8mm;">
								Installment Agreement Request
							</div>
							<div class="styFST" style="height:5mm;font-size:7.5pt;margin-left:2mm;text-align:center;">
								<span style="text-align:center;font-weight:bold;">
									<div style="width:100%;height:5mm;padding-left:5px;">
										<div style="width:80mm;height:5mm;">
											<br/>
											<br/>
											<img src="{$ImagePath}/9465_Bullet_Sm.gif" alt="SmallBullet"/> 
											If you are filing this form with your tax return, attach it to the<br/>
											front of the return. Otherwise, see instructions.
										</div>
									</div>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;border-left-width:2px;height:22mm;border-bottom-width:0px;">
							<div class="styOMB" style="width:100%;font-size:7pt;height:auto;padding-top:8mm;border-bottom-width:0px;text-align:center;">OMB No. 1545-0074</div>
						</div>
					</div>
					<!--  End Header section 1 -->
					<!-- Caution -->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS9465LineItem">
							<div class="styIRS9465LNDesc" style="width:100%;height:auto;padding-left:0px;font-size:8pt;">
								<b>Caution: </b>
								<span class="styItalicText">
									Do not file this form if you are currently making payments on an installment agreement or can pay your balance in full within 120 days. <br/>
									Instead, call 1-800-829-1040. If you are in bankruptcy or we have accepted your offer-in-compromise, see <b>Bankruptcy or offer-in-compromise</b> on page 2.
								</span>
							</div>
						</div>
					</div>
					<!-- Form # and Tax Year -->
						<div class="styIRS9465LineItem">
							<div class="styIRS9465LNDesc" style="width:100%;height:auto;padding-left:0px;font-family:Arial Narrow;">
								This request is for Form(s) (for example, Form 1040 or Form 1040EZ)
								<span style="width:4px;"/>
								<img src="{$ImagePath}/9465_Bullet_Sm.gif" alt="SmallBullet"/>
								<span style="width:4px;"/>
								<span style="width:22mm;height:100%;font-family:Verdana;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form9465Data/F9465TaxReturnTypeCd"/>
									</xsl:call-template>
								</span>
								and for tax year(s) (for example, 2010 and 2011)
								<span style="width:4px;"/>
								<img src="{$ImagePath}/9465_Bullet_Sm.gif" alt="SmallBullet"/>
								<span style="width:4px;"/>
								<span style="width:20mm;height:100%;font-family:Verdana;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form9465Data/IATaxYear"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
					<!-- Body -->
					<!-- (1) ////////////////////////////////////////////////////-->
					<!-- Line 1 -->
					<div class="styGenericDiv" style="width:187mm;height:7mm;border-top:1px solid black">
							<div class="styIRS9465LNLeftNumBox">1</div>
							
									<div class="styIRS9465LNDesc" style="font-size:7pt;width:58mm;border-right:1px solid black;height:8mm">
										Your first name and initial
										<br/>
									<span style="font-size:7pt;padding-left:4px;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form9465Data/PersonFullName/PersonFirstName"/>
										</xsl:call-template>
										<span style="width:2px"/>
										
										<span style="width:4px;"/>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 1 - Primary Name Control</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form9465Data/PrimaryNameControl"/>
										</xsl:call-template>
									</span>
									</div>
									<div class="styIRS9465LNDesc" style="font-size:7pt;width:68mm;border-right:1px solid black;height:8mm">
										Last name
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form9465Data/PersonFullName/PersonLastName"/>
										</xsl:call-template>
									</div>
									<div class="styIRS9465LNDesc" style="width:43mm;font-size:7pt;height:8mm">
										<b>Your social security number</b><br/>
										<span style="width:100%;height:auto;font-size:7pt;text-align:center;">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="$Form9465Data/PrimarySSN"/>
											</xsl:call-template>
											<!-- If the SSN has changed, show a delta image -->
											<xsl:if test="$TaxpayerPrint = 'false' or $TaxpayerPrint = '0'">
												<xsl:if test="(/AppData/Parameters/TINChanged='true') or (/AppData/Parameters/TINChanged='1')">
													<span style="width:2px;"/>
													<img src="{$NonVersionedImagePath}/changeSmall.gif" style="padding-top:1px;" alt="Primary SSN has changed"/>
												</xsl:if>
											</xsl:if>
										</span>
									</div>
								</div>
							<!-- Line 2 -->
							<div class="styGenericDiv" style="width:187mm;height:8mm;border-top:1px solid black">
							<div class="styIRS9465LNLeftNumBox"/>
								<div class="styIRS9465CleanDiv" style="width:58mm;height:8mm;border-right-width:1px;padding-left:2mm">
										If a joint return, spouse’s first name and initial <br/>
									<span style="font-size:7pt;padding-left:4px;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form9465Data/SpouseName/PersonFirstName"/>
										</xsl:call-template>
										<span style="width:2px"/>
										
										<xsl:if test="$Form9465Data/SpouseNameControl">
											<span style="width:4px;"/>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Line 1 - Spouse Name Control</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$Form9465Data/SpouseNameControl"/>
											</xsl:call-template>
										</xsl:if>
									</span>
								</div>
								<div class="styIRS9465CleanDiv" style="width:68mm;height:100%;border-right-width:1px;padding-left:2mm">
										Last name
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form9465Data/SpouseName/PersonLastName"/>
										</xsl:call-template>
								</div>
								<div class="styIRS9465CleanDiv" style="width:43mm;height:8mm;padding-left:2mm">
									<b>Spouse’s social security number</b>
									<span style="width:100%;text-align:center">
										<span style="font-size:7pt;text-align:center;">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="$Form9465Data/SpouseSSN"/>
											</xsl:call-template>
											<!-- If the SSN has changed, show a delta image -->
											<xsl:if test="$TaxpayerPrint = 'false' or $TaxpayerPrint = '0'">
												<xsl:if test="(/AppData/Parameters/SecondaryTINChanged='true') or (/AppData/Parameters/SecondaryTINChanged='1')">
													<span style="width:2px;"/>
													<img src="{$NonVersionedImagePath}/changeSmall.gif" style="padding-top:1px;" alt="Spouse SSN has changed"/>
												</xsl:if>
											</xsl:if>
										</span>
									</span>
								</div>
							</div>
							<!-- Line 3 -->
							<div class="styGenericDiv" style="width:187mm;height:8mm;border-top:1px solid black">
							<div class="styIRS9465LNLeftNumBox"/>
								<div class="styIRS9465CleanDiv" style="border-right-width:1px;width:134mm;height:8mm;padding-left:2mm">
									Current address (number and street). If you have a P.O. box and no home delivery, enter your box number.<br/>
									<span style="width:100%;height:auto;font-size:7pt;padding-left:4px;">
										<xsl:choose>
											<!-- US Address (header)-->
											<xsl:when test="$RtnHdrData/Filer/USAddress">
												<xsl:call-template name="PopulateReturnHeaderFiler">
													<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressLine1</xsl:with-param>
												</xsl:call-template>
												<xsl:if test="$RtnHdrData/Filer/USAddress/AddressLine2">
													<br/>
													<xsl:call-template name="PopulateReturnHeaderFiler">
														<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
														<xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressLine2</xsl:with-param>
													</xsl:call-template>
												</xsl:if>
											</xsl:when>
											<!-- Foreign Address (header)-->
											<xsl:when test="$RtnHdrData/Filer/ForeignAddress">
												<xsl:call-template name="PopulateReturnHeaderFiler">
													<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressLine1</xsl:with-param>
												</xsl:call-template>
												<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
													<br/>
													<xsl:call-template name="PopulateReturnHeaderFiler">
														<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
														<xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressLine2</xsl:with-param>
													</xsl:call-template>
												</xsl:if>
											</xsl:when>
										</xsl:choose>
									</span>
								</div>
								<div class="styIRS9465CleanDiv" style="">
									Apt. number <br/>
									<span style="width:100%;padding-left:4px"></span>
								</div>
							</div>
							<!-- Line 4 -->
							<div class="styGenericDiv" style="width:187mm;height:8mm;border-top:1px solid black;border-bottom:1px solid black">
							<div class="styIRS9465LNLeftNumBox"/>
								<div class="styIRS9465LNDesc" style="width:165mm;font-size:7pt;">
									<span style="font-family:arial narrow;font-size:7.5pt">
									City, town or post office, state, and ZIP code. If a foreign address, enter city, province or state, and country.
									 Follow the country’s practice for entering the postal code.</span><br/>
								
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
							</div>
					<!-- (2) ////////////////////////////////////////////////////-->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS9465LNLeftNumBox">2</div>
						<div class="styIRS9465LNDesc" style="width:181mm;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form9465Data/NewAddressInd"/>
									<xsl:with-param name="BackupName">Form9465Data/NewAddressInd</xsl:with-param>
								</xsl:call-template>
								If this address is new since you filed your last tax return, check here
							</label>
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:11px"/>.
								<span style="width:7px"/>
							</span>
							<img src="{$ImagePath}/9465_Bullet_Sm.gif" alt="SmallBullet"/>
							<span style="width:2mm;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form9465Data/NewAddressInd"/>
									<xsl:with-param name="BackupName">Form9465Data/NewAddressInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!-- (3)(4) ////////////////////////////////////////////////////-->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS9465CleanDiv" style="width:94mm;height:100%;border-right-width:1px;">
							<div class="styIRS9465LNLeftNumBox">3</div>
							<div class="styIRS9465LNDesc" style="width:87mm;height:100%;">
								<!-- [Your home phone number] -->
								<span style="width:35mm;height:10mm;">
									<span style="border-width:0px 0px 1px 0px;border-style:solid;border-color:black;width:100%;text-align:center;height:6mm;font-size:6.5pt;padding-top:4px;">
										<xsl:choose>
											<xsl:when test="$Form9465Data/HomePhoneGrp/PhoneNumber">
												<xsl:call-template name="PopulatePhoneNumber">
													<xsl:with-param name="TargetNode" select="$Form9465Data/HomePhoneGrp/PhoneNumber"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:when test="$Form9465Data/HomePhoneGrp/ForeignPhoneNumber">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form9465Data/HomePhoneGrp/ForeignPhoneNumber"/>
												</xsl:call-template>
											</xsl:when>
										</xsl:choose>
									</span>
									<span style="width:100%;text-align:center;height:4mm;font-size:6.5pt;">
										Your home phone number
									</span>
								</span>
								<span style="width:5px;"/>
								<!-- [Best time for us to call] -->
								<span style="width:35mm;height:10mm">
									<span style="border-width:0px 0px 1px 0px;border-style:solid;border-color:black;width:100%;text-align:center;height:6mm;font-size:6.5pt;padding-top:4px;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form9465Data/HomePhoneGrp/BestTimeToCallAtHomeTxt"/>
										</xsl:call-template>
									</span>
									<span style="width:100%;text-align:center;height:4mm;font-size:6.5pt;">
										Best time for us to call
									</span>
								</span>
							</div>
						</div>
						<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<-->
						<div class="styIRS9465CleanDiv" style="width:93mm;height:100%;">
							<div class="styIRS9465LNLeftNumBox">4</div>
							<div class="styIRS9465LNDesc" style="width:86mm;height:100%;">
								<!-- [Your work phone number] -->
								<span style="width:35mm;height:10mm">
									<span style="border-width:0px 0px 1px 0px;border-style:solid;border-color:black;width:100%;text-align:center;height:6mm;font-size:6.5pt;padding-top:4px;">
										<xsl:choose>
											<xsl:when test="$Form9465Data/WorkPhoneGrp/PhoneNumber">
												<xsl:call-template name="PopulatePhoneNumber">
													<xsl:with-param name="TargetNode" select="$Form9465Data/WorkPhoneGrp/PhoneNumber"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:when test="$Form9465Data/WorkPhoneGrp/ForeignPhoneNumber">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form9465Data/WorkPhoneGrp/ForeignPhoneNumber"/>
												</xsl:call-template>
											</xsl:when>
										</xsl:choose>
									</span>
									<span style="width:100%;text-align:center;height:4mm;font-size:6.5pt;">
										Your work phone number
									</span>
								</span>
								<span style="width:5px;"/>
								<!-- [Ext.] -->
								<span style="width:8mm;height:10mm;">
									<span style="border-width:0px 0px 1px 0px;border-style:solid;border-color:black;width:100%;text-align:center;height:6mm;font-size:6.5pt;padding-top:4px;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form9465Data/WorkPhoneGrp/TelephoneNumberExtensionNum"/>
										</xsl:call-template>
									</span>
									<span style="width:100%;text-align:center;height:4mm;font-size:6.5pt;">
										Ext.
									</span>
								</span>
								<span style="width:5px;"/>
								<!-- [Best time for us to call] -->
								<span style="width:32mm;height:10mm;">
									<span style="border-width:0px 0px 1px 0px;border-style:solid;border-color:black;width:100%;text-align:center;height:6mm;font-size:6.5pt;padding-top:4px;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form9465Data/WorkPhoneGrp/BestTimeToCallAtWorkTxt"/>
										</xsl:call-template>
									</span>
									<span style="width:100%;text-align:center;height:4mm;font-size:6.5pt;">
										Best time for us to call
									</span>
								</span>
							</div>
						</div>
					</div>
					<!-- (5)(6) ////////////////////////////////////////////////////-->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS9465CleanDiv" style="width:94mm;height:43mm;border-right:1px solid black">
							<div class="styIRS9465LNLeftNumBox">5</div>
							<div class="styIRS9465LNDesc" style="width:87mm;height:100%;padding-right:3px;">
								<!-- Line 1 -->
								<div class="styIRS9465LNDesc" style="width:100%;height:12mm;border-bottom-width:1px;border-color:black;padding-left:0px;font-size:6.5pt;">
									Name of your bank or other financial institution:<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form9465Data/OrganizationNm"/>
									</xsl:call-template>
								</div>
								<!-- Line 2 -->
								<div class="styIRS9465LNDesc" style="width:100%;height:12mm;border-bottom-width:1px;border-color:black;padding-left:0px;font-size:6.5pt;">
									Address<br/>
									<xsl:choose>
										<xsl:when test="$Form9465Data/FinancialInstUSAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form9465Data/FinancialInstUSAddress/AddressLine1"/>
											</xsl:call-template>
											<xsl:if test="$Form9465Data/FinancialInstUSAddress/AddressLine2">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form9465Data/FinancialInstUSAddress/AddressLine2"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:when>
										<xsl:when test="$Form9465Data/FinancialInstForeignAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form9465Data/FinancialInstForeignAddress/AddressLine1"/>
											</xsl:call-template>
											<xsl:if test="$Form9465Data/FinancialInstForeignAddress/AddressLine2">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form9465Data/FinancialInstForeignAddress/AddressLine2"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:when>
									</xsl:choose>
								</div>
								<!-- Line 3 -->
								<div class="styIRS9465LNDesc" style="width:100%;height:12mm;padding-left:0px;font-size:6.5pt;word-wrap:break-word;">
									City, state, and ZIP code<br/>
									<xsl:call-template name="PopulateCityStateInfo">
										<xsl:with-param name="TargetNode" select="$Form9465Data/FinancialInstUSAddress"/>
										<xsl:with-param name="ForeignAddressTargetNode" select="$Form9465Data/FinancialInstForeignAddress"/>
									</xsl:call-template>
									<xsl:if test="$Form9465Data/FinancialInstForeignAddress">
										<span style="width:7px;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form9465Data/FinancialInstForeignAddress/Country"/>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
						</div>
						<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<-->
						<div class="styIRS9465CleanDiv" style="width:93mm;">
							<div class="styIRS9465LNLeftNumBox">6</div>
							<div class="styIRS9465LNDesc" style="width:80mm;height:100%;padding-right:3px;">
								<!-- Line 1 -->
								<div class="styIRS9465LNDesc" style="width:100%;height:12mm;border-bottom-width:1px;border-color:black;padding-left:0px;font-size:6.5pt;">
									Your employer’s name:<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form9465Data/EmployerName/BusinessNameLine1"/>
									</xsl:call-template>
									<xsl:if test="$Form9465Data/EmployerName/BusinessNameLine2">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form9465Data/EmployerName/BusinessNameLine2"/>
										</xsl:call-template>
									</xsl:if>
								</div>
								<!-- Line 2 -->
								<div class="styIRS9465LNDesc" style="width:100%;height:12mm;border-bottom-width:1px;border-color:black;padding-left:0px;font-size:6.5pt;">
									Address<br/>
									<xsl:choose>
										<xsl:when test="$Form9465Data/EmployerUSAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form9465Data/EmployerUSAddress/AddressLine1"/>
											</xsl:call-template>
											<xsl:if test="$Form9465Data/EmployerUSAddress/AddressLine2">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form9465Data/EmployerUSAddress/AddressLine2"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:when>
										<xsl:when test="$Form9465Data/EmployerForeignAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form9465Data/EmployerForeignAddress/AddressLine1"/>
											</xsl:call-template>
											<xsl:if test="$Form9465Data/EmployerForeignAddress/AddressLine2">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form9465Data/EmployerForeignAddress/AddressLine2"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:when>
									</xsl:choose>
								</div>
								<!-- Line 3 -->
								<div class="styIRS9465LNDesc" style="width:100%;height:12mm;padding-left:0px;font-size:6.5pt;word-wrap:break-word;">
									City, state, and ZIP code<br/>
									<xsl:call-template name="PopulateCityStateInfo">
										<xsl:with-param name="TargetNode" select="$Form9465Data/EmployerUSAddress"/>
										<xsl:with-param name="ForeignAddressTargetNode" select="$Form9465Data/EmployerForeignAddress"/>
									</xsl:call-template>
									<xsl:if test="$Form9465Data/EmployerForeignAddress">
										<span style="width:7px;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form9465Data/EmployerForeignAddress/Country"/>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<!-- (7) ////////////////////////////////////////////////////-->
						<div class="styIRS9465LineItem">
							<div class="styIRS9465LNLeftNumBox">7</div>
							<div class="styIRS9465CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS9465LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS9465LNDesc" style="width:auto;height:100%;">
										Enter the total amount you owe as shown on your tax return(s) (or notice(s))
									</div>
									<div class="styIRS9465LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 9px 0px 0px;">
										<!--Dotted Line-->
										<span class="styBoldText">
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
									</div>
								</div>
							</div>
							<div class="styIRS9465CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS9465CleanDiv" style="width:100%;height:100%;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">7</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form9465Data/TaxDueAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (8) ////////////////////////////////////////////////////-->
						<div class="styIRS9465LineItem">
							<div class="styIRS9465LNLeftNumBox">8</div>
							<div class="styIRS9465CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS9465LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS9465LNDesc" style="width:auto;height:100%;">
										Enter the amount of any payment you are making with your tax return(s) (or notice(s)). See instructions
									</div>
								</div>
							</div>
							<div class="styIRS9465CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS9465CleanDiv" style="width:100%;height:100%;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">8</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form9465Data/PaymentAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (9) ////////////////////////////////////////////////////-->
						<div class="styIRS9465LineItem">
							<div class="styIRS9465LNLeftNumBox">9</div>
							<div class="styIRS9465CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS9465LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS9465LNDesc" style="width:auto;height:100%;">
										Enter the amount you can pay each month. <b>Make your payments as large as possible to limit<br/>
										interest and penalty charges.</b> The charges will continue until you pay in full
										<!--Dotted Line-->
										<span class="styBoldText">
											<span style="width:19px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
									</div>
								</div>
							</div>
							<div class="styIRS9465CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS9465CleanDiv" style="width:100%;height:4mm;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;padding:0px 0px 0px 0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS9465CleanDiv" style="width:100%;height:auto;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">9</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form9465Data/PaymentDueAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (10) ////////////////////////////////////////////////////-->
						<div class="styIRS9465LineItem">
							<div class="styIRS9465LNLeftNumBox">10</div>
							<div class="styIRS9465CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS9465LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS9465LNDesc" style="width:auto;height:100%;">
										Enter the date you want to make your payment each month. <b>Do not</b> enter a date later than the 28th
										<span style="width:3px;"/>
										<img src="{$ImagePath}/9465_Bullet_Sm.gif" alt="SmallBullet"/>
									</div>
								</div>
							</div>
							<div class="styIRS9465CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS9465CleanDiv" style="width:100%;height:100%;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="TargetNode" select="$Form9465Data/PaymentDueDayNum"/>
										<xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="PopulateAsText">true</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<!-- (11) ////////////////////////////////////////////////////-->
						<div class="styIRS9465LineItem">
							<div class="styIRS9465LNLeftNumBox">11</div>
							<div class="styIRS9465LNDesc" style="width:181mm;height:auto;">
								If you want to make your payments by electronic funds withdrawal from your checking account, see the instructions and fill in<br/>
								lines 11a and 11b. This is the most convenient way to make your payments and it will ensure that they are made on time.
							</div>
						</div>
						<!-- (11a) ////////////////////////////////////////////////////-->
						<div class="styIRS9465LineItem" style="padding-bottom:3px;">
							<div class="styIRS9465LNLeftNumBox" style="padding-right:0px;"><img src="{$ImagePath}/9465_Bullet_Sm.gif" alt="SmallBullet"/></div>
							<div class="styIRS9465LNDesc" style="width:33mm;height:auto;padding-left:0px;">
								<span class="styBoldText" style="width:6mm;text-align:center;height:100%;">a</span>
								Routing number
								<span style="width:5px;"/>
							</div>
							<div class="styIRS9465LNDesc" style="width:40mm;height:auto;padding-left:0px;text-align:center;border-width:1px 1px 1px 1px;border-color:black;font-size:6.5pt;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form9465Data/RoutingTransitNumber"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- (11b) ////////////////////////////////////////////////////-->
						<div class="styIRS9465LineItem">
							<div class="styIRS9465LNLeftNumBox" style="padding-right:0px;"><img src="{$ImagePath}/9465_Bullet_Sm.gif" alt="SmallBullet"/></div>
							<div class="styIRS9465LNDesc" style="width:33mm;height:auto;padding-left:0px;">
								<span class="styBoldText" style="width:6mm;text-align:center;height:100%;">b</span>
								Account number
								<span style="width:5px;"/>
							</div>
							<div class="styIRS9465LNDesc" style="width:80mm;height:auto;padding-left:0px;text-align:center;border-width:1px 1px 1px 1px;border-color:black;font-size:6.5pt;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form9465Data/BankAccountNumber"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styIRS9465LineItem">
							<div class="styIRS9465LNLeftNumBox"/>
							<div class="styIRS9465LNDesc" style="width:181mm;height:auto;">
								I authorize the U.S. Treasury and its designated Financial Agent to initiate a monthly ACH debit (electronic withdrawal) 
								entry to the financial institution account indicated for payments of my Federal taxes owed, and the financial institution 
								to debit the entry to this account. This authorization is to remain in full force and effect until I notify the U.S. Treasury 
								Financial Agent to terminate the authorization. To revoke payment, I must contact the U.S. Treasury Financial Agent at 
								<b>1-800-829-1040</b> no later than 14 business days prior to the payment (settlement) date. I also authorize the financial 
								institutions involved in the processing of the electronic payments of taxes to receive confidential information necessary 
								to answer inquiries and resolve issues related to the payments.
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styIRS9465LineItem">
							<div class="styIRS9465LNDesc" style="width:39.9%;border-right-width:1px;border-color:black;height:10mm;padding-left:0px;">
								Your signature<br/>
								<span style="width:100%;padding-top:4px;">
									<xsl:call-template name="PopulatePin">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignature"/>
										<xsl:with-param name="BackupName">RtnHdrDataPrimarySignature</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div class="styIRS9465LNDesc" style="width:10%;border-right-width:1px;border-color:black;height:10mm;">
								Date<br/>
								<span style="width:100%;padding-top:4px;font-size:7pt;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignatureDate"/>
										<xsl:with-param name="BackupName">RtnHdrDataPrimarySignatureDate</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div class="styIRS9465LNDesc" style="width:40%;border-right-width:1px;border-color:black;height:10mm;">
								Spouse’s signature. If a joint return, <b>both</b> must sign.<br/>
								<span style="width:100%;padding-top:4px;">
									<xsl:call-template name="PopulatePin">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignature"/>
										<xsl:with-param name="BackupName">RtnHdrDataSpouseSignature</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div class="styIRS9465LNDesc" style="width:10%;border-color:black;height:10mm;">
								Date<br/>
								<span style="width:100%;padding-top:4px;font-size:7pt;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignatureDate"/>
										<xsl:with-param name="BackupName">RtnHdrDataSpouseSignatureDate</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
						</div>
					</div>
					
					  <!-- Page Break-->
					  <!-- Footer-->
					  <div class="pageEnd" style="width:187mm;">
						<div style="float:left;">
						  <span class="styBoldText">For Paperwork Reduction Act Notice, see page 3. </span>
						  <span style="width:80px;"/>                        
							Cat. No. 14842Y 
						</div>
						<div style="float:right;">
						  <span style="width:75px;"/>  
							Form <span class="styBoldText" style="font-size:8pt;">9465</span> (Rev. 12-2011)
						</div>
					  </div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
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
							<xsl:with-param name="TargetNode" select="$Form9465Data"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 1 - Primary Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form9465Data/PrimaryNameControl"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 1 - Spouse Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form9465Data/SpouseNameControl"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
