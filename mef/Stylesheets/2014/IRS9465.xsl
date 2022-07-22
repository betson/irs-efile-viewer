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
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
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
						<div class="styFNBox" style="width:31mm;height:19mm;border-right-width:2px;">
							Form<span class="styFormNumber">  9465</span>
							<br/>
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form9465Data"/>
							</xsl:call-template>
							<!-- should this still say December -->
							<span class="styAgency">(Rev. December 2013)</span>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:125mm;height:19mm;">
							<!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
							<div class="styMainTitle" style="height:7mm;">
								Installment Agreement Request
							</div>
							<div class="styFST" style="height:5mm;font-size:7.5pt;margin-left:2mm;text-align:center;">
								<span style="text-align:center;font-weight:bold;">
									<div style="width:100%;height:5mm;padding-left:5px;">
										<div style="width:120mm;height:5mm;">
											<img src="{$ImagePath}/9465_Bullet_Sm.gif" alt="SmallBullet"/> 
											Information about Form 9465 and its separate instructions is at <i>www.irs.gov/form9465</i>
											<br/>
											<img src="{$ImagePath}/9465_Bullet_Sm.gif" alt="SmallBullet"/> 
											If you are filing this form with your tax return, attach it to the front of the return.<br/>
											<img src="{$ImagePath}/9465_Bullet_Sm.gif" alt="SmallBullet"/>
											See separate instructions.
										</div>
									</div>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;border-left-width:2px;height:19mm;border-bottom-width:0px;">
							<div class="styOMB" style="width:100%;font-size:7pt;height:auto;padding-top:8mm;border-bottom-width:0px;text-align:center;">OMB No. 1545-0074</div>
						</div>
					</div>
					<!--  End Header section 1 -->
					<!-- Caution -->
					<div class="styBB" style="width:187mm;border-bottom-width:2px;">
						<div class="styIRS9465LineItem" style="height:auto;">
							<div class="styIRS9465LNDesc" style="width:100%;height:auto;padding-left:0px;font-size:8pt;padding-bottom:2mm;">
								<b>Tip: </b>If you owe $50,000 or less, you may be able to establish an installment agreement online, even if you have not yet received a bill for 
								your taxes. Go to IRS.gov to apply to pay online.  <b>Caution: </b>
								<i>Do not file this form if you are currently making payments on an installment agreement or can pay your balance in full within 120 days. Instead, 
									call 1-800-829-1040. Do not file if your business is still operating and owes employment or unemployment taxes. Instead, call the telephone
									 number on your most recent notice. If you are in bankruptcy or we have accepted your offer-in-compromise, see <b>Bankruptcy or 
									 offer-in-compromise,</b> in the	instructions. </i>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-bottom-width:1px;">
						<div class="styPartName" style="font-size:9pt;">Part I</div>
					</div>
					<!-- Form # and Tax Year -->
					<div class="styIRS9465LineItem" style="height:auto;">
						<div class="styIRS9465LNDesc" style="width:106mm;height:auto;padding-left:0px;font-family:Arial Narrow;">
							<div class="styIRS9465LNDesc" style="width:77mm;height:auto;padding-left:0px;font-family:Arial Narrow;">							
									This request is for Form(s) (for example, Form 1040 or Form 941)
									<span style="width:4px;"/>
								<img src="{$ImagePath}/9465_Bullet_Sm.gif" alt="SmallBullet"/>
							</div>
							<div class="styIRS9465LNDesc" style="width:28.5mm;height:auto;padding-left:0px;font-family:Arial Narrow;padding-top:1mm;">
								<xsl:choose>
									<xsl:when test="(count($Form9465Data/F9465TaxReturnTypeCd) &gt; 1)">
										<div style="width:28mm;height:auto;font-family:Verdana;font-size:6pt;">See Additional Data Table</div>
									</xsl:when>
									<xsl:otherwise>
										<div style="width:28mm;height:auto;font-family:Verdana;font-size:6pt">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form9465Data/F9465TaxReturnTypeCd"/>
											</xsl:call-template>
										</div>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
						<div class="styIRS9465LNDesc" style="width:80mm;height:auto;padding-left:0px;font-family:Arial Narrow;">																
								and for tax year(s) (for example, 2012 and 2013)
								<span style="width:4px;"/>
							<img src="{$ImagePath}/9465_Bullet_Sm.gif" alt="SmallBullet"/>
							<span style="width:20mm;height:100%;font-family:Verdana;font-size:6pt;padding-left:2mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form9465Data/IATaxYrDt"/>
								</xsl:call-template>
								<span style="width:6px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form9465Data/BusIATaxYrDt"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Body -->
					<!-- (1) ////////////////////////////////////////////////////-->
					<!-- Line 1a -->
					<div class="styGenericDiv" style="width:187mm;height:7mm;border-top:1px solid black">
						<div class="styIRS9465LNLeftNumBox" style="padding-right:0px;">1a</div>
						<div class="styIRS9465LNDesc" style="padding-top:.5mm;padding-right:1.5mm;font-size:7pt;width:58mm;border-right:1px solid black;height:8mm;">
										Your first name and initial
										<br/>
							<span style="font-size:7pt;">
								<xsl:choose>
									<xsl:when test="$RtnHdrData/ReturnTypeCd='9465'">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PersonFullName/PersonFirstNm"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form9465Data/PersonFullName/PersonFirstNm"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<span style="width:2px"/>
								<span style="width:4px;"/>
								<xsl:choose>
									<xsl:when test="$RtnHdrData/ReturnTypeCd='9465'">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 1a - Primary Name Control</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 1a - Primary Name Control</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form9465Data/PrimaryNameControlTxt"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
						<div class="styIRS9465LNDesc" style="padding-top:.5mm;padding-left:1mm;font-size:7pt;width:68mm;border-right:1px solid black;height:8mm;">
										Last name
										<br/>
							<xsl:choose>
								<xsl:when test="$RtnHdrData/ReturnTypeCd='9465'">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PersonFullName/PersonLastNm"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form9465Data/PersonFullName/PersonLastNm"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styIRS9465LNDesc" style="padding-left:1mm;width:43mm;font-size:7pt;height:8mm">
							<b>Your social security number</b>
							<br/>
							<span style="width:100%;height:auto;font-size:7pt;text-align:center;">
								<xsl:choose>
									<xsl:when test="$RtnHdrData/ReturnTypeCd='9465'">
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$Form9465Data/PrimarySSN"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
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
					<!-- Line 1 Spouse -->
					<div class="styGenericDiv" style="width:187mm;height:8mm;border-top:1px solid black">
						<div class="styIRS9465LNLeftNumBox"/>
						<div class="styIRS9465CleanDiv" style="width:58mm;height:8mm;border-right-width:1px;padding-top:.5mm;padding-left:3mm;">
										If a joint return, spouse’s first name and initial <br/>
							<span style="font-size:7pt;">
								<xsl:choose>
									<xsl:when test="$RtnHdrData/ReturnTypeCd='9465'">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseName/PersonFirstNm"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form9465Data/SpouseName/PersonFirstNm"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<span style="width:2px"/>
								<xsl:if test="$RtnHdrData/Filer/SpouseNameControlTxt">
									<span style="width:4px;"/>
									<xsl:choose>
										<xsl:when test="$RtnHdrData/ReturnTypeCd='9465'">
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Line 1a - Spouse Name Control</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseNameControlTxt"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Line 1a - Spouse Name Control</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$Form9465Data/SpouseNameControlTxt"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
							</span>
						</div>
						<div class="styIRS9465CleanDiv" style="width:68mm;height:100%;border-right-width:1px;padding-top:.5mm;padding-left:1mm;">
								Last name<br/>
							<xsl:choose>
								<xsl:when test="$RtnHdrData/ReturnTypeCd='9465'">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseName/PersonLastNm"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form9465Data/SpouseName/PersonLastNm"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styIRS9465CleanDiv" style="padding-left:1mm;width:43mm;height:8mm;">
							<b>Spouse’s social security number</b>
							<span style="width:100%;text-align:center">
								<span style="font-size:7pt;text-align:center;">
									<xsl:choose>
										<xsl:when test="$RtnHdrData/ReturnTypeCd='9465'">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseSSN"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="$Form9465Data/SpouseSSN"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
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
					<!-- Line 1 Current Address-->
					<div class="styGenericDiv" style="width:187mm;height:8.5mm;border-top:1px solid black">
						<div class="styIRS9465LNLeftNumBox"/>
						<div class="styIRS9465CleanDiv" style="border-right-width:1px;width:134mm;height:8mm;padding-left:3mm">
									Current address (number and street). If you have a P.O. box and no home delivery, enter your box number.<br/>
							<span style="width:100%;height:auto;">
								<xsl:choose>
									<!-- US Address (header)-->
									<xsl:when test="$RtnHdrData/Filer/USAddress">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressLine1</xsl:with-param>
										</xsl:call-template>
										<xsl:if test="$RtnHdrData/Filer/USAddress/AddressLine2Txt">
											<br/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressLine2</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</xsl:when>
									<!-- Foreign Address (header)-->
									<xsl:when test="$RtnHdrData/Filer/ForeignAddress">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressLine1</xsl:with-param>
										</xsl:call-template>
										<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
											<br/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressLine2</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</xsl:when>
								</xsl:choose>
							</span>
						</div>
						<div class="styIRS9465CleanDiv" style="padding-left:1mm">
									Apt. number <br/>
							<span style="width:100%;padding-left:4px"/>
						</div>
					</div>
					<!-- Line 1 City, town, post office -->
					<div class="styGenericDiv" style="width:187mm;height:9mm;border-top:1px solid black;border-bottom:1px solid black">
						<div class="styIRS9465LNLeftNumBox"/>
						<div class="styIRS9465LNDesc" style="width:165mm;padding-top:0px;">
							<span style="font-size:7pt;">
										City, town or post office, state, and ZIP code. If a foreign address, also complete the spaces below (see instructions).
									</span>
							<br/>
							<span class="" style="font-size:7pt;width:96mm;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
								</xsl:call-template>
								<br/>
							</span>
						</div>
					</div>
					<!-- (1) ////////////////////////////////////////////////////-->
					<!-- Line 1 Foreign Country-->
					<div class="styGenericDiv" style="width:187mm;height:8mm;border-bottom:1px solid black">
						<div class="styIRS9465LNDesc" style="padding-left:9mm;font-size:7pt;width:76mm;border-right:1px solid black;height:8mm">Foreign country name<br/>
							<span style="font-size:7pt;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
									<xsl:with-param name="MainForm">true</xsl:with-param>
								</xsl:call-template>
								<span style="width:2px"/>
								<span style="width:4px;"/>
							</span>
						</div>
						<div class="styIRS9465LNDesc" style="padding-left:1mm;font-size:7pt;width:66mm;border-right:1px solid black;height:8mm">Foreign province/state/county<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS9465LNDesc" style="padding-left:1mm;width:30mm;font-size:7pt;height:7mm">
									Foreign postal code<br/>
							<span style="width:100%;height:auto;font-size:7pt;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- (1b) ////////////////////////////////////////////////////-->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS9465LNLeftNumBox" style="padding-right:0px;">1b</div>
						<div class="styIRS9465LNDesc" style="width:181mm;height:6mm">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form9465Data/NewAddressInd"/>
									<xsl:with-param name="BackupName">Form9465Data/NewAddressInd</xsl:with-param>
								</xsl:call-template>
								If this address is new since you filed your last tax return, check here
							</label>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-right:1mm;">...................</span>
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
					<!-- Line 2-->
					<div class="styBB" style="width:187mm">
						<div class="styIRS9465LNLeftNumBox">2</div>
						<div class="styNameBox" style="width:131mm;height:8mm;font-size:7pt;padding-left:3mm;padding-top:.5mm;">
							  Name of your business (must be no longer operating)<br/>
							<span style="width:100%;height:auto;font-size:7pt;padding-top:.5mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Form9465BusinessFilerGrp/BusinessNameLine1Txt"/>
									<xsl:with-param name="BackupName">RtnHdrData/Form9465BusinessFilerGrp/BusinessNameLine1Txt	</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div class="styEINBox" style="width:46mm;height:8mm;padding-left:1mm;padding-top:.5mm;font-size:7pt;font-weight:normal;">
							  Employer identification number (EIN)<br/>
							<span style="width:100%;height:auto;font-size:7pt;font-weight:normal;padding-top:.5mm;">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Form9465BusinessFilerGrp/EIN"/>
									<xsl:with-param name="BackupName">RtnHdrData/Form9465BusinessFilerGrp/EIN</xsl:with-param>
								</xsl:call-template>
							</span>
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
											<xsl:when test="$Form9465Data/HomePhoneGrp/PhoneNum">
												<xsl:call-template name="PopulatePhoneNumber">
													<xsl:with-param name="TargetNode" select="$Form9465Data/HomePhoneGrp/PhoneNum"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:when test="$Form9465Data/HomePhoneGrp/ForeignPhoneNum">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form9465Data/HomePhoneGrp/ForeignPhoneNum"/>
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
											<xsl:when test="$Form9465Data/WorkPhoneGrp/PhoneNum">
												<xsl:call-template name="PopulatePhoneNumber">
													<xsl:with-param name="TargetNode" select="$Form9465Data/WorkPhoneGrp/PhoneNum"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:when test="$Form9465Data/WorkPhoneGrp/ForeignPhoneNum">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form9465Data/WorkPhoneGrp/ForeignPhoneNum"/>
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
					<div class="styBB" style="width:187mm;height:30mm;">
						<div class="styIRS9465CleanDiv" style="width:94mm;height:30mm;border-right:1px solid black;">
							<div class="styIRS9465LNLeftNumBox">5</div>
							<div class="styIRS9465LNDesc" style="width:87mm;height:100%;padding-right:3px;	padding-bottom:0mm;">
								<!-- Line 1 -->
								<div class="styIRS9465LNDesc" style="width:100%;height:9mm;border-bottom-width:1px;border-color:black;padding-left:0px;font-size:6.5pt;">
									Name of your bank or other financial institution:<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form9465Data/OrganizationNm"/>
									</xsl:call-template>
								</div>
								<!-- Line 2 -->
								<div class="styIRS9465LNDesc" style="width:100%;height:10mm;border-bottom-width:1px;border-color:black;padding-left:0px;font-size:6.5pt;">
									Address<br/>
									<xsl:choose>
										<xsl:when test="$Form9465Data/FinancialInstUSAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form9465Data/FinancialInstUSAddress/AddressLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="$Form9465Data/FinancialInstUSAddress/AddressLine2Txt">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form9465Data/FinancialInstUSAddress/AddressLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:when>
										<xsl:when test="$Form9465Data/FinancialInstForeignAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form9465Data/FinancialInstForeignAddress/AddressLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="$Form9465Data/FinancialInstForeignAddress/AddressLine2Txt">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form9465Data/FinancialInstForeignAddress/AddressLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:when>
									</xsl:choose>
								</div>
								<!-- Line 3 -->
								<div class="styIRS9465LNDesc" style="width:100%;height:10mm;padding-left:0px;font-size:6.5pt;word-wrap:break-word;padding-bottom:0mm;">
									City, state, and ZIP code<br/>
									<xsl:call-template name="PopulateCityStateInfo">
										<xsl:with-param name="TargetNode" select="$Form9465Data/FinancialInstUSAddress"/>
										<xsl:with-param name="ForeignAddressTargetNode" select="$Form9465Data/FinancialInstForeignAddress"/>
									</xsl:call-template>
									<xsl:if test="$Form9465Data/FinancialInstForeignAddress">
										<span style="width:7px;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form9465Data/FinancialInstForeignAddress/CountryCd"/>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
						</div>
						<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<-->
						<div class="styIRS9465CleanDiv" style="width:93mm;">
							<div class="styIRS9465LNLeftNumBox">6</div>
							<div class="styIRS9465LNDesc" style="width:80mm;height:28mm;padding-right:3px;padding-bottom:0mm;">
								<!-- Line 1 -->
								<div class="styIRS9465LNDesc" style="width:84mm;height:11.5mm;border-bottom-width:1px;border-color:black;padding-left:0px;font-size:6.5pt;">
									Your employer’s name:<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form9465Data/EmployerName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="$Form9465Data/EmployerName/BusinessNameLine2Txt">
									<span style="width:5px;"/> 
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form9465Data/EmployerName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
								</div>
								<!-- Line 2 -->
								<div class="styIRS9465LNDesc" style="width:84mm;height:9.5mm;border-bottom-width:1px;border-color:black;padding-left:0px;font-size:6.5pt;">
									Address<br/>
									<xsl:choose>
										<xsl:when test="$Form9465Data/EmployerUSAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form9465Data/EmployerUSAddress/AddressLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="$Form9465Data/EmployerUSAddress/AddressLine2Txt">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form9465Data/EmployerUSAddress/AddressLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:when>
										<xsl:when test="$Form9465Data/EmployerForeignAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form9465Data/EmployerForeignAddress/AddressLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="$Form9465Data/EmployerForeignAddress/AddressLine2Txt">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form9465Data/EmployerForeignAddress/AddressLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:when>
									</xsl:choose>
								</div>
								<!-- Line 3 -->
								<div class="styIRS9465LNDesc" style="width:84mm;height:10mm;padding-left:0px;font-size:6.5pt;word-wrap:break-word;padding-bottom:0mm;">
									City, state, and ZIP code<br/>
									<xsl:call-template name="PopulateCityStateInfo">
										<xsl:with-param name="TargetNode" select="$Form9465Data/EmployerUSAddress"/>
										<xsl:with-param name="ForeignAddressTargetNode" select="$Form9465Data/EmployerForeignAddress"/>
									</xsl:call-template>
									<xsl:if test="$Form9465Data/EmployerForeignAddress">
										<span style="width:7px;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form9465Data/EmployerForeignAddress/CountryCd"/>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<!-- (7) ////////////////////////////////////////////////////-->
						<div class="styIRS9465LineItem" style="height:4mm;">
							<div class="styIRS9465LNLeftNumBox">7</div>
							<div class="styIRS9465CleanDiv" style="width:144mm;height:auto;">
								<div class="styIRS9465LNDesc" style="width:auto;height:auto;padding:0px 0px 0px 0px;">
									<div class="styIRS9465LNDesc" style="width:auto;height:100%;">
										Enter the total amount you owe as shown on your tax return(s) (or notice(s))
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
							<div class="styIRS9465CleanDiv" style="width:37mm;height:%;float:right;">
								<div class="styIRS9465CleanDiv" style="width:100%;height:auto;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">4mm;text-align:center</xsl:with-param>
										<xsl:with-param name="Number">7</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form9465Data/TaxDueAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (8) ////////////////////////////////////////////////////-->
						<div class="styIRS9465LineItem" style="height:4mm;">
							<div class="styIRS9465LNLeftNumBox">8</div>
							<div class="styIRS9465CleanDiv" style="width:144mm;height:auto;padding;">
								<div class="styIRS9465LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS9465LNDesc" style="width:auto;height:100%;">
										Enter the amount of any payment you are making with your tax return(s) (or notice(s)). See instructions
									</div>
								</div>
							</div>
							<div class="styIRS9465CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS9465CleanDiv" style="width:100%;height:100%;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">4mm;text-align:center</xsl:with-param>
										<xsl:with-param name="Number">8</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form9465Data/PaymentAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (9) ////////////////////////////////////////////////////-->
						<div class="styIRS9465LineItem" style="height:5mm;">
							<div class="styIRS9465LNLeftNumBox">9</div>
							<div class="styIRS9465CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS9465LNDesc" style="width:138mm;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS9465LNDesc" style="width:138mm;height:100%;padding-top:1mm;">
										Subtract line 8 from line 7 and enter the result
										<!--Dotted Line-->
										<span class="styBoldText">
											<span style="width:5px"/>.
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
											
										</span>
									</div>
								</div>
							</div>
							<div class="styIRS9465CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS9465CleanDiv" style="width:100%;height:100%;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">5mm;text-align:center;padding-top:1mm</xsl:with-param>
										<xsl:with-param name="Number">9</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form9465Data/TotalTaxDueAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (10) ////////////////////////////////////////////////////-->
						<div class="styIRS9465LineItem" style="height:12mm;">
							<div class="styIRS9465LNLeftNumBox">10</div>
							<div class="styIRS9465CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS9465LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS9465LNDesc" style="width:auto;height:100%;">
										Enter the amount you can pay each month. Make your payments as large as possible to limit interest and penalty charges.<b> The charges will continue until you pay in full. If no payment amount is listed on line 10, a payment will be determined for you by dividing the balance due by 72 months </b>
										<!--Dotted Line-->
										<span class="styBoldText">
											<span style="width:5px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
									</div>
								</div>
							</div>
							<div class="styIRS9465CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<div class="styIRS9465CleanDiv" style="width:100%;height:7mm;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">100%</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;padding:0px 0px 0px 0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;padding:0px 0px 0px 0px;</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS9465CleanDiv" style="width:100%;float:right;height:auto;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">10</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form9465Data/PaymentDueAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- (11) ////////////////////////////////////////////////////-->
						<div class="styIRS9465LineItem" style="height:4mm;">
							<div class="styIRS9465LNLeftNumBox">11</div>
							<div class="styIRS9465CleanDiv" style="width:144mm;height:auto;padding-bottom:1.3mm">
								<div class="styIRS9465LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS9465LNDesc" style="width:auto;height:100%;">
										Divide the amount on line 9 by 72 and enter the result
										<!--Dotted Line-->
										<span class="styBoldText">
											<span style="width:5px"/>.
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
										</span>
									</div>
								</div>
							</div>
							<div class="styIRS9465CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
								<xsl:call-template name="CreateBox">
									<xsl:with-param name="Height">4mm;padding-top:1mm</xsl:with-param>
									<xsl:with-param name="Number">11</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form9465Data/CalculatedMonthlyPymtAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<span style="font-size:8pt;width:187mm;padding-left:9mm;">
							<img alt="Bullet" src="{$ImagePath}/1040SchA_Bullet_Round.gif" height="6" width="6"/>								 		
							If the amount on line 10 is less than the amount on line 11 and you are unable to increase your payment to the amount on line 11, complete and attach Form 433-F, Collection Information Statement.<br/>
							<img alt="Bullet" src="{$ImagePath}/1040SchA_Bullet_Round.gif" height="6" width="6"/>	
							If the amount on line 10 is equal to or greater than the amount on line 11 but the amount you owe is greater than $25,000 but not more than $50,000, you must complete either line 13 or 14, if you do not wish to complete Form 433-F.<br/>
							<img alt="Bullet" src="{$ImagePath}/1040SchA_Bullet_Round.gif" height="6" width="6"/>	
							If the amount on line 9 is greater than $50,000, complete and attach Form 433-F, Collection Information Statement.
						</span>
						<!-- (12) ////////////////////////////////////////////////////-->
						<div class="styIRS9465LineItem">
							<div class="styIRS9465LNLeftNumBox">12</div>
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
					<!-- (13) ////////////////////////////////////////////////////-->
					<div style="width:187mm;">
						<div class="styIRS9465LineItem">
							<div class="styIRS9465LNLeftNumBox">13</div>
							<div class="styIRS9465LNDesc" style="width:181mm;height:auto;">
								If you want to make your payments by direct debit from your checking account, see the instructions and fill in
								lines 13a and 13b. This is the most convenient way to make your payments and it will ensure that they are made on time.
							</div>
						</div>
						<br/>
						<br/>
						<!-- (13a) ////////////////////////////////////////////////////-->
						<div class="styIRS9465LineItem" style="padding-bottom:3px;">
							<div class="styIRS9465LNLeftNumBox" style="padding-right:0px;">
								<img src="{$ImagePath}/9465_Bullet_Sm.gif" alt="SmallBullet"/>
							</div>
							<div class="styIRS9465LNDesc" style="width:33mm;height:auto;padding-left:0px;">
								<span class="styBoldText" style="width:6mm;text-align:center;height:100%;">a</span>
								Routing number
								<span style="width:5px;"/>
							</div>
							<div class="styIRS9465LNDesc" style="width:40mm;height:auto;padding-left:0px;text-align:center;border-width:1px 1px 1px 1px;border-color:black;font-size:6pt;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form9465Data/RoutingTransitNum"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- (13b) ////////////////////////////////////////////////////-->
						<div class="styIRS9465LineItem">
							<div class="styIRS9465LNLeftNumBox" style="padding-right:0px;">
								<img src="{$ImagePath}/9465_Bullet_Sm.gif" alt="SmallBullet"/>
							</div>
							<div class="styIRS9465LNDesc" style="width:33mm;height:auto;padding-left:0px;">
								<span class="styBoldText" style="width:6mm;text-align:center;height:100%;">b</span>
								Account number
								<span style="width:5px;"/>
							</div>
							<div class="styIRS9465LNDesc" style="width:80mm;height:auto;padding-left:0px;text-align:center;border-width:1px 1px 1px 1px;border-color:black;font-size:6pt;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form9465Data/BankAccountNum"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styIRS9465LineItem">
							<div class="styIRS9465LNLeftNumBox"/>
							<div class="styIRS9465LNDesc" style="width:181mm;height:auto;font-size:8pt">
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
					<!-- (14) ////////////////////////////////////////////////////-->
					<div style="width:187mm;padding-bottom:1mm;padding-top:16mm">
						<div class="styIRS9465LNLeftNumBox">14</div>
						<div class="styIRS9465LNDesc" style="width:181mm;height:auto;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form9465Data/PayrollDeductionAgreementInd"/>
									<xsl:with-param name="BackupName">Form9465Data/PayrollDeductionAgreementInd</xsl:with-param>
								</xsl:call-template>If you want to make your payments by payroll deduction, check this box and attach a completed Form 2159, Payroll Deduction<br/>Agreement.
						</label>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-right:.35mm;">......................................</span>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form9465Data/PayrollDeductionAgreementInd"/>
									<xsl:with-param name="BackupName">Form9465Data/PayrollDeductionAgreementInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styIRS9465LineItem" style="height:auto;">
							<div class="styIRS9465LNDesc" style="width:39.9%;font-size:7pt;border-right-width:1px;border-color:black;height:9mm;padding-left:0px;">
								Your signature<br/>
								<span style="width:100%;padding-top:4px;">
									<xsl:call-template name="PopulatePin">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignaturePIN"/>
										<xsl:with-param name="BackupName">RtnHdrDataPrimarySignature</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div class="styIRS9465LNDesc" style="width:10%;font-size:7pt;border-right-width:1px;border-color:black;height:9mm;">
								Date<br/>
								<span style="width:100%;padding-top:4px;font-size:7pt;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignatureDt"/>
										<xsl:with-param name="BackupName">RtnHdrDataPrimarySignatureDate</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div class="styIRS9465LNDesc" style="width:40%;font-size:7pt;border-right-width:1px;border-color:black;height:9mm;">
								Spouse’s signature. If a joint return, <b>both</b> must sign.<br/>
								<span style="width:100%;padding-top:4px;">
									<xsl:call-template name="PopulatePin">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignaturePIN"/>
										<xsl:with-param name="BackupName">RtnHdrDataSpouseSignature</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div class="styIRS9465LNDesc" style="width:10%;font-size:7pt;border-color:black;height:9mm;">
								Date<br/>
								<span style="width:100%;padding-top:4px;font-size:7pt;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignatureDt"/>
										<xsl:with-param name="BackupName">RtnHdrDataSpouseSignatureDate</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
						</div>
					</div>
					<!-- Page Break-->
					<!-- Footer-->
					<span class="styBoldText">For Privacy Act and Paperwork Reduction Act Notice, see instructions. </span>
							<span style="width:80px;"/>                        
							Cat. No. 14842Y
					
					<div style="float:right;">
							<span style="width:75px;"/>  
							Form <span class="styBoldText" style="font-size:8pt;">9465</span> (Rev. 12-2013)
					</div>
				
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- page 2 -->					
				    <br/><br/>
					<!-- BEGIN Part II Title -->
					<div class="styTBB" style="width:187mm;padding-top:.5mm;">
						<span class="" style="float:left;clear:none;">Form 9465 (12-2013)</span>
						<span style="float:right;clear:none;">Page <span class="styBoldText" style="font-size:8pt;">2</span>
						</span>
					</div>
					<div class="styBB" style="width:187mm;height:10mm;">
						<div class="styPartName" style="font-size:9pt;">Part II</div>
						<div class="styPartDesc" style="font-weight: normal;float:left;">
							<b>Additional Information.</b> Complete this part only if you have defaulted on an installment agreement within the past 12 months and the amount you owe is greater than $25,000 but not more than $50,000 and the amount on line 10 is equal to or greater than the amount on line 11.  If you owe more than $50,000, complete and attach Form 433-F, Collection Information Statement.        
                      </div>
					</div>
					<!-- END Part II Title -->
					<!--  Line 15 -->
					<div style="width: 187mm;padding-top:2mm">
						<div class="styIRS9465LNLeftNumBox">15</div>
						<div class="styIRS9465LNDesc" style="width:60mm">In which county is your primary residence?</div>
						<div class="styUnderlineAmount" style="border-style:solid;border-color:black;border-width:1px 1px 1px 1px;height:4mm;width:120mm;
						padding-right:1mm;text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form9465Data/PrimaryResidenceCountyNm"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end Line 15 -->
					<!-- Line 16 -->
					<div style="width:187mm;height:15mm;">
						<br/>
						<div class="styIRS9465LNLeftNumBox" style="padding-right:0px;">16a</div>
						<div class="styIRS9465LNDesc" style="height:6mm">
							Marital Status:
							<br/>
							<span style="width:75mm;float:left;">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form9465Data/MaritalStatusSingleInd"/>
										<xsl:with-param name="BackupName">IRS9465MaritalStatusSingleInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="width:70mm;padding-left:2mm;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form9465Data/MaritalStatusSingleInd"/>
										<xsl:with-param name="BackupName">IRS9465MaritalStatusSingleInd</xsl:with-param>
									</xsl:call-template>
									Single. Skip question 16b and go to question 17.
								</label>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form9465Data/MaritalStatusMarriedInd"/>
										<xsl:with-param name="BackupName">IRS9465MaritalStatusMarriedInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="width:70mm;padding-left:2mm;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form9465Data/MaritalStatusMarriedInd"/>
										<xsl:with-param name="BackupName">IRS9465MaritalStatusMarriedInd</xsl:with-param>
									</xsl:call-template>
									Married. Go to question 16b.
								</label>
							</span>
						</div>
					</div>
					<div style="width:187mm;height:auto;padding-top:2mm;">
						<div class="styIRS9465LNLeftNumBox" style="padding-right:0px;">b</div>
						<div class="styIRS9465LNDesc" style="height:6mm">
							Do you share household expenses with your spouse?<br/>
							<span style="width:15mm;float:left;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form9465Data/ShareHouseholdExpnsWithSpsInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form9465Data/ShareHouseholdExpnsWithSpsInd"/>
										<xsl:with-param name="BackupName">IRS9465ShareHouseholdExpnsWithSpsInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="width:15mm;padding-left:2mm;">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form9465Data/ShareHouseholdExpnsWithSpsInd"/>
										<xsl:with-param name="BackupName">IRS9465ShareHouseholdExpnsWithSpsInd</xsl:with-param>
									</xsl:call-template>
									Yes.
								</label>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form9465Data/ShareHouseholdExpnsWithSpsInd"/>
										<xsl:with-param name="BackupName">IRS9465ShareHouseholdExpnsWithSpsInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="width:15mm;padding-left:2mm;">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form9465Data/ShareHouseholdExpnsWithSpsInd"/>
										<xsl:with-param name="BackupName">IRS9465ShareHouseholdExpnsWithSpsInd</xsl:with-param>
									</xsl:call-template>
									No.
								</label>
							</span>
						</div>
					</div>
					<!-- end Line 16 -->
					<!--  Line 17 -->
					<div style="width:187mm;height:auto;padding-top:8mm;">
						<div class="styIRS9465LNLeftNumBox">17</div>
						<div class="styIRS9465LNDesc" style="width:141mm;height:4mm;">How many dependents will you be able to claim on this year's tax return?
			 <!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:2.5mm;">.........</span>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox">17</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form9465Data/DependentsClaimedCnt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- end Line 17 -->
					<!--  Line 18 -->
					<div style="width: 187mm;height:auto;">
						<br/>
						<div class="styIRS9465LNLeftNumBox">18</div>
						<div class="styIRS9465LNDesc" style="width:141mm;height:4mm;">How many people in your household are 65 or older?
			 <!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:4mm;">...............</span>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox">18</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form9465Data/Age65OrOlderHouseholdCnt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- end Line 18 -->
					<!-- Line 19 -->
					<div style="width:187mm;height:25mm;padding-top:2mm;">
						<div class="styIRS9465LNLeftNumBox">19</div>
						<div class="styIRS9465LNDesc" style="height:4mm;">
							How often are you paid?<br/>
							<span style="width:40mm;float:left;">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form9465Data/PrimaryPdOnceAWeekInd"/>
										<xsl:with-param name="BackupName">IRS9465PrimaryPdOnceAWeekInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="width:25mm;padding-left:2mm;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form9465Data/PrimaryPdOnceAWeekInd"/>
										<xsl:with-param name="BackupName">IRS9465PrimaryPdOnceAWeekInd</xsl:with-param>
									</xsl:call-template>
									Once a week.
								</label>
								<br/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form9465Data/PrimaryPdOnceEveryTwoWeeksInd"/>
										<xsl:with-param name="BackupName">IRS9465PrimaryPdOnceEveryTwoWeeksInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="width:35mm;padding-left:2mm;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form9465Data/PrimaryPdOnceEveryTwoWeeksInd"/>
										<xsl:with-param name="BackupName">IRS9465PrimaryPdOnceEveryTwoWeeksInd</xsl:with-param>
									</xsl:call-template>
									Once every two weeks.
								</label>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form9465Data/PrimaryPdOnceAMonthInd"/>
										<xsl:with-param name="BackupName">IRS9465PrimaryPdOnceAMonthInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="width:25mm;padding-left:2mm;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form9465Data/PrimaryPdOnceAMonthInd"/>
										<xsl:with-param name="BackupName">IRS9465PrimaryPdOnceAMonthInd</xsl:with-param>
									</xsl:call-template>
									Once a month.
								</label>
								<br/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form9465Data/PrimaryPdTwiceAMonthInd"/>
										<xsl:with-param name="BackupName">IRS9465PrimaryPdTwiceAMonthInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="width:45mm;padding-left:2mm;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form9465Data/PrimaryPdTwiceAMonthInd"/>
										<xsl:with-param name="BackupName">IRS9465PrimaryPdTwiceAMonthInd</xsl:with-param>
									</xsl:call-template>
									Twice a month.
								</label>
							</span>
						</div>
					</div>
					<!-- end Line 19 -->
					<!--  Line 20-->
					<div style="width:187mm;height:auto;padding-top:2mm">
						<div class="styIRS9465LNLeftNumBox">20</div>
						<div class="styIRS9465LNDesc" style="width:141mm;height:auto;">What is your net income per pay period (take home pay)?
			 <!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:2.6mm">..............</span>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox">20</div>
							<div class="styLNAmountBox">
								<div class="styGenericDiv" style="padding-left:1mm;">$</div>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form9465Data/PrimaryNetIncomePerPayPrdAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- end Line 20 -->
					<!-- Line 21 -->
					<div style="width:187mm;height:25mm;padding-top:2mm;">
						<div class="styIRS9465LNLeftNumBox">21</div>
						<div class="styIRS9465LNDesc" style="height:auto;">
							How often is your spouse paid?<br/>
							<span style="width:40mm;float:left;">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form9465Data/SpousePdOnceAWeekInd"/>
										<xsl:with-param name="BackupName">IRS9465SpousePdOnceAWeekInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="width:25mm;padding-left:2mm;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form9465Data/SpousePdOnceAWeekInd"/>
										<xsl:with-param name="BackupName">IRS9465SpousePdOnceAWeekInd</xsl:with-param>
									</xsl:call-template>
									Once a week.
								</label>
								<br/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form9465Data/SpousePdOnceEveryTwoWeeksInd"/>
										<xsl:with-param name="BackupName">IRS9465SpousePdOnceEveryTwoWeeksInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="width:35mm;padding-left:2mm;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form9465Data/SpousePdOnceEveryTwoWeeksInd"/>
										<xsl:with-param name="BackupName">IRS9465SpousePdOnceEveryTwoWeeksInd</xsl:with-param>
									</xsl:call-template>
									Once every two weeks.
								</label>
								<br/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form9465Data/SpousePdOnceAMonthInd"/>
										<xsl:with-param name="BackupName">IRS9465SpousePdOnceAMonthInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="width:30mm;padding-left:2mm;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form9465Data/SpousePdOnceAMonthInd"/>
										<xsl:with-param name="BackupName">IRS9465SpousePdOnceAMonthInd</xsl:with-param>
									</xsl:call-template>
									Once a month.
								</label>
								<br/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form9465Data/SpousePdTwiceAMonthInd"/>
										<xsl:with-param name="BackupName">IRS9465SpousePdTwiceAMonthInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="width:30mm;padding-left:2mm;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form9465Data/SpousePdTwiceAMonthInd"/>
										<xsl:with-param name="BackupName">IRS9465SpousePdTwiceAMonthInd</xsl:with-param>
									</xsl:call-template>
									Twice a month.
								</label>
							</span>
						</div>
					</div>
					<!-- end Line 21 -->
					<!--  Line 22-->
					<div style="width: 187mm;height:auto;padding-top:2mm;">
						<div class="styIRS9465LNLeftNumBox">22</div>
						<div class="styIRS9465LNDesc" style="width:141mm;">What is your spouse's net income per pay period (take home pay)?
			 <!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:2.1mm;">...........</span>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox">22</div>
							<div class="styLNAmountBox">
								<div class="styGenericDiv" style="padding-left:1mm;">$</div>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form9465Data/SpouseNetIncomePerPayPrdAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- end Line 22 -->
					<!--  Line 23-->
					<div style="width: 187mm">
						<br/>
						<div class="styIRS9465LNLeftNumBox">23</div>
						<div class="styIRS9465LNDesc" style="width:141mm;">How many vehicles do you own?
			 <!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1.7mm;">......................</span>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox">23</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form9465Data/VehicleCnt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- end Line 23 -->
					<!--  Line 24-->
					<div style="width: 187mm">
						<br/>
						<div class="styIRS9465LNLeftNumBox">24</div>
						<div class="styIRS9465LNDesc" style="width:141mm;">How many car payments do you have each month?
			 <!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1.85mm;">................</span>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox">24</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form9465Data/CarPaymentCnt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- end Line 24 -->
					<!-- Line 25 -->
					<div style="width:187mm;height:auto;padding-top:2mm;">
						<div class="styIRS9465LNLeftNumBox" style="padding-right:0px;">25a</div>
						<div class="styIRS9465LNDesc" style="height:auto;">
							Do you have health insurance?<br/>
							<span style="width:75mm;float:left;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form9465Data/HealthInsuranceInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form9465Data/HealthInsuranceInd"/>
										<xsl:with-param name="BackupName">IRS9465HealthInsuranceInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="width:70mm;padding-left:2mm;">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form9465Data/HealthInsuranceInd"/>
										<xsl:with-param name="BackupName">IRS9465HealthInsuranceInd</xsl:with-param>
									</xsl:call-template>
									Yes. Go to question 25b.
								</label>
								<br/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form9465Data/HealthInsuranceInd"/>
										<xsl:with-param name="BackupName">IRS9465HealthInsuranceInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="width:70mm;padding-left:2mm;">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form9465Data/HealthInsuranceInd"/>
										<xsl:with-param name="BackupName">IRS9465HealthInsuranceInd</xsl:with-param>
									</xsl:call-template>
									No. Skip question 25b and go to question 26a.
								</label>
							</span>
						</div>
					</div>
					<div style="width:187mm;height:auto;">
						<div class="styIRS9465LNLeftNumBox" style="padding-right:0px;">b</div>
						<div class="styIRS9465LNDesc" style="height:auto;">
							Are your premiums deducted from your paycheck?<br/>
							<span style="width:75mm;float:left;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form9465Data/HealthInsurancePremiumDedInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form9465Data/HealthInsurancePremiumDedInd"/>
										<xsl:with-param name="BackupName">IRS9465HealthInsurancePremiumDedInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="width:70mm;padding-left:2mm;">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form9465Data/HealthInsurancePremiumDedInd"/>
										<xsl:with-param name="BackupName">IRS9465HealthInsurancePremiumDedInd</xsl:with-param>
									</xsl:call-template>
									Yes. Skip question 25c and go to question 26a.
								</label>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form9465Data/HealthInsurancePremiumDedInd"/>
										<xsl:with-param name="BackupName">IRS9465HealthInsurancePremiumDedInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="width:70mm;padding-left:2mm;">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form9465Data/HealthInsurancePremiumDedInd"/>
										<xsl:with-param name="BackupName">IRS9465HealthInsurancePremiumDedInd</xsl:with-param>
									</xsl:call-template>
									No. Go to question 25c.
								</label>
							</span>
						</div>
					</div>
					<div style="width:187mm;height:auto;">
						<div class="styIRS9465LNLeftNumBox" style="padding-right:0px;">c</div>
						<div class="styIRS9465LNDesc" style="width:141mm;height:auto;">
							 How much are your monthly premiums?	
                    		 <!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">....................</span>
						</div>
						<div class="styLNRightNumBox">25c</div>
						<div class="styLNAmountBox">
							<div class="styGenericDiv" style="padding-left:1mm;">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form9465Data/MthlyHealthInsurancePremiumAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end Line 25 -->
					<!-- Line 26 -->
					<div style="width:187mm;height:auto;padding-top:2mm;">
						<div class="styIRS9465LNLeftNumBox" style="padding-right:0px;">26a</div>
						<div class="styIRS9465LNDesc" style="height:auto;">
							Do you make court-ordered payments?<br/>
							<span style="width:45mm;float:left;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form9465Data/CourtOrderedPaymentInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form9465Data/CourtOrderedPaymentInd"/>
										<xsl:with-param name="BackupName">IRS9465CourtOrderedPaymentInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="width:30mm;padding-left:2mm;">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form9465Data/CourtOrderedPaymentInd"/>
										<xsl:with-param name="BackupName">IRS9465CourtOrderedPaymentInd</xsl:with-param>
									</xsl:call-template>
									Yes. Go to question 26b.
								</label>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form9465Data/CourtOrderedPaymentInd"/>
										<xsl:with-param name="BackupName">IRS9465CourtOrderedPaymentInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="width:30mm;padding-left:2mm;">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form9465Data/CourtOrderedPaymentInd"/>
										<xsl:with-param name="BackupName">IRS9465CourtOrderedPaymentInd</xsl:with-param>
									</xsl:call-template>
									No. Go to question 27.
								</label>
							</span>
						</div>
					</div>
					<div style="width:187mm;height:auto;">
						<div class="styIRS9465LNLeftNumBox" style="padding-right:0px;">b</div>
						<div class="styIRS9465LNDesc" style="height:auto;">							
							Are your court-ordered payments deducted from your paycheck?<br/>
							<span style="width:55mm;float:left;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form9465Data/CourtOrderedPaymentDedInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form9465Data/CourtOrderedPaymentDedInd"/>
										<xsl:with-param name="BackupName">IRS9465CourtOrderedPaymentDedInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="width:35mm;padding-left:2mm;">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form9465Data/CourtOrderedPaymentDedInd"/>
										<xsl:with-param name="BackupName">IRS9465CourtOrderedPaymentDedInd</xsl:with-param>
									</xsl:call-template>
									Yes. Go to question 27.
								</label>
								<br/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form9465Data/CourtOrderedPaymentDedInd"/>
										<xsl:with-param name="BackupName">IRS9465CourtOrderedPaymentDedInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="width:35mm;padding-left:2mm;">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form9465Data/CourtOrderedPaymentDedInd"/>
										<xsl:with-param name="BackupName">IRS9465CourtOrderedPaymentDedInd</xsl:with-param>
									</xsl:call-template>
									No. Go to question 26c.
								</label>
							</span>
						</div>
					</div>
					<div style="width:187mm;padding-bottom:2mm;height:auto;">
						<div class="styIRS9465LNLeftNumBox" style="padding-right:0px;">c</div>
						<div class="styIRS9465LNDesc" style="width:141mm;height:auto;">
							 How much are your court-ordered payments each month?	
                    		 <!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..............</span>
						</div>
						<div class="styLNRightNumBox">26c</div>
						<div class="styLNAmountBox">
							<div class="styGenericDiv" style="padding-left:1mm;">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form9465Data/MthlyCourtOrderedPaymentAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end Line 26 -->
					<!--  Line 27-->
					<div style="width:187mm;padding-bottom:4mm;height:auto;">
						<div class="styIRS9465LNLeftNumBox">27</div>
						<div class="styIRS9465LNDesc" style="width:141mm;height:auto;">

							  Not including any court-ordered payments for child and dependent support, how much do you pay for<br/> 
							 child or dependent care each month?
							 <!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:2.9mm;">....................</span>
						</div>
						<div class="styGenericDiv" style="width:38mm;padding-top:3mm;"/>
						<div class="styLNRightNumBox">27</div>
						<div class="styLNAmountBox">
							<div class="styGenericDiv" style="padding-left:1mm;">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form9465Data/ChildOrDependentCareExpenseAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end Line 27 -->
					<!-- Page Break-->
					<!-- Footer-->
					<div class="pageEnd" style="width:187mm;border-top:.5mm solid black">
						<div style="float:right;">
							<span style="width:75px;"/>  
							Form <span class="styBoldText" style="font-size:8pt;">9465</span> (Rev. 12-2013)
						</div>
					</div>
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
							<xsl:with-param name="Desc">Line 1a - Primary Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 1a - Spouse Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseNameControlTxt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
					</table>
					<xsl:if test="(count($Form9465Data/F9465TaxReturnTypeCd) &gt; 1)">
						<span class="styRepeatingDataTitle" style="text-align:center;">Form 9465 Tax Return Type Codes</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="1" style="width:91.5mm;text-align:left;">
                           Tax Return Type Codes
                        </th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$Form9465Data/F9465TaxReturnTypeCd">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:91.5mm;">
											<div style="width:6.5mm;" class="styLNDesc">
												<div style="width:6mm;font-weight:bold;float:right;clear:none;">
													<span class="styBoldText" style="float:right;text-align:right;padding-right:2mm;">
														<xsl:value-of select="position()"/>
													</span>
												</div>
											</div>
											<div style="width:80mm;float:none;clear:none;">
												<xsl:variable name="pos" select="position()"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form9465Data/F9465TaxReturnTypeCd[$pos]"/>
													<xsl:with-param name="BackupName">Form9465Data/F9465TaxReturnTypeCd</xsl:with-param>
												</xsl:call-template>
											</div>
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
